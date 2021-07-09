using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MotBussiness
{
    public class MachineEntity
    {
        public int ID { get; set; }
        //0 nothing ,1 newly addedm 2 updated, 3 deleted
        public int State { get; set; }
        public int ReqID { get; set; }
        public String DeviceType { get; set; }
        public String DeviceNumber { get; set; }
        public String ManufacturingCompanyName { get; set; }
        public String NotesAboutDevice { get; set; }
        public string ItemIsApproved { get; set; }

        public string ItemsCount { get; set; }

        public bool IsDeleted { get; set; }

        public List<MachineActionEntity> MachineActions { get; set; }
        public MachineEntity()
        {
            MachineActions = new List<MachineActionEntity>();
        }

    }
}
