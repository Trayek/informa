using System.Collections.Generic;
using MongoDB.Bson.Serialization.Attributes;

namespace ms8.code.Models
{
    [BsonIgnoreExtraElements]
    public class PricingDetails
    {
        public PricingDetails()
        {
            CurrencyDetails = new List<PricingCurrencyDetails>();
        }

        public List<PricingCurrencyDetails> CurrencyDetails { get; set; }

        public string IsbnNumber { get; set; }
    }

    public class PricingCurrencyDetails
    {
        public string Currency { get; set; }

        public decimal Value { get; set; }
    }
}