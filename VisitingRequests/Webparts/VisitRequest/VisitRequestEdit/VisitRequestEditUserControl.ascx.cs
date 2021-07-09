using System;
using System.Web.UI;
using WebpartsCommonHelpers;

namespace VisitRequest.VisitRequestEdit
{
    public partial class VisitRequestEditUserControl : UserControl
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
                }
                catch (Exception ex)
                {
                    Helper.LogException(ex);
                }
            }
        }
    }
}
