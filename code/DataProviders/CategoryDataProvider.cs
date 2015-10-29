using System;
using System.Collections.Generic;
using System.Linq;
using ms8.code.Models;
using ms8.code.Repositories;
using Sitecore.Data;
using Sitecore.Data.IDTables;
using Sitecore.Data.Templates;
using Sitecore.Diagnostics;

namespace ms8.code.DataProviders
{
    public class CategoryDataProvider : DataProviderBase<Category>
    {
        public CategoryDataProvider(string targetDatabaseName, string rootTemplateId, string itemTemplateId, string idTablePrefix, string rootItemId) 
            : base(targetDatabaseName, rootTemplateId, itemTemplateId, idTablePrefix, rootItemId)
        {
            
        }

        protected override IEnumerable<Category> LoadChildren(ItemDefinition parentItem)
        {
            return new SimpleChildrenNesting().Children(parentItem, IdTablePrefix, ExternalItems, RootItemId);
        }

        protected override Category[] LoadExternalItems()
        {
            return new JournalRepository().GetCategoriesFromJson();
        }

        protected override string GetFieldValue(TemplateField field, Category externalItem)
        {
            string fieldValue = string.Empty;

            switch (field.Name)
            {
                case "Title":
                    fieldValue = externalItem.Name;
                    break;
                default:
                    break;
            }

            return fieldValue;
        }
    }
}
