<%@ Assembly Name="DevicesRequestsWFWebparts, Version=1.0.0.0, Culture=neutral, PublicKeyToken=97afcd5d4112e71c" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddDevicesRequestWPUserControl.ascx.cs" Inherits="DevicesRequestsWFWebparts.AddDevicesRequestWP.AddDevicesRequestWPUserControl" %>

<asp:HiddenField ID="hdnAPIRootURL" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hdnWFWebUrl" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hdnRequestType" runat="server" ClientIDMode="Static" />

<asp:Panel runat="server" ID="pnlMain">


    <div class="formLayout">
        <div class="overlay"></div>
        <div class="loader">
            <svg class="lds-spinner" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"
                xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 100 100" preserveAspectRatio="xMidYMid">
                <g transform="rotate(0 50 50)">
                    <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                        <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s"
                            begin="-0.9166666666666666s" repeatCount="indefinite">
                        </animate>
                    </rect>
                </g>
                <g transform="rotate(30 50 50)">
                    <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                        <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s"
                            begin="-0.8333333333333334s" repeatCount="indefinite">
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
                        <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s"
                            begin="-0.6666666666666666s" repeatCount="indefinite">
                        </animate>
                    </rect>
                </g>
                <g transform="rotate(120 50 50)">
                    <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                        <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s"
                            begin="-0.5833333333333334s" repeatCount="indefinite">
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
                        <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s"
                            begin="-0.4166666666666667s" repeatCount="indefinite">
                        </animate>
                    </rect>
                </g>
                <g transform="rotate(210 50 50)">
                    <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                        <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s"
                            begin="-0.3333333333333333s" repeatCount="indefinite">
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
                        <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s"
                            begin="-0.16666666666666666s" repeatCount="indefinite">
                        </animate>
                    </rect>
                </g>
                <g transform="rotate(300 50 50)">
                    <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                        <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s"
                            begin="-0.08333333333333333s" repeatCount="indefinite">
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

                    <%--<asp:Label ID="lblDeviceMessageValue" runat="server" Text="<%$Resources:MachinesRequests,lblDeviceMessageValue %>"
                        ClientIDMode="Static"></asp:Label>--%>
                    <asp:Label ID="lblRequestMessage" runat="server"
                        Text="<%$Resources:MachinesRequests,RequestMessage %>" ClientIDMode="Static"></asp:Label>
                </p>

            </div>

            <div class="formLayout-container bb-none empdata">
                <div class="formLayout-headTitles">
                    <p>
                        <asp:Literal runat="server"
                            Text="<%$Resources:MachinesRequests,security__ApplicantData %>"></asp:Literal>
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
                                <asp:Literal runat="server"
                                    Text="<%$Resources:MachinesRequests,Position %>"></asp:Literal>
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
                                <asp:HiddenField ID="hdnSectionCode" runat="server" ClientIDMode="Static" />
                                <asp:Label ID="lblUserSectionName" runat="server" Text="" ClientIDMode="Static">
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
                        <asp:Label runat="server" ID="GridTitle_RequestEnterDate1" ClientIDMode="Static">
                        </asp:Label>
                    </p>
                </div>

                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group ">
                            <label class="col-form-label">
                                <asp:Label runat="server" ID="lblDevicesEnterDate" ClientIDMode="Static">
                                </asp:Label>
                            </label>
                            <span class="is-required">*</span>
                            <asp:TextBox ID="txtDevicesEnterDate" isMandatory MaxLength="15"
                                CssClass="form-control textPicker" runat="server" ClientIDMode="Static"
                                autocomplete="off"></asp:TextBox>
                            <label class="daytext"></label>
                        </div>

                    </div>
                    <div class="col-md-3">
                        <div class="form-group ">
                            <label class="col-form-label">
                                <asp:Label runat="server" ID="DeviceEnterTime" ClientIDMode="Static">
                                </asp:Label>

                            </label>
                            <span class="is-required">*</span>
                            <asp:TextBox ID="txtDeviceEnterTime" autocomplete="off" isMandatory
                                MaxLength="25" runat="server" ClientIDMode="Static"
                                CssClass="form-control timepicker" placeholder="00:00">
                            </asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="formLayout-container">
                <div class="formLayout-headTitles">
                    <p>
                        <asp:Literal runat="server"
                            Text="<%$Resources:MachinesRequests,DelegateData %>"></asp:Literal>
                    </p>
                </div>

                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group ">
                            <label class="col-form-label">
                                <asp:Label ID="lblDelegateName" runat="server"
                                    Text="<%$Resources:MachinesRequests,DelegateName %>" ClientIDMode="Static">
                                </asp:Label>
                            </label>
                            <span class="is-required">*</span>
                            <asp:TextBox ID="txtDelegateName" MaxLength="60" required="required" runat="server"
                                ClientIDMode="Static" CssClass="delegate-Name form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="form-group ">
                            <label class="col-form-label">
                                <asp:Label ID="lblDelegateIdentityNumber" runat="server"
                                    Text="<%$Resources:MachinesRequests,DelegateID %>" ClientIDMode="Static">
                                </asp:Label>
                            </label>
                            <span class="is-required">*</span>
                            <asp:TextBox ID="txtDelegateIdentityNumber" required="required" MaxLength="15"
                                runat="server" ClientIDMode="Static" CssClass="delegate-IdentityNumber form-control"
                                onkeypress="javascript:return isNumber(event)"></asp:TextBox>
                        </div>

                    </div>

                    <div class="col-md-3">
                        <div class="form-group ">
                            <label class="col-form-label">
                                <asp:Label ID="lblDelegateWork" runat="server"
                                    Text="<%$Resources:MachinesRequests,DelegateWork %>" ClientIDMode="Static">
                                </asp:Label>
                            </label>
                            <asp:TextBox ID="txtDelegateWork" MaxLength="60" runat="server"
                                ClientIDMode="Static" CssClass="delegate-Work form-control"></asp:TextBox>
                        </div>
                    </div>


                </div>
            </div>
            <div class="formLayout-container">
                <div class="formLayout-headTitles">
                    <p>
                        <asp:Literal runat="server"
                            Text="<%$Resources:MachinesRequests,DevicesData %>"></asp:Literal>
                    </p>
                </div>

                <p class="formLayout-title">
                    <asp:Label ID="lbldevicesList" runat="server" Text="<%$Resources:MachinesRequests,Devices %>"
                        ClientIDMode="Static"></asp:Label>
                </p>
                <div class="l-adddevice add-visitor">
                    <button id="AddDeviceBTN" class="btn btn-apply hvr-shutter-out-horizontal" tabindex="1">
                        <asp:Literal runat="server"
                            Text="<%$Resources:MachinesRequests,AddNewDevice %>"></asp:Literal>
                    </button>
                </div>
                <div class="request-devices">
                    <div class="deviceRow">

                        <div class="deviceRowData">
                            <div class="row">

                                <div class=" col-md-3">
                                    <div class="form-group ">
                                        <label class="col-form-label">
                                            <asp:Label ID="lblDeviceType" runat="server"
                                                Text="<%$Resources:MachinesRequests,DeviceType %>" ClientIDMode="Static">
                                            </asp:Label>
                                        </label>
                                        <span class="is-required">*</span>
                                        <asp:TextBox ID="txtDeviceType" MaxLength="60" required="required" runat="server"
                                            ClientIDMode="Static" CssClass="device-Type form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label class="col-form-label">
                                            <asp:Label ID="lblItemsCount" runat="server"
                                                Text="<%$Resources:MachinesRequests,ItemCount %>" ClientIDMode="Static">
                                            </asp:Label>
                                        </label>
                                        <span class="is-required">*</span>
                                        <asp:TextBox ID="txtItemCount" required="required" MaxLength="15" runat="server"
                                            ClientIDMode="Static" CssClass="device-ItemCount form-control" onkeypress="javascript:return isNumber(event)"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group ">
                                        <label class="col-form-label">
                                            <asp:Label ID="lblDeviceNumber" runat="server"
                                                Text="<%$Resources:MachinesRequests,DeviceNumber %>" ClientIDMode="Static">
                                            </asp:Label>
                                        </label>
                                        <asp:TextBox ID="txtDeviceNumber" MaxLength="15" runat="server"
                                            ClientIDMode="Static" CssClass="device-deviceNumber form-control"></asp:TextBox>
                                    </div>
                                </div>


                                <div class=" col-md-2">
                                    <div class="form-group ">
                                        <label class="col-form-label">
                                            <asp:Label ID="lblCompanyName" runat="server"
                                                Text="<%$Resources:MachinesRequests,CompanyName %>" ClientIDMode="Static">
                                            </asp:Label>
                                        </label>
                                        <asp:TextBox ID="txtCompanyName" MaxLength="60" runat="server"
                                            ClientIDMode="Static" CssClass="company-Name form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="form-group ">
                                        <label class="col-form-label">
                                            <asp:Label ID="lblNotesAboutDevice" runat="server"
                                                Text="<%$Resources:MachinesRequests,DeviceNotes %>" ClientIDMode="Static">
                                            </asp:Label>
                                        </label>
                                        <textarea maxlength="40" id="device-notes"
                                            class="device-NotesAboutDevice form-control"></textarea>
                                    </div>
                                </div>


                            </div>
                        </div>


                    </div>


                </div>
            </div>

            <div class="container">
                <div class="form-row">
                    <div class="form-group col-md-12">

                        <button type="button" class="btn preview-btn" id="btnPreview">
                            <asp:Literal runat="server" ID="ltrPreview"
                                Text="<%$Resources:MachinesRequests,DeviceRequestReview %>">
                            </asp:Literal>
                        </button>

                        <button type="button" class="btn preview-btn send-btn" id="btnSend">
                            <asp:Literal runat="server" ID="ltrSend"
                                Text="<%$Resources:MachinesRequests,DeviceRequestSend %>">
                            </asp:Literal>
                        </button>


                    </div>
                </div>
            </div>
        </div>

        <!-- modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered formLayout-model" role="document">
                <div class="modal-content">
                    <div class="modal-header">

                        <p class="modal-title" id="exampleModalLongTitle">
                            <asp:Label runat="server" ID="security__RequestEntryDevices" ClientIDMode="Static">
                            </asp:Label>
                        </p>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p class="request-msgtitle">
                            <asp:Literal runat="server"
                                Text="<%$Resources:MachinesRequests,RequestMessage %>"></asp:Literal>
                        </p>
                        <p class="request-msg">
                            <span id="DeviceEnterMessageTitle"></span>

                        </p>


                        <div class="visitinfo">
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <i class=" mdi mdi-calendar "></i>
                                    <label class="col-form-label">
                                        <asp:Label runat="server" ID="lblEnterDatePreview" ClientIDMode="Static">
                                        </asp:Label>
                                    </label>
                                    <p id="DevicesEnterDatePreview" class="info-data"></p>
                                </div>

                                <div class="form-group col-md-4">
                                    <i class=" mdi mdi-av-timer "></i>
                                    <label class="col-form-label">
                                        <asp:Label runat="server" ID="lblEnterTimePreview" ClientIDMode="Static">
                                        </asp:Label>
                                    </label>
                                    <p id="entryTimePreview" class="info-data"></p>
                                </div>

                            </div>
                        </div>
                        <div class="heading-title">
                            <p>
                                <asp:Literal runat="server"
                                    Text="<%$Resources:MachinesRequests,security__supervisorInfo %>"></asp:Literal>
                            </p>
                        </div>
                        <div class="emp-request">
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <span id="applicantNamePreview" class="info-data"></span>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="col-form-label">
                                        <asp:Literal runat="server"
                                            Text="<%$Resources:MachinesRequests,DelegateName %>"></asp:Literal>
                                    </label>
                                    <p id="delegateNamePreview" class="info-data"></p>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="col-form-label">

                                        <asp:Literal runat="server"
                                            Text="<%$Resources:MachinesRequests,DelegateID %>"></asp:Literal>
                                    </label>
                                    <p id="delegateNumberPreview" class="info-data"></p>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="col-form-label">
                                        <asp:Literal runat="server"
                                            Text="<%$Resources:MachinesRequests,security__workPlace %>"></asp:Literal>
                                    </label>
                                    <p id="delegateWorkPreview" class="info-data"></p>
                                </div>
                            </div>
                        </div>

                        <div class="heading-title">
                            <p>
                                <asp:Literal runat="server"
                                    Text="<%$Resources:MachinesRequests,security__devicesInfo %>"></asp:Literal>
                            </p>
                        </div>
                        <div class="request-devices-review">
                            <div class="form-group col-6 col-md-3">

                                <asp:Label ID="Label1" runat="server" class="info-data"
                                    Text="<%$Resources:MachinesRequests,DeviceType %>" ClientIDMode="Static"></asp:Label>

                            </div>
                            <div class="form-group col-6 col-md-2">

                                <asp:Label ID="Label2" runat="server" class="info-data"
                                    Text="<%$Resources:MachinesRequests,DeviceNumber %>" ClientIDMode="Static"></asp:Label>
                            </div>
                            <div class="form-group col-6 col-md-2">

                                <asp:Label ID="Label3" runat="server" class="info-data"
                                    Text="<%$Resources:MachinesRequests,CompanyName %>" ClientIDMode="Static"></asp:Label>
                            </div>
                            <div class="form-group col-6 col-md-2">
                                <asp:Label runat="server" ID="DeviceEnterDate1" ClientIDMode="Static">
                                </asp:Label>
                            </div>
                            <div class="form-group col-6 col-md-2">

                                <asp:Label ID="Label5" runat="server" class="info-data"
                                    Text="<%$Resources:MachinesRequests,DeviceNotes %>" ClientIDMode="Static"></asp:Label>
                            </div>


                        </div>

                    </div>
                    <div class="modal-footer">

                        <button type="button" class="btn preview-btn " data-dismiss="modal">
                            <asp:Literal runat="server"
                                Text="<%$Resources:MachinesRequests,Close %>"></asp:Literal>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="sendModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered formLayout-modelSend" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <p class="modal-title" id="exampleModalLongTitle">
                            <asp:Label runat="server" ID="SendAddDevicesRequest" ClientIDMode="Static">
                            </asp:Label>

                        </p>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p id="MsgID">
                            <asp:Literal runat="server"
                                Text="<%$Resources:MachinesRequests,YourRequestHasBeenSendSuccessfully %>"></asp:Literal>
                        </p>
                    </div>

                </div>

            </div>

        </div>

    </div>
    <!-- <button id="btnSend" class="btn btn-primary">ارسل الطلب</button> -->
    <script src="/modwf/style Library/branding/js/general/helpers.js"></script>
    <script type="text/javascript">
        $(".hidden-cols").hide();

        var apiRootAddress = $("#hdnAPIRootURL").val();
        var listSiteUrl = $("#hdnWFWebUrl").val()
        var requestType = $("#hdnRequestType").val();

        $(function () {

            setLabelsTranslations();

            var messageKey = '';
            if ($("#hdnRequestType").val() == '0') {
                messageKey = 'machinesentryrequests';
            }
            else {
                messageKey = 'machinesexitrequest';
            }

            getWFMessage(messageKey, function (data) {
                $("#lblRequestMessage").text(data);
            });
            getDepartmentNameByCode(apiRootAddress, $("#hdnDepartmentCode").val(), function (data) {
                $("#lblUserDepartmentName").text(data);
            });
            getSectionNameByDeptartmentCodeAndSection(apiRootAddress, $("#hdnDepartmentCode").val(), $("#hdnSectionCode").val(), function (data) {
                $("#lblUserSectionName").text(data);
                hideLoader();
            });
        });

        function setLabelsTranslations() {
            if ($("#hdnRequestType").val() == "0") {
                document.getElementById("lblDevicesEnterDate").innerHTML = document.getElementById("lblEnterDatePreview").innerHTML = document.getElementById("GridTitle_RequestEnterDate1").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,GridTitle_RequestEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                document.getElementById("DeviceEnterDate1").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,DeviceEnterTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                document.getElementById("DeviceEnterTime").innerHTML = document.getElementById("lblEnterTimePreview").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,DeviceEnterTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                document.getElementById("SendAddDevicesRequest").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,SendAddDevicesRequest%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                document.getElementById("security__RequestEntryDevices").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,security__RequestEntryDevices%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            } else {
                document.getElementById("lblDevicesEnterDate").innerHTML = document.getElementById("lblEnterDatePreview").innerHTML = document.getElementById("GridTitle_RequestEnterDate1").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,GridTitle_RequestEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                document.getElementById("DeviceEnterTime").innerHTML = document.getElementById("lblEnterTimePreview").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,DeviceEnterTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                document.getElementById("DeviceEnterDate1").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,DeviceEnterTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                document.getElementById("SendAddDevicesRequest").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,SendAddDevicesRequest%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                document.getElementById("security__RequestEntryDevices").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,security__RequestEntryDevices%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            }
        }

        $("#btnSend").on("click", function (event) {
            event.preventDefault();
            if (!isFormValid()) {
                return;
            }

            if (!validateVisitDates($("#txtDevicesEnterDate"))) {
                $("#txtDevicesEnterDate").focus();
                return;
            }

            showLoader();
            var requestObject =
            {
                RequestType: requestType,
                RequestMessage: '',
                DevicesRequestDate: "",
                SupervisorName: "",
                IdentityNumber: "",
                WorkingPlace: "",
                ApplicantSection: "",
                ApplicantRank: "",
                ApplicantAdministration: "",
                ApplicantName: "",
                ISDeleted: false,
                RequestMachines: []
            };


            requestObject.RequestMachines = [];
            $("#btnSend").attr("disabled", true);
            $(".overlay").show();
            $(".loader").show();
            requestObject.RequestMessage = $("#lblRequestMessage").text();
            var startDateConverted = HijriJS.toGregorian($("#txtDevicesEnterDate").val(), "/");
            startDateConverted.setMonth(startDateConverted.getMonth());
            requestObject.DevicesRequestDate = startDateConverted;
            requestObject.ActionTime = $("#txtDeviceEnterTime").val();
            requestObject.SupervisorName = $("#txtDelegateName").val();
            requestObject.IdentityNumber = $("#txtDelegateIdentityNumber").val();
            requestObject.WorkingPlace = $("#txtDelegateWork").val();
            requestObject.ApplicantSection = $("#hdnSectionCode").val();
            requestObject.ApplicantName = $("#lblApplicantName").text();
            requestObject.ApplicantRank = $("#lblApplicantPosition").text();
            requestObject.ApplicantAdministration = $("#hdnDepartmentCode").val();
            requestObject.ISDeleted = false;


            var devicesCount = $(".deviceRow").length;
            var deviceCount = 0;

            requestObject.RequestMachines = [];
            for (var i = 0; i < devicesCount; i++) {
                machine = {};
                machine.DeviceNumber = $(".deviceRow:eq(" + i + ") .device-deviceNumber").val();
                machine.ItemsCount = $(".deviceRow:eq(" + i + ") .device-ItemCount").val();
                machine.DeviceType = $(".deviceRow:eq(" + i + ") .device-Type").val();
                machine.ManufacturingCompanyName = $(".deviceRow:eq(" + i + ") .company-Name").val();
                machine.NotesAboutDevice = $(".deviceRow:eq(" + i + ") .device-NotesAboutDevice").val();
                machine.IsMachineDeleted = false;

                deviceCount = $(".deviceRow:eq(" + i + ") .deviceRow").length;

                requestObject.RequestMachines.push(machine);
            }

            postRequest(JSON.stringify(requestObject));

        });
        $("#btnPreview").click(function (event) {
            event.preventDefault();

            if (!isFormValid()) {
                return;
            }

            $("#DeviceEnterMessageTitle").text($("#lblRequestMessage").text());
            $("#DevicesEnterDatePreview").text($("#txtDevicesEnterDate").val());
            $("#entryTimePreview").text($("#txtDeviceEnterTime").val());
            $("#delegateNamePreview").text($("#txtDelegateName").val());
            $("#delegateNumberPreview").text($("#txtDelegateIdentityNumber").val());
            $("#delegateWorkPreview").text($("#txtDelegateWork").val());

            var devicesCount = $(".deviceRow").length;


            $(".request-devices-review").empty();

            for (var i = 0; i < devicesCount; i++) {

                var elem = document.createElement("tr");
                elem.classList.add("form-row", "reviewCol");

                var deviceRowBody = '';


                //deviceRowBody += '<div class="form-group info-data  col-md-7 ">';
                //deviceRowBody += '</div>';

                //deviceRowBody += '<div class="form-group info-data  dateTime col-md-5 ">';
                //if ($("#hdnRequestType").val() == "0")
                //    deviceRowBody += '<p class="dateTime-label"> <i class=" mdi mdi-av-timer "></i> وقت دخول الجهاز : ';
                //else
                //    deviceRowBody += '<p class="dateTime-label"> <i class=" mdi mdi-av-timer "></i> وقت خروج الجهاز : ';

                //deviceRowBody += '<span class="time">';
                //deviceRowBody += $(".deviceRow:eq(" + i + ") .device-VisitTime").val();
                //deviceRowBody += '</span>';
                //deviceRowBody += '</p></div>';

                deviceRowBody += '<div class="form-group  col-md-2 ">';
                deviceRowBody += '<span class="nation-icon"></span>';
                if (i == 0)
                    deviceRowBody += '  <label class="col-form-label">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceType%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '  </label>';
                deviceRowBody += '<p class="info-data">';
                deviceRowBody += $(".deviceRow:eq(" + i + ") .device-Type").val();
                deviceRowBody += '</p>';
                deviceRowBody += '</div>';

                deviceRowBody += '<div class="form-group  col-md-2 ">';
                deviceRowBody += '<span class="nation-icon"></span>';
                if (i == 0)
                    deviceRowBody += '  <label class="col-form-label">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,ItemCount%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '  </label>';
                deviceRowBody += '<p class="info-data">';
                deviceRowBody += $(".deviceRow:eq(" + i + ") .device-ItemCount").val();
                deviceRowBody += '</p>';
                deviceRowBody += '</div>';

                var deviceNumber = $(".deviceRow:eq(" + i + ") .device-deviceNumber").val();
                //if (deviceNumber != "") {
                deviceRowBody += '<div class="form-group  col-md-2 ">';
                deviceRowBody += '<span class="ID-icon"></span>';
                if (i == 0)
                    deviceRowBody += '  <label class="col-form-label">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceNumber%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '  </label>';
                deviceRowBody += '<p class="info-data">';
                deviceRowBody += '<span>';
                deviceRowBody += deviceNumber;
                deviceRowBody += '</span>';
                deviceRowBody += '<span class=" class="numberid"">';
                deviceRowBody += $(".deviceRow:eq(" + i + ") .device-IdentityType option:selected").text();
                deviceRowBody += '</span>';
                deviceRowBody += '</p >';
                deviceRowBody += '</div>';
                //}

                var deviceCompanyName = $(".deviceRow:eq(" + i + ") .company-Name").val();
                //if (deviceCompanyName != "") {
                deviceRowBody += '<div class="form-group  col-md-3 ">';
                deviceRowBody += '<span class="ID-icon"></span>';
                if (i == 0)
                    deviceRowBody += '  <label class="col-form-label"> ' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,CompanyName%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + ' </label>';
                deviceRowBody += '<p class="info-data">';
                deviceRowBody += '<span>';
                deviceRowBody += deviceCompanyName;
                deviceRowBody += '</span>';
                deviceRowBody += '<span class=" class="numberid"">';
                deviceRowBody += $(".deviceRow:eq(" + i + ") .device-IdentityType option:selected").text();
                deviceRowBody += '</span>';
                deviceRowBody += '</p >';
                deviceRowBody += '</div>';
                //}

                var deviceNotes = $(".deviceRow:eq(" + i + ") .device-NotesAboutDevice").val();
                //if (deviceNotes != "") {
                deviceRowBody += '<div class="form-group col-md-3">';
                deviceRowBody += '<span class="work-icon"></span>';
                if (i == 0)
                    deviceRowBody += " <label class='col-form-label'>  <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>  </label>";
                deviceRowBody += '<p class="info-data">';
                deviceRowBody += $(".deviceRow:eq(" + i + ") .device-NotesAboutDevice").val();
                deviceRowBody += '<p>';
                deviceRowBody += '</div>';
                //}

                deviceRowBody += '</div>';

                elem.innerHTML = deviceRowBody;


                $(".request-devices-review").append(elem);
            }

            $('#myModal').modal({ backdrop: 'static', keyboard: false });

            $(".reviewCol").click(function () {
                $(this).toggleClass("opend");
            });



        });

        function postRequest(requestData) {
            var url = apiRootAddress + "DevicesRequest/AddDevicesRequest?ListSiteUrl=" + listSiteUrl;
            $.ajax({
                url: url,
                type: 'POST',
                contentType: 'application/json',
                data: requestData,
                success: function (result) {

                    if (result.statusCode == "1") {
                        showSendMsg("<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,YourRequestSendSuccessfully%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
                        $("#btnSend").attr("disabled", true);
                        hideLoader();
                        window.location.href = "default.aspx";
                    }
                    else {

                        showSendMsg("<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,SomeThingError%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
                        $("#btnSend").attr("disabled", true);
                        hideLoader();
                        return;
                    }
                }
                ,
                error: function (err) {
                    hideLoader();
                    alert(err.statusText);
                },

                complete: function () {

                }
            });
        }

        var devicesContainer = $('.request-devices');
        var RenderNewdevice = function () {

            var elem = document.createElement("div");
            elem.classList.add("deviceRow");
            // elem.classList.add("form-row");

            var deviceRowBody = '';
            deviceRowBody += '<div class="row deviceRowData mt-3">';
            deviceRowBody += '<div class="form-group col-md-3">';
            deviceRowBody += '<label class="col-form-label">';

            deviceRowBody += "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceType %>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";

            deviceRowBody += '</label>';
            deviceRowBody += '<span class="is-required">*</span>';
            deviceRowBody += '<input type="text" required="required" maxlength="60" class="device-Type form-control" />';
            deviceRowBody += '</div>';


            deviceRowBody += '<div class="form-group col-md-2">';
            deviceRowBody += '<label class="col-form-label">';
            deviceRowBody += "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,ItemCount %>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            deviceRowBody += '</label>';
            deviceRowBody += '<span class="is-required">*</span>';
            deviceRowBody += '<input required="required" type="text" maxlength="15" class="device-ItemCount form-control" />';
            deviceRowBody += '</div>';


            deviceRowBody += '<div class="form-group col-md-2">';
            deviceRowBody += '<label class="col-form-label">';
            deviceRowBody += "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceNumber %>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            deviceRowBody += '</label>';
            deviceRowBody += '<input type="text" maxlength="15" class="device-deviceNumber form-control" />';
            deviceRowBody += '</div>';


            deviceRowBody += '<div class="form-group col-md-2">';
            deviceRowBody += '<label class="col-form-label">';
            deviceRowBody += "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,CompanyName %>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            deviceRowBody += '</label>';
            deviceRowBody += '<input type="text" maxlength="60" class="company-Name form-control" />';
            deviceRowBody += '</div>';


            deviceRowBody += '<div class="form-group col-md-3">';
            deviceRowBody += '<label class="col-form-label">';
            deviceRowBody += "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceNotes %>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            deviceRowBody += '</label>';
            deviceRowBody += '<textarea maxlength="40" class="device-NotesAboutDevice form-control"></textarea>';
            deviceRowBody += '</div>';
            deviceRowBody += '</div>';



            //End of form-row deviceRowData
            deviceRowBody += '</div>';
            deviceRowBody += '<div class=" delete-row delete-device">';
            deviceRowBody += '<button  class="request-deletedevice btn  hvr-shutter-out-horizontal" title="delete"> - </button>';
            deviceRowBody += '</div>';


            deviceRowBody += '</div>';

            elem.innerHTML = deviceRowBody;
            return elem;
        };

        $("#AddDeviceBTN").on("click", function (event) {
            event.preventDefault();
            devicesContainer.append(RenderNewdevice());

        });

        $('.request-devices').on("click", function (event) {
            if (
                event.target &&
                event.target.nodeName === "BUTTON" &&
                event.target.classList.contains("request-deletedevice")
            ) {
                event.preventDefault();
                $(event.target.parentElement.parentElement).remove();
            }
        });



        $(document).on("blur", "#txtDevicesEnterDate, #txtDeviceEnterDate", function () {
            validateVisitDates($(this));
        });

        $(document).on("change", "#txtDevicesEnterDate, #txtDeviceEnterDate", function (e) {
            validateVisitDates($(this));
        });

    </script>
</asp:Panel>


<asp:Panel runat="server" ID="pnlMessage">
    <div class="container" style="font-size: 16px; line-height: 30px;">
        <svg style="width: 25px; height: 25px;" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px" viewBox="0 0 330 330" style="enable-background: new 0 0 330 330;" xml:space="preserve" width="512px" height="512px">
            <g>
                <g>
                    <path d="M165,0C74.019,0,0,74.02,0,165.001C0,255.982,74.019,330,165,330s165-74.018,165-164.999C330,74.02,255.981,0,165,0z    M165,300c-74.44,0-135-60.56-135-134.999C30,90.562,90.56,30,165,30s135,60.562,135,135.001C300,239.44,239.439,300,165,300z" data-original="#000000" class="active-path" data-old_color="#000000" fill="#C10D0D" />
                    <path d="M164.998,70c-11.026,0-19.996,8.976-19.996,20.009c0,11.023,8.97,19.991,19.996,19.991   c11.026,0,19.996-8.968,19.996-19.991C184.994,78.976,176.024,70,164.998,70z" data-original="#000000" class="active-path" data-old_color="#000000" fill="#C10D0D" />
                    <path d="M165,140c-8.284,0-15,6.716-15,15v90c0,8.284,6.716,15,15,15c8.284,0,15-6.716,15-15v-90C180,146.716,173.284,140,165,140z   " data-original="#000000" class="active-path" data-old_color="#000000" fill="#C10D0D" />
                </g>
            </g>
        </svg>

        <asp:Label ID="lblMissingDataMessageTitle" runat="server" Style="font-size: 18px; font-weight: 600;" Text="<%$Resources:VisitRequest,UserHasNotGroupMessage %>">
        </asp:Label>
        <asp:Label ID="lblMissingDataMessage" Style="font-weight: 600; font-size: 14px; display: block; margin-top: 10px;" runat="server" Text="<%$Resources:VisitRequest,UserHasNotGroupMessage %>">
        </asp:Label>
    </div>
</asp:Panel>
