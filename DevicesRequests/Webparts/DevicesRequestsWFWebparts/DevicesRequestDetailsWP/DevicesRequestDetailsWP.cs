using System.ComponentModel;
using System.Web.UI;
using System.Web.UI.WebControls.WebParts;

namespace DevicesRequestsWFWebparts.DevicesRequestDetailsWP
{
    [ToolboxItemAttribute(false)]
    public class DevicesRequestDetailsWP : WebPart
    {
        // Visual Studio might automatically update this path when you change the Visual Web Part project item.
        private const string _ascxPath = @"~/_CONTROLTEMPLATES/15/DevicesRequestsWFWebparts/DevicesRequestDetailsWP/DevicesRequestDetailsWPUserControl.ascx";

        public int _RequestType;
        [WebBrowsable(true)]
        [WebDisplayName("Request Type:")]
        [WebDescription("Set the value 0 for In and 1 for Out")]
        [Personalizable(System.Web.UI.WebControls.WebParts.PersonalizationScope.Shared)]
        [Category("Configuration")]
        public int RequestType
        {
            get { return _RequestType; }
            set { _RequestType = value; }
        }

        protected override void CreateChildControls()
        {
            Control control = Page.LoadControl(_ascxPath);
            Controls.Add(control);
        }
    }
}
