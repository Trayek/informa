using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Sitecore.Data;
using Sitecore.Data.IDTables;

namespace ms8.code.DataProviders
{
    public class InMemoryIDTableProvider : IDTableProvider
    {
        public static Dictionary<IdTableStringKey, IDTableEntry> _idByKey;
        public static Dictionary<IdTableIdKey, List<IDTableEntry>> _idById;

        static readonly object _lock = new object();

        public InMemoryIDTableProvider(string connectionString, string cacheSize)
        {
            if (_idByKey == null && _idById == null)
            {
                lock (_lock)
                {
                    if (_idByKey == null && _idById == null)
                    {
                        _idById = new Dictionary<IdTableIdKey, List<IDTableEntry>>();
                        _idByKey = new Dictionary<IdTableStringKey, IDTableEntry>();
                    }
                }
            }
        }

        public override void Add(IDTableEntry entry)
        {
            var idTableStringKey = new IdTableStringKey(entry.Prefix, entry.Key);

            if (!_idByKey.ContainsKey(idTableStringKey))
            {
                _idByKey[idTableStringKey] = entry;
            }

            var key = new IdTableIdKey(entry.Prefix, entry.ID.Guid);

            if (!_idById.ContainsKey(key))
            {
                _idById.Add(key, new List<IDTableEntry> {entry});
            }
        }

        public override IDTableEntry GetID(string prefix, string key)
        {
            var idTableStringKey = new IdTableStringKey(prefix, key);

            if (_idByKey.ContainsKey(idTableStringKey))
            {
                return _idByKey[idTableStringKey];
            }

            return null;
        }

        public override IDTableEntry[] GetKeys(string prefix, ID id)
        {
            var key = new IdTableIdKey(prefix, id.Guid);

            if (_idById.ContainsKey(key))
            {
                return _idById[key].ToArray();
            }

            return new IDTableEntry[0];
        }

        public override void Remove(string prefix, string key)
        {
            var idTableStringKey = new IdTableStringKey(prefix, key);

            _idByKey.Remove(idTableStringKey);
        }
    }
}