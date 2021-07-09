namespace MODBussiness
{
    public class GeneralResponse
    {
        public int StatusCode { get; set; }
        public string LogMessage { get; set; }
        public string Message { get; set; }
        public object ReturnData { get; set; }
        public long RecordsCount { get; set; }
    }

}
