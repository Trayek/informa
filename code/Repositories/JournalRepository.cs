using System;
using System.Collections.Generic;
using System.Linq;
using ms8.code.Models;
using MongoDB.Driver;
using Sitecore.Form.Core.Configuration;
using ConfigurationManager = System.Configuration.ConfigurationManager;

namespace ms8.code.Repositories
{
    internal class JournalRepository
    {
        public IEnumerable<Journal> GetJournals()
        {
            var journals = new List<Journal>();

            journals.Clear();
            journals.AddRange(GetJournalsFromMongo());

            return journals;
        }

        private IEnumerable<Journal> GetJournalsFromMongo()
        {
            var connectionString = ConfigurationManager.ConnectionStrings["ServiceExport"].ConnectionString;

            string serverName = connectionString.Substring(0, connectionString.LastIndexOf("/"));

            string dbName = connectionString.Substring(connectionString.LastIndexOf("/") + 1);

            var client = new MongoClient(serverName);

            var server = client.GetServer();

            var db = server.GetDatabase(dbName);

            MongoCollection<IsbnDocument> documents = db.GetCollection<IsbnDocument>("IsbnDocuments");

            var results = documents.FindAll().Take(5);

            return MapResults(results);
        }

        private IEnumerable<Journal> MapResults(IEnumerable<IsbnDocument> results)
        {
            foreach (var isbnDocument in results)
            {
                var content = isbnDocument.Content.Return;

                yield return new Journal
                {
                    Id = isbnDocument.Isbn,
                    ISBN = isbnDocument.Isbn,
                    Types = content.MetaTags.Split(' '),
                    Categories = content.Categories.Select(a=>a.Title).ToArray(),
                    Title = content.Name,
                    Description = content.TableOfContent,
                    Name = content.Name,
                    PublicationDate = content.PublicationDate,
                    PublisherDescription = "",
                    SubjectGroup = content.SubjectGroup.Description,
                    TableOfContents = content.TableOfContent,
                };
            }
        }

        public IEnumerable<Category> GetCategoriesFromJson()
        {
            return GetJournals().SelectMany(a => a.Categories).Distinct().Select(b => new Category {Id = b, Name = b})
                .Union(InjectLetters());
        }

        private IEnumerable<Category> InjectLetters()
        {
            foreach (char letter in "abcdefghijklmnopqrstuvwxyz")
            {
                yield return new Category {Id = letter.ToString(), Name = letter.ToString(), IsFolder = true};
            }
        }

        public IEnumerable<JournalType> GetJournalTypesFromJson()
        {
            return GetJournals().SelectMany(a => a.Types).Distinct().Select(b => new JournalType() { Id = b, Name = b });
        }
    }
}