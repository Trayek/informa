using System.Collections.Generic;
using System.Web.Http;

namespace ms8.Controllers.Api
{
    [RoutePrefix("ExampleSite/api/Sample")]
    // this defines how to perform default route lookups on methods (e.g. this routes the action to a method of the same name like asp.net MVC, and sets Get() to the default action)
    [Route("{action=Get}")]
    public class TestController : ApiController
    {
        public IEnumerable<object> Get()
        {
            return new[]
            {
                new { foo="foo", bar="bar"},
                new { foo="baz", bar="bonk" }
            };
        }

        // GET ExampleSite/api/Sample/Foos
        public string Foos()
        {
            return "hello world";
        }
    }
}
