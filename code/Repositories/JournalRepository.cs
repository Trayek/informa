using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using ms8.code.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace ms8.code.Repositories
{
    internal class JournalRepository
    {
        public IEnumerable<Journal> GetJournals()
        {
            var journals = new List<Journal>()
            {
                new Journal
                {
                    ParentId = null,
                    Id = "1001",
                    Name = "Falcon 9",
                    Title = "The Falcon 9",
                    Description = "Falcon 9 is ....",
                    Categories = new[] {"123","456"},
                    Types = new[] { "Type1","type2" }
                },
                new Journal
                {
                    ParentId = null,
                    Id = "1002",
                    Name = "Titan",
                    Title = "The Titan Rocket",
                    Description = "Titan was ....",
                    Categories = new[] {"123"},
                    Types = new[] { "Type1", "Type3"}
                }
            };

            return journals;
        }

        public IEnumerable<Category> GetCategoriesFromJson()
        {
            return GetJournals().SelectMany(a => a.Categories).Distinct().Select(b => new Category {Id = b, Name = b});
        }

        public IEnumerable<JournalType> GetJournalTypesFromJson()
        {
            return GetJournals().SelectMany(a => a.Types).Distinct().Select(b => new JournalType() { Id = b, Name = b });
        }
    }
}