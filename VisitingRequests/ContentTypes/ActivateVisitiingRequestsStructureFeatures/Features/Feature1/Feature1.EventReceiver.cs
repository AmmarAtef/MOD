using System;
using System.Runtime.InteropServices;
using System.Security.Permissions;
using Microsoft.SharePoint;

namespace ActivateVisitiingRequestsStructureFeatures.Features.Feature1
{
    /// <summary>
    /// This class handles events raised during feature activation, deactivation, installation, uninstallation, and upgrade.
    /// </summary>
    /// <remarks>
    /// The GUID attached to this class may be used during packaging and should not be modified.
    /// </remarks>

    [Guid("81dbe256-72ae-406f-a799-1661aed88a23")]
    public class Feature1EventReceiver : SPFeatureReceiver
    {
        // Uncomment the method below to handle the event raised after a feature has been activated.

        public override void FeatureActivated(SPFeatureReceiverProperties properties)
        {
            SPWeb web = SPContext.Current.Web;
            //Requests Lists
            web.Features.Add(new Guid("52254804-39b2-4528-b2eb-991ee8fb2aec"), true);
            web.Features.Add(new Guid("3d5901dc-7586-4773-9708-50b43a87d5e4"), true);
            //Persons Lists
            web.Features.Add(new Guid("0d395a81-5996-40ba-883d-815e32d835c3"), true);
            web.Features.Add(new Guid("cda32553-6841-46d8-9595-c4e2c1fca1d7"), true);
            web.Features.Add(new Guid("c34e91ac-1150-4b2f-90ae-109a86b570b2"), true);
            web.Features.Add(new Guid("7b685250-c5af-45f7-adf8-d05095e2db81"), true);
            //Machines Lists
            web.Features.Add(new Guid("237f5f02-78fc-4fb9-b137-67e928598a46"), true);
            web.Features.Add(new Guid("43171381-fe24-4d2f-b0a0-7313ce9a177f"), true);
            //SupervisorVisitingRequestStatus
            web.Features.Add(new Guid("88030790-a2de-459e-bb4c-9137919cd60a"), true);
            //SecurityVisitingRequestStatus
            web.Features.Add(new Guid("a1223bc8-d277-471c-a072-bd5835bd847e"), true);
            //PersonsInOut
            web.Features.Add(new Guid("025f3adb-0321-472c-814e-3963b6ce71f3"), true);
            //DevicesInOut
            web.Features.Add(new Guid("d5d4390f-392e-4185-94bb-dc6372e9e978"), true);

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
