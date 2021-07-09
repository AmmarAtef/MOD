using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MotBussiness
{
    public class ResponseBase
    {
        public int statusCode { get; set; }
        public string statusMessage { get; set; }
    }
}
