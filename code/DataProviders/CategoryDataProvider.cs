using System.Collections.Generic;
using System.Linq;
using ms8.code.Models;
using ms8.code.Repositories;
using Sitecore.Data;
using Sitecore.Data.IDTables;
using Sitecore.Data.Templates;

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
            var idTableEntries = IDTable.GetKeys(IdTablePrefix, parentItem.ID);

            if (parentItem.ID == RootItemId)
            {
                return ExternalItems.Where(a => a.ParentId == null);
            }
            else if (idTableEntries.Any())
            {
                var parentKey = idTableEntries.FirstOrDefault();

                return ExternalItems.Where(a => a.ParentId == parentKey.Key);
            }

            return new Category[0];
        }

        protected override IEnumerable<Category> LoadExternalItems()
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
