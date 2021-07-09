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
    [RoutePrefix("api/DevicesRequest")]
    public class DevicesRequestController : ApiController
    {
        DevicesRequestBL _DevicesRequestBL = new DevicesRequestBL();

        [Route("AddDevicesRequest")]
        [HttpPost]
        public HttpResponseMessage AddDevicesRequest(string ListSiteUrl, DevicesRequestEntity _DevicesRequestEntity)
        {
            DevicesRequestOutPut _output = _DevicesRequestBL.AddDeviceRequest(ListSiteUrl, _DevicesRequestEntity);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            return resp;
        }

        [Route("UpdateDevicesRequest")]
        [HttpPost]
        public HttpResponseMessage UpdateDevicesRequest(string ListSiteUrl, DevicesRequestEntity _DevicesRequestEntity)
        {
            DevicesRequestOutPut _output = _DevicesRequestBL.UpdateDevicesRequest(ListSiteUrl, _DevicesRequestEntity);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            return resp;
        }
         

        [Route("DeleteRequest")]
        [HttpGet]
        public HttpResponseMessage DeleteRequest(string ListSiteUrl, int ReqID)
        {
            DevicesRequestOutPut _output = _DevicesRequestBL.DeleteRequest(ListSiteUrl, ReqID);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            return resp;
        }

        [Route("GetRequestDetails")]
        [HttpGet]
        public HttpResponseMessage GetRequestDetails(string ListSiteUrl, int RequestID)
        {
            DevicesRequestEntity _DevicesRequestEntity = _DevicesRequestBL.GetDevicesRequestDetails(ListSiteUrl, RequestID);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _DevicesRequestEntity);
            return resp;
        }

        [Route("GetRequestDetailsForEdit")]
        [HttpGet]
        public HttpResponseMessage GetRequestDetailsForEdit(string ListSiteUrl, string CurrentUserId, int RequestID)
        {
            DevicesRequestEntity _DevicesRequestEntity = _DevicesRequestBL.GetDevicesRequestDetailsForEdit(ListSiteUrl, CurrentUserId, RequestID);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _DevicesRequestEntity);
            return resp;
        }

        [Route("GetRequestDetailsForView")]
        [HttpGet]
        public HttpResponseMessage GetRequestDetailsForView(string ListSiteUrl, string CurrentUserId, int RequestID)
        {
            DevicesRequestEntity _DevicesRequestEntity = _DevicesRequestBL.GetRequestDetailsForView(ListSiteUrl, CurrentUserId, RequestID);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _DevicesRequestEntity);
            return resp;
        }

        [Route("SearchRequests")]
        [HttpGet]
        public HttpResponseMessage SearchRequests(string ListSiteUrl, int UserID, int RequestID, DateTime? CreationDate, DateTime? RequestDate, string ApplicantName, string SupervisorName, string DeviceType, string DepartmentCode, string SectionCode, string RequestState, bool OnlyToday,string RequestType, string Department = "")
        {
            GeneralResponse generalResponse = new GeneralResponse();

            object _output = _DevicesRequestBL.SearchRequests(ListSiteUrl, UserID, RequestID, CreationDate, RequestDate, ApplicantName, SupervisorName, DeviceType,DepartmentCode,SectionCode, RequestState, OnlyToday, RequestType, Department,out generalResponse);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            Common.SendStatusInResponseHeader(resp, generalResponse);
            return resp;
        }

        [Route("GetRequests")]
        [HttpGet]
        public HttpResponseMessage GetRequests(string ListSiteUrl, int UserID, bool OnlyToday, string Department = "")
        {
            object _output = _DevicesRequestBL.GetRequests(ListSiteUrl, UserID, Department, OnlyToday);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            return resp;
        }

        [Route("AprroveSupervisor")]
        [HttpPost]
        public HttpResponseMessage AprroveSupervisor(string ListSiteUrl, RequestStatus _RequestStatus)
        {
            DevicesRequestOutPut _output = _DevicesRequestBL.AprroveSupervisor(ListSiteUrl, _RequestStatus);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            return resp;
        }

        [Route("AprroveSecurity")]
        [HttpPost]
        public HttpResponseMessage AprroveSecurity(string ListSiteUrl, RequestStatus _RequestStatus)
        {
            DevicesRequestOutPut _output = _DevicesRequestBL.AprroveSecurity(ListSiteUrl, _RequestStatus);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            return resp;
        }

        [Route("AddFinalAproveForRequest")]
        [HttpPost]
        public HttpResponseMessage AddFinalAproveForRequest(string ListSiteUrl, DevicesRequestEntity _DevicesRequestEntity)
        {
            DevicesRequestOutPut _output = _DevicesRequestBL.AddFinalAproveForRequest(ListSiteUrl, _DevicesRequestEntity);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            return resp;
        }

        [Route("AddMachineAction")]
        [HttpPost]
        public HttpResponseMessage AddMachineAction(string ListSiteUrl, List<MachineEntity> _MachineEntityList)
        {
            DevicesRequestOutPut _output = _DevicesRequestBL.AddMachineAction(ListSiteUrl, _MachineEntityList);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            return resp;
        }        

        [Route("GetActions")]
        [HttpGet]
        public HttpResponseMessage GetActions(string ListSiteUrl, int RequestID, bool ToDay, int UserID, DateTime? RequestCreateDate, string RequestType, string Gate = "", string ApplicantName = "", string SupervisorName = "", string DeviceType = "", string DepartmentCode ="", string SectionCode = "", bool DailyReport = false)
        {
            GeneralResponse generalResponse = new GeneralResponse();
            object _output = _DevicesRequestBL.GetActions(ListSiteUrl,RequestID, ToDay, UserID, RequestCreateDate, RequestType, Gate, ApplicantName, SupervisorName,DeviceType,DepartmentCode, SectionCode, DailyReport, out generalResponse);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            Common.SendStatusInResponseHeader(resp, generalResponse);
            return resp;
        }
    }
}
