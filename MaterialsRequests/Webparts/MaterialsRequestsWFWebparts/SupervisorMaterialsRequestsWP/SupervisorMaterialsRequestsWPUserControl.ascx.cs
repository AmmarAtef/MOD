using System;
using System.Web.UI;
using WebpartsCommonHelpers;

namespace MaterialsRequestsWFWebparts.SupervisorMaterialsRequestsWP
{
    public partial class SupervisorMaterialsRequestsWPUserControl : UserControl
    {
        public SupervisorMaterialsRequestsWP WebPart { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                try
                {
                    string[] settings = Helper.GetSiteSettings("MaterialsRequestsWebURL");
                    hdnAPIRootURL.Value = settings[0];
                    hdnWFWebUrl.Value = settings[1];

                    this.WebPart = this.Parent as SupervisorMaterialsRequestsWP;
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
