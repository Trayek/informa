using System.Web.Http;
using ms8.code.Models;
using ms8.code.Pricing;

namespace ms8.Controllers.Api
{
    public class PricingController : ApiController
    {
        [HttpGet]
        public PricingCurrencyDetails GetPrices(string isbn, string currency = "")
        {
            return new PricingDetailsService().GetPrices(isbn, currency);
        }
    }
}
