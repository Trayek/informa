using System.Xml.Linq;
using ms8.code.Loggers;

namespace ms8.code.Pricing.Endpoints
{
    internal class IsbnService
    {
        private readonly ILog _log;
        private WebService _webService;

        public IsbnService(ILog log)
        {
            _log = log;
        }

        private void ResetQuery()
        {
            _webService = new WebService("http://uat2.blogic.crcpress.local/webservices/ProductEndpoint",
                "findBookByIsbn",
                "prod", "http://product.business.ecommerce.crcpress.tandf.com/");
        }

        public XDocument FindBookByIsbn(string isbn)
        {
            ResetQuery();

            _webService.Params.Add("isbn", isbn);

            _log.Info("Looking up ISBN " + isbn);

            _webService.Invoke();

            return _webService.ResultXml;
        }
    }
}