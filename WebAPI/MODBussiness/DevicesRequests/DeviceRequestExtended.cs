using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MotBussiness
{
    public class DeviceRequestExtended : DevicesRequestEntity
    {
        public int RequestID { get; set; }      
        public String DeviceType { get; set; }
        public String DeviceNumber { get; set; }
        public String ManufacturingCompanyName { get; set; }
        public string ItemsCount { get; set; }

        public String NotesAboutDevice { get; set; }
        public string IsItemApproved { get; set; }

    }
}
