using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MotBussiness
{
    public class SearchRequestOutPut
    {
        public int RequestID { get; set; }
        public DateTime RequestCreatedDate { get; set; }
        public DateTime VisitDate { get; set; }
        public string ApplicantName { get; set; }
        public string FirstName { get; set; }
        public string FatherName { get; set; }
        public string FamilyName { get; set; }

        public string LastName { get; set; }
        public int Nationality { get; set; }
        public string NationalityValue { get; set; }
        public string UserIdentyID { get; set; }
        public int UserIdentyType { get; set; }
        public string UserIdentyTypeValue { get; set; }

        public string ItemIsApproved { get; set; }

        public string SecurityStatus { get; set; }
        public string SupervisorStatus { get; set; }
        public string ApplicantAdministration { get; set; }
        public string ApplicantSection { get; set; }
        public DateTime CreateDate { get; set; }
        
        public int CreaatedByID { get; set; }
        //--------------------------------
        //public string UserName { get; set; }
        //public string ApplicantAdministration { get; set; }
        //public string ApplicantRank  { get; set; }
        //public DateTime VisitEndDate  { get; set; }
        //public string VisitMessage  { get; set; }
        //public string VisitReasonValue  { get; set; }
        //public int VisitReason { get; set; }
        //public DateTime VisitStartDate  { get; set; }
        //public string ApplicantSection  { get; set; }
        //public string SupervisorStatus  { get; set; }
        //public string SupervisorApprovalNote { get; set; }
        //public string SecurityStatus  { get; set; }
        //public string SecurityApprovalNote  { get; set; }
        //public int CreatedByID  { get; set; }                                                                  
    }
}
