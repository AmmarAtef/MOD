﻿using System;
using System.Collections.Generic;

namespace MotBussiness
{
    public class DevicesRequestEntity
    {
        public int RequestType { get; set; }
        public string RequestMessage { get; set; }
        public int ID { get; set; }
        public DateTime DevicesRequestDate { get; set; }

        public string SupervisorName { get; set; }
        public string IdentityNumber { get; set; }
        public string WorkingPlace { get; set; }

        public string ApplicantName { get; set; }
        public string ApplicantRank { get; set; }
        public string ApplicantAdministration { get; set; }
        public string ApplicantSection { get; set; }
        public string Gate { get; set; }
        public string SupervisorStatus { get; set; }
        public string SecurityStatus { get; set; }
        public string SupervisiorNote { get; set; }
        public string SecurityNote { get; set; }
        public DateTime CreationDate { get; set; }
        public int CreatedByUserId { get; set; }
        public String ActionTime { get; set; }

        public bool IsDeleted { get; set; }

        public string ApprovedBySupervisorName { get; set; }
        public string ApprovedBySecurityName { get; set; }

        public List<MachineEntity> RequestMachines { get; set; }

        public DevicesRequestEntity()
        {
            RequestMachines = new List<MachineEntity>();
        }
    }
}
