using MODBussiness;
using MotBussiness;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ModApi.Controllers
{
    [RoutePrefix("api/MaterialsRequest")]
    public class MaterialsRequestController : ApiController
    {
        MaterialsRequestBL _MaterialsRequestBL = new MaterialsRequestBL();

        [Route("AddMaterialsRequest")]
        [HttpPost]
        public HttpResponseMessage AddMaterialsRequest(string ListSiteUrl, MaterialsRequestEntity _MaterialsRequestEntity)
        {
            MaterialsRequestOutPut _output = _MaterialsRequestBL.AddMaterialRequest(ListSiteUrl, _MaterialsRequestEntity);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            return resp;
        }

        [Route("UpdateMaterialsRequest")]
        [HttpPost]
        public HttpResponseMessage UpdateMaterialsRequest(string ListSiteUrl, MaterialsRequestEntity _MaterialsRequestEntity)
        {
            MaterialsRequestOutPut _output = _MaterialsRequestBL.UpdateMaterialsRequest(ListSiteUrl, _MaterialsRequestEntity);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            return resp;
        }

        [Route("DeleteRequest")]
        [HttpGet]
        public HttpResponseMessage DeleteRequest(string ListSiteUrl, int ReqID)
        {
            MaterialsRequestOutPut _output = _MaterialsRequestBL.DeleteRequest(ListSiteUrl, ReqID);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            return resp;
        }


        [Route("GetRequestDetails")]
        [HttpGet]
        public HttpResponseMessage GetRequestDetails(string ListSiteUrl, int RequestID)
        {
            MaterialsRequestEntity _MaterialsRequestEntity = _MaterialsRequestBL.GetMaterialsRequestDetails(ListSiteUrl, RequestID);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _MaterialsRequestEntity);
            return resp;
        }

        [Route("GetMaterialsRequestDetailsForEdit")]
        [HttpGet]
        public HttpResponseMessage GetMaterialsRequestDetailsForEdit(string ListSiteUrl, string CurrentUserId, int RequestID)
        {
            MaterialsRequestEntity _MaterialsRequestEntity = _MaterialsRequestBL.GetMaterialsRequestDetailsForEdit(ListSiteUrl, CurrentUserId, RequestID);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _MaterialsRequestEntity);
            return resp;
        }

        [Route("GetMaterialsRequestDetailsForView")]
        [HttpGet]
        public HttpResponseMessage GetMaterialsRequestDetailsForView(string ListSiteUrl, string CurrentUserId, int RequestID)
        {
            MaterialsRequestEntity _MaterialsRequestEntity = _MaterialsRequestBL.GetMaterialsRequestDetailsForView(ListSiteUrl, CurrentUserId, RequestID);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _MaterialsRequestEntity);
            return resp;
        }

        [Route("SearchRequests")]
        [HttpGet]
        public HttpResponseMessage SearchRequests(string ListSiteUrl, int UserID, int RequestID, DateTime? CreationDate, DateTime? RequestDate, string ApplicantName, string SupervisorName, string MaterialName, string DepartmentCode, string SectionCode, string RequestState, bool OnlyToday, string RequestType, string Department = "")
        {
            GeneralResponse generalResponse = new GeneralResponse();
            object _output = _MaterialsRequestBL.SearchRequests(ListSiteUrl, UserID, RequestID, CreationDate, RequestDate, ApplicantName, SupervisorName, MaterialName, DepartmentCode, SectionCode, RequestState, OnlyToday, RequestType, Department, out generalResponse);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            Common.SendStatusInResponseHeader(resp, generalResponse);

            return resp;
        }


        [Route("GetRequests")]
        [HttpGet]
        public HttpResponseMessage GetRequests(string ListSiteUrl, int UserID, bool OnlyToday, string Department = "")
        {
            object _output = _MaterialsRequestBL.GetRequests(ListSiteUrl, UserID, Department, OnlyToday);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            return resp;
        }


        [Route("AprroveSupervisor")]
        [HttpPost]
        public HttpResponseMessage AprroveSupervisor(string ListSiteUrl, RequestStatus _RequestStatus)
        {
            MaterialsRequestOutPut _output = _MaterialsRequestBL.AprroveSupervisor(ListSiteUrl, _RequestStatus);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            return resp;
        }

        [Route("AprroveSecurity")]
        [HttpPost]
        public HttpResponseMessage AprroveSecurity(string ListSiteUrl, RequestStatus _RequestStatus)
        {
            MaterialsRequestOutPut _output = _MaterialsRequestBL.AprroveSecurity(ListSiteUrl, _RequestStatus);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            return resp;
        }

        [Route("AddFinalAproveForRequest")]
        [HttpPost]
        public HttpResponseMessage AddFinalAproveForRequest(string ListSiteUrl, MaterialsRequestEntity _MaterialsRequestEntity)
        {
            MaterialsRequestOutPut _output = _MaterialsRequestBL.AddFinalAproveForRequest(ListSiteUrl, _MaterialsRequestEntity);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            return resp;
        }

        [Route("AddMaterialAction")]
        [HttpPost]
        public HttpResponseMessage AddMaterialAction(string ListSiteUrl, List<MaterialEntity> _MaterialEntityList)
        {
            MaterialsRequestOutPut _output = _MaterialsRequestBL.AddMaterialAction(ListSiteUrl, _MaterialEntityList);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            return resp;
        }

        [Route("GetActions")]
        [HttpGet]
        public HttpResponseMessage GetActions(string ListSiteUrl, int RequestID, bool ToDay, int UserID, DateTime? RequestCreateDate, string RequestType, string Gate = "", string ApplicantName = "", string SupervisorName = "", string MaterialName = "", string DepartmentCode = "", string SectionCode = "", bool DailyReport = false)
        {
            GeneralResponse generalResponse = new GeneralResponse();
            object _output = _MaterialsRequestBL.GetActions(ListSiteUrl, RequestID, ToDay, UserID, RequestCreateDate, RequestType, Gate, ApplicantName, SupervisorName, MaterialName, DepartmentCode, SectionCode, DailyReport, out generalResponse);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            Common.SendStatusInResponseHeader(resp, generalResponse);
            return resp;
        }
    }
}
