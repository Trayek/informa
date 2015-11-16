using System.Collections.Generic;
using System.Xml.Linq;
using ms8.code.Loggers;

namespace ms8.code.Pricing.Endpoints
{
    public class PricingService
    {
        private readonly ILog _log;
        private WebService _webService;

        public PricingService(ILog log)
        {
            _log = log;
        }

        private void ResetQuery()
        {
            _webService = new WebService("http://uat2.blogic.crcpress.local/webservices/PricingManagerEndpoint",
                "lookupPriceByISBN",
                "pric", "http://pricing.business.ecommerce.crcpress.tandf.com/");
        }

        public Currency GbpCurrency => new Currency
        {
            Symbol = "&amp; pound;",
            Id = "1002",
            IsoName = "GBP",
            Name = "UK Pounds",
            ConversionFactor = "0.597158",
        };

        public IEnumerable<Currency> Currencies => new[]
        {
            GbpCurrency,
            new Currency
            {
                Id = "1001",
            },
            new Currency
            {
                Id = "1006",
            },
            new Currency
            {
                Id = "1017",
            },
            new Currency
            {
                Id = "1003",
            }
        };

        public XDocument FindPriceByIsbn(string isbn, Currency currency = null)
        {
            if (currency == null)
            {
                currency = GbpCurrency;
            }

            ResetQuery();

            _log.Info("Searching for price by isbn: " + isbn);

            _webService.Params.Add("isbn", isbn);

            _webService.Params.Add("currency", currency.ToWebServiceParameter());

            _webService.Invoke(false);

            return _webService.ResultXml;
        }
    }

    public class Currency
    {
        public string ConversionFactor { get; set; }
        public string Id { get; set; }
        public string IsoName { get; set; }
        public string Name { get; set; }
        public string Symbol { get; set; }

        public string ToWebServiceParameter()
        {
            return $@"<id>{Id}</id>";
        }
    }
}
