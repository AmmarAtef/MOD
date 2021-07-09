<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VisitRequestDetailsWPUserControl.ascx.cs" Inherits="VisitRequest.VisitRequestDetailsWP.VisitRequestDetailsWPUserControl" %>

<asp:HiddenField ID="hdnAPIRootURL" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hdnWFWebUrl" runat="server" ClientIDMode="Static" />

<style type="text/css">
    input[type=text][disabled],textarea[disabled], select[disabled], .sp-peoplepicker-topLevelDisabled, .ms-inputBoxDisabled
    {
        color:#000;
    }
</style>

<div class="formLayout">
    <div class="container">       
        <div class="formLayout-title">
            <p>
                <asp:Label ID="lblVisitorMessageText" runat="server" Text="<%$Resources:VisitRequest,VisitMessage %>"
                    ClientIDMode="Static"></asp:Label>

            </p>
            <p>
                <asp:Label ID="lblVisitorMessageValue" runat="server" Text="" ClientIDMode="Static"></asp:Label>

            </p>

        </div>
        <div class="formLayout-container bb-none empdata">
            <div class="formLayout-headTitles">
                <p>
                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequestApplicantData %>"></asp:Literal>
                </p>
            </div>
            <p class="formLayout-empInfo">

                <span>
                    <asp:Label ID="lblRequestUserNameValue" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                </span>
            </p>
            <div class="row">
                <div class="col-md-3">
                    <p class="formLayout-empInfo">
                        <span class="empinfo">
                            <asp:Label ID="lblUserPositionText" runat="server"
                                Text="<%$Resources:VisitRequest,VisitUserPosition %>" ClientIDMode="Static"></asp:Label>
                        </span>
                        <span>:</span>
                        <span>
                            <asp:Label ID="lblUserPositionValue" runat="server" Text="" ClientIDMode="Static">
                            </asp:Label>
                        </span>
                    </p>
                </div>
                <div class="col-md-3">
                    <p class="formLayout-empInfo">
                        <span class="empinfo">
                            <asp:Label ID="lblUserSectionText" runat="server"
                                Text="<%$Resources:VisitRequest,VisitUserSection %>" ClientIDMode="Static"></asp:Label>
                        </span>
                        <span>:</span>
                        <span>
                            <asp:HiddenField ID="hdnSectionCode" runat="server" ClientIDMode="Static" />
                            <asp:Label ID="lblUserSectionName" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                        </span>
                    </p>
                </div>
                <div class="col-md-3">
                    <p class="formLayout-empInfo">
                        <span class="empinfo">
                            <asp:Label ID="lblUserDepartmentText" runat="server"
                                Text="<%$Resources:VisitRequest,VisitUserDepartment %>" ClientIDMode="Static">
                            </asp:Label>
                        </span>
                        <span>:</span>
                        <span>
                            <asp:HiddenField ID="hdnDepartmentCode" runat="server" ClientIDMode="Static" />
                            <asp:Label ID="lblUserDepartmentName" runat="server" Text="" ClientIDMode="Static">
                            </asp:Label>
                        </span>
                    </p>
                </div>
            </div>


        </div>

        <div class="formLayout-container">
            <div class="formLayout-headTitles">
                <p>
                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitDate %>"></asp:Literal>

                </p>
            </div>


            <div class="row">
                <div class="col-md-3">
                    <div class="form-group ">
                        <label class="col-form-label">
                            <asp:Label ID="lblVisitStartDate" runat="server"
                                Text="<%$Resources:VisitRequest,VisitStartDate %>" ClientIDMode="Static"></asp:Label>
                            <span class="is-required">*</span>
                        </label>
                        <asp:TextBox ID="txtVisitStartDate" Enabled="false"
                            CssClass="form-control textPicker" runat="server" ClientIDMode="Static"></asp:TextBox>
                        <label class="daytext daytextVisitStartDate"></label>

                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group ">
                        <label class="col-form-label">
                            <asp:Label ID="lblVisitEndDate" runat="server"
                                Text="<%$Resources:VisitRequest,VisitEndDate %>" ClientIDMode="Static"></asp:Label>
                            <span class="is-required">*</span>
                        </label>
                        <asp:TextBox ID="txtVisitEndDate" runat="server" Enabled="false" CssClass="form-control textPicker" ClientIDMode="Static"></asp:TextBox>
                        <label class="daytext daytextVisitEndDate"></label>

                    </div>
                </div>
                <div class="col-md-4 col-lg-3">
                    <div class="form-group ">
                        <label class="col-form-label">
                            <asp:Label ID="lblVisitStartTime" runat="server"
                                Text="<%$Resources:VisitRequest,VisitTime %>" ClientIDMode="Static">
                            </asp:Label>
                            <span class="is-required">*</span>
                        </label>
                        <asp:TextBox ID="txtVisitorVisitTime" Enabled="false"
                            CssClass="form-control time timepicker" runat="server" ClientIDMode="Static" placeholder="00:00"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group ">
                        <label class="col-form-label">
                            <asp:Label ID="lblVisitReason" runat="server"
                                Text="<%$Resources:VisitRequest,VisitReason %>" ClientIDMode="Static"></asp:Label>
                            <span class="is-required">*</span>
                        </label>
                        <asp:DropDownList ID="ddlVisitReason" runat="server" Enabled="false"
                            CssClass="form-control " ClientIDMode="Static">
                        </asp:DropDownList>
                    </div>
                </div>


            </div>

        </div>

        <div class="formLayout-container">
            <div class="formLayout-headTitles">
                <p>
                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitorsData%>"></asp:Literal>
                </p>
            </div>
            <p class="formLayout-title">
                <asp:Label ID="lblVisitorsList" runat="server" Text="<%$Resources:VisitRequest,Visitors %>"
                    ClientIDMode="Static"></asp:Label>

            </p>
            <div class="request-visitors">
            </div>
        </div>

    </div>
</div>

<script src="/modwf/style Library/branding/js/general/helpers.js"></script>

<script type="text/javascript">
    var request;
    var apiRootAddress = $("#hdnAPIRootURL").val();
    var listSiteURL = $("#hdnWFWebUrl").val();
    var currentUserId = _spPageContextInfo.userId;
    var visitorsContainer = $('.request-visitors');

    var visitReasonsData = null;
    var nationalitiesData = null;
    var identityTypesData = null;

    $(function () {

        var rid = getUrlParameter('rid');
        getRequest(rid, function (data) {
            if (data == null) {
                $(".formLayout .container").hide();
                $(".formLayout").append("<div class='container'><p style='text-align:center;padding: 100px'>لم يتم العثور علي البيانات المطلوبة</p></div>")
                return;
            }
            request = data;
            $("#lblVisitorMessageValue").text(request.VisitMessage);
            $("#txtVisitStartDate").val(GetHijriDateWithSlashFormat(request.VisitStartDate));
            $("#txtVisitorVisitTime").val(request.VisitTime);
            $("#txtVisitEndDate").val(GetHijriDateWithSlashFormat(request.VisitEndDate));
            $("#lblRequestUserNameValue").text(request.UserName);
            $('.daytextVisitStartDate').text(GetHijriDayName(request.VisitStartDate) + " ");
            $('.daytextVisitEndDate').text(GetHijriDayName(request.VisitEndDate));
            $("#lblUserPositionValue").text(request.ApplicantRank);
            $("#hdnSectionCode").val(request.ApplicantSection);
            $("#hdnDepartmentCode").val(request.ApplicantAdministration);

            //Get Department & Section names
            var departmentAPI$ = apiRootAddress + "Lookups/GetDepartmentNameByCode?departmentCode=" + $("#hdnDepartmentCode").val();
            getDataByAPI(
                departmentAPI$,
                function (data) {
                    $("#lblUserDepartmentName").text(data);
                }
            );

            var sectionsAPI$ = apiRootAddress + "Lookups/GetSectionNameByDeptartmentCodeAndSection?departmentCode=" + $("#hdnDepartmentCode").val() + "&sectionCode=" + $("#hdnSectionCode").val();
            getDataByAPI(
                sectionsAPI$,
                function (data) {
                    $("#lblUserSectionName").text(data);
                }
            );

            var lookupsDataAPI$ = apiRootAddress + "VisitRequest/GetAllLookups?ListSiteUrl=" + listSiteURL;
            getDataByAPI(
                lookupsDataAPI$,
                function (data) {
                    visitReasonsData = data.VisitingReasonsList;

                    $("#ddlVisitReason").append('<option value="">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,choose%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>');
                    visitReasonsData.forEach(function (item) {
                        $("#ddlVisitReason").append('<option value="' + item.ID + '">' + item.Title + '</option>');
                    });
                    $("#ddlVisitReason").val(request.VisitReason);


                    nationalitiesData = data.NationalityList;
                    $("#ddlVisitorNationalities").append('<option value="">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,choose%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>');
                    nationalitiesData.forEach(function (item) {
                        $("#ddlVisitorNationalities").append('<option value="' + item.ID + '">' + item.Title + '</option>');
                    });

                    identityTypesData = data.IdentityList;
                    $("#ddlVisitorIdentityTypes").append('<option value="">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,choose%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>');
                    identityTypesData.forEach(function (item) {
                        $("#ddlVisitorIdentityTypes").append('<option value="' + item.ID + '">' + item.Title + '</option>');
                    });

                    if (request.VisitPersons.length > 0) {
                        request.VisitPersons.forEach(function (item, index) {
                            visitorsContainer.append(renderNewVisitor(item, nationalitiesData, identityTypesData, false, index));

                        });
                    }
                }
            );
        });
    });

    function getRequest(id, callback) {
        var visitReasonsDataAPI$ = apiRootAddress + "VisitRequest/GetRequestDetailsForView?ListSiteUrl=" + listSiteURL + "&CurrentUserId=" + currentUserId + "&RequestID=" + id;
        getDataByAPI(
            visitReasonsDataAPI$,
            function (data) {
                callback(data);
            }
        );

    }
    function renderVisitorHeader() {

        var elem = document.createElement("div");
        elem.classList.add("row");

        var visitorRowBody = '';

        visitorRowBody += '<div class="form-group col-md-1">';
        visitorRowBody += 'FirstName';
        visitorRowBody += '</div>';

        visitorRowBody += '<div class="form-group col-md-1">';
        visitorRowBody += 'FatherName';
        visitorRowBody += '</div>';


        visitorRowBody += '<div class="form-group col-md-1">';
        visitorRowBody += 'FamilyName';
        visitorRowBody += '</div>';

        visitorRowBody += '<div class="form-group col-md-1">';
        visitorRowBody += 'LastName';
        visitorRowBody += '</div>';

        visitorRowBody += '<div class="form-group col-md-2">';
        visitorRowBody += "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Nationality%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
        visitorRowBody += '</div>';



        visitorRowBody += '<div class="form-group col-md-2">';
        visitorRowBody += "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,IdentityType%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
        visitorRowBody += '</div>';

        visitorRowBody += '<div class="form-group col-md-2">';
        visitorRowBody += 'IdentityNumber';
        visitorRowBody += '</div>';

        visitorRowBody += '<div class="form-group col-md-2">';
        visitorRowBody += 'WorkingPlace';
        visitorRowBody += '</div>';


        visitorRowBody += '<div class="form-group col-md-1">';
        visitorRowBody += 'VisitTime';
        visitorRowBody += '</div>';

        //End of form-row visitorRowData
        visitorRowBody += '</div>';

        elem.innerHTML = visitorRowBody;
        return elem;

    };
    function renderNewVisitor(visitor, nationalitiesData, identityTypesData, addRemoveButton, index) {

        var elem = document.createElement("div");
        elem.classList.add("visitorRow");
        elem.classList.add("row");

        var visitorRowBody = '';



        visitorRowBody += '<div class="row visitorRowData">';

        visitorRowBody += '<div class="form-group col-md-3">';
        visitorRowBody += '<label class="col-form-label"><sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,FirstName%>" EncodeMethod="EcmaScriptStringLiteralEncode"/><span class="is-required">*</span></label>';
        visitorRowBody += '<input type="text" disabled="disabled" class="visitor-FirstName form-control" value="' + (visitor !== null ? visitor.FirstName : "") + '" />';
        visitorRowBody += '</div>';

        visitorRowBody += '<div class="form-group col-md-3">';
        visitorRowBody += '<label class="col-form-label"><sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,FatherName%>" EncodeMethod="EcmaScriptStringLiteralEncode"/></label>';
        visitorRowBody += '<input type="text" disabled="disabled" class="visitor-FatherName form-control" value="' + (visitor !== null ? visitor.FatherName : "") + '" />';
        visitorRowBody += '</div>';


        visitorRowBody += '<div class="form-group col-md-3">';
        visitorRowBody += '<label class="col-form-label"><sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,FamilyName%>" EncodeMethod="EcmaScriptStringLiteralEncode"/></label>';
        visitorRowBody += '<input type="text" disabled="disabled" class="visitor-FamilyName form-control" value="' + (visitor !== null ? visitor.FamilyName : "") + '" />';
        visitorRowBody += '</div>';

        visitorRowBody += '<div class="form-group col-md-3">';
        visitorRowBody += '<label class="col-form-label"><sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,LastName%>" EncodeMethod="EcmaScriptStringLiteralEncode"/><span class="is-required">*</span></label>';
        visitorRowBody += '<input type="text" disabled="disabled" required="required" class="visitor-LastName form-control" value="' + (visitor !== null ? visitor.LastName : "") + '" />';
        visitorRowBody += '</div>';

        visitorRowBody += '<div class="form-group col-md-3">';
        visitorRowBody += '<label class="col-form-label"><sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,Nationality%>" EncodeMethod="EcmaScriptStringLiteralEncode"/><span class="is-required">*</span></label>';
        visitorRowBody += '<select disabled="disabled" class="visitor-Nationality form-control">'
        visitorRowBody += '<option value="">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,choose%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>';
        if (nationalitiesData != null) {
            nationalitiesData.forEach(function (item) {
                if (visitor != null && item.ID == visitor.Nationality) {
                    visitorRowBody += '<option value="' + item.ID + '" selected>' + item.Title + '</option>';
                }
                else {
                    visitorRowBody += '<option value="' + item.ID + '">' + item.Title + '</option>';
                }
            });
        }

        visitorRowBody += '</select>';
        visitorRowBody += '</div>';



        visitorRowBody += '<div class="form-group col-md-3">';
        visitorRowBody += '<label class="col-form-label"><sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,IdentityType%>" EncodeMethod="EcmaScriptStringLiteralEncode"/><span class="is-required">*</span></label>';
        visitorRowBody += '<select disabled="disabled" class="visitor-IdentityType form-control">'
        visitorRowBody += '<option value="">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,choose%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>';
        if (identityTypesData != null) {
            identityTypesData.forEach(function (item) {
                if (visitor != null && item.ID == visitor.IdentityType) {
                    visitorRowBody += '<option value="' + item.ID + '" selected>' + item.Title + '</option>';
                }
                else {
                    visitorRowBody += '<option value="' + item.ID + '">' + item.Title + '</option>';
                }
            });
        }
        visitorRowBody += '</select>';
        visitorRowBody += '</div>';

        visitorRowBody += '<div class="form-group col-md-3">';
        visitorRowBody += '<label class="col-form-label"><sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,IdentityNumber%>" EncodeMethod="EcmaScriptStringLiteralEncode"/><span class="is-required">*</span></label>';
        visitorRowBody += '<input type="text" disabled="disabled" class="visitor-IdentityNumber form-control" value="' + (visitor !== null ? visitor.IdentityNumber : "") + '"  onkeypress="javascript:return isNumber(event)" />';
        visitorRowBody += '</div>';

        visitorRowBody += '<div class="form-group col-md-3">';
        visitorRowBody += '<label class="col-form-label"><sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,WorkingPlace%>" EncodeMethod="EcmaScriptStringLiteralEncode"/></label>';
        visitorRowBody += '<input type="text" disabled="disabled" class="visitor-WorkingPlace form-control" value="' + (visitor !== null ? visitor.WorkingPlace : "") + '" />';
        visitorRowBody += '</div>';

        //End of form-row visitorRowData
        visitorRowBody += '</div>';

        //if (index > 0 || addRemoveButton == true) {
        //    visitorRowBody += '<div class="delete-row"><button  class="request-deleteVisitor btn  hvr-shutter-out-horizontal" title="delete"> - </button></div>';
        //}



        visitorRowBody += '<div class="visitor-row-devices">';

        visitorRowBody += '<div class="row">';

        visitorRowBody += '<div class="l-addDevice col-md-2">';
        visitorRowBody += '<div class="addDevice">';
        visitorRowBody += '<div class="formLayout-title"><sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,AttachedDevices%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> </div>'
        visitorRowBody += '</div>';
        visitorRowBody += '</div>';
        visitorRowBody += '</div >';

        //Render visitor devices here
        if (visitor != null) {
            visitor.VisitDevices.forEach(function (device, deviceIndex) {
                visitorRowBody += '<div class=" deviceRow">'
                visitorRowBody += RenderNewDevice(device, deviceIndex).innerHTML;
                visitorRowBody += '</div>';
            });
        }

        visitorRowBody += '</div>';


        elem.innerHTML = visitorRowBody;
        return elem;



    };
    function RenderNewDevice(device, index) {
        var elem = document.createElement("div");
        elem.classList.add("deviceRow");
        // elem.classList.add("row");

        var deviceRowBody = '';
        deviceRowBody += '<div class="row">';
        deviceRowBody += '<div class="form-group col-md-2 " style="visibility:hidden">';
        deviceRowBody += '<input type="text" class="device-Id form-control" value="' + (device !== undefined ? device.ID : "") + '" />';
        deviceRowBody += '</div>';

        deviceRowBody += '<div class="form-group col-md-2">';
        //if (index == 0 || $(".deviceRow").length == 0) {
        deviceRowBody += '<label class="col-form-label"><sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,DeviceType%>" EncodeMethod="EcmaScriptStringLiteralEncode"/><span class="is-required">*</span></label>';
        //}
        deviceRowBody += '<input type="text" disabled="disabled" attr-required="required" class="device-DeviceType form-control" value="' + (device !== undefined ? device.DeviceType : "") + '" />';
        deviceRowBody += '</div>';

        deviceRowBody += '<div class="form-group col-md-2">';
        //if (index == 0 || $(".deviceRow").length == 0) { 
        deviceRowBody += '<label class="col-form-label"><sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,DeviceNumber%>" EncodeMethod="EcmaScriptStringLiteralEncode"/></label>';
        // }
        deviceRowBody += '<input type="text" disabled="disabled" class="device-DeviceNumber form-control" value="' + (device !== undefined ? device.DeviceNumber : "") + '" />';
        deviceRowBody += '</div>';

        deviceRowBody += '<div class="form-group col-md-2">';
        deviceRowBody += '<label class="col-form-label"><sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,ManufacturingCompanyName%>" EncodeMethod="EcmaScriptStringLiteralEncode"/></label>';
        deviceRowBody += '<input type="text" disabled="disabled" class="device-ManufacturingCompanyName form-control" value="' + (device !== undefined ? device.ManufacturingCompanyName : "") + '" />';
        deviceRowBody += '</div>';


        deviceRowBody += '<div class="form-group col-md-3">';
        deviceRowBody += '<label class="col-form-label"><sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,NotesAboutDevice%>" EncodeMethod="EcmaScriptStringLiteralEncode"/></label>';
        deviceRowBody += '<textarea disabled="disabled" class="device-NotesAboutDevice form-control">' + (device !== undefined ? device.NotesAboutDevice : "") + '</textarea>';
        deviceRowBody += '</div>';
        deviceRowBody += '</div>';

        elem.innerHTML = deviceRowBody;

        return elem;
    };
    function GetHijriDateWithSlashFormat(date) {
        var SplitedDate = (date.split("T")[0]).split("-");
        var s = HijriJS.gregorianToHijri(SplitedDate[0], SplitedDate[1], SplitedDate[2])
        return s.day + "/" + s.month + "/" + s.year
    }
</script>
