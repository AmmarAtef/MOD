<%@ Assembly Name="DevicesRequestsWFWebparts, Version=1.0.0.0, Culture=neutral, PublicKeyToken=97afcd5d4112e71c" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SupervisorDevicesRequestsWPUserControl.ascx.cs" Inherits="DevicesRequestsWFWebparts.SupervisorDevicesRequestsWP.SupervisorDevicesRequestsWPUserControl" %>

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
                <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,FilterData %>"></asp:Literal>
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
                        <asp:Label class="col-form-label" ID="lblGridTitle_RequestDelegateName" runat="server"
                            Text="<%$Resources:MachinesRequests,GridTitle_RequestDelegateName %>" ClientIDMode="Static">
                        </asp:Label>
                        <input type="text" id="txtDelegateName" class="form-control" />
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <asp:Label class="col-form-label" ID="lblGridTitle_RequestApplicantName" runat="server"
                            Text="<%$Resources:MachinesRequests,GridTitle_RequestOwnerName %>" ClientIDMode="Static">
                        </asp:Label>
                        <input type="text" id="txtApplicantName" class="form-control" />
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
                <div class=" col-md-12">
                </div>

                <div class="form-group col-md-6">
                    <button id="btnSearch" class="btn preview-btn send-btn">
                        <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,Search %>"></asp:Literal>
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
                            <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,TotalAvaliableRequests %>">
                            </asp:Literal>
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
                                <span>
                                    <asp:Literal runat="server"
                                        Text="<%$Resources:MachinesRequests,GridTitle_RequestOwnerName %>">
                                    </asp:Literal>
                                </span>
                            </th>

                            <th class="col-xs-2">
                                <asp:Label ID="lblGridTitle_RequestDateth2" runat="server"
                                    Text="<%$Resources:MachinesRequests,GridTitle_RequestDate %>" ClientIDMode="Static">
                                </asp:Label>
                            </th>

                            <th class="col-xs-2">
                                <asp:Label runat="server" ID="lblGridTitle_RequestEnterDate1" ClientIDMode="Static">
                                </asp:Label>

                            </th>
                            <th class="col-xs-2">
                                <asp:Label ID="lblGridTitle_RequestDelegateNameth2" runat="server"
                                    Text="<%$Resources:MachinesRequests,GridTitle_RequestDelegateName %>"
                                    ClientIDMode="Static">
                                </asp:Label>
                            </th>

                            <th class="col-xs-2 count">
                                <span>
                                    <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,DeviceCount %>">
                                    </asp:Literal>
                                </span>
                            </th>
                            <th class="viewoption"></th>

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
                            <span>
                                <asp:Literal runat="server"
                                    Text="<%$Resources:MachinesRequests,GridTitle_RequestOwnerName %>"></asp:Literal>
                            </span>
                        </th>

                        <th class="col-xs-2">
                            <asp:Label ID="lblGridTitle_RequestDateth1" runat="server"
                                Text="<%$Resources:MachinesRequests,GridTitle_RequestDate %>" ClientIDMode="Static">
                            </asp:Label>
                        </th>

                        <th class="col-xs-2">
                            <asp:Label runat="server" ID="lblGridTitle_RequestEnterDate" ClientIDMode="Static">
                            </asp:Label>

                        </th>
                        <th class="col-xs-2">
                            <asp:Label ID="lblGridTitle_RequestDelegateNameth1" runat="server"
                                Text="<%$Resources:MachinesRequests,GridTitle_RequestDelegateName %>"
                                ClientIDMode="Static">
                            </asp:Label>
                        </th>

                        <th class="col-xs-2 count">
                            <span>
                                <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,DeviceCount %>">
                                </asp:Literal>
                            </span>
                        </th>


                        <th class="viewoption" style="text-align: right">
                            <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,RequestReview %>">
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
                        <asp:Label runat="server" ID="lblSecurity__RequestEntryDevicesText1" ClientIDMode="Static">
                        </asp:Label>

                    </p>
                    <p class="visitnumber">
                        <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,security__number%>">
                        </asp:Literal>
                        : <span id="VisitNumb"></span>
                    </p>

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p class="request-msgtitle">
                        <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,RequestMessage %>">
                        </asp:Literal>
                    </p>
                    <p class="request-msg">
                        <span id="DeviceEnterMessageTitle"></span>

                    </p>


                    <div class="visitinfo">
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <i class=" mdi mdi-calendar "></i>
                                <asp:Label runat="server" class="info-data" Text="<%$Resources:MachinesRequests,GridTitle_RequestDate %>" ID="GridTitle_RequestDate" ClientIDMode="Static">
                                </asp:Label>
                                <p id="DevicesRequestDatePreview" class="info-data"></p>
                            </div>
                            <div class="form-group col-md-4">
                                <i class=" mdi mdi-calendar "></i>
                                <asp:Label runat="server" class="info-data" ID="GridTitle_RequestEnterDate" ClientIDMode="Static">
                                </asp:Label>
                                <p id="DevicesEnterDatePreview" class="info-data"></p>
                            </div>

                            <div class="form-group col-md-4">
                                <i class=" mdi mdi-timer "></i>
                                <asp:Label runat="server" class="info-data" ID="lblEntryTime"
                                    ClientIDMode="Static">
                                </asp:Label>
                                <p id="DevicesEnterTimePreview" class="info-data"></p>
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
                                    <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,DelegateName %>">
                                    </asp:Literal>
                                </label>
                                <p id="delegateNamePreview" class="info-data"></p>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="col-form-label">
                                    <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,DelegateID %>">
                                    </asp:Literal>
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
                            <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,DevicesData %>">
                            </asp:Literal>
                        </p>
                    </div>
                    <div class="request-device-review"></div>

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

                    <asp:Label runat="server" ID="lblSecurity__acceptEnterDevices" ClientIDMode="Static">
                    </asp:Label>
                </p>
                <p class="visitnumber">
                    <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,security__number %>"></asp:Literal>
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
                            <asp:Label ID="RequestDate" runat="server"
                                class="info-data" Text="<%$Resources:MachinesRequests,RequestDate %>" ClientIDMode="Static">
                            </asp:Label>
                            <p id="requestDateAccept" class="info-data"></p>
                        </div>
                        <div class="form-group col-md-4">
                            <i class=" mdi mdi-calendar "></i>
                            <asp:Label runat="server" class="info-data" ID="GridTitle_RequestEnterDate2" ClientIDMode="Static">
                            </asp:Label>
                            <p id="DevicesEnterDateAccept" class="info-data"></p>
                        </div>
                        <div class="form-group col-md-4">
                            <i class=" mdi mdi-timer "></i>
                            <asp:Label runat="server" class="info-data" ID="lblEntryTime2"
                                ClientIDMode="Static">
                            </asp:Label>
                            <p id="DevicesEnterTimeAccept" class="info-data"></p>
                        </div>
                        <%--<div class="form-group col-md-4">
                            <i class=" mdi mdi-calendar "></i>
                            <asp:Label ID="DelegateNamemodal" runat="server"
                                Text="<%$Resources:MachinesRequests,DelegateName %>" ClientIDMode="Static">
                            </asp:Label>
                            <p id="txtSupervisorName" class="info-data"></p>
                        </div>--%>
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
                                <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,DelegateName %>">
                                </asp:Literal>
                            </label>
                            <p id="delegateNamePreview1" class="info-data"></p>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-form-label">
                                <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,DelegateID %>">
                                </asp:Literal>
                            </label>
                            <p id="delegateNumberPreview1" class="info-data"></p>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-form-label">
                                <asp:Literal runat="server"
                                    Text="<%$Resources:MachinesRequests,security__workPlace %>"></asp:Literal>
                            </label>
                            <p id="delegateWorkPreview1" class="info-data"></p>
                        </div>
                    </div>
                </div>

                <div class="heading-title">
                    <p>
                        <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,DevicesData %>">
                        </asp:Literal>
                    </p>
                </div>
                <div class="request-device-review"></div>
                <div class="form-row">
                    <div class="col-md-7">
                        <p class="welcome">
                            <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:MachinesRequests,notes %>">
                            </asp:Literal>
                        </p>
                        <textarea id="txtAcceptComment" class="form-control" cols="50" rows="5">

                                        </textarea>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button class="btn preview-btn send-btn" id="btnReject" type="button" data-target="#acceptModelCenter"
                    data-toggle="modal">
                    <span id="btnActionText">
                        <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,PassRequest %>"></asp:Literal>
                    </span>
                </button>
                <!-- <button type="button" id="btnReject" class="btn preview-btn send-btn" data-toggle="modal"
                                    data-target="#acceptModelCenter"><span id="btnActionText"></span></button>
                                <button type="button" class="btn preview-btn " data-dismiss="modal">إغلاق</button> -->
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
                    <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,YourRequestSendSuccessfully %>">
                    </asp:Literal>
                </p>
            </div>

        </div>

    </div>

</div>

<script src="/modwf/style Library/branding/js/general/helpers.js"></script>
<script src="/modwf/style Library/branding/js/general/devicesShared.js"></script>
<script type="text/javascript">

    var mydata;
    var sort;
    var search = false;
    var apiRootAddress = $("#hdnAPIRootURL").val();
    var listSiteUrl = $("#hdnWFWebUrl").val();
    var requestType = $("#hdnRequestType").val();
    var currentUserId = _spPageContextInfo.userId;
    var search = false;
    

    $(function () {

        getAllStatuses(
            apiRootAddress,
            function (data) {
                $("#ddlStatuses").append('<option value="">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>');
                data.forEach(function (item) {
                    $("#ddlStatuses").append('<option value="' + item.Code + '">' + item.Title + '</option>');
                });
            }
        );


        if ($("#hdnRequestType").val() == "0") {
            document.getElementById("lblGridTitle_RequestEnterDate").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,security__deviceEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblGridTitle_RequestEnterDate1").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,DevicesEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblGridTitle_RequestEnterDate2").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,DevicesEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("GridTitle_RequestEnterDate").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,GridTitle_RequestEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("GridTitle_RequestEnterDate2").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,GridTitle_RequestEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblSecurity__acceptEnterDevices").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,security__acceptEnterDevices%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("security_SendResponsForEnterDevice").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,security_SendResponsForEnterDevice%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblEntryTime").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,DeviceEnterTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblEntryTime2").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,DeviceEnterTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";

        } else {

            document.getElementById("lblGridTitle_RequestEnterDate").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,security__deviceEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblGridTitle_RequestEnterDate1").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,DevicesEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblGridTitle_RequestEnterDate2").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,DevicesEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("GridTitle_RequestEnterDate").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,GridTitle_RequestEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("GridTitle_RequestEnterDate2").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,GridTitle_RequestEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblSecurity__acceptEnterDevices").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,security__acceptEnterDevices%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("security_SendResponsForEnterDevice").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,security_SendResponsForEnterDevice%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblEntryTime").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,DeviceEnterTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblEntryTime2").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,DeviceEnterTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
        }

        var searchRequestsAPI$ = apiRootAddress + "DevicesRequest/SearchRequests?ListSiteUrl=" + listSiteUrl + "&UserID=0&RequestID=0&CreationDate=&RequestDate=&ApplicantName=&SupervisorName=&DeviceType=&DepartmentCode=&SectionCode=&RequestState=&OnlyToday=true&RequestType=" + $("#hdnRequestType").val() + "&Department=" + $("#hdnDepartment").val();
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
        searchRequest();
    });

    $("#btnRefreshData").click(function (e) {
        e.preventDefault();
        searchRequest();
    });

    $("#showSearch").click(function () {
        $("#SearchOptions").toggleClass("is-opend");
    });

    $("#btnReject").click(function (e) {
        e.preventDefault();
        var isFormValid = true;
        for (var i = 0; i < $("[required]").length; i++) {
            $("[required]:eq(" + i + ")").next("span").remove();

            if ($("[required]:eq(" + i + ")").val().trim() === '') {
                $("[required]:eq(" + i + ")").after("<span class='text-danger'> <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,YouShouldEnterValueForThisField%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>   </span>");
                isFormValid = false;
            }
        }
        if (!isFormValid) {
            return;
        }

        showLoader();
        $("#btnReject").attr("disabled", true);
        var requestData = {
            "Group": "DEV",
            "ReqID": $("#requestNumberAccept").text(),
            "Status": $("#hdnActionType").val(),
            "StatusNote": $("#txtAcceptComment").val() == "" ? "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,ThereIsNoNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" : $("#txtAcceptComment").val()
        };
        $('#actionModelCenter').modal('hide');
        $("#sendModel").modal({ backdrop: 'static', keyboard: false });
        

        doRequestAction(JSON.stringify(requestData), function () {
            hideLoader();
        });
    });

    $("#btnSearch").click(function (e) {
        e.preventDefault();
        searchRequest();
    });

    $('#sendModel').on('hidden.bs.modal', function () {
        hideLoader();
        //  window.location.href = "default.aspx";
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

    function showSendMsg(Msg) {
        $(".daytext").text("");
        $('#sendModel').modal('show');

    }

    function changePaggerNumb() {
        renderSearchResult(actualData);

    }

    function doRequestAction(requestData, callback) {
        var supervisorApproveAPI$ = apiRootAddress + 'DevicesRequest/AprroveSupervisor?ListSiteUrl=' + listSiteUrl;

        $.ajax({
            url: supervisorApproveAPI$,
            type: 'POST',
            contentType: 'application/json',
            data: requestData,
            success: function (result) {
                if (result.statusCode == 1) {
                    callback();
                    showSendMsg("<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,YourRequestSendSuccessfully%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
                    hideLoader();
                    $("#btnReject").attr("disabled", false);
                }
                else {
                    hideLoader();
                    $("#btnReject").attr("disabled", false);
                    alert("<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,SomeThingError%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
                }
            }
            ,
            error: function (err) {
                alert(err.statusText);
            },

            complete: function () {

            }

        });
    }

    function renderSearchResult(data, sort, search) {
        sort = false;
        //search = false;
        $("#dataTable > tbody").empty();
        $(".PaggerDiv").show();
        var datacount = 0;
        if (data == null || data.length == 0) {
            $("#dataTable > tbody").append("<tr><td><sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,ThereIsNoData%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </td></tr>");
            
            $("#RowNumb").text("0");
            $(".PaggerDiv").hide();
            return;
        }

        groupedRequestsData = groupBy(data, 'RequestID');
        if (!sort)
            groupedRequestsData = Object.keys(groupedRequestsData).map(function (itm) { return groupedRequestsData[itm]; }).reverse();
        if (sort)
            groupedRequestsData = Object.keys(groupedRequestsData).map(function (itm) { return groupedRequestsData[itm]; });



        for (var arrayInside in groupedRequestsData) {
            var HTML = "";

            var innerDivs = "";
            var requestDevicesCount = 0;
            for (var i = 0; i < groupedRequestsData[arrayInside].length; i++) {
                if (i >= 0) {
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
                    var supervisorStatus = groupedRequestsData[arrayInside][i].SupervisorStatus;
                    var securityStatus = groupedRequestsData[arrayInside][i].SecurityStatus;
                    var supervisorStatusText = securityStatus === "" ? "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,InProgress%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> " : securityStatus === "1" ? "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,Accepted%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> " : "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,Rejected%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                    var disableStatusText = supervisorStatus === "" ? " " : supervisorStatus === "1" ? " disable" : "disable ";
                    var supervisorStatusClass = supervisorStatus === "" ? "waiting" : supervisorStatus === "1" ? "accepted" : "rejected";
                    var visitorsCount = groupedRequestsData[arrayInside].length;

                    var statusText = "";
                    if (supervisorStatus == "") {
                        statusText = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,InProgress%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> ";
                        supervisorStatusClass = "waiting";
                    } else if (supervisorStatus == "2") {
                        statusText = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,Redirect%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> ";
                        supervisorStatusClass = "rejected";
                    }
                    else if (supervisorStatus == "1") {
                        if (securityStatus == "") {
                            statusText = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,InProgress%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> ";
                            supervisorStatusClass = "waiting";
                        } else if (securityStatus == "1") {
                            statusText = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,Accepted%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> ";
                            supervisorStatusClass = "accepted";
                        } else if (securityStatus == "2") {
                            statusText = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,Rejected%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                            supervisorStatusClass = "rejected";
                        }
                    }
                    var ele = groupedRequestsData[arrayInside][i];
                    var requestDate = GetHijriDate(groupedRequestsData[arrayInside][i].DevicesRequestDate);
                    var requestCreationDate = GetHijriDate(groupedRequestsData[arrayInside][i].CreationDate);
                    HTML += '<tr id="mainTable" >'
                        + '<td>' + requestID + '</td>'
                        + '<td>' + groupedRequestsData[arrayInside][i].ApplicantName + '</td>'
                        + '<td>' + GetHijriDate(groupedRequestsData[arrayInside][i].CreationDate) + '</td>'
                        + '<td>' + GetHijriDate(groupedRequestsData[arrayInside][i].DevicesRequestDate) + '</td>'
                        + '<td>' + trimString(groupedRequestsData[arrayInside][i].SupervisorName, 20) + '</td>'
                    if (!search) {
                        //HTML += '<td>  ' + groupedRequestsData[arrayInside].length + ' </td>';
                        HTML += '<td>  ' + requestDevicesCount + ' </td>';
                    }

                    var obj = {
                        id: requestID,
                        requestDate: requestCreationDate,
                        SupervisorName: ele.SupervisorName,
                        applicantName: ele.ApplicantName
                    };
                    //  HTML +=  `<td class="viewoption"><a class="options-list review" href="javascript:viewRequestItem(` + requestID + `)"></a><a class="options-list accepted" href="javascript:openAcceptRequestModel(` + requestID + `,'` + requestDate + `','` + ele.SupervisorName + `','` + ele.ApplicantName + `')"></a><a class="options-list rejected" href="javascript:openRejectRequestModel(` + requestID + `,'` + requestDate + `','` + ele.SupervisorName + `','` + ele.applicantName + `')"></a><span class="options-list showmore" role="button" data-toggle="collapse" href="#row` + requestID + `" aria-expanded="false" aria-controls="row` + requestID + `"></span></td>`
                    HTML += "<td class='viewoption'><a title='<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,ViewDevice%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>' class='options-list review' href='javascript:viewRequestItem(" + requestID + ")'></a><a title='<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,AcceptDevice%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>' class='options-list accepted' href='javascript:openAcceptRequestModel(" + JSON.stringify(obj) + ")'></a><a title='<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,RejectDevice%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>' class='options-list rejected' href='javascript:openRejectRequestModel(" + JSON.stringify(obj) + ")'></a><span class='options-list showmore' role='button' data-toggle='collapse' href='#row" + requestID + "' aria-expanded='false' aria-controls='row" + requestID + "'></span></td>"

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

    function openAcceptRequestModel(obj) {
        $("#btnReject").attr("disabled", false);
        getRequest(obj.id, apiRootAddress, function (data) {
            request = data;
            $("#hdnActionType").val("1");
            $("#DevicesEnterTimeAccept").text(request.ActionTime);
            $("#DevicesEnterDateAccept").text(GetHijriDate(request.DevicesRequestDate))
        //});
        if ($("#hdnRequestType").val() == "0")
            $("#exampleModalLongTitleAction").html('تمرير طلب إدخال اجهزة');
        else
            $("#exampleModalLongTitleAction").html('تمرير طلب خروج اجهزة');
        $("#btnActionText").text("<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,PassRequest%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
        $("#requestNumberAccept").text(obj.id);
        $("#requestDateAccept").text(obj.requestDate);
        $("#txtSupervisorName").text(obj.SupervisorName);
        $("#applicantNameAccept").text(obj.applicantName);
        $("#txtAcceptComment").next("span.text-danger").remove();
        $("#txtAcceptComment").removeAttr("required");
        $("#txtAcceptComment").val('');
        //getRequest(obj.id, apiRootAddress, function (data) {
        //    request = data;

            $("#delegateNamePreview1").text(request.SupervisorName);
            $("#delegateNumberPreview1").text(request.IdentityNumber);
            $("#delegateWorkPreview1").text(request.WorkingPlace);


            var visitorsCount = request.RequestMachines.length;
            var deviceCount = 0;

            $(".request-device-review").empty();

            for (var i = 0; i < visitorsCount; i++) {
                var elem = document.createElement("tr");
                elem.classList.add("form-row", "reviewCol");

                var deviceRowBody = '';

                deviceRowBody += '<div class="form-group  col-md-2 ">';
                deviceRowBody += '<span class="nation-icon"></span>';
                if (i == 0)
                    deviceRowBody += "<label class='col-form-label'><sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceType%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>  </label>";
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
                    deviceRowBody += "<label class='col-form-label'> <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceNumber%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </label>";
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
                    deviceRowBody += " <label class='col-form-label'>  <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,CompanyName%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>  </label>";
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
                    deviceRowBody += "<label class='col-form-label'> <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>   </label>";
                deviceRowBody += '<p class="info-data">';
                deviceRowBody += request.RequestMachines[i].NotesAboutDevice;
                deviceRowBody += '<p>';
                deviceRowBody += '</div><div class="form-group col-md-1"></div>';
                //}


                deviceRowBody += '</div>';

                elem.innerHTML = deviceRowBody;


                $(".request-device-review").append(elem);
            }


            if (request.SecurityNote != null && request.SecurityNote != "") {
                $("#requestNoteDIV").show();
                $("#requestNoteTitle").html("<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,SecurityNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> ");
                $("#requestNoteText").html(request.SecurityNote);

            } else if (request.SuperVisiorNote != null && request.SuperVisiorNote != "") {
                $("#requestNoteDIV").show();
                $("#requestNoteTitle").html(" <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DelegateNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
                $("#requestNoteText").html(request.SuperVisiorNote);
            }
            else {
                $("#requestNoteDIV").hide();
            }

            $('#actionModelCenter').modal({ backdrop: 'static', keyboard: false });
            $(".reviewCol").click(function () {
                $(this).toggleClass("opend");
            });
            hideLoader();
        });

    }

    function doRequestAction(requestData, callback) {
        var supervisorApproveAPI$ = apiRootAddress + 'DevicesRequest/AprroveSupervisor?ListSiteUrl=' + listSiteUrl;

        $.ajax({
            url: supervisorApproveAPI$,
            type: 'POST',
            contentType: 'application/json',
            data: requestData,
            success: function (result) {
                if (result.statusCode == 1) {
                    searchRequest();
                    callback();
                }
                else {
                    hideLoader();
                    alert("<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,SomeThingError%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> ");
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

    function openRejectRequestModel(obj) {
            $("#hdnActionType").val("2");
        $("#btnReject").attr("disabled", false);
        if ($("#hdnRequestType").val() == "0")
            $("#exampleModalLongTitleAction").html('رفض طلب إدخال اجهزة');
        else
            $("#exampleModalLongTitleAction").html('رفض طلب خروج اجهزة');

        getRequest(obj.id, apiRootAddress, function (data) {
            request = data;
            $("#DevicesEnterTimeAccept").text(request.ActionTime);
            $("#DevicesEnterDateAccept").text(GetHijriDate(request.DevicesRequestDate))
        //});
      
        $("#btnActionText").text("<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,Redirect%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");

        $("#requestNumberAccept").text(obj.id);
        $("#requestDateAccept").text(obj.requestDate);
        $("#txtSupervisorName").text(obj.SupervisorName);
        $("#applicantNameAccept").text(obj.applicantName);
        $("#txtAcceptComment").next("span.text-danger").remove();
        $("#txtAcceptComment").attr("required", "required");
        $("#txtAcceptComment").val('');
        //getRequest(obj.id, apiRootAddress, function (data) {
        //    request = data;

            $("#delegateNamePreview1").text(request.SupervisorName);
            $("#delegateNumberPreview1").text(request.IdentityNumber);
            $("#delegateWorkPreview1").text(request.WorkingPlace);


            var visitorsCount = request.RequestMachines.length;
            var deviceCount = 0;

            $(".request-device-review").empty();

            for (var i = 0; i < visitorsCount; i++) {
                var elem = document.createElement("tr");
                elem.classList.add("form-row", "reviewCol");

                var deviceRowBody = '';

                deviceRowBody += '<div class="form-group  col-md-2 ">';
                deviceRowBody += '<span class="nation-icon"></span>';
                if (i == 0)
                    deviceRowBody += "<label class='col-form-label'><sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceType%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>  </label>";
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
                    deviceRowBody += "<label class='col-form-label'> <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceNumber%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </label>";
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
                    deviceRowBody += " <label class='col-form-label'>  <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,CompanyName%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>  </label>";
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
                    deviceRowBody += "<label class='col-form-label'> <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>   </label>";
                deviceRowBody += '<p class="info-data">';
                deviceRowBody += request.RequestMachines[i].NotesAboutDevice;
                deviceRowBody += '<p>';
                deviceRowBody += '</div><div class="form-group col-md-1"></div>';
                //}


                deviceRowBody += '</div>';

                elem.innerHTML = deviceRowBody;


                $(".request-device-review").append(elem);
            }


            if (request.SecurityNote != null && request.SecurityNote != "") {
                $("#requestNoteDIV").show();
                $("#requestNoteTitle").html("<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,SecurityNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> ");
                $("#requestNoteText").html(request.SecurityNote);

            } else if (request.SuperVisiorNote != null && request.SuperVisiorNote != "") {
                $("#requestNoteDIV").show();
                $("#requestNoteTitle").html(" <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DelegateNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
                $("#requestNoteText").html(request.SuperVisiorNote);
            }
            else {
                $("#requestNoteDIV").hide();
            }

            $('#actionModelCenter').modal({ backdrop: 'static', keyboard: false });
            $(".reviewCol").click(function () {
                $(this).toggleClass("opend");
            });
            hideLoader();
        });
    }

    function viewRequestItem(rid) {
        getRequest(rid, apiRootAddress, function (data) {
            request = data;
            $("#VisitNumb").text(request.ID);
            $("#DeviceEnterMessageTitle").text(request.RequestMessage);
            $("#DevicesRequestDatePreview").text(GetHijriDate(request.CreationDate));
            $("#DevicesEnterDatePreview").text(GetHijriDate(request.DevicesRequestDate));
            $("#DevicesEnterTimePreview").text(request.ActionTime);
            $("#delegateNamePreview").text(request.SupervisorName);
            $("#delegateNumberPreview").text(request.IdentityNumber);
            $("#delegateWorkPreview").text(request.WorkingPlace);


            var visitorsCount = request.RequestMachines.length;
            var deviceCount = 0;

            $(".request-device-review").empty();

            for (var i = 0; i < visitorsCount; i++) {
                var elem = document.createElement("tr");
                elem.classList.add("form-row", "reviewCol");

                var deviceRowBody = '';

                deviceRowBody += '<div class="form-group  col-md-2 ">';
                deviceRowBody += '<span class="nation-icon"></span>';
                if (i == 0)
                    deviceRowBody += "<label class='col-form-label'><sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceType%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>  </label>";
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
                    deviceRowBody += "<label class='col-form-label'> <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceNumber%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </label>";
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
                    deviceRowBody += " <label class='col-form-label'>  <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,CompanyName%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>  </label>";
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
                    deviceRowBody += "<label class='col-form-label'> <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>   </label>";
                deviceRowBody += '<p class="info-data">';
                deviceRowBody += request.RequestMachines[i].NotesAboutDevice;
                deviceRowBody += '<p>';
                deviceRowBody += '</div><div class="form-group col-md-1"></div>';
                //}


                deviceRowBody += '</div>';

                elem.innerHTML = deviceRowBody;


                $(".request-device-review").append(elem);
            }


            if (request.SecurityNote != null && request.SecurityNote != "") {
                $("#requestNoteDIV").show();
                $("#requestNoteTitle").html("<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,SecurityNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> ");
                $("#requestNoteText").html(request.SecurityNote);

            } else if (request.SuperVisiorNote != null && request.SuperVisiorNote != "") {
                $("#requestNoteDIV").show();
                $("#requestNoteTitle").html(" <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DelegateNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
                $("#requestNoteText").html(request.SuperVisiorNote);
            }
            else {
                $("#requestNoteDIV").hide();
            }

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

    function searchRequest() {
        
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
        if ($("#txtDeviceType").val() != "") {
            search = true;
            $(".count").hide();
        }
        else {
            search = false;
            $(".count").show();
        }
        var txtDeviceType = $("#txtDeviceType").val();
        var ddlStatuses = $("#ddlStatuses").val();
        var ApplicantName = $("#txtApplicantName").val();

        // var searchRequestsWithFilterationsAPI$ = apiRootAddress + "DevicesRequest/SearchRequests?ListSiteUrl=" + listSiteUrl + "&UserID=" + currentUserId + "&RequestID=" + requestNumber + "&CreationDate=" + requestRequestDateConverted + "&RequestDate=" + requestRequestEnterDateConverted + "&ApplicantName=&SupervisorName=" + SupervisorName + "&DeviceType=" + txtDeviceType + "&DepartmentCode=&SectionCode=&RequestState=" + ddlStatuses + "&OnlyToday=false&RequestType="+ $("#hdnRequestType").val();
        var searchRequestsWithFilterationsAPI$ = apiRootAddress + "DevicesRequest/SearchRequests?ListSiteUrl="
            + listSiteUrl + "&UserID=0&RequestID=" + requestNumber + "&CreationDate=" + requestRequestDateConverted
            + "&RequestDate=" + requestRequestEnterDateConverted + "&ApplicantName=" + ApplicantName.trim() + "&SupervisorName=" + SupervisorName.trim()
            + "&DeviceType=" + txtDeviceType.trim() + "&DepartmentCode=&SectionCode=&RequestState=0&OnlyToday=true&RequestType=" + $("#hdnRequestType").val() + "&Department=" + $("#hdnDepartment").val();


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
    $("#btnReset").click(function (e) {
        e.preventDefault();
        ResetSearch();
    });
    function ResetSearch() {
        $("#txtRequestNumber").val("");
        $("#txtRequestDate").val("");
        $("#txtRequestEnterDate").val("");
        $("#txtDelegateName").val("");
        $("#txtDelegateName").val("");
        $("#txtApplicantName").val("");
        $("#txtDeviceType").val("");
        $("#txtRequestDate").next().text(" ");
        $("#txtRequestEnterDate").next().text(" ");
    }
</script>
