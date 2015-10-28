using System.Collections.Generic;
using ms8.code.Models;
using ms8.code.Repositories;
using Sitecore.Data.Templates;

namespace ms8.code.DataProviders
{
    class CategoryDataProvider : DataProviderBase<Category>
    {
        public CategoryDataProvider(string targetDatabaseName, string rootTemplateId, string itemTemplateId, string idTablePrefix) : base(targetDatabaseName, rootTemplateId, itemTemplateId, idTablePrefix)
        {
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
