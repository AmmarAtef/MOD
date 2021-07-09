using System;

namespace MODBussiness
{
    public class RequestEntity
    {
        public string RequestId { get; set; }
        public DateTime RequestDate { get; set; }
        public DateTime RequestCreationDate { get; set; }
        public string RequestType { get; set; }
        public int CreatedByUserID { get; set; }

        public string SupervisorStatus { get; set; }
        public string SecurityStatus { get; set; }

    }
}
