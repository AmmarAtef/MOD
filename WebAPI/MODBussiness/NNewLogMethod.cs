using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;
using System.Configuration;
using System.IO;
using System.Reflection;
using System.Diagnostics; 

namespace MotBussiness
{
    public class NNewLogMethod
    {
        #region Initialize


        public static string LogFilePath
        {
            get
            {
                return (ConfigurationManager.AppSettings["LogFilePath"] != null) ?
                ConfigurationManager.AppSettings["LogFilePath"].ToString() : "";
            }


        }

        // private static string strLog_Folder = @"c:\LogFolder\"; //System.Configuration.ConfigurationSettings.AppSettings["Log_Folder"].ToString();


        #region Enum Method status
        public enum status
        {
            Start, End
        }
        #endregion
        #endregion

        #region Log Method Entrance and Exit



        #region Get Log (LogMethodEntranceExit()) Message

        private static string LogMethodEntranceExitMessage(string status)
        {
            string strLogNormalMessage = "";

            try
            {
                //to get the class name and the method name in which the exception occured
                StackTrace oStackTrace = new StackTrace();
                StackFrame oStackFrame = oStackTrace.GetFrame(3);
                MethodBase oMethodBase = oStackFrame.GetMethod();

                strLogNormalMessage += "Class : " + oMethodBase.ReflectedType.FullName + "\r\n";
                strLogNormalMessage += "Method : " + oMethodBase.Name + "\r\n";
                strLogNormalMessage += "Status : " + status + "\r\n";
                strLogNormalMessage += "Date : " + DateTime.Now.ToString("dd/MM/yyyy") + "\r\n";
                strLogNormalMessage += "Time : " + DateTime.Now.ToString("HH:mm:ss") + "\r\n\r\n\r\n";

                return strLogNormalMessage;
            }
            catch
            {
                return strLogNormalMessage;
            }
        }
        #endregion

        #endregion

        #region Log Exception
        #region Log Exception

        public static void LogException(System.Exception ex)
        {
            try
            {

                LogExceptionInTextFile(ex);

            }
            catch
            {

            }
        }
        #endregion

        #region Log Exception In Text File

        private static void LogExceptionInTextFile(System.Exception ex)
        {
            try
            {

                //if (!Directory.Exists(AppDomain.CurrentDomain.BaseDirectory +@"\\LogFolder\"))
                //{

                //    Directory.CreateDirectory(AppDomain.CurrentDomain.BaseDirectory + @"\\LogFolder\");
                //}

                if (File.Exists(LogFilePath))
                {
                    File.SetAttributes(LogFilePath, FileAttributes.Normal);
                }

                // formate the file name to be in the form "Log_" + day +  mounth + year (Log_12022007)
                //string strFilePath = AppDomain.CurrentDomain.BaseDirectory + @"\\LogFolder\" + "Log_" + DateTime.Now.ToString("ddMMyyyy") + ".txt";

                string strFilePath = LogFilePath + "Log_" + DateTime.Now.ToString("ddMMyyyy") + ".txt";

                FileStream oFileStream = File.OpenWrite(strFilePath);
                oFileStream.Seek(0, SeekOrigin.End);

                //get the exception error message ( in our custom formate )
                string strErrorMessage = NNewLogMethod.GetErrorMessage(ex);

                byte[] arrData = null;
                arrData = UTF8Encoding.UTF8.GetBytes(strErrorMessage);
                oFileStream.Write(arrData, 0, arrData.Length);
                oFileStream.Close();
            }
            catch
            {

            }
        }
        #endregion



        #region Get Error Message

        public static string GetErrorMessage(System.Exception ex)
        {
            string strErrorMessage = "";

            try
            {

                StackTrace oStackTrace = new StackTrace();
                StackFrame oStackFrame = oStackTrace.GetFrame(3);
                MethodBase oMethodBase = oStackFrame.GetMethod();
                strErrorMessage += "User : " + System.Security.Principal.WindowsIdentity.GetCurrent().Name + "\r\n";
                strErrorMessage += "Class : " + oMethodBase.ReflectedType.FullName + "\r\n";
                strErrorMessage += "Method : " + oMethodBase.Name + "\r\n";
                strErrorMessage += "Date : " + DateTime.Now.ToString("dd/MM/yyyy") + "\r\n";
                strErrorMessage += "Time : " + DateTime.Now.ToString("HH:mm:ss") + "\r\n";
                strErrorMessage += "Error:\r\n";               

                strErrorMessage +=  GetInnerExceptionErrorMessage(ex) + "\r\nError Details : \r\n";
                strErrorMessage += ex.StackTrace + "\r\n\r\n\r\n";

                return strErrorMessage;
            }
            catch
            {
                return strErrorMessage;
            }
        }

        public static string GetInnerExceptionErrorMessage(Exception ex)
        {
            string errorMessage = "";
            if (ex.InnerException == null)
            { 
                errorMessage = ex.Message;
                return errorMessage;
            }
            return GetInnerExceptionErrorMessage(ex.InnerException);
        }
        #endregion
        #endregion
    }
}
