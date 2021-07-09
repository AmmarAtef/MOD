using System;
using System.Web.UI;
using WebpartsCommonHelpers;

namespace VisitRequest.SupervisorApproveWP
{
    public partial class SupervisorApproveWPUserControl : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    string[] settings = Helper.GetSiteSettings("VisitsRequestsWebURL");
                    hdnAPIRootURL.Value = settings[0];
                    hdnWFWebUrl.Value = settings[1];

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
