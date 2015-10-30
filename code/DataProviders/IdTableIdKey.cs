using System;

namespace ms8.code.DataProviders
{
    public class IdTableIdKey
    {
        public string Prefix { get; set; }
        public Guid Id { get; set; }

        private string InternalKey => Prefix + Id;

        public IdTableIdKey(string prefix, Guid id)
        {
            Prefix = prefix;
            Id = id;
        }

        public override bool Equals(object obj)
        {
            IdTableIdKey idTableIdKey = obj as IdTableIdKey;

            if (idTableIdKey != null)
            {
                return idTableIdKey.InternalKey == this.InternalKey;
            }

            return false;
        }

        public override int GetHashCode()
        {
            return InternalKey.GetHashCode();
        }
    }
}