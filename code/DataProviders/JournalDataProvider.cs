using System;
using System.Collections.Generic;
using ms8.code.Models;
using ms8.code.Repositories;
using Sitecore.Data;
using Sitecore.Data.Templates;

namespace ms8.code.DataProviders
{
    public class JournalDataProvider : DataProviderBase<Journal>
    {
        public JournalDataProvider(string targetDatabaseName, string rootTemplateId, string itemTemplateId, string idTablePrefix, string rootItemId) 
            : base(targetDatabaseName, rootTemplateId, itemTemplateId, idTablePrefix, rootItemId)
        {
        }
       
        protected override IEnumerable<Journal> LoadExternalItems()
        {
            return new JournalRepository().GetJournals();
        }
      
        protected override string GetFieldValue(TemplateField field, Journal externalItem)
        {
            string fieldValue = string.Empty;

            switch (field.Name)
            {
                case "Title":
                    fieldValue = externalItem.Title;
                    break;
                case "Description":
                    fieldValue = externalItem.Description??"";
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
                    fieldValue = externalItem.PublicationDate.ToString();
                    break;
                case "Categories":
                    fieldValue = FindRelated(externalItem.Categories, "Categories");
                    break;
                case "Journal Types":
                    fieldValue = FindRelated(externalItem.Types, "JournalTypes");
                    break;
                default:
                    break;
            }

            return fieldValue;
        }
    }
}
