using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using WebpartsCommonHelpers;

namespace MaterialsRequestsWFWebparts.MaterialsRequestDetailsWP
{
    public partial class MaterialsRequestDetailsWPUserControl : UserControl
    {
        public MaterialsRequestDetailsWP WebPart { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                try
                {
                    string[] settings = Helper.GetSiteSettings("MaterialsRequestsWebURL");
                    hdnAPIRootURL.Value = settings[0];
                    hdnWFWebUrl.Value = settings[1];

                    this.WebPart = this.Parent as MaterialsRequestDetailsWP;
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
