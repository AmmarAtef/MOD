using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MotBussiness
{
    public class  PersonCheckInOutEntity
    {
        public int ApprovedPersonID { get; set; }
        public DateTime CheckIN { get; set; }
        public DateTime? CheckOut { get; set; }
        public string CheckInNotes { get; set; }
        public string CheckOutNotes { get; set; }

        public DateTime Created { get; set; }
        public string ActionDoneByName { get; set; }
        public string ActionModifiedByName { get; set; }

    }

    public class DevicecCheckInOutEntity
    {
        public int DeviceID { get; set; }
        public DateTime DeviceCheckIn { get; set; }
        public DateTime? DeviceCheckOut { get; set; }
        public string DeviceCheckInNote { get; set; }
        public string DeviceCheckOutNote { get; set; }
        public DateTime Created { get; set; }



    }
}
