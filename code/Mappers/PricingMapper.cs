using System.Linq;
using System.Xml.Linq;
using ms8.code.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace ms8.code.Mappers
{
    public class PricingMapper
    {
        public static PricingDetails Map(string isbnNumber, XDocument document)
        {
            string json = JsonConvert.SerializeXNode(document.Descendants("return").FirstOrDefault());

            var jObject = JObject.Parse(json);

            decimal price = jObject["return"]["listPrice"].Value<decimal>();

            string symbol = jObject["return"]["currency"]["symbol"].Value<string>();

            return new PricingDetails { IsbnNumber = isbnNumber, Currency = symbol, Value = price };
        }
    }
}