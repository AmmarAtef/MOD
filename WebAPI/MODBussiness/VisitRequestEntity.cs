using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MotBussiness
{
   public class VisitRequestEntity
    {
        public string VisitMessage { get; set; }
        public int ID { get; set; }
        public DateTime VisitStartDate { get; set; }
        public DateTime VisitEndDate { get; set; }
        public DateTime RequestDate { get; set; }
        public int VisitReason { get; set; }
        public string VisitReasonValue { get; set; }
        public string UserName { get; set; }
        public string ApplicantRank { get; set; }
        public string ApplicantAdministration { get; set; }
        public string ApplicantSection { get; set; }
        public string Gate { get; set; }
        public string SuperVisorState { get; set; }
        public string SecuertyState { get; set; }
        public string SuperVisiorNote { get; set; }
        public string SecurityNote { get; set; }
        public int Nationality { get; set; }
        public string UserIdentyID { get; set; }
        public string VisitTime { get; set; }

        public bool ISDeleted { get; set; }
        public string CreateBy { get; set; }

        public string ApprovedBySupervisorName { get; set; }
        public string ApprovedBySecurityName { get; set; }


        public List<VisitPersonsEntity> VisitPersons { get; set; }

        public VisitRequestEntity()
        {
            VisitPersons = new List<VisitPersonsEntity>();
        }
    }
}
