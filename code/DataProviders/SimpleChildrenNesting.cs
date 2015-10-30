using System.Collections.Generic;
using System.Linq;
using ms8.code.Models;
using Sitecore.Data;
using Sitecore.Data.IDTables;

namespace ms8.code.DataProviders
{
    public class SimpleChildrenNesting
    {
        public IEnumerable<T> Children<T>(ItemDefinition parentItem, string idTablePrefix, IEnumerable<T> externalItems, ID rootItemId, InMemoryIdTable inMemoryIdTable) 
            where T : StructuredItem, new()
        {
            var idTableEntries = inMemoryIdTable.GetKeys(idTablePrefix, parentItem.ID);

            if (parentItem.ID == rootItemId)
            {
                return externalItems.Where(a => a.ParentId == null);
            }

            if (idTableEntries.Any())
            {
                var parentKey = idTableEntries.FirstOrDefault();

                return externalItems.Where(a => a.ParentId == parentKey.Key);
            }

            return new T[0];
        }
    }
}