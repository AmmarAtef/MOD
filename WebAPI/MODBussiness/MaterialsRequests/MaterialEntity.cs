using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MotBussiness
{
    public class MaterialEntity
    {
        public int ID { get; set; }
        //0 nothing ,1 newly addedm 2 updated, 3 deleted
        public int State { get; set; }
        public int ReqID { get; set; }
        public String MaterialName { get; set; }
        public int Quantity { get; set; }
        public String Notes { get; set; }
        public string ItemIsApproved { get; set; }

        public bool IsDeleted { get; set; }

        public List<MaterialActionEntity> MaterialActions { get; set; }
        public MaterialEntity()
        {
            MaterialActions = new List<MaterialActionEntity>();
        }

    }
}
