using MotBussiness;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace MODAPI.Controllers
{
    [RoutePrefix("api/Lookups")]
    public class LookupsController : ApiController
    {
        LookupBL _LookupsBL = new LookupBL();

        [Route("GetDepartments")]
        [HttpGet]
        public HttpResponseMessage GetDepartments()
        {
            List<LookupEntity> _output = _LookupsBL.GetDepartmentsList();
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            return resp;
        }

        [Route("GetAllSections")]
        [HttpGet]
        public HttpResponseMessage GetAllSections()
        {
            List<SectionEntity> _output = _LookupsBL.GetAllSections();
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            return resp;
        }

        [Route("GetGates")]
        [HttpGet]
        public HttpResponseMessage GetGates()
        {
            List<LookupEntity> _output = _LookupsBL.GetGatesList();
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            return resp;
        }

        [Route("GetDepartmentSestions")]
        [HttpGet]
        public HttpResponseMessage GetDepartmentSestions(string departmentCode)
        {
            List<LookupEntity> _output = _LookupsBL.GetSectionsList(departmentCode);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            return resp;
        }

        [Route("GetStatuses")]
        [HttpGet]
        public HttpResponseMessage GetStatuses()
        {
            List<LookupEntity> _output = _LookupsBL.GetStatusList();
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            return resp;
        }

        [Route("GetDepartmentNameByCode")]
        [HttpGet]
        public HttpResponseMessage GetDepartmentNameByCode(string departmentCode)
        {
            string _output = _LookupsBL.GetDepartmentNameByCode(departmentCode);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            return resp;
        }

        [Route("GetSectionNameByDeptartmentCodeAndSection")]
        [HttpGet]
        public HttpResponseMessage GetSectionNameByDeptartmentCodeAndSection(string departmentCode, string sectionCode)
        {
            string _output = _LookupsBL.GetSectionNameByDeptartmentCodeAndSection(departmentCode, sectionCode);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            return resp;
        }

        [Route("GetStatusNameByCodeAndType")]
        [HttpGet]
        public HttpResponseMessage GetStatusNameByCodeAndType(string statusCode, string statusType)
        {
            string _output = _LookupsBL.GetStatusNameByCodeAndType(statusCode, statusType);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            return resp;
        }
    }
}
