using Microsoft.SharePoint;
using MODBussiness;
using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.SharePoint.Client;
using SP = Microsoft.SharePoint.Client;


namespace MotBussiness
{
    public class DevicesRequestBL
    {
        public void GetLookUps(ref LoopUpList LoopUpList, string ProbName, SPListItemCollection listitems)
        {
            List<LookUps> lookups = new List<LookUps>();
            foreach (SPListItem item in listitems)
            {
                lookups.Add(new LookUps() { ID = item.ID, Title = item.Title });
            }
            typeof(LoopUpList).GetProperty(ProbName).SetValue(LoopUpList, lookups);
        }
        public DevicesRequestOutPut AddDeviceRequest(string listSiteUrl, DevicesRequestEntity devicesRequestEntity)
        {
            DevicesRequestOutPut devicesRequestOutPut = new DevicesRequestOutPut();
            int RequestID = 0;
            try
            {
                devicesRequestOutPut = ValidateRequestObject(devicesRequestEntity, ActionType.Add);
                if (devicesRequestOutPut.statusCode != (int)GeneralReturnValuesEnum.Success)
                    return devicesRequestOutPut;

                using (SPSite Site = new SPSite(Common.BaseUrl))
                {
                    using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                    {
                        SPList devicesRequestsList = oWeb.Lists["DevicesRequests"];
                        oWeb.AllowUnsafeUpdates = true;

                        SPListItem devicesRequestsItem = devicesRequestsList.Items.Add();
                        devicesRequestsItem["RequestType"] = devicesRequestEntity.RequestType;
                        devicesRequestsItem["Title"] = devicesRequestEntity.RequestMessage;
                        devicesRequestsItem["RequestMessage"] = devicesRequestEntity.RequestMessage;
                        devicesRequestsItem["DevicesRequestDate"] = devicesRequestEntity.DevicesRequestDate.AddDays(1);
                        devicesRequestsItem["ActionTime"] = devicesRequestEntity.ActionTime;
                        devicesRequestsItem["SupervisorName"] = devicesRequestEntity.SupervisorName;
                        devicesRequestsItem["IdentityNumber"] = devicesRequestEntity.IdentityNumber;
                        devicesRequestsItem["WorkingPlace"] = devicesRequestEntity.WorkingPlace;
                        devicesRequestsItem["ApplicantSection"] = devicesRequestEntity.ApplicantSection;
                        devicesRequestsItem["ApplicantRank"] = devicesRequestEntity.ApplicantRank;
                        devicesRequestsItem["ApplicantAdministration"] = devicesRequestEntity.ApplicantAdministration;
                        devicesRequestsItem["ApplicantName"] = devicesRequestEntity.ApplicantName;
                        devicesRequestsItem.Update();


                        RequestID = devicesRequestsItem.ID;

                        //int.Parse("dsadasdsa");

                        if (RequestID != 0)
                        {
                            SPList requestMachinesList = oWeb.Lists["DevicesRequestMachines"];
                            foreach (MachineEntity item in devicesRequestEntity.RequestMachines)
                            {
                                SPListItem requestMachinesListItem = requestMachinesList.Items.Add();
                                requestMachinesListItem["Title"] = item.DeviceType;
                                requestMachinesListItem["DeviceType"] = item.DeviceType;
                                requestMachinesListItem["DeviceNumber"] = item.DeviceNumber;
                                requestMachinesListItem["ItemsCount"] = item.ItemsCount;
                                requestMachinesListItem["NotesAboutDevice"] = item.NotesAboutDevice;
                                requestMachinesListItem["ManufacturingCompanyName"] = item.ManufacturingCompanyName;
                                requestMachinesListItem["DevicesRequestID"] = new SPFieldLookupValue(devicesRequestsItem.ID, devicesRequestsItem.Title);
                                requestMachinesListItem.Update();
                            }
                            devicesRequestOutPut.RequestID = RequestID;
                            devicesRequestOutPut.statusCode = 1;
                            devicesRequestOutPut.statusMessage = "request inserted done";

                        }
                        else
                        {
                            devicesRequestOutPut.RequestID = 0;
                            devicesRequestOutPut.statusCode = -1;
                            devicesRequestOutPut.statusMessage = "No request inserted";
                        }
                    }
                }


            }
            catch (Exception ex)
            {
                devicesRequestOutPut.RequestID = 0;
                devicesRequestOutPut.statusCode = -2;
                devicesRequestOutPut.statusMessage = ex.Message;
                NNewLogMethod.LogException(ex);

                if (RequestID != 0)
                {
                    RemoveRequest(listSiteUrl, RequestID);
                }

            }
            return devicesRequestOutPut;
        }

        private DevicesRequestOutPut ValidateRequestObject(DevicesRequestEntity devicesRequestEntity, ActionType actionType)
        {
            DevicesRequestOutPut result = new DevicesRequestOutPut() { statusCode = (int)GeneralReturnValuesEnum.Success, statusMessage = "SUccess" };
            if (actionType == ActionType.Edit)
            {
                if (devicesRequestEntity.ID == 0)
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "ID is required";
                    return result;
                }
            }

            if (string.IsNullOrEmpty(devicesRequestEntity.RequestMessage))
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "RequestMessage is required";
                return result;
            }
            if (devicesRequestEntity.DevicesRequestDate == null)
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "DevicesRequestDate is required";
                return result;
            }

            if (string.IsNullOrEmpty(devicesRequestEntity.ActionTime))
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "ActionTime is required";
                return result;
            }

            if (string.IsNullOrEmpty(devicesRequestEntity.SupervisorName))
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "SupervisorName is required";
                return result;
            }

            if (string.IsNullOrEmpty(devicesRequestEntity.IdentityNumber))
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "IdentityNumber is required";
                return result;
            }

            if (string.IsNullOrEmpty(devicesRequestEntity.ApplicantSection))
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "ApplicantSection is required";
                return result;
            }
            if (string.IsNullOrEmpty(devicesRequestEntity.ApplicantRank))
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "ApplicantRank is required";
                return result;
            }
            if (string.IsNullOrEmpty(devicesRequestEntity.ApplicantAdministration))
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "ApplicantAdministration is required";
                return result;
            }
            if (string.IsNullOrEmpty(devicesRequestEntity.ApplicantName))
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "ApplicantName is required";
                return result;
            }

            foreach (MachineEntity item in devicesRequestEntity.RequestMachines)
            {
                if (string.IsNullOrEmpty(item.DeviceType))
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "DeviceType is required";
                    return result;
                }

                if (string.IsNullOrEmpty(item.ItemsCount))
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "ItemsCount is required";
                    return result;
                }

                if (actionType == ActionType.Edit)
                {
                    if (item.State == 0)
                    {
                        result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                        result.statusMessage = "State is required";
                        return result;
                    }
                }
            }

            return result;
        }

        public DevicesRequestOutPut DeleteRequest(string listSiteUrl, int reqID)
        {
            DevicesRequestOutPut _DevicesRequestOutPut = new DevicesRequestOutPut();
            try
            {
                using (SPSite Site = new SPSite(Common.BaseUrl))
                {
                    using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                    {
                        SPList _DevicesRequestList = oWeb.Lists["DevicesRequests"];
                        oWeb.AllowUnsafeUpdates = true;
                        SPListItem _DevicesRequestItem = _DevicesRequestList.GetItemById(reqID);
                        _DevicesRequestItem["IsDeleted"] = true;
                        _DevicesRequestItem.Update();
                        _DevicesRequestOutPut.RequestID = _DevicesRequestItem.ID;
                        _DevicesRequestOutPut.statusCode = 1;
                        _DevicesRequestOutPut.statusMessage = "Deleted";
                    }
                }

            }
            catch (Exception ex)
            {
                _DevicesRequestOutPut.RequestID = 0;
                _DevicesRequestOutPut.statusCode = -2;
                _DevicesRequestOutPut.statusMessage = ex.Message;
                NNewLogMethod.LogException(ex);
            }
            return _DevicesRequestOutPut;
        }


        public void RemoveRequest(string listSiteUrl, int reqID)
        {
            try
            {
                SPSecurity.RunWithElevatedPrivileges(() =>
                {
                    DevicesRequestEntity requestEntity = GetDevicesRequestDetails(listSiteUrl, reqID);
                    using (SPSite Site = new SPSite(Common.BaseUrl))
                    {
                        using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                        {
                            oWeb.AllowUnsafeUpdates = true;

                            if (requestEntity != null && requestEntity.RequestMachines != null && requestEntity.RequestMachines.Count() > 0)
                            {
                                SPList DevicesRequestMachinesList = oWeb.Lists["DevicesRequestMachines"];
                                foreach (MachineEntity item in requestEntity.RequestMachines)
                                {
                                    SPListItem DevicesRequestMachinesListItem = DevicesRequestMachinesList.GetItemById(item.ID);
                                    DevicesRequestMachinesListItem.Delete();

                                }
                            }

                            if (requestEntity != null)
                            {
                                SPList _DevicesRequestList = oWeb.Lists["DevicesRequests"];
                                oWeb.AllowUnsafeUpdates = true;
                                SPListItem _DevicesRequestItem = _DevicesRequestList.GetItemById(reqID);
                                _DevicesRequestItem.Delete();
                            }
                        }
                    }
                });
            }
            catch (Exception ex)
            {
                NNewLogMethod.LogException(ex);
            }
        }

        public object SearchRequests(string listSiteUrl, int userID, int requestID, DateTime? CreationDate, DateTime? requestDate, string applicantName, string supervisorName, string deviceType, string departmentCode, string sectionCode, string requestStatus, bool OnlyToday, string requestType, string Department, out GeneralResponse generalResponse)
        {
            generalResponse = new GeneralResponse();
            IEnumerable<DeviceRequestExtended> _MachinesList = new List<DeviceRequestExtended>();

            try
            {

                SPSecurity.RunWithElevatedPrivileges(() =>
                {
                    using (SPSite Site = new SPSite(Common.BaseUrl))
                    {
                        using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                        {
                            SPList DevicesRequestMachines = oWeb.Lists["DevicesRequestMachines"];
                            SPList DevicesRequests = oWeb.Lists["DevicesRequests"];
                            SPList SupervisorDevicesRequestStatus = oWeb.Lists["SupervisorDevicesRequestStatus"];
                            SPList SecurityDevicesRequestStatus = oWeb.Lists["SecurityDevicesRequestStatus"];


                            _MachinesList = from SPListItem Request in DevicesRequests.Items.Cast<SPListItem>()
                                            join Supervisor in SupervisorDevicesRequestStatus.Items.Cast<SPListItem>() 
                                            on Request.ID equals new SPFieldLookupValue(Supervisor["RequestID"].ToString()).LookupId
                                                     into list1
                                            from Supervisor in list1.DefaultIfEmpty()
                                            join Security in SecurityDevicesRequestStatus.Items.Cast<SPListItem>()
                                            on Request.ID equals new SPFieldLookupValue(Security["SecurityRequestID"].ToString()).LookupId
                                            into list2
                                            from Security in list2.DefaultIfEmpty()
                                            join machs in DevicesRequestMachines.Items.Cast<SPListItem>()
                                            on Request.ID equals new SPFieldLookupValue(machs["DevicesRequestID"].ToString()).LookupId
                                            into list3
                                            from machs in list3.DefaultIfEmpty()

                                            orderby Request["Created"]

                                            where !bool.Parse(Request["IsDeleted"].ToString()) && (!string.IsNullOrEmpty(requestType) ? Request["RequestType"].ToString() == requestType : true) && (machs["IsMachineDeleted"] != null ? !Convert.ToBoolean(machs["IsMachineDeleted"].ToString()) : true)
                                            && ((userID != 0) ? new SPFieldUserValue(oWeb, (Request["Author"].ToString())).User.ID == userID : true)

                                            select new DeviceRequestExtended
                                            {
                                                RequestID = Request.ID,
                                                DevicesRequestDate = (Request != null && Request["DevicesRequestDate"] != null) ? DateTime.Parse(Request["DevicesRequestDate"].ToString()) : DateTime.MinValue,
                                                ActionTime = Request != null ? Common.GetObjectProperty(Request["ActionTime"]) : "",
                                                SupervisorName = Request != null ? Common.GetObjectProperty(Request["SupervisorName"]) : "",
                                                IdentityNumber = Request != null ? Common.GetObjectProperty(Request["IdentityNumber"]) : "",
                                                WorkingPlace = Request != null ? Common.GetObjectProperty(Request["WorkingPlace"]) : "",
                                                ApplicantName = Request != null ? Common.GetObjectProperty(Request["ApplicantName"]) : "",
                                                ApplicantAdministration = Request != null ? Common.GetObjectProperty(Request["ApplicantAdministration"]) : "",
                                                ApplicantSection = Request != null ? Common.GetObjectProperty(Request["ApplicantSection"]) : "",
                                                CreationDate = (Request != null && Request["Created"] != null) ? DateTime.Parse(Request["Created"].ToString()) : DateTime.MinValue,
                                                CreatedByUserId = (Request != null && Request["Author"] != null) ? new SPFieldUserValue(oWeb, (Request["Author"].ToString())).User.ID : 0,
                                                DeviceType = (machs != null) ? Common.GetObjectProperty(machs["DeviceType"]) : "",
                                                DeviceNumber = (machs != null) ? Common.GetObjectProperty(machs["DeviceNumber"]) : "",
                                                ItemsCount = (machs != null) ? Common.GetObjectProperty(machs["ItemsCount"]) : "",
                                                ManufacturingCompanyName = (machs != null) ? Common.GetObjectProperty(machs["ManufacturingCompanyName"]) : "",
                                                NotesAboutDevice = (machs != null) ? Common.GetObjectProperty(machs["NotesAboutDevice"]) : "",
                                                IsItemApproved = (machs != null) ? Common.GetObjectProperty(machs["Title"]) : "",
                                                SupervisorStatus = (Supervisor != null) ? Common.GetObjectProperty(Supervisor["Status"]) : "",
                                                SecurityStatus = (Security != null) ? Common.GetObjectProperty(Security["SecurityStatus"]) : "",
                                            };


                            if (OnlyToday)
                            {
                                // _MachinesList = _MachinesList.Where(p => p.CreationDate.Date == DateTime.Today.Date);
                                if (!string.IsNullOrEmpty(Department))
                                {
                                    _MachinesList = _MachinesList.Where(p => p.SupervisorStatus == "" || p.SupervisorStatus == "3");
                                    _MachinesList = _MachinesList.Where(p => p.ApplicantAdministration.ToLower() == Department.ToLower());
                                }
                                else
                                {
                                    _MachinesList = _MachinesList.Where(p => p.SupervisorStatus == "1" && p.SecurityStatus == "");
                                }
                            }
                            else
                            {
                                if (string.IsNullOrEmpty(Department) && userID == 0)
                                {
                                    _MachinesList = _MachinesList.Where(p => p.SupervisorStatus == "1");
                                }
                            }


                            _MachinesList = _MachinesList.ToList();
                            if (userID != 0)
                            {
                                _MachinesList = _MachinesList.Where(a => a.CreatedByUserId == userID);
                            }
                            else
                            {
                                //  _MachinesList = _MachinesList.Where(a => a.CreationDate.Date == DateTime.Today.Date);
                            }

                            if (requestID != 0)
                            {
                                _MachinesList = _MachinesList.Where(a => a.RequestID == requestID);
                            }

                            if (CreationDate != null)
                            {
                                _MachinesList = _MachinesList.Where(a => a.CreationDate.Date == DateTime.Parse(CreationDate.ToString()).Date);
                            }
                            if (requestDate != null)
                            {

                                _MachinesList = _MachinesList.Where(a => a.DevicesRequestDate.Date == DateTime.Parse(requestDate.ToString()).Date);
                            }
                            if (!string.IsNullOrEmpty(applicantName))
                            {
                                _MachinesList = _MachinesList.Where(a => a.ApplicantName.ToLower().Contains(applicantName.ToLower()));
                            }

                            if (!string.IsNullOrEmpty(departmentCode))
                            {
                                _MachinesList = _MachinesList.Where(a => a.ApplicantAdministration.ToLower() == departmentCode.ToLower());
                            }

                            if (!string.IsNullOrEmpty(sectionCode))
                            {
                                _MachinesList = _MachinesList.Where(a => a.ApplicantSection.ToLower() == departmentCode.ToLower());
                            }

                            if (!string.IsNullOrEmpty(supervisorName))
                            {
                                _MachinesList = _MachinesList.Where(a => a.SupervisorName.ToLower().Contains(supervisorName.ToLower()));
                            }

                            if (!string.IsNullOrEmpty(deviceType))
                            {
                                _MachinesList = _MachinesList.Where(a => a.DeviceType.ToLower().Contains(deviceType.ToLower()));
                            }

                            if (requestStatus != "0")
                            {
                                switch (requestStatus)
                                {
                                    case null:
                                        _MachinesList = _MachinesList.Where(a => a.SupervisorStatus.ToLower() == "");
                                        break;

                                    case "":
                                        _MachinesList = _MachinesList.Where(a => a.SupervisorStatus.ToLower() == "");
                                        break;

                                    case "1-supervisor":
                                        _MachinesList = _MachinesList.Where(a => a.SupervisorStatus.ToLower() == "1" && a.SecurityStatus.ToLower() == "");
                                        break;

                                    case "2-supervisor":
                                        _MachinesList = _MachinesList.Where(a => a.SupervisorStatus.ToLower() == "2");
                                        break;

                                    case "1-security":
                                        _MachinesList = _MachinesList.Where(a => a.SecurityStatus.ToLower() == "1");
                                        break;

                                    case "2-security":
                                        _MachinesList = _MachinesList.Where(a => a.SecurityStatus.ToLower() == "2");
                                        break;

                                    default:
                                        break;
                                }
                            }
                        }
                    }
                });
                generalResponse.StatusCode = (int)GeneralReturnValuesEnum.Success;
                generalResponse.Message = "Success";

            }
            catch (Exception ex)
            {
                NNewLogMethod.LogException(ex);
                generalResponse.StatusCode = (int)GeneralReturnValuesEnum.GeneralException;
                generalResponse.Message = ex.Message;
            }

            return _MachinesList.ToList();
        }
        public object GetRequests(string listSiteUrl, int UserID, string Department, bool OnlyToday)
        {
            IEnumerable<DeviceRequestExtended> _MachinesList = new List<DeviceRequestExtended>();

            try
            {

                SPSecurity.RunWithElevatedPrivileges(() =>
                {
                    using (SPSite Site = new SPSite(Common.BaseUrl))
                    {
                        using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                        {
                            SPList DevicesRequestMachines = oWeb.Lists["DevicesRequestMachines"];
                            SPList DevicesRequests = oWeb.Lists["DevicesRequests"];
                            SPList SupervisorDevicesRequestStatus = oWeb.Lists["SupervisorDevicesRequestStatus"];
                            SPList SecurityDevicesRequestStatus = oWeb.Lists["SecurityDevicesRequestStatus"];

                            _MachinesList = from SPListItem Request in DevicesRequests.Items.Cast<SPListItem>()
                                            join Supervisor in SupervisorDevicesRequestStatus.Items.Cast<SPListItem>() on Request.ID equals new SPFieldLookupValue(Supervisor["SupervisorVisitingRequestID"].ToString()).LookupId
                                                     into list1

                                            from Supervisor in list1.DefaultIfEmpty()
                                            join Security in SecurityDevicesRequestStatus.Items.Cast<SPListItem>()
                                            on Request.ID equals new SPFieldLookupValue(Security["SecurityDevicesRequestID"].ToString()).LookupId
                                            into list2
                                            from Security in list2.DefaultIfEmpty()
                                            join machs in DevicesRequestMachines.Items.Cast<SPListItem>()
                                            on Request.ID equals new SPFieldLookupValue(machs["DevicesRequestID"].ToString()).LookupId
                                            into list3
                                            from machs in list3.DefaultIfEmpty()

                                            orderby Request["Created"]

                                            where !bool.Parse(Request["IsDeleted"].ToString())
                                            && ((UserID != 0) ? new SPFieldUserValue(oWeb, (Request["Author"].ToString())).User.ID == UserID : true)
                                            select new DeviceRequestExtended
                                            {
                                                RequestID = Request.ID,
                                                DevicesRequestDate = DateTime.Parse(Request["DevicesRequestDate"].ToString()),
                                                SupervisorName = Request["SupervisorName"].ToString(),
                                                IdentityNumber = Request["IdentityNumber"].ToString(),
                                                WorkingPlace = Request["WorkingPlace"].ToString(),
                                                ApplicantName = Request["ApplicantName"].ToString(),
                                                ApplicantAdministration = (Request["ApplicantAdministration"] != null) ? Request["ApplicantAdministration"].ToString() : "",
                                                CreationDate = DateTime.Parse(Request["Created"].ToString()),
                                                CreatedByUserId = new SPFieldUserValue(oWeb, (Request["Author"].ToString())).User.ID,
                                                DeviceType = (machs != null) ? machs["DeviceType"].ToString() : "",
                                                DeviceNumber = (machs != null) ? machs["DeviceNumber"].ToString() : "",
                                                NotesAboutDevice = (machs != null) ? machs["NotesAboutDevice"].ToString() : "",
                                                SupervisorStatus = (Supervisor != null) ? Supervisor["Status"].ToString() : "",
                                                SecurityStatus = (Security != null) ? Security["SecurityStatus"].ToString() : "",
                                            };
                            if (!string.IsNullOrEmpty(Department))
                            {
                                _MachinesList = _MachinesList.Where(p => p.ApplicantAdministration.ToLower() == Department.ToLower());
                            }

                            if (OnlyToday)
                            {
                                _MachinesList = _MachinesList.Where(p => p.CreationDate.Date == DateTime.Today.Date);
                                if (!string.IsNullOrEmpty(Department))
                                {
                                    _MachinesList = _MachinesList.Where(p => p.SupervisorStatus == "" || p.SupervisorStatus == "3");
                                }
                                else
                                {
                                    _MachinesList = _MachinesList.Where(p => p.SupervisorStatus == "1" && p.SecurityStatus == "");
                                }
                            }
                            else
                            {
                                if (string.IsNullOrEmpty(Department) && UserID == 0)
                                {
                                    _MachinesList = _MachinesList.Where(p => p.SupervisorStatus == "1");

                                }
                            }
                        }
                    }
                });
            }
            catch (Exception ex)
            {
                NNewLogMethod.LogException(ex);
                //Common.WriteLog("GetRequests=>" + ex.ToString());
            }

            return _MachinesList;
        }
        public DevicesRequestOutPut UpdateDevicesRequest(string listSiteUrl, DevicesRequestEntity devicesRequestEntity)
        {
            DevicesRequestOutPut _DevicesRequestOutPut = new DevicesRequestOutPut();

            try
            {
                _DevicesRequestOutPut = ValidateRequestObject(devicesRequestEntity, ActionType.Edit);
                if (_DevicesRequestOutPut.statusCode != (int)GeneralReturnValuesEnum.Success)
                    return _DevicesRequestOutPut;

                using (SPSite Site = new SPSite(Common.BaseUrl))
                {
                    using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                    {
                        SPList DevicesRequestList = oWeb.Lists["DevicesRequests"];
                        oWeb.AllowUnsafeUpdates = true;
                        SPListItem DevicesRequestItem = DevicesRequestList.GetItemById(devicesRequestEntity.ID);

                        if (!devicesRequestEntity.IsDeleted)
                        {
                            DevicesRequestItem["RequestType"] = devicesRequestEntity.RequestType;
                            DevicesRequestItem["Title"] = devicesRequestEntity.RequestMessage;
                            DevicesRequestItem["RequestMessage"] = devicesRequestEntity.RequestMessage;
                            DevicesRequestItem["DevicesRequestDate"] = devicesRequestEntity.DevicesRequestDate.AddDays(1);
                            DevicesRequestItem["ActionTime"] = devicesRequestEntity.ActionTime;
                            DevicesRequestItem["SupervisorName"] = devicesRequestEntity.SupervisorName;
                            DevicesRequestItem["IdentityNumber"] = devicesRequestEntity.IdentityNumber;
                            DevicesRequestItem["WorkingPlace"] = devicesRequestEntity.WorkingPlace;
                            DevicesRequestItem["ApplicantName"] = devicesRequestEntity.ApplicantName;
                            DevicesRequestItem["ApplicantSection"] = devicesRequestEntity.ApplicantSection;
                            DevicesRequestItem["ApplicantRank"] = devicesRequestEntity.ApplicantRank;
                            DevicesRequestItem["ApplicantAdministration"] = devicesRequestEntity.ApplicantAdministration;
                            DevicesRequestItem.Update();

                            int RequestID = DevicesRequestItem.ID;
                            if (RequestID != 0)
                            {
                                SPList DevicesRequestMachinesList = oWeb.Lists["DevicesRequestMachines"];
                                int MachineID = 0;
                                foreach (MachineEntity item in devicesRequestEntity.RequestMachines)
                                {
                                    //0 nothing ,1 newly added, 2 updated, 3 deleted
                                    if (item.State == 2)
                                    {
                                        SPListItem MachinesListItem = DevicesRequestMachinesList.GetItemById(item.ID);
                                        if (MachinesListItem != null)
                                        {
                                            MachinesListItem["Title"] = item.DeviceType;
                                            MachinesListItem["DeviceType"] = item.DeviceType;
                                            MachinesListItem["DeviceNumber"] = item.DeviceNumber;
                                            MachinesListItem["NotesAboutDevice"] = item.NotesAboutDevice;
                                            MachinesListItem["ManufacturingCompanyName"] = item.ManufacturingCompanyName;
                                            MachinesListItem["ItemsCount"] = item.ItemsCount;
                                            MachinesListItem["DevicesRequestID"] = new SPFieldLookupValue(devicesRequestEntity.ID, devicesRequestEntity.ID.ToString());

                                            MachinesListItem.Update();
                                            MachineID = MachinesListItem.ID;
                                        }

                                    }
                                    else if (item.State == 3)
                                    {
                                        SPListItem DevicesRequestMachinesListItem = DevicesRequestMachinesList.GetItemById(item.ID);
                                        if (DevicesRequestMachinesListItem != null)
                                        {
                                            DevicesRequestMachinesListItem["IsMachineDeleted"] = true;
                                            DevicesRequestMachinesListItem.Update();
                                            MachineID = DevicesRequestMachinesListItem.ID;
                                        }
                                    }
                                    else if (item.State == 1)
                                    {
                                        SPListItem DevicesRequestMachinesListItem = DevicesRequestMachinesList.Items.Add();

                                        DevicesRequestMachinesListItem["Title"] = item.DeviceType;
                                        DevicesRequestMachinesListItem["DeviceType"] = item.DeviceType;
                                        DevicesRequestMachinesListItem["DeviceNumber"] = item.DeviceNumber;
                                        DevicesRequestMachinesListItem["NotesAboutDevice"] = item.NotesAboutDevice;
                                        DevicesRequestMachinesListItem["ManufacturingCompanyName"] = item.ManufacturingCompanyName;
                                        DevicesRequestMachinesListItem["ItemsCount"] = item.ItemsCount;
                                        DevicesRequestMachinesListItem["DevicesRequestID"] = new SPFieldLookupValue(devicesRequestEntity.ID, devicesRequestEntity.ID.ToString());

                                        DevicesRequestMachinesListItem.Update();
                                        MachineID = DevicesRequestMachinesListItem.ID;
                                        if (DevicesRequestMachinesListItem.ID == 0)
                                        {
                                            break;
                                        }
                                    }
                                }
                                _DevicesRequestOutPut.RequestID = RequestID;
                                _DevicesRequestOutPut.statusCode = 1;
                                _DevicesRequestOutPut.statusMessage = "request Update done";

                            }
                            else
                            {
                                _DevicesRequestOutPut.RequestID = 0;
                                _DevicesRequestOutPut.statusCode = -1;
                                _DevicesRequestOutPut.statusMessage = "No request Update";
                            }

                        }
                        else
                        {
                            DevicesRequestItem["IsDeleted"] = devicesRequestEntity.IsDeleted;
                            DevicesRequestItem.Update();
                            _DevicesRequestOutPut.RequestID = DevicesRequestItem.ID;
                            _DevicesRequestOutPut.statusCode = 1;
                            _DevicesRequestOutPut.statusMessage = "request delete done";
                        }


                    }
                }

            }
            catch (Exception ex)
            {
                _DevicesRequestOutPut.RequestID = 0;
                _DevicesRequestOutPut.statusCode = -2;
                _DevicesRequestOutPut.statusMessage = ex.Message;
                NNewLogMethod.LogException(ex);
                //Common.WriteLog("EditDevicesRequest=>" + ex.ToString());
            }
            return _DevicesRequestOutPut;
        }
        public DevicesRequestEntity GetDevicesRequestDetails(string listSiteUrl, int requestID)
        {
            LoopUpList LoopUpList = new LoopUpList();
            DevicesRequestEntity devicesRequestEntity = new DevicesRequestEntity();

            try
            {

                SPSecurity.RunWithElevatedPrivileges(() =>
                {
                    using (SPSite Site = new SPSite(Common.BaseUrl))
                    {
                        using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                        {

                            SPList _DevicesRequestList = oWeb.Lists["DevicesRequests"];
                            SPList _DevicesRequestMachinesList = oWeb.Lists["DevicesRequestMachines"];
                            var _MachinesList = from SPListItem Request in _DevicesRequestList.Items.Cast<SPListItem>()
                                                join Machine in _DevicesRequestMachinesList.Items.Cast<SPListItem>() on Request.ID.ToString() equals new SPFieldLookupValue(Machine["DevicesRequestID"].ToString()).LookupValue
                                                into list1
                                                from Machines in list1.DefaultIfEmpty()
                                                where Request.ID == requestID && !bool.Parse(Machines["IsMachineDeleted"].ToString())

                                                select new MachineEntity
                                                {
                                                    DeviceType = Machines != null ? Common.GetObjectProperty(Machines["DeviceType"]) : "",
                                                    DeviceNumber = Machines != null ? Common.GetObjectProperty(Machines["DeviceNumber"]) : "",
                                                    ManufacturingCompanyName = Machines != null ? Common.GetObjectProperty(Machines["ManufacturingCompanyName"]) : "",
                                                    ItemsCount = Machines != null ? Common.GetObjectProperty(Machines["ItemsCount"]) : "",
                                                    NotesAboutDevice = Machines != null ? Common.GetObjectProperty(Machines["NotesAboutDevice"]) : "",
                                                    ID = Machines.ID,
                                                    ItemIsApproved = Machines != null ? Common.GetObjectProperty(Machines["Title"]) : ""

                                                };

                            var _DevicesRequest = from SPListItem Request in _DevicesRequestList.Items.Cast<SPListItem>()
                                                  where Request.ID == requestID && bool.Parse(Request["IsDeleted"].ToString()) == false
                                                  select new DevicesRequestEntity
                                                  {
                                                      ID = Request.ID,
                                                      RequestMessage = Request != null ? Common.GetObjectProperty(Request["RequestMessage"]) : "",
                                                      DevicesRequestDate = (Request != null && Request["DevicesRequestDate"] != null) ? DateTime.Parse(Request["DevicesRequestDate"].ToString()) : DateTime.MinValue,
                                                      SupervisorName = Request != null ? Common.GetObjectProperty(Request["SupervisorName"]) : "",
                                                      CreationDate = (Request != null && Request["Created"] != null) ? DateTime.Parse(Request["Created"].ToString()) : DateTime.MinValue,
                                                      ActionTime = Request != null ? Common.GetObjectProperty(Request["ActionTime"]) : "",
                                                      IdentityNumber = Request != null ? Common.GetObjectProperty(Request["IdentityNumber"]) : "",
                                                      WorkingPlace = Request != null ? Common.GetObjectProperty(Request["WorkingPlace"]) : "",
                                                      ApplicantName = Request != null ? Common.GetObjectProperty(Request["ApplicantName"]) : "",
                                                      ApplicantAdministration = Request != null ? Common.GetObjectProperty(Request["ApplicantAdministration"]) : "",
                                                      ApplicantRank = Request != null ? Common.GetObjectProperty(Request["ApplicantRank"]) : "",
                                                      ApplicantSection = Request != null ? Common.GetObjectProperty(Request["ApplicantSection"]) : "",
                                                      SecurityNote = Request != null ? Common.GetObjectProperty(Request["SecurityMSG"]) : "",
                                                      SecurityStatus = Request != null ? Common.GetObjectProperty(Request["FinalApproval"]) : "",
                                                      SupervisiorNote = Request != null ? Common.GetObjectProperty(Request["SupervisorMSG"]) : "",
                                                      CreatedByUserId = (Request != null && Request["Author"] != null) ? new SPFieldUserValue(oWeb, (Request["Author"].ToString())).User.ID : 0
                                                  };



                            if (_DevicesRequest.ToList().Count > 0)
                            {
                                devicesRequestEntity = ((DevicesRequestEntity)_DevicesRequest.ToList()[0]);
                                devicesRequestEntity.RequestMachines = _MachinesList.ToList();
                            }
                        }
                    }
                });
            }
            catch (Exception ex)
            {
                NNewLogMethod.LogException(ex);
            }
            return devicesRequestEntity;
        }

        public DevicesRequestEntity GetDevicesRequestDetailsForEdit(string listSiteUrl, string currentUserId, int requestID)
        {
            DevicesRequestEntity entity = GetDevicesRequestDetails(listSiteUrl, requestID);

            if (currentUserId != entity.CreatedByUserId.ToString() || !string.IsNullOrEmpty(entity.SecurityStatus) || !string.IsNullOrEmpty(entity.SupervisiorNote))
            {
                return null;
            }

            return entity;
        }


        public DevicesRequestEntity GetRequestDetailsForView(string listSiteUrl, string currentUserId, int requestID)
        {
            DevicesRequestEntity entity = GetDevicesRequestDetails(listSiteUrl, requestID);

            if (currentUserId != entity.CreatedByUserId.ToString())
            {
                return null;
            }

            return entity;
        }

        private DevicesRequestOutPut ValidateFinalApproveRequestObject(DevicesRequestEntity devicesRequestEntity)
        {
            DevicesRequestOutPut result = new DevicesRequestOutPut() { statusCode = (int)GeneralReturnValuesEnum.Success, statusMessage = "SUccess" };

            if (devicesRequestEntity.ID == 0)
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "ID is required";
                return result;
            }

            if (string.IsNullOrEmpty(devicesRequestEntity.ActionTime))
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "ActionTime is required";
                return result;
            }

            foreach (MachineEntity item in devicesRequestEntity.RequestMachines)
            {
                if (string.IsNullOrEmpty(item.DeviceType))
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "DeviceType is required";
                    return result;
                }

                if (string.IsNullOrEmpty(item.ItemsCount))
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "ItemsCount is required";
                    return result;
                }
            }

            return result;
        }

        public DevicesRequestOutPut AddFinalAproveForRequest(string listSiteUrl, DevicesRequestEntity devicesRequestEntity)
        {
            DevicesRequestOutPut devicesRequestOutPut = new DevicesRequestOutPut();
            try
            {
                devicesRequestOutPut = ValidateFinalApproveRequestObject(devicesRequestEntity);
                if (devicesRequestOutPut.statusCode != (int)GeneralReturnValuesEnum.Success)
                    return devicesRequestOutPut;

                using (SPSite Site = new SPSite(Common.BaseUrl))
                {
                    using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                    {
                        SPList devicesRequestsList = oWeb.Lists["DevicesRequests"];
                        oWeb.AllowUnsafeUpdates = true;

                        if (devicesRequestEntity.ID != 0)
                        {
                            SPList requestMachinesApprovalList = oWeb.Lists["RequestMachinesApproval"];
                            SPList OriginalRequestMachinesList = oWeb.Lists["DevicesRequestMachines"];

                            foreach (MachineEntity item in devicesRequestEntity.RequestMachines)
                            {
                                SPListItem requestMachinesApprovalListItem = requestMachinesApprovalList.Items.Add();
                                requestMachinesApprovalListItem["Title"] = item.DeviceType;
                                requestMachinesApprovalListItem["DeviceType"] = item.DeviceType;
                                requestMachinesApprovalListItem["DeviceNumber"] = item.DeviceNumber;
                                requestMachinesApprovalListItem["ItemsCount"] = item.ItemsCount;
                                requestMachinesApprovalListItem["NotesAboutDevice"] = item.NotesAboutDevice;
                                requestMachinesApprovalListItem["ManufacturingCompanyName"] = item.ManufacturingCompanyName;
                                requestMachinesApprovalListItem["DevicesRequestID"] = new SPFieldLookupValue(devicesRequestEntity.ID, devicesRequestEntity.ID.ToString());
                                requestMachinesApprovalListItem.Update();

                                SPListItem OriginalRequestMachinesItem = OriginalRequestMachinesList.GetItemById(item.ID);
                                if (OriginalRequestMachinesItem != null)
                                {
                                    OriginalRequestMachinesItem["Title"] = "1";
                                    OriginalRequestMachinesItem.Update();
                                }
                            }
                            devicesRequestOutPut.RequestID = devicesRequestEntity.ID;
                            devicesRequestOutPut.statusCode = 1;
                            devicesRequestOutPut.statusMessage = "request successfuly done";
                        }
                        else
                        {
                            devicesRequestOutPut.RequestID = 0;
                            devicesRequestOutPut.statusCode = -1;
                            devicesRequestOutPut.statusMessage = "Request Fail";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                devicesRequestOutPut.RequestID = 0;
                devicesRequestOutPut.statusCode = -2;
                devicesRequestOutPut.statusMessage = ex.Message;
                NNewLogMethod.LogException(ex);
            }
            return devicesRequestOutPut;
        }

        private DevicesRequestOutPut ValidateAppoveObject(RequestStatus _RequestStatus)
        {
            DevicesRequestOutPut result = new DevicesRequestOutPut() { statusCode = (int)GeneralReturnValuesEnum.Success, statusMessage = "SUccess" };

            if (string.IsNullOrEmpty(_RequestStatus.Group))
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "Group is required";
                return result;
            }

            if (_RequestStatus.ReqID == 0)
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "ReqID is required";
                return result;
            }

            if (string.IsNullOrEmpty(_RequestStatus.Status))
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "Status is required";
                return result;
            }

            if (string.IsNullOrEmpty(_RequestStatus.StatusNote))
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "StatusNote is required";
                return result;
            }

            return result;
        }

        public DevicesRequestOutPut AprroveSupervisor(string listSiteUrl, RequestStatus _RequestStatus)
        {
            DevicesRequestOutPut _DevicesRequestOutPut = new DevicesRequestOutPut();
            try
            {
                _DevicesRequestOutPut = ValidateAppoveObject(_RequestStatus);
                if (_DevicesRequestOutPut.statusCode != (int)GeneralReturnValuesEnum.Success)
                    return _DevicesRequestOutPut;

                bool isFound = false;
                using (SPSite Site = new SPSite(Common.BaseUrl))
                {
                    using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                    {
                        SPList SupervisorDevicesRequestStatusList = oWeb.Lists["SupervisorDevicesRequestStatus"];
                        SPList DevicesRequestsList = oWeb.Lists["DevicesRequests"];

                        oWeb.AllowUnsafeUpdates = true;
                        SPListItemCollection SupervisorDevicesRequestStatusListItems = SupervisorDevicesRequestStatusList.Items;
                        foreach (SPListItem item in SupervisorDevicesRequestStatusListItems)
                        {

                            if (new SPFieldLookupValue(item["RequestID"] as String).LookupId == _RequestStatus.ReqID)
                            {
                                isFound = true;
                                item["Status"] = _RequestStatus.Status;
                                item["ApprovalNote"] = _RequestStatus.StatusNote;
                                item["Depratment"] = _RequestStatus.Group;
                                item.Update();
                            }

                        }
                        if (!isFound)
                        {
                            SPListItem NewDevicesRequestStatus = SupervisorDevicesRequestStatusList.Items.Add();
                            NewDevicesRequestStatus["Title"] = _RequestStatus.StatusNote;
                            NewDevicesRequestStatus["Status"] = _RequestStatus.Status;
                            NewDevicesRequestStatus["ApprovalNote"] = _RequestStatus.StatusNote;
                            NewDevicesRequestStatus["Depratment"] = _RequestStatus.Group;
                            NewDevicesRequestStatus["RequestID"] = new SPFieldLookupValue(_RequestStatus.ReqID, _RequestStatus.ReqID.ToString());
                            NewDevicesRequestStatus.Update();

                        }
                        SPListItem Request = DevicesRequestsList.Items.GetItemById(_RequestStatus.ReqID);
                        Request["SupervisorMSG"] = _RequestStatus.StatusNote;
                        Request.Update();
                        _DevicesRequestOutPut.RequestID = _RequestStatus.ReqID;
                        _DevicesRequestOutPut.statusCode = 1;
                        _DevicesRequestOutPut.statusMessage = "Approved Done";
                    }
                }
            }
            catch (Exception ex)
            {
                _DevicesRequestOutPut.RequestID = 0;
                _DevicesRequestOutPut.statusCode = -2;
                _DevicesRequestOutPut.statusMessage = ex.Message;
                NNewLogMethod.LogException(ex);
            }
            return _DevicesRequestOutPut;
        }
        public DevicesRequestOutPut AprroveSecurity(string listSiteUrl, RequestStatus _RequestStatus)
        {
            DevicesRequestOutPut _DevicesRequestOutPut = new DevicesRequestOutPut();
            try
            {
                _DevicesRequestOutPut = ValidateAppoveObject(_RequestStatus);
                if (_DevicesRequestOutPut.statusCode != (int)GeneralReturnValuesEnum.Success)
                    return _DevicesRequestOutPut;

                bool isFound = false;

                using (SPSite Site = new SPSite(Common.BaseUrl))
                {
                    SPList Gates;

                    using (SPWeb gatesWeb = Site.OpenWeb(Common.CommonWebUrl))
                    {
                        Gates = gatesWeb.Lists["Gates"];
                    }

                    using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                    {
                        SPList SecurityDevicesRequestStatusList = oWeb.Lists["SecurityDevicesRequestStatus"];
                        SPList DevicesRequestsList = oWeb.Lists["DevicesRequests"];
                        SPListItem GatesItem = null;
                        //SPList Gates = oWeb.Lists["Gates"];

                        if (_RequestStatus.Gate > 0)
                        {
                            GatesItem = Gates.Items.GetItemById(_RequestStatus.Gate);
                        }
                        oWeb.AllowUnsafeUpdates = true;
                        SPListItemCollection SecurityDevicesRequestStatusListItems = SecurityDevicesRequestStatusList.Items;
                        foreach (SPListItem item in SecurityDevicesRequestStatusListItems)
                        {

                            if (new SPFieldLookupValue(item["SecurityRequestID"] as String).LookupId == _RequestStatus.ReqID)
                            {
                                isFound = true;
                                item["SecurityStatus"] = _RequestStatus.Status;
                                item["SecurityApprovalNote"] = _RequestStatus.StatusNote;
                                item["SecurityDepratment"] = _RequestStatus.Group;
                                if (_RequestStatus.Gate > 0)
                                    item["GatesLookup"] = new SPFieldLookupValue(_RequestStatus.Gate, GatesItem.Title);


                                item.Update();
                            }

                        }
                        if (!isFound)
                        {
                            SPListItem newSecurityDevicesRequestStatusListItem = SecurityDevicesRequestStatusList.Items.Add();

                            newSecurityDevicesRequestStatusListItem["Title"] = _RequestStatus.StatusNote;
                            newSecurityDevicesRequestStatusListItem["SecurityStatus"] = _RequestStatus.Status;
                            newSecurityDevicesRequestStatusListItem["SecurityApprovalNote"] = _RequestStatus.StatusNote;
                            newSecurityDevicesRequestStatusListItem["SecurityDepratment"] = _RequestStatus.Group;
                            newSecurityDevicesRequestStatusListItem["SecurityRequestID"] = new SPFieldLookupValue(_RequestStatus.ReqID, _RequestStatus.ReqID.ToString());
                            if (_RequestStatus.Gate > 0)
                                newSecurityDevicesRequestStatusListItem["GatesLookup"] = new SPFieldLookupValue(_RequestStatus.Gate, GatesItem.Title);

                            newSecurityDevicesRequestStatusListItem.Update();


                        }
                        SPListItem Request = DevicesRequestsList.Items.GetItemById(_RequestStatus.ReqID);
                        Request["FinalApproval"] = _RequestStatus.Status;
                        Request["SecurityMSG"] = _RequestStatus.StatusNote;
                        if (_RequestStatus.Gate > 0)
                            Request["RequestGate"] = GatesItem.Title;

                        Request.Update();

                        _DevicesRequestOutPut.RequestID = _RequestStatus.ReqID;
                        _DevicesRequestOutPut.statusCode = 1;
                        _DevicesRequestOutPut.statusMessage = "Approved Done";
                    }
                }

            }
            catch (Exception ex)
            {
                _DevicesRequestOutPut.RequestID = 0;
                _DevicesRequestOutPut.statusCode = -2;
                _DevicesRequestOutPut.statusMessage = ex.Message;
                NNewLogMethod.LogException(ex);
            }


            return _DevicesRequestOutPut;
        }

        private DevicesRequestOutPut ValidateActionObject(List<MachineEntity> machinesList)
        {
            DevicesRequestOutPut result = new DevicesRequestOutPut() { statusCode = (int)GeneralReturnValuesEnum.Success, statusMessage = "SUccess" };

            foreach (MachineEntity _MachineEntity in machinesList)
            {

                if (_MachineEntity.ID == 0)
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "_MachineEntity.ID is required";
                    return result;
                }

                if (_MachineEntity.MachineActions == null || _MachineEntity.MachineActions.Count == 0)
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "_MachineEntity.MachineActions is required";
                    return result;
                }

                if (_MachineEntity.MachineActions[0].DeviceID == 0)
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "_MachineEntity.MachineActions[0].DeviceID is required";
                    return result;
                }

                if (string.IsNullOrEmpty(_MachineEntity.MachineActions[0].ActionNotes))
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "_MachineEntity.MachineActions[0].ActionNotes is required";
                    return result;
                }
            }

            return result;
        }

        public DevicesRequestOutPut AddMachineAction(string listSiteUrl, List<MachineEntity> machinesList)
        {
            DevicesRequestOutPut _DevicesRequestOutPut = new DevicesRequestOutPut();
            try
            {
                using (SPSite Site = new SPSite(Common.BaseUrl))
                {
                    using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                    {
                        foreach (MachineEntity _MachineEntity in machinesList)
                        {
                            SPListItem machineApprovalListItem = oWeb.Lists["RequestMachinesApproval"].GetItemById(_MachineEntity.MachineActions[0].DeviceID);
                            SPList MachinesActionsList = oWeb.Lists["MachineActions"];
                            oWeb.AllowUnsafeUpdates = true;

                            if (_MachineEntity.ID != 0)
                            {
                                SPListItem actionListItem = MachinesActionsList.Items.Add();

                                actionListItem["Title"] = machineApprovalListItem["DeviceType"].ToString();
                                actionListItem["DeviceID"] = new SPFieldLookupValue(_MachineEntity.ID, machineApprovalListItem["DeviceType"].ToString());
                                actionListItem["ActionDate"] = DateTime.UtcNow.AddHours(3);
                                actionListItem["ActionNotes"] = _MachineEntity.MachineActions[0].ActionNotes;
                                actionListItem.Update();


                                _DevicesRequestOutPut.RequestID = _MachineEntity.ReqID;
                                _DevicesRequestOutPut.statusCode = 1;
                                _DevicesRequestOutPut.statusMessage = "Check in  done";

                            }
                            else
                            {
                                _DevicesRequestOutPut.RequestID = 0;
                                _DevicesRequestOutPut.statusCode = -1;
                                _DevicesRequestOutPut.statusMessage = "No Machines Found";
                            }

                        }

                    }
                }
                //});
            }
            catch (Exception ex)
            {
                _DevicesRequestOutPut.RequestID = 0;
                _DevicesRequestOutPut.statusCode = -2;
                _DevicesRequestOutPut.statusMessage = ex.Message;
                NNewLogMethod.LogException(ex);
            }
            return _DevicesRequestOutPut;
        }
        public object GetActions(string listSiteUrl, int RequestID, bool ToDay, int UserID, DateTime? RequestCreateDate, string RequestType, string Gate, string ApplicantName, string SupervisorName, string DeviceType, string DepartmentCode, string SectionCode, bool DailyReport, out GeneralResponse generalResponse)
        {
            generalResponse = new GeneralResponse();

            List<DevicesRequestEntity> _DevicesRequestEntityList = new List<DevicesRequestEntity>();
            DevicesRequestEntity _DevicesRequestEntity = new DevicesRequestEntity();
            try
            {

                SPSecurity.RunWithElevatedPrivileges(() =>
                {
                    using (SPSite Site = new SPSite(Common.BaseUrl))
                    {
                        using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                        {

                            SPList DevicesRequestsList = oWeb.Lists["DevicesRequests"];
                            SPList RequestMachinesApprovalList = oWeb.Lists["RequestMachinesApproval"];
                            

                            SPList MachineActionsList = oWeb.Lists["MachineActions"];
                            IEnumerable<MachineEntity> machines = from SPListItem Machines in RequestMachinesApprovalList.Items.Cast<SPListItem>()
                                                                  join Request in DevicesRequestsList.Items.Cast<SPListItem>()
                                                                    on new SPFieldLookupValue(Machines["DevicesRequestID"].ToString()).LookupId equals Request.ID
                                                                  into list1
                                                                  from p in list1.DefaultIfEmpty()
                                                                  select new MachineEntity
                                                                  {
                                                                      DeviceType = Machines != null ? Common.GetObjectProperty(Machines["DeviceType"]) : "",
                                                                      DeviceNumber = Machines != null ? Common.GetObjectProperty(Machines["DeviceNumber"]) : "",
                                                                      ManufacturingCompanyName = Machines != null ? Common.GetObjectProperty(Machines["ManufacturingCompanyName"]) : "",
                                                                      NotesAboutDevice = Machines != null ? Common.GetObjectProperty(Machines["NotesAboutDevice"]) : "",
                                                                      ItemsCount = Machines != null ? Common.GetObjectProperty(Machines["ItemsCount"]) : "",
                                                                      ID = Machines.ID,
                                                                      ReqID = (Machines != null && Machines["DevicesRequestID"] != null) ? new SPFieldLookupValue(Machines["DevicesRequestID"].ToString()).LookupId : 0
                                                                  };

                            if (!string.IsNullOrEmpty(DeviceType))
                            {
                                machines = machines.Where(P => P.DeviceType.ToLower().Contains(DeviceType.ToLower()));
                            }


                            IEnumerable<MachineActionEntity> MachineActions = from SPListItem machineActs in MachineActionsList.Items.Cast<SPListItem>()
                                                                              select new MachineActionEntity
                                                                              {
                                                                                  DeviceID = (machineActs != null && machineActs["DeviceID"] != null) ? new SPFieldLookupValue(machineActs["DeviceID"] as String).LookupId : 0,
                                                                                  ActionDate = (machineActs != null && machineActs["ActionDate"] != null) ? DateTime.Parse(machineActs["ActionDate"].ToString()) : DateTime.MinValue,
                                                                                  ActionNotes = machineActs != null ? Common.GetObjectProperty(machineActs["ActionNotes"]) : "",
                                                                                  Created = (machineActs != null && machineActs["Created"] != null) ? DateTime.Parse(machineActs["Created"].ToString()) : DateTime.MinValue,
                                                                                  ActionDoneByName = (machineActs != null && machineActs["Author"] != null) ? new SPFieldUserValue(oWeb, (machineActs["Author"].ToString())).User.Name : "",
                                                                              };
                            //if (ToDay)
                            //{
                            //    MachineActions = MachineActions.Where(p => p.Created.Date == DateTime.Now.Date);
                            //}

                            SPList SupervisorDevicesRequestStatus = oWeb.Lists["SupervisorDevicesRequestStatus"];
                            SPList SecurityDevicesRequestStatus = oWeb.Lists["SecurityDevicesRequestStatus"];

                            IEnumerable<DevicesRequestEntity> _DevicesRequestEntityEnumerable = from SPListItem Request in DevicesRequestsList.Items.Cast<SPListItem>()
                                                                                                join Supervisor in SupervisorDevicesRequestStatus.Items.Cast<SPListItem>() on Request.ID equals new SPFieldLookupValue(Supervisor["RequestID"].ToString()).LookupId
                                                                                                into list1
                                                                                                from Supervisor in list1.DefaultIfEmpty()
                                                                                                join Security in SecurityDevicesRequestStatus.Items.Cast<SPListItem>()
                                                                                                on Request.ID equals new SPFieldLookupValue(Security["SecurityRequestID"].ToString()).LookupId
                                                                                                into list2
                                                                                                from Security in list2.DefaultIfEmpty()
                                                                                                where bool.Parse(Request["IsDeleted"].ToString()) == false
                                                                                                && (!string.IsNullOrEmpty(RequestType) ? Request["RequestType"].ToString() == RequestType : true)
                                                                                                        && Request["FinalApproval"] != null
                                                                                                        && ((Request["FinalApproval"] != null) ? Request["FinalApproval"].ToString() == "1" : false)
                                                                                                        && ((UserID != 0) ? new SPFieldUserValue(oWeb, (Request["Author"].ToString())).User.ID == UserID : true)
                                                                                                select new DevicesRequestEntity
                                                                                                {
                                                                                                    ApplicantName = Request != null ? Common.GetObjectProperty(Request["ApplicantName"]) : "",
                                                                                                    SupervisorName = Request != null ? Common.GetObjectProperty(Request["SupervisorName"]) : "",
                                                                                                    ApplicantAdministration = Request != null ? Common.GetObjectProperty(Request["ApplicantAdministration"]) : "",
                                                                                                    ApplicantRank = Request != null ? Common.GetObjectProperty(Request["ApplicantRank"]) : "",
                                                                                                    DevicesRequestDate = (Request != null && Request["DevicesRequestDate"] != null) ? DateTime.Parse(Request["DevicesRequestDate"].ToString()) : DateTime.MinValue,
                                                                                                    ActionTime = Request != null ? Common.GetObjectProperty(Request["ActionTime"]) : "",
                                                                                                    RequestMessage = Request != null ? Common.GetObjectProperty(Request["RequestMessage"]) : "",
                                                                                                    ApplicantSection = Request != null ? Common.GetObjectProperty(Request["ApplicantSection"]) : "",
                                                                                                    ID = Request.ID,
                                                                                                    Gate = Request != null ? Common.GetObjectProperty(Request["RequestGate"]) : "",
                                                                                                    CreationDate = (Request != null && Request["Created"] != null) ? DateTime.Parse(Request["Created"].ToString()) : DateTime.MinValue,
                                                                                                     ApprovedBySupervisorName = (Supervisor != null && Supervisor["Author"] != null) ? new SPFieldUserValue(oWeb, (Supervisor["Author"].ToString())).User.Name : "",
                                                                                                    ApprovedBySecurityName = (Security != null && Security["Author"] != null) ? new SPFieldUserValue(oWeb, (Security["Author"].ToString())).User.Name : "",
                                                                                                };

                            if (RequestID != 0)
                            {
                                _DevicesRequestEntityEnumerable = _DevicesRequestEntityEnumerable.Where(r => r.ID == RequestID);
                            }


                            if (RequestCreateDate != null)
                            {
                                _DevicesRequestEntityEnumerable = _DevicesRequestEntityEnumerable.Where(r => r.DevicesRequestDate.Date == DateTime.Parse(RequestCreateDate.ToString()).Date);
                            }
                            if (!string.IsNullOrEmpty(ApplicantName))
                            {
                                _DevicesRequestEntityEnumerable = _DevicesRequestEntityEnumerable.Where(r => r.ApplicantName.ToLower().Contains(ApplicantName.ToLower()));
                            }

                            if (!string.IsNullOrEmpty(SupervisorName))
                            {
                                _DevicesRequestEntityEnumerable = _DevicesRequestEntityEnumerable.Where(r => r.SupervisorName.ToLower().Contains(SupervisorName.ToLower()));
                            }

                            if (!string.IsNullOrEmpty(DepartmentCode))
                            {
                                _DevicesRequestEntityEnumerable = _DevicesRequestEntityEnumerable.Where(r => r.ApplicantAdministration.ToLower() == DepartmentCode.ToLower());
                            }

                            if (!string.IsNullOrEmpty(SectionCode))
                            {
                                _DevicesRequestEntityEnumerable = _DevicesRequestEntityEnumerable.Where(r => r.ApplicantSection.ToLower() == SectionCode.ToLower());
                            }

                            if (!string.IsNullOrEmpty(Gate))
                            {
                                _DevicesRequestEntityEnumerable = _DevicesRequestEntityEnumerable.Where(r => r.Gate.ToLower() == Gate.ToLower());
                            }
                            if (ToDay)
                            {
                                _DevicesRequestEntityEnumerable = _DevicesRequestEntityEnumerable.Where(a => a.DevicesRequestDate.Date == DateTime.UtcNow.AddHours(3).Date);

                            }


                            if (_DevicesRequestEntityEnumerable.ToList().Count > 0)
                            {
                                for (int i = 0; i < _DevicesRequestEntityEnumerable.ToList().Count(); i++)
                                {
                                    _DevicesRequestEntity = new DevicesRequestEntity();
                                    _DevicesRequestEntity = ((DevicesRequestEntity)_DevicesRequestEntityEnumerable.ToList()[i]);



                                    //VisitRequestEntity.AprrovedVisitPersons = persons.ToList();
                                    foreach (MachineEntity p in machines)
                                    {
                                        if (p.ReqID == _DevicesRequestEntity.ID)
                                        {
                                            _DevicesRequestEntity.RequestMachines.Add(p);
                                        }
                                    }

                                    foreach (MachineEntity _MachineEntity in _DevicesRequestEntity.RequestMachines)
                                    {
                                        foreach (MachineActionEntity _MachineActionEntity in MachineActions)
                                        {
                                            if (_MachineEntity.ID == _MachineActionEntity.DeviceID)
                                            {

                                                _MachineEntity.MachineActions.Add(_MachineActionEntity);
                                            }
                                        }
                                    }
                                    _DevicesRequestEntityList.Add(_DevicesRequestEntity);

                                }
                                // VisitRequestt= VisitRequestt.Where(Visit=> Visit.VisitPersons.PersonCheckInOuts)
                                //if (DailyReport)
                                //{
                                //    foreach (DevicesRequestEntity request in _DevicesRequestEntityList)
                                //    {
                                //        request.RequestMachines = request.RequestMachines.Where(d => d.MachineActions.Count > 0).ToList();
                                //    }
                                //}

                                _DevicesRequestEntityList = _DevicesRequestEntityList.Where(v => v.RequestMachines.ToList().Count > 0).ToList();
                            }
                        }
                    }
                });
                generalResponse.StatusCode = (int)GeneralReturnValuesEnum.Success;
                generalResponse.Message = "Success";

            }
            catch (Exception ex)
            {
                generalResponse.StatusCode = (int)GeneralReturnValuesEnum.GeneralException;
                generalResponse.Message = ex.Message;
                NNewLogMethod.LogException(ex);                
            }

            return _DevicesRequestEntityList;
        }

        public IEnumerable<RequestEntity> GetUserRequests(string listSiteUrl, int userID, string requestStatus)
        {
            IEnumerable<RequestEntity> _MachinesList = new List<RequestEntity>();

            try
            {

                SPSecurity.RunWithElevatedPrivileges(() =>
                {
                    using (SPSite Site = new SPSite(Common.BaseUrl))
                    {
                        using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                        {
                            SPList DevicesRequestMachines = oWeb.Lists["DevicesRequestMachines"];
                            SPList DevicesRequests = oWeb.Lists["DevicesRequests"];
                            SPList SupervisorDevicesRequestStatus = oWeb.Lists["SupervisorDevicesRequestStatus"];
                            SPList SecurityDevicesRequestStatus = oWeb.Lists["SecurityDevicesRequestStatus"];


                            _MachinesList = from SPListItem Request in DevicesRequests.Items.Cast<SPListItem>()
                                            join Supervisor in SupervisorDevicesRequestStatus.Items.Cast<SPListItem>() on Request.ID equals new SPFieldLookupValue(Supervisor["RequestID"].ToString()).LookupId
                                                     into list1
                                            from Supervisor in list1.DefaultIfEmpty()
                                            join Security in SecurityDevicesRequestStatus.Items.Cast<SPListItem>()
                                            on Request.ID equals new SPFieldLookupValue(Security["SecurityRequestID"].ToString()).LookupId
                                            into list2
                                            from Security in list2.DefaultIfEmpty()
                                                //join machs in DevicesRequestMachines.Items.Cast<SPListItem>()
                                                //on Request.ID equals new SPFieldLookupValue(machs["DevicesRequestID"].ToString()).LookupId
                                                //into list3
                                                //from machs in list3.DefaultIfEmpty()

                                            orderby Request["Created"]

                                            //where !bool.Parse(Request["IsDeleted"].ToString()) && (machs["IsMachineDeleted"] != null ? !Convert.ToBoolean(machs["IsMachineDeleted"].ToString()) : true)
                                            //&& ((userID != 0) ? new SPFieldUserValue(oWeb, (Request["Author"].ToString())).User.ID == userID : true)

                                            where !bool.Parse(Request["IsDeleted"].ToString())
                                            && ((userID != 0) ? new SPFieldUserValue(oWeb, (Request["Author"].ToString())).User.ID == userID : true)

                                            select new RequestEntity
                                            {
                                                RequestId = Request != null ? Request.ID.ToString() : "",
                                                RequestDate = (Request != null && Request["DevicesRequestDate"] != null) ? DateTime.Parse(Request["DevicesRequestDate"].ToString()) : DateTime.MinValue,
                                                RequestCreationDate = (Request != null && Request["Created"] != null) ? DateTime.Parse(Request["Created"].ToString()) : DateTime.MinValue,
                                                CreatedByUserID = (Request != null && Request["Author"] != null) ? new SPFieldUserValue(oWeb, (Request["Author"].ToString())).User.ID : 0,
                                                SupervisorStatus = (Supervisor != null) ? Common.GetObjectProperty(Supervisor["Status"]) : "",
                                                SecurityStatus = (Security != null) ? Common.GetObjectProperty(Security["SecurityStatus"]) : "",
                                                RequestType = Request["RequestType"].ToString() == "0" ? MODBusinessResources.DevicesEntryRequestText : MODBusinessResources.DevicesExitRequestText
                                            };


                            _MachinesList = _MachinesList.ToList();
                            if (userID != 0)
                            {
                                _MachinesList = _MachinesList.Where(a => a.CreatedByUserID == userID);
                            }



                            if (requestStatus != "0")
                            {
                                switch (requestStatus)
                                {
                                    case null:
                                        _MachinesList = _MachinesList.Where(a => a.SupervisorStatus.ToLower() == "");
                                        break;

                                    case "":
                                        _MachinesList = _MachinesList.Where(a => a.SupervisorStatus.ToLower() == "");
                                        break;

                                    case "1-supervisor":
                                        _MachinesList = _MachinesList.Where(a => a.SupervisorStatus.ToLower() == "1" && a.SecurityStatus.ToLower() == "");
                                        break;

                                    case "2-supervisor":
                                        _MachinesList = _MachinesList.Where(a => a.SupervisorStatus.ToLower() == "2");
                                        break;

                                    case "1-security":
                                        _MachinesList = _MachinesList.Where(a => a.SecurityStatus.ToLower() == "1");
                                        break;

                                    case "2-security":
                                        _MachinesList = _MachinesList.Where(a => a.SecurityStatus.ToLower() == "2");
                                        break;

                                    default:
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

            return _MachinesList.ToList();
        }
    }
}
