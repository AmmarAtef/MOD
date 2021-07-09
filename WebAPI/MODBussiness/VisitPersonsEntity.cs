using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MotBussiness
{
    public class VisitPersonsEntity
    {
        public int ID { get; set; }
        public int ReqID { get; set; }
        
        public string FirstName { get; set; }
        public string FatherName { get; set; }
        public string FamilyName { get; set; }
        public string LastName { get; set; }

        //0 nothing ,1 newly addedm 2 updated, 3 deleted
        public int State { get; set; }
        public int Nationality { get; set; }
        public string NationalityValue { get; set; }
        public int IdentityType { get; set; }
        public string IdentityTypeValue { get; set; }
        public string IdentityNumber { get; set; }
        public string WorkingPlace { get; set; }
        public bool IsDeleted { get; set; }

        public string ItemIsApproved { get; set; }
        public List<VisitDevicesEntity> VisitDevices { get; set; }
        //public List<VisitDevicesEntity> ApprovedVisitDevices { get; set; }
        public List<PersonCheckInOutEntity> PersonCheckInOuts { get; set; }

        public VisitPersonsEntity()
        {
            VisitDevices = new List<VisitDevicesEntity>();
            //ApprovedVisitDevices = new List<VisitDevicesEntity>();
            PersonCheckInOuts = new List<PersonCheckInOutEntity>();
        }

    }
}
