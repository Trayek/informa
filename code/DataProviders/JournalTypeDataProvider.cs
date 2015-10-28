using System.Collections.Generic;
using ms8.code.Models;
using ms8.code.Repositories;
using Sitecore.Data;
using Sitecore.Data.Templates;

namespace ms8.code.DataProviders
{
    public class JournalTypeDataProvider : DataProviderBase<JournalType>
    {
        public JournalTypeDataProvider(string targetDatabaseName, string rootTemplateId, string itemTemplateId, string idTablePrefix , string rootItemId) 
            : base(targetDatabaseName, rootTemplateId, itemTemplateId, idTablePrefix, rootItemId)
        {
        }

        
        protected override IEnumerable<JournalType> LoadExternalItems()
        {
            return new JournalRepository().GetJournalTypesFromJson();
        }
       
        protected override string GetFieldValue(TemplateField field, JournalType externalItem)
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
