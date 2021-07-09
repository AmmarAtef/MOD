<%@ Assembly Name="DevicesRequestsWFWebparts, Version=1.0.0.0, Culture=neutral, PublicKeyToken=97afcd5d4112e71c" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SecurityDevicesRequestsWPUserControl.ascx.cs" Inherits="DevicesRequestsWFWebparts.SecurityDevicesRequestsWP.SecurityDevicesRequestsWPUserControl" %>

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
    /* .have-materials  .text-danger{
        bottom: -118px !important;
    } */
</style>
<asp:HiddenField ID="hdnAPIRootURL" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hdnWFWebUrl" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hdnRequestType" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hdnDepartment" runat="server" ClientIDMode="Static" />

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
                <asp:Literal runat="server"
                    Text="<%$Resources:MachinesRequests,FilterData %>"></asp:Literal>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="container">
        <div id="SearchOptions" class="formLayout-container bb-none ">
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group ">
                        <asp:Label class="col-form-label" ID="lblGridTitle_RequestNumber" runat="server"
                            Text="<%$Resources:MachinesRequests,GridTitle_RequestNumber %>" ClientIDMode="Static">
                        </asp:Label>

                        <input type="text" class="form-control" id="txtRequestNumber"
                            onkeypress="javascript:return isNumber(event)" />
                        <label class="numbval"></label>
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <asp:Label class="col-form-label" ID="lblGridTitle_RequestDate" runat="server"
                            Text="<%$Resources:MachinesRequests,GridTitle_RequestDate %>" ClientIDMode="Static">
                        </asp:Label>

                        <input type="text" class="form-control textPicker" id="txtRequestDate" autocomplete="off" />
                        <label class="daytext"></label>
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <asp:Label class="col-form-label" runat="server" ID="lblGridTitle_RequestEnterDate2"
                            ClientIDMode="Static">
                        </asp:Label>

                        <input type="text" class="form-control textPicker" id="txtRequestEnterDate"
                            autocomplete="off" />
                        <label class="daytext"></label>
                    </div>
                </div>

                <div class=" col-md-3">
                    <div class="form-group ">
                        <span class="col-form-label">
                            <asp:Literal runat="server"
                                Text="<%$Resources:MachinesRequests,GridTitle_RequestOwnerName %>"></asp:Literal>
                        </span>

                        <input type="text" class="form-control" id="txtApplicantName" autocomplete="off" />
                        <label class="daytext"></label>
                    </div>
                </div>

                <div class=" col-md-3">
                    <div class="form-group ">
                        <asp:Label class="col-form-label" ID="lblGridTitle_RequestDelegateName" runat="server"
                            Text="<%$Resources:MachinesRequests,GridTitle_RequestDelegateName %>" ClientIDMode="Static">
                        </asp:Label>
                        <input type="text" id="txtDelegateName" class="form-control" />
                    </div>
                </div>

                <div class=" col-md-3">
                    <div class="form-group ">
                        <asp:Label class="col-form-label" ID="lblGridTitle_DeviceType" runat="server"
                            Text="<%$Resources:MachinesRequests,GridTitle_DeviceType %>" ClientIDMode="Static">
                        </asp:Label>
                        <input type="text" id="txtDeviceType" class="form-control" />
                    </div>
                </div>
                <!-- <div class=" col-md-3">
                    <div class="form-group ">
                        <asp:Label ID="lblGridTitle_RequestStatus" runat="server"
                            Text="<%$Resources:MachinesRequests,GridTitle_RequestStatus %>" ClientIDMode="Static">
                        </asp:Label>
                        <select id="ddlStatuses" class="form-control">

                        </select>
                    </div>
                </div> -->
                <div class="col-md-3">
                    <div class="form-group ">
                        <label class="col-form-label" for="ddlDepartments" class="col-form-label">
                            <asp:Literal runat="server"
                                Text="<%$Resources:MachinesRequests,Departments %>"></asp:Literal>
                        </label>
                        <select id="ddlDepartments" class="form-control"></select>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group ">
                        <label class="col-form-label" for="ddlSections" class="col-form-label">

                            <asp:Literal runat="server"
                                Text="<%$Resources:MachinesRequests,Sections %>"></asp:Literal>
                        </label>
                        <select id="ddlSections" class="form-control"></select>
                    </div>
                </div>

                <div class="form-group col-md-12">
                    <button id="btnSearch" class="btn preview-btn send-btn">
                        <asp:Literal runat="server"
                            Text="<%$Resources:MachinesRequests,Search %>"></asp:Literal>
                    </button>
                    <button id="btnReset" class="btn preview-btn send-btn">
                        <asp:Label runat="server" Text="<%$Resources:MachinesRequests,SearchReset %>" ClientIDMode="Static">
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
                                Text="<%$Resources:MachinesRequests,TotalAvaliableRequests %>"></asp:Literal>
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
                            <th class="col-xs-2">
                                <asp:Label ID="lblGridTitle_RequestNumberth2" runat="server"
                                    Text="<%$Resources:MachinesRequests,GridTitle_RequestNumber %>"
                                    ClientIDMode="Static">
                                </asp:Label>
                            </th>

                            <th class="col-xs-2">
                                <asp:Label ID="lblGridTitle_RequestDateth2" runat="server"
                                    Text="<%$Resources:MachinesRequests,GridTitle_RequestDate %>" ClientIDMode="Static">
                                </asp:Label>
                            </th>

                            <th class="col-xs-2">

                                <asp:Label runat="server" ID="lblGridTitle_RequestEnterDate" ClientIDMode="Static">
                                </asp:Label>

                            </th>
                            <th class="col-xs-2">
                                <asp:Label ID="lblGridTitle_RequestDelegateNameth2" runat="server"
                                    Text="<%$Resources:MachinesRequests,GridTitle_RequestDelegateName %>"
                                    ClientIDMode="Static">
                                </asp:Label>
                            </th>
                            <th class="col-xs-2">
                                <asp:Literal runat="server"
                                    Text="<%$Resources:MachinesRequests,GridTitle_RequestOwnerName %>"></asp:Literal>
                            </th>
                            <th class="col-xs-2">
                                <!-- <asp:Label ID="lblGridTitle_ApplicantDepartmentth2" runat="server"
                                    Text="<%$Resources:MachinesRequests,security_ApplicantDepartment%>" ClientIDMode="Static">
                                </asp:Label> -->
                                <asp:Literal runat="server"
                                    Text="<%$Resources:MachinesRequests,security__ApplicantSection %>"></asp:Literal>
                                <span>/</span>
                                <asp:Label ID="lblGridTitle_ApplicantSectionth2" runat="server"
                                    Text="<%$Resources:MachinesRequests,security_ApplicantSection%>"
                                    ClientIDMode="Static">
                                </asp:Label>
                            </th>



                            <th class="col-xs-2 count">
                                <asp:Literal runat="server"
                                    Text="<%$Resources:MachinesRequests,DeviceCount %>"></asp:Literal>
                            </th>


                            <th class="viewoption">
                                <asp:Literal runat="server"
                                    Text="<%$Resources:MachinesRequests,RequestReview %>"></asp:Literal>
                            </th>

                        </tr>
                    </thead>
                    <tbody id="tablebody">
                    </tbody>
                </table>
            </div>
        </div>

        <div class="table-responsive formLayout-table">
            <table id="dataTable" class="table">
                <thead>
                    <tr class="active">
                        <th class="col-xs-2">
                            <asp:Label ID="lblGridTitle_RequestNumberth1" runat="server"
                                Text="<%$Resources:MachinesRequests,GridTitle_RequestNumber %>" ClientIDMode="Static">
                            </asp:Label>
                        </th>

                        <th class="col-xs-2">
                            <asp:Label ID="lblGridTitle_RequestDateth1" runat="server"
                                Text="<%$Resources:MachinesRequests,GridTitle_RequestDate %>" ClientIDMode="Static">
                            </asp:Label>
                        </th>

                        <th class="col-xs-2">
                            <asp:Label runat="server" ID="lblGridTitle_RequestEnterDate1" ClientIDMode="Static">
                            </asp:Label>

                        </th>
                        <th class="col-xs-2">
                            <asp:Label ID="lblGridTitle_RequestDelegateNameth1" runat="server"
                                Text="<%$Resources:MachinesRequests,GridTitle_RequestDelegateName %>"
                                ClientIDMode="Static">
                            </asp:Label>
                        </th>
                        <th class="col-xs-2">
                            <asp:Literal runat="server"
                                Text="<%$Resources:MachinesRequests,security__ApplicantName %>"></asp:Literal>
                        </th>
                        <!-- <th class="col-xs-2">
                             <asp:Label ID="lblGridTitle_ApplicantDepartmentth1" runat="server"
                                Text="<%$Resources:MachinesRequests,security_ApplicantDepartment%>" ClientIDMode="Static">
                            </asp:Label> 
                            الإدارة
                        </th> -->
                        <th class="col-xs-2">
                            <span>
                                <asp:Literal runat="server"
                                    Text="<%$Resources:MachinesRequests,security_ApplicantDepartment %>"></asp:Literal>
                            </span>
                            <span>/</span>
                            <asp:Label ID="lblGridTitle_ApplicantSectionth1" runat="server"
                                Text="<%$Resources:MachinesRequests,security_ApplicantSection%>" ClientIDMode="Static">
                            </asp:Label>
                        </th>



                        <th class="col-xs-2 count">
                            <asp:Literal runat="server"
                                Text="<%$Resources:MachinesRequests,DeviceCount %>"></asp:Literal>
                        </th>
                        <th class="viewoption">
                            <asp:Literal runat="server"
                                Text="<%$Resources:MachinesRequests,RequestReview %>"></asp:Literal>
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
    <div class="modal fade" id="viewModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
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
                        <asp:Label runat="server" ID="lblSecurity__RequestEntryDevicesText1" ClientIDMode="Static">
                        </asp:Label>
                    </p>
                    <p class="RequestNumber">
                        <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,security__number%>">
                        </asp:Literal>
                        : <span id="RequestNumb"></span>
                    </p>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>


                </div>
                <div class="modal-body">
                    <div class="visitinfo">
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <i class=" mdi mdi-calendar "></i>
                                <label class="col-form-label">
                                    <asp:Label runat="server" ID="GridTitle_RequestEnterDate" ClientIDMode="Static">
                                    </asp:Label>

                                </label>

                                <p id="EntryDate" class="info-data"></p>
                            </div>


                            <div class="form-group col-md-4">
                                <i class=" mdi mdi-timer "></i>
                                <asp:Label runat="server" class="info-data" ID="lblEntryTimeView"
                                    ClientIDMode="Static">
                                </asp:Label>
                                <p id="DevicesEnterTimeView" class="info-data"></p>
                            </div>
                        </div>
                    </div>
                    <div class="heading-title">
                        <p>
                            <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,security__ApplicantData %>">
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
                                    <asp:Literal runat="server"
                                        Text="<%$Resources:MachinesRequests,security_ApplicantDegree%>">
                                    </asp:Literal>
                                </label>
                                <p id="applicantTitlePreview" class="info-data"></p>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="col-form-label">
                                    <asp:Literal runat="server"
                                        Text="<%$Resources:MachinesRequests,security_ApplicantDepartment%>">
                                    </asp:Literal>
                                </label>
                                <p id="applicantSectionPreview" class="info-data"></p>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="col-form-label">
                                    <asp:Literal runat="server"
                                        Text="<%$Resources:MachinesRequests,security__ApplicantSection%>">
                                    </asp:Literal>
                                </label>
                                <p id="applicantDepartmentPreview" class="info-data"></p>
                            </div>
                        </div>
                    </div>
                    <div class="heading-title">
                        <p>
                            <SharePoint:EncodedLiteral runat='server'
                                Text='<%$Resources:MachinesRequests,security__supervisorInfo%>' />
                        </p>
                    </div>
                    <div class="emp-request">
                        <div class="form-row">

                            <div class="form-group col-md-4">
                                <label class="col-form-label">
                                    <asp:Literal runat="server"
                                        Text="<%$Resources:MachinesRequests,security__supervisorName%>">
                                    </asp:Literal>

                                </label>
                                <p id="superVisorNamePreview" class="info-data"></p>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="col-form-label">
                                    <asp:Literal runat="server"
                                        Text="<%$Resources:MachinesRequests,security__IdentityNumber%>">
                                    </asp:Literal>

                                </label>
                                <p id="superVisorIdentityPreview" class="info-data"></p>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="col-form-label">
                                    <asp:Literal runat="server"
                                        Text="<%$Resources:MachinesRequests,security__workPlace%>">
                                    </asp:Literal>
                                </label>
                                <p id="superVisorWorkPreview" class="info-data"></p>
                            </div>
                        </div>
                    </div>
                    <div class="heading-title">
                        <p>
                            <SharePoint:EncodedLiteral runat='server'
                                Text='<%$Resources:MachinesRequests,security__devicesInfo%>' />
                        </p>
                    </div>
                    <div class="request-devices-view">
                    </div>


                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered formLayout-model" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <p class="modal-title" id="exampleModalLongTitle">
                    <asp:Label runat="server" ID="lblSecurity__acceptEnterDevices1" ClientIDMode="Static">
                    </asp:Label>
                </p>
                <p class="requestnumber">
                    <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,security__number%>">
                    </asp:Literal>
                    : <span id="deviceRequestIDPreview"></span>
                </p>

                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p class="request-msgtitle">
                    <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,RequestMessage%>">
                    </asp:Literal>

                </p>
                <p class="request-msg" id="deviceMessageTitlePreview"></p>

                <div class="visitinfo">
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <i class=" mdi mdi-calendar "></i>
                            <label class="col-form-label">
                                <asp:Label runat="server" ID="security__deviceEnterDate" ClientIDMode="Static">
                                </asp:Label>


                            </label>
                            <p id="deviceEntryDatePreview" class="info-data"></p>
                        </div>
                        <div class="form-group col-md-4">
                            <i class=" mdi mdi-timer "></i>
                            <asp:Label runat="server" class="info-data" ID="lblEntryTimePreview"
                                ClientIDMode="Static">
                            </asp:Label>
                            <p id="DevicesEnterTimePreview" class="info-data"></p>
                        </div>
                    </div>
                </div>
                <div class="heading-title">
                    <p>
                        <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,security__ApplicantData%>">
                        </asp:Literal>
                    </p>
                </div>
                <div class="emp-request">
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <span id="deviceApplicantNamePreview" class="info-data"></span>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-form-label">
                                <asp:Literal runat="server"
                                    Text="<%$Resources:MachinesRequests,security_ApplicantDegree%>">
                                </asp:Literal>
                            </label>
                            <p id="deviceApplicantTitlePreview" class="info-data"></p>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-form-label">
                                <asp:Literal runat="server"
                                    Text="<%$Resources:MachinesRequests,security_ApplicantDepartment%>">
                                </asp:Literal>
                            </label>
                            <p id="deviceApplicantSectionPreview" class="info-data"></p>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-form-label">
                                <asp:Literal runat="server"
                                    Text="<%$Resources:MachinesRequests,security__ApplicantSection%>">
                                </asp:Literal>
                            </label>
                            <p id="deviceApplicantDepartmentPreview" class="info-data"></p>
                        </div>
                    </div>
                </div>
                <div class="heading-title">
                    <p>
                        <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,security__supervisorInfo%>">
                        </asp:Literal>
                    </p>
                </div>
                <div class="emp-request">
                    <div class="form-row">

                        <div class="form-group col-md-4">
                            <label class="col-form-label">
                                <asp:Literal runat="server"
                                    Text="<%$Resources:MachinesRequests,security__supervisorName%>">
                                </asp:Literal>
                            </label>
                            <p id="devicesuperVisorNamePreview" class="info-data"></p>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-form-label">
                                <asp:Literal runat="server"
                                    Text="<%$Resources:MachinesRequests,security__IdentityNumber%>">
                                </asp:Literal>
                            </label>
                            <p id="devicesuperVisorIdentityPreview" class="info-data"></p>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-form-label">
                                <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,security__workPlace%>">
                                </asp:Literal>
                            </label>
                            <p id="devicesuperVisorWorkPreview" class="info-data"></p>
                        </div>
                    </div>
                </div>
                <div class="heading-title">
                    <p>
                        <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,security__devicesInfo%>">
                        </asp:Literal>

                    </p>
                </div>

                <div class="request-visitors-review">
                </div>

                <div class="form-row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <p class="welcome">
                                <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,security__gate%>">
                                </asp:Literal>
                            </p>
                            <select id="ddlGates" required="required" class="form-control"></select>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-md-6">
                        <p class="welcome">
                            <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,security__notes%>">
                            </asp:Literal>

                        </p>
                        <textarea id="txtNote" cols="50" rows="3" class="form-control"></textarea>
                    </div>
                </div>

            </div>
            <div class="modal-footer">

                <button type="button" id="btnSubmit" class="btn preview-btn send-btn"
                    data-toggle="modal" data-target="#exampleModalCenter">
                    <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,security__acceptButton%>">
                    </asp:Literal>
                </button>


                <p style="padding-top: 10px;" class="text-danger submitError"></p>

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
                    <asp:Label runat="server" ID="security__rejectEnterDevice" ClientIDMode="Static">
                    </asp:Label>
                </p>
                <p class="visitnumber">
                    <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,security__number%>">
                    </asp:Literal>
                    :
                    <span id="requestNumberReject"></span>
                </p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <div class="visitinfo">
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <i class=" mdi mdi-calendar "></i>
                            <label class="col-form-label">
                                <asp:Literal runat="server"
                                    Text="<%$Resources:MachinesRequests,GridTitle_RequestDate %>"></asp:Literal>
                            </label>
                            <p id="requestDateReject" class="info-data"></p>
                        </div>
                        <div class="form-group col-md-4">
                            <i class=" mdi mdi-calendar "></i>
                            <label class="col-form-label">
                                <asp:Label runat="server" ID="security__requestCreationDate" ClientIDMode="Static">
                                </asp:Label>

                            </label>
                            <p id="visitDateReject" class="info-data"></p>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-form-label">
                                <asp:Literal runat="server"
                                    Text="<%$Resources:MachinesRequests,security__ApplicantName%>">
                                </asp:Literal>
                            </label>
                            <p id="applicantNameReject" class="info-data"></p>
                        </div>
                    </div>
                </div>


                <div class="form-row">
                    <div class="col-md-7">
                        <p class="welcome">
                            <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,security__comment%>">
                            </asp:Literal>

                        </p>
                        <textarea id="txtRejectComment" class="form-control" cols="50" rows="5">

                            </textarea>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" id="btnReject" class="btn preview-btn send-btn" data-toggle="modal">
                    <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,security__rejectButton%>">
                    </asp:Literal>
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
                    <asp:Label runat="server" ID="security_SendResponsForEnterDevice" ClientIDMode="Static">
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


<script src="/modwf/style Library/branding/js/general/helpers.js"></script>
<script src="/modwf/style Library/branding/js/general/devicesShared.js"></script>
<script type="text/javascript">

    var sort;
    var mydata;
    var apiRootAddress = $("#hdnAPIRootURL").val();
    var listSiteUrl = $("#hdnWFWebUrl").val();
    var requestType = $("#hdnRequestType").val();
    var currentUserId = _spPageContextInfo.userId;
    var departmentList;
    var sectionList;
    var search = false;

    $(function () {

        getAllGates(
            apiRootAddress,
            function (data) {
                $("#ddlGates").append('<option value="">' +"<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,Choose%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>');
                data.forEach(function (item) {
                    $("#ddlGates").append('<option value="' + item.ID + '">' + item.Title + '</option>');

                });

            }
        );

        if ($("#hdnRequestType").val() == "0") {
            document.getElementById("lblGridTitle_RequestEnterDate").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,GridTitle_RequestEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblGridTitle_RequestEnterDate1").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,GridTitle_RequestEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblGridTitle_RequestEnterDate2").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,DevicesEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblSecurity__RequestEntryDevicesText1").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,security__RequestEntryDevices%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("GridTitle_RequestEnterDate").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,GridTitle_RequestEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("security_SendResponsForEnterDevice").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,security_SendResponsForEnterDevice%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblSecurity__acceptEnterDevices1").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,security__acceptEnterDevices%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("security__deviceEnterDate").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,security__deviceEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("security__requestCreationDate").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,security__requestCreationDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("security__rejectEnterDevice").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,security__rejectEnterDevice%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblEntryTimePreview").innerHTML = document.getElementById("lblEntryTimeView").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,DeviceEnterTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
        } else {
            document.getElementById("lblGridTitle_RequestEnterDate").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,GridTitle_RequestEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblGridTitle_RequestEnterDate1").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,GridTitle_RequestEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblGridTitle_RequestEnterDate2").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,DevicesEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblSecurity__RequestEntryDevicesText1").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,security__RequestEntryDevices%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("GridTitle_RequestEnterDate").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,GridTitle_RequestEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("security_SendResponsForEnterDevice").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,security_SendResponsForEnterDevice%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblSecurity__acceptEnterDevices1").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,security__acceptEnterDevices%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("security__deviceEnterDate").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,security__deviceEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("security__requestCreationDate").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,security__requestCreationDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("security__rejectEnterDevice").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,security__rejectEnterDevice%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblEntryTimePreview").innerHTML = document.getElementById("lblEntryTimeView").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,DeviceEnterTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";

        }

      

        getAllDepartments(
            apiRootAddress,
            function (data) {
                departmentList = data;
                $("#ddlDepartments").append('<option value="">' +"<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>');
                data.forEach(function (item) {
                    $("#ddlDepartments").append('<option value="' + item.Code + '">' + item.Title + '</option>');
                });
            }
        );
        $("#ddlSections").append('<option value="">' +"<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>');

        getAllSections(
            apiRootAddress,
            function (data) {
                sectionList = data;
            }
        );

        getAllStatuses(
            apiRootAddress,
            function (data) {
                $("#ddlStatuses").append('<option value="">' +"<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>');
                data.forEach(function (item) {
                    $("#ddlStatuses").append('<option value="' + item.Code + '">' + item.Title + '</option>');
                });
            }
        );

        var searchRequestsAPI$ = apiRootAddress + "DevicesRequest/SearchRequests?ListSiteUrl=" + listSiteUrl + "&UserID=0&RequestID=0&CreationDate=&RequestDate=&ApplicantName=&SupervisorName=&DeviceType=&DepartmentCode=&SectionCode=&RequestState=0&OnlyToday=true&RequestType=" + $("#hdnRequestType").val();

        getDataByAPI(searchRequestsAPI$, function (data, status, xhr) {
            if (xhr.getResponseHeader('StatusCode') == 1) {
                hideGeneralErrorMessage();
                mydata = data;
                renderSearchResult(data);
            }
            else {
                //Show Error message
                showGeneralErrorMessage();
            }

        });

        

    });


    $("#btnSearch").click(function (e) {
        e.preventDefault();
        searchRequests();
    });

    $("#btnRefreshData").click(function (e) {
        e.preventDefault();
        searchRequests();
    });

    $(document).on("blur", "[required]", function () {
        $(this).next("span").remove();
        if ($(this).val().trim() === '') {
            $(this).after("<span class='text-danger'> <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,YouShouldEnterValueForThisField%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></span>");
            }
            else {
                $(this).next("span").remove();
            }

        });

    $(document).on("change", "[required]", function (e) {
        if ($(this).val().trim() !== '') {
            $(this).next("span").remove();
        }
        var allDevices = $(".request-visitors-review .visitorRow").length;
        for (var i = 0; i < allDevices; i++) {
            $(".visitorRow:eq(" + i + ")").find("span").closest(".text-danger").remove();
            $(".submitError").text("");
            $(".visitorRow:eq(" + i + ") .have-materials");
            if ($(".visitorRow:eq(" + i + ") .have-materials").find("input").closest("input[name='device" + i + "']:checked").length == 0) {
                $(".visitorRow:eq(" + i + ") .have-materials").append("<span class='text-danger'>يجب تحديد الإجراء لهذا العنصر</span>");
                $(".submitError").text(" بيانات قبول الطلب غير مكتمة برجاء إكمال البياات المطلوبة");

            }
        }
        for (var i = 0; i < $("[required]").length; i++) {
            $("[required]:eq(" + i + ")").next("span").remove();

            if ($("[required]:eq(" + i + ")").val().trim() === '') {
                $("[required]:eq(" + i + ")").after("<span class='text-danger'>   <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,YouShouldEnterValueForThisField%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>  </span>");
                    $(".submitError").text(" بيانات قبول الطلب غير مكتمة برجاء إكمال البياات المطلوبة");
                }


            }

        });

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

        var requestRequestEnterDateConverted = "";
        if ($("#txtRequestEnterDate").val() != "") {

            requestRequestEnterDateConverted = HijriJS.toGregorian($("#txtRequestEnterDate").val(), "/");
            var day = requestRequestEnterDateConverted.getDate();
            var month = requestRequestEnterDateConverted.getMonth() + 1;
            var year = requestRequestEnterDateConverted.getFullYear();

            requestRequestEnterDateConverted = month + "/" + day + "/" + year;
        }

        var requestRequestEnterDateConverted = requestRequestEnterDateConverted;

        var SupervisorName = $("#txtDelegateName").val();
        var txtDeviceType = $("#txtDeviceType").val();
        var ddlStatuses = $("#ddlStatuses").val();
        var txtApplicantName = $("#txtApplicantName").val();
        if ($("#txtDeviceType").val() != "") {
            search = true;
            $(".count").hide();
        }
        else {
            search = false;
            $(".count").show();
        }
        var departmentCode = $("#ddlDepartments").val();
        var sectionCode = $("#ddlSections").val();
        var searchRequestsWithFilterationsAPI$ = apiRootAddress + "DevicesRequest/SearchRequests?ListSiteUrl="
            + listSiteUrl + "&UserID=0&RequestID=" + requestNumber + "&CreationDate=" + requestRequestDateConverted
            + "&RequestDate=" + requestRequestEnterDateConverted + "&ApplicantName=" + txtApplicantName.trim() + "&SupervisorName=" + SupervisorName.trim()
            + "&DeviceType=" + txtDeviceType.trim() + "&DepartmentCode=" + departmentCode + "&SectionCode=" + sectionCode + "&RequestState=0&OnlyToday=true&RequestType="
            + $("#hdnRequestType").val();

        getDataByAPI(searchRequestsWithFilterationsAPI$, function (data, status, xhr) {
            if (xhr.getResponseHeader('StatusCode') == 1) {
                hideGeneralErrorMessage();
                actualData = data;
                mydata = data;
                renderSearchResult(data, false, search);
            }
            else {
                //Show Error message
                showGeneralErrorMessage();
            }

        });

    }

    function changePaggerNumb() {
        renderSearchResult(actualData);

    }
    function GetHijriDateWithSlashFormat(date) {
        var SplitedDate = (date.split("T")[0]).split("-");
        var s = HijriJS.gregorianToHijri(SplitedDate[0], SplitedDate[1], SplitedDate[2])
        return s.day + "/" + s.month + "/" + s.year
    }

    function renderSearchResult(data, sort, search) {
        sort = false;
        // search = false;
        $("#dataTable > tbody").empty();
        var datacount = 0;
        $(".PaggerDiv").show();
        if (data == null || data.length == 0) {
            $("#dataTable > tbody").append("<tr><td> <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,ThereIsNoData%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>   </td></tr>");
            
            $("#RowNumb").text("0");
            $(".PaggerDiv").hide();
            return;
        }

        // this is our function to group by 
        // const groupBy = key => array =>

        //     array.reduce((objectsByKeyValue, obj) => {
        //         const value = obj[key];
        //         objectsByKeyValue[value] = (objectsByKeyValue[value] || []).concat(obj);
        //         return objectsByKeyValue;
        //     }, {});

        // const groupByID = groupBy('RequestID');
        // var groupedRequestsData = groupByID(data);
        groupedRequestsData = groupBy(data, 'RequestID');
        if (!sort)
            //     groupedRequestsData = Object.assign({}, Object.values(groupedRequestsData).reverse());
            groupedRequestsData = Object.keys(groupedRequestsData).map(function (itm) { return groupedRequestsData[itm]; }).reverse();

        if (sort)
            //     groupedRequestsData = Object.assign({}, Object.values(groupedRequestsData));
            groupedRequestsData = Object.keys(groupedRequestsData).map(function (itm) { return groupedRequestsData[itm]; });

        for (var arrayInside in groupedRequestsData) {
            var HTML = "";

            var innerDivs = "";
            var requestDevicesCount = 0;
            for (var i = 0; i < groupedRequestsData[arrayInside].length; i++) {
                if (i >= 0) {
                    //innerDivs += '<div class="col-md-4"><div class="inner-card"><p class="deviceType title"> <sharepoint:encodedliteral runat="server" text="<%$Resources:MachinesRequests,DeviceType%>" EncodeMethod="EcmaScriptStringLiteralEncode"/>  :' + groupedRequestsData[arrayInside][i].DeviceType + '</p><span class=" my-5 DeviceNumber"> رقم الجهاز : ' + groupedRequestsData[arrayInside][i].DeviceNumber + '</span><br><span class="my-5 ManufacturingCompanyName"> اسم الشركة المصنعة : ' + groupedRequestsData[arrayInside][i].ManufacturingCompanyName + '</span><p class="visitorid"> وقت الدخول :  ' + groupedRequestsData[arrayInside][i].ActionTime + '</p></div></div>';
                    innerDivs += '<div class="col-md-4"><div class="inner-card"><p class="deviceType title">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceType%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + ' : ' + groupedRequestsData[arrayInside][i].DeviceType + '</p>';
                    if (groupedRequestsData[arrayInside][i].ItemsCount != "") {
                        innerDivs += '<span class=" my-5 DeviceNumber ">  العدد : ' + groupedRequestsData[arrayInside][i].ItemsCount + '</span>';
                        requestDevicesCount += parseInt(groupedRequestsData[arrayInside][i].ItemsCount);
                    }
                    if (groupedRequestsData[arrayInside][i].DeviceNumber != "") {
                        innerDivs += '<br><span class=" my-5 DeviceNumber ">  رقم الجهاز : ' + groupedRequestsData[arrayInside][i].DeviceNumber + '</span>';
                    }
                    if (groupedRequestsData[arrayInside][i].ManufacturingCompanyName != "") {
                        innerDivs += '<br><span class="my-5 ManufacturingCompanyName">اسم الشركة المصنعة :' + groupedRequestsData[arrayInside][i].ManufacturingCompanyName + '</span>';
                    }
                    innerDivs += '</div></div>';
                }
            }
            for (var i = 0; i < groupedRequestsData[arrayInside].length; i++) {
                if (i === 0) {
                    //HTML = "";
                    var requestID = groupedRequestsData[arrayInside][i].RequestID;
                    var ApplicantName = groupedRequestsData[arrayInside][i].ApplicantName;
                    var supervisorStatus = groupedRequestsData[arrayInside][i].SupervisorStatus;
                    var securityStatus = groupedRequestsData[arrayInside][i].SecurityStatus;
                    var supervisorStatusText = securityStatus === "" ? "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,InProgress%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> " : securityStatus === "1" ? "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,Accepted%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> " : "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,Rejected%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                    var disableStatusText = supervisorStatus === "" ? " " : supervisorStatus === "1" ? " disable" : "disable ";
                    var supervisorStatusClass = supervisorStatus === "" ? "waiting" : supervisorStatus === "1" ? "accepted" : "rejected";
                    var devicesCount = groupedRequestsData[arrayInside].length;

                    var statusText = "";
                    if (supervisorStatus == "") {
                        statusText = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,InProgress%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> ";
                        supervisorStatusClass = "waiting";
                    } else if (supervisorStatus == "2") {
                        statusText = " <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,Redirect%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                        supervisorStatusClass = "rejected";
                    }
                    else if (supervisorStatus == "1") {
                        if (securityStatus == "") {
                            statusText = " <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,InProgress%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                            supervisorStatusClass = "waiting";
                        } else if (securityStatus == "1") {
                            statusText = " <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,Accepted%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                            supervisorStatusClass = "accepted";
                        } else if (securityStatus == "2") {
                            statusText = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,Rejected%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                            supervisorStatusClass = "rejected";
                        }
                    }
                    var ele = groupedRequestsData[arrayInside];
                    var CreationDate = groupedRequestsData[arrayInside][i].CreationDate;
                    var RequestDate = GetHijriDate(groupedRequestsData[arrayInside][i].DevicesRequestDate);
                    var departmentName = getDepartmentName(groupedRequestsData[arrayInside][i].ApplicantAdministration, departmentList);
                    var sectionName = "";

                    var userSectionCode = groupedRequestsData[arrayInside][i].ApplicantSection;
                    var userDepartmentCode = groupedRequestsData[arrayInside][i].ApplicantAdministration;
                    if (userSectionCode != null && userDepartmentCode != null) {
                        sectionName = getSectionName(userSectionCode, userDepartmentCode, sectionList);
                    }
                    HTML += '<tr id="mainTable" >'
                        + '<td>' + requestID + '</td>'
                        + '<td>' + GetHijriDate(groupedRequestsData[arrayInside][i].CreationDate) + ' <b>(' + convertTime24to12(groupedRequestsData[arrayInside][i].CreationDate.split("T")[1]) + ')</b></td>'
                        + '<td>' + GetHijriDate(groupedRequestsData[arrayInside][i].DevicesRequestDate) + '</td>'
                        + '<td>' + trimString(groupedRequestsData[arrayInside][i].SupervisorName, 30) + '</td>'
                        + '<td>' + ApplicantName + '</td>'
                        + '<td><p>' + departmentName + '</p><p>' + sectionName + '</p></td>'

                    if (!search) {
                        HTML += '<td>' + requestDevicesCount + ' </td>';
                    }

                    // HTML += `<td class="viewoption"><a class="options-list review" href="javascript:viewRequestItem(` + requestID + `)"></a><a class="options-list accepted" href="javascript:openAcceptRequestModel(` + requestID + `)"></a><a class="options-list rejected" href="javascript:openRejectRequestModel(` + requestID + `)"></a><span class="options-list showmore" role="button" data-toggle="collapse" href="#row` + requestID + `" aria-expanded="false" aria-controls="row` + requestID + `"></span></td>`
                    HTML += "<td class='viewoption'><a title='<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,ViewDevice%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>' class='options-list review' href='javascript:viewRequestItem(" + requestID + ")'></a><a title='<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,AcceptDevice%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>' class='options-list accepted' href='javascript:openAcceptRequestModel(" + requestID + ")'></a><a title='<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,RejectDevice%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>' class='options-list rejected' href='javascript:openRejectRequestModel(" + requestID + " )'></a><span class='options-list showmore' role='button' data-toggle='collapse' href='#row" + requestID + "' aria-expanded='false' aria-controls='row" + requestID + "'></span></td>"

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

            pagersize = 10;


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



    function openAcceptRequestModel(rid) {
        $("#txtNote").val("");
        $("#ddlGates").val("");
        $(".text-danger").text("");
        // $("#btnSubmit").attr("disabled", true);
        getRequest(rid, function (data) {
            request = data;
            var userDepartmentCode = request.ApplicantAdministration;

            var applicantDepartmentName = getDepartmentName(userDepartmentCode, departmentList);
            var userSectionCode = request.ApplicantSection;
            var sectionName = "";
            if (userSectionCode != null && userDepartmentCode != null) {
                sectionName = getSectionName(userSectionCode, userDepartmentCode, sectionList);
            }
            $("#deviceRequestIDPreview").text(request.ID);
            $("#deviceMessageTitlePreview").text(request.RequestMessage);
            $("#deviceEntryDatePreview").text(GetHijriDate(request.DevicesRequestDate));
            $("#DevicesEnterTimePreview").text(request.ActionTime);
            $("#deviceApplicantNamePreview").text(request.ApplicantName);
            $("#deviceApplicantTitlePreview").text(request.ApplicantRank);
            $("#deviceApplicantSectionPreview").text(sectionName);
            $("#deviceApplicantDepartmentPreview").text(applicantDepartmentName);
            $("#devicesuperVisorNamePreview").text(request.SupervisorName);
            $("#devicesuperVisorIdentityPreview").text(request.IdentityNumber);
            $("#devicesuperVisorWorkPreview").text(request.WorkingPlace);


            var devicesCount = request.RequestMachines.length;
            var deviceCount = 0;

            $(".request-visitors-review").empty();
            var deviceIndex = -1;
            request.RequestMachines.forEach(function (device) {
                deviceIndex++;
                var elem = document.createElement("div");
                elem.classList.add("visitorRow");
                elem.classList.add("reviewCol");

                var visitorRowBody = '';
                visitorRowBody += ' <p class="have-materials"> ';
                visitorRowBody += '<label class="labelRadiocontainer"><input type="radio" name="device' + deviceIndex + '" value="yes"/><span class="checkmark"></span></label>';
                if (devicesCount != 1)
                    visitorRowBody += '<label class="labelRadiocontainer"><input type="radio" name="device' + deviceIndex + '" value="No"/><span class="checkmark"></span>   </label>';
                visitorRowBody += '</p>';

                visitorRowBody += '<div class="form-row visitorRowData">';


                visitorRowBody += '<div class="form-group col-md-1 hidden">';
                visitorRowBody += '<input type="hidden" class="device-Id" value="' + device.ID + '" />';
                visitorRowBody += '</div>';

                visitorRowBody += '<div class="form-group info-data   col-md-7">';
                visitorRowBody += "<span ><sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,GridTitle_DeviceName%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </span><span> : </span>";
                visitorRowBody += '<span class="device-Name">' + device.DeviceType + '</span>';
                visitorRowBody += '</div>';


                //visitorRowBody += '<div class="form-group info-data  col-md-4">';

                //if ($("#hdnRequestType").val() == "0")
                //    visitorRowBody += '<p class="dateTime-label"> <i class=" mdi mdi-av-timer "></i>  وقت الدخول : ';
                //else
                //    visitorRowBody += '<p class="dateTime-label"> <i class=" mdi mdi-av-timer "></i>  وقت الخروج : ';

                //visitorRowBody += '<span class="time device-actiontime">' + device.ActionTime + '</span>';
                //visitorRowBody += '</p> </div>';

                visitorRowBody += '<div class="form-group info-data  col-md-7">';
                visitorRowBody += "<span > <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,ItemCount%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></span><span> : </span>";
                visitorRowBody += '<span class="time device-ItemCount">' + device.ItemsCount + '</span>';
                visitorRowBody += ' </div>';

                if (device.DeviceNumber != "") {
                    visitorRowBody += '<div class="form-group info-data  col-md-7">';
                    visitorRowBody += "<span > <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceNumber%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></span><span> : </span>";
                    visitorRowBody += '<span class="time device-quantity">' + device.DeviceNumber + '</span>';
                    visitorRowBody += ' </div>';
                }

                if (device.ManufacturingCompanyName != "") {
                    visitorRowBody += '<div class="form-group info-data  col-md-7">';
                    visitorRowBody += "<span > <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,ManufactringCompany%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </span><span> : </span>";
                    visitorRowBody += '<span class="time device-ManufacturingCompanyName"> ' + device.ManufacturingCompanyName + '</span>';
                    visitorRowBody += ' </div>';
                }

                if (device.NotesAboutDevice != "") {
                    visitorRowBody += '<div class="form-group info-data  col-md-6">';
                    visitorRowBody += "<span > <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,notes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></span><span> : </span>";
                    visitorRowBody += '<span class="time device-deviceNotes">' + device.NotesAboutDevice + '</span>';
                    visitorRowBody += ' </div>';
                }


                //End of form-row visitorRowData
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

    function viewRequestItem(rid) {

        getRequest(rid, function (data) {
            request = data;
            var userDepartmentCode = request.ApplicantAdministration;
            var applicantDepartmentName = getDepartmentName(userDepartmentCode, departmentList);
            var userSectionCode = request.ApplicantSection;
            var sectionName = "";
            if (userSectionCode != null && userDepartmentCode != null) {
                sectionName = getSectionName(userSectionCode, userDepartmentCode, sectionList);
            }
            $("#RequestNumb").text(request.ID);
            $("#EntryDate").text(GetHijriDate(request.DevicesRequestDate));
            $("#DevicesEnterTimeView").text(request.ActionTime);
            $("#applicantNamePreview").text(request.ApplicantName);
            $("#applicantTitlePreview").text(request.ApplicantRank);
            $("#applicantSectionPreview").text(sectionName);
            $("#applicantDepartmentPreview").text(applicantDepartmentName);
            $("#superVisorNamePreview").text(request.SupervisorName);
            $("#superVisorIdentityPreview").text(request.IdentityNumber);
            $("#superVisorWorkPreview").text(request.WorkingPlace);

            var devicesCount = request.RequestMachines.length;
            var deviceCount = 0;

            $(".request-devices-view").empty();

            for (var i = 0; i < devicesCount; i++) {

                var elem = document.createElement("tr");
                elem.classList.add("form-row", "reviewCol");

                var deviceRowBody = '';

                deviceRowBody += '<div class="form-group  col-md-2 ">';
                deviceRowBody += '<span class="nation-icon"></span>';
                if (i == 0)
                    deviceRowBody += "<label class='col-form-label'> <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,GridTitle_DeviceType%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </label>";
                deviceRowBody += '<p class="info-data">';
                deviceRowBody += request.RequestMachines[i].DeviceType;
                deviceRowBody += '</p>';
                deviceRowBody += '</div>';

                deviceRowBody += '<div class="form-group  col-md-1" style="flex: 0 0 8.33333%;">';
                deviceRowBody += '<span class="nation-icon"></span>';
                if (i == 0)
                    deviceRowBody += "<label class='col-form-label'> <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DevicesCount%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </label>";
                deviceRowBody += '<p class="info-data">';
                deviceRowBody += request.RequestMachines[i].ItemsCount;
                deviceRowBody += '</p>';
                deviceRowBody += '</div>';


                //if (request.RequestMachines[i].DeviceNumber != "") {
                deviceRowBody += '<div class="form-group  col-md-2 ">';
                deviceRowBody += '<span class="ID-icon"></span>';
                if (i == 0)
                    deviceRowBody += "  <label class='col-form-label'><sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceNumber%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>  </label>";
                deviceRowBody += '<p class="info-data">';
                deviceRowBody += '<span>';
                deviceRowBody += request.RequestMachines[i].DeviceNumber;
                deviceRowBody += '</span>';
                deviceRowBody += '<span class=" class="numberid"">';
                deviceRowBody += $(".deviceRow:eq(" + i + ") .device-IdentityType option:selected").text();
                deviceRowBody += '</span>';
                deviceRowBody += '</p >';
                deviceRowBody += '</div>';
                //}

                //if (request.RequestMachines[i].ManufacturingCompanyName != "") {
                deviceRowBody += '<div class="form-group  col-md-3 ">';
                deviceRowBody += '<span class="ID-icon"></span>';
                if (i == 0)
                    deviceRowBody += " <label class='col-form-label'> <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,CompanyName%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>   </label>";
                deviceRowBody += '<p class="info-data">';
                deviceRowBody += '<span>';
                deviceRowBody += request.RequestMachines[i].ManufacturingCompanyName;
                deviceRowBody += '</span>';
                deviceRowBody += '<span class=" class="numberid"">';
                deviceRowBody += $(".deviceRow:eq(" + i + ") .device-IdentityType option:selected").text();
                deviceRowBody += '</span>';
                deviceRowBody += '</p >';
                deviceRowBody += '</div>';
                //}

                //if (request.RequestMachines[i].NotesAboutDevice != "") {
                deviceRowBody += '<div class="form-group col-md-3">';
                deviceRowBody += '<span class="work-icon"></span>';
                if (i == 0)
                    deviceRowBody += " <label class='col-form-label'> <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>   </label>";
                deviceRowBody += '<p class="info-data">';
                deviceRowBody += request.RequestMachines[i].NotesAboutDevice;
                deviceRowBody += '<p>';
                deviceRowBody += '</div>';
                //}


                deviceRowBody += '</div>';

                elem.innerHTML = deviceRowBody;


                $(".request-devices-view").append(elem);
            }


            $('#viewModel').modal({ backdrop: 'static', keyboard: false });
            hideLoader();
        });

    }

    function postFinalRequestForApprove(requestObjectData, callback) {
        var url = apiRootAddress + "DevicesRequest/AddFinalAproveForRequest?ListSiteUrl=" + listSiteUrl;
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
        if (confirm("<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DoYouWantToRejectThisRequest%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>") == true) {

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
                    hideLoader();
                    alert("<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,ProcessDoneSuccessfully%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
                }
                else {
                    hideLoader();
                    alert(result.statusMessage);
                }
            });
        }
    }

    function openRejectRequestModel(rid) {
        $("#txtRejectComment").val("");
        getRequest(rid, function (data) {
            request = data;
            $("#requestNumberReject").text(request.ID);
            $("#requestDateReject").text(GetHijriDate(request.CreationDate));
            $("#visitDateReject").text(GetHijriDate(request.DevicesRequestDate));
            $("#applicantNameReject").text(request.ApplicantName);

            $('#rejectModelCenter').modal({ backdrop: 'static', keyboard: false });
            hideLoader();
        })
    }


    $("#btnReject").click(function (e) {
        e.preventDefault();

        if ($("#txtRejectComment").val().trim() == "") {
            $("#txtRejectComment").next("span").remove();
            $("#txtRejectComment").after("<span class='text-danger'>   <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,YouShouldEnterValueForThisField%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </span>");
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
                searchRequests();
                $('#rejectModelCenter').modal('hide');
                $("#sendModel").modal({ backdrop: 'static', keyboard: false });
                $("#btnReject").attr("disabled", false);
            }
            else {
                hideLoader();
                $("#btnReject").attr("disabled", false);
                alert(result.statusMessage);
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
                    $("#ddlSections").append('<option value="">' +"<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>');
                    data.forEach(function (item) {
                        $("#ddlSections").append('<option value="' + item.Code + '">' + item.Title + '</option>');
                    });
                }
            );

        } else {
            $("#ddlSections").empty();
            $("#ddlSections").append('<option value="">' +"<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>');
        }

    });

    function postInitialRequestApprove(requestData, callback) {
        var supervisorApproveAPI$ = apiRootAddress + 'DevicesRequest/AprroveSecurity?ListSiteUrl=' + listSiteUrl;

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

    function viewRequestItemForAction(e, rid) {
        event.preventDefault();
        event.stopPropagation();
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
            $("#visitEndDatePreview").text(GetHijriDate(request.VisitEndDate));
            $("#visitReasonPreview").text(request.VisitReasonValue);
            $("#visitReasonIDPreview").text(request.VisitReason);
            $("#applicantNamePreview").text(request.UserName);
            $("#applicantTitlePreview").text(request.ApplicantRank);
            $("#applicantSectionPreview").text(sectionName);
            $("#applicantDepartmentPreview").text(applicantDepartmentName);
            $("#txtNote").val("");


            var devicesCount = request.VisitPersons.length;
            var deviceCount = 0;

            $(".request-visitors-review").empty();

            request.VisitPersons.forEach(function (visitor) {
                var elem = document.createElement("div");
                elem.classList.add("visitorRow");
                elem.classList.add("reviewCol");

                var visitorRowBody = '';

                visitorRowBody = '<div class="form-row visitorRowData">';
                visitorRowBody += '<div class="form-group col-md-1">';
                visitorRowBody += '<label class="labelcontainer"><input type="checkbox" checked="checked" data-person="' + visitor.ID + '" class="visitor-checkbox" /><span class="checkmark"></span></label> '
                visitorRowBody += '</div>';

                visitorRowBody += '<div class="form-group col-md-1 hidden">';
                visitorRowBody += '<input type="hidden" class="visitor-Id" value="' + visitor.ID + '" />';
                visitorRowBody += '</div>';

                visitorRowBody += '<div class="form-group info-data   col-md-7">';
                visitorRowBody += '<span class="visitor-Name">' + visitor.PersonName + '</span>';
                visitorRowBody += '</div>';


                visitorRowBody += '<div class="form-group info-data  col-md-4">';
                visitorRowBody += "<p class='dateTime-label'> <i class='mdi mdi-av-timer'></i>  <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,VisitTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>  : ";
                visitorRowBody += '<span class="time">' + visitor.VisitTime + '</span>';
                visitorRowBody += '</p></div>';

                visitorRowBody += '<div class="form-group   col-md-4">';
                visitorRowBody += '<span class="nation-icon"></span>';
                visitorRowBody += "<label class='col-form-label'><sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,Nationality%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </label>";
                visitorRowBody += '<input type="hidden" class="visitor-NationalityID" value="' + visitor.Nationality + '" /><p class="visitor-Nationality info-data">' + visitor.NationalityValue + '</p>';
                visitorRowBody += '</div>';


                visitorRowBody += '<div class="form-group  col-md-4">';
                visitorRowBody += '<span class="ID-icon"></span>';
                visitorRowBody += '<p class="info-data">';
                visitorRowBody += '<span class="visitor-IdentityNumber">' + visitor.IdentityNumber + '</span>';

                visitorRowBody += '<input type="hidden" class="visitor-IdentityTypeID" value="' + visitor.IdentityType + '" /><span class="visitor-IdentityType info-data numberid">' + visitor.IdentityTypeValue + '</span>';
                visitorRowBody += '</p >'
                visitorRowBody += '</div>';



                visitorRowBody += '<div class="form-group   col-md-4">';
                visitorRowBody += '<span class="work-icon"></span>';
                visitorRowBody += "<label class='col-form-label'><sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,security__workPlace%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>  </label>";
                visitorRowBody += '<p class="visitor-WorkingPlace info-data">' + visitor.WorkingPlace + '</p>';
                visitorRowBody += '</div>';


                //End of form-row visitorRowData
                visitorRowBody += '</div>';

                visitorRowBody += '<div class=" visitor-row-devices">';
                visitorRowBody += '<div class="form-row">';
                visitorRowBody += '<div class="form-group col-md-12 devices-title">';
                visitorRowBody += '<span class="devices-icon"></span>';
                visitorRowBody += "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,AttachedDevices%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                visitorRowBody += '</div>';
                visitorRowBody += '</div>';

                if (visitor.VisitDevices != null && visitor.VisitDevices.length > 0) {
                    visitor.VisitDevices.forEach(function (device) {
                        visitorRowBody += '<div class="form-row deviceRow devices">';

                        visitorRowBody += '<div >';
                        visitorRowBody += '<label class="labelcontainer"><input type="checkbox" checked="checked" class="device-checkbox" data-person="' + visitor.ID + '" /><span class="checkmark"></span></label>'
                        visitorRowBody += '</div>';

                        visitorRowBody += '<div class="form-group col-md-1 hidden">';
                        visitorRowBody += '<input type="text" class="device-Id" value="' + device.ID + '" />';
                        visitorRowBody += '</div>';

                        visitorRowBody += '<p class="devicetype ">';
                        visitorRowBody += '<span> ' + device.DeviceType + '  </span>';
                        visitorRowBody += '<span class="info-data">( ' + device.ManufacturingCompanyName + ' ) </span>';
                        visitorRowBody += '</p>';


                        visitorRowBody += '<p class="info-data">';
                        visitorRowBody += device.DeviceNumber;
                        visitorRowBody += '</p>';

                        visitorRowBody += '<p class="info-data">';
                        visitorRowBody += device.NotesAboutDevice;
                        visitorRowBody += '</p>';

                        visitorRowBody += '</div>';
                    });
                }
                else {
                    visitorRowBody += "<p class='welcome' style='padding:5px 60px;color:#333333'><sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,ThereIsNoDevicesForVisitor%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></p>";
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
        var visitReasonsDataAPI$ = apiRootAddress + "DevicesRequest/GetRequestDetails?ListSiteUrl=" + listSiteUrl + "&RequestID=" + id;
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

    $("#btnSubmit").click(function (e) {
        e.preventDefault();
        var allDevices = $(".request-visitors-review .visitorRow").length;
        var isFormValid = true;
        $("#btnSubmit").attr("disabled", true);
        for (var i = 0; i < allDevices; i++) {

            $(".visitorRow:eq(" + i + ")").find("span").closest(".text-danger").remove();
            $(".visitorRow:eq(" + i + ") .have-materials");
            if ($(".visitorRow:eq(" + i + ") .have-materials").find("input").closest("input[name='device" + i + "']:checked").length == 0) {
                $(".visitorRow:eq(" + i + ") .have-materials").append("<span class='text-danger'>يجب تحديد الإجراء لهذا العنصر</span>");
                isFormValid = false;
            }
        }


        for (var i = 0; i < $("[required]").length; i++) {
            $("[required]:eq(" + i + ")").next("span").remove();

            if ($("[required]:eq(" + i + ")").val().trim() === '') {
                $("[required]:eq(" + i + ")").after("<span class='text-danger'>   <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,YouShouldEnterValueForThisField%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>  </span>");
                isFormValid = false;
            }
        }
        if (!isFormValid) {
            $(".submitError").text(" بيانات قبول الطلب غير مكتمة برجاء إكمال البياات المطلوبة");
            $("#btnSubmit").attr("disabled", false);
            return;
        }
        showLoader();
        $(".submitError").text("");
        showLoader();
        $("#btnSubmit").attr("disabled", true);
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
            "ReqID": $("#deviceRequestIDPreview").text(),
            "Status": "1",
            "StatusNote": matrialsNotesObject,
            "Gate": $("#ddlGates").val()
        };

        postInitialRequestApprove(JSON.stringify(initialApprovePostData), function (data) {

            var requestObject =
            {
                ID: $("#deviceRequestIDPreview").text(),
                RequestType: 0,
                RequestMessage: $("#deviceMessageTitlePreview").text(),
                DevicesRequestDate: $("#deviceEntryDatePreview").text(),
                ActionTime: $("#DevicesEnterTimePreview").text(),
                SupervisorName: $("#devicesuperVisorNamePreview").text(),
                IdentityNumber: $("#devicesuperVisorIdentityPreview").text(),
                WorkingPlace: $("#devicesuperVisorWorkPreview").text(),
                ApplicantSection: $("#deviceApplicantSectionPreview").text(),
                ApplicantRank: $("#deviceApplicantTitlePreview").text(),
                ApplicantAdministration: $("#deviceApplicantDepartmentPreview").text(),
                ApplicantName: $("#deviceApplicantNamePreview").text(),
                ISDeleted: false,
                RequestMachines: []
            };



            requestObject.RequestMachines = [];

            var machinesCount = $(".request-visitors-review .visitorRow").length;

            for (var i = 0; i < machinesCount; i++) {
                var checkedMaterial = $(".visitorRow:eq(" + i + ") .have-materials").find("input").closest("input[type='radio']:checked");
                if (checkedMaterial && checkedMaterial.val() == "yes") {

                    //if ($(".visitorRow:eq(" + i + ") .have-materials").find("input").closest("input[type='radio']:checked")) {
                    //    if ($(".visitorRow:eq(" + i + ") .have-materials").find("input").closest("input[type='radio']:checked").val() == "yes") {
                    machine = {};
                    machine.ID = $(".visitorRow:eq(" + i + ") .device-Id").val();
                    machine.DeviceType = $(".visitorRow:eq(" + i + ") .device-Name").text();
                    machine.DeviceNumber = $(".visitorRow:eq(" + i + ") .device-quantity").text();
                    machine.ManufacturingCompanyName = $(".visitorRow:eq(" + i + ") .device-ManufacturingCompanyName").text();
                    machine.NotesAboutDevice = $(".visitorRow:eq(" + i + ") .device-deviceNotes").text();
                    machine.IsDeleted = false;
                    machine.ItemsCount = $(".visitorRow:eq(" + i + ") .device-ItemCount").text();
                    requestObject.RequestMachines.push(machine);

                }

            }
            postFinalRequestForApprove(JSON.stringify(requestObject), function (result) {
                if (result.statusCode == 1) {
                    $('#myModal').modal('hide');
                    searchRequests();
                    $("#btnSubmit").attr("disabled", false);
                    $(".reviewCol").click(function () {
                        $(this).toggleClass("opend");
                    });
                    $("#sendModel").modal({ backdrop: 'static', keyboard: false });
                    showLoader();

                }
                else {
                    hideLoader();
                    $("#btnSubmit").attr("disabled", false);
                    alert(result.statusMessage);
                }

            });
        });


    });
    function showSendMsg(Msg) {
        $(".daytext").text("");
        $('#sendModel').modal({ backdrop: 'static', keyboard: false });

    }

    $(document).on("change", ".request-visitors-review [type=radio]", function (event) {
        $(this).closest('.visitorRow').find('.text-danger').addClass("hidden");
        var allDevices = $(".request-visitors-review .visitorRow").length;
        for (var i = 0; i < allDevices; i++) {
            $(".visitorRow:eq(" + i + ")").find("span").closest(".text-danger").remove();
            $(".submitError").text("");
            $(".visitorRow:eq(" + i + ") .have-materials");
            if ($(".visitorRow:eq(" + i + ") .have-materials").find("input").closest("input[name='device" + i + "']:checked").length == 0) {
                $(".visitorRow:eq(" + i + ") .have-materials").append("<span class='text-danger'>يجب تحديد الإجراء لهذا العنصر</span>");
                $(".submitError").text(" بيانات قبول الطلب غير مكتمة برجاء إكمال البياات المطلوبة");

            }
        }
        for (var i = 0; i < $("[required]").length; i++) {
            $("[required]:eq(" + i + ")").next("span").remove();

            if ($("[required]:eq(" + i + ")").val().trim() === '') {
                $("[required]:eq(" + i + ")").after("<span class='text-danger'>   <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,YouShouldEnterValueForThisField%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>  </span>");
                $(".submitError").text(" بيانات قبول الطلب غير مكتمة برجاء إكمال البياات المطلوبة");
            }
        }


        // $(this).closest('.visitorRow').find('.text-danger').addClass("hidden");
        // $(".submitError").text("");

        // if ($(".request-visitors-review input[value='yes']:checked").length > 0) {

        //     $("#btnSubmit").attr("disabled", false);
        // }
        // else {
        //     $("#btnSubmit").attr("disabled", true);
        // }


    });
    $('#sendModel').on('hidden.bs.modal', function () {
        hideLoader();
    })
    $('.textPicker').on('input', function () {
        if ($(this).val() == "") {
            $(this).siblings(".daytext").text(" ");

        }
    });
    $("#lblGridTitle_RequestNumberth1").click(function () {
        sort = !sort;
        renderSearchResult(mydata, sort);
    });
    $("#btnReset").click(function (e) {
        e.preventDefault();
        ResetSearch();
    });
    function ResetSearch() {
        $("#txtRequestNumber").val("");
        $("#txtRequestDate").val("");
        $("#txtRequestEnterDate").val("");
        $("#txtApplicantName").val("");
        $("#txtDelegateName").val("");
        $("#txtDeviceType").val("");
        $("#ddlDepartments").val("");
        $("#ddlSections").val("");
        $("#txtRequestDate").next().text(" ");
        $("#txtRequestEnterDate").next().text(" ");
    }

</script>

