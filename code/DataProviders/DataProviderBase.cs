using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using ms8.code.Models;
using Sitecore.Caching;
using Sitecore.Collections;
using Sitecore.Configuration;
using Sitecore.Data;
using Sitecore.Data.DataProviders;
using Sitecore.Data.IDTables;
using Sitecore.Data.Items;
using Sitecore.Data.Managers;
using Sitecore.Data.Templates;
using Sitecore.Diagnostics;
using Sitecore.Globalization;
using Sitecore.Reflection;

namespace ms8.code.DataProviders
{
    public abstract class DataProviderBase<T> : DataProvider where T:IHasId, IHasName, IFolder
    {
        //protected ID FolderTemplateId => ID.Parse("{A87A00B1-E6DB-45AB-8B54-636FEC3B5523}");

        protected readonly string TargetDatabaseName;
        protected readonly string IdTablePrefix;
        protected readonly ID ItemTemplateId;
        protected readonly ID RootTemplateId;
        protected readonly ID RootItemId;

        protected readonly IEnumerable<T> ExternalItems;

        protected DataProviderBase(string targetDatabaseName, string rootTemplateId, string itemTemplateId,
            string idTablePrefix, string rootItemId)
        {
            Assert.ArgumentNotNullOrEmpty(targetDatabaseName, "targetDatabaseName");
            Assert.ArgumentNotNullOrEmpty(rootTemplateId, "rootTemplateId");
            Assert.ArgumentNotNullOrEmpty(itemTemplateId, "itemTemplateId");
            Assert.ArgumentNotNullOrEmpty(idTablePrefix, "idTablePrefix");
           
            TargetDatabaseName = targetDatabaseName;
            IdTablePrefix = idTablePrefix;

            if (!ID.TryParse(rootTemplateId, out RootTemplateId))
            {
                throw new InvalidOperationException(string.Format("Invalid root template ID {0}", rootTemplateId));
            }

            if (!ID.TryParse(itemTemplateId, out ItemTemplateId))
            {
                throw new InvalidOperationException(string.Format("Invalid template ID {0}", itemTemplateId));
            }

            if (!ID.TryParse(rootItemId, out RootItemId))
            {
                throw new InvalidOperationException(string.Format("Invalid rootItem ID {0}", rootItemId));
            }

            ExternalItems = LoadExternalItems();
        }

        protected abstract string GetFieldValue(TemplateField field, T externalItem);

        protected abstract IEnumerable<T> LoadExternalItems();

        public override ID GetRootID(CallContext context)
        {
            return RootItemId;
        }

        public override bool MoveItem(ItemDefinition itemDefinition, ItemDefinition destination, CallContext context)
        {
            if (CanProcessItem(itemDefinition.ID))
            {
                context.Abort();

                string externalItemId = GetExternalItemIdFromIdTable(itemDefinition.ID);

                IDTable.RemoveID(IdTablePrefix, itemDefinition.ID);

                IDTable.Add(IdTablePrefix, externalItemId, itemDefinition.ID, destination.ID);
            }

            return base.MoveItem(itemDefinition, destination, context);
        }

        public override ItemDefinition GetItemDefinition(ID itemId, CallContext context)
        {
            Assert.ArgumentNotNull(itemId, "itemID");

            var journalId = GetExternalItemIdFromIdTable(itemId);

            if (!string.IsNullOrEmpty(journalId))
            {
                var journal = ExternalItems.FirstOrDefault(o => o.Id == journalId);

                if (journal != null)
                {
                    var itemName = ItemUtil.ProposeValidItemName(journal.Name);

                    return new ItemDefinition(itemId, itemName,
                        (journal.IsFolder ? RootTemplateId : ItemTemplateId),
                        //ItemTemplateId,
                        ID.Null);
                }
            }

            return null;
        }

        public override LanguageCollection GetLanguages(CallContext context)
        {
            return null;
        }

        private string GetExternalItemIdFromIdTable(ID itemId)
        {
            var idTableEntries = IDTable.GetKeys(IdTablePrefix, itemId);

            if (idTableEntries.Any())
                return idTableEntries[0].Key;

            return null;
        }

        public override IDList GetChildIDs(ItemDefinition parentItem, CallContext context)
        {
            if (CanProcessParent(parentItem.ID))
            {
                //aborting here means you don't see the crap in the tree - faux buckets :)
                context.Abort();

                var itemIdList = new IDList();

                foreach (var externalItem in LoadChildren(parentItem))
                {
                    var externalItemId = externalItem.Id;

                    IDTableEntry mappedId = IDTable.GetID(IdTablePrefix, externalItemId);

                    if (mappedId == null)
                    {
                        mappedId = IDTable.GetNewID(IdTablePrefix, externalItemId, parentItem.ID);
                    }

                    itemIdList.Add(mappedId.ID);
                }

                context.DataManager.Database.Caches.DataCache.Clear();

                return itemIdList;
            }

            return base.GetChildIDs(parentItem, context);
        }

        protected virtual IEnumerable<T> LoadChildren(ItemDefinition parentItem)
        {
            if (parentItem.ID == RootItemId)
            {
                Log.Info("RootDataProvider LoadChildren: " + parentItem.Key + " " + String.Join(",", ExternalItems.Select(a => a.ParentId)), this);

                return ExternalItems.Where(a => a.ParentId == null);
            }

            return new T[0];
        }

        private bool CanProcessParent(ID id)
        {
            var item = Factory.GetDatabase(TargetDatabaseName).Items[id];

            bool canProcess = item.Paths.IsContentItem && (
                item.TemplateID == RootTemplateId 
                || item.TemplateID == ItemTemplateId 
                //|| item.TemplateID == FolderTemplateId
                );

            return canProcess;
        }

        public override ID GetParentID(ItemDefinition itemDefinition, CallContext context)
        {
            var idTableEntries = IDTable.GetKeys(IdTablePrefix, itemDefinition.ID);

            if (idTableEntries.Any())
            {
                return idTableEntries.First().ParentID;
            }

            return base.GetParentID(itemDefinition, context);
        }

        public override FieldList GetItemFields(ItemDefinition itemDefinition, VersionUri version, CallContext context)
        {
            var fields = new FieldList();

            var idTableEntries = IDTable.GetKeys(IdTablePrefix, itemDefinition.ID);

            if (idTableEntries.Any())
            {
                if (context.DataManager.DataSource.ItemExists(itemDefinition.ID))
                {
                    ReflectionUtil.CallMethod(typeof(ItemCache),
                        CacheManager.GetItemCache(context.DataManager.Database), "RemoveItem", true, true,
                        new object[] { itemDefinition.ID });
                }

                var template = TemplateManager.GetTemplate(ItemTemplateId, Factory.GetDatabase(TargetDatabaseName));

                if (template != null)
                {
                    var journalId = GetExternalItemIdFromIdTable(itemDefinition.ID);

                    if (!string.IsNullOrEmpty(journalId))
                    {
                        var journal = ExternalItems.FirstOrDefault(o => o.Id == journalId);

                        if (journal != null)
                        {
                            foreach (var field in GetDataFields(template))
                            {
                                fields.Add(field.ID, GetFieldValue(field, journal));
                            }
                        }
                    }
                }
            }

            return fields;
        }

        protected virtual IEnumerable<TemplateField> GetDataFields(Template template)
        {
            return template.GetFields().Where(ItemUtil.IsDataField);
        }

        public override VersionUriList GetItemVersions(ItemDefinition item, CallContext context)
        {
            if (CanProcessItem(item.ID))
            {
                VersionUriList versions = new VersionUriList();

                // Just a little hack
                versions.Add(Language.Current, Sitecore.Data.Version.First);

                context.Abort();

                return versions;
            }

            return base.GetItemVersions(item, context);
        }

        private bool CanProcessItem(ID id)
        {
            if (IDTable.GetKeys(IdTablePrefix, id).Length > 0)
            {
                return true;
            }
            return false;
        }

        protected string FindRelated(IEnumerable<string> values, string idTableKey)
        {
            List<Guid> itemGuids = values.Select(a => FindIdTableGuid(a, idTableKey)).ToList();

            return String.Join("|", itemGuids.Where(a => a != Guid.Empty).Select(a => a.ToString("B").ToUpper()));
        }

        private Guid FindIdTableGuid(string value, string idTableKey)
        {
            IDTableEntry idTableEntry = IDTable.GetID(idTableKey, value);

            if (idTableEntry == null)
            {
                return Guid.Empty;
            }

            return idTableEntry.ID.Guid;
        }
    }
}