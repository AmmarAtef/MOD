using Microsoft.SharePoint;
using Microsoft.SharePoint.Utilities;
using System;
using System.Web.UI;
using WebpartsCommonHelpers;

namespace DevicesRequestsWFWebparts.AddDevicesRequestWP
{
    public partial class AddDevicesRequestWPUserControl : UserControl
    {
        public AddDevicesRequestWP WebPart { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {

                    string[] settings = Helper.GetSiteSettings("DevicesRequestsWebURL");
                    hdnAPIRootURL.Value = settings[0];
                    hdnWFWebUrl.Value = settings[1];

                    this.WebPart = this.Parent as AddDevicesRequestWP;
                    hdnRequestType.Value = WebPart.RequestType.ToString();

                    UserData applicantData = Helper.GetApplicantData();

                    if (Helper.IsUserDataCompleted(applicantData))
                    {
                        pnlMain.Visible = true;
                        pnlMessage.Visible = false;

                        lblApplicantName.Text = applicantData.Name;
                        lblApplicantPosition.Text = applicantData.Position;
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
