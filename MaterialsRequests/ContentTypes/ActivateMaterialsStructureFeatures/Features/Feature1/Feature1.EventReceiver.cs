using System;
using System.Runtime.InteropServices;
using System.Security.Permissions;
using Microsoft.SharePoint;

namespace ActivateMaterialsStructureFeatures.Features.Feature1
{
    /// <summary>
    /// This class handles events raised during feature activation, deactivation, installation, uninstallation, and upgrade.
    /// </summary>
    /// <remarks>
    /// The GUID attached to this class may be used during packaging and should not be modified.
    /// </remarks>

    [Guid("da03e6aa-cb6c-4697-a585-af53c1d3182b")]
    public class Feature1EventReceiver : SPFeatureReceiver
    {
        // Uncomment the method below to handle the event raised after a feature has been activated.

        public override void FeatureActivated(SPFeatureReceiverProperties properties)
        {
            SPWeb web = SPContext.Current.Web;
            //Requests Lists
            web.Features.Add(new Guid("32288df6-4d5a-4fde-a739-d90616d377cb"), true);
            //Materials Lists
            web.Features.Add(new Guid("21fb68f5-3707-40ec-8aec-cb8b96c71471"), true);
            web.Features.Add(new Guid("b0b8a827-ec11-464b-9b19-e3160e6d38eb"), true);
            //Supervisor lists - SupervisorMaterialsRequestStatusCT Feature1
            web.Features.Add(new Guid("263a7245-cdd4-4bf6-801c-1b34bb9ba34b"), true);
            //Gates - SecurityMaterialsRequestStatusCT Feature1
            web.Features.Add(new Guid("f2907be6-db1a-4ebd-aaf9-b64f6c7fc176"), true);
            //MaterialActionsCT Feature1
            web.Features.Add(new Guid("1355e395-503a-49ac-8782-79c8251e22d4"), true);

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
