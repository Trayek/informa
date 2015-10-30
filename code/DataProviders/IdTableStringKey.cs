using Sitecore.Data;

namespace ms8.code.DataProviders
{
    public class IdTableStringKey
    {
        public string Prefix { get; set; }
        public string Key { get; set; }

        private string InternalKey => Prefix + Key;

        public IdTableStringKey(string prefix, string key)
        {
            Prefix = prefix;
            Key = key;
        }

        public override bool Equals(object obj)
        {
            IdTableStringKey idTableStringKey = obj as IdTableStringKey;

            if (idTableStringKey != null)
            {
                return idTableStringKey.InternalKey == this.InternalKey;
            }

            return false;
        }

        public override int GetHashCode()
        {
            return InternalKey.GetHashCode();
        }
    }
}