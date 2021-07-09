using Microsoft.Office.Server.UserProfiles;
using Microsoft.SharePoint;
using WebpartsCommonHelpers;
using System;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace MaterialsRequestsWFWebparts.SecurityMaterialsRequestsWP
{
    public partial class SecurityMaterialsRequestsWPUserControl : UserControl
    {
        public SecurityMaterialsRequestsWP WebPart { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                try
                {
                    string[] settings = Helper.GetSiteSettings("MaterialsRequestsWebURL");
                    hdnAPIRootURL.Value = settings[0];
                    hdnWFWebUrl.Value = settings[1];

                    this.WebPart = this.Parent as SecurityMaterialsRequestsWP;
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
