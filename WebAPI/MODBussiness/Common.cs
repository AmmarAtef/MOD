using Microsoft.Office.Server.UserProfiles;
using Microsoft.SharePoint;
using MODBussiness;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Configuration;

namespace MotBussiness
{
    public class Common
    {
        public static string LogFilePath
        {
            get
            {
                return (ConfigurationManager.AppSettings["LogFilePath"] != null) ?
                ConfigurationManager.AppSettings["LogFilePath"].ToString() : "";
            }


        }
        public static string BaseUrl
        {
            get
            {
                return (ConfigurationManager.AppSettings["BaseUrl"] != null) ?
                ConfigurationManager.AppSettings["BaseUrl"].ToString() : "";
            }
        }

        public static string CommonWebUrl
        {
            get
            {
                return (ConfigurationManager.AppSettings["CommonWebUrl"] != null) ?
                ConfigurationManager.AppSettings["CommonWebUrl"].ToString() : "";
            }
        }

        public static string VisitsRequestsWebURL
        {
            get
            {
                return (ConfigurationManager.AppSettings["VisitsRequestsWebURL"] != null) ?
                ConfigurationManager.AppSettings["VisitsRequestsWebURL"].ToString() : "";
            }
        }

        public static string DevicesRequestsWebURL
        {
            get
            {
                return (ConfigurationManager.AppSettings["DevicesRequestsWebURL"] != null) ?
                ConfigurationManager.AppSettings["DevicesRequestsWebURL"].ToString() : "";
            }
        }

        public static string MaterialsRequestsWebURL
        {
            get
            {
                return (ConfigurationManager.AppSettings["MaterialsRequestsWebURL"] != null) ?
                ConfigurationManager.AppSettings["MaterialsRequestsWebURL"].ToString() : "";
            }
        }

        public static void WriteLog(string LogText)
        {

            if (File.Exists(LogFilePath))
            {
                File.SetAttributes(LogFilePath, FileAttributes.Normal);
            }

            FileStream fs = new FileStream(LogFilePath, FileMode.Append);
            StreamWriter sr = new StreamWriter(fs);


            sr.WriteLine(DateTime.Now.ToString() + " " + LogText);
            sr.WriteLine("===========");

            sr.Close();
            fs.Close();
        }

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

        public static string[] GetApplicantData()
        {
            string[] applicantData = new string[4];

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

                        string nameKey = Common.GetObjectProperty(WebConfigurationManager.AppSettings["ADNameAttributeKeyName"]);
                        string positionKey = Common.GetObjectProperty(WebConfigurationManager.AppSettings["ADPositionAttributeKeyName"]);
                        string departmentKey = Common.GetObjectProperty(WebConfigurationManager.AppSettings["ADDepartmentAttributeKeyName"]);
                        string sectionKey = Common.GetObjectProperty(WebConfigurationManager.AppSettings["ADSectionFieldAttributeName"]);


                        if (!string.IsNullOrEmpty(userProfile[departmentKey].ToString()))
                        {
                            if (nameKey != "")
                            {
                                string[] nameParts = nameKey.Split(';');
                                if (nameParts != null && nameParts.Length > 0)
                                {
                                    foreach (string item in nameParts)
                                    {
                                        if (userProfile[item] != null)
                                            applicantData[0] += userProfile[item].ToString() + " ";
                                    }
                                }
                            }


                            if (userProfile[positionKey] != null)
                                applicantData[1] = userProfile[positionKey].ToString();



                            if (userProfile[departmentKey] != null)
                                applicantData[2] = userProfile[departmentKey].ToString();

                            if (userProfile[sectionKey] != null)
                                applicantData[3] = userProfile[sectionKey].ToString();
                        }
                    }
                    catch (Exception ex)
                    {
                        NNewLogMethod.LogException(ex);
                    }

                });
            }
            return applicantData;
        }

        public static void SendStatusInResponseHeader(dynamic response, GeneralResponse generalResponse)
        {
            try
            {
                if (generalResponse != null)
                {
                    response.Content.Headers.Add("StatusCode", generalResponse.StatusCode.ToString());
                    response.Content.Headers.Add("Access-Control-Expose-Headers", "StatusCode");
                    if (!string.IsNullOrEmpty(generalResponse.Message))
                    {
                        response.Content.Headers.Add("StatusMessage", generalResponse.Message.ToString());
                        response.Content.Headers.Add("Access-Control-Expose-Headers", "StatusMessage");
                    }
                }
            }
            catch (Exception ex)
            {
                NNewLogMethod.LogException(ex);
            }
        }
    }
}
