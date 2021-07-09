using Microsoft.SharePoint;
using WebpartsCommonHelpers;
using System;
using System.Web.Configuration;
using System.Web.UI;

namespace MaterialsRequestsWFWebparts.ProtectionMaterialsReportWP
{
    public partial class ProtectionMaterialsReportWPUserControl : UserControl
    {
        public ProtectionMaterialsReportWP WebPart { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                try
                {
                    string[] settings = Helper.GetSiteSettings("MaterialsRequestsWebURL");
                    hdnAPIRootURL.Value = settings[0];
                    hdnWFWebUrl.Value = settings[1];

                    this.WebPart = this.Parent as ProtectionMaterialsReportWP;
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
