using Microsoft.SharePoint;
using WebpartsCommonHelpers;
using System;
using System.Web.Configuration;
using System.Web.UI;

namespace VisitRequest.ReportsWP
{
    public partial class ReportsWPUserControl : UserControl
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
