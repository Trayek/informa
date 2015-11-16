using System.Web.Http;
using System.Web.Http.Routing;
using Sitecore.Pipelines;

namespace ms8.code.Pipelines.Initialize
{
    public class WebApiRouteInitializationProcessor
    {
        public void Process(PipelineArgs args)
        {
            GlobalConfiguration.Configuration.Routes.Add("api", new HttpRoute(
                "api/{controller}/{action}"));
        }
    }
}