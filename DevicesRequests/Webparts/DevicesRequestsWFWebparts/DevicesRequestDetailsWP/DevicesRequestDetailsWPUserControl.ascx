<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DevicesRequestDetailsWPUserControl.ascx.cs" Inherits="DevicesRequestsWFWebparts.DevicesRequestDetailsWP.DevicesRequestDetailsWPUserControl" %>

<style type="text/css">
    input[type=text][disabled],textarea[disabled], select[disabled], .sp-peoplepicker-topLevelDisabled, .ms-inputBoxDisabled
    {
        color:#000;
    }
</style>

<asp:HiddenField ID="hdnAPIRootURL" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hdnWFWebUrl" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hdnRequestType" runat="server" ClientIDMode="Static" />


<div class="formLayout">
    <div class="overlay"></div>
    <div class="loader">
        <svg class="lds-spinner" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"
            xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 100 100" preserveAspectRatio="xMidYMid">
            <g transform="rotate(0 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.9166666666666666s"
                        repeatCount="indefinite">
                    </animate>
                </rect>
            </g>
            <g transform="rotate(30 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.8333333333333334s"
                        repeatCount="indefinite">
                    </animate>
                </rect>
            </g>
            <g transform="rotate(60 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.75s"
                        repeatCount="indefinite">
                    </animate>
                </rect>
            </g>
            <g transform="rotate(90 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.6666666666666666s"
                        repeatCount="indefinite">
                    </animate>
                </rect>
            </g>
            <g transform="rotate(120 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.5833333333333334s"
                        repeatCount="indefinite">
                    </animate>
                </rect>
            </g>
            <g transform="rotate(150 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.5s"
                        repeatCount="indefinite">
                    </animate>
                </rect>
            </g>
            <g transform="rotate(180 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.4166666666666667s"
                        repeatCount="indefinite">
                    </animate>
                </rect>
            </g>
            <g transform="rotate(210 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.3333333333333333s"
                        repeatCount="indefinite">
                    </animate>
                </rect>
            </g>
            <g transform="rotate(240 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.25s"
                        repeatCount="indefinite">
                    </animate>
                </rect>
            </g>
            <g transform="rotate(270 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.16666666666666666s"
                        repeatCount="indefinite">
                    </animate>
                </rect>
            </g>
            <g transform="rotate(300 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.08333333333333333s"
                        repeatCount="indefinite">
                    </animate>
                </rect>
            </g>
            <g transform="rotate(330 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="0s"
                        repeatCount="indefinite">
                    </animate>
                </rect>
            </g>
        </svg>
    </div>
    <div class="container">

        <div class="formLayout-title">

            <p>
                <asp:Literal runat="server"
                    Text="<%$Resources:MachinesRequests,RequestMessage %>"></asp:Literal>
            </p>
            <p>

                <asp:Label ID="lblRequestMessage" runat="server"
                    Text="" ClientIDMode="Static"></asp:Label>
            </p>

        </div>
        <div class="formLayout-container bb-none empdata">
            <div class="formLayout-headTitles">
                <p>
                    <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,security__ApplicantData %>">
                    </asp:Literal>
                </p>
            </div>

            <p class="formLayout-empInfo">
                <span>
                    <asp:Label ID="lblApplicantName" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                </span>
            </p>
            <div class="row">
                <div class="col-md-3">
                    <p class="formLayout-empInfo">
                        <span class="empinfo">
                            <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,Position %>"></asp:Literal>
                        </span>
                        <span>:</span>
                        <span>
                            <asp:Label ID="lblApplicantPosition" runat="server" Text="" ClientIDMode="Static">
                            </asp:Label>
                        </span>
                    </p>
                </div>
                <div class="col-md-3">
                    <p class="formLayout-empInfo">
                        <span class="empinfo">
                            <asp:Literal runat="server"
                                Text="<%$Resources:MachinesRequests,security_ApplicantSection %>"></asp:Literal>
                        </span>
                        <span>:</span>
                        <span>
                            <asp:Label ID="lblApplicantSection" runat="server" Text="" ClientIDMode="Static">
                            </asp:Label>

                        </span>
                    </p>
                </div>
                <div class="col-md-3">
                    <p class="formLayout-empInfo">
                        <span class="empinfo">
                            <asp:Literal runat="server"
                                Text="<%$Resources:MachinesRequests,security__ApplicantSection %>"></asp:Literal>
                        </span>
                        <span>:</span>
                        <span>
                            <asp:Label ID="lblApplicantDepartment" runat="server" Text="" ClientIDMode="Static">
                            </asp:Label>
                        </span>
                    </p>
                </div>
            </div>
        </div>
        <div class="formLayout-container">
            <div class="formLayout-headTitles">
                <p>
                    <asp:Label runat="server" ID="GridTitle_RequestEnterDate" ClientIDMode="Static">
                    </asp:Label>
                </p>
            </div>



            <div class="row">
                <div class="col-md-3">
                    <div class="form-group ">
                        <label class="col-form-label">
                            <asp:Label runat="server" ID="GridTitle_RequestEnterDate1" ClientIDMode="Static">
                            </asp:Label>

                        </label>
                        <asp:TextBox ID="txtDevicesEnterDate" MaxLength="15"
                            CssClass="form-control textPicker" runat="server" ClientIDMode="Static"
                            autocomplete="off" Enabled="false"></asp:TextBox>
                        <label class="daytext"></label>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group ">
                        <label class="col-form-label">
                            <asp:Label runat="server" ID="DeviceEnterTime" ClientIDMode="Static">
                            </asp:Label>

                        </label>
                        <asp:TextBox ID="txtDeviceEnterTime" autocomplete="off" isMandatory
                            MaxLength="25" runat="server" ClientIDMode="Static"
                            CssClass="form-control timepicker" placeholder="00:00" Enabled="false">
                        </asp:TextBox>
                    </div>
                </div>


            </div>
        </div>
        <div class="formLayout-container">
            <div class="formLayout-headTitles">
                <p>
                    <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,security__supervisorInfo %>">
                    </asp:Literal>
                </p>
            </div>

            <form>
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group ">
                            <label class="col-form-label">
                                <asp:Label ID="lblDelegateName" runat="server"
                                    Text="<%$Resources:MachinesRequests,DelegateName %>" ClientIDMode="Static"></asp:Label>
                            </label>
                            <asp:TextBox ID="txtDelegateName" MaxLength="60" required="required" runat="server"
                                ClientIDMode="Static" CssClass="delegate-Name form-control" Enabled="false"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="form-group ">
                            <label class="col-form-label">
                                <asp:Label ID="lblDelegateIdentityNumber" runat="server"
                                    Text="<%$Resources:MachinesRequests,DelegateID %>" ClientIDMode="Static"></asp:Label>
                            </label>
                            <asp:TextBox ID="txtDelegateIdentityNumber" required="required" MaxLength="15" runat="server"
                                ClientIDMode="Static" CssClass="delegate-IdentityNumber form-control" Enabled="false"></asp:TextBox>
                        </div>

                    </div>

                    <div class="col-md-3">
                        <div class="form-group ">
                            <label class="col-form-label">
                                <asp:Label ID="lblDelegateWork" runat="server"
                                    Text="<%$Resources:MachinesRequests,DelegateWork %>" ClientIDMode="Static"></asp:Label>
                            </label>
                            <asp:TextBox ID="txtDelegateWork" MaxLength="60" runat="server"
                                ClientIDMode="Static" CssClass="delegate-Work form-control" Enabled="false"></asp:TextBox>
                        </div>
                    </div>
            </form>


        </div>
        <div class="formLayout-container">
            <div class="formLayout-headTitles">
                <p>
                    <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,DevicesData %>"></asp:Literal>
                </p>
            </div>

            <p class="formLayout-title">
                <asp:Label ID="lbldevicesList" runat="server" Text="<%$Resources:MachinesRequests,Devices %>"
                    ClientIDMode="Static"></asp:Label>
            </p>
            <div class="request-devices">
            </div>
        </div> 
    </div>
</div>


<script src="/modwf/style Library/branding/js/general/helpers.js"></script>

<script type="text/javascript">
    var apiRootAddress = $("#hdnAPIRootURL").val();
    var listSiteUrl = $("#hdnWFWebUrl").val()
    var requestType = $("#hdnRequestType").val();
    var currentUserId = _spPageContextInfo.userId;
    var request;

    var devicesContainer = $('.request-devices');


    $(".hidden-cols").hide();
    $(".loader").hide();
    $(".overlay").hide();

    $(function () {

        translatePageLabels();

        var rid = getUrlParameter('rid');
        getRequest(rid, function (data) {
            if (data == null) {
                $(".formLayout .container").hide();
                $(".formLayout").append("<div class='container'><p style='text-align:center;padding: 100px'>لم يتم العثور علي البيانات المطلوبة</p></div>")
                return;
            }
            request = data;

            $("#lblRequestId").text(request.ID);
            $("#lblRequestMessage").text(request.RequestMessage);
            $("#txtDelegateName").val(request.SupervisorName);
            $("#txtDevicesEnterDate").val(GetHijriDate(request.DevicesRequestDate));
            $("#txtDeviceEnterTime").val(request.ActionTime);
            $("#txtDelegateIdentityNumber").val(request.IdentityNumber);
            $("#txtDelegateWork").val(request.WorkingPlace);
            $("#txtDeviceType").text(request.ApplicantRank);
            $('.daytext').text(GetHijriDayName(request.DevicesRequestDate));
            $("#lblApplicantPosition").text(request.ApplicantRank);
            $("#lblApplicantSection").text(request.ApplicantSection);
            $("#lblApplicantDepartment").text(request.ApplicantAdministration);
            $("#lblApplicantName").text(request.ApplicantName);

            request.RequestMachines.forEach(function (item, index) {
                devicesContainer.append(RenderNewdevice(item, index));
            });
        });
    });

    function translatePageLabels() {
        if ($("#hdnRequestType").val() == "0") {
            document.getElementById("GridTitle_RequestEnterDate").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,GridTitle_RequestEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("GridTitle_RequestEnterDate1").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,DevicesEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("DeviceEnterTime").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,DeviceEnterTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";

        } else {
            document.getElementById("GridTitle_RequestEnterDate").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,GridTitle_RequestEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("GridTitle_RequestEnterDate1").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,DevicesEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("DeviceEnterTime").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,DeviceEnterTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
        }
    }
    function getRequest(id, callback) {
        var requestDetailsDataAPI$ = apiRootAddress + "DevicesRequest/GetRequestDetailsForView?ListSiteUrl=" + listSiteUrl + "&CurrentUserId=" + currentUserId + "&RequestID=" + id;
        getDataByAPI(
            requestDetailsDataAPI$,
            function (data) {
                callback(data);
            }
        );
    }
    function RenderNewdevice(device, index) {
        var elem = document.createElement("div");
        elem.classList.add("deviceRow");

        var deviceRowBody = '';
        deviceRowBody += '<div class="row deviceRowData mt-3">';
        deviceRowBody += '<div class="form-group col-md-1 hidden"style="display:none">';
        deviceRowBody += '<input type="text" class="device-Id form-control" value="' + (device !== null ? device.ID : "") + '" />';
        deviceRowBody += '</div>';
        deviceRowBody += '<div class="form-group col-md-3">';

        deviceRowBody += '<label class="col-form-label">';

        deviceRowBody += "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceType %>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";

        deviceRowBody += '</label>';
        deviceRowBody += '<input type="text" disabled="disabled" required="required" maxlength="60" class="device-Type form-control" value="' + (device !== null ? device.DeviceType : "") + '" />';
        deviceRowBody += '</div>';

        console.log('device', device);
        deviceRowBody += '<div class="form-group col-md-2">';

        deviceRowBody += '<label class="col-form-label">';
        deviceRowBody += "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,ItemCount %>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
        deviceRowBody += '</label>';
        deviceRowBody += '<input required="required" disabled="disabled" type="text" maxlength="15" class="device-ItemCount form-control"   value="' + (device !== null ? device.ItemsCount : "") + '" />';
        deviceRowBody += '</div>';

        deviceRowBody += '<div class="form-group col-md-2">';

        deviceRowBody += '<label class="col-form-label">';
        deviceRowBody += "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceNumber %>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
        deviceRowBody += '</label>';
        deviceRowBody += '<input type="text" maxlength="15" disabled="disabled" class="device-deviceNumber form-control"   value="' + (device !== null ? device.DeviceNumber : "") + '" />';
        deviceRowBody += '</div>';


        deviceRowBody += '<div class="form-group col-md-2">';

        deviceRowBody += '<label class="col-form-label">';
        deviceRowBody += "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,CompanyName %>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
        deviceRowBody += '</label>';
        deviceRowBody += '<input type="text" maxlength="60" disabled="disabled" class="company-Name form-control" value="' + (device !== null ? device.ManufacturingCompanyName : "") + '" />';;
        deviceRowBody += '</div>';

        deviceRowBody += '<div class="form-group col-md-3">';

        deviceRowBody += '<label class="col-form-label">';
        deviceRowBody += "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceNotes %>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
        deviceRowBody += '</label>';
        deviceRowBody += '<textarea  maxlength="40" disabled="disabled" class="device-NotesAboutDevice form-control">';
        deviceRowBody += device !== null ? device.NotesAboutDevice : "";
        deviceRowBody += "</textarea>";
        deviceRowBody += '</div>';
        deviceRowBody += '</div>';


        deviceRowBody += '</div>';

        elem.innerHTML = deviceRowBody;
        return elem;
    };
</script>
