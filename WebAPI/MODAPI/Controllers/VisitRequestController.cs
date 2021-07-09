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
    [RoutePrefix("api/VisitRequest")]
    public class VisitRequestController : ApiController
    {
        VisitRequest VisitRequest = new VisitRequest();

        [Route("AddVisitRequest")]
        [HttpPost]
        public HttpResponseMessage AddVisitRequest(string ListSiteUrl, VisitRequestEntity VisitRequestEntity)
        {
            VisitRequestOutPut _output = VisitRequest.AddVisitRequest(ListSiteUrl, VisitRequestEntity);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            return resp;
        }


        [Route("AddFinalAproveForRequest")]
        [HttpPost]
        public HttpResponseMessage AddFinalAproveForRequest(string ListSiteUrl, VisitRequestEntity VisitRequestEntity)
        {
            VisitRequestOutPut _output = VisitRequest.AddFinalAproveForRequest(ListSiteUrl, VisitRequestEntity);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);

            return resp;
        }


        [Route("AddCheckIn")]
        [HttpPost]
        public HttpResponseMessage AddCheckIn(string ListSiteUrl, List<VisitPersonsEntity> VisitPersons)
        {
            VisitRequestOutPut _output = VisitRequest.AddCheckIn(ListSiteUrl, VisitPersons);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            return resp;
        }
        [Route("AddCheckOut")]
        [HttpPost]
        public HttpResponseMessage AddCheckOut(string ListSiteUrl, List<VisitPersonsEntity> VisitPersons)
        {
            VisitRequestOutPut _output = VisitRequest.AddCheckOut(ListSiteUrl, VisitPersons);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            return resp;
        }

        [Route("AprroveSupervisor")]
        [HttpPost]
        public HttpResponseMessage AprroveSupervisor(string ListSiteUrl, VisitingRequestStatus VisitingRequestStatus)
        {
            VisitRequestOutPut _output = VisitRequest.AprroveSupervisor(ListSiteUrl, VisitingRequestStatus);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            return resp;
        }

        [Route("AprroveSecurity")]
        [HttpPost]
        public HttpResponseMessage AprroveSecurity(string ListSiteUrl, VisitingRequestStatus VisitingRequestStatus)
        {
            VisitRequestOutPut _output = VisitRequest.AprroveSecurity(ListSiteUrl, VisitingRequestStatus);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);

            return resp;
        }

        [Route("UpdateVisitRequest")]
        [HttpPost]
        public HttpResponseMessage UpdateVisitRequest(string ListSiteUrl, VisitRequestEntity VisitRequestEntity)
        {
            VisitRequestOutPut _output = VisitRequest.UpdateVisitRequest(ListSiteUrl, VisitRequestEntity);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);

            return resp;
        }

        [Route("DeleteRequest")]
        [HttpGet]
        public HttpResponseMessage DeleteRequest(string ListSiteUrl, int ReqID)
        {
            VisitRequestOutPut _output = VisitRequest.DeleteRequest(ListSiteUrl, ReqID);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);

            return resp;
        }



        [Route("GetRequestDetails")]
        [HttpGet]
        public HttpResponseMessage GetRequestDetails(string ListSiteUrl, int RequestID)
        {
            VisitRequestEntity _output = VisitRequest.GetRequestDetails(ListSiteUrl, RequestID);

            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);

            return resp;
        }

        [Route("GetRequestDetailsForEdit")]
        [HttpGet]
        public HttpResponseMessage GetRequestDetailsForEdit(string ListSiteUrl, string CurrentUserId, int RequestID)
        {
            VisitRequestEntity _output = VisitRequest.GetRequestDetailsForEdit(ListSiteUrl, CurrentUserId, RequestID);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);

            return resp;
        }

        [Route("GetRequestDetailsForView")]
        [HttpGet]
        public HttpResponseMessage GetRequestDetailsForView(string ListSiteUrl, string CurrentUserId, int RequestID)
        {
            VisitRequestEntity _output = VisitRequest.GetRequestDetailsForView(ListSiteUrl, CurrentUserId, RequestID);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);

            return resp;
        }

        [Route("GetRequests")]
        [HttpGet]
        public HttpResponseMessage GetRequests(string ListSiteUrl, int UserID, bool OnlyToday, string Department = "")
        {
            object _output = VisitRequest.GetRequests(ListSiteUrl, UserID, Department, OnlyToday);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            return resp;
        }

        [Route("GetCheckInCheckOut")]
        [HttpGet]
        public HttpResponseMessage GetCheckInCheckOut(string ListSiteUrl, int RequestID, bool ToDay, int UserID, int Nationality, DateTime? RequestCreateDate, DateTime? RequestDate, string Gate = "", string ApplicantName = "", string FirstName = "", string FatherName = "", string FamilyName = "", string LastName = "", string DepartmentCode = "", string SectionCode = "", string IdentityNumber = "", bool DailyReport = false)
        {
            GeneralResponse generalResponse = new GeneralResponse();
            List<VisitRequestEntity> _output = VisitRequest.GetCheckInCheckOut(ListSiteUrl, RequestID, ToDay, UserID, Nationality, RequestCreateDate, RequestDate, Gate, ApplicantName, FirstName, FatherName, FamilyName, LastName, DepartmentCode, SectionCode, IdentityNumber, DailyReport, out generalResponse);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            Common.SendStatusInResponseHeader(resp, generalResponse);
            return resp;
        }

        [Route("SearchRequests")]
        [HttpGet]
        public HttpResponseMessage SearchRequests(string ListSiteUrl, int UserID, int RequestID, DateTime? RequestCreateDate, DateTime? RequestVisitDate, string ApplicantName, string FirstName, string FatherName, string FamilyName, string LastName, int Nationality, string DepartmentCode, string SectionCode, string IdentyNumber, string RequestState, bool OnlyToday, string Department = "")
        {
            GeneralResponse generalResponse = new GeneralResponse();
            object _output = VisitRequest.SearchRequests(ListSiteUrl, UserID, RequestID, RequestCreateDate, RequestVisitDate, ApplicantName, FirstName, FatherName, FamilyName, LastName, Nationality, DepartmentCode, SectionCode, IdentyNumber, RequestState, OnlyToday, Department, out generalResponse);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);
            Common.SendStatusInResponseHeader(resp, generalResponse);
            return resp;
        }

        [Route("GetAllLookups")]
        [HttpGet]
        public HttpResponseMessage GetAllLookups(string ListSiteUrl)
        {
            LoopUpList _output = VisitRequest.GetAllLookups(ListSiteUrl);
            var resp = Request.CreateResponse(HttpStatusCode.OK, _output);

            return resp;
        }
    }
}
