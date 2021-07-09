using System;

namespace MotBussiness
{
    public class MaterialActionEntity
    {
        public int MaterialID { get; set; }
        public DateTime ActionDate { get; set; }
        public string ActionNotes { get; set; }
        public DateTime Created { get; set; }
        public string ActionDoneByName { get; set; }
    }
}
