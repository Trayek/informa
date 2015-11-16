using System;
using System.Configuration;
using System.Linq;
using ms8.code.Loggers;
using ms8.code.Mappers;
using ms8.code.Models;
using ms8.code.Pricing.Repositories;
using MongoDB.Driver.Builders;

namespace ms8.code.Pricing
{
    public class PricingDetailsService
    {
        public PricingCurrencyDetails GetPrices(string isbn, string currency = "")
        {
            if (ConfigurationManager.AppSettings["UseRealServices"] == "true")
            {
                return GetApiPrices(isbn, currency);
            }

            return GetCachedPrices(isbn, currency);
        }

        private static PricingCurrencyDetails GetCachedPrices(string isbn, string currency)
        {
            var result =
                PriceHarvestRepository.MongoCollection().FindOne(Query<PricingDetails>.EQ(a => a.IsbnNumber, isbn));

            if (result == null)
            {
                return new PricingCurrencyDetails { Value = Math.Round(Decimal.Parse(isbn) / 100000000000, 2), Currency = "&pound;" };
            }

            return SelectCurrency(result, currency);
        }

        private static PricingCurrencyDetails SelectCurrency(PricingDetails pricingDetails, string currency)
        {
            var result = pricingDetails.CurrencyDetails.FirstOrDefault(a => a.Currency == currency);

            if (result == null)
            {
                result = pricingDetails.CurrencyDetails.FirstOrDefault(a => a.Currency == "&pound;");
            }

            return result;
        }

        private static PricingCurrencyDetails GetApiPrices(string isbn, string currency)
        {
            Endpoints.PricingService service = new Endpoints.PricingService(new ConsoleLog());

            var result = service.FindPriceByIsbn(isbn);

            return SelectCurrency(PricingMapper.Map(isbn, result), currency);
        }
    }
}