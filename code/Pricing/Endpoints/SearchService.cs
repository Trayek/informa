using System.Xml.Linq;
using ms8.code.Loggers;

namespace ms8.code.Pricing.Endpoints
{
    class SearchService
    {
        private readonly ILog _log;
        private WebService _webService;

        public SearchService(ILog log)
        {
            _log = log;
        }

        private void ResetQuery()
        {
            _webService = new WebService("http://uat2.blogic.crcpress.local/webservices/ProductSearchEndpoint",
                "simpleSearch",
                "sear", "http://search.business.ecommerce.crcpress.tandf.com/");

            _webService.PostValueWrapper = "query";
        }

        public XDocument Search(int startPage = 0, int resultCount = 100)
        {
            ResetQuery();

            _log.Info("Searching. Start page: " + startPage + " count: " + resultCount);

            _webService.Params.Add("start", startPage.ToString());

            _webService.Params.Add("size", resultCount.ToString());

            _webService.Params.Add("sort", "");

            _webService.Params.Add("specimen", "");

            _webService.Invoke();

            return _webService.ResultXml;
        }
    }
}