<%@ Assembly Name="MaterialsRequestsWFWebparts, Version=1.0.0.0, Culture=neutral, PublicKeyToken=8f2240e9e9a12cbf" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditMaterialsRequestWPUserControl.ascx.cs" Inherits="MaterialsRequestsWFWebparts.EditMaterialsRequestWP.EditMaterialsRequestWPUserControl" %>

<asp:HiddenField ID="hdnAPIRootURL" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hdnWFWebUrl" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hdnRequestType" runat="server" ClientIDMode="Static" />

<input type="hidden" id="hdnRequestID" />
<input type="hidden" id="hdnMaterialID" />
<style>
    .hidden {
        display: none;
    }
</style>

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
        <div class="form-row">
            <div class="form-group col-md-12 hidden">
                <asp:Label ID="lblRequestId" runat="server" Text="" ClientIDMode="Static"></asp:Label>
            </div>
        </div>
        <div class="formLayout-title">
            <p>
                <asp:Literal runat="server"
                    Text="<%$Resources:MaterialsRequests,RequestMessage %>"></asp:Literal>
            </p>
            <p>
                <asp:Label ID="lblVisitorMessageValue" runat="server" Text="" ClientIDMode="Static"></asp:Label>
            </p>

        </div>
        <div class="formLayout-container bb-none empdata">
            <div class="formLayout-headTitles">
                <p>
                    <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,ApplicantNameData %>">
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
                            <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,Posit %>">
                            </asp:Literal>
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
                            <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,Section %>">
                            </asp:Literal>
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
                            <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,Department %>">
                            </asp:Literal>
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
                    <asp:Label runat="server" ID="lblMatrialInfoText" ClientIDMode="Static">
                    </asp:Label>

                </p>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group ">
                        <label class="col-form-label">
                            <asp:Label runat="server" ID="lblMatrialInfoText1" ClientIDMode="Static">
                            </asp:Label>
                        </label>
                        <span class="is-required">*</span>
                        <asp:TextBox ID="txtEntryDate" onblur="isInputRequired(this);" isMandatory MaxLength="15"
                            CssClass="form-control textPicker" runat="server" ClientIDMode="Static" autocomplete="off">
                        </asp:TextBox>
                        <label class="daytext"></label>

                    </div>
                </div>

                <div class=" col-md-3">
                    <div class="form-group ">
                        <label class="col-form-label">
                            <asp:Label runat="server" ID="lblMaterialEntryTime" ClientIDMode="Static">
                            </asp:Label>

                        </label>
                        <span class="is-required">*</span>
                        <asp:TextBox ID="txtEntryTime" MaxLength="60" isMandatory runat="server"
                            ClientIDMode="Static" autocomplete="off" CssClass="form-control matrial-time timepicker"
                            placeholder="00:00"></asp:TextBox>

                    </div>
                </div>

            </div>
        </div>
        <div class="formLayout-container">
            <div class="formLayout-headTitles">
                <p>
                    <SharePoint:EncodedLiteral runat='server' Text='<%$Resources:MaterialsRequests,SupervisorInfo%>' />
                </p>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group ">
                        <label class="col-form-label">
                            <span id="lblSupervisorName">
                                <SharePoint:EncodedLiteral runat='server'
                                    Text='<%$Resources:MaterialsRequests,SupervisorName%>' />
                            </span>
                        </label>
                        <span class="is-required">*</span>
                        <asp:TextBox ID="txtSupervisorName" MaxLength="60" required="required" runat="server"
                            ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group ">
                        <label class="col-form-label">
                            <span id="lblIdentityNum">
                                <SharePoint:EncodedLiteral runat='server'
                                    Text='<%$Resources:MaterialsRequests,SupervisorID%>' />
                            </span>
                        </label>
                        <span class="is-required">*</span>
                        <asp:TextBox ID="txtIdentityNum" MaxLength="60" required="required" runat="server"
                            ClientIDMode="Static" CssClass="form-control"
                            onkeypress="javascript:return isNumber(event)"></asp:TextBox>


                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group ">
                        <label class="col-form-label">
                            <span id="lblWork">
                                <SharePoint:EncodedLiteral runat='server'
                                    Text='<%$Resources:MaterialsRequests,WorkingPlace%>' />
                            </span>
                        </label>
                        <asp:TextBox ID="txtWork" MaxLength="60" runat="server"
                            ClientIDMode="Static" CssClass="form-control"></asp:TextBox>



                    </div>
                </div>

            </div>
        </div>
        <div class="formLayout-container">
            <div class="formLayout-headTitles">
                <p>
                    <SharePoint:EncodedLiteral runat='server'
                        Text='<%$Resources:MaterialsRequests,MatrialInfoTitle%>' />
                </p>
            </div>
            <p class="formLayout-title">
                <asp:Label runat="server" ID="MatrialMsg" ClientIDMode="Static">
                </asp:Label>

            </p>
            <div class="l-addvisitor add-visitor">
                <button id="AddVisitorBTN" class="btn btn-apply hvr-shutter-out-horizontal" tabindex="1">
                    <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,AddNewMaterial %>">
                    </asp:Literal>
                </button>
            </div>

            <div class="matrialcontainer">
            </div>


        </div>

    </div>
    <div class="container">
        <div class="form-row">

            <div class="form-group col-md-12">

                <button type="button" class="btn preview-btn" id="btnPreview">
                    <asp:Literal runat="server" ID="ltrPreview" Text="<%$Resources:VisitRequest,RequestPreview %>">
                    </asp:Literal>
                </button>

                <button type="button" class="btn preview-btn send-btn" id="btnSend">
                    <asp:Literal runat="server" ID="ltrSend" Text="تعديل الطلب"></asp:Literal>
                </button>

                <!-- <button id="btnReset">Reset form</button> -->

            </div>
        </div>
    </div>

</div>

<div class="modal fade" id="viewModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered formLayout-model" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <p class="modal-title" id="exampleModalLongTitle">

                    <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,ReviewMaterialEnterRequest %>">
                    </asp:Literal>
                </p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p class="request-msgtitle">
                    <asp:Literal runat="server"
                        Text="<%$Resources:MaterialsRequests,RequestMessage %>"></asp:Literal>
                </p>
                <p class="request-msg">
                    <span id="materialRequestMessageView"></span>

                </p>
                <div class="visitinfo">
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <i class=" mdi mdi-calendar "></i>
                            <label class="col-form-label">
                                <asp:Label ID="lblVisitStartDate2" runat="server"
                                    Text="<%$Resources:MaterialsRequests,MtiralEntryDate %>" ClientIDMode="Static">
                                </asp:Label>
                            </label>

                            <p id="EntryDatePreview" class="info-data"></p>
                        </div>
                        <div class="form-group col-md-4">
                            <i class=" mdi mdi-av-timer "></i>
                            <label class="col-form-label">
                                <asp:Label ID="lblEntryTimePreview" runat="server"
                                    Text="<%$Resources:MaterialsRequests,MtiralEntryDate %>" ClientIDMode="Static">
                                </asp:Label>
                            </label>

                            <p id="EntryTimePreview" class="info-data"></p>
                        </div>
                    </div>
                </div>
                <div class="heading-title">
                    <p>
                        <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,ApplicantNameData %>">
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
                                <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,Position %>">
                                </asp:Literal>
                            </label>
                            <p id="applicantTitlePreview" class="info-data"></p>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-form-label">
                                <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,Section %>">
                                </asp:Literal>
                            </label>
                            <p id="applicantSectionPreview" class="info-data"></p>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-form-label">
                                <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,Department %>">
                                </asp:Literal>

                            </label>
                            <p id="applicantDepartmentPreview" class="info-data"></p>
                        </div>
                    </div>
                </div>
                <div class="heading-title">
                    <p>
                        <SharePoint:EncodedLiteral runat='server'
                            Text='<%$Resources:MaterialsRequests,SupervisorInfo%>' />
                    </p>
                </div>
                <div class="emp-request">
                    <div class="form-row">

                        <div class="form-group col-md-4">
                            <label class="col-form-label">
                                <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,SupervisorName %>">
                                </asp:Literal>
                            </label>
                            <p id="superVisorNamePreview" class="info-data"></p>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-form-label">
                                <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,SupervisorID %>">
                                </asp:Literal>

                            </label>
                            <p id="superVisorIdentityPreview" class="info-data"></p>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-form-label">
                                <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,WorkingPlace %>">
                                </asp:Literal>
                            </label>
                            <p id="superVisorWorkPreview" class="info-data"></p>
                        </div>
                    </div>
                </div>
                <div class="heading-title">
                    <p>
                        <SharePoint:EncodedLiteral runat='server'
                            Text='<%$Resources:MaterialsRequests,MatrialInfoTitle%>' />
                    </p>
                </div>
                <div class="request-visitors-review">
                </div>


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
                    <asp:Label runat="server" ID="SendAddMaterialRequest" ClientIDMode="Static">
                    </asp:Label>
                </p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p id="MsgID">
                    <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,YourRequestSendSuccessfully %>">
                    </asp:Literal>
                </p>
            </div>

        </div>

    </div>

</div>
<script src="/modwf/style Library/branding/js/general/helpers.js"></script>
<script src="/modwf/style Library/branding/js/general/materialsShared.js"></script>

<script type="text/javascript">

    var matrialcontainer = $('.matrialcontainer');

    var apiRootAddress = $("#hdnAPIRootURL").val();
    var listSiteUrl = $("#hdnWFWebUrl").val()
    var requestType = $("#hdnRequestType").val();
    var currentUserId = _spPageContextInfo.userId;

    $(function () {
        setLabelsTranslations();

        var rid = getUrlParameter('rid');
        getRequestForEdit(rid, apiRootAddress, function (data) {
            if (data == null) {
                $(".formLayout .container").hide();
                $(".formLayout").append("<div class='container'><p style='text-align:center;padding: 100px'><sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,EditRequestNotAvaliable%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></p></div>")
                return;
            }
            request = data;
            $("#hdnRequestID").val(request.ID);
            $("#lblVisitorMessageValue").text(request.RequestMessage);
            $('.daytext').text(GetHijriDayName(request.RequestDate));
            $("#lblApplicantName").text(request.ApplicantName);
            $("#lblApplicantPosition").text(request.ApplicantRank);
            $("#lblApplicantSection").text(request.ApplicantSection);
            $("#lblApplicantDepartment").text(request.ApplicantAdministration);
            $("#txtEntryDate").val(getHijriDateForInput(request.RequestDate));
            $("#txtEntryTime").val(request.ActionTime);
            $("#txtSupervisorName").val(request.SupervisorName);
            $("#txtIdentityNum").val(request.IdentityNumber);
            $("#txtWork").val(request.WorkingPlace);

            request.RequestMaterials.forEach(function (item, index) {
                matrialcontainer.append(renderNewMaterial(item, index));
            });
            hideLoader();
        });
    });

    function setLabelsTranslations() {
        if ($("#hdnRequestType").val() == "0") {
            document.getElementById("lblMatrialInfoText").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,MtiralEntryDate	%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblMatrialInfoText1").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,MtiralEntryDate	%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblMaterialEntryTime").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,EntryTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblEntryTimePreview").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,EntryTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("MatrialMsg").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,MatrialMsg%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("SendAddMaterialRequest").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,SendAddMaterialRequest%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";

        } else {

            document.getElementById("lblMatrialInfoText").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,MtiralEntryDate	%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblMatrialInfoText1").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,MtiralEntryDate	%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("MatrialMsg").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,MatrialMsg%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblMaterialEntryTime").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,EntryTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblEntryTimePreview").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,EntryTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("SendAddMaterialRequest").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,SendAddMaterialRequest%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
        }
    }

    function getRequestForEdit(id, apiRootAddress, callback) {
        var visitReasonsDataAPI$ = apiRootAddress + "MaterialsRequest/GetMaterialsRequestDetailsForEdit?ListSiteUrl=" + listSiteUrl + "&CurrentUserId=" + currentUserId + "&RequestID=" + id;
        getDataByAPI(
            visitReasonsDataAPI$,
            function (data) {
                callback(data);
            }
        );
    }

    function renderNewMaterial(material, index) {
        var elem = document.createElement("div");
        elem.classList.add("visitorRow");

        var visitorRowBody = '';
        visitorRowBody += '<div class=" MatrialRowData">';
        visitorRowBody += '<div class="row">';
        visitorRowBody += '<div class="form-group col-md-1 hidden">';
        visitorRowBody += '<input type="text" class="material-Id form-control" value="' + (material !== null ? material.ID : "") + '" />';
        visitorRowBody += '</div>';
        visitorRowBody += '<div class=" col-md-4">';
        visitorRowBody += '<div class="form-group ">';
        visitorRowBody += "<label class='col-form-label'><sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Type%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></label>";
        visitorRowBody += '<span class="is-required">*</span>';
        visitorRowBody += '<input type="text" required="required" maxlength="60" value="' + (material !== null ? material.MaterialName : "") + '"  class="matrial-type form-control" />';
        visitorRowBody += '</div >';
        visitorRowBody += '</div >';

        visitorRowBody += '<div class=" col-md-3">';
        visitorRowBody += '<div class="form-group ">';
        visitorRowBody += "<label class='col-form-label'><sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Number%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></label>";
        visitorRowBody += '<span class="is-required">*</span>';
        visitorRowBody += '<input type="text" required="required" maxlength="60" value="' + (material !== null ? material.Quantity : "") + '" class="matrial-number form-control" onkeypress="javascript:return isNumber(event)" />';
        visitorRowBody += '</div >';
        visitorRowBody += '</div >';

        visitorRowBody += '<div class=" col-md-5">';
        visitorRowBody += '<div class="form-group ">';
        visitorRowBody += "<label class='col-form-label'><sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,MatrialNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></label>";
        visitorRowBody += '<textarea type="text"  maxlength="60" class="matrial-notes form-control">' + (material !== null ? material.Notes : "") + '</textarea>';
        visitorRowBody += '</div >';
        visitorRowBody += '</div >';

        visitorRowBody += '</div >';

        if (index != 0) {
            visitorRowBody += '<div class=" delete-row delete-visitor">';
            visitorRowBody += '<button  class="request-deleteMatrial btn  hvr-shutter-out-horizontal" title="delete"> - </button>';
            visitorRowBody += '</div>';
        }

        visitorRowBody += '</div >';

        elem.innerHTML = visitorRowBody;
        return elem;
    }

    function postRequest(requestData) {
        showLoader();
        var url = apiRootAddress + "MaterialsRequest/UpdateMaterialsRequest?ListSiteUrl=" + listSiteUrl;
        $.ajax({
            url: url,
            type: 'POST',
            contentType: 'application/json',
            data: requestData,
            success: function (result) {
                if (result.statusCode == 1) {
                    showSendMsg("<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,EditRequestDoneSuccessfully%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
                    $("#btnSend").attr("disabled", true);
                    hideLoader();
                }
                else {
                    hideLoader();
                    showSendMsg(result.statusMessage);
                    $("#btnSend").attr("disabled", true);
                }
            },
            error: function (err) {
                hideLoader();
                alert(err.statusText);
            },

            complete: function () {

            }
        });
    }

    $("#btnPreview").click(function (event) {
        event.preventDefault();
        $('#materialRequestMessageView').text($("#lblVisitorMessageValue").text());
        $('#EntryDatePreview').text($("#txtEntryDate").val());
        $('#EntryTimePreview').text($("#txtEntryTime").val());
        $('#applicantNamePreview').text($("#lblApplicantName").text());
        $('#applicantTitlePreview').text($("#lblApplicantPosition").text());
        $('#applicantSectionPreview').text($("#lblApplicantSection").text());
        $('#applicantDepartmentPreview').text($("#lblApplicantDepartment").text());
        $('#superVisorNamePreview').text($("#txtSupervisorName").val());
        $('#superVisorIdentityPreview').text($("#txtIdentityNum").val());
        $('#superVisorWorkPreview').text($("#txtWork").val());
        var visitorsCount = $(".visitorRow").length;
        $(".request-visitors-review").empty();
        for (var i = 0; i < visitorsCount; i++) {
            var elem = document.createElement("div");
            elem.classList.add("form-row", "reviewCol");
            var visitorRowBody = '';
            visitorRowBody += '<div class="form-group info-data  col-md-8 ">';
            visitorRowBody += $(".visitorRow:eq(" + i + ") .matrial-type").val();
            visitorRowBody += '</div>';

            <%--visitorRowBody += '<div class="form-group info-data  dateTime col-md-5 ">';
            visitorRowBody += "<p class='dateTime-label'> <i class=' mdi mdi-av-timer '></i> <sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,EntryTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>    : ";
            visitorRowBody += '<span class="time">';
            visitorRowBody += $(".visitorRow:eq(" + i + ") .matrial-time").val();
            visitorRowBody += '</span>';
            visitorRowBody += '</p></div>';--%>


            visitorRowBody += '<div class="form-group  col-md-6 ">';
            visitorRowBody += "<label class='col-form-label'><sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Number%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></label>";
            visitorRowBody += '<p class="info-data">';
            visitorRowBody += $(".visitorRow:eq(" + i + ") .matrial-number").val();
            visitorRowBody += '</p>';
            visitorRowBody += '</div>';

            var materialNotes = $(".visitorRow:eq(" + i + ") .matrial-notes").val();
            if (materialNotes != "") {
                visitorRowBody += '<div class="form-group  col-md-6 ">';
                visitorRowBody += "<label class='col-form-label'><sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,MatrialNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></label>";
                visitorRowBody += '<p class="info-data">';

                visitorRowBody += $(".visitorRow:eq(" + i + ") .matrial-notes").val();
                visitorRowBody += '</p>';
                visitorRowBody += '</div>';
            }
            elem.innerHTML = visitorRowBody;


            $(".request-visitors-review").append(elem);

        }
        $('#viewModel').modal({ backdrop: 'static', keyboard: false });
    });


    $("#btnSend").on("click", function (event) {
        event.preventDefault();
        sendRequest();
    });

    function sendRequest() {
        if (!isFormValid()) {
            return;
        }

        if (!validateVisitDates($("#txtEntryDate"))) {
            $("#txtEntryDate").focus();
            return;
        }

        var startDateConverted = HijriJS.toGregorian($("#txtEntryDate").val());
        startDateConverted.setMonth(startDateConverted.getMonth());

        var requestObject =
        {
            ID: $("#hdnRequestID").val(),
            RequestType: $("#hdnRequestType").val(),
            RequestMessage: $("#lblVisitorMessageValue").text(),
            RequestDate: startDateConverted,
            ActionTime: $("#txtEntryTime").val(),
            SupervisorName: $("#txtSupervisorName").val(),
            IdentityNumber: $("#txtIdentityNum").val(),
            WorkingPlace: $("#txtWork").val(),
            ApplicantSection: $("#lblApplicantSection").text(),
            ApplicantRank: $("#lblApplicantPosition").text(),
            ApplicantAdministration: $("#lblApplicantDepartment").text(),
            ApplicantName: $("#lblApplicantName").text(),
            ISDeleted: false,
            RequestMaterials: []
        };

        showLoader();
        $("#btnSend").attr("disabled", true);

        var MatriaslsCount = $(".visitorRow").length;
        requestObject.RequestMaterials = [];
        for (var i = 0; i < MatriaslsCount; i++) {
            material = {};
            material.ID = $(".visitorRow:eq(" + i + ") .material-Id").val();
            material.MaterialName = $(".visitorRow:eq(" + i + ") .matrial-type").val();
            material.Quantity = $(".visitorRow:eq(" + i + ") .matrial-number").val();
            material.ActionTime = $(".visitorRow:eq(" + i + ") .matrial-time").val();
            material.Notes = $(".visitorRow:eq(" + i + ") .matrial-notes").val();
            if (material.ID == "") {
                // New
                material.State = "1";
            } else {
                // Update
                material.State = "2";
            }
            requestObject.RequestMaterials.push(material);


        }

        // Add the deleted objects to returned object to be deleted
        request.RequestMaterials.forEach(function (material) {

            var isMaterialRecordStillExist = false;
            requestObject.RequestMaterials.forEach(function (materialObject) {
                if (materialObject.ID == material.ID) {
                    isMaterialRecordStillExist = true;
                }
            });


            if (!isMaterialRecordStillExist) {
                //To be deleted
                material.State = "3";
                requestObject.RequestMaterials.push(material);
            }

        });

        postRequest(JSON.stringify(requestObject));
    }
    $('#sendModel').on('hidden.bs.modal', function () {
        window.location.href = "default.aspx";
    })
    $("#AddVisitorBTN").on("click", function (event) {
        event.preventDefault();
        matrialcontainer.append(renderNewMaterial(null));
    });

    $('.matrialcontainer').on("click", function (event) {
        if (
            event.target &&
            event.target.nodeName === "BUTTON" &&
            event.target.classList.contains("request-deleteMatrial")
        ) {
            event.preventDefault();
            $(event.target.parentElement.parentElement.parentElement).remove();
        }
    });

    $(document).on("click", ".ui-corner-all", function (e) {
        $(".matrial-time").next("span").remove();
        if ($(".matrial-time").val().trim() !== '') {
            $(".matrial-time").next("span").remove();
        }
    });
</script>
