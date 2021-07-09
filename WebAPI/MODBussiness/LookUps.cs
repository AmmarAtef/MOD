using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MotBussiness
{
    public class LookUps
    {
        public string Title { get; set; }
        public int ID { get; set; }
    }

    public class LoopUpList
    {
        public List<LookUps> GatesList { get; set; }
        public List<LookUps> IdentityList { get; set; }
        public List<LookUps> NationalityList { get; set; }
        public List<LookUps> VisitingReasonsList { get; set; }
        public LoopUpList()
        {
            GatesList = new List<LookUps>();
            IdentityList = new List<LookUps>();
            NationalityList = new List<LookUps>();
            VisitingReasonsList = new List<LookUps>();
        }
    }
}
