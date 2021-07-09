using System;
using System.Web.UI;
using WebpartsCommonHelpers;

namespace DevicesRequestsWFWebparts.EmployeeDevicesRequestsWP
{
    public partial class EmployeeDevicesRequestsWPUserControl : UserControl
    {
        public EmployeeDevicesRequestsWP WebPart { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    string[] settings = Helper.GetSiteSettings("DevicesRequestsWebURL");
                    hdnAPIRootURL.Value = settings[0];
                    hdnWFWebUrl.Value = settings[1];

                    this.WebPart = this.Parent as EmployeeDevicesRequestsWP;
                    hdnRequestType.Value = WebPart.RequestType.ToString();
                }
                catch (Exception ex)
                {
                    Helper.LogException(ex);
                }
            }
        }
    }
}
