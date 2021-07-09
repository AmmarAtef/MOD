<%@ Assembly Name="DevicesRequestsWFWebparts, Version=1.0.0.0, Culture=neutral, PublicKeyToken=97afcd5d4112e71c" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditDevicesRequestWPUserControl.ascx.cs" Inherits="DevicesRequestsWFWebparts.EditDevicesRequestWP.EditDevicesRequestWPUserControl" %>

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
                        <span class="is-required">*</span>
                        <asp:TextBox ID="txtDevicesEnterDate" onblur="isInputRequired(this);" isMandatory MaxLength="15"
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
                            <span class="is-required">*</span>
                            <asp:TextBox ID="txtDelegateName" MaxLength="60" required="required" runat="server"
                                ClientIDMode="Static" CssClass="delegate-Name form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="form-group ">
                            <label class="col-form-label">
                                <asp:Label ID="lblDelegateIdentityNumber" runat="server"
                                    Text="<%$Resources:MachinesRequests,DelegateID %>" ClientIDMode="Static"></asp:Label>
                            </label>
                            <span class="is-required">*</span>
                            <asp:TextBox ID="txtDelegateIdentityNumber" required="required" MaxLength="15" runat="server"
                                ClientIDMode="Static" CssClass="delegate-IdentityNumber form-control"></asp:TextBox>
                        </div>

                    </div>

                    <div class="col-md-3">
                        <div class="form-group ">
                            <label class="col-form-label">
                                <asp:Label ID="lblDelegateWork" runat="server"
                                    Text="<%$Resources:MachinesRequests,DelegateWork %>" ClientIDMode="Static"></asp:Label>
                            </label>
                            <asp:TextBox ID="txtDelegateWork" MaxLength="60" runat="server"
                                ClientIDMode="Static" CssClass="delegate-Work form-control"></asp:TextBox>
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
            <div class="l-adddevice add-visitor">
                <button id="AddDeviceBTN" class="AddDeviceBTN btn btn-apply hvr-shutter-out-horizontal" tabindex="1">

                    <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,AddNewDevice %>"></asp:Literal>
                </button>
            </div>
            <div class="request-devices">
            </div>
        </div>

        <div class="container">
            <div class="form-row">
                <div class="form-group col-md-12">
                    <div class="form-group col-md-12 hidden" style="display: none">
                        <asp:Label ID="lblRequestId" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                    </div>
                    <button type="button" class="btn preview-btn" id="btnPreview">
                        <asp:Literal runat="server" ID="ltrPreview"
                            Text="<%$Resources:MachinesRequests,DeviceRequestReview %>">
                        </asp:Literal>
                    </button>

                    <button type="button" class="btn preview-btn send-btn" id="btnSend">
                        <asp:Literal runat="server" ID="ltrSend"
                            Text="<%$Resources:MachinesRequests,DeviceRequestEditSend %>">
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
                        <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,RequestMessage %>"></asp:Literal>
                    </p>
                    <p class="request-msg">
                        <span id="DeviceEnterMessageTitle"></span>

                    </p>


                    <div class="visitinfo">
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <i class=" mdi mdi-calendar "></i>
                                <label class="col-form-label">
                                    <asp:Label runat="server" ID="security__DeviceEnterTime" ClientIDMode="Static">
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
                            <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,security__supervisorInfo %>">
                            </asp:Literal>
                        </p>
                    </div>
                    <div class="emp-request">
                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <span id="applicantNamePreview" class="info-data"></span>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="col-form-label">
                                    <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,DelegateName %>">
                                    </asp:Literal>
                                </label>
                                <p id="delegateNamePreview" class="info-data"></p>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="col-form-label">
                                    <asp:Literal runat="server"
                                        Text="<%$Resources:MachinesRequests,security__IdentityNumber %>"></asp:Literal>
                                </label>
                                <p id="delegateNumberPreview" class="info-data"></p>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="col-form-label">
                                    <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,security__workPlace %>">
                                    </asp:Literal>
                                </label>
                                <p id="delegateWorkPreview" class="info-data"></p>
                            </div>
                        </div>
                    </div>

                    <div class="heading-title">
                        <p>

                            <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,DevicesData %>"></asp:Literal>
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

                            <asp:Label ID="Label4" runat="server" class="info-data"
                                Text="<%$Resources:MachinesRequests,DeviceEnterTime %>" ClientIDMode="Static"></asp:Label>
                        </div>
                        <div class="form-group col-6 col-md-2">

                            <asp:Label ID="Label5" runat="server" class="info-data"
                                Text="<%$Resources:MachinesRequests,DeviceNotes %>" ClientIDMode="Static"></asp:Label>
                        </div>


                    </div>

                </div>
                <div class="modal-footer">

                    <button type="button" class="btn preview-btn " data-dismiss="modal">

                        <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,Close %>"></asp:Literal>
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
                        <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,SendEditRequest %>"></asp:Literal>
                    </p>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p id="MsgID">
                        <asp:Literal runat="server"
                            Text="<%$Resources:MachinesRequests,EditRequestDoneSuccessfully %>"></asp:Literal>
                    </p>
                </div>

            </div>

        </div>

    </div>

</div>

<script src="/modwf/style Library/branding/js/general/helpers.js"></script>
<script src="/modwf/style Library/branding/js/general/devicesShared.js"></script>
<script type="text/javascript">

    var devicesContainer = $('.request-devices');
    $(".hidden-cols").hide();
    
    var apiRootAddress = $("#hdnAPIRootURL").val();
    var listSiteUrl = $("#hdnWFWebUrl").val()
    var requestType = $("#hdnRequestType").val();
    var currentUserId = _spPageContextInfo.userId;
    var request;

    $(function () {
        setLabelsTranslations();

        var rid = getUrlParameter('rid');
        getRequest(rid, function (data) {
            if (data == null) {
                $(".formLayout .container").hide();
                $(".formLayout").append("<div class='container'><p style='text-align:center;padding: 100px'>غير مسموح لك بتعديل هذا الطلب</p></div>")
                return;
            }
            request = data;
            $("#lblRequestId").text(request.ID);
            $("#lblRequestMessage").text(request.RequestMessage);
            $("#txtDelegateName").val(request.SupervisorName);
            $("#txtDevicesEnterDate").val(getHijriDateForInput(request.DevicesRequestDate));
            $("#txtDeviceEnterTime").val(request.ActionTime);
            $("#txtDelegateIdentityNumber").val(request.IdentityNumber);
            $("#txtDelegateWork").val(request.WorkingPlace);
            $("#txtDeviceType").text(request.ApplicantRank);
            $('.daytext').text(GetHijriDayName(request.DevicesRequestDate));
            $("#lblApplicantPosition").text(request.ApplicantRank);
            $("#lblApplicantSection").text(request.ApplicantSection);
            $("#lblApplicantDepartment").text(request.ApplicantAdministration);
            $("#lblApplicantName").text(request.ApplicantName);

            //Lookups data
            var visitReasonsData = null;
            var nationalitiesData = null;
            var identityTypesData = null;
            var lookupsDataAPI$ = apiRootAddress + "VisitRequest/GetAllLookups?ListSiteUrl=" + listSiteUrl;
            getDataByAPI(
                lookupsDataAPI$,
                function (data) {
                    visitReasonsData = data.VisitingReasonsList;
                    $("#ddlVisitReason").val(request.VisitReason);

                    nationalitiesData = data.NationalityList;

                    identityTypesData = data.IdentityList;
                    $("#ddlVisitorIdentityTypes").append("<option value=''>'+<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,Choose%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>+'</option>");
                    identityTypesData.forEach(function (item) {
                        $("#ddlVisitorIdentityTypes").append('<option value="' + item.ID + '">' + item.Title + '</option>');
                    });

                    request.RequestMachines.forEach(function (item, index) {
                        devicesContainer.append(RenderNewdevice(item, index));
                    });
                }
            );
            hideLoader();
        });
    });

    function setLabelsTranslations() {
        if ($("#hdnRequestType").val() == "0") {
            document.getElementById("GridTitle_RequestEnterDate").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,GridTitle_RequestEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("GridTitle_RequestEnterDate1").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,DevicesEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("security__RequestEntryDevices").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,security__RequestEntryDevices%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("security__DeviceEnterTime").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,DeviceEnterTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("DeviceEnterTime").innerHTML = document.getElementById("lblEnterTimePreview").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,DeviceEnterTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";

        } else {
            document.getElementById("GridTitle_RequestEnterDate").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,GridTitle_RequestEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("GridTitle_RequestEnterDate1").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,DevicesEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("security__RequestEntryDevices").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,security__RequestEntryDevices%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("security__DeviceEnterTime").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,DeviceEnterTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("DeviceEnterTime").innerHTML = document.getElementById("lblEnterTimePreview").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,DeviceEnterTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
        }
    }

    function getRequest(id, callback) {
        var visitReasonsDataAPI$ = apiRootAddress + "DevicesRequest/GetRequestDetailsForEdit?ListSiteUrl=" + listSiteUrl + "&CurrentUserId=" + currentUserId + "&RequestID=" + id;
        getDataByAPI(
            visitReasonsDataAPI$,
            function (data) {
                callback(data);
            }
        );
    }

    $("#btnPreview").click(function (event) {
        event.preventDefault();

        if (!isFormValid()) {
            return;
        }

        $("#DeviceEnterMessageTitle").text($("#lblRequestMessage").text());
        $("#DevicesEnterDatePreview").text(GetHijriDate(request.DevicesRequestDate));
        $("#entryTimePreview").text($("#txtDeviceEnterTime").val());
        $("#delegateNamePreview").text($("#txtDelegateName").val());
        $("#delegateNumberPreview").text($("#txtDelegateIdentityNumber").val());
        $("#delegateWorkPreview").text($("#txtDelegateWork").val());

        var devicesCount = $(".deviceRow").length;


        $(".request-devices-review").empty();

        for (var i = 0; i < devicesCount; i++) {
            if ($(".deviceRow:eq(" + i + ") .device-Type").val() == "")
                //  ||
                // $(".deviceRow:eq(" + i + ") .device-deviceNumber").val() ||
                // $(".deviceRow:eq(" + i + ") .company-Name").val())
                continue;
            //console.log( $(".deviceRow:eq(" + i + ") .device-Type").val());
            var elem = document.createElement("tr");
            elem.classList.add("form-row", "reviewCol");

            var deviceRowBody = '';

            deviceRowBody += '<div class="form-group  col-md-2 ">';
            deviceRowBody += '<span class="nation-icon"></span>';
            if (i == 0)
                deviceRowBody += "<label class='col-form-label'> <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceType%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </label>";
            deviceRowBody += '<p class="info-data">';
            deviceRowBody += $(".deviceRow:eq(" + i + ") .device-Type").val();
            deviceRowBody += '</p>';
            deviceRowBody += '</div>';


            deviceRowBody += '<div class="form-group  col-md-2 ">';
            deviceRowBody += '<span class="ID-icon"></span>';
            if (i == 0)
                deviceRowBody += "<label class='col-form-label'> <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,ItemCount%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </label>";
            deviceRowBody += '<p class="info-data">';
            deviceRowBody += '<span>';
            deviceRowBody += $(".deviceRow:eq(" + i + ") .device-ItemCount").val();
            deviceRowBody += '</span>';
            //deviceRowBody += '<span class=" class="numberid"">';
            //deviceRowBody += $(".deviceRow:eq(" + i + ") .device-IdentityType option:selected").text();
            //deviceRowBody += '</span>';
            deviceRowBody += '</p >';
            deviceRowBody += '</div>';


            var deviceNumber = $(".deviceRow:eq(" + i + ") .device-deviceNumber").val();

            //if (deviceNumber != "") {
            deviceRowBody += '<div class="form-group  col-md-2 ">';
            deviceRowBody += '<span class="ID-icon"></span>';
            if (i == 0)
                deviceRowBody += "<label class='col-form-label'> <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceNumber%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </label>";
            deviceRowBody += '<p class="info-data">';
            deviceRowBody += '<span>';
            deviceRowBody += deviceNumber;
            deviceRowBody += '</span>';
            //deviceRowBody += '<span class=" class="numberid"">';
            //deviceRowBody += $(".deviceRow:eq(" + i + ") .device-IdentityType option:selected").text();
            //deviceRowBody += '</span>';
            deviceRowBody += '</p >';
            deviceRowBody += '</div>';
            //}

            var companyName = $(".deviceRow:eq(" + i + ") .company-Name").val();
            //if (companyName != "") {
            deviceRowBody += '<div class="form-group  col-md-3 ">';
            deviceRowBody += '<span class="ID-icon"></span>';
            if (i == 0)
                deviceRowBody += "<label class='col-form-label'> <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,CompanyName%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </label>";
            deviceRowBody += '<p class="info-data">';
            deviceRowBody += '<span>';
            deviceRowBody += companyName;
            deviceRowBody += '</span>';
            //deviceRowBody += '<span class=" class="numberid"">';
            //deviceRowBody += $(".deviceRow:eq(" + i + ") .device-IdentityType option:selected").text();
            //deviceRowBody += '</span>';
            deviceRowBody += '</p >';
            deviceRowBody += '</div>';
            //}

            var deviceNotes = $(".deviceRow:eq(" + i + ") .device-NotesAboutDevice").val();
            //if (deviceNotes != "") {
            deviceRowBody += '<div class="form-group col-md-3">';
            deviceRowBody += '<span class="work-icon"></span>';
            if (i == 0)
                deviceRowBody += "<label class='col-form-label'> <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </label>";
            deviceRowBody += '<p class="info-data">';
            deviceRowBody += deviceNotes;
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
        var startDateConverted = HijriJS.toGregorian($("#txtDevicesEnterDate").val(), "/");
        startDateConverted.setMonth(startDateConverted.getMonth());

        var requestObject =
        {
            ID: $("#lblRequestId").text(),
            RequestType: requestType,
            RequestMessage: $("#lblRequestMessage").text(),
            DevicesRequestDate: startDateConverted,
            ActionTime: $("#txtDeviceEnterTime").val(),
            SupervisorName: $("#txtDelegateName").val(),
            IdentityNumber: $("#txtDelegateIdentityNumber").val(),
            WorkingPlace: $("#txtDelegateWork").val(),
            ApplicantSection: $("#lblApplicantSection").text(),
            ApplicantRank: $("#lblApplicantPosition").text(),
            ApplicantAdministration: $("#lblApplicantDepartment").text(),
            ApplicantName: $("#lblApplicantName").text(),
            ISDeleted: false,
            RequestMachines: []
        };

        requestObject.RequestMachines = [];
        $(".loader").show();
        $(".overlay").show();
        $("#btnSend").attr("disabled", true);

        var devicesCount = $(".deviceRow").length;
        var deviceCount = 0;

        requestObject.RequestMachines = [];

        for (var i = 0; i < devicesCount; i++) {
            machine = {};
            machine.ID = $(".deviceRow:eq(" + i + ") .device-Id").val();
            machine.DeviceNumber = $(".deviceRow:eq(" + i + ") .device-deviceNumber").val();
            machine.DeviceType = $(".deviceRow:eq(" + i + ") .device-Type").val();
            machine.ManufacturingCompanyName = $(".deviceRow:eq(" + i + ") .company-Name").val();
            machine.NotesAboutDevice = $(".deviceRow:eq(" + i + ") .device-NotesAboutDevice").val();
            machine.ItemsCount = $(".deviceRow:eq(" + i + ") .device-ItemCount").val();
            machine.IsMachineDeleted = false;
            if (machine.ID == "") {
                // New
                machine.State = "1";
            } else {
                // Update
                machine.State = "2";
            }


            requestObject.RequestMachines.push(machine);
        }
        request.RequestMachines.forEach(function (device) {
            var isDeviceRecordStillExist = false;
            requestObject.RequestMachines.forEach(function (machineObject) {
                if (machineObject.ID == device.ID) {
                    isDeviceRecordStillExist = true;
                }
            });

            if (!isDeviceRecordStillExist) {
                device.State = "3";

                requestObject.RequestMachines.push(device);
            }
        });


        postRequest(JSON.stringify(requestObject));
    });

    function postRequest(requestData) {
        var url = apiRootAddress + "DevicesRequest/UpdateDevicesRequest?ListSiteUrl=" + listSiteUrl;
        $.ajax({
            url: url,
            type: 'POST',
            contentType: 'application/json',
            data: requestData,
            success: function (result) {
                if (result.statusCode == 1) {
                    $("#btnSend").attr("disabled", true);
                    hideLoader();
                    showSendMsg("<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,EditRequestDoneSuccessfully%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
                }
                else {
                    hideLoader();
                    $("#btnSend").attr("disabled", false);
                    showSendMsg(result.statusMessage);
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

    $(document).on("click", ".AddVisitorBTN", function (event) {
        event.preventDefault();
        visitorsContainer.append(renderNewVisitor(null, nationalitiesData, identityTypesData));
    });

    $(document).on("click", "#AddDeviceBTN", function (event) {
        event.preventDefault();

        $('.request-devices').append(RenderNewdevice(null, -1));

    });

    $(document).on("click", ".formLayout-container", function (event) {

        //Remove device button
        if (
            event.target &&
            event.target.nodeName === "BUTTON" &&
            event.target.classList.contains("request-deletedevice")
        ) {
            event.preventDefault();
            $(event.target.parentElement.parentElement).remove();
        }

    });

    function RenderNewdevice(device, index) {
        var elem = document.createElement("div");
        elem.classList.add("deviceRow");
        // elem.classList.add("form-row");
        console.log(device);

        var deviceRowBody = '';
        deviceRowBody += '<div class="row deviceRowData mt-3">';
        deviceRowBody += '<div class="form-group col-md-1 hidden"style="display:none">';
        deviceRowBody += '<input type="text" class="device-Id form-control" value="' + (device !== null ? device.ID : "") + '" />';
        deviceRowBody += '</div>';
        deviceRowBody += '<div class="form-group col-md-3">';

        deviceRowBody += '<label class="col-form-label">';

        deviceRowBody += "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceType %>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";

        deviceRowBody += '</label>';
        deviceRowBody += '<span class="is-required">*</span>';
        deviceRowBody += '<input type="text" required="required" maxlength="60" class="device-Type form-control" value="' + (device !== null ? device.DeviceType : "") + '" />';
        deviceRowBody += '</div>';

        console.log('device', device);
        deviceRowBody += '<div class="form-group col-md-2">';

        deviceRowBody += '<label class="col-form-label">';
        deviceRowBody += "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,ItemCount %>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
        deviceRowBody += '</label>';
        deviceRowBody += '<span class="is-required">*</span>';
        deviceRowBody += '<input required="required" type="text" maxlength="15" class="device-ItemCount form-control"   value="' + (device !== null ? device.ItemsCount : "") + '" />';
        deviceRowBody += '</div>';

        deviceRowBody += '<div class="form-group col-md-2">';

        deviceRowBody += '<label class="col-form-label">';
        deviceRowBody += "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceNumber %>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
        deviceRowBody += '</label>';
        deviceRowBody += '<input type="text" maxlength="15" class="device-deviceNumber form-control"   value="' + (device !== null ? device.DeviceNumber : "") + '" />';
        deviceRowBody += '</div>';


        deviceRowBody += '<div class="form-group col-md-2">';

        deviceRowBody += '<label class="col-form-label">';
        deviceRowBody += "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,CompanyName %>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
        deviceRowBody += '</label>';
        deviceRowBody += '<input type="text" maxlength="60" class="company-Name form-control" value="' + (device !== null ? device.ManufacturingCompanyName : "") + '" />';;
        deviceRowBody += '</div>';

        deviceRowBody += '<div class="form-group col-md-3">';

        deviceRowBody += '<label class="col-form-label">';
        deviceRowBody += "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceNotes %>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
        deviceRowBody += '</label>';
        deviceRowBody += '<textarea  maxlength="40" class="device-NotesAboutDevice form-control">';
        deviceRowBody += device !== null ? device.NotesAboutDevice : "";
        deviceRowBody += "</textarea>";
        deviceRowBody += '</div>';
        deviceRowBody += '</div>';



        // //End of form-row deviceRowData
        deviceRowBody += '</div>';

        if (index != 0) {
            deviceRowBody += '<div class=" delete-row delete-device">';
            deviceRowBody += '<button  class="request-deletedevice btn  hvr-shutter-out-horizontal" title="delete"> - </button>';
            deviceRowBody += '</div>';
        }

        deviceRowBody += '</div>';

        elem.innerHTML = deviceRowBody;
        return elem;
    };

    $('#sendModel').on('hidden.bs.modal', function () {
        window.location.href = "default.aspx";
    })

</script>
