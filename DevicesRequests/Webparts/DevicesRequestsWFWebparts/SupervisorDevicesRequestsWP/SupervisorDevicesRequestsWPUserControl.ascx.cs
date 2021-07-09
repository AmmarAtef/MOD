using Microsoft.Office.Server.UserProfiles;
using Microsoft.SharePoint;
using WebpartsCommonHelpers;
using System;
using System.Collections.Generic;
using System.Web.Configuration;
using System.Web.UI;

namespace DevicesRequestsWFWebparts.SupervisorDevicesRequestsWP
{
    public partial class SupervisorDevicesRequestsWPUserControl : UserControl
    {
        public SupervisorDevicesRequestsWP WebPart { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    string[] settings = Helper.GetSiteSettings("DevicesRequestsWebURL");
                    hdnAPIRootURL.Value = settings[0];
                    hdnWFWebUrl.Value = settings[1];

                    this.WebPart = this.Parent as SupervisorDevicesRequestsWP;
                    hdnRequestType.Value = WebPart.RequestType.ToString();

                    UserData applicantData = Helper.GetApplicantData();
                    hdnDepartment.Value = applicantData.Department;

                }
                catch (Exception ex)
                {
                    Helper.LogException(ex);
                }
            }
        }
    }
}
