using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using Sitecore.Data;
using Sitecore.Data.IDTables;

namespace ms8.code.DataProviders
{
    public class InMemoryIdTable
    {
        private readonly string _databaseConnectionStringName;
        private static Dictionary<IdTableStringKey, IDTableEntry> _idByKey;
        private static Dictionary<IdTableIdKey, List<IDTableEntry>> _idById;

        static readonly object _object = new object();

        public InMemoryIdTable(string databaseConnectionStringName)
        {
            _databaseConnectionStringName = databaseConnectionStringName;
            //fill from db
            if (_idByKey == null && _idById == null)
            {
                lock (_object)
                {
                    if (_idByKey == null && _idById == null)
                    {
                        LoadDictionaries();
                    }
                }
            }
        }

        private void LoadDictionaries()
        {
            string sql = "SELECT [ID],[Prefix],[Key],[ParentID] FROM IDTable";
            string connectionString =
                ConfigurationManager.ConnectionStrings[_databaseConnectionStringName].ConnectionString;

            List<IDTableEntry> idTableEntries = new List<IDTableEntry>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            idTableEntries.Add(
                                new IDTableEntry(
                                    reader.GetString(1),
                                    reader.GetString(2),
                                    ID.Parse(reader.GetGuid(0)),
                                    ID.Parse(reader.GetGuid(3)),
                                    ""
                                    ));
                        }
                    }
                }
            }

            _idByKey = new Dictionary<IdTableStringKey, IDTableEntry>();

            _idById = new Dictionary<IdTableIdKey, List<IDTableEntry>>();

            foreach (IDTableEntry entry in idTableEntries)
            {
                IdTableStringKey idTableStringKey = new IdTableStringKey(entry.Prefix, entry.Key);

                if (!_idByKey.ContainsKey(idTableStringKey))
                {
                    _idByKey.Add(idTableStringKey, entry);
                }

                IdTableIdKey idTableIdKey = new IdTableIdKey(entry.Prefix, entry.ID.Guid);

                if (!_idById.ContainsKey(idTableIdKey))
                {
                    _idById.Add(idTableIdKey, new List<IDTableEntry> { entry });
                }
                else
                {
                    _idById[idTableIdKey].Add(entry);
                }
            }
        }

        public IDTableEntry GetID(string prefix, string key)
        {
            var idTableStringKey = new IdTableStringKey(prefix, key);

            if (_idByKey.ContainsKey(idTableStringKey))
            {
                return _idByKey[idTableStringKey];
            }

            _idByKey[idTableStringKey] = IDTable.GetID(prefix, key);

            return _idByKey[idTableStringKey];
        }

        public IDTableEntry[] GetKeys(string prefix, ID id)
        {
            var key = new IdTableIdKey(prefix, id.Guid);

            if (_idById.ContainsKey(key))
            {
                return _idById[key].ToArray();
            }

            _idById[key] = IDTable.GetKeys(prefix, id).ToList();

            if (_idById.ContainsKey(key))
            {
                return _idById[key].ToArray();
            }

            return new IDTableEntry[0];
        }

        public void RemoveID(string prefix, ID id)
        {
            var key = new IdTableIdKey(prefix, id.Guid);

            if (_idById.ContainsKey(key))
            {
                _idById.Remove(key);
            }

            IDTable.RemoveID(prefix, id);
        }

        internal void Add(string prefix, string key, ID id, ID parentId)
        {
            var idTableIdKey = new IdTableIdKey(prefix, id.Guid);

            var tableEntry = new IDTableEntry(prefix, key, id, parentId, "");

            if (!_idById.ContainsKey(idTableIdKey))
            {
                _idById.Add(idTableIdKey, new List<IDTableEntry> { tableEntry });
            }

            var idTableStringKey = new IdTableStringKey(prefix, key);

            if (!_idByKey.ContainsKey(idTableStringKey))
            {
                _idByKey[idTableStringKey] = tableEntry;
            }

            IDTable.Add(prefix, key, id, parentId);
        }

        public IDTableEntry GetNewID(string prefix, string key, ID parentId)
        {
            IDTableEntry newId = IDTable.GetNewID(prefix, key, parentId);

            return newId;
        }
    }
}