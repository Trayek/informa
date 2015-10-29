using System;
using System.Collections.Generic;
using System.Linq;
using ms8.code.Models;
using MongoDB.Bson;
using MongoDB.Bson.Serialization;
using MongoDB.Driver;
using ConfigurationManager = System.Configuration.ConfigurationManager;

namespace ms8.code.Repositories
{
    internal class JournalRepository
    {
        private int _journalFolderDepth = 12;
        private string _journalFolderNumbers = "0123456789";
        private static Journal[] Journals;

        public Journal[] GetJournals()
        {
            var journals = new List<Journal>();

            journals.Clear();
            journals.AddRange(GetJournalsFromMongo());

            return journals.ToArray();
        }

        private Journal[] GetJournalsFromMongo()
        {
            if (Journals == null)
            {
                var connectionString = ConfigurationManager.ConnectionStrings["ServiceExport"].ConnectionString;

                string serverName = connectionString.Substring(0, connectionString.LastIndexOf("/"));

                string dbName = connectionString.Substring(connectionString.LastIndexOf("/") + 1);

                var client = new MongoClient(serverName);

                var server = client.GetServer();

                var db = server.GetDatabase(dbName);

                MongoCollection<IsbnDocument> documents = db.GetCollection<IsbnDocument>("IsbnDocuments");

                MongoCursor<BsonDocument> cursor = documents.FindAllAs<BsonDocument>();

                List<IsbnDocument> results = new List<IsbnDocument>();

                List<string> keys = new List<string>();

                foreach (var result in cursor
                    //.Take(500)
                    )
                {
                    var document = BuildResult(result); 

                    if (document != null)
                    {
                        results.Add(document);
                        keys.Add(document.Isbn);
                    }
                }

                Journals = MapResults(results, _journalFolderDepth - 1)
                    .Union(InjectLayers(keys))
                    .ToArray();
            }

            return Journals;
        }

        private IsbnDocument BuildResult(BsonDocument result)
        {
            try
            {
                return BsonSerializer.Deserialize<IsbnDocument>(result);
            }
            catch (Exception)
            {
                return null;
            }
        }

        private IEnumerable<Journal> InjectLayers(List<string> keys)
        {
            SortedSet<string> itemSet = new SortedSet<string>();

            foreach (string item in keys)
            {
                for (int i = 1; i < _journalFolderDepth; i++)
                {
                    string value = item.Substring(0, i);

                    if (!itemSet.Contains(value))
                    {
                        itemSet.Add(value);
                    }
                }
            }

            foreach (string item in itemSet)
            {
                yield return new Journal {IsFolder = true, Depth = item.Length - 1, Id = item, Name = item};
            }
        }
       
        private IEnumerable<Journal> MapResults(IEnumerable<IsbnDocument> results, int folderDepth)
        {
            foreach (var isbnDocument in results)
            {
                var content = isbnDocument.Content.Return;

                if (content != null && !String.IsNullOrWhiteSpace(isbnDocument.Isbn))
                {
                    yield return new Journal
                    {
                        Id = isbnDocument.Isbn,
                        ISBN = isbnDocument.Isbn,
                        Types = content.MetaTags?.Split(' '),
                        Categories = content.Categories?.Select(a => a.Title).ToArray(),
                        Title = content.Name,
                        Description = content.TableOfContent,
                        Name = content.Name,
                        PublicationDate = content.PublicationDate,
                        PublisherDescription = "",
                        SubjectGroup = content.SubjectGroup?.Description,
                        TableOfContents = content.TableOfContent,
                        Depth = folderDepth
                    };
                }
            }
        }

        private static Category[] Categories;
        private static JournalType[] JournalTypes;

        public Category[] GetCategoriesFromJson()
        {
            if (Categories == null)
            {
                Categories =
                    GetJournals()
                        .SelectMany(a => a.Categories)
                        .Distinct()
                        .Select(b => new Category {Id = b, Name = b, Depth = 1})
                        .Union(InjectLetters<Category>()).ToArray();
            }

            return Categories;
        }

        public JournalType[] GetJournalTypesFromJson()
        {
            if (JournalTypes == null)
            {
                JournalTypes = GetJournals()
                    .SelectMany(a => a.Types)
                    .Distinct()
                    .Select(b => new JournalType() {Id = b, Name = b, Depth = 1})
                    .Union(InjectLetters<JournalType>()).ToArray();
            }

            return JournalTypes;
        }

        private IEnumerable<T> InjectLetters<T>() where T : StructuredItem, IHasName, new()
        {
            foreach (char letter in "abcdefghijklmnopqrstuvwxyz0123456789")
            {
                yield return new T {Id = letter.ToString(), Name = letter.ToString(), IsFolder = true, Depth = 0};
            }
        }
    }
}