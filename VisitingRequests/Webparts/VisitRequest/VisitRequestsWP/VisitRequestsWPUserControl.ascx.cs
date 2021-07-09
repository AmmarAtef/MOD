using Microsoft.SharePoint;
using Microsoft.SharePoint.Utilities;
using System;
using System.Web.UI;
using WebpartsCommonHelpers;

namespace VisitRequest.VisitRequestsWP
{
    public partial class VisitRequestsWPUserControl : UserControl
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

                    if (Helper.IsUserDataCompleted(applicantData))
                    {
                        pnlMain.Visible = true;
                        pnlMessage.Visible = false;

                        lblRequestUserNameValue.Text = applicantData.Name;
                        lblUserPositionValue.Text = applicantData.Position;
                        hdnDepartmentCode.Value = applicantData.Department;
                        hdnSectionCode.Value = applicantData.Section;
                    }
                    else
                    {
                        lblMissingDataMessageTitle.Text = Helper.GetResourceText("MODCommon", "MissingDataMessage");
                        string errorMessage = Helper.GetUserMissingData(applicantData);

                        lblMissingDataMessage.Text = errorMessage;

                        pnlMain.Visible = false;
                        pnlMessage.Visible = true;
                    }
                }
                catch (Exception ex)
                {
                    Helper.LogException(ex);
                }
            }
        }
    }
}
