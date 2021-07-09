<%@ Assembly Name="VisitRequest, Version=1.0.0.0, Culture=neutral, PublicKeyToken=7d812edf42fd645f" %>
<%@ Assembly Name="VisitRequest, Version=1.0.0.0, Culture=neutral, PublicKeyToken=7d812edf42fd645f" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VisitRequestsWPUserControl.ascx.cs" Inherits="VisitRequest.VisitRequestsWP.VisitRequestsWPUserControl" %>

<asp:HiddenField ID="hdnAPIRootURL" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hdnWFWebUrl" runat="server" ClientIDMode="Static" />

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
                    <asp:Label ID="lblVisitorMessageText" runat="server"
                        Text="<%$Resources:VisitRequest,VisitMessage %>" ClientIDMode="Static"></asp:Label>
                </p>
                <p>
                    <asp:Label ID="lblVisitorMessageValue" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                </p>
            </div>
            <div class="formLayout-container bb-none empdata">
                <div class="formLayout-headTitles">
                    <p>
                        <asp:Literal runat="server" ID="ltrRequestApplicantData"
                            Text="<%$Resources:VisitRequest,RequestApplicantData %>"></asp:Literal>
                    </p>
                </div>

                <p class="formLayout-empInfo">
                    <span>
                        <asp:Label ID="lblRequestUserNameValue" runat="server" Text="" ClientIDMode="Static">
                        </asp:Label>
                    </span>
                </p>
                <div class="row">
                    <div class="col-md-4 col-lg-3">
                        <p class="formLayout-empInfo">
                            <span class="empinfo">
                                <asp:Label ID="lblUserPositionText" runat="server"
                                    Text="<%$Resources:VisitRequest,VisitUserPosition %>" ClientIDMode="Static">
                                </asp:Label>

                            </span>
                            <span>:</span>
                            <span>
                                <asp:Label ID="lblUserPositionValue" runat="server" Text="" ClientIDMode="Static">
                                </asp:Label>
                            </span>
                        </p>
                    </div>
                    <div class="col-md-4 col-lg-3">
                        <p class="formLayout-empInfo">
                            <span class="empinfo">
                                <asp:Label ID="lblUserSectionText" runat="server"
                                    Text="<%$Resources:VisitRequest,VisitUserSection %>" ClientIDMode="Static">
                                </asp:Label>

                            </span>
                            <span>:</span>
                            <span>
                                <asp:HiddenField ID="hdnSectionCode" runat="server" ClientIDMode="Static" />
                                <asp:Label ID="lblUserSectionName" runat="server" Text="" ClientIDMode="Static">
                                </asp:Label>
                            </span>
                        </p>
                    </div>
                    <div class="col-md-4 col-lg-3">
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
                        <asp:Literal runat="server" ID="ltrVisitDate" Text="<%$Resources:VisitRequest,VisitDate %>">
                        </asp:Literal>
                    </p>

                </div>


                <form>

                    <div class="row">
                        <div class="col-md-4 col-lg-3">
                            <div class="form-group ">
                                <label class="col-form-label">
                                    <asp:Label ID="lblVisitStartDate" runat="server"
                                        Text="<%$Resources:VisitRequest,VisitStartDate %>" ClientIDMode="Static">
                                    </asp:Label>
                                    <span class="is-required">*</span>
                                </label>
                                <asp:TextBox ID="txtVisitStartDate" isMandatory MaxLength="15"
                                    CssClass="form-control textPicker" runat="server" ClientIDMode="Static"
                                    autocomplete="off"></asp:TextBox>
                                <label class="daytext"></label>
                            </div>
                        </div>

                        <div class="col-md-4 col-lg-3">
                            <div class="form-group ">
                                <label class="col-form-label">
                                    <asp:Label ID="lblVisitEndDate" runat="server"
                                        Text="<%$Resources:VisitRequest,VisitEndDate %>" ClientIDMode="Static">
                                    </asp:Label>
                                    <span class="is-required">*</span>
                                </label>
                                <asp:TextBox ID="txtVisitEndDate" isMandatory MaxLength="15"
                                    CssClass="form-control textPicker" runat="server" ClientIDMode="Static"
                                    autocomplete="off"></asp:TextBox>
                                <label class="daytext"></label>
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
                                <asp:TextBox ID="txtVisitorVisitTime" autocomplete="off" isMandatory MaxLength="15"
                                    CssClass="form-control time timepicker" runat="server" ClientIDMode="Static" placeholder="00:00"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4 col-lg-3">
                            <div class="form-group ">
                                <label class="col-form-label">
                                    <asp:Label ID="lblVisitReason" runat="server"
                                        Text="<%$Resources:VisitRequest,VisitReason %>" ClientIDMode="Static">
                                    </asp:Label>
                                    <span class="is-required">*</span>
                                </label>
                                <asp:DropDownList ID="ddlVisitReason" required="required" runat="server"
                                    CssClass="form-control " ClientIDMode="Static">
                                </asp:DropDownList>
                            </div>

                        </div>
                    </div>
                </form>


            </div>



            <div class="formLayout-container">
                <div class="formLayout-headTitles">
                    <p>
                        <asp:Literal runat="server" ID="ltrVisitorsData"
                            Text="<%$Resources:VisitRequest,VisitorsData %>"></asp:Literal>
                    </p>

                </div>

                <p class="formLayout-title">
                    <asp:Label ID="lblVisitorsList" runat="server" Text="<%$Resources:VisitRequest,Visitors %>"
                        ClientIDMode="Static"></asp:Label>
                </p>
                <div class="l-addvisitor add-visitor">
                    <button id="AddVisitorBTN" class="btn btn-apply hvr-shutter-out-horizontal" tabindex="1">
                        <asp:Literal runat="server" ID="ltrAddVisitor" Text="<%$Resources:VisitRequest,AddVisitor %>">
                        </asp:Literal>
                    </button>
                </div>
                <div class="request-visitors">
                    <div class=" visitorRow">

                        <div class=" visitorRowData">
                            <div class="row">

                                <div class=" col-md-3">
                                    <div class="form-group ">
                                        <label class="col-form-label">
                                            <asp:Label ID="lblFirstName" runat="server"
                                                Text="<%$Resources:VisitRequest,FirstName %>" ClientIDMode="Static">
                                            </asp:Label>
                                            <span class="is-required">*</span>
                                        </label>
                                        <asp:TextBox ID="txtFirstName" MaxLength="15" required="required" runat="server"
                                            ClientIDMode="Static" CssClass="visitor-FirstName form-control">
                                        </asp:TextBox>
                                    </div>
                                </div>
                                <div class=" col-md-3">
                                    <div class="form-group ">
                                        <label class="col-form-label">
                                            <asp:Label ID="lblFatherName" runat="server"
                                                Text="<%$Resources:VisitRequest,FatherName %>" ClientIDMode="Static">
                                            </asp:Label>
                                        </label>
                                        <asp:TextBox ID="txtFatherName" MaxLength="15"
                                            runat="server" ClientIDMode="Static"
                                            CssClass="visitor-FatherName form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class=" col-md-3">
                                    <div class="form-group ">
                                        <label class="col-form-label">
                                            <asp:Label ID="lblFamilyName" runat="server"
                                                Text="<%$Resources:VisitRequest,FamilyName %>" ClientIDMode="Static">
                                            </asp:Label>
                                        </label>
                                        <asp:TextBox ID="txtFamilyName" MaxLength="15"
                                            runat="server" ClientIDMode="Static"
                                            CssClass="visitor-FamilyName form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class=" col-md-3">
                                    <div class="form-group ">
                                        <label class="col-form-label">
                                            <asp:Label ID="lblLastName" runat="server"
                                                Text="<%$Resources:VisitRequest,LastName %>" ClientIDMode="Static">
                                            </asp:Label>
                                            <span class="is-required">*</span>
                                        </label>
                                        <asp:TextBox ID="txtLastName" MaxLength="15" required="required" runat="server"
                                            ClientIDMode="Static" CssClass="visitor-LastName form-control">
                                        </asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group ">
                                        <label class="col-form-label">
                                            <asp:Label ID="lblVisitorNationality" runat="server"
                                                Text="<%$Resources:VisitRequest,Nationality %>" ClientIDMode="Static">
                                            </asp:Label>
                                            <span class="is-required">*</span>
                                        </label>
                                        <asp:DropDownList ID="ddlVisitorNationalities" required="required"
                                            runat="server" ClientIDMode="Static"
                                            CssClass="visitor-Nationality form-control">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class=" col-md-3">
                                    <div class="form-group ">
                                        <label class="col-form-label">
                                            <asp:Label ID="lblVisitorIdentityType" runat="server"
                                                Text="<%$Resources:VisitRequest,IdentityType %>" ClientIDMode="Static">
                                            </asp:Label>
                                            <span class="is-required">*</span>
                                        </label>
                                        <asp:DropDownList ID="ddlVisitorIdentityTypes" required="required"
                                            runat="server" ClientIDMode="Static"
                                            CssClass="visitor-IdentityType form-control">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group ">
                                        <label class="col-form-label">

                                            <asp:Label ID="lblVisitorIdentityNumber" runat="server"
                                                Text="<%$Resources:VisitRequest,IdentityNumber %>"
                                                ClientIDMode="Static"></asp:Label>
                                            <span class="is-required">*</span>
                                        </label>
                                        <asp:TextBox ID="txtVisitorIdentityNumber" required="required" MaxLength="15"
                                            runat="server" ClientIDMode="Static"
                                            CssClass="visitor-IdentityNumber form-control"
                                            onkeypress="javascript:return isNumber(event)"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group ">
                                        <label class="col-form-label">
                                            <asp:Label ID="lblVisitorWorkingPlace" runat="server"
                                                Text="<%$Resources:VisitRequest,WorkingPlace %>" ClientIDMode="Static">
                                            </asp:Label>
                                        </label>
                                        <asp:TextBox ID="txtVisitorWorkingPlace" MaxLength="25"
                                            runat="server" ClientIDMode="Static"
                                            CssClass="visitor-WorkingPlace form-control"></asp:TextBox>
                                    </div>
                                </div>


                            </div>
                        </div>

                        <div class="visitor-row-devices">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="addDevice">

                                        <button class="AddDeviceBTN btn btn-apply hvr-shutter-out-horizontal"
                                            tabindex="1">
                                            <asp:Literal runat="server"
                                                Text="<%$Resources:VisitRequest,AttachedDevices %>">
                                            </asp:Literal>
                                        </button>


                                    </div>
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
                        <asp:Literal runat="server" ID="ltrPreview" Text="<%$Resources:VisitRequest,RequestPreview %>">
                        </asp:Literal>
                    </button>

                    <button type="button" class="btn preview-btn send-btn" id="btnSend">
                        <asp:Literal runat="server" ID="ltrSend" Text="<%$Resources:VisitRequest,RequestSend %>">
                        </asp:Literal>
                    </button>
                </div>
            </div>
        </div>

    </div>
    <!-- Modal -->

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered formLayout-model" role="document">
            <div class="modal-content">
                <div class="modal-header">

                    <p class="modal-title" id="exampleModalLongTitle2">
                        <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitRequest %>"></asp:Literal>
                    </p>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p class="request-msgtitle">
                        <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequestMsg %>"></asp:Literal>
                    </p>
                    <p class="request-msg">
                        <span id="visitMessageTitle"></span>

                    </p>


                    <div class="visitinfo">
                        <div class="form-row">
                            <div class="form-group col-md-3">
                                <i class=" mdi mdi-calendar "></i>
                                <label class="col-form-label">
                                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitStartDate %>">
                                    </asp:Literal>
                                </label>
                                <p id="visitStartDatePreview" class="info-data"></p>
                            </div>
                            
                            <div class="form-group col-md-3">
                                <i class=" mdi mdi-calendar "></i>
                                <label class="col-form-label">
                                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitEndDate %>">
                                    </asp:Literal>
                                </label>
                                <p id="visitEndDatePreview" class="info-data"></p>
                            </div>

                            <div class="form-group col-md-3">
                                <i class=" mdi mdi-av-timer "></i>
                                <label class="col-form-label">
                                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitTime %>">
                                    </asp:Literal>
                                </label>
                                <p id="visitTimePreview" class="info-data"></p>
                            </div>

                            <div class="form-group col-md-3">
                                <i class=" mdi mdi-bullseye-arrow "></i>
                                <label class="col-form-label">
                                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitReason %>">
                                    </asp:Literal>
                                </label>
                                <p id="visitReasonPreview" class="info-data"></p>
                            </div>
                        </div>
                    </div>
                    <div class="heading-title">
                        <p>
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequestApplicantData %>">
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
                                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitUserPosition %>">
                                    </asp:Literal>

                                </label>
                                <p id="applicantTitlePreview" class="info-data"></p>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="col-form-label">
                                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitUserSection %>">
                                    </asp:Literal>
                                </label>
                                <p id="applicantSectionPreview" class="info-data"></p>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="col-form-label">
                                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitUserDepartment %>">
                                    </asp:Literal>
                                </label>
                                <p id="applicantDepartmentPreview" class="info-data"></p>
                            </div>
                        </div>
                    </div>

                    <div class="heading-title">
                        <p>
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitorsDataa %>"></asp:Literal>
                        </p>
                    </div>



                    <div class="request-visitors-review">
                        <div class="form-group col-6 col-md-3">

                            <asp:Label ID="Label1" runat="server" class="info-data"
                                Text="<%$Resources:VisitRequest,PersonName %>" ClientIDMode="Static"></asp:Label>

                        </div>
                        <div class="form-group col-6 col-md-2">

                            <asp:Label ID="Label2" runat="server" class="info-data"
                                Text="<%$Resources:VisitRequest,Nationality %>" ClientIDMode="Static"></asp:Label>
                        </div>
                        <div class="form-group col-6 col-md-2">

                            <asp:Label ID="Label3" runat="server" class="info-data"
                                Text="<%$Resources:VisitRequest,IdentityType %>" ClientIDMode="Static"></asp:Label>
                        </div>
                        <div class="form-group col-6 col-md-2">

                            <asp:Label ID="Label4" runat="server" class="info-data"
                                Text="<%$Resources:VisitRequest,IdentityNumber %>" ClientIDMode="Static"></asp:Label>
                        </div>
                        <div class="form-group col-6 col-md-2">

                            <asp:Label ID="Label5" runat="server" class="info-data"
                                Text="<%$Resources:VisitRequest,WorkingPlace %>" ClientIDMode="Static"></asp:Label>
                        </div>

                        <div class="form-group col-6 col-md-1">

                            <asp:Label ID="Label6" runat="server" class="info-data"
                                Text="<%$Resources:VisitRequest,VisitTime %>" ClientIDMode="Static"></asp:Label>
                        </div>

                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn preview-btn " data-dismiss="modal">
                        <asp:Literal runat="server" Text="<%$Resources:VisitRequest,Close %>"></asp:Literal>

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
                        <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitRequestSend %>"></asp:Literal>

                    </p>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p id="MsgID">
                        <asp:Literal runat="server" Text="<%$Resources:VisitRequest,yourRequestSendSuccessfully %>">
                        </asp:Literal>
                    </p>
                </div>

            </div>

        </div>

    </div>

    <script type="text/javascript">
        var visitorsContainer = $('.request-visitors');
        var devicesContainer = $('.request-devices');

        $(".hidden-cols").hide();
        $(".loader").hide();
        $(".overlay").hide();

        var apiRootAddress = $("#hdnAPIRootURL").val();
        var listSiteURL = $("#hdnWFWebUrl").val();

        var visitReasonsData = null;
        var nationalitiesData = null;
        var identityTypesData = null;

        $(function () {
            getWFMessage('visit', function (data) {
                $("#lblVisitorMessageValue").text(data);
            });

            getDepartmentNameByCode(apiRootAddress, $("#hdnDepartmentCode").val(), function (data) {
                $("#lblUserDepartmentName").text(data);
            });

            getSectionNameByDeptartmentCodeAndSection(apiRootAddress, $("#hdnDepartmentCode").val(), $("#hdnSectionCode").val(), function (data) {
                $("#lblUserSectionName").text(data);
            });

            // Lookups data      
            var lookupsDataAPI$ = apiRootAddress + "VisitRequest/GetAllLookups?ListSiteUrl=" + listSiteURL;
            getDataByAPI(
                lookupsDataAPI$,
                function (data) {
                    visitReasonsData = data.VisitingReasonsList;
                    $("#ddlVisitReason").append('<option value="">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,choose%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>');
                    visitReasonsData.forEach(function (item) {
                        $("#ddlVisitReason").append('<option value="' + item.ID + '">' + item.Title + '</option>');
                    });
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

                    hideLoader();
                }
            );

        });

        $(document).on("blur", "#txtVisitStartDate, #txtVisitEndDate", function () {
            validateVisitDates($(this));
        });

        $(document).on("change", "#txtVisitStartDate, #txtVisitEndDate", function (e) {
            validateVisitDates($(this));
        });

        $("#btnPreview").click(function (event) {
            event.preventDefault();

            if (!isFormValid()) {
                return;
            }

            $("#visitMessageTitle").text($("#lblVisitorMessageValue").text());
            $("#visitStartDatePreview").text($("#txtVisitStartDate").val());
            $("#visitTimePreview").text($("#txtVisitorVisitTime").val());
            $("#visitEndDatePreview").text($("#txtVisitEndDate").val());
            $("#visitReasonPreview").text($("#ddlVisitReason option:selected").text());

            $("#applicantNamePreview").text($("#lblRequestUserNameValue").text());
            $("#applicantTitlePreview").text($("#lblUserPositionValue").text());
            $("#applicantSectionPreview").text($("#lblUserSectionName").text());
            $("#applicantDepartmentPreview").text($("#lblUserDepartmentName").text());


            var visitorsCount = $(".visitorRow").length;
            var deviceCount = 0;

            $(".request-visitors-review").empty();

            for (var i = 0; i < visitorsCount; i++) {

                var elem = document.createElement("tr");
                elem.classList.add("form-row", "reviewCol");

                var visitorRowBody = '';


                visitorRowBody += '<div class="form-group info-data  col-md-8 ">';
                visitorRowBody += $(".visitorRow:eq(" + i + ") .visitor-FirstName").val() + " " + $(".visitorRow:eq(" + i + ") .visitor-FatherName").val() + " " + $(".visitorRow:eq(" + i + ") .visitor-FamilyName").val() + " " + $(".visitorRow:eq(" + i + ") .visitor-LastName").val();
                visitorRowBody += '</div>';

                visitorRowBody += '<div class="form-group  col-md-4 ">';
                visitorRowBody += '<span class="nation-icon"></span>';
                visitorRowBody += '  <label class="col-form-label">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Nationality%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + ' </label>';
                visitorRowBody += '<p class="info-data">';
                visitorRowBody += $(".visitorRow:eq(" + i + ") .visitor-Nationality option:selected").text();
                visitorRowBody += '</p>';
                visitorRowBody += '</div>';

                visitorRowBody += '<div class="form-group  col-md-4 ">';
                visitorRowBody += '<span class="ID-icon"></span>';
                visitorRowBody += '  <label class="col-form-label">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Identity%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + ' </label>';
                visitorRowBody += '<p class="info-data">';
                visitorRowBody += '<span>';
                visitorRowBody += $(".visitorRow:eq(" + i + ") .visitor-IdentityNumber").val();
                visitorRowBody += '</span>';
                visitorRowBody += '<span class=" class="numberid"">';
                visitorRowBody += $(".visitorRow:eq(" + i + ") .visitor-IdentityType option:selected").text();
                visitorRowBody += '</span>';
                visitorRowBody += '</p >';
                visitorRowBody += '</div>';

                var workingPlace = $(".visitorRow:eq(" + i + ") .visitor-WorkingPlace").val();

                if (workingPlace != '') {
                    visitorRowBody += '<div class="form-group col-md-4">';
                    visitorRowBody += '<span class="work-icon"></span>';
                    visitorRowBody += '  <label class="col-form-label">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,WorkingPlace%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '  </label>';
                    visitorRowBody += '<p class="info-data">';
                    visitorRowBody += workingPlace;
                    visitorRowBody += '<p>';
                    visitorRowBody += '</div>';
                }

                //End of form-row visitorRowData

                visitorRowBody += '<div class="visitor-row-dev">';
                visitorRowBody += '<div class="form-row">';
                visitorRowBody += '<div class="form-group col-md-12   devices-title">';
                visitorRowBody += "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,AttachedDevices%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                visitorRowBody += '</div>';
                visitorRowBody += '</div >';

                deviceCount = $(".visitorRow:eq(" + i + ") .deviceRow").length;
                if (deviceCount > 0) {
                    for (var j = 0; j < deviceCount; j++) {
                        visitorRowBody += '<div class="devices" style="vertical-align: top">';
                        visitorRowBody += '<p class="devicetype info-data">';

                        visitorRowBody += $(".visitorRow:eq(" + i + ") .deviceRow:eq(" + j + ") .device-DeviceType").val();

                        var manufacturingCompanyName = $(".visitorRow:eq(" + i + ") .deviceRow:eq(" + j + ") .device-ManufacturingCompanyName").val();
                        if (manufacturingCompanyName != "") {
                            visitorRowBody += ' ( ';
                            visitorRowBody += manufacturingCompanyName;
                            visitorRowBody += ' ) ';
                        }

                        visitorRowBody += '</p>';

                        var deviceNumber = $(".visitorRow:eq(" + i + ") .deviceRow:eq(" + j + ") .device-DeviceNumber").val();
                        if (deviceNumber != "") {
                            visitorRowBody += '<p >';
                            visitorRowBody += "<span> <sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,DeviceNumber%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </span><span> : </span>";
                            visitorRowBody += deviceNumber;
                            visitorRowBody += '</p>';
                        }

                        var notesAboutDevice = $(".visitorRow:eq(" + i + ") .deviceRow:eq(" + j + ") .device-NotesAboutDevice").val();
                        if (notesAboutDevice != "") {
                            visitorRowBody += '<p >';
                            visitorRowBody += "<span><sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Notes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </span><span> : </span>";
                            visitorRowBody += notesAboutDevice;
                            visitorRowBody += '</p>';
                        }

                        visitorRowBody += '</div>';
                    }
                }
                else {
                    visitorRowBody += '<p class="welcome" >' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,ThereIsNoDevicesForVisitor%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</p>';
                }

                visitorRowBody += '</div>';

                elem.innerHTML = visitorRowBody;


                $(".request-visitors-review").append(elem);
            }

            $('#myModal').modal({ backdrop: 'static', keyboard: false });

            $(".reviewCol").click(function () {
                $(this).toggleClass("opend");
            });
        });

        $("#btnSendRequestFromPreview").click(function (event) {
            event.preventDefault();
            sendRequest();
            $('#myModal').modal("hide");
        });

        //Devices
        //Add & delete device button
        $(document).on("click", ".visitor-row-devices", function (event) {
            if (

                event.target &&
                event.target.nodeName === "BUTTON" &&
                event.target.classList.contains("AddDeviceBTN")
            ) {
                // debugger;
                $(".hidden-cols").show();
                event.preventDefault();
                //$(event.target.parentElement.parentElement.parentElement).after(RenderNewDevice());
                $(event.target.parentElement.parentElement.parentElement).append(RenderNewDevice());

                // event.target.parentElement.parentElement.parentElement.innerHTML+=RenderNewDevice().outerHTML;

            }

            //Remove device button
            if (
                event.target &&
                event.target.nodeName === "BUTTON" &&
                event.target.classList.contains("request-deleteDevice")
            ) {
                event.preventDefault();
                $(event.target.parentElement.parentElement).remove();
            }

        });

        //Visitors 
        function RenderNewVisitor() {
            var elem = document.createElement("div");
            elem.classList.add("visitorRow");
            // elem.classList.add("form-row");

            var visitorRowBody = '';
            visitorRowBody = '<div class="row visitorRowData">';

            visitorRowBody += '<div class="form-group col-md-3">';
            visitorRowBody += '<label class="col-form-label"><sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,FirstName%>" EncodeMethod="EcmaScriptStringLiteralEncode"/><span class="is-required">*</span></label>';
            visitorRowBody += '<input type="text" required="required" maxlength="15" class="visitor-FirstName form-control" />';
            visitorRowBody += '</div>';

            visitorRowBody += '<div class="form-group col-md-3">';
            visitorRowBody += '<label class="col-form-label"><sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,FatherName%>" EncodeMethod="EcmaScriptStringLiteralEncode"/></label>';
            visitorRowBody += '<input type="text" maxlength="15" class="visitor-FatherName form-control" />';
            visitorRowBody += '</div>';

            visitorRowBody += '<div class="form-group col-md-3">';
            visitorRowBody += '<label class="col-form-label"><sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,FamilyName%>" EncodeMethod="EcmaScriptStringLiteralEncode"/></label>';
            visitorRowBody += '<input type="text" maxlength="15" class="visitor-FamilyName form-control" />';
            visitorRowBody += '</div>';

            visitorRowBody += '<div class="form-group col-md-3">';
            visitorRowBody += '<label class="col-form-label"><sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,LastName%>" EncodeMethod="EcmaScriptStringLiteralEncode"/><span class="is-required">*</span></label>';
            visitorRowBody += '<input type="text" required="required" maxlength="15" class="visitor-LastName form-control" />';
            visitorRowBody += '</div>';

            visitorRowBody += '<div class="form-group col-md-3">';
            visitorRowBody += '<label class="col-form-label">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Nationality%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + ' <span class="is-required">*</span></label>';
            visitorRowBody += '<select required="required" class="visitor-Nationality form-control">'
            visitorRowBody += '<option value="">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,choose%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>';
            nationalitiesData.forEach(function (item) {
                visitorRowBody += '<option value="' + item.ID + '" >' + item.Title + '</option>';
            });

            visitorRowBody += '</select>';
            visitorRowBody += '</div>';


            visitorRowBody += '<div class="form-group col-md-3">';
            visitorRowBody += '<label class="col-form-label">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,IdentityType%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '  <span class="is-required">*</span></label>';
            visitorRowBody += '<select required="required" class="visitor-IdentityType form-control">'
            visitorRowBody += '<option value="">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,choose%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>';
            identityTypesData.forEach(function (item) {
                visitorRowBody += '<option value="' + item.ID + '" >' + item.Title + '</option>';
            });
            visitorRowBody += '</select>';
            visitorRowBody += '</div>';

            visitorRowBody += '<div class="form-group col-md-3">';
            visitorRowBody += '<label class="col-form-label">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,IdentityNumber%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '  <span class="is-required">*</span></label>';
            visitorRowBody += '<input required="required" type="text" maxlength="15" class="visitor-IdentityNumber form-control"  onkeypress="javascript:return isNumber(event)"/>';
            visitorRowBody += '</div>';

            visitorRowBody += '<div class="form-group col-md-3">';
            visitorRowBody += '<label class="col-form-label">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,WorkingPlace%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '  </label>';
            visitorRowBody += '<input type="text" maxlength="60" class="visitor-WorkingPlace form-control"  />';
            visitorRowBody += '</div>';

            //End of form-row visitorRowData
            visitorRowBody += '</div>';
            visitorRowBody += '<div class=" delete-row delete-visitor">';
            visitorRowBody += '<button  class="request-deleteVisitor btn  hvr-shutter-out-horizontal" title="delete"> - </button>';
            visitorRowBody += '</div>';

            visitorRowBody += '<div class="visitor-row-devices">';

            visitorRowBody += '<div class="form-row">';

            visitorRowBody += '<div class="l-addDevice col-md-2">'
            // visitorRowBody += '<button class="AddDeviceBTN btn btn-apply hvr-shutter-out-horizontal" tabindex="1">+ الأجهزة المرفقة </button>'

            visitorRowBody += '<button class="AddDeviceBTN btn btn-apply hvr-shutter-out-horizontal" tabindex="1"> ' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,AttachedDevices%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + ' </button>'
            visitorRowBody += '</div>';
            visitorRowBody += '</div >';

            visitorRowBody += '</div>';

            elem.innerHTML = visitorRowBody;
            return elem;
        };

        //Delete visitor
        $('.request-visitors').on("click", function (event) {
            if (
                event.target &&
                event.target.nodeName === "BUTTON" &&
                event.target.classList.contains("request-deleteVisitor")
            ) {
                event.preventDefault();
                event.target.parentElement.parentElement.remove()
            }
        });
        function RenderNewDevice() {
            var elem = document.createElement("div");
            elem.classList.add("deviceRow");
            var Hidden = "";
            // if ($(".deviceRow").length>=1){
            //     Hidden= "hideDevice";
            // }
            var deviceRowBody = '';
            deviceRowBody += '<div class="row">';
            deviceRowBody += '<div class="form-group col-md-3" style="visibility:hidden"><input type="text" class=" form-control" /></div>';
            deviceRowBody += '<div class="form-group col-md-2">';

            deviceRowBody += '<label class="col-form-label ">';
            deviceRowBody += '  <asp:Label ID="lblDeviceType" runat="server" Text="<%$Resources:VisitRequest,DeviceType %>" ClientIDMode="Static">  </asp:Label>';
            deviceRowBody += '  <span class="is-required">*</span>';
            deviceRowBody += ' </label>';

            deviceRowBody += '<input type="text" required="required" maxlength="25" class="device-DeviceType form-control" />';
            deviceRowBody += '</div>';

            deviceRowBody += '<div class="form-group col-md-2">';

            deviceRowBody += '<label class="col-form-label ">';
            deviceRowBody += '  <asp:Label ID="lblDeviceNumber1" runat="server"  Text="<%$Resources:VisitRequest,DeviceNumber %>" ClientIDMode="Static"> </asp:Label>';
            deviceRowBody += ' </label>';

            deviceRowBody += '<input type="text" maxlength="25" class="device-DeviceNumber form-control" />';
            deviceRowBody += '</div>';

            deviceRowBody += '<div class="form-group col-md-2">';

            deviceRowBody += '<label class="col-form-label ">';

            deviceRowBody += '<asp:Label ID="lblDeviceNumber" runat="server" Text="<%$Resources:VisitRequest,ManufacturingCompany %>" ClientIDMode="Static"></asp:Label>';
            deviceRowBody += ' </label>';

            deviceRowBody += '<input type="text" maxlength="25" class="device-ManufacturingCompanyName form-control" />';
            deviceRowBody += '</div>';


            deviceRowBody += '<div class="form-group col-md-3 col-lg-2">';

            deviceRowBody += '<label class="col-form-label ">';
            deviceRowBody += '<asp:Label ID="lblNotesAboutDevice" runat="server"  Text="<%$Resources:VisitRequest,NotesAboutDevice %>" ClientIDMode="Static"></asp:Label>';
            deviceRowBody += ' </label>';

            deviceRowBody += '<textarea maxlength="40" class="device-NotesAboutDevice form-control"></textarea>';
            deviceRowBody += '</div>';
            deviceRowBody += '</div>';

            deviceRowBody += '<div class="delete-row">';
            deviceRowBody += '<button  class="request-deleteDevice btn  hvr-shutter-out-horizontal" title="delete"> - </button>';
            deviceRowBody += '</div>';

            elem.innerHTML = deviceRowBody;
            return elem;
        };

        //Visitors
        //Add button
        $("#AddVisitorBTN").on("click", function (event) {
            event.preventDefault();
            visitorsContainer.append(RenderNewVisitor());
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

            if (!validateVisitDates($("#txtVisitEndDate"))) {
                $("#txtVisitEndDate").focus();
                return;
            }

            var startDateConverted = HijriJS.toGregorian($("#txtVisitStartDate").val(), "/");
            startDateConverted.setMonth(startDateConverted.getMonth());
            var endDateConverted = HijriJS.toGregorian($("#txtVisitEndDate").val(), "/");
            endDateConverted.setMonth(endDateConverted.getMonth());

            var requestObject =
            {
                VisitMessage: $("#lblVisitorMessageValue").text(),
                VisitStartDate: startDateConverted,
                VisitTime: $("#txtVisitorVisitTime").val(),
                VisitEndDate: endDateConverted,
                VisitReason: $("#ddlVisitReason").val(),
                UserName: $("#lblRequestUserNameValue").text(),
                ApplicantRank: $("#lblUserPositionValue").text(),
                ApplicantAdministration: $("#hdnDepartmentCode").val(),
                ApplicantSection: $("#hdnSectionCode").val(),
                ISDeleted: false,
                VisitPersons: []
            };
            $("#btnSend").attr("disabled", true);
            $(".overlay").show();
            $(".loader").show();

            var visitorsCount = $(".visitorRow").length;
            var deviceCount = 0;

            requestObject.VisitPersons = [];
            for (var i = 0; i < visitorsCount; i++) {
                visitor = {};
                visitor.FirstName = $(".visitorRow:eq(" + i + ") .visitor-FirstName").val();
                visitor.FatherName = $(".visitorRow:eq(" + i + ") .visitor-FatherName").val();
                visitor.FamilyName = $(".visitorRow:eq(" + i + ") .visitor-FamilyName").val();
                visitor.LastName = $(".visitorRow:eq(" + i + ") .visitor-LastName").val();
                visitor.Nationality = $(".visitorRow:eq(" + i + ") .visitor-Nationality").val();
                visitor.IdentityType = $(".visitorRow:eq(" + i + ") .visitor-IdentityType").val();
                visitor.IdentityNumber = $(".visitorRow:eq(" + i + ") .visitor-IdentityNumber").val();
                visitor.WorkingPlace = $(".visitorRow:eq(" + i + ") .visitor-WorkingPlace").val();
                visitor.IsDeleted = false;

                deviceCount = $(".visitorRow:eq(" + i + ") .deviceRow").length;
                if (deviceCount > 0) {
                    visitor.VisitDevices = [];
                    for (var j = 0; j < deviceCount; j++) {
                        device = {};
                        device.DeviceType = $(".visitorRow:eq(" + i + ") .deviceRow:eq(" + j + ") .device-DeviceType").val();
                        device.DeviceNumber = $(".visitorRow:eq(" + i + ") .deviceRow:eq(" + j + ") .device-DeviceNumber").val();
                        device.ManufacturingCompanyName = $(".visitorRow:eq(" + i + ") .deviceRow:eq(" + j + ") .device-ManufacturingCompanyName").val();
                        device.NotesAboutDevice = $(".visitorRow:eq(" + i + ") .deviceRow:eq(" + j + ") .device-NotesAboutDevice").val();
                        device.IsDeleted = false;
                        visitor.VisitDevices.push(device);
                    }
                }
                requestObject.VisitPersons.push(visitor);
            }
            postRequest(JSON.stringify(requestObject));
        }

        function postRequest(requestData) {
            var url = apiRootAddress + "VisitRequest/AddVisitRequest?ListSiteUrl=" + listSiteURL;
            $.ajax({
                url: url,
                type: 'POST',
                contentType: 'application/json',
                data: requestData,
                success: function (result) {
                    if (result.statusCode == 1) {
                        $(".loader").hide();
                        $(".overlay").hide();
                        $("#btnSend").attr("disabled", true);
                        window.location.href = "default.aspx";
                        showSendMsg("<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,yourRequestSendSuccessfully%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
                    }
                    else {
                        showSendMsg("<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,SomeThingError%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
                        $(".loader").hide();
                        $(".overlay").hide();
                        $("#btnSend").attr("disabled", true);
                        return;
                    }
                }
                ,
                error: function (err) {
                    showSendMsg(result.statusMessage);
                },

                complete: function () {

                }
            });
        }


        //$('#sendModel').on('hidden.bs.modal', function () {
        //    window.location.href = "default.aspx";
        //})
    </script>


    <script src="/modwf/style Library/branding/js/general/helpers.js"></script>

</asp:Panel>

<asp:Panel runat="server" ID="pnlMessage">
    <div class="container" style="font-size: 16px; line-height: 30px;">
        <svg style="width: 25px; height: 25px;" xmlns="http://www.w3.org/2000/svg"
            xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px" viewBox="0 0 330 330"
            style="enable-background: new 0 0 330 330;" xml:space="preserve" width="512px" height="512px">
            <g>
                <g>
                    <path
                        d="M165,0C74.019,0,0,74.02,0,165.001C0,255.982,74.019,330,165,330s165-74.018,165-164.999C330,74.02,255.981,0,165,0z    M165,300c-74.44,0-135-60.56-135-134.999C30,90.562,90.56,30,165,30s135,60.562,135,135.001C300,239.44,239.439,300,165,300z"
                        data-original="#000000" class="active-path" data-old_color="#000000" fill="#C10D0D" />
                    <path
                        d="M164.998,70c-11.026,0-19.996,8.976-19.996,20.009c0,11.023,8.97,19.991,19.996,19.991   c11.026,0,19.996-8.968,19.996-19.991C184.994,78.976,176.024,70,164.998,70z"
                        data-original="#000000" class="active-path" data-old_color="#000000" fill="#C10D0D" />
                    <path
                        d="M165,140c-8.284,0-15,6.716-15,15v90c0,8.284,6.716,15,15,15c8.284,0,15-6.716,15-15v-90C180,146.716,173.284,140,165,140z   "
                        data-original="#000000" class="active-path" data-old_color="#000000" fill="#C10D0D" />
                </g>
            </g>
        </svg>

        <asp:Label ID="lblMissingDataMessageTitle" runat="server" Style="font-size: 18px; font-weight: 600;"
            Text="<%$Resources:VisitRequest,UserHasNotGroupMessage %>">
        </asp:Label>
        <asp:Label ID="lblMissingDataMessage" Style="font-weight: 600; font-size: 14px; display: block; margin-top: 10px;"
            runat="server" Text="<%$Resources:VisitRequest,UserHasNotGroupMessage %>">
        </asp:Label>
    </div>
</asp:Panel>
