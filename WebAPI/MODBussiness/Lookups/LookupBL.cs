using Microsoft.SharePoint;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MotBussiness
{
    public class LookupBL
    {
        public List<LookupEntity> GetDepartmentsList()
        {
            List<LookupEntity> lookups = new List<LookupEntity>();
            try
            {
                SPSecurity.RunWithElevatedPrivileges(() =>
                {
                    using (SPSite Site = new SPSite(Common.BaseUrl))
                    {
                        using (SPWeb oWeb = Site.OpenWeb(Common.CommonWebUrl))
                        {
                            SPList DepartmentList = oWeb.Lists["Departments"];

                            foreach (SPListItem item in DepartmentList.Items)
                            {
                                lookups.Add(new LookupEntity() { ID = item.ID, Code = item["DepartmentCode"].ToString(), Title = item.Title });
                            }
                        }
                    }
                });
            }
            catch (Exception ex)
            {
                NNewLogMethod.LogException(ex);
            }
            return lookups;
        }

        public List<LookupEntity> GetGatesList()
        {
            List<LookupEntity> lookups = new List<LookupEntity>();
            try
            {
                SPSecurity.RunWithElevatedPrivileges(() =>
                {
                    using (SPSite Site = new SPSite(Common.BaseUrl))
                    {
                        using (SPWeb oWeb = Site.OpenWeb(Common.CommonWebUrl))
                        {
                            SPList GatesList = oWeb.Lists["Gates"];

                            foreach (SPListItem item in GatesList.Items)
                            {
                                lookups.Add(new LookupEntity() { ID = item.ID, Title = item.Title });
                            }
                        }
                    }
                });
            }
            catch (Exception ex)
            {
                NNewLogMethod.LogException(ex);
            }
            return lookups;
        }

        public List<SectionEntity> GetAllSections()
        {
            List<SectionEntity> lookups = new List<SectionEntity>();
            try
            {
                SPSecurity.RunWithElevatedPrivileges(() =>
                {
                    using (SPSite Site = new SPSite(Common.BaseUrl))
                    {
                        using (SPWeb oWeb = Site.OpenWeb(Common.CommonWebUrl))
                        {
                            SPList SectionsList = oWeb.Lists["Sections"];
                            SPList DepartmentList = oWeb.Lists["Departments"];

                            lookups = (from SPListItem Section in SectionsList.Items.Cast<SPListItem>()
                                      join Department in DepartmentList.Items.Cast<SPListItem>() on new SPFieldLookupValue(Section["DepCode"].ToString()).LookupId equals Department.ID
                                       select new SectionEntity
                                      {
                                          ID = Section.ID,
                                          SectionCode = Section["SectionCode"].ToString(),
                                          DepartmentCode = Department["DepartmentCode"].ToString(),
                                          Title = Section["SectionName"].ToString()
                                      }).ToList<SectionEntity>();
                        }
                    }
                });
            }
            catch (Exception ex)
            {
                NNewLogMethod.LogException(ex);
            }
            return lookups;
        }
        public List<LookupEntity> GetSectionsList(string departmentCode)
        {
            List<LookupEntity> lookups = new List<LookupEntity>();
            try
            {
                SPSecurity.RunWithElevatedPrivileges(() =>
                {
                    using (SPSite Site = new SPSite(Common.BaseUrl))
                    {
                        using (SPWeb oWeb = Site.OpenWeb(Common.CommonWebUrl))
                        {
                            SPList DepartmentList = oWeb.Lists["Departments"];
                            SPList SectionsList = oWeb.Lists["Sections"];

                            SPQuery query = new SPQuery();
                            query.Query = @"<Where><Eq><FieldRef Name='DepartmentCode'/><Value Type='Text'>" + departmentCode + "</Value></Eq></Where>";
                            int DepartmentID = 0;
                            SPListItemCollection itemColl = DepartmentList.GetItems(query);
                            if (itemColl != null)
                            {
                                foreach (SPListItem item in itemColl)
                                {
                                    DepartmentID = item.ID;
                                    break;
                                }
                            }

                            query = new SPQuery();
                            query.Query = @"<Where><Eq><FieldRef Name='DepCode' LookupId='TRUE'/><Value Type='Integer'>" + DepartmentID + "</Value></Eq></Where>";
                            SPListItemCollection sectionsitemColl = SectionsList.GetItems(query);
                            if (sectionsitemColl != null)
                            {
                                foreach (SPListItem item in sectionsitemColl)
                                {
                                    lookups.Add(new LookupEntity() { ID = item.ID, Code = item["SectionCode"].ToString(), Title = item.Title });
                                }
                            }
                        }
                    }
                });
            }
            catch (Exception ex)
            {
                NNewLogMethod.LogException(ex);
            }
            return lookups;
        }

        public List<LookupEntity> GetStatusList()
        {
            List<LookupEntity> lookups = new List<LookupEntity>();
            try
            {
                SPSecurity.RunWithElevatedPrivileges(() =>
                {
                    using (SPSite Site = new SPSite(Common.BaseUrl))
                    {
                        using (SPWeb oWeb = Site.OpenWeb(Common.CommonWebUrl))
                        {
                            SPList StatusList = oWeb.Lists["Status"];

                            foreach (SPListItem item in StatusList.Items)
                            {
                                lookups.Add(new LookupEntity() { ID = item.ID, Code = Common.GetObjectProperty(item["StatusCode"]), Type = Common.GetObjectProperty(item["StatusType"]), Title = item.Title });
                            }
                        }
                    }
                });
            }
            catch (Exception ex)
            {
                NNewLogMethod.LogException(ex);
            }
            return lookups;
        }

        public string GetDepartmentNameByCode(string departmentCode)
        {
            string departmentName = "";
            try
            {
                SPSecurity.RunWithElevatedPrivileges(() =>
                {
                    using (SPSite Site = new SPSite(Common.BaseUrl))
                    {
                        using (SPWeb oWeb = Site.OpenWeb(Common.CommonWebUrl))
                        {
                            SPList DepartmentList = oWeb.Lists["Departments"];

                            SPQuery query = new SPQuery();
                            query.Query = @"<Where><Eq><FieldRef Name='DepartmentCode'/><Value Type='Text'>" + departmentCode + "</Value></Eq></Where>";
                            SPListItemCollection itemColl = DepartmentList.GetItems(query);
                            if (itemColl != null)
                            {
                                foreach (SPListItem item in itemColl)
                                {
                                    departmentName = item.Title;
                                    break;
                                }
                            }
                        }
                    }
                });
            }
            catch (Exception ex)
            {
                NNewLogMethod.LogException(ex);
            }
            return departmentName;
        }

        public string GetSectionNameByDeptartmentCodeAndSection(string departmentCode, string sectionCode)
        {
            string sectionName = "";
            try
            {
                SPSecurity.RunWithElevatedPrivileges(() =>
                {
                    using (SPSite Site = new SPSite(Common.BaseUrl))
                    {
                        using (SPWeb oWeb = Site.OpenWeb(Common.CommonWebUrl))
                        {
                            SPList DepartmentList = oWeb.Lists["Departments"];
                            SPList SectionsList = oWeb.Lists["Sections"];

                            SPQuery query = new SPQuery();
                            query.Query = @"<Where><Eq><FieldRef Name='DepartmentCode'/><Value Type='Text'>" + departmentCode + "</Value></Eq></Where>";
                            int DepartmentID = 0;
                            SPListItemCollection itemColl = DepartmentList.GetItems(query);
                            if (itemColl != null)
                            {
                                foreach (SPListItem item in itemColl)
                                {
                                    DepartmentID = item.ID;
                                    break;
                                }
                            }

                            query = new SPQuery();
                            query.Query = @"<Where><And><Eq><FieldRef Name='DepCode' LookupId='TRUE'/><Value Type='Integer'>" + DepartmentID + "</Value></Eq><Eq><FieldRef Name='SectionCode'/><Value Type='Text'>" + sectionCode + "</Value></Eq></And></Where>";
                            SPListItemCollection sectionsitemColl = SectionsList.GetItems(query);
                            if (sectionsitemColl != null)
                            {
                                foreach (SPListItem item in sectionsitemColl)
                                {
                                    sectionName = item.Title;
                                    break;
                                }
                            }
                        }
                    }
                });
            }
            catch (Exception ex)
            {
                NNewLogMethod.LogException(ex);
            }
            return sectionName;
        }

        public string GetStatusNameByCodeAndType(string statusCode, string statusType)
        {
            string statusName = "";
            try
            {
                SPSecurity.RunWithElevatedPrivileges(() =>
                {
                    using (SPSite Site = new SPSite(Common.BaseUrl))
                    {
                        using (SPWeb oWeb = Site.OpenWeb(Common.CommonWebUrl))
                        {
                            SPList StatusList = oWeb.Lists["Status"];

                            SPQuery query = new SPQuery();
                            query = new SPQuery();
                            query.Query = @"<Where><And><Eq><FieldRef Name='StatusCode'/><Value Type='Text'>" + statusCode + "</Value></Eq><Eq><FieldRef Name='StatusType'/><Value Type='Text'>" + statusType + "</Value></Eq></And></Where>";
                            SPListItemCollection statusItemColl = StatusList.GetItems(query);
                            if (statusItemColl != null)
                            {
                                foreach (SPListItem item in statusItemColl)
                                {
                                    statusName = item.Title;
                                    break;
                                }
                            }
                        }
                    }
                });
            }
            catch (Exception ex)
            {
                NNewLogMethod.LogException(ex);
            }
            return statusName;
        }
    }
}

