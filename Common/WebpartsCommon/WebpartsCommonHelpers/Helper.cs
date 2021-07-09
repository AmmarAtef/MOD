using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;
using System.Configuration;
using System.IO;
using System.Reflection;
using System.Diagnostics;
using System.Web.Configuration;
using Microsoft.SharePoint;
using Microsoft.Office.Server.UserProfiles;
using Microsoft.SharePoint.Utilities;

namespace WebpartsCommonHelpers
{
    public class Helper
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
                string strErrorMessage = Helper.GetErrorMessage(ex);

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

                strErrorMessage += GetInnerExceptionErrorMessage(ex) + "\r\nError Details : \r\n";
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

        #region Helpers
        public static string GetObjectProperty(object property)
        {
            string prop = "";
            if (property != null)
                prop = property.ToString();
            return prop;
        }

        public static string[] GetSiteSettings(string requestsWebURLKey)
        {
            string[] settings = new string[2];
            if (WebConfigurationManager.AppSettings["APIRootURL"] != null)
                settings[0] = WebConfigurationManager.AppSettings["APIRootURL"].ToString();
            else
                settings[0] = SPContext.Current.Web.Url;

            if (WebConfigurationManager.AppSettings[requestsWebURLKey] != null)
                settings[1] = WebConfigurationManager.AppSettings[requestsWebURLKey].ToString();
            else
                settings[1] = SPContext.Current.Web.Url;
            return settings;
        }

        //public static string[] GetApplicantData()
        //{
        //    string[] applicantData = new string[4];

        //    var result = new Dictionary<string, object>();
        //    using (SPSite site = new SPSite(SPContext.Current.Site.Url))
        //    {
        //        SPSecurity.RunWithElevatedPrivileges(delegate ()
        //        {
        //            try
        //            {
        //                SPServiceContext context = SPServiceContext.GetContext(site);
        //                UserProfileManager profileManager = new UserProfileManager(context);

        //                UserProfile userProfile = profileManager.GetUserProfile(SPContext.Current.Web.CurrentUser.LoginName);

        //                string nameKey = Helper.GetObjectProperty(WebConfigurationManager.AppSettings["ADNameAttributeKeyName"]);
        //                string positionKey = Helper.GetObjectProperty(WebConfigurationManager.AppSettings["ADPositionAttributeKeyName"]);
        //                string departmentKey = Helper.GetObjectProperty(WebConfigurationManager.AppSettings["ADDepartmentAttributeKeyName"]);
        //                string sectionKey = Helper.GetObjectProperty(WebConfigurationManager.AppSettings["ADSectionFieldAttributeName"]);


        //                if (!string.IsNullOrEmpty(userProfile[departmentKey].ToString()))
        //                {
        //                    if (nameKey != "")
        //                    {
        //                        string[] nameParts = nameKey.Split(';');
        //                        if (nameParts != null && nameParts.Length > 0)
        //                        {
        //                            foreach (string item in nameParts)
        //                            {
        //                                if (userProfile[item] != null)
        //                                    applicantData[0] += userProfile[item].ToString() + " ";
        //                            }
        //                        }
        //                    }


        //                    if (userProfile[positionKey] != null)
        //                        applicantData[1] = userProfile[positionKey].ToString();



        //                    if (userProfile[departmentKey] != null)
        //                        applicantData[2] = userProfile[departmentKey].ToString();

        //                    if (userProfile[sectionKey] != null)
        //                        applicantData[3] = userProfile[sectionKey].ToString();
        //                }
        //            }
        //            catch (Exception ex)
        //            {
        //                Helper.LogException(ex);
        //            }

        //        });
        //    }
        //    return applicantData;
        //}

        public static UserData GetApplicantData()
        {
            UserData applicantData = new UserData();

            var result = new Dictionary<string, object>();
            using (SPSite site = new SPSite(SPContext.Current.Site.Url))
            {
                SPSecurity.RunWithElevatedPrivileges(delegate ()
                {
                    try
                    {
                        SPServiceContext context = SPServiceContext.GetContext(site);
                        UserProfileManager profileManager = new UserProfileManager(context);

                        UserProfile userProfile = profileManager.GetUserProfile(SPContext.Current.Web.CurrentUser.LoginName);

                        string nameKey = Helper.GetObjectProperty(WebConfigurationManager.AppSettings["ADNameAttributeKeyName"]);
                        string positionKey = Helper.GetObjectProperty(WebConfigurationManager.AppSettings["ADPositionAttributeKeyName"]);
                        string departmentKey = Helper.GetObjectProperty(WebConfigurationManager.AppSettings["ADDepartmentAttributeKeyName"]);
                        string sectionKey = Helper.GetObjectProperty(WebConfigurationManager.AppSettings["ADSectionFieldAttributeName"]);


                        if (userProfile[positionKey] != null && userProfile[positionKey].Value != null)
                            applicantData.Position = userProfile[positionKey].Value.ToString();



                        if (userProfile[departmentKey] != null && userProfile[departmentKey].Value != null)
                            applicantData.Department = userProfile[departmentKey].Value.ToString();

                        if (userProfile[sectionKey] != null && userProfile[sectionKey].Value != null)
                            applicantData.Section = userProfile[sectionKey].Value.ToString();

                        if (nameKey != "")
                        {
                            string[] nameParts = nameKey.Split(';');
                            if (nameParts != null && nameParts.Length > 0)
                            {
                                foreach (string item in nameParts)
                                {
                                    if (userProfile[item] != null && userProfile[item].Value != null)
                                        applicantData.Name += userProfile[item].Value.ToString() + " ";
                                }
                            }
                        }

                    }
                    catch (Exception ex)
                    {
                        Helper.LogException(ex);
                    }

                });
            }
            return applicantData;
        }

        public static string GetResourceText(string resourceFileName, string resourceKey)
        {
            string resourceString = "";
            resourceString = SPUtility.GetLocalizedString("$Resources:" + resourceFileName + ", " + resourceKey, resourceFileName, SPContext.Current.Web.Language);
            return resourceString;
        }

        public static string GetUserMissingData(UserData applicantData)
        {
            string errorMessage = "";
            if (string.IsNullOrEmpty(applicantData.Name))
            {
                errorMessage += GetResourceText("MODCommon", "Name") + "<br />";
            }
            if (string.IsNullOrEmpty(applicantData.Position))
            {
                errorMessage += GetResourceText("MODCommon", "Position") + "<br />";
            }

            if (string.IsNullOrEmpty(applicantData.Department))
            {
                errorMessage += GetResourceText("MODCommon", "Department") + "<br />";
            }

            if (string.IsNullOrEmpty(applicantData.Section))
            {
                errorMessage += GetResourceText("MODCommon", "Section") + "<br />";
            }

            return errorMessage;
        }

        public static bool IsUserDataCompleted(UserData applicantData)
        {
            if (!string.IsNullOrEmpty(applicantData.Name) && !string.IsNullOrEmpty(applicantData.Position) && !string.IsNullOrEmpty(applicantData.Department) && !string.IsNullOrEmpty(applicantData.Section))
                return true;
            else
                return false;

        }

        #endregion
    }
}
