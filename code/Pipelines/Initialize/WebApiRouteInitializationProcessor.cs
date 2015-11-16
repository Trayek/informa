using System.Web.Http;
using System.Web.Http.Dispatcher;
using System.Web.Http.Routing;
using Sitecore.Pipelines;
using Sitecore.Services.Core;

namespace ms8.code.Pipelines.Initialize
{
    public class WebApiRouteInitializationProcessor
    {
        public void Process(PipelineArgs args)
        {
            GlobalConfiguration.Configuration.Routes.Add("api", new HttpRoute("api/{controller}/{action}"));

            GlobalConfiguration.Configure(config => config.MapHttpAttributeRoutes());

            GlobalConfiguration.Configure(ReplaceControllerSelector);
        }

        private static void ReplaceControllerSelector(HttpConfiguration config)
        {
            config.Services.Replace(typeof (IHttpControllerSelector),
                new CustomHttpControllerSelector(config, new NamespaceQualifiedUniqueNameGenerator()));
        }
    }
}