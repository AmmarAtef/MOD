using System;
using System.Runtime.InteropServices;
using System.Security.Permissions;
using Microsoft.SharePoint;

namespace ActivateDevicesRequestsStructureFeatures.Features.Feature1
{
    /// <summary>
    /// This class handles events raised during feature activation, deactivation, installation, uninstallation, and upgrade.
    /// </summary>
    /// <remarks>
    /// The GUID attached to this class may be used during packaging and should not be modified.
    /// </remarks>

    [Guid("9d449a55-2cbb-4d13-9959-acd35bdcbe41")]
    public class Feature1EventReceiver : SPFeatureReceiver
    {
        // Uncomment the method below to handle the event raised after a feature has been activated.

        public override void FeatureActivated(SPFeatureReceiverProperties properties)
        {
            SPWeb web = SPContext.Current.Web;
            //Requests Lists
            web.Features.Add(new Guid("e1931d52-a0b2-433d-b521-8c9c5726c4eb"), true);
            //DevicesRequestMachine Lists
            web.Features.Add(new Guid("6e08387a-4e92-4ba5-8b5c-ad8c72a2c4e7"), true);
            web.Features.Add(new Guid("178840dd-8ebf-44e8-bc8c-31f1599a7505"), true);
            //SupervisorStatus
            web.Features.Add(new Guid("739efe1c-3992-4cff-a4dd-b22442289425"), true);
            //SecurityStatus
            web.Features.Add(new Guid("fc73f574-696e-437f-b382-321bdff90138"), true);
            web.Features.Add(new Guid("6a1373d3-1a6d-44e4-95f0-e72cba3a953f"), true);
            //Actions
            web.Features.Add(new Guid("34bb41fe-109f-4b83-bc0e-d5143bf556f9"), true);
        }


        // Uncomment the method below to handle the event raised before a feature is deactivated.

        //public override void FeatureDeactivating(SPFeatureReceiverProperties properties)
        //{
        //}


        // Uncomment the method below to handle the event raised after a feature has been installed.

        //public override void FeatureInstalled(SPFeatureReceiverProperties properties)
        //{
        //}


        // Uncomment the method below to handle the event raised before a feature is uninstalled.

        //public override void FeatureUninstalling(SPFeatureReceiverProperties properties)
        //{
        //}

        // Uncomment the method below to handle the event raised when a feature is upgrading.

        //public override void FeatureUpgrading(SPFeatureReceiverProperties properties, string upgradeActionName, System.Collections.Generic.IDictionary<string, string> parameters)
        //{
        //}
    }
}
