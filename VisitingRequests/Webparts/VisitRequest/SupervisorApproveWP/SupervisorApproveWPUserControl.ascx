<%@ Assembly Name="VisitRequest, Version=1.0.0.0, Culture=neutral, PublicKeyToken=7d812edf42fd645f" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SupervisorApproveWPUserControl.ascx.cs" Inherits="VisitRequest.SupervisorApproveWP.SupervisorApproveWPUserControl" %>

<asp:HiddenField ID="hdnAPIRootURL" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hdnWFWebUrl" runat="server" ClientIDMode="Static" />

<asp:HiddenField ID="hdnDepartment" runat="server" ClientIDMode="Static" />
<style>
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
                        repeatCount="indefinite"></animate>
                </rect>
            </g>
            <g transform="rotate(30 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.8333333333333334s"
                        repeatCount="indefinite"></animate>
                </rect>
            </g>
            <g transform="rotate(60 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.75s"
                        repeatCount="indefinite"></animate>
                </rect>
            </g>
            <g transform="rotate(90 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.6666666666666666s"
                        repeatCount="indefinite"></animate>
                </rect>
            </g>
            <g transform="rotate(120 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.5833333333333334s"
                        repeatCount="indefinite"></animate>
                </rect>
            </g>
            <g transform="rotate(150 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.5s"
                        repeatCount="indefinite"></animate>
                </rect>
            </g>
            <g transform="rotate(180 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.4166666666666667s"
                        repeatCount="indefinite"></animate>
                </rect>
            </g>
            <g transform="rotate(210 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.3333333333333333s"
                        repeatCount="indefinite"></animate>
                </rect>
            </g>
            <g transform="rotate(240 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.25s"
                        repeatCount="indefinite"></animate>
                </rect>
            </g>
            <g transform="rotate(270 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.16666666666666666s"
                        repeatCount="indefinite"></animate>
                </rect>
            </g>
            <g transform="rotate(300 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.08333333333333333s"
                        repeatCount="indefinite"></animate>
                </rect>
            </g>
            <g transform="rotate(330 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="0s"
                        repeatCount="indefinite"></animate>
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
                        <input type="text" id="txtRequestNumber" class="form-control"
                            onkeypress="javascript:return isNumber(event)" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group ">
                        <label for="txtRequestDate" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequestDate %>"></asp:Literal>
                        </label>
                        <input type="text" id="txtRequestDate" class="form-control textPicker" autocomplete="off" />
                        <label class="daytext"></label>

                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group ">
                        <label for="txtVisitDate" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,visitEnterDate %>">
                            </asp:Literal>
                        </label>
                        <input type="text" id="txtVisitDate" class="form-control textPicker" autocomplete="off" />
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
                <div class="col-md-6">
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
            <div class="table-responsive formLayout-table printedtable">

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
                <table id="dataTable" class="table ">
                    <thead>
                        <tr class="active">
                            <th class="col-xs-2"><strong>
                                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequesrtNumber %>">
                                    </asp:Literal>
                                </strong></th>
                            <th class="col-xs-2"><strong>
                                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequestOwnerName %>">
                                    </asp:Literal>
                                </strong></th>
                            <th class="col-xs-2"><strong>
                                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequestDate %>">
                                    </asp:Literal>
                                </strong></th>
                            <th class="col-xs-6 count"><strong>
                                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,visitEnterDate %>">
                                    </asp:Literal>
                                </strong></th>
                            <th class="col-xs-2">
                                <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitorsCount %>">
                                </asp:Literal>
                            </th>
                            <th class="viewoption">
                             
                               
                            </th>

                        </tr>
                    </thead>
                    <tbody id="tablebody">
                    </tbody>
                </table>
            </div>
        </div>

        <div class="table-responsive formLayout-table ">


            <table id="dataTable" class="table ">
                <thead>
                    <tr class="active">
                        <th class="col-xs-2"><strong>
                                <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequesrtNumber %>">
                                </asp:Literal>
                            </strong></th>
                        <th class="col-xs-2"><strong>
                                <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequestOwnerName %>">
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
                        <th class="col-xs-2 count">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitorsCount %>"></asp:Literal>
                        </th>
                        <th class="viewoption" style="text-align: right">
                             <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequestView %>">
                                </asp:Literal>
                        </th>

                    </tr>
                </thead>
                <tbody id="tablebody" class="not-printbody">
                </tbody>
            </table>
            <div class='PaggerDiv'></div>
        </div>


    </div>
</div>

<div id="PrintArea"></div>
<div id="printAreaView" class="popupview">
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
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
                        <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitRequestReview %>">
                        </asp:Literal>

                        <p class="visitnumber">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequesrtNumber %>">
                            </asp:Literal>

                            : <span id="VisitNumb"></span>
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


                    <div class=" request-visitors-view">
                    </div>

                </div>

            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="actionModelCenter" tabindex="-1" role="dialog" aria-labelledby="actionModelCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered formLayout-model action-model" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <p class="modal-title" id="exampleModalLongTitleAction">
                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,AcceptVisitRequest %>"></asp:Literal>
                </p>
                <p class="visitnumber">
                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequesrtNumber %>"></asp:Literal>

                    : <span id="requestNumberAccept"></span>
                </p>

                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <input type="hidden" id="hdnActionType" />



                <div class="visitinfo">
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <span class="info-data" id="applicantNameAccept"></span>
                        </div>
                        <div class="form-group col-md-4">
                            <i class=" mdi mdi-calendar "></i>
                            <label class="col-form-label">
                                <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequestDate %>">
                                </asp:Literal>
                            </label>
                            <p id="requestDateAccept" class="info-data"></p>
                        </div>
                        <div class="form-group col-md-4">
                            <i class=" mdi mdi-calendar "></i>
                            <label class="col-form-label">
                                <asp:Literal runat="server" Text="<%$Resources:VisitRequest,visitEnterDate %>">
                                </asp:Literal>
                            </label>
                            <p id="visitDateAccept" class="info-data"></p>
                        </div>

                    </div>
                </div>
                <div class="heading-title">
                    <p>
                        <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitorsDataa %>"></asp:Literal>
                    </p>
                </div>


                <div class=" request-visitors-view">
                </div>

                <div class="form-row">
                    <div class="col-md-7">
                        <p class="welcome">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,Notes %>"></asp:Literal>

                        </p>
                        <textarea id="txtAcceptComment" class="form-control" cols="50" rows="5">

                        </textarea>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" id="btnDoAction" class="btn preview-btn send-btn" data-toggle="modal"
                    data-target="#acceptModelCenter"><span id="btnActionText"></span></button>
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
                    إرسال الرد على الطلب
                </p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p id="MsgID">
                    <asp:Literal runat="server" Text="تم إرسال الرد بنجاح"></asp:Literal>
                </p>
            </div>

        </div>

    </div>

</div>
<script src="/modwf/style Library/branding/js/general/helpers.js"></script>
<script type="text/javascript">

    var search = false;
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

    var apiRootAddress = $("#hdnAPIRootURL").val();
    var listSiteURL = $("#hdnWFWebUrl").val();
    var currentUserId = _spPageContextInfo.userId;
    var departmentList;
    var sectionList;
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
        getAllDepartments(
            apiRootAddress,
            function (data) {
                departmentList = data;
                $("#ddlDepartments").append('<option value="">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>');
                data.forEach(function (item) {
                    $("#ddlDepartments").append('<option value="' + item.Code + '">' + item.Title + '</option>');
                });
            }
        );
        $("#ddlSections").append('<option value="">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>');
        getAllSections(
            apiRootAddress,
            function (data) {
                sectionList = data;
            }
        );
        getAllStatuses(
            apiRootAddress,
            function (data) {
                $("#ddlStatuses").append('<option value="">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>');
                data.forEach(function (item) {
                    $("#ddlStatuses").append('<option value="' + item.Code + '">' + item.Title + '</option>');
                });
            }
        );

        var searchRequestsAPI$ = apiRootAddress + "VisitRequest/SearchRequests?ListSiteUrl=" + listSiteURL + "&UserID=0&RequestID=0&RequestCreateDate=&RequestVisitDate=&ApplicantName=&FirstName=&FatherName&FamilyName&LastName=&Nationality=0&DepartmentCode=&SectionCode=&IdentyNumber=&RequestState=&OnlyToday=true&Department=" + $("#hdnDepartment").val();

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
            if ($(this).val().trim() == "") {

                $(this).after('<span class="text-danger">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,YouShouldEnterValueForThisField%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + ' </span>');
            }
            else {
                $(this).next("span").remove();
            }

        });

        $(document).on("change", "[required]", function (e) {
            if ($(this).val().trim() !== '') {
                $(this).next("span").remove();
            }
        });


        $("#btnDoAction").click(function (e) {
            e.preventDefault();
            showLoader();
            var isFormValid = true;
            for (var i = 0; i < $("[required]").length; i++) {
                $("[required]:eq(" + i + ")").next("span").remove();

                if ($("[required]:eq(" + i + ")").val().trim() === '') {
                    $("[required]:eq(" + i + ")").after("<span class='text-danger'>" + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,YouShouldEnterValueForThisField%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + " </span>");
                    isFormValid = false;
                }
            }
            if (!isFormValid) {
                hideLoader();
                return;
            }


            $("#btnDoAction").attr("disabled", true);
            var requestData = {
                "Group": "DEV",
                "ReqID": $("#requestNumberAccept").text(),
                "Status": $("#hdnActionType").val(),

                "StatusNote": $("#txtAcceptComment").val() == "" ? "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,ThereIsNoNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" : $("#txtAcceptComment").val()
            };
            $('#actionModelCenter').modal('hide');
            $("#sendModel").modal({ backdrop: 'static', keyboard: false });
            doRequestAction(JSON.stringify(requestData), function () {
                //  $('#actionModelCenter').modal('hide');
                hideLoader();
            });

        });
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
        $("#txtRequestDate").next().text(" ");
        $("#txtVisitDate").next().text(" ");
    }
    function searchRequests() {

        var requestNumber = $("#txtRequestNumber").val() !== "" ? $("#txtRequestNumber").val() : 0;
        //var requestRequestDate = $("#txtRequestDate").val();
        //var visitDate = $("#txtVisitDate").val();

        var requestRequestDateConverted = "";
        if ($("#txtRequestDate").val() != "") {
            requestRequestDateConverted = HijriJS.toGregorian($("#txtRequestDate").val(), "/");
            var day = requestRequestDateConverted.getDate();
            var month = requestRequestDateConverted.getMonth() + 1;
            var year = requestRequestDateConverted.getFullYear();

            requestRequestDateConverted = month + "/" + day + "/" + year;
        }

        var requestRequestDate = requestRequestDateConverted;

        var visitDateConverted = "";
        if ($("#txtVisitDate").val() != "") {
            visitDateConverted = HijriJS.toGregorian($("#txtVisitDate").val(), "/");
            var day = visitDateConverted.getDate();
            var month = visitDateConverted.getMonth() + 1;
            var year = visitDateConverted.getFullYear();

            visitDateConverted = month + "/" + day + "/" + year;
        }
        var visitDate = visitDateConverted;

        var applicantName = $("#txtApplicantName").val();
        var visitorFirstName = $("#txtVisitorFirstName").val();
        var visitorFatherName = $("#txtVisitorFatherName").val();
        var visitorFamilyName = $("#txtVisitorFamilyName").val();
        var visitorLastName = $("#txtVisitorLastName").val();

        var nationality = $("#ddlNationalities").val();
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
            "&RequestCreateDate=" + requestRequestDate + "&RequestVisitDate=" + visitDate + "&ApplicantName=" + applicantName.trim() +
            "&FirstName=" + visitorFirstName.trim() + "&FatherName=" + visitorFatherName.trim() + "&FamilyName=" + visitorFamilyName.trim() + "&LastName=" + visitorLastName.trim() + "&Nationality=" + nationality + "&DepartmentCode=&SectionCode=&IdentyNumber=" + identityNumber + "&RequestState=&OnlyToday=" + true + "&Department=" + $("#hdnDepartment").val();

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

    function renderSearchResult(data, search) {
        // search = false;

        $(".PaggerDiv").show();
        $("#dataTable > tbody").empty();
        var datacount = 0;
        if (data == null || data.length == 0) {
            $("#dataTable > tbody").append("<tr><td>" + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,ThereIsNoData%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + " </td></tr>");
            $(".PaggerDiv").hide();
            $("#RowNumb").text(datacount);

            return;
        }

        groupedRequestsData = groupBy(data, 'RequestID');
        groupedRequestsData = Object.keys(groupedRequestsData).map(function (itm) { return groupedRequestsData[itm]; }).reverse();

        for (var arrayInside in groupedRequestsData) {

            var HTML = "";


            var innerDivs = "";
            var visitorFullName;
            for (var i = 0; i < groupedRequestsData[arrayInside].length; i++) {
                if (i >= 0) {
                    visitorFullName = groupedRequestsData[arrayInside][i].FirstName + " " + groupedRequestsData[arrayInside][i].FatherName + " " + groupedRequestsData[arrayInside][i].FamilyName + " " + groupedRequestsData[arrayInside][i].LastName;
                    innerDivs += '<div class="col-md-4"><div class="inner-card"><p class="title">' + visitorFullName + '</p><span class="nationality"><span class="nation-icon"></span> ' + groupedRequestsData[arrayInside][i].NationalityValue + '</span><span class="visitorid"><span class="id-icon"></span>' + groupedRequestsData[arrayInside][i].UserIdentyTypeValue + '</span></div></div>';
                }
            }

            console.log(groupedRequestsData[arrayInside]);
            for (var i = 0; i < groupedRequestsData[arrayInside].length; i++) {
                if (i === 0) {
                    //HTML = "";
                    var requestID = groupedRequestsData[arrayInside][i].RequestID;
                    var supervisorStatus = groupedRequestsData[arrayInside][i].SupervisorStatus;
                    var supervisorStatusText = supervisorStatus === "" ? "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,InProgress%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" : supervisorStatus === "1" ? "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Accepted%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" : "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Rejected	%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                    var supervisorStatusClass = supervisorStatus === "" ? "waiting" : supervisorStatus === "1" ? "accepted" : "rejected";
                    var applicantName = groupedRequestsData[arrayInside][i].ApplicantName;
                    var createdDate = GetHijriDate(groupedRequestsData[arrayInside][i].CreateDate);
                    var visitingDate = GetHijriDate(groupedRequestsData[arrayInside][i].VisitDate);
                    var visitorsCount = groupedRequestsData[arrayInside].length;


                    HTML += '<tr class="mainTable" >'
                        + '<td>' + requestID + '</td>'
                        + '<td>' + groupedRequestsData[arrayInside][i].ApplicantName + '</td>'
                        + '<td>' + GetHijriDate(groupedRequestsData[arrayInside][i].CreateDate) + '</td>'
                        + '<td>' + GetHijriDate(groupedRequestsData[arrayInside][i].VisitDate) + '</td>'
                    if (!search) {
                        HTML += '<td class="count">' + visitorsCount + '</td>';
                    }
                    var obj = {
                        id: requestID,
                        requestDate: createdDate,
                        visitDate: visitingDate,
                        applicantName: applicantName
                    };

                    // HTML += `<td class="viewoption"><span class="options-list showmore" role="button" data-toggle="collapse" href="#row` + requestID + `" aria-expanded="false" aria-controls="row` + requestID + `"></span></td>`
                    //  HTML += '<td class="viewoption"><a  title="<sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,ViewVisit%>" EncodeMethod="EcmaScriptStringLiteralEncode"/>" class="options-list review" href="javascript:viewRequestItem(" + requestID + ")"></a><a title="<sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,AcceptVisit%>" EncodeMethod="EcmaScriptStringLiteralEncode"/>" class="options-list accepted" href="javascript:openAcceptRequestModel(" + JSON.stringify(obj) + ")"></a><a  title="<sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,RejectVisit%>" EncodeMethod="EcmaScriptStringLiteralEncode"/>" class="options-list rejected" href="javascript:openRejectRequestModel(" + JSON.stringify(obj) + " )"></a><span class="options-list showmore" role="button" data-toggle="collapse" href="#row" + requestID + "" aria-expanded="false" aria-controls="row" + requestID + "></span></td>'
                    //  HTML += '<td class="viewoption"><a  title="<sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,ViewVisit%>" EncodeMethod="EcmaScriptStringLiteralEncode"/>" class="options-list review" href="javascript:viewRequestItem(" + requestID + ")"></a><a title="<sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,AcceptVisit%>" EncodeMethod="EcmaScriptStringLiteralEncode"/>" class="options-list accepted" href="javascript:openAcceptRequestModel(" + JSON.stringify(obj) + ")"></a><a  title="<sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,RejectVisit%>" EncodeMethod="EcmaScriptStringLiteralEncode"/>" class="options-list rejected" href="javascript:openRejectRequestModel(" + JSON.stringify(obj) + " )"></a><span class="options-list showmore" role="button" data-toggle="collapse" href="#row" + requestID + "" aria-expanded="false" aria-controls="row" + requestID + "></span></td>'
                    HTML += "<td class='viewoption'><a title='<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,ViewVisit%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>'  class='options-list review' href='javascript:viewRequestItem(" + requestID + ")'></a><a title='<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,AcceptVisit%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>' class='options-list accepted' href='javascript:openAcceptRequestModel(" + JSON.stringify(obj) + ")'></a><a title='<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,RejectVisit%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>' class='options-list rejected' href='javascript:openRejectRequestModel(" + JSON.stringify(obj) + " )'></a><span class='options-list showmore' role='button' data-toggle='collapse' href='#row" + requestID + "' aria-expanded='false' aria-controls='row" + requestID + "'></span></td>"

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
            var pagersize = 10;
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
                    $("#tablebody.not-printbody").append(Pageddata[i].outerHTML);
                }
            }
            hideLoader();
        });

    }
    function openAcceptRequestModel(obj) {
        $("#btnDoAction").attr("disabled", false);
        $("#hdnActionType").val("1");
        $("#exampleModalLongTitleAction").html("<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,AcceptVisitRequest%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
        $("#btnActionText").text("<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,RequestRedirectAccept%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
        $("#requestNumberAccept").text(obj.id);
        $("#requestDateAccept").text(obj.requestDate);
        $("#visitDateAccept").text(obj.visitDate);
        $("#applicantNameAccept").text(obj.applicantName);
        $("#txtAcceptComment").next("span.text-danger").remove();
        $("#txtAcceptComment").removeAttr("required");
        $("#txtAcceptComment").val('');
        // $('#actionModelCenter').modal({ backdrop: 'static', keyboard: false });
        getRequest(obj.id, function (data) {
            request = data;
            var userDepartmentCode = request.ApplicantAdministration;
            var applicantDepartmentName = getDepartmentName(userDepartmentCode, departmentList);
            var userSectionCode = request.ApplicantSection;
            var sectionName = "";
            if (userSectionCode != null && userDepartmentCode != null) {
                sectionName = getSectionName(userSectionCode, userDepartmentCode, sectionList);
            }
            $("#VisitNumb").text(request.ID);
            $("#visitMessageTitle").text(request.VisitMessage);
            $("#visitStartDatePreview").text(GetHijriDate(request.VisitStartDate));
            $("#visitTimePreview").text(request.VisitTime);
            $("#visitEndDatePreview").text(GetHijriDate(request.VisitEndDate));
            $("#visitReasonPreview").text(request.VisitReasonValue);
            $("#applicantNamePreview").text(request.UserName);
            $("#applicantTitlePreview").text(request.ApplicantRank);
            $("#applicantSectionPreview").text(sectionName);
            $("#applicantDepartmentPreview").text(applicantDepartmentName);


            var visitorsCount = request.VisitPersons.length;
            var deviceCount = 0;

            $(".request-visitors-view").empty();

            request.VisitPersons.forEach(function (visitor) {
                var elem = document.createElement("div");
                elem.classList.add("reviewCol");
                console.log(visitor)
                var visitorRowBody = '';
                visitorRowBody = '<div class="form-row">';
                visitorRowBody += '<div class="form-group info-data  col-md-8">';
                visitorRowBody += visitor.FirstName + ' ' + visitor.FatherName + ' ' + visitor.FamilyName + ' ' + visitor.LastName;
                visitorRowBody += '</div>';

                visitorRowBody += '<div class="form-group  col-md-4">';
                visitorRowBody += '<span class="nation-icon"></span>';
                visitorRowBody += '  <label class="col-form-label">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Nationality%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                    + ' </label>';
                visitorRowBody += '<p class="info-data ">' + visitor.NationalityValue + ' </p>';
                visitorRowBody += '</div>';


                visitorRowBody += '<div class="form-group  col-md-4">';
                visitorRowBody += '<span class="ID-icon"></span>';
                visitorRowBody += '  <label class="col-form-label">' +
                    "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Identity%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                    + ' </label>';
                visitorRowBody += '<p class="info-data" >';
                visitorRowBody += '<span  >';
                visitorRowBody += visitor.IdentityNumber;
                visitorRowBody += '</span>';
                visitorRowBody += '<span class="numberid">';
                visitorRowBody += visitor.IdentityTypeValue;
                visitorRowBody += '</span>';
                visitorRowBody += '</p >';
                visitorRowBody += '</div>';


                if (visitor.WorkingPlace != '') {
                    visitorRowBody += '<div class="form-group  col-md-4">';
                    visitorRowBody += '<span class="work-icon"></span>';
                    visitorRowBody += '  <label class="col-form-label"> ' +
                        "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,WorkingPlace%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                        + ' </label>';
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
                            visitorRowBody += '<p >';
                            visitorRowBody += '<span>' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,DeviceNumber		%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                                + ' </span><span> : </span>';
                            visitorRowBody += device.DeviceNumber;
                            visitorRowBody += '</p>';
                        }

                        if (device.NotesAboutDevice != "") {
                            visitorRowBody += '<p >';
                            visitorRowBody += '<span> ' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Notes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                                + ' </span><span> : </span>';
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
        $('#sendModel').modal({ backdrop: 'static', keyboard: false });

    }
    function doRequestAction(requestData, callback) {
        var supervisorApproveAPI$ = apiRootAddress + 'VisitRequest/AprroveSupervisor?ListSiteUrl=' + listSiteURL;

        $.ajax({
            url: supervisorApproveAPI$,
            type: 'POST',
            contentType: 'application/json',
            data: requestData,
            success: function (result) {
                if (result.statusCode == 1) {
                    searchRequests();
                    callback();
                    $("#btnDoAction").attr("disabled", false);

                }
                else {
                    $("#btnDoAction").attr("disabled", false);
                    alert("<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,ErrorOcurredDuringProcess%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
                    hideLoader();
                }
            }
            ,
            error: function (err) {
                alert(err.statusText);
                hideLoader();
            },

            complete: function () {

            }

        });
    }

    function openRejectRequestModel(obj) {
        $("#hdnActionType").val("2");
        $("#btnDoAction").attr("disabled", false);
        $("#exampleModalLongTitleAction").html("<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,RejectVisitRequest%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");

        $("#btnActionText").text("<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Redirect%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
        $("#requestNumberAccept").text(obj.id);
        $("#requestDateAccept").text(obj.requestDate);
        $("#visitDateAccept").text(obj.visitDate);
        $("#applicantNameAccept").text(obj.applicantName);

        $("#txtAcceptComment").val('');
        $("#txtAcceptComment").next("span.text-danger").remove();
        $("#txtAcceptComment").attr("required", "required");
        getRequest(obj.id, function (data) {
            request = data;
            console.log("data", data);
            var userDepartmentCode = request.ApplicantAdministration;
            var applicantDepartmentName = getDepartmentName(userDepartmentCode, departmentList);
            var userSectionCode = request.ApplicantSection;
            var sectionName = "";
            if (userSectionCode != null && userDepartmentCode != null) {
                sectionName = getSectionName(userSectionCode, userDepartmentCode, sectionList);
            }
            $("#VisitNumb").text(request.ID);
            $("#visitMessageTitle").text(request.VisitMessage);
            $("#visitStartDatePreview").text(GetHijriDate(request.VisitStartDate));
            $("#visitTimePreview").text(request.VisitTime);
            $("#visitEndDatePreview").text(GetHijriDate(request.VisitEndDate));
            $("#visitReasonPreview").text(request.VisitReasonValue);
            $("#applicantNamePreview").text(request.UserName);
            $("#applicantTitlePreview").text(request.ApplicantRank);
            $("#applicantSectionPreview").text(sectionName);
            $("#applicantDepartmentPreview").text(applicantDepartmentName);


            var visitorsCount = request.VisitPersons.length;
            var deviceCount = 0;

            $(".request-visitors-view").empty();

            request.VisitPersons.forEach(function (visitor) {
                var elem = document.createElement("div");
                elem.classList.add("reviewCol");
                console.log(visitor)
                var visitorRowBody = '';
                visitorRowBody = '<div class="form-row">';
                visitorRowBody += '<div class="form-group info-data  col-md-8">';
                visitorRowBody += visitor.FirstName + ' ' + visitor.FatherName + ' ' + visitor.FamilyName + ' ' + visitor.LastName;
                visitorRowBody += '</div>';

                visitorRowBody += '<div class="form-group  col-md-4">';
                visitorRowBody += '<span class="nation-icon"></span>';
                visitorRowBody += '  <label class="col-form-label">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Nationality%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                    + ' </label>';
                visitorRowBody += '<p class="info-data ">' + visitor.NationalityValue + ' </p>';
                visitorRowBody += '</div>';


                visitorRowBody += '<div class="form-group  col-md-4">';
                visitorRowBody += '<span class="ID-icon"></span>';
                visitorRowBody += '  <label class="col-form-label">' +
                    "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Identity%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                    + ' </label>';
                visitorRowBody += '<p class="info-data" >';
                visitorRowBody += '<span  >';
                visitorRowBody += visitor.IdentityNumber;
                visitorRowBody += '</span>';
                visitorRowBody += '<span class="numberid">';
                visitorRowBody += visitor.IdentityTypeValue;
                visitorRowBody += '</span>';
                visitorRowBody += '</p >';
                visitorRowBody += '</div>';


                if (visitor.WorkingPlace != '') {
                    visitorRowBody += '<div class="form-group  col-md-4">';
                    visitorRowBody += '<span class="work-icon"></span>';
                    visitorRowBody += '  <label class="col-form-label"> ' +
                        "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,WorkingPlace%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                        + ' </label>';
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
                            visitorRowBody += '<p >';
                            visitorRowBody += '<span>' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,DeviceNumber		%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                                + ' </span><span> : </span>';
                            visitorRowBody += device.DeviceNumber;
                            visitorRowBody += '</p>';
                        }

                        if (device.NotesAboutDevice != "") {
                            visitorRowBody += '<p >';
                            visitorRowBody += '<span> ' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Notes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                                + ' </span><span> : </span>';
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


    function viewRequestItem(rid) {

        getRequest(rid, function (data) {
            request = data;
            var userDepartmentCode = request.ApplicantAdministration;
            // debugger;
            var applicantDepartmentName = getDepartmentName(userDepartmentCode, departmentList);
            var userSectionCode = request.ApplicantSection;
            var sectionName = "";
            if (userSectionCode != null && userDepartmentCode != null) {
                sectionName = getSectionName(userSectionCode, userDepartmentCode, sectionList);
            }
            $("#VisitNumb").text(request.ID);
            $("#visitMessageTitle").text(request.VisitMessage);
            $("#visitStartDatePreview").text(GetHijriDate(request.VisitStartDate));
            $("#visitTimePreview").text(request.VisitTime);
            $("#visitEndDatePreview").text(GetHijriDate(request.VisitEndDate));
            $("#visitReasonPreview").text(request.VisitReasonValue);
            $("#applicantNamePreview").text(request.UserName);
            $("#applicantTitlePreview").text(request.ApplicantRank);
            $("#applicantSectionPreview").text(sectionName);
            $("#applicantDepartmentPreview").text(applicantDepartmentName);


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

                visitorRowBody += '<div class="form-group  col-md-4">';
                visitorRowBody += '<span class="nation-icon"></span>';
                visitorRowBody += '  <label class="col-form-label">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Nationality%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                    + ' </label>';
                visitorRowBody += '<p class="info-data ">' + visitor.NationalityValue + ' </p>';
                visitorRowBody += '</div>';


                visitorRowBody += '<div class="form-group  col-md-4">';
                visitorRowBody += '<span class="ID-icon"></span>';
                visitorRowBody += '  <label class="col-form-label">' +
                    "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Identity%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                    + ' </label>';
                visitorRowBody += '<p class="info-data" >';
                visitorRowBody += '<span  >';
                visitorRowBody += visitor.IdentityNumber;
                visitorRowBody += '</span>';
                visitorRowBody += '<span class="numberid">';
                visitorRowBody += visitor.IdentityTypeValue;
                visitorRowBody += '</span>';
                visitorRowBody += '</p >';
                visitorRowBody += '</div>';


                if (visitor.WorkingPlace != '') {
                    visitorRowBody += '<div class="form-group  col-md-4">';
                    visitorRowBody += '<span class="work-icon"></span>';
                    visitorRowBody += '  <label class="col-form-label"> ' +
                        "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,WorkingPlace%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                        + ' </label>';
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
                            visitorRowBody += '<p >';
                            visitorRowBody += '<span>' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,DeviceNumber		%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                                + ' </span><span> : </span>';
                            visitorRowBody += device.DeviceNumber;
                            visitorRowBody += '</p>';
                        }

                        if (device.NotesAboutDevice != "") {
                            visitorRowBody += '<p >';
                            visitorRowBody += '<span> ' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Notes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                                + ' </span><span> : </span>';
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


            $('#myModal').modal({ backdrop: 'static', keyboard: false });
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
    });
</script>
