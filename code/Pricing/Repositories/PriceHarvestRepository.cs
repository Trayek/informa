using System.Configuration;
using ms8.code.Models;
using MongoDB.Driver;

namespace ms8.code.Pricing.Repositories
{
    public class PriceHarvestRepository
    {
        public static MongoCollection<PricingDetails> MongoCollection()
        {
            var connectionString = ConfigurationManager.ConnectionStrings["PriceHarvest"].ConnectionString;

            string serverName = connectionString.Substring(0, connectionString.LastIndexOf("/"));

            string dbName = connectionString.Substring(connectionString.LastIndexOf("/") + 1);

            var client = new MongoClient(serverName);

            var server = client.GetServer();

            var db = server.GetDatabase(dbName);

            MongoCollection<PricingDetails> documents = db.GetCollection<PricingDetails>("Prices");

            return documents;
        }
    }
}