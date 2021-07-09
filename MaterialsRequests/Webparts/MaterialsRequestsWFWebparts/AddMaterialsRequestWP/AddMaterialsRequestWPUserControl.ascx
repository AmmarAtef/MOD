<%@ Assembly Name="MaterialsRequestsWFWebparts, Version=1.0.0.0, Culture=neutral, PublicKeyToken=8f2240e9e9a12cbf" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddMaterialsRequestWPUserControl.ascx.cs" Inherits="MaterialsRequestsWFWebparts.AddMaterialsRequestWP.AddMaterialsRequestWPUserControl" %>

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
                        Text="<%$Resources:MaterialsRequests,RequestMessage %>"></asp:Literal>
                </p>
                <p>
                    <asp:Label ID="lblDeviceMessageValue" runat="server" Text="<%$Resources:MaterialsRequests,lblDeviceMessageValue %>"
                        ClientIDMode="Static"></asp:Label>
                    <%--<asp:Label ID="lblVisitorMessageValue" runat="server" Text="" ClientIDMode="Static"></asp:Label>--%>
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
                                <asp:HiddenField ID="hdnSectionCode" runat="server" ClientIDMode="Static" />
                                <asp:Label ID="lblUserSectionName" runat="server" Text="" ClientIDMode="Static">
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
                        <asp:Label runat="server" ID="lblMatrialInfoText" ClientIDMode="Static"></asp:Label>
                    </p>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group ">
                            <label class="col-form-label">
                                <asp:Label runat="server" ID="MtiralEntryDate" ClientIDMode="Static">
                                </asp:Label>
                            </label>
                            <span class="is-required">*</span>
                            <asp:TextBox ID="txtVisitStartDate" isMandatory MaxLength="15"
                                CssClass="form-control textPicker" runat="server" ClientIDMode="Static"
                                autocomplete="off"></asp:TextBox>
                            <label class="daytext"></label>

                        </div>
                    </div>

                    <div class=" col-md-3">
                        <div class="form-group ">
                            <label class="col-form-label">
                                <asp:Label runat="server" ID="materialFormEntryTime" ClientIDMode="Static">
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
                        <SharePoint:EncodedLiteral runat='server'
                            Text='<%$Resources:MaterialsRequests,SupervisorInfo%>' />
                    </p>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group ">
                            <label class="col-form-label">
                                <span id="lblSupervisorName">
                                    <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,SupervisorName %>">
                                    </asp:Literal>
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
                                    <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,SupervisorID %>">
                                    </asp:Literal>
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
                                    <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,WorkingPlace %>">
                                    </asp:Literal>
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
                <div class="request-matrial">

                    <div class="visitorRow">
                        <div class="MatrialRowData">
                            <div class="row">
                                <div class=" col-md-4">
                                    <div class="form-group ">
                                        <label class="col-form-label">
                                            <span id="lblTypeName">
                                                <SharePoint:EncodedLiteral runat='server'
                                                    Text='<%$Resources:MaterialsRequests,Type%>' /></span>
                                        </label>
                                        <span class="is-required">*</span>
                                        <asp:TextBox ID="txtTypeName" MaxLength="60" required="required" runat="server"
                                            ClientIDMode="Static" CssClass="form-control matrial-type"></asp:TextBox>
                                    </div>
                                </div>
                                <div class=" col-md-3">
                                    <div class="form-group ">
                                        <label class="col-form-label">
                                            <span id="lblNumber">
                                                <SharePoint:EncodedLiteral runat='server'
                                                    Text='<%$Resources:MaterialsRequests,Number%>' /></span>
                                        </label>
                                        <span class="is-required">*</span>
                                        <asp:TextBox ID="txtNumber" MaxLength="60" required="required" runat="server"
                                            ClientIDMode="Static" CssClass="matrial-number form-control"
                                            onkeypress="javascript:return isNumber(event)"></asp:TextBox>
                                    </div>
                                </div>


                                <div class=" col-md-5">
                                    <div class="form-group ">
                                        <label class="col-form-label">
                                            <span id="lblNotes">
                                                <SharePoint:EncodedLiteral runat='server'
                                                    Text='<%$Resources:MaterialsRequests,MatrialNotes%>' /></span>
                                        </label>
                                        <textarea id="txtNotes" maxlength="40"
                                            class="device-NotesAboutDevice form-control matrial-notes"></textarea>
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
                                Text="<%$Resources:VisitRequest,RequestPreview %>"></asp:Literal>
                        </button>

                        <button type="button" class="btn preview-btn send-btn" id="btnSend">
                            <asp:Literal runat="server" ID="ltrSend" Text="<%$Resources:VisitRequest,RequestSend %>">
                            </asp:Literal>
                        </button>

                        <!-- <button id="btnReset">Reset form</button> -->

                    </div>
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
                        <asp:Label runat="server" ID="materialPreviewTitle"
                            Text="" ClientIDMode="Static"></asp:Label>

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
                                <i class="mdi mdi-av-timer"></i>
                                <label class="col-form-label">
                                    <asp:Label ID="lblEntryTimePreview" runat="server"
                                        Text="<%$Resources:MaterialsRequests,EntryTime %>" ClientIDMode="Static">
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
                                    <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,WorkingPlace %>"></asp:Literal>

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
                    <p class="modal-title" id="MaterialInfoMessageTitle">
                        <asp:Label runat="server" ID="SendAddMaterialRequest" ClientIDMode="Static">
                            <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,SendEnterRequest %>">
                            </asp:Literal>
                        </asp:Label>
                    </p>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p id="MsgID">

                        <asp:Literal runat="server"
                            Text="<%$Resources:MaterialsRequests,YourRequestSendSuccessfully %>"></asp:Literal>
                    </p>
                </div>

            </div>

        </div>

    </div>

    <script src="/modwf/style Library/branding/js/general/helpers.js"></script>
    <script type="text/javascript">

        var apiRootAddress = $("#hdnAPIRootURL").val();
        var listSiteUrl = $("#hdnWFWebUrl").val()
        var requestType = $("#hdnRequestType").val();

        $(function () {
            setLabelsTranslations();

            var messageKey = '';
            if ($("#hdnRequestType").val() == '0') {
                messageKey = 'materialsentryrequest';
            }
            else {
                messageKey = 'materialsexitrequest';
            }

            getWFMessage(messageKey, function (data) {
                $("#lblDeviceMessageValue").text(data);
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
            // In/ Out Text
            if ($("#hdnRequestType").val() == "0") {
                document.getElementById("lblMatrialInfoText").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,MtiralEntryDate	%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                document.getElementById("lblVisitStartDate2").innerHTML = document.getElementById("MtiralEntryDate").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,MtiralEntryDate	%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                document.getElementById("materialFormEntryTime").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,EntryTime	%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                document.getElementById("lblEntryTimePreview").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,EntryTime	%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                document.getElementById("MatrialMsg").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,MatrialMsg	%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                document.getElementById("materialPreviewTitle").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,RequestReview	%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                document.getElementById("SendAddMaterialRequest").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,SendAddMaterialRequest%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            } else {
                document.getElementById("lblMatrialInfoText").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,MtiralEntryDate	%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                document.getElementById("lblVisitStartDate2").innerHTML = document.getElementById("MtiralEntryDate").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,MtiralEntryDate	%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                document.getElementById("materialFormEntryTime").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,EntryTime	%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                document.getElementById("lblEntryTimePreview").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,EntryTime	%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                document.getElementById("MatrialMsg").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,MatrialMsg	%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                document.getElementById("materialPreviewTitle").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,RequestReview	%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                document.getElementById("SendAddMaterialRequest").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,SendAddMaterialRequest%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            }
        }

        $("#btnPreview").click(function (event) {
            event.preventDefault();
            if (!isFormValid()) {
                return;
            }
            $("#materialRequestMessageView").text($("#lblDeviceMessageValue").text());
            $('#EntryDatePreview').text($("#txtVisitStartDate").val());
            $('#EntryTimePreview').text($("#txtEntryTime").val());
            $('#applicantNamePreview').text($("#lblApplicantName").text());
            $('#applicantTitlePreview').text($("#lblApplicantPosition").text());
            $('#applicantSectionPreview').text($("#lblUserSectionName").text());
            $('#applicantDepartmentPreview').text($("#lblUserDepartmentName").text());
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

                <%--visitorRowBody += '<div class="form-group info-data  dateTime col-md-4 ">';

                var actionTimeText = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,EntryTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                if ($("#hdnRequestType").val() == "1") {
                    actionTimeText = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,EntryTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                }

                visitorRowBody += '<p class="dateTime-label"> <i class=" mdi mdi-av-timer "></i> ' + actionTimeText + ' : ';
                visitorRowBody += '<span class="time">';
                visitorRowBody += $(".visitorRow:eq(" + i + ") .matrial-time").val();
                visitorRowBody += '</span>';
                visitorRowBody += '</p></div>';--%>


                visitorRowBody += '<div class="form-group  col-md-6 ">';
                visitorRowBody += "<label class='col-form-label'><sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Number%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </label>";
                visitorRowBody += '<p class="info-data">';
                visitorRowBody += $(".visitorRow:eq(" + i + ") .matrial-number").val();
                visitorRowBody += '</p>';
                visitorRowBody += '</div>';

                var materialNotes = $(".visitorRow:eq(" + i + ") .matrial-notes").val();

                if (materialNotes != "") {
                    visitorRowBody += '<div class="form-group  col-md-6 ">';
                    visitorRowBody += "<label class='col-form-label'><sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,MatrialNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </label>";
                    visitorRowBody += '<p class="info-data">';

                    visitorRowBody += materialNotes;
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

            if (!validateVisitDates($("#txtVisitStartDate"))) {
                $("#txtVisitStartDate").focus();
                return;
            }

            var startDateConverted = HijriJS.toGregorian($("#txtVisitStartDate").val());
            startDateConverted.setMonth(startDateConverted.getMonth());
            var requestObject =
            {
                RequestType: requestType,
                RequestMessage: $("#lblDeviceMessageValue").text(),
                RequestDate: startDateConverted,
                ActionTime: $("#txtEntryTime").val(),
                SupervisorName: $("#txtSupervisorName").val(),
                IdentityNumber: $("#txtIdentityNum").val(),
                WorkingPlace: $("#txtWork").val(),
                ApplicantSection: $("#hdnSectionCode").val(),
                ApplicantRank: $("#lblApplicantPosition").text(),
                ApplicantAdministration: $("#hdnDepartmentCode").val(),
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
                material.MaterialName = $(".visitorRow:eq(" + i + ") .matrial-type").val();
                material.Quantity = $(".visitorRow:eq(" + i + ") .matrial-number").val();
                material.Notes = $(".visitorRow:eq(" + i + ") .matrial-notes").val();
                requestObject.RequestMaterials.push(material);
            }
            postRequest(JSON.stringify(requestObject));

        }
        function postRequest(requestData) {
            var url = apiRootAddress + "MaterialsRequest/AddMaterialsRequest?ListSiteUrl=" + listSiteUrl;
            $.ajax({
                url: url,
                type: 'POST',
                contentType: 'application/json',
                data: requestData,
                success: function (result) {
                    if (result.statusCode == 1) {
                        showSendMsg("<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,YourRequestSendSuccessfully%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> ");
                        hideLoader();
                        $("#btnSend").attr("disabled", true);
                        window.location.href = "default.aspx";
                    }
                    else {
                        hideLoader();
                        showSendMsg("<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,SomeThingError%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
                        $("#btnSend").attr("disabled", true);
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

        $(document).on("blur", "#txtVisitStartDate", function () {
            validateVisitDates($(this));
        });

        $(document).on("change", "#txtVisitStartDate", function (e) {
            validateVisitDates($(this));
        });

        $("#AddVisitorBTN").on("click", function (event) {
            event.preventDefault();
            matrialsContainer.append(RenderNewMatrial());
        });

        var RenderNewMatrial = function () {
            var elem = document.createElement("div");
            elem.classList.add("visitorRow");
            var visitorRowBody = '';
            visitorRowBody += '<div class=" MatrialRowData">';
            visitorRowBody += '<div class="row">';
            visitorRowBody += '<div class=" col-md-4">';
            visitorRowBody += '<div class="form-group ">';
            visitorRowBody += "<label class='col-form-label'><sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Type%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></label>";
            visitorRowBody += '<span class="is-required">*</span>';
            visitorRowBody += '<input type="text" required="required" maxlength="60" class="matrial-type form-control" />';
            visitorRowBody += '</div >';
            visitorRowBody += '</div >';

            visitorRowBody += '<div class=" col-md-3">';
            visitorRowBody += '<div class="form-group ">';
            visitorRowBody += "<label class='col-form-label'><sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Number%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></label>";
            visitorRowBody += '<span class="is-required">*</span>';
            visitorRowBody += '<input type="text" required="required" maxlength="60" class="matrial-number form-control" onkeypress="javascript:return isNumber(event)" />';
            visitorRowBody += '</div >';
            visitorRowBody += '</div >';

            visitorRowBody += '<div class=" col-md-4">';
            visitorRowBody += '<div class="form-group ">';
            visitorRowBody += "<label class='col-form-label'><sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,MatrialNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></label>";
            visitorRowBody += '<textarea type="text" maxlength="60" class="matrial-notes form-control" ></textarea>';
            visitorRowBody += '</div >';
            visitorRowBody += '</div >';

            visitorRowBody += '</div >';
            visitorRowBody += '<div class=" delete-row delete-visitor">';
            visitorRowBody += '<button  class="request-deleteMatrial btn  hvr-shutter-out-horizontal" title="delete"> - </button>';
            visitorRowBody += '</div>';
            visitorRowBody += '</div >';
            elem.innerHTML = visitorRowBody;
            return elem;

        }
        var matrialsContainer = $('.request-matrial');

        $('.request-matrial').on("click", function (event) {
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
