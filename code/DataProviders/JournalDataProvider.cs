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
            return new SimpleChildrenNesting().Children(parentItem, IdTablePrefix, ExternalItems, RootItemId, InMemoryIdTable);
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
