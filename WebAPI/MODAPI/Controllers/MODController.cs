using MODBussiness;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace MODAPI.Controllers
{
    [RoutePrefix("api/MOD")]
    public class MODController : ApiController
    {
        MODRequestsBL _MODRequestsBL = new MODRequestsBL();
        [Route("GetUserRequests")]
        [HttpGet]
        public HttpResponseMessage GetUserRequests(string userName, string requestStatus,int topN)
        {
            //string userName = @"moddev\emp1dev";

            GeneralResponse generalResponse = _MODRequestsBL.GetUserRequests(userName, requestStatus, topN);
            var resp = Request.CreateResponse(HttpStatusCode.OK, generalResponse);
            return resp;
        }
    }
}
