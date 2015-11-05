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

        public XDocument FindPriceByIsbn(string isbn)
        {
            ResetQuery();

            _log.Info("Searching for price by isbn: " + isbn);

            _webService.Params.Add("isbn", isbn);

            _webService.Params.Add("currency", @"<conversionFactor>0.597158</conversionFactor>
            <id>1002</id>
            <isoName>GBP</isoName>
            <name>UK Pounds</name>
            <symbol>&amp; pound;</symbol>");

            _webService.Invoke(false);

            return _webService.ResultXml;
        }
    }
}
