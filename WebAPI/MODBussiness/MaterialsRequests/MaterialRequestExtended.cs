using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MotBussiness
{
    public class MaterialRequestExtended : MaterialsRequestEntity
    {
        public int RequestID { get; set; }      
        public String MaterialName { get; set; }
        public String Quantity { get; set; }
        public String Notes { get; set; }
        public string IsItemApproved { get; set; }
        public string ApprovedBySupervisorName { get; set; }
        public string ApprovedBySecurityName { get; set; }
    }
}
