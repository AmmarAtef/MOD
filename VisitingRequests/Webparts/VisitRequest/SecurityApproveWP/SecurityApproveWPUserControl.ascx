<%@ Assembly Name="VisitRequest, Version=1.0.0.0, Culture=neutral, PublicKeyToken=7d812edf42fd645f" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SecurityApproveWPUserControl.ascx.cs" Inherits="VisitRequest.SecurityApproveWP.SecurityApproveWPUserControl" %>

<asp:HiddenField ID="hdnAPIRootURL" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hdnWFWebUrl" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hdnDepartment" runat="server" ClientIDMode="Static" />


<style>
    .hidden {
        display: none;
    }

    input[type=text]::-ms-clear {
        display: none;
        width: 0;
        height: 0;
    }

    input[type=text]::-ms-reveal {
        display: none;
        width: 0;
        height: 0;
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
    <div class="formLayout-search">
        <div class="container">
            <div id="showSearch" class="showSearch">
                <asp:Literal runat="server" Text="<%$Resources:VisitRequest,FilterResults %>"></asp:Literal>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>

    <div class="container">
        <div id="SearchOptions" class="formLayout-container bb-none">
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group ">
                        <label for="txtRequestNumber" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequesrtNumber %>">
                            </asp:Literal>

                        </label>
                        <input type="text" class="form-control" id="txtRequestNumber"
                            onkeypress="javascript:return isNumber(event)" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group ">
                        <label for="txtRequestDate" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequestDate %>"></asp:Literal>

                        </label>
                        <input type="text" class="form-control textPicker" autocomplete="off" id="txtRequestDate" />
                        <label class="daytext"></label>

                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group ">
                        <label for="txtVisitDate" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,visitEnterDate %>">
                            </asp:Literal>

                        </label>
                        <input type="text" class="form-control textPicker" autocomplete="off" id="txtVisitDate" />
                        <label class="daytext"></label>

                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group ">
                        <label for="txtApplicantName" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequestOwnerName %>">
                            </asp:Literal>
                        </label>
                        <input type="text" id="txtApplicantName" class="form-control" />
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtVisitorFirstName" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,FirstName	 %>"></asp:Literal>
                        </label>
                        <input type="text" id="txtVisitorFirstName" class="form-control" />
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtVisitorFatherName" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,FatherName %>"></asp:Literal>
                        </label>
                        <input type="text" id="txtVisitorFatherName" class="form-control" />
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtVisitorFamilyName" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,FamilyName %>"></asp:Literal>

                        </label>
                        <input type="text" id="txtVisitorFamilyName" class="form-control" />
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtVisitorLastName" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,LastName %>"></asp:Literal>
                        </label>
                        <input type="text" id="txtVisitorLastName" class="form-control" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group ">
                        <label for="ddlNationalities" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,Nationality %>"></asp:Literal>
                        </label>
                        <select id="ddlNationalities" class="form-control"></select>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group ">
                        <label for="txtIdentityNumber" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,IdentityNumber %>">
                            </asp:Literal>
                        </label>
                        <input type="text" id="txtIdentityNumber" class="form-control"
                            onkeypress="javascript:return isNumber(event)" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group ">
                        <label for="ddlDepartments" class="col-form-label">

                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,Departments %>"></asp:Literal>

                        </label>
                        <select id="ddlDepartments" class="form-control"></select>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group ">
                        <label for="ddlSections" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,Sections %>"></asp:Literal>

                        </label>
                        <select id="ddlSections" class="form-control"></select>
                    </div>
                </div>

                <div class="col-md-6">
                    <button id="btnSearch" class="btn preview-btn send-btn">
                        <asp:Literal runat="server" Text="<%$Resources:VisitRequest,Search %>"></asp:Literal>
                    </button>

                    <button id="btnReset" class="btn preview-btn send-btn">
                        <asp:Label runat="server" Text="<%$Resources:VisitRequest,SearchReset %>" ClientIDMode="Static">
                        </asp:Label>
                    </button>
                </div>

            </div>


        </div>
        <!-- this table for print onlyy      -->
        <div id="PrintArea"></div>
        <div id="printAreaView" class="tableview">
            <div class="table-responsive  formLayout-table printedtable">
                <div class="table-options">

                    <div class="totalnumb">
                        <span>
                            <asp:Literal runat="server"
                                Text="<%$Resources:VisitRequest,TotalNumberForAvalilableRequests %>"></asp:Literal>
                        </span>
                        <span>:</span>
                        <span id="RowNumb" class="numb">0</span>
                    </div>
                    <div class="pageTools no-print printPreview-hide">

                        <ul class="pagOptions">
                            <li>
                                <button id="btnRefreshData" class="btn preview-btn send-btn">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background: new 0 0 512 512;" xml:space="preserve" width="20px" height="20px" class="hovered-paths">
                                        <g>
                                            <g>
                                                <g>
                                                    <path d="M493.815,70.629c-11.001-1.003-20.73,7.102-21.733,18.102l-2.65,29.069C424.473,47.194,346.429,0,256,0    C158.719,0,72.988,55.522,30.43,138.854c-5.024,9.837-1.122,21.884,8.715,26.908c9.839,5.024,21.884,1.123,26.908-8.715    C102.07,86.523,174.397,40,256,40c74.377,0,141.499,38.731,179.953,99.408l-28.517-20.367c-8.989-6.419-21.48-4.337-27.899,4.651    c-6.419,8.989-4.337,21.479,4.651,27.899l86.475,61.761c12.674,9.035,30.155,0.764,31.541-14.459l9.711-106.53    C512.919,81.362,504.815,71.632,493.815,70.629z" data-original="#000000" class="active-path" data-old_color="#000000" fill="#FFFFFF" />
                                                </g>
                                            </g>
                                            <g>
                                                <g>
                                                    <path d="M472.855,346.238c-9.838-5.023-21.884-1.122-26.908,8.715C409.93,425.477,337.603,472,256,472    c-74.377,0-141.499-38.731-179.953-99.408l28.517,20.367c8.989,6.419,21.479,4.337,27.899-4.651    c6.419-8.989,4.337-21.479-4.651-27.899l-86.475-61.761c-12.519-8.944-30.141-0.921-31.541,14.459l-9.711,106.53    c-1.003,11,7.102,20.73,18.101,21.733c11.014,1.001,20.731-7.112,21.733-18.102l2.65-29.069C87.527,464.806,165.571,512,256,512    c97.281,0,183.012-55.522,225.57-138.854C486.594,363.309,482.692,351.262,472.855,346.238z" data-original="#000000" class="active-path" data-old_color="#000000" fill="#FFFFFF" />
                                                </g>
                                            </g>
                                        </g>
                                    </svg>
                                    تحديث البيانات</button>
                            </li>
                            <li class="printBtn">
                                <a href="javascript:void(0);">

                                    <svg id="icon-print" class="icon" viewBox="0 0 32 32">

                                        <path
                                            d="M30.914 14.625c-0.725-0.725-1.593-1.087-2.606-1.087h-1.23v-4.923c0-0.513-0.129-1.077-0.385-1.692s-0.564-1.103-0.923-1.462l-2.924-2.923c-0.359-0.359-0.846-0.667-1.461-0.923s-1.179-0.384-1.692-0.384h-12.923c-0.513 0-0.949 0.179-1.308 0.538s-0.538 0.795-0.538 1.308v10.461h-1.231c-1.013 0-1.881 0.362-2.606 1.087s-1.086 1.593-1.086 2.606v8c0 0.167 0.061 0.31 0.183 0.433s0.266 0.182 0.433 0.182h4.308v3.077c0 0.513 0.179 0.949 0.538 1.308s0.795 0.538 1.308 0.538h18.462c0.513 0 0.949-0.18 1.308-0.538s0.538-0.795 0.538-1.308v-3.077h4.308c0.166 0 0.311-0.061 0.432-0.182s0.183-0.266 0.183-0.433v-8c0-1.013-0.362-1.882-1.086-2.606zM24.616 28.308h-17.231v-4.923h17.231v4.923zM24.616 16h-17.231v-12.308h12.308v3.077c0 0.513 0.18 0.949 0.538 1.308s0.795 0.538 1.308 0.538h3.077v7.385zM29.174 18.096c-0.243 0.243-0.532 0.366-0.865 0.366s-0.622-0.122-0.865-0.366c-0.243-0.243-0.365-0.532-0.365-0.865s0.122-0.622 0.365-0.865c0.243-0.244 0.532-0.365 0.865-0.365s0.622 0.122 0.865 0.365c0.243 0.243 0.366 0.532 0.366 0.865s-0.122 0.622-0.366 0.865z">
                                        </path>
                                    </svg>

                                </a>
                            </li>
                        </ul>

                    </div>

                    <div class="clearfix"></div>
                </div>

                <table id="dataTable" class="table">
                    <thead>
                        <tr class="active">
                            <th class="col-xs-2"><strong>
                                <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequesrtNumber %>">
                                </asp:Literal>

                            </strong></th>
                            <th class="col-xs-2"><strong>
                                <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequestDate %>">
                                </asp:Literal>
                            </strong></th>
                            <th class="col-xs-6"><strong>
                                <asp:Literal runat="server" Text="<%$Resources:VisitRequest,visitEnterDate %>">
                                </asp:Literal>
                            </strong></th>
                            <th class="col-xs-2"><strong>
                                <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequestOwnerName %>">
                                </asp:Literal>
                            </strong></th>
                            <th class="col-xs-2"><strong>
                                <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitUserDepartment %>">
                                </asp:Literal>

                            </strong></th>
                            <th class="col-xs-2"><strong>
                                <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitUserSection %>">
                                </asp:Literal>
                            </strong></th>
                            <th class="col-xs-2 count">
                                <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitorsCount %>">
                                </asp:Literal>
                            </th>

                            <th class="viewoption"></th>

                        </tr>
                    </thead>
                    <tbody id="tablebody">
                    </tbody>
                </table>
            </div>
        </div>

        <div class="table-responsive  formLayout-table  ">

            <table id="dataTable" class="table">
                <thead>
                    <tr class="active">
                        <th class="col-xs-2"><strong>
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequesrtNumber %>">
                            </asp:Literal>
                        </strong></th>
                        <th class="col-xs-2"><strong>
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequestDate %>">
                            </asp:Literal>
                        </strong></th>
                        <th class="col-xs-6"><strong>

                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,visitEnterDate %>">
                            </asp:Literal>
                        </strong></th>
                        <th class="col-xs-2"><strong>
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequestOwnerName %>">
                            </asp:Literal>

                        </strong></th>
                        <th class="col-xs-2"><strong>
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitUserDepartment %>">
                            </asp:Literal>
                        </strong></th>
                        <th class="col-xs-2"><strong>
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitUserSection %>">
                            </asp:Literal>
                        </strong></th>
                        <th class="col-xs-2 count">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitorsCount %>">
                            </asp:Literal>
                        </th>
                        <th class="viewoption"></th>

                    </tr>
                </thead>
                <tbody id="tablebody" class="not-printbody">
                </tbody>
            </table>
            <div class='PaggerDiv'></div>
        </div>
    </div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered formLayout-model" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <p class="modal-title" id="exampleModalLongTitle">
                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,AcceptVisitRequest %>"></asp:Literal>

                </p>
                <p class="visitnumber">
                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,Number %>"></asp:Literal>

                    : <span id="visitRequestIDPreview"></span>
                </p>

                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p class="request-msgtitle">
                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequestMsg %>"></asp:Literal>

                </p>
                <p class="request-msg" id="visitMessageTitlePreview"></p>

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
                            <input type="hidden" id="visitReasonIDPreview" />
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
                </div>

                <div class="form-row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <p class="welcome">
                                <asp:Literal runat="server" Text="<%$Resources:VisitRequest,AcceptVisitRequest %>">
                                </asp:Literal>

                                البوابة
                            </p>
                            <select id="ddlGates" required="required" class="form-control"></select>
                        </div>
                    </div>


                </div>
                <div class="form-row">
                    <div class="col-md-6">
                        <p class="welcome">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,Notes %>"></asp:Literal>

                        </p>
                        <textarea id="txtNote" cols="50" rows="3" class="form-control"></textarea>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" id="btnSubmit" disabled="true" class="btn preview-btn send-btn"
                    data-toggle="modal" data-target="#exampleModalCenter">
                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,accept	 %>"></asp:Literal>
                </button>
                <button type="button" class="btn preview-btn " data-dismiss="modal">
                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,Close %>"></asp:Literal>
                </button>
                <p style="padding-top: 10px;" class="text-danger submitError"></p>
            </div>
        </div>
    </div>
</div>
<div id="PrintArea"></div>
<div id="printAreaView" class="popupview">
    <div class="modal fade" id="actionModelCenter" tabindex="-1" role="dialog" aria-labelledby="actionModelCenterTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered formLayout-model" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="pageTools no-print printPreview-hide">

                        <ul class="pagOptions">
                            <li class="printBtn">
                                <a href="javascript:void(0);">

                                    <svg id="icon-print" class="icon" viewBox="0 0 32 32">

                                        <path
                                            d="M30.914 14.625c-0.725-0.725-1.593-1.087-2.606-1.087h-1.23v-4.923c0-0.513-0.129-1.077-0.385-1.692s-0.564-1.103-0.923-1.462l-2.924-2.923c-0.359-0.359-0.846-0.667-1.461-0.923s-1.179-0.384-1.692-0.384h-12.923c-0.513 0-0.949 0.179-1.308 0.538s-0.538 0.795-0.538 1.308v10.461h-1.231c-1.013 0-1.881 0.362-2.606 1.087s-1.086 1.593-1.086 2.606v8c0 0.167 0.061 0.31 0.183 0.433s0.266 0.182 0.433 0.182h4.308v3.077c0 0.513 0.179 0.949 0.538 1.308s0.795 0.538 1.308 0.538h18.462c0.513 0 0.949-0.18 1.308-0.538s0.538-0.795 0.538-1.308v-3.077h4.308c0.166 0 0.311-0.061 0.432-0.182s0.183-0.266 0.183-0.433v-8c0-1.013-0.362-1.882-1.086-2.606zM24.616 28.308h-17.231v-4.923h17.231v4.923zM24.616 16h-17.231v-12.308h12.308v3.077c0 0.513 0.18 0.949 0.538 1.308s0.795 0.538 1.308 0.538h3.077v7.385zM29.174 18.096c-0.243 0.243-0.532 0.366-0.865 0.366s-0.622-0.122-0.865-0.366c-0.243-0.243-0.365-0.532-0.365-0.865s0.122-0.622 0.365-0.865c0.243-0.244 0.532-0.365 0.865-0.365s0.622 0.122 0.865 0.365c0.243 0.243 0.366 0.532 0.366 0.865s-0.122 0.622-0.366 0.865z">
                                        </path>
                                    </svg>

                                </a>
                            </li>
                        </ul>

                    </div>
                    <p class="modal-title" id="exampleModalLongTitle">
                        <asp:Literal runat="server" Text="<%$Resources:VisitRequest,ReviewVisitRequest %>">
                        </asp:Literal>
                    </p>
                    <p class="visitnumber">
                        <asp:Literal runat="server" Text="<%$Resources:VisitRequest,Number %>"></asp:Literal>

                        : <span id="VisitNumb"></span>
                    </p>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">

                    <p class="request-msgtitle">
                        <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitMessage %>"></asp:Literal>

                    </p>
                    <span class="request-msg" id="visitMessageTitleView"></span>


                    <div class="visitinfo">
                        <div class="form-row">
                            <div class="form-group col-md-3">
                                <i class=" mdi mdi-calendar "></i>
                                <label class="col-form-label">
                                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitStartDate %>">
                                    </asp:Literal>

                                </label>
                                <p id="visitStartDateView" class="info-data"></p>
                            </div>

                            <div class="form-group col-md-3">
                                <i class=" mdi mdi-calendar "></i>
                                <label class="col-form-label">
                                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitEndDate %>">
                                    </asp:Literal>

                                </label>
                                <p id="visitEndDateView" class="info-data"></p>
                            </div>

                            <div class="form-group col-md-3">
                                <i class=" mdi mdi-av-timer "></i>
                                <label class="col-form-label">
                                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitTime %>">
                                    </asp:Literal>
                                </label>
                                <p id="visitTimeView" class="info-data"></p>
                            </div>

                            <div class="form-group col-md-3">
                                <i class=" mdi mdi-bullseye-arrow "></i>
                                <label class="col-form-label">
                                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitReason %>">
                                    </asp:Literal>

                                </label>
                                <p id="visitReasonView" class="info-data"></p>
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


                                <span id="applicantNameView" class="info-data"></span>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="col-form-label">
                                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitUserPosition %>">
                                    </asp:Literal>

                                </label>
                                <p id="applicantTitleView" class="info-data"></p>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="col-form-label">
                                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitUserSection %>">
                                    </asp:Literal>

                                </label>
                                <p id="applicantSectionView" class="info-data"></p>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="col-form-label">
                                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitUserDepartment %>">
                                    </asp:Literal>

                                </label>
                                <p id="applicantDepartmentView" class="info-data"></p>
                            </div>
                        </div>

                    </div>


                    <div class="heading-title">
                        <p>
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitorsDataa %>"></asp:Literal>

                        </p>
                    </div>


                    <div class="request-visitors-view">
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="rejectModelCenter" tabindex="-1" role="dialog" aria-labelledby="rejectModelCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered formLayout-model action-model" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <p class="modal-title" id="rejectModelCenterModalLongTitle">
                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RejectVisitRequest %>"></asp:Literal>
                </p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">


                <p class="welcome">
                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequesrtNumber %>"></asp:Literal>

                    <span id="requestNumberReject"></span>
                </p>

                <div class="visitinfo">
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label class="col-form-label">
                                <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequestDate %>">
                                </asp:Literal>
                            </label>
                            <p class="info-data" id="requestDateReject"></p>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-form-label">
                                <asp:Literal runat="server" Text="<%$Resources:VisitRequest,visitEnterDate %>">
                                </asp:Literal>

                            </label>
                            <p class="info-data" id="visitDateReject"></p>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-form-label">
                                <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitUserName	 %>">
                                </asp:Literal>

                            </label>
                            <p class="info-data" id="applicantNameReject"></p>
                        </div>
                    </div>
                </div>


                <div class="form-row">
                    <div class="col-md-7">
                        <p class="welcome">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,Comment %>">
                            </asp:Literal>
                        </p>
                        <textarea id="txtRejectComment" class="form-control" cols="50" rows="5">

                        </textarea>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" id="btnReject" class="btn preview-btn send-btn" data-toggle="modal">
                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,Reject %>"></asp:Literal>
                </button>
                <button type="button" class="btn preview-btn " data-dismiss="modal">
                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,Close %>"></asp:Literal>

                </button>
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


</div>
<div class="modal fade" id="senddModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered formLayout-modelSend" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <p class="modal-title" id="exampleModalLongTitle">
                    إرسال الرد على الطلب
                </p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p id="MsgID">
                    <asp:Literal runat="server"
                        Text="تم إرسال الرد بنجاح"></asp:Literal>
                </p>
            </div>

        </div>

    </div>

</div>
<script src="/modwf/style Library/branding/js/general/helpers.js"></script>
<script type="text/javascript">

    ResetSearch();
    var apiRootAddress = $("#hdnAPIRootURL").val();
    var listSiteURL = $("#hdnWFWebUrl").val();
    var currentUserId = _spPageContextInfo.userId;
    var departmentList;
    var sectionList;
    var search = false;
    $(function () {

        var lookupsDataAPI$ = apiRootAddress + "VisitRequest/GetAllLookups?ListSiteUrl=" + listSiteURL;
        getDataByAPI(
            lookupsDataAPI$,
            function (data) {
                nationalitiesData = data.NationalityList;
                $("#ddlNationalities").append('<option value="0">' +
                    "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                    + '</option>');
                nationalitiesData.forEach(function (item) {
                    $("#ddlNationalities").append('<option value="' + item.ID + '">' + item.Title + '</option>');
                });

            }
        );

        getAllGates(
            apiRootAddress,
            function (data) {
                $("#ddlGates").append('<option value="">' +
                    "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,choose%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                    + '</option>');
                data.forEach(function (item) {
                    $("#ddlGates").append('<option value="' + item.ID + '">' + item.Title + '</option>');
                });
            }
        );



        getAllDepartments(
            apiRootAddress,
            function (data) {
                departmentList = data;
                $("#ddlDepartments").append('<option value="">' +
                    "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                    + '</option>');
                data.forEach(function (item) {
                    $("#ddlDepartments").append('<option value="' + item.Code + '">' + item.Title + '</option>');
                });
            }
        );
        $("#ddlSections").append('<option value="">' +
            "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
            + '</option>');
        getAllSections(
            apiRootAddress,
            function (data) {
                sectionList = data;
            }
        );

        getAllStatuses(
            apiRootAddress,
            function (data) {
                $("#ddlStatuses").append('<option value="">' +
                    "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                    + '</option>');
                data.forEach(function (item) {
                    $("#ddlStatuses").append('<option value="' + item.Code + '">' + item.Title + '</option>');
                });
            }
        );

        var searchRequestsAPI$ = apiRootAddress + "VisitRequest/SearchRequests?ListSiteUrl=" + listSiteURL + "&UserID=0&RequestID=0&RequestCreateDate=&RequestVisitDate=&ApplicantName=&FirstName=&FatherName&FamilyName&LastName=&Nationality=0&DepartmentCode=&SectionCode=&IdentyNumber=&RequestState=0&OnlyToday=true";


        getDataByAPI(searchRequestsAPI$, function (data, status, xhr) {
            if (xhr.getResponseHeader('StatusCode') == 1) {
                hideGeneralErrorMessage();
                renderSearchResult(data);
            }
            else {
                //Show Error message
                showGeneralErrorMessage();
            }
        });
    });

    $("#ddlDepartments").change(function () {
        if ($(this).val() != "") {
            getSectionsByDepartmentCode(
                apiRootAddress,
                $(this).val(),
                function (data) {
                    $("#ddlSections").empty();
                    $("#ddlSections").append('<option value="">' +
                        "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                        + '</option>');
                    data.forEach(function (item) {
                        $("#ddlSections").append('<option value="' + item.Code + '">' + item.Title + '</option>');
                    });
                }
            );

        } else {
            $("#ddlSections").empty();
            $("#ddlSections").append('<option value="">' +
                "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                + '</option>');
        }

    });

    $("#btnSearch").click(function (e) {
        e.preventDefault();
        searchRequests();
    });


    $("#btnRefreshData").click(function (e) {
        e.preventDefault();
        searchRequests();
    });

    $("#btnReset").click(function (e) {
        e.preventDefault();
        ResetSearch();
    });

    $(document).on("blur", "[required]", function () {
        $(this).next("span").remove();
        if ($(this).val().trim() === '') {

            $(this).after('<span class="text-danger">' +
                "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,YouShouldEnterValueForThisField%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"

                + '    </span>');
        }
        else {
            $(this).next("span").remove();
        }

    });

    $(document).on("change", "[required]", function (e) {
        // if ($(this).val().trim() !== '') {
        //     $(this).next("span").remove();
        // }
        var isFormValid = true;
        for (var i = 0; i < $("[required]").length; i++) {
            $("[required]:eq(" + i + ")").next("span").remove();

            if ($("[required]:eq(" + i + ")").val().trim() == '') {
                $("[required]:eq(" + i + ")").after("<span class='text-danger'> <sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,YouShouldEnterValueForThisField%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></span>");
                isFormValid = false;
            }
        }
        if ($(".device-error").length > 0 || !isFormValid) {
            // $(".submitError").text(" بيانات قبول الطلب غير مكتمة برجاء إكمال البياات المطلوبة");

        }
        else {
            $(".submitError").text("");

        }
    });


    $("#btnSubmit").click(function (e) {
        showLoader();
        submitFlag = true;
        e.preventDefault();
        var isFormValid = true;
        for (var i = 0; i < $("[required]").length; i++) {
            $("[required]:eq(" + i + ")").next("span").remove();

            if ($("[required]:eq(" + i + ")").val().trim() == '') {
                $("[required]:eq(" + i + ")").after("<span class='text-danger'> <sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,YouShouldEnterValueForThisField%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></span>");
                isFormValid = false;
            }
        }

        var matrialsNotes = $("#txtNote").val();
        matrialsNotes = $.trim(matrialsNotes);
        var matrialsNotesObject = "";
        if (matrialsNotes == "") {
            matrialsNotesObject = "لا يوجد ملاحظات";
        }
        else {
            matrialsNotesObject = $("#txtNote").val();
        }
        var initialApprovePostData = {
            "Group": $("#hdnDepartment").val(),
            "ReqID": $("#visitRequestIDPreview").text(),
            "Status": "1",
            "StatusNote": matrialsNotesObject,
            "Gate": $("#ddlGates").val()
        };
        $("#txtNote").val("");
        if ($(".device-error").length > 0) {
            $('.device-error').removeClass("hidden");
            $(".submitError").text(" بيانات قبول الطلب غير مكتمة برجاء إكمال البياات المطلوبة");


        }
        else if (!isFormValid) {
            $(".submitError").text(" بيانات قبول الطلب غير مكتمة برجاء إكمال البياات المطلوبة");
            hideLoader();
            return;
        }
        else {
            $("#btnSubmit").attr("disabled", true);
            $("#myModal").css('z-index', 0)
            $(".submitError").text("");
            $(".text-danger").text("");
            postInitialRequestApprove(JSON.stringify(initialApprovePostData), function (data) {
                var requestObject =
                {
                    ID: $("#visitRequestIDPreview").text(),
                    VisitMessage: $("#visitMessageTitlePreview").text(),
                    VisitStartDate: $("#visitStartDatePreview").text(),
                    VisitTime: $("#visitTimePreview").text(),
                    VisitEndDate: $("#visitEndDatePreview").text(),
                    VisitReason: $("#visitReasonIDPreview").text(),
                    UserName: $("#applicantNamePreview").text(),
                    ApplicantRank: $("#applicantTitlePreview").text(),
                    ApplicantAdministration: $("#applicantDepartmentPreview").text(),
                    ApplicantSection: $("#applicantSectionPreview").text(),
                    ISDeleted: false,
                    VisitPersons: []
                };


                var visitorsCount = $(".request-visitors-review .visitorRow").length;
                var deviceCount = 0;
                var checkedStatus;

                requestObject.VisitPersons = [];
                for (var i = 0; i < visitorsCount; i++) {
                    checkedStatus = $(".visitorRow:eq(" + i + ") .visitor-checkbox:eq(0)").prop("checked");
                    if (checkedStatus == false)
                        continue;
                    visitor = {};
                    visitor.ID = $(".visitorRow:eq(" + i + ") .visitor-Id").val();
                    visitor.FirstName = $(".visitorRow:eq(" + i + ") .visitor-FirstName").text();
                    visitor.FatherName = $(".visitorRow:eq(" + i + ") .visitor-FatherName").text();
                    visitor.FamilyName = $(".visitorRow:eq(" + i + ") .visitor-FamilyName").text();
                    visitor.LastName = $(".visitorRow:eq(" + i + ") .visitor-LastName").text();
                    visitor.Nationality = $(".visitorRow:eq(" + i + ") .visitor-NationalityID").val();
                    visitor.IdentityType = $(".visitorRow:eq(" + i + ") .visitor-IdentityTypeID").val();
                    visitor.IdentityNumber = $(".visitorRow:eq(" + i + ") .visitor-IdentityNumber").text();
                    visitor.WorkingPlace = $(".visitorRow:eq(" + i + ") .visitor-WorkingPlace").text();
                    visitor.VisitTime = $(".visitorRow:eq(" + i + ") .visitor-VisitTime").text();
                    visitor.IsDeleted = false;


                    deviceCount = $(".visitorRow:eq(" + i + ") .deviceRow").length;
                    if (deviceCount > 0) {
                        visitor.VisitDevices = [];
                        for (var j = 0; j < deviceCount; j++) {
                            checkedStatus = $(".visitorRow:eq(" + i + ") .deviceRow:eq(" + j + ") .device-checkbox:eq(0):checked").val() == "yes";
                            if (checkedStatus == false)
                                continue;
                            device = {};
                            device.ID = $(".visitorRow:eq(" + i + ") .deviceRow:eq(" + j + ") .device-Id").val();
                            device.DeviceType = $(".visitorRow:eq(" + i + ") .deviceRow:eq(" + j + ") .device-DeviceType").text();
                            device.DeviceNumber = $(".visitorRow:eq(" + i + ") .deviceRow:eq(" + j + ") .device-DeviceNumber").text();
                            device.ManufacturingCompanyName = $(".visitorRow:eq(" + i + ") .deviceRow:eq(" + j + ") .device-ManufacturingCompanyName").text();
                            device.NotesAboutDevice = $(".visitorRow:eq(" + i + ") .deviceRow:eq(" + j + ") .device-NotesAboutDevice").text();

                            visitor.VisitDevices.push(device);
                        }
                    }
                    requestObject.VisitPersons.push(visitor);

                }
                postFinalRequestForApprove(JSON.stringify(requestObject), function (result) {
                    if (result.statusCode == 1) {
                        $('#myModal').modal('hide');

                        $(".reviewCol").click(function () {
                            $(this).toggleClass("opend");
                        });
                        $("#senddModel").modal({ backdrop: 'static', keyboard: false });
                        $("#btnSubmit").attr("disabled", false);
                        $("#myModal").css('z-index', 1050);
                        searchRequests();
                    }
                    else {
                        alert(result.statusMessage);
                        hideLoader();
                        $("#btnSubmit").attr("disabled", false);
                    }

                });
            });
        }
        $("#myModal").css('z-index', 1050);
    });
    var submitFlag = false;
    $(document).on("change", ".visitor-checkbox[type=checkbox]", function (event) {
        if ($(this).prop("checked") == true) {
            $("#btnSubmit").attr("disabled", false);
            $(this).closest('.visitorRowData').find('.text-danger').addClass("hidden");
            $(this).closest('.visitorRowData').find('.text-danger').addClass("device-error");
            $(this).closest('.visitorRowData').find('.text-danger').text("برفقة الزائر جهاز آمل الموافقة عليه أو رفض دخوله");
            if ($('.device-checkbox[data-person="' + $(this).attr("data-person") + '"]').length == 0) {
                $(this).closest('.visitorRowData').find('.text-danger').text("");
                $(this).closest('.visitorRowData').find('.text-danger').addClass("hidden");
                $(this).closest('.visitorRowData').find('.text-danger').removeClass("device-error")
            }

        }

        if ($(this).prop("checked") == false) {
            $("#btnSubmit").attr("disabled", true);
            $(this).closest('.visitorRowData').find('.text-danger').addClass("hidden");
            $(this).closest('.visitorRowData').find('.text-danger').removeClass("device-error");
            $('.device-checkbox[data-person="' + $(this).attr("data-person") + '"]').prop('checked', false);

        }
        $(".submitError").text("");
        $('.device-error').addClass("hidden");

    });
    $(document).on("change", ".device-checkbox[type=radio]", function (event) {
        $("#btnSubmit").attr("disabled", false);
        $('.visitor-checkbox[data-person="' + $(this).attr("data-person") + '"]').prop('checked', true);
        var numberOfAll = ($('.device-checkbox[data-person="' + $(this).attr("data-person") + '"]')).length / 2;
        if (($('.device-checkbox[data-person="' + $(this).attr("data-person") + '"]:checked')).length == numberOfAll) {

            $(this).closest('.visitorRowData').find('.text-danger').text("");
            $(this).parent().parent().parent().parent().parent().parent().find('.text-danger').addClass("hidden");
            $(this).parent().parent().parent().parent().parent().parent().find('.text-danger').removeClass("device-error")
            for (var i = 0; i < $("[required]").length; i++) {
                $("[required]:eq(" + i + ")").next("span").remove();

                if ($("[required]:eq(" + i + ")").val().trim() == '') {
                    $("[required]:eq(" + i + ")").after("<span class='text-danger'> <sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,YouShouldEnterValueForThisField%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></span>");
                    isFormValid = false;
                }
            }
        }
        else {

            $(this).parent().parent().parent().parent().parent().parent().find('.text-danger').text("برفقة الزائر جهاز آمل الموافقة عليه أو رفض دخوله");
            if (submitFlag)
                $(this).parent().parent().parent().parent().parent().parent().find('.text-danger').removeClass("hidden");
            else {
                $(this).parent().parent().parent().parent().parent().parent().find('.text-danger').addClass("hidden");
            }
            $(this).parent().parent().parent().parent().parent().parent().find('.text-danger').addClass("device-error")
            var isFormValid = true;
            for (var i = 0; i < $("[required]").length; i++) {
                $("[required]:eq(" + i + ")").next("span").remove();

                if ($("[required]:eq(" + i + ")").val().trim() == '') {
                    if (submitFlag)
                        $("[required]:eq(" + i + ")").after("<span class='text-danger'> <sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,YouShouldEnterValueForThisField%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></span>");
                    isFormValid = false;
                }
            }

        }

        if ($(".device-error").length > 0) {
            // $(".submitError").text(" بيانات قبول الطلب غير مكتمة برجاء إكمال البياات المطلوبة");

        }
        else if (!isFormValid) {
            if (submitFlag)
                $(".submitError").text(" بيانات قبول الطلب غير مكتمة برجاء إكمال البياات المطلوبة");
            return;
        }
        else {
            $(".submitError").text("");
            $('.device-error').addClass("hidden");

        }

    });


    function ResetSearch() {
        $("#txtRequestNumber").val("");
        $("#txtRequestDate").val("");
        $("#txtVisitDate").val("");
        $("#txtApplicantName").val("");
        $("#txtVisitorFirstName").val("");
        $("#txtVisitorFatherName").val("");
        $("#txtVisitorFamilyName").val("");
        $("#txtVisitorLastName").val("");
        $("#txtIdentityNumber").val("");
        $("#ddlNationalities").val(0);
        $("#ddlDepartments").val("");
        $("#ddlSections").val("");
        $("#txtRequestDate").next().text(" ");
        $("#txtVisitDate").next().text(" ");
    }
    function searchRequests() {

        var requestNumber = $("#txtRequestNumber").val() !== "" ? $("#txtRequestNumber").val() : 0;

        var requestRequestDateConverted = "";
        if ($("#txtRequestDate").val() != "") {

            requestRequestDateConverted = HijriJS.toGregorian($("#txtRequestDate").val(), "/");
            var day = requestRequestDateConverted.getDate();
            var month = requestRequestDateConverted.getMonth() + 1;
            var year = requestRequestDateConverted.getFullYear();

            requestRequestDateConverted = month + "/" + day + "/" + year;
        }
        var requestRequestDateConverted = requestRequestDateConverted;

        var visitDateConverted = "";
        if ($("#txtVisitDate").val() != "") {

            visitDateConverted = HijriJS.toGregorian($("#txtVisitDate").val(), "/");
            var day = visitDateConverted.getDate();
            var month = visitDateConverted.getMonth() + 1;
            var year = visitDateConverted.getFullYear();

            visitDateConverted = month + "/" + day + "/" + year;
        }
        var visitDateConverted = visitDateConverted;



        var applicantName = $("#txtApplicantName").val();
        var visitorFirstName = $("#txtVisitorFirstName").val();
        var visitorFatherName = $("#txtVisitorFatherName").val();
        var visitorFamilyName = $("#txtVisitorFamilyName").val();
        var visitorLastName = $("#txtVisitorLastName").val();
        var nationality = $("#ddlNationalities").val();
        var departmentCode = $("#ddlDepartments").val();
        var sectionCode = $("#ddlSections").val();
        var identityNumber = $("#txtIdentityNumber").val();
        if ($("#txtVisitorFirstName").val() != "" || $("#txtVisitorFatherName").val() != "" || $("#txtVisitorFamilyName").val() != "" || $("#txtVisitorLastName").val() != "") {
            search = true;
            $(".count").hide();
        }
        else {
            search = false;
            $(".count").show();
        }
        var searchRequestsWithFilterationsAPI$ = apiRootAddress + "VisitRequest/SearchRequests?ListSiteUrl=" + listSiteURL + "&UserID=0&RequestID=" + requestNumber +
            "&RequestCreateDate=" + requestRequestDateConverted + "&RequestVisitDate=" + visitDateConverted + "&ApplicantName=" + applicantName.trim() +
            "&FirstName=" + visitorFirstName.trim() + "&FatherName=" + visitorFatherName.trim() + "&FamilyName=" + visitorFamilyName.trim() + "&LastName=" + visitorLastName.trim() + "&Nationality=" + nationality + "&DepartmentCode=" + departmentCode + "&SectionCode=" + sectionCode + "&IdentyNumber=" + identityNumber + "&RequestState=0&OnlyToday=true";
        getDataByAPI(searchRequestsWithFilterationsAPI$, function (data, status, xhr) {
            if (xhr.getResponseHeader('StatusCode') == 1) {
                hideGeneralErrorMessage();
                renderSearchResult(data, search);
            }
            else {
                //Show Error message
                showGeneralErrorMessage();
            }
        });
    }

    var Hijrimonths = ["محرم", "صفر", "ربيع الأول", "ربيع الثاني", "جمادي الأول", "جمادي الثاني",
        " رجب", "شعبان", "رمضان", "شوال", "ذو القعدة", "ذو الحجة"];
    function GetHijriDate(date) {
        var SplitedDate = (date.split("T")[0]).split("-");
        var s = HijriJS.gregorianToHijri(SplitedDate[0], SplitedDate[1], SplitedDate[2]);
        var stringmonth = Hijrimonths[s.month - 1];
        return s.day + "-" + stringmonth + "-" + s.year
    }
    function GetHijriDateWithSlashFormat(date) {
        var SplitedDate = (date.split("T")[0]).split("-");
        var s = HijriJS.gregorianToHijri(SplitedDate[0], SplitedDate[1], SplitedDate[2])
        return s.day + "/" + s.month + "/" + s.year
    }
    function renderSearchResult(data, search) {
        // search = false;

        $(".PaggerDiv").show();
        $("#dataTable > tbody").empty();

        if (data == null || data.length == 0) {
            $("#dataTable > tbody").append("<tr><td><sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,ThereIsNoData	%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></td></tr>");
            $(".PaggerDiv").hide();

            $("#RowNumb").text("0");
            return;
        }

        var datacount = 0;
        groupedRequestsData = groupBy(data, 'RequestID');
        groupedRequestsData = Object.keys(groupedRequestsData).map(function (itm) { return groupedRequestsData[itm]; }).reverse();

        for (var arrayInside in groupedRequestsData) {
            var HTML = "";
            var innerDivs = "";
            for (var i = 0; i < groupedRequestsData[arrayInside].length; i++) {
                if (i >= 0) {
                    visitorFullName = groupedRequestsData[arrayInside][i].FirstName + " " + groupedRequestsData[arrayInside][i].FatherName + " " + groupedRequestsData[arrayInside][i].FamilyName + " " + groupedRequestsData[arrayInside][i].LastName;
                    innerDivs += '<div class="col-md-4"><div class="inner-card"><p class="title">' + visitorFullName + '</p><span class="nationality"><span class="nation-icon"></span> ' + groupedRequestsData[arrayInside][i].NationalityValue + '</span><span class="visitorid"><span class="id-icon"></span>' + groupedRequestsData[arrayInside][i].UserIdentyTypeValue + '</span></div></div>';
                }
            }


            for (var i = 0; i < groupedRequestsData[arrayInside].length; i++) {

                if (i === 0) {
                    //HTML = "";
                    var requestID = groupedRequestsData[arrayInside][i].RequestID;
                    var ApplicantName = groupedRequestsData[arrayInside][i].ApplicantName;
                    var supervisorStatus = groupedRequestsData[arrayInside][i].SupervisorStatus;

                    var supervisorStatusText = supervisorStatus === "" ? "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,InProgress%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" : supervisorStatus === "1" ? "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Accepted%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" : "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Rejected	%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                    var supervisorStatusClass = supervisorStatus === "" ? "waiting" : supervisorStatus === "1" ? "accepted" : "rejected";
                    //   var createDateConverted = HijriJS.toGregorian($("#txtVisitStartDate").val(), "/");
                    //   createDateConverted.setMonth(createDateConverted.getMonth() - 1);
                    //  requestObject.VisitStartDate = createDateConverted;
                    var visitorsCount = groupedRequestsData[arrayInside].length;
                    var departmentName = getDepartmentName(groupedRequestsData[arrayInside][i].ApplicantAdministration, departmentList);
                    var sectionName = "";
                    console.log('date', groupedRequestsData[arrayInside][i].CreateDate.split("T")[1]);
                    var VisitDate = GetHijriDate(groupedRequestsData[arrayInside][i].VisitDate);
                    var CreationDate = GetHijriDate(groupedRequestsData[arrayInside][i].CreateDate);
                    var userSectionCode = groupedRequestsData[arrayInside][i].ApplicantSection;
                    var userDepartmentCode = groupedRequestsData[arrayInside][i].ApplicantAdministration;

                    if (userSectionCode != null && userDepartmentCode != null) {
                        sectionName = getSectionName(userSectionCode, userDepartmentCode, sectionList);
                    }

                    HTML += '<tr id="mainTable" role="button" data-toggle="collapse" >'
                        + '<td>' + requestID + '</td>'
                        + '<td>' + GetHijriDate(groupedRequestsData[arrayInside][i].CreateDate) + ' <b>(' + convertTime24to12(groupedRequestsData[arrayInside][i].CreateDate.split("T")[1]) + ')</b></td>'
                        + '<td>' + GetHijriDate(groupedRequestsData[arrayInside][i].VisitDate) + '</td>'
                        + '<td>' + ApplicantName + '</td>'
                        + '<td>' + departmentName + '</td>'
                        + '<td>' + sectionName + '</td>';
                    if (!search) {
                        HTML += '<td>' + visitorsCount + '</td>';
                    }

                    var obj = {
                        id: requestID,
                        requestDate: CreationDate,
                        visitDate: VisitDate,
                        applicantName: ApplicantName
                    };
                    // HTML += `<td class="viewoption"><a class="options-list review" href="javascript:viewRequestItem(` + requestID + `)"></a><a class="options-list accepted" href="javascript:viewRequestItemForAction(` + requestID + `)"></a><a class="options-list rejected" href="javascript:openRejectRequestModel(` + requestID + `,'` + CreationDate + `','` + VisitDate + `','` + ApplicantName + `')"></a><span class="options-list showmore" role="button" data-toggle="collapse" href="#row` + requestID + `" aria-expanded="false" aria-controls="row` + requestID + `"></span></td>`
                    HTML += "<td class='viewoption'><a title='<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,ViewVisit%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>'  class='options-list review' href='javascript:viewRequestItem(" + requestID + ")'></a><a title='<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,AcceptVisit%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>' class='options-list accepted' href='javascript:viewRequestItemForAction(" + requestID + ")'></a><a title='<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,RejectVisit%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>' class='options-list rejected' href='javascript:openRejectRequestModel(" + JSON.stringify(obj) + " )'></a><span class='options-list showmore' role='button' data-toggle='collapse' href='#row" + requestID + "' aria-expanded='false' aria-controls='row" + requestID + "'></span></td>"

                        + '</tr>';


                    HTML += '<tr class="rowhidden">' +

                        '<td colspan="7" class="hiddenRow">' +
                        '<div class="collapse" style="padding: 8px 29px;" id="row' + requestID + '">' +
                        '<div class="row">';

                    HTML += innerDivs;

                    HTML += '</div>' +
                        '</div>' +
                        '</td>' +
                        '</tr>';
                    datacount++;
                    break;
                }
            }

            $("#RowNumb").text(datacount);
            $("#dataTable > tbody").append(HTML);

        }
        $(document).ready(function () {

            var AllData = $("#tablebody.not-printbody tr");
            // pagersize = document.getElementById("selnumb").value;

            pagersize = 16;


            GetPageNumber(1);
            function paginate(array, page_size, page_number) {
                --page_number; // because pages logically start with 1, but technically with 0
                return array.slice(page_number * page_size, (page_number + 1) * page_size);
            }

            if (AllData.length > pagersize) {
                $(".PaggerDiv").html('');
                $(".PaggerDiv").pagination({
                    items: AllData.length,
                    ellipsePageSet: false,
                    itemsOnPage: pagersize,
                    prevText: "<",
                    nextText: ">",
                    onPageClick: function () {
                        GetPageNumber($(".PaggerDiv").pagination('getCurrentPage'));

                        return false;
                    },
                    cssStyle: 'light-theme'
                });
            } else {
                $(".PaggerDiv").html('');
            }
            function GetPageNumber(pageNumber) {
                var Pageddata = paginate(AllData, pagersize, pageNumber)
                $('#tablebody.not-printbody').empty();
                for (var i = 0; i < Pageddata.length; i++) {
                    $("#tablebody.not-printbody ").append(Pageddata[i].outerHTML);
                }
            }
        });
        hideLoader();

    }
    function openAcceptRequestModel(id, requestDate, visitDate, applicantName) {

        $("#hdnActionType").val("1");
        $("#actionModelLongTitle").text("<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,AcceptVisitRequest%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
        $("#btnActionText").text('قبول');
        $("#requestNumberAccept").text(id);
        $("#requestDateAccept").text(requestDate);
        $("#visitDateAccept").text(visitDate);
        $("#applicantNameAccept").text(applicantName);
        $("#ddlGates").val("");

        $('#actionModelCenter').modal({ backdrop: 'static', keyboard: false });
    }
    function viewRequestItem(rid) {
        //event.preventDefault();
        //event.stopPropagation();


        getRequest(rid, function (data) {
            request = data;
            var userDepartmentCode = request.ApplicantAdministration;

            var applicantDepartmentName = getDepartmentName(userDepartmentCode, departmentList);
            var userSectionCode = request.ApplicantSection;
            var sectionName = "";
            if (userSectionCode != null && userDepartmentCode != null) {
                sectionName = getSectionName(userSectionCode, userDepartmentCode, sectionList);
            }
            $("#VisitNumb").text(request.ID);
            $("#visitMessageTitleView").text(request.VisitMessage);
            $("#visitStartDateView").text(GetHijriDate(request.VisitStartDate));
            $("#visitTimeView").text(request.VisitTime);
            $("#visitEndDateView").text(GetHijriDate(request.VisitEndDate));
            $("#visitReasonView").text(request.VisitReasonValue);
            $("#applicantNameView").text(request.UserName);
            $("#applicantTitleView").text(request.ApplicantRank);
            $("#applicantSectionView").text(sectionName);
            $("#applicantDepartmentView").text(applicantDepartmentName);



            var visitorsCount = request.VisitPersons.length;
            var deviceCount = 0;

            $(".request-visitors-view").empty();

            request.VisitPersons.forEach(function (visitor) {
                var elem = document.createElement("div");
                elem.classList.add("reviewCol");
                var visitorRowBody = '';
                visitorRowBody = '<div class="form-row">';
                visitorRowBody += '<div class="form-group info-data  col-md-8">';
                visitorRowBody += visitor.FirstName + ' ' + visitor.FatherName + ' ' + visitor.FamilyName + ' ' + visitor.LastName;
                visitorRowBody += '</div>';

                <%--visitorRowBody += '<div class="form-group info-data col-md-4">';
                visitorRowBody += '<p class="dateTime-label">  <i class=" mdi mdi-av-timer "></i> ' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,VisitTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '  :  ';
                visitorRowBody += '<span  class="time ">' + visitor.VisitTime + '</span>';
                visitorRowBody += '</p> </div>';--%>

                visitorRowBody += '<div class="form-group  col-md-4">';
                visitorRowBody += '<span class="nation-icon"></span>';
                visitorRowBody += '  <label class="col-form-label">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Nationality	%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + ' </label>';
                visitorRowBody += '<p class="info-data ">' + visitor.NationalityValue + ' </p>';
                visitorRowBody += '</div>';


                visitorRowBody += '<div class="form-group  col-md-4">';
                visitorRowBody += '<span class="ID-icon"></span>';
                visitorRowBody += '  <label class="col-form-label">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Identity%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + ' </label>';
                visitorRowBody += '<p class="info-data" >';
                visitorRowBody += '<span  >';
                visitorRowBody += visitor.IdentityNumber;
                visitorRowBody += '</span>';
                visitorRowBody += '<span class="numberid">';
                visitorRowBody += visitor.IdentityTypeValue;
                visitorRowBody += '</span>';
                visitorRowBody += '</p >';
                visitorRowBody += '</div>';


                if (visitor.WorkingPlace != "") {
                    visitorRowBody += '<div class="form-group  col-md-4">';
                    visitorRowBody += '<span class="work-icon"></span>';
                    visitorRowBody += ' <label class="col-form-label">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,WorkingPlace%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '  </label>';
                    visitorRowBody += '<p class="info-data">' + visitor.WorkingPlace + '</p>';
                    visitorRowBody += '</div>';
                }

                //End of form-row visitorRowData
                visitorRowBody += '</div>';


                visitorRowBody += '<div class="visitor-row-dev">';

                visitorRowBody += '<div class="form-row">';

                visitorRowBody += '<div class="form-group col-md-12   devices-title ">';
                visitorRowBody += '<span class="devices-icon"></span>';
                visitorRowBody += "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,AttachedDevices%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";


                visitorRowBody += '</div >';


                if (visitor.VisitDevices != null && visitor.VisitDevices.length > 0) {
                    visitor.VisitDevices.forEach(function (device) {
                        visitorRowBody += '<div class="devices" style="vertical-align: top">';

                        visitorRowBody += '<p class="devicetype info-data">';
                        visitorRowBody += '<span> ' + device.DeviceType + '  </span>';
                        if (device.ManufacturingCompanyName != "") {
                            visitorRowBody += '<span class="info-data">( ' + device.ManufacturingCompanyName + ' ) </span>';
                        }
                        visitorRowBody += '</p>';

                        if (device.DeviceNumber != "") {
                            visitorRowBody += '<p>';
                            visitorRowBody += '<span>' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,DeviceNumber%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + ' </span><span> : </span>';
                            visitorRowBody += device.DeviceNumber;
                            visitorRowBody += '</p>';
                        }

                        if (device.NotesAboutDevice != "") {
                            visitorRowBody += '<p>';
                            visitorRowBody += '<span> ' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Notes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</span><span> : </span>';
                            visitorRowBody += device.NotesAboutDevice;
                            visitorRowBody += '</p>';
                        }

                        visitorRowBody += '</div>';
                    });
                }
                else {
                    visitorRowBody += '<p class="welcome" >' +
                        "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,ThereIsNoDevicesForVisitor%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                        + '</p>';
                }

                visitorRowBody += '</div>';
                elem.innerHTML = visitorRowBody;
                $(".request-visitors-view").append(elem);
            });

            $('#actionModelCenter').modal({ backdrop: 'static', keyboard: false });
            hideLoader();
        });
    }

    function showSendMsg(Msg) {
        $(".daytext").text("");
        $("#MsgID").text(Msg);
        $('#sendModel').modal({ backdrop: 'static', keyboard: false });
    }
    function postInitialRequestApprove(requestData, callback) {
        var supervisorApproveAPI$ = apiRootAddress + 'VisitRequest/AprroveSecurity?ListSiteUrl=' + listSiteURL;

        $.ajax({
            url: supervisorApproveAPI$,
            type: 'POST',
            contentType: 'application/json',
            data: requestData,
            success: function (result) {

                callback(result);
            }

            ,
            error: function (err) {
                alert(err.statusText);
            },

            complete: function () {

            }

        });
    }
    function postFinalRequestForApprove(requestObjectData, callback) {
        var url = apiRootAddress + "VisitRequest/AddFinalAproveForRequest?ListSiteUrl=" + listSiteURL;
        $.ajax({
            url: url,
            type: 'POST',
            contentType: 'application/json',
            data: requestObjectData,
            success: function (result) {
                callback(result);
            }
            ,
            error: function (err) {
                alert(err.statusText);
            },

            complete: function () {

            }
        });
    }
    function rejectRequest(rid) {
        event.preventDefault();
        event.stopPropagation();
        if (confirm("هل تريد رفض هذا الطلب؟") == true) {

            var postData = {
                "Group": $("#hdnDepartment").val(),
                "ReqID": rid,
                "Status": "2",
                "StatusNote": "note",
                "Gate": 0
            };

            postInitialRequestApprove(JSON.stringify(postData), function (result) {
                if (result.statusCode == 1) {

                    searchRequests();
                    alert( "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,ProcessCompletedSuccessfully%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
                }
                else {
                    alert(result.statusMessage);
                }
            });
        }
    }
    function openRejectRequestModel(obj) {
        $("#txtRejectComment").val("");
        $("#requestNumberReject").text(obj.id);
        $("#requestDateReject").text(obj.requestDate);
        $("#visitDateReject").text(obj.visitDate);
        $("#applicantNameReject").text(obj.applicantName);

        $('#rejectModelCenter').modal({ backdrop: 'static', keyboard: false });
    }
    $("#btnReject").click(function (e) {
        e.preventDefault();

        if ($("#txtRejectComment").val().trim() == "") {
            $("#txtRejectComment").next("span").remove();
            $("#txtRejectComment").after("<span class='text-danger'><sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,YouShouldEnterValueForThisField%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></span>");
            
            return;
        }
        else {
            $("#txtRejectComment").next("span").remove();
        }
        showLoader();
        $("#btnReject").attr("disabled", true);
        var postData = {
            "Group": $("#hdnDepartment").val(),
            "ReqID": $("#requestNumberReject").text(),
            "Status": "2",
            "StatusNote": $("#txtRejectComment").val(),
            "Gate": 0
        };


        postInitialRequestApprove(JSON.stringify(postData), function (result) {
            if (result.statusCode == 1) {
                $('#rejectModelCenter').modal('hide');
                $("#senddModel").modal({ backdrop: 'static', keyboard: false });
                searchRequests();
                $("#btnReject").attr("disabled", false);
            }
            else {
                alert(result.statusMessage);
                hideLoader();
                $("#btnReject").attr("disabled", false);
            }
        });
    });
    function viewRequestItemForAction(rid) {
        //  event.preventDefault();
        //  event.stopPropagation();
        submitFlag = false;
        $(".submitError").text("");
        $(".text-danger").text("");
        $("#btnSubmit").attr("disabled", true);
        $("#ddlGates").val("")
        getRequest(rid, function (data) {
            request = data;
            var userDepartmentCode = request.ApplicantAdministration;

            var applicantDepartmentName = getDepartmentName(userDepartmentCode, departmentList);
            var userSectionCode = request.ApplicantSection;
            var sectionName = "";
            if (userSectionCode != null && userDepartmentCode != null) {
                sectionName = getSectionName(userSectionCode, userDepartmentCode, sectionList);
            }
            $("#visitRequestIDPreview").text(request.ID);
            $("#visitMessageTitlePreview").text(request.VisitMessage);
            $("#visitStartDatePreview").text(GetHijriDate(request.VisitStartDate));
            $("#visitTimePreview").text(request.VisitTime);
            $("#visitEndDatePreview").text(GetHijriDate(request.VisitEndDate));
            $("#visitReasonPreview").text(request.VisitReasonValue);
            $("#visitReasonIDPreview").text(request.VisitReason);
            $("#applicantNamePreview").text(request.UserName);
            $("#applicantTitlePreview").text(request.ApplicantRank);
            $("#applicantSectionPreview").text(sectionName);
            $("#applicantDepartmentPreview").text(applicantDepartmentName);
            $("#txtNote").val("");


            var visitorsCount = request.VisitPersons.length;
            var deviceCount = 0;

            $(".request-visitors-review").empty();

            request.VisitPersons.forEach(function (visitor, i) {
                var elem = document.createElement("div");
                elem.classList.add("visitorRow");
                elem.classList.add("reviewCol");

                var visitorRowBody = '';

                visitorRowBody = '<div class="form-row visitorRowData">';
                visitorRowBody += '<div class="form-group col-md-1">';
                visitorRowBody += '<label class="labelcontainer"><input type="checkbox"  data-person="' + visitor.ID + '" class="visitor-checkbox" /><span class="checkmark"></span></label> '
                visitorRowBody += '</div>';

                visitorRowBody += '<div class="form-group col-md-1 hidden">';
                visitorRowBody += '<input type="hidden" class="visitor-Id" value="' + visitor.ID + '" />';
                visitorRowBody += '</div>';

                visitorRowBody += '<div class="form-group info-data   col-md-7">';
                visitorRowBody += '<span class="visitor-FirstName">' + visitor.FirstName + '   </span>';
                visitorRowBody += '<span>   </span>';
                visitorRowBody += '<span class="visitor-FatherName">' + visitor.FatherName + '</span>';
                visitorRowBody += '<span>   </span>';
                visitorRowBody += '<span class="visitor-FamilyName">' + visitor.FamilyName + '</span>';
                visitorRowBody += '<span>   </span>';
                visitorRowBody += '<span class="visitor-LastName">' + visitor.LastName + '</span>';
                visitorRowBody += '<p class="text-danger">  </p>';
                visitorRowBody += '</div>';



                visitorRowBody += '<div class="form-group info-data  col-md-4">';
                visitorRowBody += '<span class="nation-icon"></span>';
                visitorRowBody += '  <label class="col-form-label">' +"<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Nationality	%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + ' </label>';
                visitorRowBody += '<input type="hidden" class="visitor-NationalityID" value="' + visitor.Nationality + '" /><p class="visitor-Nationality">' + visitor.NationalityValue + '</p>';
                visitorRowBody += '</div>';

                visitorRowBody += '<div class="form-group info-data  col-md-4">';
                visitorRowBody += '<span class="ID-icon"></span>';
                visitorRowBody += '  <label class="col-form-label">' +"<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Identity%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + ' </label>';
                visitorRowBody += '<p class="info-data">';
                visitorRowBody += '<span class="visitor-IdentityNumber">' + visitor.IdentityNumber + '</span>';
                visitorRowBody += '<input type="hidden" class="visitor-IdentityTypeID" value="' + visitor.IdentityType + '" /><span class="numberid visitor-IdentityType">' + visitor.IdentityTypeValue + '</span>';

                visitorRowBody += '</p >'
                visitorRowBody += '</div>';


                if (visitor.WorkingPlace != "") {
                    visitorRowBody += '<div class="form-group info-data  col-md-4">';
                    visitorRowBody += '<span class="work-icon"></span>';
                    visitorRowBody += '  <label class="col-form-label"> ' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,WorkingPlace%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + ' </label>';
                    visitorRowBody += '<p class="visitor-WorkingPlace">' + visitor.WorkingPlace + '</p>';
                    visitorRowBody += '</div>';
                }


                //End of form-row visitorRowData
                visitorRowBody += '</div>';

                visitorRowBody += '<div class=" visitor-row-devices">';
                visitorRowBody += '<div class="form-row">';
                visitorRowBody += '<div class="form-group col-md-12  devices-title">';
                visitorRowBody += '<span class="devices-icon"></span>';
                visitorRowBody += "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,AttachedDevices%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                visitorRowBody += '</div>';
                visitorRowBody += '</div>';
                var deviceIndex = -1;
                if (visitor.VisitDevices != null && visitor.VisitDevices.length > 0) {
                    visitor.VisitDevices.forEach(function (device) {
                        deviceIndex++;
                        visitorRowBody += '<div class="deviceRow devices">';

                        visitorRowBody += '<div class="innercheck">';
                        // visitorRowBody += '<label class="labelcontainer"><input type="checkbox" checked="checked" class="device-checkbox" data-person="' + visitor.ID + '" /><span class="checkmark"></span></label>'
                        visitorRowBody += ' <p class="have-materials"> ';
                        visitorRowBody += '<label class="labelRadiocontainer"><input class="device-checkbox" type="radio" data-person="' + visitor.ID + '"  name="' + visitor.ID + '' + deviceIndex + '" value="yes"/><span class="checkmark"></span></label>';
                        visitorRowBody += '<label class="labelRadiocontainer"><input class="device-checkbox" type="radio" data-person="' + visitor.ID + '"  name="' + visitor.ID + '' + deviceIndex + '" value="No"/><span class="checkmark"></span>   </label>';
                        visitorRowBody += '</p>';
                        visitorRowBody += '</div>';

                        visitorRowBody += '<div class="form-group  hidden">';
                        visitorRowBody += '<input type="text" class="device-Id" value="' + device.ID + '" />';
                        visitorRowBody += '</div>';

                        visitorRowBody += '<p class="devicetype info-data">';
                        visitorRowBody += '<span class="device-DeviceType">' + device.DeviceType + '</span>';
                        if (device.ManufacturingCompanyName != "") {
                            visitorRowBody += ' ( ';
                            visitorRowBody += '<span class="info-data device-ManufacturingCompanyName">' + device.ManufacturingCompanyName + '</span>';
                            visitorRowBody += ' ) ';
                        }

                        visitorRowBody += '</p>';

                        if (device.DeviceNumber != "") {
                            visitorRowBody += '<p>';
                            visitorRowBody += '<span> ' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,DeviceNumber	%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</span><span> : </span>';
                            visitorRowBody += '<span class="device-DeviceNumber">' + device.DeviceNumber + '</span>';
                            visitorRowBody += '</p>';
                        }

                        if (device.NotesAboutDevice != "") {
                            visitorRowBody += '<p>';
                            visitorRowBody += '<span> ' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Notes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + ' </span><span> : </span>';
                            visitorRowBody += '<span class="device-NotesAboutDevice">' + device.NotesAboutDevice + '</span>';
                            visitorRowBody += '</p>';
                        }

                        visitorRowBody += '<br /></div>';
                    });
                }
                else {
                    visitorRowBody += '<p class="welcome" style="padding:5px 20px;color:#333333"> ' +"<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,ThereIsNoDevicesForVisitor%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '  </p>';
                }

                visitorRowBody += '</div>';
                elem.innerHTML = visitorRowBody;
                $(".request-visitors-review").append(elem);
            });
            $('#myModal').modal({ backdrop: 'static', keyboard: false });
            $(".reviewCol").click(function () {
                $(this).toggleClass("opend");
            });
            hideLoader();
        });

    }
    function isNumber(evt) {
        var iKeyCode = (evt.which) ? evt.which : evt.keyCode
        if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57)) {
            return false;

        }

        return true;
    }

    function getRequest(id, callback) {
        var visitReasonsDataAPI$ = apiRootAddress + "VisitRequest/GetRequestDetails?ListSiteUrl=" + listSiteURL + "&RequestID=" + id;
        getDataByAPI(
            visitReasonsDataAPI$,
            function (data) {
                callback(data);
            }
        );
    }
    $("#showSearch").click(function () {
        $("#SearchOptions").toggleClass("is-opend");
    })
    $('#sendModel').on('hidden.bs.modal', function () {
        window.location.href = "default.aspx";
    })

</script>

