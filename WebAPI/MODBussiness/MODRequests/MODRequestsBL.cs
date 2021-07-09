using Microsoft.SharePoint;
using MotBussiness;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MODBussiness
{
    public class MODRequestsBL
    {
        VisitRequest _VisitRequest = new VisitRequest();
        DevicesRequestBL _DevicesRequestBL = new DevicesRequestBL();
        MaterialsRequestBL _MaterialsRequestBL = new MaterialsRequestBL();

        public GeneralResponse GetUserRequests(string userName, string requestStatus, int topN)
        {
            GeneralResponse generalResponse = new GeneralResponse();
            List<RequestEntity> requestsList = null;

            string baseUrl = Common.BaseUrl;
            try
            {

                SPSecurity.RunWithElevatedPrivileges(() =>
                {
                    using (SPSite site = new SPSite(baseUrl))
                    {
                        using (SPWeb web = site.OpenWeb())
                        {
                            SPUser user = web.SiteUsers.GetByLoginNoThrow(@"i:0#.w|" + userName);
                            if (user != null)
                            {
                                IEnumerable<RequestEntity> _VisitRequestsList = _VisitRequest.GetUserRequests(Common.VisitsRequestsWebURL, user.ID, requestStatus);
                                IEnumerable<RequestEntity> _DevicesRequestsList = _DevicesRequestBL.GetUserRequests(Common.DevicesRequestsWebURL, user.ID, requestStatus);
                                IEnumerable<RequestEntity> _MaterialRequestsList = _MaterialsRequestBL.GetUserRequests(Common.MaterialsRequestsWebURL, user.ID, requestStatus);

                                requestsList = _VisitRequestsList.Union(_DevicesRequestsList).Union(_MaterialRequestsList).ToList();
                                generalResponse.StatusCode = 0;
                                generalResponse.Message = "Success Operation";
                                generalResponse.ReturnData = requestsList != null ? requestsList.OrderByDescending(a => a.RequestCreationDate).Take(topN).ToList() : null;
                            }
                            else
                            {
                                generalResponse.StatusCode = -1;
                                generalResponse.Message = "User is not found";
                            }
                        }
                    }
                });

               
            }
            catch (Exception ex)
            {
                generalResponse.StatusCode = -1;
                generalResponse.Message = ex.Message;
                NNewLogMethod.LogException(ex);
            }
            return generalResponse;
        }
    }
}
