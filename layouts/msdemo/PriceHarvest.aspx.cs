using System;
using System.Collections.Generic;
using System.Linq;
using ms8.code.Mappers;
using ms8.code.Models;
using ms8.code.Pricing.Endpoints;
using ms8.code.Pricing.Repositories;
using Sitecore.Data;
using Sitecore.Data.Items;
using ConsoleLog = ms8.code.Loggers.ConsoleLog;
using PricingService = ms8.code.Pricing.Endpoints.PricingService;

namespace ms8.layouts.msdemo
{
    public partial class PriceHarvest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImportClick(object sender, EventArgs e)
        {
            string[] isbnNumbers = LoadIsbnNumbers().ToArray();

            WipePriceDatabase();

            var collection = PriceHarvestRepository.MongoCollection();

            foreach (string isbnNumber in isbnNumbers)
            {
                var pricingService = new PricingService(new ConsoleLog());
                
                var pricingDetails = new PricingDetails()
                {
                    IsbnNumber = isbnNumber
                };

                foreach (Currency currency in pricingService.Currencies)
                {
                    var price = pricingService.FindPriceByIsbn(isbnNumber, currency);

                    PricingMapper.Map(isbnNumber, price, pricingDetails);
                }

                collection.Insert(pricingDetails);
            }
        }

        private void WipePriceDatabase()
        {
            PriceHarvestRepository.MongoCollection().Drop();
        }

        private IEnumerable<string> LoadIsbnNumbers()
        {
            foreach (
                Item child in
                    Sitecore.Context.Database.GetItem(new ID("{95A0B67B-04DF-4307-A5F7-D107E769FAD5}")).Children)
            {
                yield return child.Fields["Isbn"].Value;
            }
        }
    }
}