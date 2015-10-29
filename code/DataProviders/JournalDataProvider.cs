using System;
using System.Collections.Generic;
using System.Linq;
using ms8.code.Models;
using ms8.code.Repositories;
using Sitecore.Collections;
using Sitecore.Data;
using Sitecore.Data.IDTables;
using Sitecore.Data.Templates;

namespace ms8.code.DataProviders
{
    public class JournalDataProvider : DataProviderBase<Journal>
    {
        public JournalDataProvider(string targetDatabaseName, string rootTemplateId, string itemTemplateId, string idTablePrefix, string rootItemId) 
            : base(targetDatabaseName, rootTemplateId, itemTemplateId, idTablePrefix, rootItemId)
        {
        }
       
        protected override Journal[] LoadExternalItems()
        {
            return new JournalRepository().GetJournals();
        }

        protected override IEnumerable<Journal> LoadChildren(ItemDefinition parentItem)
        {
            var idTableEntries = IDTable.GetKeys(IdTablePrefix, parentItem.ID);

            if (parentItem.ID == RootItemId)
            {
                return ExternalItems.Where(a => a.ParentId == null);
            }
           
            if (idTableEntries.Any())
            {
                var parentKey = idTableEntries.FirstOrDefault();

                //Log.Info("JOURNAL " + parentKey.Key + " " + String.Join(",", ExternalItems.Select(a => a.ParentId)), this);

                return ExternalItems.Where(a => a.ParentId == parentKey.Key);
            }

            return new Journal[0];

            //   return new SimpleChildrenNesting().Children(parentItem, IdTablePrefix, ExternalItems, RootItemId);
        }

        protected override string GetFieldValue(TemplateField field, Journal externalItem)
        {
            string fieldValue = string.Empty;

            try
            {
                switch (field.Name)
                {
                    case "Title":
                        fieldValue = externalItem.Title;
                        break;
                    case "Description":
                        fieldValue = externalItem.Description ?? "";
                        break;
                    case "ISBN":
                        fieldValue = externalItem.ISBN;
                        break;
                    case "Publisher Description":
                        fieldValue = externalItem.PublisherDescription;
                        break;
                    case "Subject Group":
                        fieldValue = externalItem.SubjectGroup;
                        break;
                    case "Publication Date":
                        fieldValue = externalItem?.PublicationDate.ToString();
                        break;
                    case "Categories":
                        fieldValue = FindRelated(externalItem?.Categories, "Categories");
                        break;
                    case "Journal Types":
                        fieldValue = FindRelated(externalItem?.Types, "JournalTypes");
                        break;
                    default:
                        break;
                }
            }
            catch (Exception e)
            {
                
            }
            

            return fieldValue;
        }
    }
}
