using System;
using System.Collections.Generic;
using System.Linq;
using ms8.code.Models;
using ms8.code.Repositories;
using Sitecore.Collections;
using Sitecore.Data;
using Sitecore.Data.IDTables;
using Sitecore.Data.Items;
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
            return new SimpleChildrenNesting().Children(parentItem, IdTablePrefix, ExternalItems, RootItemId, InMemoryIdTable);
        }

        protected override Guid GenerateId(Journal externalItem)
        {
            string fullValue = externalItem.ISBN;

            while (fullValue.Length < 32)
            {
                fullValue = fullValue + "0";
            }

            return Guid.Parse(fullValue);
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
                    fieldValue = externalItem.Description ?? "";
                    break;
                case "ISBN":
                    fieldValue = externalItem.ISBN;
                    break;
                case "Publisher Description":
                    fieldValue = externalItem.PublisherDescription;
                    break;
                case "Subtitle":
                    fieldValue = externalItem.Subtitle;
                    break;
                case "Series Description":
                    fieldValue = externalItem.SeriesDescription;
                    break;
                case "Table Of Content":
                    fieldValue = externalItem.TableOfContents;
                    break;
                case "Subject Group":
                    fieldValue = externalItem.SubjectGroup;
                    break;
                case "Edition":
                    fieldValue = externalItem.Edition;
                    break;
                case "Pages":
                    fieldValue = externalItem.TotalPages;
                    break;
                case "Print Format":
                    fieldValue = externalItem.PrintFormat;
                    break;
                case "Publication Date":
                    fieldValue = externalItem?.PublicationDate.ToString("dd/MM/yyyy");
                    break;
                case "Categories":
                    fieldValue = FindRelated(externalItem?.Categories, "Categories");
                    break;
                case "Journal Types":
                    fieldValue = FindRelated(externalItem?.Types, "JournalTypes");
                    break;
                case "Enriched Image":
                    fieldValue = externalItem.EnrichedImage;
                    break;

                default:
                    break;
            }

            return fieldValue ?? "";
        }

        protected override bool ShouldApplyChangeToDataStore(FieldChange change)
        {
            if (change.Definition != null && change.Definition.Name == "Enriched Image")
            {
                return true;
            }

            return false;
        }
        
        protected override void SaveChangeToDataStore(FieldChange change, string key)
        {
            new JournalRepository().SaveChange(change.Definition.Name, change.Value, key);
        }
    }
}
