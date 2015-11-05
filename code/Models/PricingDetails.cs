using MongoDB.Bson.Serialization.Attributes;

namespace ms8.code.Models
{
    [BsonIgnoreExtraElements]
    public class PricingDetails
    {
        public decimal Value { get; set; }

        public string Currency { get; set; }
        public string IsbnNumber { get; set; }
    }
}