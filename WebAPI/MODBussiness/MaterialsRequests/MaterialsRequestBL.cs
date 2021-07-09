using Microsoft.SharePoint;
using MODBussiness;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MotBussiness
{
    public class MaterialsRequestBL
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

        public void RemoveRequest(string listSiteUrl, int reqID)
        {
            try
            {
                SPSecurity.RunWithElevatedPrivileges(() =>
                {
                    MaterialsRequestEntity requestEntity = GetMaterialsRequestDetails(listSiteUrl, reqID);
                    using (SPSite Site = new SPSite(Common.BaseUrl))
                    {
                        using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                        {
                            oWeb.AllowUnsafeUpdates = true;
                            if (requestEntity != null && requestEntity.RequestMaterials != null && requestEntity.RequestMaterials.Count() > 0)
                            {
                                SPList MaterialsList = oWeb.Lists["Materials"];
                                foreach (MaterialEntity item in requestEntity.RequestMaterials)
                                {
                                    SPListItem MaterialsListItem = MaterialsList.GetItemById(item.ID);
                                    MaterialsListItem.Delete();
                                }
                            }

                            if (requestEntity != null)
                            {
                                SPList _MaterialsRequestsList = oWeb.Lists["MaterialsRequests"];
                                oWeb.AllowUnsafeUpdates = true;
                                SPListItem _MaterialsRequestsItem = _MaterialsRequestsList.GetItemById(reqID);
                                _MaterialsRequestsItem.Delete();
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

        public MaterialsRequestOutPut AddMaterialRequest(string listSiteUrl, MaterialsRequestEntity materialsRequestEntity)
        {
            MaterialsRequestOutPut materialsRequestOutPut = new MaterialsRequestOutPut();
            int RequestID = 0;
            try
            {
                materialsRequestOutPut = ValidateRequestObject(materialsRequestEntity, ActionType.Add);
                if (materialsRequestOutPut.statusCode != (int)GeneralReturnValuesEnum.Success)
                    return materialsRequestOutPut;

                using (SPSite Site = new SPSite(Common.BaseUrl))
                {
                    using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                    {
                        SPList materialsRequestsList = oWeb.Lists["MaterialsRequests"];
                        oWeb.AllowUnsafeUpdates = true;
                        SPListItem materialsRequestsItem = materialsRequestsList.Items.Add();
                        materialsRequestsItem["RequestType"] = materialsRequestEntity.RequestType;
                        materialsRequestsItem["Title"] = materialsRequestEntity.RequestMessage;
                        materialsRequestsItem["RequestMessage"] = materialsRequestEntity.RequestMessage;
                        materialsRequestsItem["RequestDate"] = materialsRequestEntity.RequestDate.AddDays(1);
                        materialsRequestsItem["ActionTime"] = materialsRequestEntity.ActionTime;
                        materialsRequestsItem["SupervisorName"] = materialsRequestEntity.SupervisorName;
                        materialsRequestsItem["IdentityNumber"] = materialsRequestEntity.IdentityNumber;
                        materialsRequestsItem["WorkingPlace"] = materialsRequestEntity.WorkingPlace;
                        materialsRequestsItem["ApplicantSection"] = materialsRequestEntity.ApplicantSection;
                        materialsRequestsItem["ApplicantRank"] = materialsRequestEntity.ApplicantRank;
                        materialsRequestsItem["ApplicantAdministration"] = materialsRequestEntity.ApplicantAdministration;
                        materialsRequestsItem["ApplicantName"] = materialsRequestEntity.ApplicantName;
                        materialsRequestsItem.Update();

                        RequestID = materialsRequestsItem.ID;


                        if (RequestID != 0)
                        {
                            SPList requestMaterialsList = oWeb.Lists["Materials"];
                            foreach (MaterialEntity item in materialsRequestEntity.RequestMaterials)
                            {
                                SPListItem requestMaterialsListItem = requestMaterialsList.Items.Add();
                                requestMaterialsListItem["Title"] = item.MaterialName;
                                requestMaterialsListItem["MaterialName"] = item.MaterialName;
                                requestMaterialsListItem["Quantity"] = item.Quantity;
                                requestMaterialsListItem["MaterialNotes"] = item.Notes;
                                requestMaterialsListItem["RequestID"] = new SPFieldLookupValue(materialsRequestsItem.ID, materialsRequestsItem.ID.ToString());
                                requestMaterialsListItem.Update();
                            }
                            materialsRequestOutPut.RequestID = RequestID;
                            materialsRequestOutPut.statusCode = 1;
                            materialsRequestOutPut.statusMessage = "request inserted done";

                        }
                        else
                        {
                            materialsRequestOutPut.RequestID = 0;
                            materialsRequestOutPut.statusCode = -1;
                            materialsRequestOutPut.statusMessage = "No request inserted";
                        }

                    }
                }
            }
            catch (Exception ex)
            {
                materialsRequestOutPut.RequestID = 0;
                materialsRequestOutPut.statusCode = -2;
                materialsRequestOutPut.statusMessage = ex.Message;
                NNewLogMethod.LogException(ex);

                if (RequestID != 0)
                {
                    RemoveRequest(listSiteUrl, RequestID);
                }

            }
            return materialsRequestOutPut;
        }

        private MaterialsRequestOutPut ValidateRequestObject(MaterialsRequestEntity materialsRequestEntity, ActionType actionType)
        {
            MaterialsRequestOutPut result = new MaterialsRequestOutPut() { statusCode = (int)GeneralReturnValuesEnum.Success, statusMessage = "SUccess" };
            if (actionType == ActionType.Edit)
            {
                if (materialsRequestEntity.ID == 0)
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "ID is required";
                    return result;
                }
            }

            if (string.IsNullOrEmpty(materialsRequestEntity.RequestMessage))
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "RequestMessage is required";
                return result;
            }
            if (materialsRequestEntity.RequestDate == null)
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "RequestDate is required";
                return result;
            }

            if (string.IsNullOrEmpty(materialsRequestEntity.ActionTime))
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "ActionTime is required";
                return result;
            }

            if (string.IsNullOrEmpty(materialsRequestEntity.SupervisorName))
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "SupervisorName is required";
                return result;
            }

            if (string.IsNullOrEmpty(materialsRequestEntity.IdentityNumber))
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "IdentityNumber is required";
                return result;
            }

            if (string.IsNullOrEmpty(materialsRequestEntity.ApplicantSection))
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "ApplicantSection is required";
                return result;
            }
            if (string.IsNullOrEmpty(materialsRequestEntity.ApplicantRank))
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "ApplicantRank is required";
                return result;
            }
            if (string.IsNullOrEmpty(materialsRequestEntity.ApplicantAdministration))
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "ApplicantAdministration is required";
                return result;
            }
            if (string.IsNullOrEmpty(materialsRequestEntity.ApplicantName))
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "ApplicantName is required";
                return result;
            }

            foreach (MaterialEntity item in materialsRequestEntity.RequestMaterials)
            {
                if (string.IsNullOrEmpty(item.MaterialName))
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "MaterialName is required";
                    return result;
                }

                if (item.Quantity == 0)
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "Quantity is required";
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

        public MaterialsRequestOutPut DeleteRequest(string listSiteUrl, int reqID)
        {
            MaterialsRequestOutPut _MaterialsRequestOutPut = new MaterialsRequestOutPut();
            try
            {
                using (SPSite Site = new SPSite(Common.BaseUrl))
                {
                    using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                    {
                        SPList _MaterialsRequestsList = oWeb.Lists["MaterialsRequests"];
                        oWeb.AllowUnsafeUpdates = true;
                        SPListItem _MaterialsRequestItem = _MaterialsRequestsList.GetItemById(reqID);
                        _MaterialsRequestItem["IsDeleted"] = true;
                        _MaterialsRequestItem.Update();
                        _MaterialsRequestOutPut.RequestID = _MaterialsRequestItem.ID;
                        _MaterialsRequestOutPut.statusCode = 1;
                        _MaterialsRequestOutPut.statusMessage = "Deleted";
                    }
                }

            }
            catch (Exception ex)
            {
                _MaterialsRequestOutPut.RequestID = 0;
                _MaterialsRequestOutPut.statusCode = -2;
                _MaterialsRequestOutPut.statusMessage = ex.Message;
                NNewLogMethod.LogException(ex);
            }
            return _MaterialsRequestOutPut;
        }

        public object SearchRequests(string listSiteUrl, int userID, int requestID, DateTime? CreationDate, DateTime? requestDate, string applicantName, string supervisorName, string materialName, string departmentCode, string sectionCode, string requestStatus, bool OnlyToday, string requestType, string Department, out GeneralResponse generalResponse)
        {
            generalResponse = new GeneralResponse();
            IEnumerable<MaterialRequestExtended> _MaterialsList = new List<MaterialRequestExtended>();

            try
            {

                //SPSecurity.RunWithElevatedPrivileges(() =>
                //{
                using (SPSite Site = new SPSite(Common.BaseUrl))
                {
                    using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                    {
                        SPList MaterialsRequestMaterials = oWeb.Lists["Materials"];
                        SPList MaterialsRequests = oWeb.Lists["MaterialsRequests"];
                        SPList SupervisorMaterialsRequestStatus = oWeb.Lists["SupervisorMaterialsRequestStatus"];
                        SPList SecurityMaterialsRequestStatus = oWeb.Lists["SecurityMaterialsRequestStatus"];


                        _MaterialsList = from SPListItem Request in MaterialsRequests.Items.Cast<SPListItem>()
                                         join Supervisor in SupervisorMaterialsRequestStatus.Items.Cast<SPListItem>() on Request.ID equals new SPFieldLookupValue(Supervisor["RequestID"].ToString()).LookupId
                                                  into list1
                                         from Supervisor in list1.DefaultIfEmpty()
                                         join Security in SecurityMaterialsRequestStatus.Items.Cast<SPListItem>()
                                         on Request.ID equals new SPFieldLookupValue(Security["SecurityRequestID"].ToString()).LookupId
                                         into list2
                                         from Security in list2.DefaultIfEmpty()
                                         join mats in MaterialsRequestMaterials.Items.Cast<SPListItem>()
                                         on Request.ID equals new SPFieldLookupValue(mats["RequestID"].ToString()).LookupId
                                         into list3
                                         from mats in list3.DefaultIfEmpty()

                                         orderby Request["Created"]

                                         where !bool.Parse(Request["IsDeleted"].ToString()) && (!string.IsNullOrEmpty(requestType) ? Request["RequestType"].ToString() == requestType : true) && (mats["IsMaterialDeleted"] != null ? !Convert.ToBoolean(mats["IsMaterialDeleted"].ToString()) : true)
                                         && ((userID != 0) ? new SPFieldUserValue(oWeb, (Request["Author"].ToString())).User.ID == userID : true)

                                         select new MaterialRequestExtended
                                         {
                                             RequestID = Request.ID,
                                             RequestMessage = Request != null ? Common.GetObjectProperty(Request["RequestMessage"]) : "",
                                             RequestDate = (Request != null && Request["RequestDate"] != null) ? DateTime.Parse(Request["RequestDate"].ToString()) : DateTime.MinValue,
                                             ActionTime = Request != null ? Common.GetObjectProperty(Request["ActionTime"]) : "",
                                             SupervisorName = Request != null ? Common.GetObjectProperty(Request["SupervisorName"]) : "",
                                             IdentityNumber = Request != null ? Common.GetObjectProperty(Request["IdentityNumber"]) : "",
                                             WorkingPlace = Request != null ? Common.GetObjectProperty(Request["WorkingPlace"]) : "",
                                             ApplicantName = Request != null ? Common.GetObjectProperty(Request["ApplicantName"]) : "",
                                             ApplicantAdministration = Request != null ? Common.GetObjectProperty(Request["ApplicantAdministration"]) : "",
                                             ApplicantSection = Request != null ? Common.GetObjectProperty(Request["ApplicantSection"]) : "",
                                             CreationDate = (Request != null && Request["Created"] != null) ? DateTime.Parse(Request["Created"].ToString()) : DateTime.MinValue,
                                             CreatedByUserId = (Request != null && Request["Author"] != null) ? new SPFieldUserValue(oWeb, (Request["Author"].ToString())).User.ID : 0,
                                             MaterialName = (mats != null) ? Common.GetObjectProperty(mats["MaterialName"]) : "",
                                             Quantity = (mats != null) ? Common.GetObjectProperty(mats["Quantity"]) : "",
                                             Notes = (mats != null) ? Common.GetObjectProperty(mats["MaterialNotes"]) : "",
                                             IsItemApproved = (mats != null) ? Common.GetObjectProperty(mats["Title"]) : "",
                                             SupervisorStatus = (Supervisor != null) ? Common.GetObjectProperty(Supervisor["Status"]) : "",
                                             SecurityStatus = (Security != null) ? Common.GetObjectProperty(Security["SecurityStatus"]) : "",
                                             ApprovedBySupervisorName = (Supervisor != null && Supervisor["Author"] != null) ? new SPFieldUserValue(oWeb, (Supervisor["Author"].ToString())).User.Name: "",
                                             ApprovedBySecurityName = (Security != null && Security["Author"] != null) ? new SPFieldUserValue(oWeb, (Security["Author"].ToString())).User.Name : "",
                                         };


                        if (OnlyToday)
                        {
                            //  _MaterialsList = _MaterialsList.Where(p => p.CreationDate.Date == DateTime.Today.Date);
                            if (!string.IsNullOrEmpty(Department))
                            {
                                _MaterialsList = _MaterialsList.Where(p => p.SupervisorStatus == "" || p.SupervisorStatus == "3");
                                _MaterialsList = _MaterialsList.Where(p => p.ApplicantAdministration.ToLower() == Department.ToLower());
                            }
                            else
                            {
                                _MaterialsList = _MaterialsList.Where(p => p.SupervisorStatus == "1" && p.SecurityStatus == "");
                            }
                        }
                        else
                        {
                            if (string.IsNullOrEmpty(Department) && userID == 0)
                            {
                                _MaterialsList = _MaterialsList.Where(p => p.SupervisorStatus == "1");
                            }
                        }


                        _MaterialsList = _MaterialsList.ToList();
                        if (userID != 0)
                        {
                            _MaterialsList = _MaterialsList.Where(a => a.CreatedByUserId == userID).ToList();
                        }
                        else
                        {
                            //  _MaterialsList = _MaterialsList.Where(a => a.CreationDate.Date == DateTime.Today.Date).ToList();
                        }

                        if (requestID != 0)
                        {
                            _MaterialsList = _MaterialsList.Where(a => a.RequestID == requestID).ToList();
                        }

                        if (CreationDate != null)
                        {
                            _MaterialsList = _MaterialsList.Where(a => a.CreationDate.Date == DateTime.Parse(CreationDate.ToString()).Date).ToList();
                        }
                        if (requestDate != null)
                        {

                            _MaterialsList = _MaterialsList.Where(a => a.RequestDate.Date == DateTime.Parse(requestDate.ToString()).Date).ToList();
                        }
                        if (!string.IsNullOrEmpty(applicantName))
                        {
                            _MaterialsList = _MaterialsList.Where(a => a.ApplicantName.ToLower().Contains(applicantName.ToLower())).ToList();
                        }

                        if (!string.IsNullOrEmpty(departmentCode))
                        {
                            _MaterialsList = _MaterialsList.Where(a => a.ApplicantAdministration.ToLower().Contains(departmentCode.ToLower())).ToList();
                        }


                        if (!string.IsNullOrEmpty(sectionCode))
                        {
                            _MaterialsList = _MaterialsList.Where(a => a.ApplicantSection.ToLower().Contains(sectionCode.ToLower())).ToList();
                        }


                        if (!string.IsNullOrEmpty(supervisorName))
                        {
                            _MaterialsList = _MaterialsList.Where(a => a.SupervisorName.ToLower().Contains(supervisorName.ToLower())).ToList();
                        }

                        if (!string.IsNullOrEmpty(materialName))
                        {
                            _MaterialsList = _MaterialsList.Where(a => a.MaterialName.ToLower().Contains(materialName.ToLower())).ToList();
                        }


                        if (requestStatus != "0")
                        {
                            switch (requestStatus)
                            {
                                case null:
                                    _MaterialsList = _MaterialsList.Where(a => a.SupervisorStatus.ToLower() == "");
                                    break;

                                case "":
                                    _MaterialsList = _MaterialsList.Where(a => a.SupervisorStatus.ToLower() == "");
                                    break;

                                case "1-supervisor":
                                    _MaterialsList = _MaterialsList.Where(a => a.SupervisorStatus.ToLower() == "1" && a.SecurityStatus.ToLower() == "");
                                    break;

                                case "2-supervisor":
                                    _MaterialsList = _MaterialsList.Where(a => a.SupervisorStatus.ToLower() == "2");
                                    break;

                                case "1-security":
                                    _MaterialsList = _MaterialsList.Where(a => a.SecurityStatus.ToLower() == "1");
                                    break;

                                case "2-security":
                                    _MaterialsList = _MaterialsList.Where(a => a.SecurityStatus.ToLower() == "2");
                                    break;

                                default:
                                    break;
                            }
                        }
                    }
                }
                //});
                generalResponse.StatusCode = (int)GeneralReturnValuesEnum.Success;
                generalResponse.Message = "Success";
            }
            catch (Exception ex)
            {
                generalResponse.StatusCode = (int)GeneralReturnValuesEnum.GeneralException;
                generalResponse.Message = ex.Message;
                NNewLogMethod.LogException(ex);
            }

            return _MaterialsList.ToList();
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
            }

            return _MachinesList;
        }

        public MaterialsRequestOutPut UpdateMaterialsRequest(string listSiteUrl, MaterialsRequestEntity materialsRequestEntity)
        {
            MaterialsRequestOutPut _MaterialsRequestOutPut = new MaterialsRequestOutPut();

            try
            {
                _MaterialsRequestOutPut = ValidateRequestObject(materialsRequestEntity, ActionType.Edit);
                if (_MaterialsRequestOutPut.statusCode != (int)GeneralReturnValuesEnum.Success)
                    return _MaterialsRequestOutPut;

                using (SPSite Site = new SPSite(Common.BaseUrl))
                {
                    using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                    {
                        SPList MaterialsRequestList = oWeb.Lists["MaterialsRequests"];
                        oWeb.AllowUnsafeUpdates = true;
                        SPListItem MaterialsRequestItem = MaterialsRequestList.GetItemById(materialsRequestEntity.ID);

                        if (!materialsRequestEntity.IsDeleted)
                        {
                            MaterialsRequestItem["RequestType"] = materialsRequestEntity.RequestType;
                            MaterialsRequestItem["Title"] = materialsRequestEntity.RequestMessage;
                            MaterialsRequestItem["RequestMessage"] = materialsRequestEntity.RequestMessage;
                            MaterialsRequestItem["RequestDate"] = materialsRequestEntity.RequestDate.AddDays(1);
                            MaterialsRequestItem["ActionTime"] = materialsRequestEntity.ActionTime;
                            MaterialsRequestItem["SupervisorName"] = materialsRequestEntity.SupervisorName;
                            MaterialsRequestItem["IdentityNumber"] = materialsRequestEntity.IdentityNumber;
                            MaterialsRequestItem["WorkingPlace"] = materialsRequestEntity.WorkingPlace;
                            MaterialsRequestItem["ApplicantName"] = materialsRequestEntity.ApplicantName;
                            MaterialsRequestItem["ApplicantSection"] = materialsRequestEntity.ApplicantSection;
                            MaterialsRequestItem["ApplicantRank"] = materialsRequestEntity.ApplicantRank;
                            MaterialsRequestItem["ApplicantAdministration"] = materialsRequestEntity.ApplicantAdministration;
                            MaterialsRequestItem.Update();

                            int RequestID = MaterialsRequestItem.ID;
                            if (RequestID != 0)
                            {
                                SPList MaterialsList = oWeb.Lists["Materials"];
                                int MaterialID = 0;
                                foreach (MaterialEntity item in materialsRequestEntity.RequestMaterials)
                                {
                                    //0 nothing ,1 newly added, 2 updated, 3 deleted
                                    if (item.State == 2)
                                    {
                                        SPListItem MaterialsListItem = MaterialsList.GetItemById(item.ID);
                                        if (MaterialsListItem != null)
                                        {
                                            MaterialsListItem["Title"] = item.MaterialName;
                                            MaterialsListItem["MaterialName"] = item.MaterialName;
                                            MaterialsListItem["Quantity"] = item.Quantity;
                                            MaterialsListItem["MaterialNotes"] = item.Notes;
                                            MaterialsListItem["RequestID"] = new SPFieldLookupValue(MaterialsRequestItem.ID, MaterialsRequestItem.ID.ToString());

                                            MaterialsListItem.Update();
                                            MaterialID = MaterialsListItem.ID;
                                        }

                                    }
                                    else if (item.State == 3)
                                    {
                                        SPListItem MaterialsListItem = MaterialsList.GetItemById(item.ID);
                                        if (MaterialsListItem != null)
                                        {
                                            MaterialsListItem["IsMaterialDeleted"] = true;
                                            MaterialsListItem.Update();
                                            MaterialID = MaterialsListItem.ID;
                                        }
                                    }
                                    else if (item.State == 1)
                                    {
                                        SPListItem MaterialsListItem = MaterialsList.Items.Add();

                                        MaterialsListItem["Title"] = item.MaterialName;
                                        MaterialsListItem["MaterialName"] = item.MaterialName;
                                        MaterialsListItem["Quantity"] = item.Quantity;
                                        MaterialsListItem["MaterialNotes"] = item.Notes;
                                        MaterialsListItem["RequestID"] = new SPFieldLookupValue(MaterialsRequestItem.ID, MaterialsRequestItem.ID.ToString());

                                        MaterialsListItem.Update();
                                        MaterialID = MaterialsListItem.ID;
                                        if (MaterialsListItem.ID == 0)
                                        {
                                            break;
                                        }
                                    }
                                }
                                _MaterialsRequestOutPut.RequestID = RequestID;
                                _MaterialsRequestOutPut.statusCode = 1;
                                _MaterialsRequestOutPut.statusMessage = "request Update done";

                            }
                            else
                            {
                                _MaterialsRequestOutPut.RequestID = 0;
                                _MaterialsRequestOutPut.statusCode = -1;
                                _MaterialsRequestOutPut.statusMessage = "No request Update";
                            }

                        }
                        else
                        {
                            MaterialsRequestItem["IsDeleted"] = materialsRequestEntity.IsDeleted;
                            MaterialsRequestItem.Update();
                            _MaterialsRequestOutPut.RequestID = materialsRequestEntity.ID;
                            _MaterialsRequestOutPut.statusCode = 1;
                            _MaterialsRequestOutPut.statusMessage = "request delete done";
                        }


                    }
                }

            }
            catch (Exception ex)
            {
                _MaterialsRequestOutPut.RequestID = 0;
                _MaterialsRequestOutPut.statusCode = -2;
                _MaterialsRequestOutPut.statusMessage = ex.Message;
                NNewLogMethod.LogException(ex);
            }
            return _MaterialsRequestOutPut;
        }

        public MaterialsRequestEntity GetMaterialsRequestDetails(string listSiteUrl, int requestID)
        {
            LoopUpList LoopUpList = new LoopUpList();
            MaterialsRequestEntity materialsRequestEntity = new MaterialsRequestEntity();

            try
            {
                SPSecurity.RunWithElevatedPrivileges(() =>
                {
                    using (SPSite Site = new SPSite(Common.BaseUrl))
                    {
                        using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                        {

                            SPList _MaterialsRequestsList = oWeb.Lists["MaterialsRequests"];
                            SPList _RequestMaterialsList = oWeb.Lists["Materials"];
                            var _MaterialsList = from SPListItem Request in _MaterialsRequestsList.Items.Cast<SPListItem>()
                                                 join Material in _RequestMaterialsList.Items.Cast<SPListItem>() on Request.ID.ToString() equals new SPFieldLookupValue(Material["RequestID"].ToString()).LookupValue
                                                 into list1
                                                 from Materials in list1.DefaultIfEmpty()
                                                 where Request.ID == requestID && !bool.Parse(Materials["IsMaterialDeleted"].ToString())
                                                 select new MaterialEntity
                                                 {
                                                     MaterialName = Materials != null ? Common.GetObjectProperty(Materials["MaterialName"]) : "",
                                                     Quantity = (Materials != null && Materials["Quantity"] != null) ? Convert.ToInt32(Materials["Quantity"].ToString()) : 0,
                                                     Notes = Materials != null ? Common.GetObjectProperty(Materials["MaterialNotes"]) : "",
                                                     ID = Materials.ID,
                                                     ItemIsApproved = Materials != null ? Common.GetObjectProperty(Materials["Title"]) : ""

                                                 };
                            var _MaterialsRequest = from SPListItem Request in _MaterialsRequestsList.Items.Cast<SPListItem>()
                                                    where Request.ID == requestID && bool.Parse(Request["IsDeleted"].ToString()) == false
                                                    select new MaterialsRequestEntity
                                                    {
                                                        ID = Request.ID,
                                                        RequestMessage = Request != null ? Common.GetObjectProperty(Request["RequestMessage"]) : "",
                                                        RequestDate = (Request != null && Request["RequestDate"] != null) ? DateTime.Parse(Request["RequestDate"].ToString()) : DateTime.MinValue,
                                                        ActionTime = Request != null ? Common.GetObjectProperty(Request["ActionTime"]) : "",
                                                        CreationDate = (Request != null && Request["Created"] != null) ? DateTime.Parse(Request["Created"].ToString()) : DateTime.MinValue,
                                                        SupervisorName = Request != null ? Common.GetObjectProperty(Request["SupervisorName"]) : "",
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



                            if (_MaterialsRequest.ToList().Count > 0)
                            {
                                materialsRequestEntity = ((MaterialsRequestEntity)_MaterialsRequest.ToList()[0]);
                                materialsRequestEntity.RequestMaterials = _MaterialsList.ToList();
                            }
                        }
                    }
                });
            }
            catch (Exception ex)
            {
                NNewLogMethod.LogException(ex);
            }

            return materialsRequestEntity;
        }

        public MaterialsRequestEntity GetMaterialsRequestDetailsForEdit(string listSiteUrl, string currentUserId, int requestID)
        {
            MaterialsRequestEntity entity = GetMaterialsRequestDetails(listSiteUrl, requestID);

            if (currentUserId != entity.CreatedByUserId.ToString() || !string.IsNullOrEmpty(entity.SecurityStatus) || !string.IsNullOrEmpty(entity.SupervisiorNote))
            {
                return null;
            }

            return entity;
        }

        public MaterialsRequestEntity GetMaterialsRequestDetailsForView(string listSiteUrl, string currentUserId, int requestID)
        {
            MaterialsRequestEntity entity = GetMaterialsRequestDetails(listSiteUrl, requestID);

            if (currentUserId != entity.CreatedByUserId.ToString())
            {
                return null;
            }

            return entity;
        }

        private MaterialsRequestOutPut ValidateFinalApproveRequestObject(MaterialsRequestEntity materialsRequestEntity)
        {
            MaterialsRequestOutPut result = new MaterialsRequestOutPut() { statusCode = (int)GeneralReturnValuesEnum.Success, statusMessage = "SUccess" };

            if (materialsRequestEntity.ID == 0)
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "ID is required";
                return result;
            }

            if (string.IsNullOrEmpty(materialsRequestEntity.ActionTime))
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "ActionTime is required";
                return result;
            }

            foreach (MaterialEntity item in materialsRequestEntity.RequestMaterials)
            {
                if (string.IsNullOrEmpty(item.MaterialName))
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "MaterialName is required";
                    return result;
                }

                if (item.Quantity == 0)
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "Quantity is required";
                    return result;
                }
            }

            return result;
        }

        public MaterialsRequestOutPut AddFinalAproveForRequest(string listSiteUrl, MaterialsRequestEntity materialsRequestEntity)
        {
            MaterialsRequestOutPut materialsRequestOutPut = new MaterialsRequestOutPut();
            try
            {
                materialsRequestOutPut = ValidateRequestObject(materialsRequestEntity, ActionType.Add);
                if (materialsRequestOutPut.statusCode != (int)GeneralReturnValuesEnum.Success)
                    return materialsRequestOutPut;

                using (SPSite Site = new SPSite(Common.BaseUrl))
                {
                    using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                    {
                        SPList materialsRequestsList = oWeb.Lists["MaterialsRequests"];
                        oWeb.AllowUnsafeUpdates = true;

                        if (materialsRequestEntity.ID != 0)
                        {

                            SPList requestMaterialsApprovalList = oWeb.Lists["MaterialsApproval"];
                            SPList OriginalRequestMaterialsList = oWeb.Lists["Materials"];
                            foreach (MaterialEntity item in materialsRequestEntity.RequestMaterials)
                            {
                                SPListItem requestMaterialsApprovalListItem = requestMaterialsApprovalList.Items.Add();
                                requestMaterialsApprovalListItem["MaterialName"] = item.MaterialName;
                                requestMaterialsApprovalListItem["Quantity"] = item.Quantity;
                                requestMaterialsApprovalListItem["MaterialNotes"] = item.Notes;
                                requestMaterialsApprovalListItem["RequestID"] = new SPFieldLookupValue(materialsRequestEntity.ID, materialsRequestEntity.ID.ToString());
                                requestMaterialsApprovalListItem.Update();


                                SPListItem OriginalRequestMaterialsItem = OriginalRequestMaterialsList.GetItemById(item.ID);
                                if (OriginalRequestMaterialsItem != null)
                                {
                                    OriginalRequestMaterialsItem["Title"] = "1";
                                    OriginalRequestMaterialsItem.Update();
                                }
                            }
                            materialsRequestOutPut.RequestID = materialsRequestEntity.ID;
                            materialsRequestOutPut.statusCode = 1;
                            materialsRequestOutPut.statusMessage = "request successfuly done";
                        }
                        else
                        {
                            materialsRequestOutPut.RequestID = 0;
                            materialsRequestOutPut.statusCode = -1;
                            materialsRequestOutPut.statusMessage = "Request Fail";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                materialsRequestOutPut.RequestID = 0;
                materialsRequestOutPut.statusCode = -2;
                materialsRequestOutPut.statusMessage = ex.Message;
                NNewLogMethod.LogException(ex);
            }
            return materialsRequestOutPut;
        }

        private MaterialsRequestOutPut ValidateAppoveObject(RequestStatus _RequestStatus)
        {
            MaterialsRequestOutPut result = new MaterialsRequestOutPut() { statusCode = (int)GeneralReturnValuesEnum.Success, statusMessage = "SUccess" };

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

        public MaterialsRequestOutPut AprroveSupervisor(string listSiteUrl, RequestStatus _RequestStatus)
        {
            MaterialsRequestOutPut _MaterialsRequestOutPut = new MaterialsRequestOutPut();
            try
            {
                _MaterialsRequestOutPut = ValidateAppoveObject(_RequestStatus);
                if (_MaterialsRequestOutPut.statusCode != (int)GeneralReturnValuesEnum.Success)
                    return _MaterialsRequestOutPut;

                bool isFound = false;
                using (SPSite Site = new SPSite(Common.BaseUrl))
                {
                    using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                    {
                        SPList SupervisorMaterialsRequestStatusList = oWeb.Lists["SupervisorMaterialsRequestStatus"];
                        SPList MaterialsRequestsList = oWeb.Lists["MaterialsRequests"];

                        oWeb.AllowUnsafeUpdates = true;
                        SPListItemCollection SupervisorMaterialsRequestStatusListItems = SupervisorMaterialsRequestStatusList.Items;
                        foreach (SPListItem item in SupervisorMaterialsRequestStatusListItems)
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
                            SPListItem NewMaterialsRequestStatus = SupervisorMaterialsRequestStatusList.Items.Add();
                            NewMaterialsRequestStatus["Title"] = _RequestStatus.StatusNote;
                            NewMaterialsRequestStatus["Status"] = _RequestStatus.Status;
                            NewMaterialsRequestStatus["ApprovalNote"] = _RequestStatus.StatusNote;
                            NewMaterialsRequestStatus["Depratment"] = _RequestStatus.Group;
                            NewMaterialsRequestStatus["RequestID"] = new SPFieldLookupValue(_RequestStatus.ReqID, _RequestStatus.ReqID.ToString());
                            NewMaterialsRequestStatus.Update();

                        }
                        SPListItem Request = MaterialsRequestsList.Items.GetItemById(_RequestStatus.ReqID);
                        Request["SupervisorMSG"] = _RequestStatus.StatusNote;
                        Request.Update();
                        _MaterialsRequestOutPut.RequestID = _RequestStatus.ReqID;
                        _MaterialsRequestOutPut.statusCode = 1;
                        _MaterialsRequestOutPut.statusMessage = "Approved Done";
                    }
                }
            }
            catch (Exception ex)
            {
                _MaterialsRequestOutPut.RequestID = 0;
                _MaterialsRequestOutPut.statusCode = -2;
                _MaterialsRequestOutPut.statusMessage = ex.Message.ToString();
                NNewLogMethod.LogException(ex);
            }
            return _MaterialsRequestOutPut;
        }

        public MaterialsRequestOutPut AprroveSecurity(string listSiteUrl, RequestStatus _RequestStatus)
        {
            MaterialsRequestOutPut _MaterialsRequestOutPut = new MaterialsRequestOutPut();
            try
            {
                _MaterialsRequestOutPut = ValidateAppoveObject(_RequestStatus);
                if (_MaterialsRequestOutPut.statusCode != (int)GeneralReturnValuesEnum.Success)
                    return _MaterialsRequestOutPut;

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
                        SPList SecurityMaterialsRequestStatusList = oWeb.Lists["SecurityMaterialsRequestStatus"];
                        SPList MaterialsRequestsList = oWeb.Lists["MaterialsRequests"];
                        SPListItem GatesItem = null;
                        //SPList Gates = oWeb.Lists["Gates"];

                        if (_RequestStatus.Gate > 0)
                        {
                            GatesItem = Gates.Items.GetItemById(_RequestStatus.Gate);
                        }
                        oWeb.AllowUnsafeUpdates = true;
                        SPListItemCollection SecurityMaterialsRequestStatusListItems = SecurityMaterialsRequestStatusList.Items;
                        foreach (SPListItem item in SecurityMaterialsRequestStatusListItems)
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
                            SPListItem newSecurityMaterialsRequestStatusListItem = SecurityMaterialsRequestStatusList.Items.Add();

                            newSecurityMaterialsRequestStatusListItem["Title"] = _RequestStatus.StatusNote;
                            newSecurityMaterialsRequestStatusListItem["SecurityStatus"] = _RequestStatus.Status;
                            newSecurityMaterialsRequestStatusListItem["SecurityApprovalNote"] = _RequestStatus.StatusNote;
                            newSecurityMaterialsRequestStatusListItem["SecurityDepratment"] = _RequestStatus.Group;
                            newSecurityMaterialsRequestStatusListItem["SecurityRequestID"] = new SPFieldLookupValue(_RequestStatus.ReqID, _RequestStatus.ReqID.ToString());
                            if (_RequestStatus.Gate > 0)
                                newSecurityMaterialsRequestStatusListItem["GatesLookup"] = new SPFieldLookupValue(_RequestStatus.Gate, GatesItem.Title);

                            newSecurityMaterialsRequestStatusListItem.Update();


                        }
                        SPListItem Request = MaterialsRequestsList.Items.GetItemById(_RequestStatus.ReqID);
                        Request["FinalApproval"] = _RequestStatus.Status;
                        Request["SecurityMSG"] = _RequestStatus.StatusNote;
                        if (_RequestStatus.Gate > 0)
                            Request["RequestGate"] = GatesItem.Title;

                        Request.Update();

                        _MaterialsRequestOutPut.RequestID = _RequestStatus.ReqID;
                        _MaterialsRequestOutPut.statusCode = 1;
                        _MaterialsRequestOutPut.statusMessage = "Approved Done";
                    }
                }

            }
            catch (Exception ex)
            {
                _MaterialsRequestOutPut.RequestID = 0;
                _MaterialsRequestOutPut.statusCode = -2;
                _MaterialsRequestOutPut.statusMessage = ex.Message;
                NNewLogMethod.LogException(ex);
            }
            return _MaterialsRequestOutPut;
        }

        private MaterialsRequestOutPut ValidateActionObject(List<MaterialEntity> materialsList)
        {
            MaterialsRequestOutPut result = new MaterialsRequestOutPut() { statusCode = (int)GeneralReturnValuesEnum.Success, statusMessage = "SUccess" };

            foreach (MaterialEntity _MaterialEntity in materialsList)
            {

                if (_MaterialEntity.ID == 0)
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "_MaterialEntity.ID is required";
                    return result;
                }

                if (_MaterialEntity.MaterialActions == null || _MaterialEntity.MaterialActions.Count == 0)
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "_MaterialEntity.MaterialActions is required";
                    return result;
                }

                if (_MaterialEntity.MaterialActions[0].MaterialID == 0)
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "_MaterialEntity.MaterialActions[0].MaterialID is required";
                    return result;
                }

                if (string.IsNullOrEmpty(_MaterialEntity.MaterialActions[0].ActionNotes))
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "_MaterialEntity.MaterialActions[0].ActionNotes is required";
                    return result;
                }
            }

            return result;
        }

        public MaterialsRequestOutPut AddMaterialAction(string listSiteUrl, List<MaterialEntity> materialsList)
        {
            MaterialsRequestOutPut _MaterialsRequestOutPut = new MaterialsRequestOutPut();
            try
            {
                _MaterialsRequestOutPut = ValidateActionObject(materialsList);
                if (_MaterialsRequestOutPut.statusCode != (int)GeneralReturnValuesEnum.Success)
                    return _MaterialsRequestOutPut;

                using (SPSite Site = new SPSite(Common.BaseUrl))
                {
                    using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                    {
                        foreach (MaterialEntity _MaterialEntity in materialsList)
                        {
                            SPListItem materialApprovalListItem = oWeb.Lists["MaterialsApproval"].GetItemById(_MaterialEntity.MaterialActions[0].MaterialID);
                            SPList MaterialActionsList = oWeb.Lists["MaterialActions"];
                            oWeb.AllowUnsafeUpdates = true;

                            if (_MaterialEntity.ID != 0)
                            {
                                SPListItem actionListItem = MaterialActionsList.Items.Add();

                                actionListItem["Title"] = materialApprovalListItem["MaterialName"].ToString();
                                actionListItem["MaterialID"] = new SPFieldLookupValue(_MaterialEntity.ID, materialApprovalListItem["MaterialName"].ToString());
                                actionListItem["ActionDate"] = DateTime.UtcNow.AddHours(3);
                                actionListItem["ActionNotes"] = _MaterialEntity.MaterialActions[0].ActionNotes;
                                actionListItem.Update();


                                _MaterialsRequestOutPut.RequestID = _MaterialEntity.ReqID;
                                _MaterialsRequestOutPut.statusCode = 1;
                                _MaterialsRequestOutPut.statusMessage = "Action successfuly  done";

                            }
                            else
                            {
                                _MaterialsRequestOutPut.RequestID = 0;
                                _MaterialsRequestOutPut.statusCode = -1;
                                _MaterialsRequestOutPut.statusMessage = "No Material Found";
                            }

                        }

                    }
                }
                //});
            }
            catch (Exception ex)
            {
                _MaterialsRequestOutPut.RequestID = 0;
                _MaterialsRequestOutPut.statusCode = -2;
                _MaterialsRequestOutPut.statusMessage = ex.Message;
                NNewLogMethod.LogException(ex);
            }
            return _MaterialsRequestOutPut;
        }

        public object GetActions(string listSiteUrl, int RequestID, bool ToDay, int UserID, DateTime? RequestCreateDate, string RequestType, string Gate, string ApplicantName, string SupervisorName, string MaterialName, string DepartmentCode, string SectionCode, bool DailyReport, out GeneralResponse generalResponse)
        {
            generalResponse = new GeneralResponse();

            List<MaterialsRequestEntity> _MaterialsRequestEntityList = new List<MaterialsRequestEntity>();
            MaterialsRequestEntity _MaterialsRequestEntity = new MaterialsRequestEntity();
            try
            {

                SPSecurity.RunWithElevatedPrivileges(() =>
                {
                    using (SPSite Site = new SPSite(Common.BaseUrl))
                    {
                        using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                        {

                            SPList MaterialsRequestsList = oWeb.Lists["MaterialsRequests"];
                            SPList RequestMaterialsApprovalList = oWeb.Lists["MaterialsApproval"];

                            SPList MaterialActionsList = oWeb.Lists["MaterialActions"];
                            IEnumerable<MaterialEntity> materials = from SPListItem Materials in RequestMaterialsApprovalList.Items.Cast<SPListItem>()
                                                                    join Request in MaterialsRequestsList.Items.Cast<SPListItem>()
                                                                      on new SPFieldLookupValue(Materials["RequestID"].ToString()).LookupId equals Request.ID
                                                                    into list1
                                                                    from p in list1.DefaultIfEmpty()
                                                                    select new MaterialEntity
                                                                    {
                                                                        MaterialName = Materials != null ? Common.GetObjectProperty(Materials["MaterialName"]) : "",
                                                                        Quantity = (Materials != null && Materials["Quantity"] != null) ? Convert.ToInt32(Materials["Quantity"].ToString()) : 0,
                                                                        Notes = Materials != null ? Common.GetObjectProperty(Materials["MaterialNotes"]) : "",
                                                                        ID = Materials.ID,
                                                                        ReqID = (Materials != null && Materials["RequestID"] != null) ? new SPFieldLookupValue(Materials["RequestID"].ToString()).LookupId : 0
                                                                    };

                            if (!string.IsNullOrEmpty(MaterialName))
                            {
                                materials = materials.Where(P => P.MaterialName.ToLower().Contains(MaterialName.ToLower()));
                            }


                            IEnumerable<MaterialActionEntity> MaterialActions = from SPListItem materialActs in MaterialActionsList.Items.Cast<SPListItem>()
                                                                                select new MaterialActionEntity
                                                                                {
                                                                                    MaterialID = (materialActs != null && materialActs["MaterialID"] != null) ? new SPFieldLookupValue(materialActs["MaterialID"] as String).LookupId : 0,
                                                                                    ActionDate = (materialActs != null && materialActs["ActionDate"] != null) ? DateTime.Parse(materialActs["ActionDate"].ToString()) : DateTime.MinValue,
                                                                                    ActionNotes = materialActs != null ? Common.GetObjectProperty(materialActs["ActionNotes"]) : "",
                                                                                    Created = (materialActs != null && materialActs["Created"] != null) ? DateTime.Parse(materialActs["Created"].ToString()) : DateTime.MinValue,
                                                                                    ActionDoneByName = (materialActs != null && materialActs["Author"] != null) ? new SPFieldUserValue(oWeb, (materialActs["Author"].ToString())).User.Name : "",
                                                                                };
                            //if (ToDay)
                            //{
                            //    MachineActions = MachineActions.Where(p => p.Created.Date == DateTime.Now.Date);
                            //}

                            SPList SupervisorMaterialsRequestStatus = oWeb.Lists["SupervisorMaterialsRequestStatus"];
                            SPList SecurityMaterialsRequestStatus = oWeb.Lists["SecurityMaterialsRequestStatus"];

                            IEnumerable<MaterialsRequestEntity> _MaterialsRequestEntityEnumerable = from SPListItem Request in MaterialsRequestsList.Items.Cast<SPListItem>()
                                                                                                    join Supervisor in SupervisorMaterialsRequestStatus.Items.Cast<SPListItem>() on Request.ID equals new SPFieldLookupValue(Supervisor["RequestID"].ToString()).LookupId
                                                                                                    into list1
                                                                                                    from Supervisor in list1.DefaultIfEmpty()
                                                                                                    join Security in SecurityMaterialsRequestStatus.Items.Cast<SPListItem>()
                                                                                                    on Request.ID equals new SPFieldLookupValue(Security["SecurityRequestID"].ToString()).LookupId
                                                                                                    into list2
                                                                                                    from Security in list2.DefaultIfEmpty()
                                                                                                        //                                    join pers in VisitingRequestPersons.Items.Cast<SPListItem>()
                                                                                                        //on Request.ID equals new SPFieldLookupValue(pers["VisitingRequestID"].ToString()).LookupId
                                                                                                        //into list3
                                                                                                        //from pers in list3.DefaultIfEmpty()
                                                                                                    where bool.Parse(Request["IsDeleted"].ToString()) == false
                                                                                                    && (!string.IsNullOrEmpty(RequestType) ? Request["RequestType"].ToString() == RequestType : true)
                                                                                                            && Request["FinalApproval"] != null
                                                                                                            && ((Request["FinalApproval"] != null) ? Request["FinalApproval"].ToString() == "1" : false)
                                                                                                            && ((UserID != 0) ? new SPFieldUserValue(oWeb, (Request["Author"].ToString())).User.ID == UserID : true)
                                                                                                    select new MaterialRequestExtended
                                                                                                    {
                                                                                                        ApplicantName = Request != null ? Common.GetObjectProperty(Request["ApplicantName"]) : "",
                                                                                                        SupervisorName = Request != null ? Common.GetObjectProperty(Request["SupervisorName"]) : "",
                                                                                                        ApplicantAdministration = Request != null ? Common.GetObjectProperty(Request["ApplicantAdministration"]) : "",
                                                                                                        ApplicantRank = Request != null ? Common.GetObjectProperty(Request["ApplicantRank"]) : "",
                                                                                                        RequestDate = (Request != null && Request["RequestDate"] != null) ? DateTime.Parse(Request["RequestDate"].ToString()) : DateTime.MinValue,
                                                                                                        ActionTime = Request != null ? Common.GetObjectProperty(Request["ActionTime"]) : "",
                                                                                                        RequestMessage = Request != null ? Common.GetObjectProperty(Request["RequestMessage"]) : "",
                                                                                                        ApplicantSection = Request != null ? Common.GetObjectProperty(Request["ApplicantSection"]) : "",
                                                                                                        ID = Request.ID,
                                                                                                        RequestGate = Request != null ? Common.GetObjectProperty(Request["RequestGate"]) : "",
                                                                                                        CreationDate = (Request != null && Request["Created"] != null) ? DateTime.Parse(Request["Created"].ToString()) : DateTime.MinValue,
                                                                                                        ApprovedBySupervisorName = (Supervisor != null && Supervisor["Author"] != null) ? new SPFieldUserValue(oWeb, (Supervisor["Author"].ToString())).User.Name : "",
                                                                                                        ApprovedBySecurityName = (Security != null && Security["Author"] != null) ? new SPFieldUserValue(oWeb, (Security["Author"].ToString())).User.Name : "",
                                                                                                    };
                            //if (!string.IsNullOrEmpty(IdentityNumber))
                            //{
                            //    RequestVist = RequestVist.Where(r => r.UserIdentyID.ToLower() == IdentityNumber.ToLower());
                            //}
                            //if (Nationality != 0)
                            //{
                            //    RequestVist = RequestVist.Where(r => r.Nationality == Nationality);
                            //}

                            if (RequestID != 0)
                            {
                                _MaterialsRequestEntityEnumerable = _MaterialsRequestEntityEnumerable.Where(r => r.ID == RequestID);
                            }

                            if (RequestCreateDate != null)
                            {
                                _MaterialsRequestEntityEnumerable = _MaterialsRequestEntityEnumerable.Where(r => r.RequestDate.Date == DateTime.Parse(RequestCreateDate.ToString()).Date);
                            }
                            if (!string.IsNullOrEmpty(ApplicantName))
                            {
                                _MaterialsRequestEntityEnumerable = _MaterialsRequestEntityEnumerable.Where(r => r.ApplicantName.ToLower().Contains(ApplicantName.ToLower()));
                            }

                            if (!string.IsNullOrEmpty(SupervisorName))
                            {
                                _MaterialsRequestEntityEnumerable = _MaterialsRequestEntityEnumerable.Where(r => r.SupervisorName.ToLower().Contains(SupervisorName.ToLower()));
                            }

                            if (!string.IsNullOrEmpty(DepartmentCode))
                            {
                                _MaterialsRequestEntityEnumerable = _MaterialsRequestEntityEnumerable.Where(r => r.ApplicantAdministration.ToLower() == DepartmentCode.ToLower());
                            }

                            if (!string.IsNullOrEmpty(SectionCode))
                            {
                                _MaterialsRequestEntityEnumerable = _MaterialsRequestEntityEnumerable.Where(r => r.ApplicantSection.ToLower() == SectionCode.ToLower());
                            }

                            if (!string.IsNullOrEmpty(Gate))
                            {
                                _MaterialsRequestEntityEnumerable = _MaterialsRequestEntityEnumerable.Where(r => r.RequestGate.ToLower() == Gate.ToLower());
                            }
                            if (ToDay)
                            {
                                _MaterialsRequestEntityEnumerable = _MaterialsRequestEntityEnumerable.Where(a => a.RequestDate.Date == DateTime.UtcNow.AddHours(3).Date);

                            }


                            if (_MaterialsRequestEntityEnumerable.ToList().Count > 0)
                            {
                                for (int i = 0; i < _MaterialsRequestEntityEnumerable.ToList().Count(); i++)
                                {
                                    _MaterialsRequestEntity = new MaterialsRequestEntity();
                                    _MaterialsRequestEntity = ((MaterialsRequestEntity)_MaterialsRequestEntityEnumerable.ToList()[i]);



                                    //VisitRequestEntity.AprrovedVisitPersons = persons.ToList();
                                    foreach (MaterialEntity p in materials)
                                    {
                                        if (p.ReqID == _MaterialsRequestEntity.ID)
                                        {
                                            _MaterialsRequestEntity.RequestMaterials.Add(p);
                                        }
                                    }

                                    foreach (MaterialEntity _MaterialEntity in _MaterialsRequestEntity.RequestMaterials)
                                    {
                                        foreach (MaterialActionEntity _MaterialActionEntity in MaterialActions)
                                        {
                                            if (_MaterialEntity.ID == _MaterialActionEntity.MaterialID)
                                            {

                                                _MaterialEntity.MaterialActions.Add(_MaterialActionEntity);
                                            }
                                        }
                                    }
                                    _MaterialsRequestEntityList.Add(_MaterialsRequestEntity);

                                }
                                // VisitRequestt= VisitRequestt.Where(Visit=> Visit.VisitPersons.PersonCheckInOuts)
                                //if (DailyReport)
                                //{
                                //    foreach (MaterialsRequestEntity request in _MaterialsRequestEntityList)
                                //    {
                                //        request.RequestMaterials = request.RequestMaterials.Where(d => d.MaterialActions.Count > 0).ToList();
                                //    }
                                //}

                                _MaterialsRequestEntityList = _MaterialsRequestEntityList.Where(v => v.RequestMaterials.ToList().Count > 0).ToList();
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

            return _MaterialsRequestEntityList;
        }

        public IEnumerable<RequestEntity> GetUserRequests(string listSiteUrl, int userID, string requestStatus)
        {
            IEnumerable<RequestEntity> _MaterialsList = new List<RequestEntity>();

            try
            {

                //SPSecurity.RunWithElevatedPrivileges(() =>
                //{
                using (SPSite Site = new SPSite(Common.BaseUrl))
                {
                    using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                    {
                        SPList MaterialsRequestMaterials = oWeb.Lists["Materials"];
                        SPList MaterialsRequests = oWeb.Lists["MaterialsRequests"];
                        SPList SupervisorMaterialsRequestStatus = oWeb.Lists["SupervisorMaterialsRequestStatus"];
                        SPList SecurityMaterialsRequestStatus = oWeb.Lists["SecurityMaterialsRequestStatus"];


                        _MaterialsList = from SPListItem Request in MaterialsRequests.Items.Cast<SPListItem>()
                                         join Supervisor in SupervisorMaterialsRequestStatus.Items.Cast<SPListItem>() on Request.ID equals new SPFieldLookupValue(Supervisor["RequestID"].ToString()).LookupId
                                                  into list1
                                         from Supervisor in list1.DefaultIfEmpty()
                                         join Security in SecurityMaterialsRequestStatus.Items.Cast<SPListItem>()
                                         on Request.ID equals new SPFieldLookupValue(Security["SecurityRequestID"].ToString()).LookupId
                                         into list2
                                         from Security in list2.DefaultIfEmpty()
                                             //join mats in MaterialsRequestMaterials.Items.Cast<SPListItem>()
                                             //on Request.ID equals new SPFieldLookupValue(mats["RequestID"].ToString()).LookupId
                                             //into list3
                                             //from mats in list3.DefaultIfEmpty()

                                         orderby Request["Created"]

                                         //where !bool.Parse(Request["IsDeleted"].ToString()) && (mats["IsMaterialDeleted"] != null ? !Convert.ToBoolean(mats["IsMaterialDeleted"].ToString()) : true)
                                         //&& ((userID != 0) ? new SPFieldUserValue(oWeb, (Request["Author"].ToString())).User.ID == userID : true)

                                         where !bool.Parse(Request["IsDeleted"].ToString())
                                         && ((userID != 0) ? new SPFieldUserValue(oWeb, (Request["Author"].ToString())).User.ID == userID : true)

                                         select new RequestEntity
                                         {
                                             RequestId = Request != null ? Request.ID.ToString() : "",
                                             RequestDate = (Request != null && Request["RequestDate"] != null) ? DateTime.Parse(Request["RequestDate"].ToString()) : DateTime.MinValue,
                                             RequestCreationDate = (Request != null && Request["Created"] != null) ? DateTime.Parse(Request["Created"].ToString()) : DateTime.MinValue,
                                             CreatedByUserID = (Request != null && Request["Author"] != null) ? new SPFieldUserValue(oWeb, (Request["Author"].ToString())).User.ID : 0,
                                             SupervisorStatus = (Supervisor != null) ? Common.GetObjectProperty(Supervisor["Status"]) : "",
                                             SecurityStatus = (Security != null) ? Common.GetObjectProperty(Security["SecurityStatus"]) : "",
                                             RequestType = Request["RequestType"].ToString() == "0" ? MODBusinessResources.MaterialsEntryRequestText : MODBusinessResources.MaterialsExitRequestText
                                         };


                        _MaterialsList = _MaterialsList.ToList();
                        if (userID != 0)
                        {
                            _MaterialsList = _MaterialsList.Where(a => a.CreatedByUserID == userID).ToList();
                        }

                        if (requestStatus != "0")
                        {
                            switch (requestStatus)
                            {
                                case null:
                                    _MaterialsList = _MaterialsList.Where(a => a.SupervisorStatus.ToLower() == "");
                                    break;

                                case "":
                                    _MaterialsList = _MaterialsList.Where(a => a.SupervisorStatus.ToLower() == "");
                                    break;

                                case "1-supervisor":
                                    _MaterialsList = _MaterialsList.Where(a => a.SupervisorStatus.ToLower() == "1" && a.SecurityStatus.ToLower() == "");
                                    break;

                                case "2-supervisor":
                                    _MaterialsList = _MaterialsList.Where(a => a.SupervisorStatus.ToLower() == "2");
                                    break;

                                case "1-security":
                                    _MaterialsList = _MaterialsList.Where(a => a.SecurityStatus.ToLower() == "1");
                                    break;

                                case "2-security":
                                    _MaterialsList = _MaterialsList.Where(a => a.SecurityStatus.ToLower() == "2");
                                    break;

                                default:
                                    break;
                            }
                        }
                    }
                }
                //});
            }
            catch (Exception ex)
            {
                NNewLogMethod.LogException(ex);
            }

            return _MaterialsList.ToList();
        }

    }
}
