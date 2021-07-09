using Microsoft.SharePoint;
using MODBussiness;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Transactions;

namespace MotBussiness
{
    public class VisitRequest
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

        public VisitRequestOutPut AddVisitRequest(string listSiteUrl, VisitRequestEntity visitRequestEntity)
        {
            VisitRequestOutPut VisitRequestOutPut = new VisitRequestOutPut();
            int RequestID = 0;
            try
            {

                VisitRequestOutPut = ValidateRequestObject(visitRequestEntity, ActionType.Add);
                if (VisitRequestOutPut.statusCode != (int)GeneralReturnValuesEnum.Success)
                    return VisitRequestOutPut;

                using (SPSite Site = new SPSite(Common.BaseUrl))
                {
                    using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                    {

                        SPListItem reason = oWeb.Lists["VisitingReasons"].GetItemById(visitRequestEntity.VisitReason);
                        SPList VisitingRequestList = oWeb.Lists["VisitingRequest"];
                        oWeb.AllowUnsafeUpdates = true;
                        SPListItem VisitingRequestItem = VisitingRequestList.Items.Add();
                        VisitingRequestItem["Title"] = visitRequestEntity.VisitMessage;
                        VisitingRequestItem["RequestMessage"] = visitRequestEntity.VisitMessage;
                        VisitingRequestItem["VistingStartDate"] = visitRequestEntity.VisitStartDate.AddDays(1);
                        VisitingRequestItem["VisitingTime"] = visitRequestEntity.VisitTime;
                        VisitingRequestItem["VistingEndDate"] = visitRequestEntity.VisitEndDate.AddDays(1);
                        VisitingRequestItem["ApplicantSection"] = visitRequestEntity.ApplicantSection;
                        VisitingRequestItem["ApplicantRank"] = visitRequestEntity.ApplicantRank;
                        VisitingRequestItem["ApplicantAdministration"] = visitRequestEntity.ApplicantAdministration;
                        VisitingRequestItem["ApplicantName"] = visitRequestEntity.UserName;
                        VisitingRequestItem["RequestReason"] = new SPFieldLookupValue(reason.ID, reason.Title);
                        VisitingRequestItem.Update();

                        RequestID = VisitingRequestItem.ID;
                        if (RequestID != 0)
                        {
                            SPList VisitPersonsList = oWeb.Lists["VisitingRequestPersons"];
                            SPList VisitingRequestMachineList = oWeb.Lists["VisitingRequestMachine"];
                            foreach (VisitPersonsEntity item in visitRequestEntity.VisitPersons)
                            {
                                SPListItem Nationality = oWeb.Lists["Nationality"].GetItemById(item.Nationality);
                                SPListItem Identity = oWeb.Lists["Identity"].GetItemById(item.IdentityType);

                                SPListItem VisitPersonsListItem = VisitPersonsList.Items.Add();
                                VisitPersonsListItem["Title"] = item.FirstName + " " + item.FatherName + " " + item.FamilyName + " " + item.LastName;
                                VisitPersonsListItem["PersonFirstName"] = item.FirstName;
                                VisitPersonsListItem["PersonFatherName"] = item.FatherName;
                                VisitPersonsListItem["PersonFamilyName"] = item.FamilyName;
                                VisitPersonsListItem["PersonLastName"] = item.LastName;
                                VisitPersonsListItem["Nationality"] = new SPFieldLookupValue(Nationality.ID, Nationality.Title);
                                VisitPersonsListItem["WorkingPlace"] = item.WorkingPlace;
                                VisitPersonsListItem["IdentityNumber"] = item.IdentityNumber;
                                VisitPersonsListItem["VisitingRequestID"] = new SPFieldLookupValue(VisitingRequestItem.ID, VisitingRequestItem.ID.ToString());
                                VisitPersonsListItem["IdentityType"] = new SPFieldLookupValue(Identity.ID, Identity.Title);
                                VisitPersonsListItem.Update();
                                if (VisitPersonsListItem.ID == 0)
                                {
                                    break;
                                }
                                else
                                {
                                    
                                    foreach (VisitDevicesEntity VisitDevicesEntity in item.VisitDevices)
                                    {
                                        SPListItem VisitingRequestMachineListItem = VisitingRequestMachineList.Items.Add();
                                        VisitingRequestMachineListItem["Title"] = VisitDevicesEntity.DeviceType;
                                        VisitingRequestMachineListItem["ManufacturingCompanyName"] = VisitDevicesEntity.ManufacturingCompanyName;
                                        VisitingRequestMachineListItem["DeviceNumber"] = VisitDevicesEntity.DeviceNumber;
                                        VisitingRequestMachineListItem["NotesAboutDevice"] = VisitDevicesEntity.NotesAboutDevice;
                                        VisitingRequestMachineListItem["DeviceType"] = VisitDevicesEntity.DeviceType;
                                        VisitingRequestMachineListItem["VisitingRequestPersons"] = new SPFieldLookupValue(VisitPersonsListItem.ID, VisitPersonsListItem.Title);
                                        VisitingRequestMachineListItem["PersonVisitingRequestID"] = new SPFieldLookupValue(VisitingRequestItem.ID, VisitingRequestItem.ID.ToString());
                                        VisitingRequestMachineListItem.Update();
                                    }
                                }
                            }
                            VisitRequestOutPut.RequestID = RequestID;
                            VisitRequestOutPut.statusCode = 1;
                            VisitRequestOutPut.statusMessage = "request inserted done";
                        }
                        else
                        {
                            VisitRequestOutPut.RequestID = 0;
                            VisitRequestOutPut.statusCode = -1;
                            VisitRequestOutPut.statusMessage = "No request inserted";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                VisitRequestOutPut.RequestID = 0;
                VisitRequestOutPut.statusCode = -2;
                VisitRequestOutPut.statusMessage = ex.Message;
                NNewLogMethod.LogException(ex);

                if (RequestID != 0)
                {
                    RemoveRequest(listSiteUrl, RequestID);
                }

            }


            return VisitRequestOutPut;
        }

        public void RemoveRequest(string listSiteUrl, int reqID)
        {
            try
            {
                SPSecurity.RunWithElevatedPrivileges(() =>
                {
                    VisitRequestEntity requestEntity = GetRequestDetails(listSiteUrl, reqID);
                    using (SPSite Site = new SPSite(Common.BaseUrl))
                    {
                        using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                        {
                            oWeb.AllowUnsafeUpdates = true;
                            if (requestEntity != null && requestEntity.VisitPersons != null && requestEntity.VisitPersons.Count() > 0)
                            {
                                SPList VisitPersonsList = oWeb.Lists["VisitingRequestPersons"];
                                SPList VisitingRequestMachineList = oWeb.Lists["VisitingRequestMachine"];
                                foreach (VisitPersonsEntity item in requestEntity.VisitPersons)
                                {
                                    if (item != null && item.VisitDevices != null && item.VisitDevices.Count() > 0)
                                    {
                                        foreach (VisitDevicesEntity itemMachine in item.VisitDevices)
                                        {
                                            SPListItem VisitDevicesListItem = VisitingRequestMachineList.GetItemById(itemMachine.ID);
                                            VisitDevicesListItem.Delete();
                                        }
                                    }
                                    SPListItem PersonsListItem = VisitPersonsList.GetItemById(item.ID);
                                    PersonsListItem.Delete();
                                }
                            }

                            if (requestEntity != null)
                            {
                                SPList _VisitingRequestList = oWeb.Lists["VisitingRequest"];
                                oWeb.AllowUnsafeUpdates = true;
                                SPListItem _VisitingRequestListItem = _VisitingRequestList.GetItemById(reqID);
                                _VisitingRequestListItem.Delete();
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

        private VisitRequestOutPut ValidateFinalApproveRequestObject(VisitRequestEntity visitRequestEntity)
        {
            VisitRequestOutPut result = new VisitRequestOutPut() { statusCode = (int)GeneralReturnValuesEnum.Success, statusMessage = "SUccess" };

            if (visitRequestEntity.ID == 0)
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "ID is required";
                return result;
            }

            if (string.IsNullOrEmpty(visitRequestEntity.VisitTime))
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "VisitTime is required";
                return result;
            }

            foreach (VisitPersonsEntity item in visitRequestEntity.VisitPersons)
            {
                if (string.IsNullOrEmpty(item.FirstName))
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "FirstName is required";
                    return result;
                }

                if (string.IsNullOrEmpty(item.LastName))
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "LastName is required";
                    return result;
                }
                if (item.Nationality == 0)
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "Nationality is required";
                    return result;
                }

                if (string.IsNullOrEmpty(item.IdentityNumber))
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "IdentityNumber is required";
                    return result;
                }
                if (item.IdentityType == 0)
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "IdentityType is required";
                    return result;
                }


                foreach (VisitDevicesEntity _VisitDevicesEntity in item.VisitDevices)
                {
                    if (string.IsNullOrEmpty(_VisitDevicesEntity.DeviceType))
                    {
                        result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                        result.statusMessage = "DeviceType is required";
                        return result;
                    }
                }
            }


            return result;
        }
        public VisitRequestOutPut AddFinalAproveForRequest(string listSiteUrl, VisitRequestEntity visitRequestEntity)
        {
            VisitRequestOutPut VisitRequestOutPut = new VisitRequestOutPut();

            try
            {
                VisitRequestOutPut = ValidateFinalApproveRequestObject(visitRequestEntity);
                if (VisitRequestOutPut.statusCode != (int)GeneralReturnValuesEnum.Success)
                    return VisitRequestOutPut;

                //SPSecurity.RunWithElevatedPrivileges(() =>
                //{
                using (SPSite Site = new SPSite(Common.BaseUrl))
                {
                    using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                    {
                        SPListItem reason = oWeb.Lists["VisitingReasons"].GetItemById(visitRequestEntity.VisitReason);
                        SPList VisitingRequestList = oWeb.Lists["VisitingRequest"];
                        oWeb.AllowUnsafeUpdates = true;

                        if (visitRequestEntity.ID != 0)
                        {
                            SPList VisitPersonsList = oWeb.Lists["RequestPersonsApproval"];
                            SPList VisitingRequestMachineList = oWeb.Lists["RequestDevicesApproval"];


                            SPList OriginalVisitPersonsList = oWeb.Lists["VisitingRequestPersons"];
                            SPList OriginalVisitingRequestMachineList = oWeb.Lists["VisitingRequestMachine"];

                            foreach (VisitPersonsEntity item in visitRequestEntity.VisitPersons)
                            {
                                SPListItem Nationality = oWeb.Lists["Nationality"].GetItemById(item.Nationality);
                                SPListItem Identity = oWeb.Lists["Identity"].GetItemById(item.IdentityType);

                                SPListItem VisitPersonsListItem = VisitPersonsList.Items.Add();
                                VisitPersonsListItem["Title"] = item.FirstName + " " + item.FatherName + " " + item.FamilyName + " " + item.LastName;
                                VisitPersonsListItem["PersonFirstName"] = item.FirstName;
                                VisitPersonsListItem["PersonFatherName"] = item.FatherName;
                                VisitPersonsListItem["PersonFamilyName"] = item.FamilyName;
                                VisitPersonsListItem["PersonLastName"] = item.LastName;
                                VisitPersonsListItem["Nationality"] = new SPFieldLookupValue(Nationality.ID, Nationality.Title);
                                VisitPersonsListItem["WorkingPlace"] = item.WorkingPlace;
                                VisitPersonsListItem["IdentityNumber"] = item.IdentityNumber;
                                VisitPersonsListItem["VisitingRequestID"] = new SPFieldLookupValue(visitRequestEntity.ID, visitRequestEntity.ID.ToString());
                                VisitPersonsListItem["IdentityType"] = new SPFieldLookupValue(Identity.ID, Identity.Title);
                                VisitPersonsListItem.Update();


                                //Get Original request person to update the title flag
                                SPListItem originalRequestPersonItem = OriginalVisitPersonsList.GetItemById(item.ID);
                                if (originalRequestPersonItem != null)
                                {
                                    originalRequestPersonItem["Title"] = "1";
                                    originalRequestPersonItem.Update();
                                }


                                if (VisitPersonsListItem.ID == 0)
                                {
                                    break;
                                }
                                else
                                {
                                    foreach (VisitDevicesEntity VisitDevicesEntity in item.VisitDevices)
                                    {
                                        SPListItem VisitingRequestMachineListItem = VisitingRequestMachineList.Items.Add();
                                        VisitingRequestMachineListItem["Title"] = VisitDevicesEntity.DeviceType;
                                        VisitingRequestMachineListItem["ManufacturingCompanyName"] = VisitDevicesEntity.ManufacturingCompanyName;
                                        VisitingRequestMachineListItem["DeviceNumber"] = VisitDevicesEntity.DeviceNumber;
                                        VisitingRequestMachineListItem["NotesAboutDevice"] = VisitDevicesEntity.NotesAboutDevice;
                                        VisitingRequestMachineListItem["DeviceType"] = VisitDevicesEntity.DeviceType;
                                        VisitingRequestMachineListItem["VisitingRequestPersons"] = new SPFieldLookupValue(VisitPersonsListItem.ID, VisitPersonsListItem.Title);
                                        VisitingRequestMachineListItem["PersonVisitingRequestID"] = new SPFieldLookupValue(visitRequestEntity.ID, visitRequestEntity.ID.ToString());
                                        VisitingRequestMachineListItem.Update();

                                        //Get Original request person to update the title flag
                                        SPListItem OriginalVisitingMachineItem = OriginalVisitingRequestMachineList.GetItemById(VisitDevicesEntity.ID);
                                        if (OriginalVisitingMachineItem != null)
                                        {
                                            OriginalVisitingMachineItem["Title"] = "1";
                                            OriginalVisitingMachineItem.Update();
                                        }
                                    }
                                }
                            }
                            VisitRequestOutPut.RequestID = visitRequestEntity.ID;
                            VisitRequestOutPut.statusCode = 1;
                            VisitRequestOutPut.statusMessage = "request inserted done";

                        }
                        else
                        {
                            VisitRequestOutPut.RequestID = 0;
                            VisitRequestOutPut.statusCode = -1;
                            VisitRequestOutPut.statusMessage = "No request inserted";
                        }
                    }
                }
                //});
            }
            catch (Exception ex)
            {
                VisitRequestOutPut.RequestID = 0;
                VisitRequestOutPut.statusCode = -2;
                VisitRequestOutPut.statusMessage = ex.Message;
                NNewLogMethod.LogException(ex);
            }


            return VisitRequestOutPut;
        }

        private VisitRequestOutPut ValidateCheckInOutObject(List<VisitPersonsEntity> visitPersons)
        {
            VisitRequestOutPut result = new VisitRequestOutPut() { statusCode = (int)GeneralReturnValuesEnum.Success, statusMessage = "SUccess" };

            foreach (VisitPersonsEntity visitPersonsEntity in visitPersons)
            {
                if (visitPersonsEntity.ID == 0)
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "visitPersonsEntity.ID is required";
                    return result;
                }

                if (visitPersonsEntity.PersonCheckInOuts == null || visitPersonsEntity.PersonCheckInOuts.Count == 0)
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "visitPersonsEntity.PersonCheckInOuts is required";
                    return result;
                }

                if (visitPersonsEntity.PersonCheckInOuts[0].ApprovedPersonID == 0)
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "visitPersonsEntity.PersonCheckInOuts[0].ApprovedPersonID is required";
                    return result;
                }

                if (string.IsNullOrEmpty(visitPersonsEntity.PersonCheckInOuts[0].CheckOutNotes))
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "visitPersonsEntity.PersonCheckInOuts[0].CheckOutNotes is required";
                    return result;
                }

                foreach (VisitDevicesEntity VisitDevicesEntity in visitPersonsEntity.VisitDevices)
                {
                    if (VisitDevicesEntity.ID == 0)
                    {
                        result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                        result.statusMessage = "VisitDevicesEntity.ID is required";
                        return result;
                    }

                    if (VisitDevicesEntity.DeviceCheckInOut == null || VisitDevicesEntity.DeviceCheckInOut.Count == 0)
                    {
                        result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                        result.statusMessage = "VisitDevicesEntity.DeviceCheckInOut is required";
                        return result;
                    }

                    if (string.IsNullOrEmpty(VisitDevicesEntity.DeviceCheckInOut[0].DeviceCheckOutNote))
                    {
                        result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                        result.statusMessage = "VisitDevicesEntity.DeviceCheckInOut[0].DeviceCheckOutNote is required";
                        return result;
                    }
                }
            }
            return result;
        }

        public VisitRequestOutPut AddCheckOut(string listSiteUrl, List<VisitPersonsEntity> visitPersons)
        {
            VisitRequestOutPut VisitRequestOutPut = new VisitRequestOutPut();

            try
            {

                VisitRequestOutPut = ValidateCheckInOutObject(visitPersons);
                if (VisitRequestOutPut.statusCode != (int)GeneralReturnValuesEnum.Success)
                    return VisitRequestOutPut;

                //SPSecurity.RunWithElevatedPrivileges(() =>
                //{
                foreach (VisitPersonsEntity visitPersonsEntity in visitPersons)
                {
                    using (SPSite Site = new SPSite(Common.BaseUrl))
                    {
                        using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                        {
                            SPListItem Person = oWeb.Lists["RequestPersonsApproval"].GetItemById(visitPersonsEntity.PersonCheckInOuts[0].ApprovedPersonID);
                            SPList PersonsInOutList = oWeb.Lists["PersonsInOut"];
                            SPList DeviceInOutList = oWeb.Lists["DevicesInOut"];
                            oWeb.AllowUnsafeUpdates = true;

                            if (visitPersonsEntity.ID != 0)
                            {
                                //SPList VisitPersonsList = oWeb.Lists["RequestPersonsApproval"];
                                //SPList VisitingRequestMachineList = oWeb.Lists["RequestDevicesApproval"];



                                int PersonInOutID = (from SPListItem person in PersonsInOutList.Items.Cast<SPListItem>()
                                                     where new SPFieldLookupValue(person["ApprovedPerson"] as String).LookupId == visitPersonsEntity.ID
                                                     && person["CheckOut"] == null
                                                     orderby DateTime.Parse(person["Created"].ToString()) descending
                                                     select person.ID).FirstOrDefault();



                                SPListItem InOut = PersonsInOutList.Items.GetItemById(PersonInOutID);
                                InOut["CheckOutNotes"] = visitPersonsEntity.PersonCheckInOuts[0].CheckOutNotes;
                                //InOut["CheckOut"] = DateTime.Now.AddDays(1);
                                InOut["CheckOut"] = DateTime.UtcNow.AddHours(3);
                                InOut.Update();

                                foreach (VisitDevicesEntity VisitDevicesEntity in visitPersonsEntity.VisitDevices)
                                {
                                    int DeviceInOutID = (from SPListItem Device in DeviceInOutList.Items.Cast<SPListItem>()
                                                         where new SPFieldLookupValue(Device["DeviceID"] as String).LookupId == VisitDevicesEntity.ID
                                                         && Device["DeviceCheckOut"] == null
                                                         orderby DateTime.Parse(Device["Created"].ToString()) descending
                                                         select Device.ID).FirstOrDefault();

                                    SPListItem DevInOut = DeviceInOutList.Items.GetItemById(DeviceInOutID);
                                    //DevInOut["DeviceCheckOut"] = DateTime.Now.AddDays(1);
                                    DevInOut["DeviceCheckOut"] = DateTime.UtcNow.AddHours(3);
                                    DevInOut["DeviceCheckOutNote"] = VisitDevicesEntity.DeviceCheckInOut[0].DeviceCheckOutNote;
                                    DevInOut.Update();
                                }

                                VisitRequestOutPut.RequestID = visitPersonsEntity.ReqID;
                                VisitRequestOutPut.statusCode = 1;
                                VisitRequestOutPut.statusMessage = "Check out  done";
                            }
                            else
                            {
                                VisitRequestOutPut.RequestID = 0;
                                VisitRequestOutPut.statusCode = -1;
                                VisitRequestOutPut.statusMessage = "No Person Found";
                            }
                        }
                    }
                }
                //});
            }
            catch (Exception ex)
            {
                VisitRequestOutPut.RequestID = 0;
                VisitRequestOutPut.statusCode = -2;
                VisitRequestOutPut.statusMessage = ex.Message;
                NNewLogMethod.LogException(ex);
            }
            return VisitRequestOutPut;
        }

        public VisitRequestOutPut AddCheckIn(string listSiteUrl, List<VisitPersonsEntity> visitPersons)
        {
            VisitRequestOutPut VisitRequestOutPut = new VisitRequestOutPut();

            try
            {
                VisitRequestOutPut = ValidateCheckInOutObject(visitPersons);
                if (VisitRequestOutPut.statusCode != (int)GeneralReturnValuesEnum.Success)
                    return VisitRequestOutPut;

                //SPSecurity.RunWithElevatedPrivileges(() =>
                //{
                using (SPSite Site = new SPSite(Common.BaseUrl))
                {
                    using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                    {
                        foreach (VisitPersonsEntity visitPersonsEntity in visitPersons)
                        {
                            SPListItem Person = oWeb.Lists["RequestPersonsApproval"].GetItemById(visitPersonsEntity.PersonCheckInOuts[0].ApprovedPersonID);
                            SPList PersonsInOutList = oWeb.Lists["PersonsInOut"];
                            SPList DeviceInOutList = oWeb.Lists["DevicesInOut"];
                            oWeb.AllowUnsafeUpdates = true;

                            if (visitPersonsEntity.ID != 0)
                            {
                                //SPList VisitPersonsList = oWeb.Lists["RequestPersonsApproval"];
                                //SPList VisitingRequestMachineList = oWeb.Lists["RequestDevicesApproval"];

                                SPListItem InOut = PersonsInOutList.Items.Add();

                                InOut["Title"] = Person["PersonFirstName"].ToString();
                                InOut["ApprovedPerson"] = new SPFieldLookupValue(visitPersonsEntity.ID, Person["PersonFirstName"].ToString());
                                InOut["CheckInNotes"] = visitPersonsEntity.PersonCheckInOuts[0].CheckInNotes;
                                //InOut["CheckIN"] = DateTime.Now.AddDays(1);
                                InOut["CheckIN"] = DateTime.UtcNow.AddHours(3);
                                InOut.Update();

                                foreach (VisitDevicesEntity VisitDevicesEntity in visitPersonsEntity.VisitDevices)
                                {
                                    SPListItem DevInOut = DeviceInOutList.Items.Add();
                                    DevInOut["Title"] = VisitDevicesEntity.DeviceType;
                                    //DevInOut["DeviceCheckIn"] = DateTime.Now.AddDays(1);
                                    DevInOut["DeviceCheckIn"] = DateTime.UtcNow.AddHours(3);
                                    DevInOut["DeviceID"] = new SPFieldLookupValue(VisitDevicesEntity.DeviceCheckInOut[0].DeviceID, VisitDevicesEntity.DeviceType);
                                    DevInOut["DeviceCheckInNote"] = VisitDevicesEntity.DeviceCheckInOut[0].DeviceCheckInNote;
                                    DevInOut.Update();
                                }

                                VisitRequestOutPut.RequestID = visitPersonsEntity.ReqID;
                                VisitRequestOutPut.statusCode = 1;
                                VisitRequestOutPut.statusMessage = "Check in  done";

                            }
                            else
                            {
                                VisitRequestOutPut.RequestID = 0;
                                VisitRequestOutPut.statusCode = -1;
                                VisitRequestOutPut.statusMessage = "No Person Found";
                            }

                        }

                    }
                }
                //});
            }
            catch (Exception ex)
            {
                VisitRequestOutPut.RequestID = 0;
                VisitRequestOutPut.statusCode = -2;
                VisitRequestOutPut.statusMessage = ex.Message;
                NNewLogMethod.LogException(ex);
            }


            return VisitRequestOutPut;
        }

        public List<VisitRequestEntity> GetCheckInCheckOut(string listSiteUrl, int RequestID, bool ToDay, int UserID, int Nationality, DateTime? RequestCreateDate, DateTime? RequestDate, string Gate, string ApplicantName, string FirstName, string FatherName, string FamilyName, string LastName, string DepartmentCode, string SectionCode, string IdentityNumber, bool DailyReport, out GeneralResponse generalResponse)
        {
            generalResponse = new GeneralResponse();
            LoopUpList LoopUpList = new LoopUpList();
            List<VisitRequestEntity> VisitRequestt = new List<VisitRequestEntity>();
            VisitRequestEntity VisitRequestEntity = new VisitRequestEntity();
            try
            {

                SPSecurity.RunWithElevatedPrivileges(() =>
                {
                    using (SPSite Site = new SPSite(Common.BaseUrl))
                    {
                        using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                        {

                            SPList VisitingRequest = oWeb.Lists["VisitingRequest"];
                            SPList VisitingRequestPersons = oWeb.Lists["RequestPersonsApproval"];
                            SPList VisitingRequestMachine = oWeb.Lists["RequestDevicesApproval"];

                            SPList PersonsInOut = oWeb.Lists["PersonsInOut"];
                            SPList DevicesInOut = oWeb.Lists["DevicesInOut"];
                            IEnumerable<VisitPersonsEntity> persons = from SPListItem Persons in VisitingRequestPersons.Items.Cast<SPListItem>()
                                                                      join Request in VisitingRequest.Items.Cast<SPListItem>()
                                                                        on new SPFieldLookupValue(Persons["VisitingRequestID"].ToString()).LookupId equals Request.ID
                                                                      into list1
                                                                      from p in list1.DefaultIfEmpty()
                                                                      select new VisitPersonsEntity
                                                                      {
                                                                          IdentityNumber = Persons != null ? Common.GetObjectProperty(Persons["IdentityNumber"]) : "",
                                                                          IdentityTypeValue = (Persons != null && Persons["IdentityType"] != null) ? new SPFieldLookupValue(Persons["IdentityType"] as String).LookupValue : "",
                                                                          IdentityType = (Persons != null && Persons["IdentityType"] != null) ? new SPFieldLookupValue(Persons["IdentityType"] as String).LookupId : 0,
                                                                          Nationality = (Persons != null && Persons["Nationality"] != null) ? new SPFieldLookupValue(Persons["Nationality"] as String).LookupId : 0,
                                                                          NationalityValue = (Persons != null && Persons["Nationality"] != null) ? new SPFieldLookupValue(Persons["Nationality"] as String).LookupValue : "",
                                                                          WorkingPlace = Persons != null ? Common.GetObjectProperty(Persons["WorkingPlace"]) : "",
                                                                          FirstName = Persons != null ? Common.GetObjectProperty(Persons["PersonFirstName"]) : "",
                                                                          FatherName = Persons != null ? Common.GetObjectProperty(Persons["PersonFatherName"]) : "",
                                                                          FamilyName = Persons != null ? Common.GetObjectProperty(Persons["PersonFamilyName"]) : "",
                                                                          LastName = Persons != null ? Common.GetObjectProperty(Persons["PersonLastName"]) : "",
                                                                          ID = Persons.ID,
                                                                          ReqID = (Persons != null && Persons["VisitingRequestID"] != null) ? new SPFieldLookupValue(Persons["VisitingRequestID"].ToString()).LookupId : 0
                                                                      };
                            if (Nationality != 0)
                            {
                                persons = persons.Where(P => P.Nationality == Nationality);
                            }
                            if (!string.IsNullOrEmpty(FirstName))
                            {
                                persons = persons.Where(P => P.FirstName.ToLower().Contains(FirstName.ToLower()));

                            }
                            if (!string.IsNullOrEmpty(FatherName))
                            {
                                persons = persons.Where(P => P.FatherName.ToLower().Contains(FatherName.ToLower()));

                            }
                            if (!string.IsNullOrEmpty(FamilyName))
                            {
                                persons = persons.Where(P => P.FamilyName.ToLower().Contains(FamilyName.ToLower()));

                            }
                            if (!string.IsNullOrEmpty(LastName))
                            {
                                persons = persons.Where(P => P.LastName.ToLower().Contains(LastName.ToLower()));

                            }

                            if (!string.IsNullOrEmpty(IdentityNumber))
                            {
                                persons = persons.Where(P => P.IdentityNumber.ToLower() == IdentityNumber.ToLower());
                            }


                            IEnumerable<PersonCheckInOutEntity> personsCheckInOut = from SPListItem PerInOut in PersonsInOut.Items.Cast<SPListItem>()
                                                                                    select new PersonCheckInOutEntity
                                                                                    {
                                                                                        ApprovedPersonID = (PerInOut != null && PerInOut["ApprovedPerson"] != null) ? new SPFieldLookupValue(PerInOut["ApprovedPerson"] as String).LookupId : 0,
                                                                                        CheckIN = (PerInOut != null && PerInOut["CheckIN"] != null) ? DateTime.Parse(PerInOut["CheckIN"].ToString()) : DateTime.MinValue,
                                                                                        CheckOut = (PerInOut != null && PerInOut["CheckOut"] != null) ? DateTime.Parse(PerInOut["CheckOut"].ToString()) : (DateTime?)null,
                                                                                        CheckInNotes = (PerInOut != null) ? Common.GetObjectProperty(PerInOut["CheckInNotes"]) : "",
                                                                                        CheckOutNotes = (PerInOut != null) ? Common.GetObjectProperty(PerInOut["CheckOutNotes"]) : "",
                                                                                        Created = (PerInOut != null && PerInOut["Created"] != null) ? DateTime.Parse(PerInOut["Created"].ToString()) : DateTime.MinValue,
                                                                                        ActionDoneByName = (PerInOut != null && PerInOut["Author"] != null) ? new SPFieldUserValue(oWeb, (PerInOut["Author"].ToString())).User.Name : "",
                                                                                       ActionModifiedByName = (PerInOut != null && PerInOut["Editor"] != null) ? new SPFieldUserValue(oWeb, (PerInOut["Editor"].ToString())).User.Name : "",
                                                                                    };
                            if (ToDay)
                            {
                                personsCheckInOut = personsCheckInOut.Where(p => p.Created.Date == DateTime.UtcNow.AddHours(3).Date);
                                //personsCheckInOut = personsCheckInOut.Where(p => p.CheckIN.Date == DateTime.Now.Date);
                            }

                            IEnumerable<DevicecCheckInOutEntity> DeviceCheckInOut = from SPListItem DevInOut in DevicesInOut.Items.Cast<SPListItem>()
                                                                                    select new DevicecCheckInOutEntity
                                                                                    {
                                                                                        DeviceID = (DevInOut != null && DevInOut["DeviceID"] != null) ? new SPFieldLookupValue(DevInOut["DeviceID"] as String).LookupId : 0,
                                                                                        DeviceCheckIn = (DevInOut != null && DevInOut["DeviceCheckIn"] != null) ? DateTime.Parse(DevInOut["DeviceCheckIn"].ToString()) : DateTime.MinValue,
                                                                                        DeviceCheckOut = (DevInOut != null && DevInOut["DeviceCheckOut"] != null) ? DateTime.Parse(DevInOut["DeviceCheckOut"].ToString()) : (DateTime?)null,
                                                                                        DeviceCheckInNote = (DevInOut != null) ? Common.GetObjectProperty(DevInOut["DeviceCheckInNote"]) : "",
                                                                                        DeviceCheckOutNote = (DevInOut != null) ? Common.GetObjectProperty(DevInOut["DeviceCheckOutNote"]) : "",
                                                                                        Created = (DevInOut != null && DevInOut["Created"] != null) ? DateTime.Parse(DevInOut["Created"].ToString()) : DateTime.MinValue

                                                                                    };
                            if (ToDay)
                            {
                                DeviceCheckInOut = DeviceCheckInOut.Where(d => d.Created.Date == DateTime.UtcNow.AddHours(3).Date);
                            }


                            SPList SupervisorVisitingRequestStatus = oWeb.Lists["SupervisorVisitingRequestStatus"];
                            SPList SecurityVisitingRequestStatus = oWeb.Lists["SecurityVisitingRequestStatus"];

                            IEnumerable<VisitRequestEntity> RequestVist = from SPListItem Request in VisitingRequest.Items.Cast<SPListItem>()
                                                                          join Supervisor in SupervisorVisitingRequestStatus.Items.Cast<SPListItem>() on Request.ID equals new SPFieldLookupValue(Supervisor["SupervisorVisitingRequestID"].ToString()).LookupId
                                                                          into list1
                                                                          from Supervisor in list1.DefaultIfEmpty()
                                                                          join Security in SecurityVisitingRequestStatus.Items.Cast<SPListItem>()
                                                                          on Request.ID equals new SPFieldLookupValue(Security["SecurityVisitingRequestID"].ToString()).LookupId
                                                                          into list2
                                                                          from Security in list2.DefaultIfEmpty()
                                                                              
                                                                          where bool.Parse(Request["IsDeleted"].ToString()) == false
                                                                          && Request["FinalApproval"] != null
                                                                          && ((Request["FinalApproval"] != null) ? Request["FinalApproval"].ToString() == "1" : false)
                                                                          && ((UserID != 0) ? new SPFieldUserValue(oWeb, (Request["Author"].ToString())).User.ID == UserID : true)
                                                                          select new VisitRequestEntity
                                                                          {
                                                                              UserName = Request != null ? Common.GetObjectProperty(Request["ApplicantName"]) : "",
                                                                              ApplicantAdministration = Request != null ? Common.GetObjectProperty(Request["ApplicantAdministration"]) : "",
                                                                              //ApplicantRank = Request != null ? Common.GetObjectProperty(Request["ApplicantRank"]) : "",
                                                                              VisitEndDate = (Request != null && Request["VistingEndDate"] != null) ? DateTime.Parse(Request["VistingEndDate"].ToString()) : DateTime.MinValue,
                                                                              //VisitMessage = Request != null ? Common.GetObjectProperty(Request["RequestMessage"]) : "",
                                                                              //VisitReasonValue = (Request != null && Request["RequestReason"] != null) ? new SPFieldLookupValue(Request["RequestReason"] as String).LookupValue : "",
                                                                              //VisitReason = (Request != null && Request["RequestReason"] != null) ? new SPFieldLookupValue(Request["RequestReason"] as String).LookupId : 0,
                                                                              VisitStartDate = (Request != null && Request["VistingStartDate"] != null) ? DateTime.Parse(Request["VistingStartDate"].ToString()) : DateTime.MinValue,
                                                                              VisitTime = Request != null ? Common.GetObjectProperty(Request["VisitingTime"]) : "",
                                                                              ApplicantSection = Request != null ? Common.GetObjectProperty(Request["ApplicantSection"]) : "",
                                                                              ID = Request.ID,
                                                                              Gate = (Request != null) ? Common.GetObjectProperty(Request["RequestGate"]) : "",
                                                                              RequestDate = (Request != null && Request["Created"] != null) ? DateTime.Parse(Request["Created"].ToString()) : DateTime.MinValue,
                                                                              ApprovedBySupervisorName = (Supervisor != null && Supervisor["Author"] != null) ? new SPFieldUserValue(oWeb, (Supervisor["Author"].ToString())).User.Name : "",
                                                                              ApprovedBySecurityName = (Security != null && Security["Author"] != null) ? new SPFieldUserValue(oWeb, (Security["Author"].ToString())).User.Name : "",
                                                                              SecurityNote = Request != null ? Common.GetObjectProperty(Request["SecurityMSG"]) : ""
                                                                          };
                            
                            if (RequestID != 0)
                            {
                                RequestVist = RequestVist.Where(r => r.ID == RequestID);
                            }

                            if (RequestCreateDate != null)
                            {
                                RequestVist = RequestVist.Where(r => r.RequestDate.Date == DateTime.Parse(RequestCreateDate.ToString()).Date);
                            }

                            if (RequestDate != null)
                            {
                                RequestVist = RequestVist.Where(a => a.VisitStartDate.Date <= DateTime.Parse(RequestDate.ToString()).Date);
                                RequestVist = RequestVist.Where(a => a.VisitEndDate.Date >= DateTime.Parse(RequestDate.ToString()).Date);
                            }

                            if (!string.IsNullOrEmpty(ApplicantName))
                            {
                                RequestVist = RequestVist.Where(r => r.UserName.ToLower().Contains(ApplicantName.ToLower()));
                            }
                            if (!string.IsNullOrEmpty(Gate))
                            {
                                RequestVist = RequestVist.Where(r => r.Gate.ToLower() == Gate.ToLower());
                            }

                            if (!string.IsNullOrEmpty(DepartmentCode))
                            {
                                RequestVist = RequestVist.Where(r => r.ApplicantAdministration == DepartmentCode);
                            }


                            if (!string.IsNullOrEmpty(SectionCode))
                            {
                                RequestVist = RequestVist.Where(r => r.ApplicantSection == SectionCode);
                            }

                            if (ToDay)
                            {
                                RequestVist = RequestVist.Where(a => a.VisitStartDate.Date <= DateTime.UtcNow.AddHours(3).Date);
                                RequestVist = RequestVist.Where(a => a.VisitEndDate.Date >= DateTime.UtcNow.AddHours(3).Date);
                            }

                            var RequestVistMachines =
                                                      from Machines in VisitingRequestMachine.Items.Cast<SPListItem>()
                                                      join SPListItem Persons in VisitingRequestPersons.Items.Cast<SPListItem>()
                                        on new SPFieldLookupValue(Machines["VisitingRequestPersons"].ToString()).LookupId equals Persons.ID

                                                              into list1
                                                      from Machine in list1.DefaultIfEmpty()
                                                      select new VisitDevicesEntity
                                                      {
                                                          DeviceNumber = Machines != null ? Common.GetObjectProperty(Machines["DeviceNumber"]) : "",
                                                          DeviceType = Machines != null ? Common.GetObjectProperty(Machines["DeviceType"]) : "",
                                                          ManufacturingCompanyName = Machines != null ? Common.GetObjectProperty(Machines["ManufacturingCompanyName"]) : "",
                                                          NotesAboutDevice = Machines != null ? Common.GetObjectProperty(Machines["NotesAboutDevice"]) : "",
                                                          PersonID = (Machines != null && Machines["VisitingRequestPersons"] != null) ? new SPFieldLookupValue(Machines["VisitingRequestPersons"].ToString()).LookupId : 0,
                                                          ID = Machines != null ? Machines.ID : 0
                                                      };
                            if (RequestVist.ToList().Count > 0)
                            {
                                for (int i = 0; i < RequestVist.ToList().Count(); i++)
                                {
                                    VisitRequestEntity = new VisitRequestEntity();
                                    VisitRequestEntity = ((VisitRequestEntity)RequestVist.ToList()[i]);
                                                                       
                                    foreach (VisitPersonsEntity p in persons)
                                    {
                                        if (p.ReqID == VisitRequestEntity.ID)
                                        {
                                            //VisitRequestEntity.AprrovedVisitPersons.Add(p);

                                            VisitRequestEntity.VisitPersons.Add(p);
                                        }
                                    }

                                    foreach (VisitPersonsEntity person in VisitRequestEntity.VisitPersons)
                                    {
                                        foreach (PersonCheckInOutEntity PersonCheckInOutEntity in personsCheckInOut)
                                        {
                                            if (person.ID == PersonCheckInOutEntity.ApprovedPersonID)
                                            {

                                                person.PersonCheckInOuts.Add(PersonCheckInOutEntity);
                                            }
                                        }

                                        foreach (VisitDevicesEntity Machine in RequestVistMachines.ToList())
                                        {
                                            foreach (DevicecCheckInOutEntity d in DeviceCheckInOut)
                                            {
                                                if (d.DeviceID == Machine.ID)
                                                {
                                                    Machine.DeviceCheckInOut.Add(d);
                                                }
                                            }
                                            if (person.ID == Machine.PersonID)
                                            {
                                                //person.ApprovedVisitDevices.Add(Machine);
                                                person.VisitDevices.Add(Machine);

                                            }
                                        }
                                    }
                                    VisitRequestt.Add(VisitRequestEntity);
                                }
                                
                                VisitRequestt = VisitRequestt.Where(v => v.VisitPersons.ToList().Count > 0).ToList();
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

            return VisitRequestt;
        }

        private VisitRequestOutPut ValidateAppoveObject(VisitingRequestStatus visitingRequestStatus)
        {
            VisitRequestOutPut result = new VisitRequestOutPut() { statusCode = (int)GeneralReturnValuesEnum.Success, statusMessage = "SUccess" };

            if (string.IsNullOrEmpty(visitingRequestStatus.Group))
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "Group is required";
                return result;
            }

            if (visitingRequestStatus.ReqID == 0)
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "ReqID is required";
                return result;
            }

            if (string.IsNullOrEmpty(visitingRequestStatus.Status))
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "Status is required";
                return result;
            }

            if (string.IsNullOrEmpty(visitingRequestStatus.StatusNote))
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "StatusNote is required";
                return result;
            }

            return result;
        }

        public VisitRequestOutPut AprroveSupervisor(string listSiteUrl, VisitingRequestStatus visitingRequestStatus)
        {
            VisitRequestOutPut VisitRequestOutPut = new VisitRequestOutPut();
            try
            {

                VisitRequestOutPut = ValidateAppoveObject(visitingRequestStatus);
                if (VisitRequestOutPut.statusCode != (int)GeneralReturnValuesEnum.Success)
                    return VisitRequestOutPut;

                bool isFound = false;
                //SPSecurity.RunWithElevatedPrivileges(() =>
                //{
                using (SPSite Site = new SPSite(Common.BaseUrl))
                {
                    using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                    {
                        SPList SupervisorVisitingRequestStatus = oWeb.Lists["SupervisorVisitingRequestStatus"];
                        SPList VisitingRequest = oWeb.Lists["VisitingRequest"];

                        oWeb.AllowUnsafeUpdates = true;
                        SPListItemCollection VisitingRequestItems = SupervisorVisitingRequestStatus.Items;
                        foreach (SPListItem item in VisitingRequestItems)
                        {

                            if (new SPFieldLookupValue(item["SupervisorVisitingRequestID"] as String).LookupId == visitingRequestStatus.ReqID)
                            {
                                isFound = true;
                                item["Status"] = visitingRequestStatus.Status;
                                item["ApprovalNote"] = visitingRequestStatus.StatusNote;
                                item["Depratment"] = visitingRequestStatus.Group;
                                item.Update();
                            }

                        }
                        if (!isFound)
                        {
                            SPListItem NewVisitingRequestItems = SupervisorVisitingRequestStatus.Items.Add();
                            NewVisitingRequestItems["Title"] = visitingRequestStatus.StatusNote;
                            NewVisitingRequestItems["Status"] = visitingRequestStatus.Status;
                            NewVisitingRequestItems["ApprovalNote"] = visitingRequestStatus.StatusNote;
                            NewVisitingRequestItems["Depratment"] = visitingRequestStatus.Group;
                            NewVisitingRequestItems["SupervisorVisitingRequestID"] = new SPFieldLookupValue(visitingRequestStatus.ReqID, visitingRequestStatus.ReqID.ToString());
                            NewVisitingRequestItems.Update();

                        }
                        SPListItem Request = VisitingRequest.Items.GetItemById(visitingRequestStatus.ReqID);
                        Request["SupervisorMSG"] = visitingRequestStatus.StatusNote;
                        Request.Update();
                        VisitRequestOutPut.RequestID = visitingRequestStatus.ReqID;
                        VisitRequestOutPut.statusCode = 1;
                        VisitRequestOutPut.statusMessage = "Approved Done";
                    }
                }
                //});
            }
            catch (Exception ex)
            {
                VisitRequestOutPut.RequestID = 0;
                VisitRequestOutPut.statusCode = -2;
                VisitRequestOutPut.statusMessage = ex.Message;
                NNewLogMethod.LogException(ex);
            }


            return VisitRequestOutPut;
        }


        public VisitRequestOutPut AprroveSecurity(string listSiteUrl, VisitingRequestStatus visitingRequestStatus)
        {
            VisitRequestOutPut VisitRequestOutPut = new VisitRequestOutPut();
            try
            {

                VisitRequestOutPut = ValidateAppoveObject(visitingRequestStatus);
                if (VisitRequestOutPut.statusCode != (int)GeneralReturnValuesEnum.Success)
                    return VisitRequestOutPut;

                bool isFound = false;
                //SPSecurity.RunWithElevatedPrivileges(() =>
                //{
                using (SPSite Site = new SPSite(Common.BaseUrl))
                {
                    SPList Gates;

                    using (SPWeb gatesWeb = Site.OpenWeb(Common.CommonWebUrl))
                    {
                        Gates = gatesWeb.Lists["Gates"];
                    }

                    using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                    {
                        SPList SecurityVisitingRequestStatus = oWeb.Lists["SecurityVisitingRequestStatus"];
                        SPList VisitingRequest = oWeb.Lists["VisitingRequest"];
                        SPListItem GatesItem = null;


                        if (visitingRequestStatus.Gate > 0)
                        {
                            GatesItem = Gates.Items.GetItemById(visitingRequestStatus.Gate);
                        }
                        oWeb.AllowUnsafeUpdates = true;
                        SPListItemCollection SecurityVisitingRequestItems = SecurityVisitingRequestStatus.Items;
                        foreach (SPListItem item in SecurityVisitingRequestItems)
                        {

                            if (new SPFieldLookupValue(item["SecurityVisitingRequestID"] as String).LookupId == visitingRequestStatus.ReqID)
                            {
                                isFound = true;
                                item["SecurityStatus"] = visitingRequestStatus.Status;
                                item["SecurityApprovalNote"] = visitingRequestStatus.StatusNote;
                                item["SecurityDepratment"] = visitingRequestStatus.Group;
                                if (visitingRequestStatus.Gate > 0)
                                    item["GatesLookup"] = new SPFieldLookupValue(visitingRequestStatus.Gate, GatesItem.Title);


                                item.Update();
                            }

                        }
                        if (!isFound)
                        {
                            SPListItem NewVisitingRequestItems = SecurityVisitingRequestStatus.Items.Add();

                            NewVisitingRequestItems["Title"] = visitingRequestStatus.StatusNote;
                            NewVisitingRequestItems["SecurityStatus"] = visitingRequestStatus.Status;
                            NewVisitingRequestItems["SecurityApprovalNote"] = visitingRequestStatus.StatusNote;
                            NewVisitingRequestItems["SecurityDepratment"] = visitingRequestStatus.Group;
                            NewVisitingRequestItems["SecurityVisitingRequestID"] = new SPFieldLookupValue(visitingRequestStatus.ReqID, visitingRequestStatus.ReqID.ToString());
                            if (visitingRequestStatus.Gate > 0)
                                NewVisitingRequestItems["GatesLookup"] = new SPFieldLookupValue(visitingRequestStatus.Gate, GatesItem.Title);

                            NewVisitingRequestItems.Update();


                        }
                        SPListItem Request = VisitingRequest.Items.GetItemById(visitingRequestStatus.ReqID);
                        Request["FinalApproval"] = visitingRequestStatus.Status;
                        Request["SecurityMSG"] = visitingRequestStatus.StatusNote;
                        if (visitingRequestStatus.Gate > 0)
                            Request["RequestGate"] = GatesItem.Title;

                        Request.Update();

                        VisitRequestOutPut.RequestID = visitingRequestStatus.ReqID;
                        VisitRequestOutPut.statusCode = 1;
                        VisitRequestOutPut.statusMessage = "Approved Done";
                    }
                }
                //});

            }
            catch (Exception ex)
            {
                VisitRequestOutPut.RequestID = 0;
                VisitRequestOutPut.statusCode = -2;
                VisitRequestOutPut.statusMessage = ex.Message;
                NNewLogMethod.LogException(ex);
            }


            return VisitRequestOutPut;
        }

        public VisitRequestOutPut DeleteRequest(string listSiteUrl, int reqID)
        {
            VisitRequestOutPut VisitRequestOutPut = new VisitRequestOutPut();
            try
            {
                using (SPSite Site = new SPSite(Common.BaseUrl))
                {
                    using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                    {
                        SPList VisitingRequestList = oWeb.Lists["VisitingRequest"];
                        oWeb.AllowUnsafeUpdates = true;
                        SPListItem VisitingRequestItem = VisitingRequestList.GetItemById(reqID);
                        VisitingRequestItem["IsDeleted"] = true;
                        VisitingRequestItem.Update();
                        VisitRequestOutPut.RequestID = VisitingRequestItem.ID;
                        VisitRequestOutPut.statusCode = 1;
                        VisitRequestOutPut.statusMessage = "Deleted";
                    }
                }

            }
            catch (Exception ex)
            {
                VisitRequestOutPut.RequestID = 0;
                VisitRequestOutPut.statusCode = -2;
                VisitRequestOutPut.statusMessage = ex.Message;
                NNewLogMethod.LogException(ex);
            }


            return VisitRequestOutPut;
        }

        public object SearchRequests(string listSiteUrl, int userID, int requestID, DateTime? requestCreateDate, DateTime? requestVisitDate, string applicantName, string firstName, string fatherName, string familyName, string lastName, int nationality, string departmentCode, string sectionCode, string identyNumber, string requestState, bool OnlyToday, string Department, out GeneralResponse generalResponse)
        {
            generalResponse = new GeneralResponse();
            IEnumerable<SearchRequestOutPut> persons = new List<SearchRequestOutPut>();

            try
            {

                SPSecurity.RunWithElevatedPrivileges(() =>
                {
                    using (SPSite Site = new SPSite(Common.BaseUrl))
                    {
                        using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                        {
                            SPList VisitingRequestPersons = oWeb.Lists["VisitingRequestPersons"];
                            SPList VisitingRequest = oWeb.Lists["VisitingRequest"];
                            SPList SupervisorVisitingRequestStatus = oWeb.Lists["SupervisorVisitingRequestStatus"];
                            SPList SecurityVisitingRequestStatus = oWeb.Lists["SecurityVisitingRequestStatus"];


                            persons = from SPListItem Request in VisitingRequest.Items.Cast<SPListItem>()
                                      join Supervisor in SupervisorVisitingRequestStatus.Items.Cast<SPListItem>() on Request.ID equals new SPFieldLookupValue(Supervisor["SupervisorVisitingRequestID"].ToString()).LookupId
                                               into list1
                                      from Supervisor in list1.DefaultIfEmpty()
                                      join Security in SecurityVisitingRequestStatus.Items.Cast<SPListItem>()
                                      on Request.ID equals new SPFieldLookupValue(Security["SecurityVisitingRequestID"].ToString()).LookupId
                                      into list2
                                      from Security in list2.DefaultIfEmpty()
                                      join pers in VisitingRequestPersons.Items.Cast<SPListItem>()
                                      on Request.ID equals new SPFieldLookupValue(pers["VisitingRequestID"].ToString()).LookupId
                                      into list3
                                      from pers in list3.DefaultIfEmpty()

                                      orderby Request["Created"]

                                      where !bool.Parse(Request["IsDeleted"].ToString())
                                      && ((userID != 0) ? new SPFieldUserValue(oWeb, (Request["Author"].ToString())).User.ID == userID : true)

                                      select new SearchRequestOutPut
                                      {
                                          ApplicantName = Request != null ? Common.GetObjectProperty(Request["ApplicantName"]) : "",
                                          Nationality = (pers != null && pers["Nationality"] != null) ? new SPFieldLookupValue(pers["Nationality"] as String).LookupId : 0,
                                          NationalityValue = (pers != null && pers["Nationality"] != null) ? new SPFieldLookupValue(pers["Nationality"] as String).LookupValue : "",
                                          FirstName = pers != null ? Common.GetObjectProperty(pers["PersonFirstName"]) : "",
                                          FatherName = pers != null ? Common.GetObjectProperty(pers["PersonFatherName"]) : "",
                                          FamilyName = pers != null ? Common.GetObjectProperty(pers["PersonFamilyName"]) : "",
                                          LastName = pers != null ? Common.GetObjectProperty(pers["PersonLastName"]) : "",
                                          RequestCreatedDate = (Request != null && Request["Created"] != null) ? DateTime.Parse(Request["Created"].ToString()) : DateTime.MinValue,
                                          UserIdentyID = pers != null ? Common.GetObjectProperty(pers["IdentityNumber"]) : "",
                                          UserIdentyTypeValue = (pers != null && pers["IdentityType"] != null) ? new SPFieldLookupValue(pers["IdentityType"] as String).LookupValue : "",
                                          UserIdentyType = (pers != null && pers["IdentityType"] != null) ? new SPFieldLookupValue(pers["IdentityType"] as String).LookupId : 0,
                                          ItemIsApproved = pers != null ? Common.GetObjectProperty(pers["Title"]) : "",
                                          VisitDate = (Request != null && Request["VistingStartDate"] != null) ? DateTime.Parse(Request["VistingStartDate"].ToString()) : DateTime.MinValue,
                                          RequestID = Request != null ? Request.ID : 0,
                                          SupervisorStatus = Supervisor != null ? Common.GetObjectProperty(Supervisor["Status"]) : "",
                                          SecurityStatus = Security != null ? Common.GetObjectProperty(Security["SecurityStatus"]) : "",
                                          CreaatedByID = (Request != null && Request["Author"] != null) ? new SPFieldUserValue(oWeb, (Request["Author"].ToString())).User.ID : 0,
                                          CreateDate = (Request != null && Request["Created"] != null) ? DateTime.Parse(Request["Created"].ToString()) : DateTime.UtcNow.AddHours(3),
                                          ApplicantAdministration = Request != null ? Common.GetObjectProperty(Request["ApplicantAdministration"]) : "",
                                          ApplicantSection = Request != null ? Common.GetObjectProperty(Request["ApplicantSection"]) : ""
                                      };


                            if (OnlyToday)
                            {
                                //  persons = persons.Where(p => p.CreateDate.Date == DateTime.Today.Date);
                                if (!string.IsNullOrEmpty(Department))
                                {
                                    persons = persons.Where(p => p.SupervisorStatus == "" || p.SupervisorStatus == "3");
                                    persons = persons.Where(p => p.ApplicantAdministration.ToLower() == Department.ToLower());
                                }
                                else
                                {
                                    persons = persons.Where(p => p.SupervisorStatus == "1" && p.SecurityStatus == "");
                                }
                            }
                            else
                            {
                                if (string.IsNullOrEmpty(Department) && userID == 0)
                                {
                                    persons = persons.Where(p => p.SupervisorStatus == "1");

                                }
                            }


                            persons = persons.ToList();
                            if (userID != 0)
                            {
                                persons = persons.Where(a => a.CreaatedByID == userID);
                            }
                            else
                            {
                                // persons = persons.Where(a => a.RequestCreatedDate.Date == DateTime.Today.Date);
                            }

                            if (requestID != 0)
                            {
                                persons = persons.Where(a => a.RequestID == requestID);
                            }

                            if (requestCreateDate != null)
                            {
                                persons = persons.Where(a => a.RequestCreatedDate.Date == DateTime.Parse(requestCreateDate.ToString()).Date);
                            }
                            if (requestVisitDate != null)
                            {
                                persons = persons.Where(a => a.VisitDate.Date == DateTime.Parse(requestVisitDate.ToString()).Date);
                            }
                            if (!string.IsNullOrEmpty(applicantName))
                            {
                                persons = persons.Where(a => a.ApplicantName.ToLower().Contains(applicantName.ToLower()));
                            }
                            if (!string.IsNullOrEmpty(firstName))
                            {
                                persons = persons.Where(a => a.FirstName.ToLower().Contains(firstName.ToLower()));
                            }
                            if (!string.IsNullOrEmpty(fatherName))
                            {
                                persons = persons.Where(a => a.FatherName.ToLower().Contains(fatherName.ToLower()));
                            }
                            if (!string.IsNullOrEmpty(familyName))
                            {
                                persons = persons.Where(a => a.FamilyName.ToLower().Contains(familyName.ToLower()));
                            }
                            if (!string.IsNullOrEmpty(lastName))
                            {
                                persons = persons.Where(a => a.LastName.ToLower().Contains(lastName.ToLower()));
                            }

                            if (nationality != 0)
                            {
                                persons = persons.Where(a => a.Nationality == nationality);
                            }

                            if (!string.IsNullOrEmpty(departmentCode))
                            {
                                persons = persons.Where(a => a.ApplicantAdministration.ToLower().Contains(departmentCode.ToLower()));
                            }


                            if (!string.IsNullOrEmpty(sectionCode))
                            {
                                persons = persons.Where(a => a.ApplicantSection.ToLower().Contains(sectionCode.ToLower()));
                            }

                            if (!string.IsNullOrEmpty(identyNumber))
                            {
                                persons = persons.Where(a => a.UserIdentyID.ToLower() == identyNumber.ToLower());
                            }
                            if (requestState != "0")
                            {
                                switch (requestState)
                                {
                                    case null:
                                        persons = persons.Where(a => a.SupervisorStatus.ToLower() == "");
                                        break;

                                    case "":
                                        persons = persons.Where(a => a.SupervisorStatus.ToLower() == "");
                                        break;

                                    case "1-supervisor":
                                        persons = persons.Where(a => a.SupervisorStatus.ToLower() == "1" && a.SecurityStatus.ToLower() == "");
                                        break;

                                    case "2-supervisor":
                                        persons = persons.Where(a => a.SupervisorStatus.ToLower() == "2");
                                        break;

                                    case "1-security":
                                        persons = persons.Where(a => a.SecurityStatus.ToLower() == "1");
                                        break;

                                    case "2-security":
                                        persons = persons.Where(a => a.SecurityStatus.ToLower() == "2");
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
                generalResponse.StatusCode = (int)GeneralReturnValuesEnum.GeneralException;
                generalResponse.Message = ex.Message;
                NNewLogMethod.LogException(ex);
            }

            return persons.ToList();
        }

        public object GetRequests(string listSiteUrl, int UserID, string Department, bool OnlyToday)
        {
            IEnumerable<RequestNoFilter> persons = new List<RequestNoFilter>();

            try
            {

                SPSecurity.RunWithElevatedPrivileges(() =>
                {
                    using (SPSite Site = new SPSite(Common.BaseUrl))
                    {
                        using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                        {
                            SPList VisitingRequestPersons = oWeb.Lists["VisitingRequestPersons"];

                            SPList VisitingRequest = oWeb.Lists["VisitingRequest"];
                            SPList SupervisorVisitingRequestStatus = oWeb.Lists["SupervisorVisitingRequestStatus"];
                            SPList SecurityVisitingRequestStatus = oWeb.Lists["SecurityVisitingRequestStatus"];
                            //persons = from SPListItem Supervisor in SupervisorVisitingRequestStatus.Items.Cast<SPListItem>()
                            //          join Request in VisitingRequest.Items.Cast<SPListItem>() on  new SPFieldLookupValue(Supervisor["SupervisorVisitingRequestID"].ToString()).LookupId equals Request.ID 
                            //          into list1


                            persons = from SPListItem Request in VisitingRequest.Items.Cast<SPListItem>()
                                      join Supervisor in SupervisorVisitingRequestStatus.Items.Cast<SPListItem>() on Request.ID equals new SPFieldLookupValue(Supervisor["SupervisorVisitingRequestID"].ToString()).LookupId
                                               into list1

                                      //persons = from SPListItem Security in SecurityVisitingRequestStatus.Items.Cast<SPListItem>()
                                      //          join Supervisor in SupervisorVisitingRequestStatus.Items.Cast<SPListItem>() on new SPFieldLookupValue(Security["SecurityVisitingRequestID"].ToString()).LookupId equals new SPFieldLookupValue(Supervisor["SupervisorVisitingRequestID"].ToString()).LookupId
                                      //          join Request in VisitingRequest.Items.Cast<SPListItem>() on  new SPFieldLookupValue(Supervisor["SupervisorVisitingRequestID"].ToString()).LookupId equals Request.ID 
                                      //          into list1

                                      from Supervisor in list1.DefaultIfEmpty()
                                      join Security in SecurityVisitingRequestStatus.Items.Cast<SPListItem>()
                                      on Request.ID equals new SPFieldLookupValue(Security["SecurityVisitingRequestID"].ToString()).LookupId
                                      into list2
                                      from Security in list2.DefaultIfEmpty()
                                      join pers in VisitingRequestPersons.Items.Cast<SPListItem>()
                                      on Request.ID equals new SPFieldLookupValue(pers["VisitingRequestID"].ToString()).LookupId
                                      into list3
                                      from pers in list3.DefaultIfEmpty()

                                      orderby Request["Created"]

                                      where !bool.Parse(Request["IsDeleted"].ToString())
                                      && ((UserID != 0) ? new SPFieldUserValue(oWeb, (Request["Author"].ToString())).User.ID == UserID : true)
                                      select new RequestNoFilter
                                      {

                                          UserName = Request["ApplicantName"].ToString(),
                                          ApplicantAdministration = Request["ApplicantAdministration"].ToString(),
                                          ApplicantRank = Request["ApplicantRank"].ToString(),
                                          VisitEndDate = DateTime.Parse(Request["VistingEndDate"].ToString()),
                                          VisitMessage = Request["RequestMessage"].ToString(),
                                          VisitReasonValue = new SPFieldLookupValue(Request["RequestReason"] as String).LookupValue,
                                          VisitReason = new SPFieldLookupValue(Request["RequestReason"] as String).LookupId,
                                          VisitStartDate = DateTime.Parse(Request["VistingStartDate"].ToString()),
                                          ApplicantSection = Request["ApplicantSection"].ToString(),
                                          RequestID = Request.ID,
                                          SupervisorStatus = (Supervisor != null) ? Supervisor["Status"].ToString() : "",
                                          SupervisorApprovalNote = (Supervisor != null) ? Supervisor["ApprovalNote"].ToString() : "",
                                          SecurityStatus = (Security != null) ? Security["SecurityStatus"].ToString() : "",
                                          SecurityApprovalNote = (Security != null) ? Security["SecurityApprovalNote"].ToString() : "",
                                          CreatedByID = new SPFieldUserValue(oWeb, (Request["Author"].ToString())).User.ID,
                                          DepratMent = (Supervisor != null) ? Supervisor["Depratment"].ToString() : "",
                                          Nationality = (pers != null) ? new SPFieldLookupValue(pers["Nationality"] as String).LookupId : 0,
                                          NationalityValue = (pers != null) ? new SPFieldLookupValue(pers["Nationality"] as String).LookupValue : "",
                                          FirstName = (pers != null) ? pers["PersonFirstName"].ToString() : "",
                                          FatherName = (pers != null) ? pers["PersonFatherName"].ToString() : "",
                                          FamilyName = (pers != null) ? pers["PersonFamilyName"].ToString() : "",
                                          LastName = (pers != null) ? pers["PersonLastName"].ToString() : "",
                                          UserIdentyID = (pers != null) ? pers["IdentityNumber"].ToString() : "",
                                          UserIdentyTypeValue = (pers != null) ? new SPFieldLookupValue(pers["IdentityType"] as String).LookupValue : "",
                                          UserIdentyType = (pers != null) ? new SPFieldLookupValue(pers["IdentityType"] as String).LookupId : 0,
                                          CreateDate = DateTime.Parse(Request["Created"].ToString())
                                      };
                            if (!string.IsNullOrEmpty(Department))
                            {
                                persons = persons.Where(p => p.ApplicantAdministration.ToLower() == Department.ToLower());
                            }


                            if (OnlyToday)
                            {
                                persons = persons.Where(p => p.CreateDate.Date == DateTime.Today.Date);
                                if (!string.IsNullOrEmpty(Department))
                                {
                                    persons = persons.Where(p => p.SupervisorStatus == "" || p.SupervisorStatus == "3");
                                }
                                else
                                {
                                    persons = persons.Where(p => p.SupervisorStatus == "1" && p.SecurityStatus == "");
                                }
                            }
                            else
                            {
                                if (string.IsNullOrEmpty(Department) && UserID == 0)
                                {
                                    persons = persons.Where(p => p.SupervisorStatus == "1");

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

            return persons;
        }

        public VisitRequestOutPut UpdateVisitRequest(string listSiteUrl, VisitRequestEntity visitRequestEntity)
        {
            VisitRequestOutPut VisitRequestOutPut = new VisitRequestOutPut();

            try
            {
                VisitRequestOutPut = ValidateRequestObject(visitRequestEntity, ActionType.Edit);
                if (VisitRequestOutPut.statusCode != (int)GeneralReturnValuesEnum.Success)
                    return VisitRequestOutPut;

                using (SPSite Site = new SPSite(Common.BaseUrl))
                {
                    using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                    {
                        SPListItem reason = oWeb.Lists["VisitingReasons"].GetItemById(visitRequestEntity.VisitReason);
                        SPList VisitingRequestList = oWeb.Lists["VisitingRequest"];
                        oWeb.AllowUnsafeUpdates = true;
                        SPListItem VisitingRequestItem = VisitingRequestList.GetItemById(visitRequestEntity.ID);

                        if (!visitRequestEntity.ISDeleted)
                        {

                            VisitingRequestItem["Title"] = visitRequestEntity.VisitMessage;
                            VisitingRequestItem["RequestMessage"] = visitRequestEntity.VisitMessage;
                            VisitingRequestItem["VistingStartDate"] = visitRequestEntity.VisitStartDate.AddDays(1);
                            VisitingRequestItem["VisitingTime"] = visitRequestEntity.VisitTime;
                            VisitingRequestItem["VistingEndDate"] = visitRequestEntity.VisitEndDate.AddDays(1);
                            VisitingRequestItem["ApplicantSection"] = visitRequestEntity.ApplicantSection;
                            VisitingRequestItem["ApplicantRank"] = visitRequestEntity.ApplicantRank;
                            VisitingRequestItem["ApplicantAdministration"] = visitRequestEntity.ApplicantAdministration;
                            VisitingRequestItem["ApplicantName"] = visitRequestEntity.UserName;
                            VisitingRequestItem["RequestReason"] = new SPFieldLookupValue(reason.ID, reason.Title);
                            VisitingRequestItem.Update();

                            int RequestID = VisitingRequestItem.ID;
                            if (RequestID != 0)
                            {
                                SPList VisitPersonsList = oWeb.Lists["VisitingRequestPersons"];
                                SPList VisitingRequestMachineList = oWeb.Lists["VisitingRequestMachine"];
                                int PersonID = 0;
                                foreach (VisitPersonsEntity item in visitRequestEntity.VisitPersons)
                                {
                                    SPListItem Nationality = oWeb.Lists["Nationality"].GetItemById(item.Nationality);
                                    SPListItem Identity = oWeb.Lists["Identity"].GetItemById(item.IdentityType);


                                    //0 nothing ,1 newly added, 2 updated, 3 deleted
                                    if (item.State == 2)
                                    {
                                        SPListItem VisitPersonsListItem = VisitPersonsList.GetItemById(item.ID);
                                        if (VisitPersonsListItem != null)
                                        {
                                            VisitPersonsListItem["Title"] = item.FirstName + " " + item.FatherName + " " + item.FamilyName + " " + item.LastName;
                                            VisitPersonsListItem["PersonFirstName"] = item.FirstName;
                                            VisitPersonsListItem["PersonFatherName"] = item.FatherName;
                                            VisitPersonsListItem["PersonFamilyName"] = item.FamilyName;
                                            VisitPersonsListItem["PersonLastName"] = item.LastName;
                                            VisitPersonsListItem["Nationality"] = new SPFieldLookupValue(Nationality.ID, Nationality.Title);
                                            VisitPersonsListItem["WorkingPlace"] = item.WorkingPlace;
                                            VisitPersonsListItem["IdentityNumber"] = item.IdentityNumber;
                                            VisitPersonsListItem["VisitingRequestID"] = new SPFieldLookupValue(VisitingRequestItem.ID, VisitingRequestItem.ID.ToString());
                                            VisitPersonsListItem["IdentityType"] = new SPFieldLookupValue(Identity.ID, Identity.Title);
                                            VisitPersonsListItem.Update();
                                            PersonID = VisitPersonsListItem.ID;
                                        }

                                    }
                                    else if (item.State == 3)
                                    {
                                        SPListItem VisitPersonsListItem = VisitPersonsList.GetItemById(item.ID);
                                        if (VisitPersonsListItem != null)
                                        {
                                            VisitPersonsListItem["IsVisitPersonDeleted"] = true;
                                            VisitPersonsListItem.Update();
                                            PersonID = VisitPersonsListItem.ID;
                                        }
                                    }
                                    else if (item.State == 1)
                                    {
                                        SPListItem VisitPersonsListItem = VisitPersonsList.Items.Add();

                                        VisitPersonsListItem["Title"] = item.FirstName + " " + item.FatherName + " " + item.FamilyName + " " + item.LastName;
                                        VisitPersonsListItem["PersonFirstName"] = item.FirstName;
                                        VisitPersonsListItem["PersonFatherName"] = item.FatherName;
                                        VisitPersonsListItem["PersonFamilyName"] = item.FamilyName;
                                        VisitPersonsListItem["PersonLastName"] = item.LastName;
                                        VisitPersonsListItem["Nationality"] = new SPFieldLookupValue(Nationality.ID, Nationality.Title);
                                        VisitPersonsListItem["WorkingPlace"] = item.WorkingPlace;
                                        VisitPersonsListItem["IdentityNumber"] = item.IdentityNumber;
                                        VisitPersonsListItem["VisitingRequestID"] = new SPFieldLookupValue(VisitingRequestItem.ID, VisitingRequestItem.ID.ToString());
                                        VisitPersonsListItem["IdentityType"] = new SPFieldLookupValue(Identity.ID, Identity.Title);
                                        VisitPersonsListItem.Update();
                                        PersonID = VisitPersonsListItem.ID;
                                        if (VisitPersonsListItem.ID == 0)
                                        {
                                            break;
                                        }
                                    }



                                    foreach (VisitDevicesEntity VisitDevicesEntity in item.VisitDevices)
                                    {
                                        //0 nothing ,1 newly added, 2 updated, 3 deleted
                                        if (VisitDevicesEntity.State == 2)
                                        {
                                            SPListItem VisitPersonsListItem = VisitPersonsList.GetItemById(PersonID);
                                            SPListItem VisitingRequestMachineListItem = VisitingRequestMachineList.GetItemById(VisitDevicesEntity.ID);

                                            if (VisitingRequestMachineListItem != null)
                                            {

                                                VisitingRequestMachineListItem["Title"] = VisitDevicesEntity.DeviceType;
                                                VisitingRequestMachineListItem["ManufacturingCompanyName"] = VisitDevicesEntity.ManufacturingCompanyName;
                                                VisitingRequestMachineListItem["DeviceNumber"] = VisitDevicesEntity.DeviceNumber;
                                                VisitingRequestMachineListItem["NotesAboutDevice"] = VisitDevicesEntity.NotesAboutDevice;
                                                VisitingRequestMachineListItem["DeviceType"] = VisitDevicesEntity.DeviceType;
                                                VisitingRequestMachineListItem["VisitingRequestPersons"] = new SPFieldLookupValue(VisitPersonsListItem.ID, VisitPersonsListItem.Title);
                                                VisitingRequestMachineListItem["PersonVisitingRequestID"] = new SPFieldLookupValue(VisitingRequestItem.ID, VisitingRequestItem.Title);
                                                VisitingRequestMachineListItem.Update();

                                            }

                                        }
                                        else if (VisitDevicesEntity.State == 3)
                                        {
                                            SPListItem VisitingRequestMachineListItem = VisitingRequestMachineList.GetItemById(VisitDevicesEntity.ID);

                                            if (VisitingRequestMachineListItem != null)
                                            {
                                                VisitingRequestMachineListItem["IsVisitMachineDeleted"] = true;
                                                VisitingRequestMachineListItem.Update();
                                            }
                                        }
                                        else if (VisitDevicesEntity.State == 1)
                                        {
                                            SPListItem VisitPersonsListItem = VisitPersonsList.GetItemById(PersonID);
                                            SPListItem VisitingRequestMachineListItem = VisitingRequestMachineList.Items.Add();

                                            VisitingRequestMachineListItem["Title"] = VisitDevicesEntity.DeviceType;
                                            VisitingRequestMachineListItem["ManufacturingCompanyName"] = VisitDevicesEntity.ManufacturingCompanyName;
                                            VisitingRequestMachineListItem["DeviceNumber"] = VisitDevicesEntity.DeviceNumber;
                                            VisitingRequestMachineListItem["NotesAboutDevice"] = VisitDevicesEntity.NotesAboutDevice;
                                            VisitingRequestMachineListItem["DeviceType"] = VisitDevicesEntity.DeviceType;
                                            VisitingRequestMachineListItem["VisitingRequestPersons"] = new SPFieldLookupValue(VisitPersonsListItem.ID, VisitPersonsListItem.Title);
                                            VisitingRequestMachineListItem["PersonVisitingRequestID"] = new SPFieldLookupValue(VisitingRequestItem.ID, VisitingRequestItem.Title);
                                            VisitingRequestMachineListItem.Update();
                                        }

                                    }





                                }
                                VisitRequestOutPut.RequestID = RequestID;
                                VisitRequestOutPut.statusCode = 1;
                                VisitRequestOutPut.statusMessage = "request Update done";

                            }
                            else
                            {
                                VisitRequestOutPut.RequestID = 0;
                                VisitRequestOutPut.statusCode = -1;
                                VisitRequestOutPut.statusMessage = "No request Update";
                            }

                        }
                        else
                        {
                            VisitingRequestItem["IsDeleted"] = visitRequestEntity.ISDeleted;
                            VisitingRequestItem.Update();
                            VisitRequestOutPut.RequestID = VisitingRequestItem.ID;
                            VisitRequestOutPut.statusCode = 1;
                            VisitRequestOutPut.statusMessage = "request delete done";
                        }


                    }
                }

            }
            catch (Exception ex)
            {
                VisitRequestOutPut.RequestID = 0;
                VisitRequestOutPut.statusCode = -2;
                VisitRequestOutPut.statusMessage = ex.Message;
                NNewLogMethod.LogException(ex);
            }


            return VisitRequestOutPut;
        }

        public VisitRequestEntity GetRequestDetails(string listSiteUrl, int requestID)
        {
            LoopUpList LoopUpList = new LoopUpList();
            VisitRequestEntity VisitRequestt = new VisitRequestEntity();

            try
            {

                SPSecurity.RunWithElevatedPrivileges(() =>
                {
                    using (SPSite Site = new SPSite(Common.BaseUrl))
                    {
                        using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                        {

                            SPList VisitingRequest = oWeb.Lists["VisitingRequest"];
                            SPList VisitingRequestPersons = oWeb.Lists["VisitingRequestPersons"];
                            SPList VisitingRequestMachine = oWeb.Lists["VisitingRequestMachine"];
                            var persons = from SPListItem Request in VisitingRequest.Items.Cast<SPListItem>()
                                          join Persons in VisitingRequestPersons.Items.Cast<SPListItem>() on Request.ID.ToString() equals new SPFieldLookupValue(Persons["VisitingRequestID"].ToString()).LookupValue
                                          into list1
                                          from Persons in list1.DefaultIfEmpty()
                                          where Request.ID == requestID && !bool.Parse(Persons["IsVisitPersonDeleted"].ToString())
                                          select new VisitPersonsEntity
                                          {
                                              IdentityNumber = Persons != null ? Common.GetObjectProperty(Persons["IdentityNumber"]) : "",
                                              IdentityTypeValue = (Persons != null && Persons["IdentityType"] != null) ? new SPFieldLookupValue(Persons["IdentityType"] as String).LookupValue : "",
                                              IdentityType = (Persons != null && Persons["IdentityType"] != null) ? new SPFieldLookupValue(Persons["IdentityType"] as String).LookupId : 0,
                                              Nationality = (Persons != null && Persons["Nationality"] != null) ? new SPFieldLookupValue(Persons["Nationality"] as String).LookupId : 0,
                                              NationalityValue = (Persons != null && Persons["Nationality"] != null) ? new SPFieldLookupValue(Persons["Nationality"] as String).LookupValue : "",
                                              WorkingPlace = Persons != null ? Common.GetObjectProperty(Persons["WorkingPlace"]) : "",
                                              FirstName = Persons != null ? Common.GetObjectProperty(Persons["PersonFirstName"]) : "",
                                              FatherName = Persons != null ? Common.GetObjectProperty(Persons["PersonFatherName"]) : "",
                                              FamilyName = Persons != null ? Common.GetObjectProperty(Persons["PersonFamilyName"]) : "",
                                              LastName = Persons != null ? Common.GetObjectProperty(Persons["PersonLastName"]) : "",
                                              ID = Persons.ID,
                                              ItemIsApproved = Persons != null ? Common.GetObjectProperty(Persons["Title"]) : ""

                                          };
                            var RequestVist = from SPListItem Request in VisitingRequest.Items.Cast<SPListItem>()
                                              where Request.ID == requestID && bool.Parse(Request["IsDeleted"].ToString()) == false
                                              select new VisitRequestEntity
                                              {
                                                  UserName = Request != null ? Common.GetObjectProperty(Request["ApplicantName"]) : "",
                                                  ApplicantAdministration = Request != null ? Common.GetObjectProperty(Request["ApplicantAdministration"]) : "",
                                                  ApplicantRank = Request != null ? Common.GetObjectProperty(Request["ApplicantRank"]) : "",
                                                  VisitEndDate = Request != null ? DateTime.Parse(Request["VistingEndDate"].ToString()) : DateTime.MinValue,
                                                  VisitMessage = Request != null ? Common.GetObjectProperty(Request["RequestMessage"]) : "",
                                                  VisitReasonValue = (Request != null && Request["RequestReason"] != null) ? new SPFieldLookupValue(Request["RequestReason"] as String).LookupValue : "",
                                                  VisitReason = (Request != null && Request["RequestReason"] != null) ? new SPFieldLookupValue(Request["RequestReason"] as String).LookupId : 0,
                                                  VisitStartDate = (Request != null && Request["VistingStartDate"] != null) ? DateTime.Parse(Request["VistingStartDate"].ToString()) : DateTime.MinValue,
                                                  VisitTime = Request != null ? Common.GetObjectProperty(Request["VisitingTime"]) : "",
                                                  ApplicantSection = Request != null ? Common.GetObjectProperty(Request["ApplicantSection"]) : "",
                                                  ID = Request.ID,
                                                  SecurityNote = Request != null ? Common.GetObjectProperty(Request["SecurityMSG"]) : "",
                                                  SecuertyState = Request != null ? Common.GetObjectProperty(Request["FinalApproval"]) : "",
                                                  SuperVisiorNote = Request != null ? Common.GetObjectProperty(Request["SupervisorMSG"]) : "",
                                                  CreateBy = (Request != null && Request["Author"] != null) ? new SPFieldUserValue(oWeb, (Request["Author"].ToString())).User.ID.ToString() : ""
                                              };



                            var RequestVistMachines =
                                                      from Machines in VisitingRequestMachine.Items.Cast<SPListItem>()
                                                      join SPListItem Persons in VisitingRequestPersons.Items.Cast<SPListItem>()
                                        on new SPFieldLookupValue(Machines["VisitingRequestPersons"].ToString()).LookupId equals Persons.ID

                                                              into list1
                                                      from Machine in list1.DefaultIfEmpty()
                                                      where new SPFieldLookupValue(Machines["PersonVisitingRequestID"].ToString()).LookupId == requestID && !bool.Parse(Machines["IsVisitMachineDeleted"].ToString())
                                                      select new VisitDevicesEntity
                                                      {
                                                          DeviceNumber = Machines != null ? Common.GetObjectProperty(Machines["DeviceNumber"]) : "",
                                                          DeviceType = Machines != null ? Common.GetObjectProperty(Machines["DeviceType"]) : "",
                                                          ManufacturingCompanyName = Machines != null ? Common.GetObjectProperty(Machines["ManufacturingCompanyName"]) : "",
                                                          NotesAboutDevice = Machines != null ? Common.GetObjectProperty(Machines["NotesAboutDevice"]) : "",
                                                          PersonID = (Machines != null && Machines["VisitingRequestPersons"] != null) ? new SPFieldLookupValue(Machines["VisitingRequestPersons"].ToString()).LookupId : 0,
                                                          ID = Machines != null ? Machines.ID : 0,
                                                          ItemIsApproved = Machines != null ? Common.GetObjectProperty(Machines["Title"]) : ""
                                                      };

                            if (RequestVist.ToList().Count > 0)
                            {
                                VisitRequestt = ((VisitRequestEntity)RequestVist.ToList()[0]);
                                VisitRequestt.VisitPersons = persons.ToList();
                                foreach (VisitPersonsEntity person in VisitRequestt.VisitPersons)
                                {
                                    foreach (VisitDevicesEntity Machine in RequestVistMachines.ToList())
                                    {
                                        if (person.ID == Machine.PersonID)
                                        {
                                            person.VisitDevices.Add(Machine);
                                        }
                                    }
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




            return VisitRequestt;
        }

        public VisitRequestEntity GetRequestDetailsForEdit(string listSiteUrl, string currentUserId, int requestID)
        {
            VisitRequestEntity entity = GetRequestDetails(listSiteUrl, requestID);

            if (currentUserId != entity.CreateBy || !string.IsNullOrEmpty(entity.SecuertyState) || !string.IsNullOrEmpty(entity.SuperVisiorNote))
            {
                return null;
            }

            return entity;
        }

        public VisitRequestEntity GetRequestDetailsForView(string listSiteUrl, string currentUserId, int requestID)
        {
            VisitRequestEntity entity = GetRequestDetails(listSiteUrl, requestID);

            if (currentUserId != entity.CreateBy)
            {
                return null;
            }

            return entity;
        }

        public LoopUpList GetAllLookups(string listSiteUrl)
        {
            LoopUpList LoopUpList = new LoopUpList();
            try
            {
                SPSecurity.RunWithElevatedPrivileges(() =>
                {
                    using (SPSite Site = new SPSite(Common.BaseUrl))
                    {
                        using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                        {
                            //GetLookUps(ref LoopUpList, "GatesList", oWeb.Lists["Gates"].Items);
                            GetLookUps(ref LoopUpList, "IdentityList", oWeb.Lists["Identity"].Items);
                            GetLookUps(ref LoopUpList, "NationalityList", oWeb.Lists["Nationality"].Items);
                            GetLookUps(ref LoopUpList, "VisitingReasonsList", oWeb.Lists["VisitingReasons"].Items);
                        }
                    }
                });
            }
            catch (Exception ex)
            {
                NNewLogMethod.LogException(ex);
            }
            return LoopUpList;
        }

        private VisitRequestOutPut ValidateRequestObject(VisitRequestEntity visitRequestEntity, ActionType actionType)
        {
            VisitRequestOutPut result = new VisitRequestOutPut() { statusCode = (int)GeneralReturnValuesEnum.Success, statusMessage = "SUccess" };

            if (actionType == ActionType.Edit)
            {
                if (visitRequestEntity.ID == 0)
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "ID is required";
                    return result;
                }
            }

            if (string.IsNullOrEmpty(visitRequestEntity.VisitMessage))
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "VisitMessage is required";
                return result;
            }
            if (visitRequestEntity.VisitStartDate == null)
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "VisitStartDate is required";
                return result;
            }

            if (string.IsNullOrEmpty(visitRequestEntity.VisitTime))
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "VisitTime is required";
                return result;
            }

            if (visitRequestEntity.VisitEndDate == null)
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "VisitEndDate is required";
                return result;
            }
            if (string.IsNullOrEmpty(visitRequestEntity.ApplicantSection))
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "ApplicantSection is required";
                return result;
            }
            if (string.IsNullOrEmpty(visitRequestEntity.ApplicantRank))
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "ApplicantRank is required";
                return result;
            }
            if (string.IsNullOrEmpty(visitRequestEntity.ApplicantAdministration))
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "ApplicantAdministration is required";
                return result;
            }
            if (string.IsNullOrEmpty(visitRequestEntity.UserName))
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "UserName is required";
                return result;
            }
            if (visitRequestEntity.VisitReason == 0)
            {
                result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                result.statusMessage = "VisitReason is required";
                return result;
            }

            foreach (VisitPersonsEntity item in visitRequestEntity.VisitPersons)
            {
                if (string.IsNullOrEmpty(item.FirstName))
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "FirstName is required";
                    return result;
                }

                if (string.IsNullOrEmpty(item.LastName))
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "LastName is required";
                    return result;
                }
                if (item.Nationality == 0)
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "Nationality is required";
                    return result;
                }
                if (string.IsNullOrEmpty(item.IdentityNumber))
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "IdentityNumber is required";
                    return result;
                }
                if (item.IdentityType == 0)
                {
                    result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                    result.statusMessage = "IdentityType is required";
                    return result;
                }


                if (actionType == ActionType.Edit)
                {
                    if (item.State == 0)
                    {
                        result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                        result.statusMessage = "Visitor State is required";
                        return result;
                    }
                }

                foreach (VisitDevicesEntity _VisitDevicesEntity in item.VisitDevices)
                {
                    if (string.IsNullOrEmpty(_VisitDevicesEntity.DeviceType))
                    {
                        result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                        result.statusMessage = "DeviceType is required";
                        return result;
                    }


                    if (actionType == ActionType.Edit)
                    {
                        if (_VisitDevicesEntity.State == 0)
                        {
                            result.statusCode = (int)GeneralReturnValuesEnum.ObjectValidationFail;
                            result.statusMessage = "Device State is required";
                            return result;
                        }
                    }
                }
            }


            return result;
        }

        public IEnumerable<RequestEntity> GetUserRequests(string listSiteUrl, int userID, string requestState)
        {
            IEnumerable<RequestEntity> requestsList = new List<RequestEntity>();

            try
            {
                SPSecurity.RunWithElevatedPrivileges(() =>
                {
                    using (SPSite Site = new SPSite(Common.BaseUrl))
                    {
                        using (SPWeb oWeb = Site.OpenWeb(listSiteUrl))
                        {
                            SPList VisitingRequestPersons = oWeb.Lists["VisitingRequestPersons"];
                            SPList VisitingRequest = oWeb.Lists["VisitingRequest"];
                            SPList SupervisorVisitingRequestStatus = oWeb.Lists["SupervisorVisitingRequestStatus"];
                            SPList SecurityVisitingRequestStatus = oWeb.Lists["SecurityVisitingRequestStatus"];


                            requestsList = from SPListItem Request in VisitingRequest.Items.Cast<SPListItem>()
                                           join Supervisor in SupervisorVisitingRequestStatus.Items.Cast<SPListItem>() on Request.ID equals new SPFieldLookupValue(Supervisor["SupervisorVisitingRequestID"].ToString()).LookupId
                                                    into list1
                                           from Supervisor in list1.DefaultIfEmpty()
                                           join Security in SecurityVisitingRequestStatus.Items.Cast<SPListItem>()
                                           on Request.ID equals new SPFieldLookupValue(Security["SecurityVisitingRequestID"].ToString()).LookupId
                                           into list2
                                           from Security in list2.DefaultIfEmpty()
                                               //join pers in VisitingRequestPersons.Items.Cast<SPListItem>()
                                               //on Request.ID equals new SPFieldLookupValue(pers["VisitingRequestID"].ToString()).LookupId
                                               //into list3
                                               //from pers in list3.DefaultIfEmpty()

                                           orderby Request["Created"]

                                           //where !bool.Parse(Request["IsDeleted"].ToString())
                                           //&& ((userID != 0) ? new SPFieldUserValue(oWeb, (Request["Author"].ToString())).User.ID == userID : true)

                                           where !bool.Parse(Request["IsDeleted"].ToString())
                                           && ((userID != 0) ? new SPFieldUserValue(oWeb, (Request["Author"].ToString())).User.ID == userID : true)

                                           select new RequestEntity
                                           {
                                               RequestId = Request != null ? Request.ID.ToString() : "",
                                               RequestDate = (Request != null && Request["VistingStartDate"] != null) ? DateTime.Parse(Request["VistingStartDate"].ToString()) : DateTime.MinValue,
                                               RequestCreationDate = (Request != null && Request["Created"] != null) ? DateTime.Parse(Request["Created"].ToString()) : DateTime.MinValue,
                                               RequestType = MODBusinessResources.VisitsRequestText,
                                               CreatedByUserID = (Request != null && Request["Author"] != null) ? new SPFieldUserValue(oWeb, (Request["Author"].ToString())).User.ID : 0,
                                               SupervisorStatus = Supervisor != null ? Common.GetObjectProperty(Supervisor["Status"]) : "",
                                               SecurityStatus = Security != null ? Common.GetObjectProperty(Security["SecurityStatus"]) : ""
                                           };


                            requestsList = requestsList.ToList();
                            if (userID != 0)
                            {
                                requestsList = requestsList.Where(a => a.CreatedByUserID == userID);
                            }


                            if (requestState != "0")
                            {
                                switch (requestState)
                                {
                                    case null:
                                        requestsList = requestsList.Where(a => a.SupervisorStatus.ToLower() == "");
                                        break;

                                    case "":
                                        requestsList = requestsList.Where(a => a.SupervisorStatus.ToLower() == "");
                                        break;

                                    case "1-supervisor":
                                        requestsList = requestsList.Where(a => a.SupervisorStatus.ToLower() == "1" && a.SecurityStatus.ToLower() == "");
                                        break;

                                    case "2-supervisor":
                                        requestsList = requestsList.Where(a => a.SupervisorStatus.ToLower() == "2");
                                        break;

                                    case "1-security":
                                        requestsList = requestsList.Where(a => a.SecurityStatus.ToLower() == "1");
                                        break;

                                    case "2-security":
                                        requestsList = requestsList.Where(a => a.SecurityStatus.ToLower() == "2");
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

            return requestsList.ToList();
        }
    }
}
