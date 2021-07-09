<%@ Assembly Name="DevicesRequestsWFWebparts, Version=1.0.0.0, Culture=neutral, PublicKeyToken=97afcd5d4112e71c" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmployeeDevicesRequestsWPUserControl.ascx.cs" Inherits="DevicesRequestsWFWebparts.EmployeeDevicesRequestsWP.EmployeeDevicesRequestsWPUserControl" %>

<asp:HiddenField ID="hdnAPIRootURL" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hdnWFWebUrl" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hdnRequestType" runat="server" ClientIDMode="Static" />
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

    .list-visit {
        border-color: rgb(10, 152, 92);
        margin-bottom: 20px;
        line-height: 28px;
        background: rgb(251, 249, 249);
        border-radius: 8px;
        padding: 10px;
        border-width: 2px;
        border-style: solid;
    }

    th, td {
        text-align: center;
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
                        <asp:Label class="col-form-label" runat="server" ID="lblGridTitle_RequestEnterDateth3"
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
                        <asp:Label class="col-form-label" ID="lblGridTitle_DeviceType" runat="server"
                            Text="<%$Resources:MachinesRequests,GridTitle_DeviceType %>" ClientIDMode="Static">
                        </asp:Label>
                        <input type="text" id="txtDeviceType" class="form-control" />
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <asp:Label class="col-form-label" ID="lblGridTitle_RequestStatus" runat="server"
                            Text="<%$Resources:MachinesRequests,GridTitle_RequestStatus %>" ClientIDMode="Static">
                        </asp:Label>
                        <select id="ddlStatuses" class="form-control">
                        </select>
                    </div>
                </div>
                <div class=" col-md-6">
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
    </div>

    <div class="container">
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
                    <div class="new-request">
                        <a href="AddMachinesRequests.aspx" class="btn preview-btn send-btn btn-request">
                            <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,NewRequest %>">
                            </asp:Literal>
                        </a>

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

                                <asp:Label runat="server" ID="lblGridTitle_RequestEnterDateth2" ClientIDMode="Static">
                                </asp:Label>

                            </th>
                            <th class="col-xs-2">
                                <asp:Label ID="lblGridTitle_RequestDelegateNameth2" runat="server"
                                    Text="<%$Resources:MachinesRequests,GridTitle_RequestDelegateName %>"
                                    ClientIDMode="Static">
                                </asp:Label>
                            </th>

                            <th class="col-xs-2">
                                <asp:Label ID="lblGridTitle_RequestStatusth2" runat="server"
                                    Text="<%$Resources:MachinesRequests,GridTitle_RequestStatus %>"
                                    ClientIDMode="Static">
                                </asp:Label>
                            </th>
                            <th class="col-xs-2 count">
                                <span>
                                    <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,DeviceCount %>">
                                    </asp:Literal>
                                </span>
                            </th>


                            <th class="viewoption">
                                <asp:Label ID="lblGridTitle_RequestReview" runat="server"
                                    Text="<%$Resources:MachinesRequests,RequestReview %>" ClientIDMode="Static">
                                </asp:Label>
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

                            <asp:Label runat="server" ID="lblGridTitle_RequestEnterDateth1" ClientIDMode="Static">
                            </asp:Label>
                        </th>
                        <th class="col-xs-2">
                            <asp:Label ID="lblGridTitle_RequestDelegateNameth1" runat="server"
                                Text="<%$Resources:MachinesRequests,GridTitle_RequestDelegateName %>"
                                ClientIDMode="Static">
                            </asp:Label>
                        </th>


                        <th class="col-xs-2">
                            <asp:Label ID="lblGridTitle_RequestStatusth1" runat="server"
                                Text="<%$Resources:MachinesRequests,GridTitle_RequestStatus %>" ClientIDMode="Static">
                            </asp:Label>
                        </th>
                        <th class="col-xs-2 count">
                            <span>
                                <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,DeviceCount %>">
                                </asp:Literal>
                            </span>
                        </th>

                        <th class="viewoption">
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
    <div class="modal fade " id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered formLayout-model formLayout-visitmodel" role="document">
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
                        <asp:Label runat="server" ID="lblsecurity__RequestEntryDevices" ClientIDMode="Static">
                        </asp:Label>

                    </p>
                    <p class="deviceNumber">
                        <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,security__number%>">
                        </asp:Literal>
                        : <span id="DeviceNumber"></span>
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
                                <asp:Label runat="server" class="info-data" ID="GridTitle_RequestEnterDate1"
                                    ClientIDMode="Static">
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

                            <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,security__devicesInfo %>">
                            </asp:Literal>
                        </p>
                    </div>
                    <div class=" request-device-review">
                    </div>

                    <div id="requestNoteDIV" class="form-row">
                        <div class="form-group col-md-12">
                            <div class="heading-title">
                                <p id="requestNoteTitle"></p>
                            </div>

                            <p id="requestNoteText" class="info-data"></p>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade " id="DeleteModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered formLayout-model formLayout-visitmodel" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <p class="modal-title" id="exampleModalLongTitle">
                    <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,SendAddDevicesRequest %>">
                    </asp:Literal>
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
<div class="modal fade" id="rejectModelCenter" tabindex="-1" role="dialog" aria-labelledby="rejectModelCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered formLayout-model action-model delete-model" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <p class="modal-title" id="rejectModelCenterModalLongTitle">
                    <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,DeleteEnterMaterialRequest %>">
                    </asp:Literal>
                </p>
                <p class="visitnumber">
                    <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,Number %>"></asp:Literal>
                    : <span id="requestNumberReject"></span>
                </p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <label id="rejectMsg" class="col-form-label">
                    <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,AreYouSureToDeleteYourRequest %>">
                    </asp:Literal>
                </label>
            </div>
            <div class="modal-footer">
                <button type="button" id="btnReject" class="btn preview-btn send-btn" data-toggle="modal">
                    <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,Confirm %>"></asp:Literal>
                </button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade " id="timeLineModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered formLayout-model formLayout-visitmodel" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <p class="modal-title" id="exampleModalLongTitle">
                    <label>
                        <asp:Label runat="server" ID="lblViewTodayDevicesRequest" ClientIDMode="Static" Text="">
                        </asp:Label>
                    </label>
                </p>
                <p class="visitnumber">
                    <span>
                        <asp:Literal runat="server" Text="<%$Resources:MachinesRequests,GridTitle_RequestNumber %>">
                        </asp:Literal>
                    </span>

                    : <span id="VisitNumbID"></span>
                </p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="GateInfo">
                    <label class="info-data"></label>
                    <asp:Label class="col-form-label" runat="server" ID="lblEnterGate" ClientIDMode="Static">
                    </asp:Label>
                    <span>:</span><span class="welcome" id="timeLineGate"></span>
                </div>

                <div class="RequestInfo">
                    <label class="info-data"></label>
                    <asp:Label class="col-form-label" runat="server" ID="lblRequestDateMonitor" ClientIDMode="Static" Text="">
                    </asp:Label>
                    <span>:</span><span class="welcome" id="DeviceEnterDate"></span>

                    <label class="info-data"></label>
                    <asp:Label class="col-form-label" runat="server" ID="lblRequestTimeMonitor" ClientIDMode="Static" Text="">
                    </asp:Label>
                    <span>:</span><span class="welcome" id="requestTimeMonitor"></span>

                </div>

                <div class="row visitorTimeLine ">
                </div>

            </div>
        </div>
    </div>
</div>
<script src="/modwf/style Library/branding/js/general/helpers.js"></script>
<script src="/modwf/style Library/branding/js/general/devicesShared.js"></script>

<script type="text/javascript">
    function translateLabels() {
        if ($("#hdnRequestType").val() == "0") {
            document.getElementById("GridTitle_RequestEnterDate1").innerHTML = document.getElementById("lblGridTitle_RequestEnterDateth1").innerHTML = document.getElementById("lblGridTitle_RequestEnterDateth2").innerHTML = document.getElementById("lblGridTitle_RequestEnterDateth3").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,DevicesEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblsecurity__RequestEntryDevices").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,security__RequestEntryDevices%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblEnterGate").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,TitleGate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblEntryTime").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,DeviceEnterTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";


            document.getElementById("lblViewTodayDevicesRequest").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,viewTodayDevicesRequest%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblRequestDateMonitor").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,DevicesEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblRequestTimeMonitor").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,DeviceEnterTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";

        } else {
            document.getElementById("lblGridTitle_RequestEnterDateth1").innerHTML = document.getElementById("lblGridTitle_RequestEnterDateth2").innerHTML = document.getElementById("lblGridTitle_RequestEnterDateth3").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,DevicesEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("GridTitle_RequestEnterDate1").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,GridTitle_RequestEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblsecurity__RequestEntryDevices").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,security__RequestEntryDevices%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblEnterGate").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,TitleGate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblEntryTime").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,DeviceEnterTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";


            document.getElementById("lblViewTodayDevicesRequest").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,viewTodayDevicesRequest%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblRequestDateMonitor").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,DevicesEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblRequestTimeMonitor").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,DeviceEnterTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
        }
    }


    $(".hidden-cols").hide();
    var sort = false;
    var mydata;
    var apiRootAddress = $("#hdnAPIRootURL").val();
    var listSiteUrl = $("#hdnWFWebUrl").val()
    var requestType = $("#hdnRequestType").val();
    var currentUserId = _spPageContextInfo.userId;
    var search = false;

    function GetHijriDate(date) {
        var SplitedDate = (date.split("T")[0]).split("-");
        var s = HijriJS.gregorianToHijri(SplitedDate[0], SplitedDate[1], SplitedDate[2])
        var stringmonth = Hijrimonths[s.month - 1];
        return s.day + "-" + stringmonth + "-" + s.year
    }

    $(function () {
        translateLabels();

        getAllStatuses(
            apiRootAddress,
            function (data) {
                $("#ddlStatuses").append('<option value="0">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>');
                var ddlValue = "";
                data.forEach(function (item) {

                    if (item.Code != '') {
                        ddlValue = item.Code + '-' + item.Type;
                    }
                    else {
                        ddlValue = '';
                    }

                    $("#ddlStatuses").append('<option value="' + ddlValue + '">' + item.Title + '</option>');
                });
            }
        );



        var searchRequestsAPI$ = apiRootAddress + "DevicesRequest/SearchRequests?ListSiteUrl=" + listSiteUrl + "&UserID=" + currentUserId + "&RequestID=0&CreationDate=&RequestDate=&ApplicantName=&SupervisorName=&DeviceType=&DepartmentCode=&SectionCode=&RequestState=0&OnlyToday=false&RequestType=" + $("#hdnRequestType").val();

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

    $("#btnReset").click(function (e) {
        e.preventDefault();
        ResetSearch();
    });

    function ResetSearch() {

        $("#txtRequestNumber").val("");
        $("#txtRequestDate").val("");
        $("#txtRequestEnterDate").val("");
        $("#txtDelegateName").val("");
        $("#txtDeviceType").val("");
        $("#ddlStatuses").val(0);
        $("#txtRequestDate").next().text(" ");
        $("#txtRequestEnterDate").next().text(" ");

    }

    function openRejectRequestModel(id) {
        $("#requestNumberReject").text(id);
        $("#rejectMsg").text("<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,AreYouSureToDeleteYourRequest%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
        $("#btnReject").show();
        $('#rejectModelCenter').modal({ backdrop: 'static', keyboard: false });
        //$('#rejectModelCenter').modal({backdrop: 'static', keyboard: false});
    }
    $("#btnReject").click(function (e) {
        e.preventDefault();
        showLoader();
        $("#btnReject").attr("disabled", true);
        var rid = $("#requestNumberReject").text();
        var deleteRequestAPI$ = apiRootAddress + 'DevicesRequest/DeleteRequest?ListSiteUrl=' + listSiteUrl + '&ReqID=' + rid;
        getDataByAPI(deleteRequestAPI$, function (result) {
            if (result.statusCode == 1) {
                $('#rejectModelCenter').modal('hide');
                $("#btnReject").attr("disabled", false);
                searchRequest();
            } else {
                hideLoader();
                alert(result.statusMessage);
            }
        });

    });

    function renderSearchResult(data, sort, search) {
        sort = false;
        $(".PaggerDiv").show();
        //search = false
        $("#dataTable > tbody").empty();
        var datacount = 0;
        if (data == null || data.length == 0) {
            hideLoader();
            $("#dataTable > tbody").append("<tr><td> <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,ThereIsNoData%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </td></tr>");
            $("#RowNumb").text("0");
            $(".PaggerDiv").hide();
            return;
        }

        getAllStatuses(
            apiRootAddress,
            function (statusDataArray) {

                groupedRequestsData = groupBy(data, 'RequestID');
                if (!sort)
                    groupedRequestsData = Object.keys(groupedRequestsData).map(function (itm) { return groupedRequestsData[itm]; }).reverse();
                else if (sort)
                    groupedRequestsData = Object.keys(groupedRequestsData).map(function (itm) { return groupedRequestsData[itm]; });

                for (var arrayInside in groupedRequestsData) {
                    var HTML = "";
                    var AcceptBol = "";
                    var Acceptsec = "";
                    var innerDivs = "";
                    var AcceptTxt = "";
                    var requestDevicesCount = 0;
                    for (var i = 0; i < groupedRequestsData[arrayInside].length; i++) {
                        if (i >= 0) {
                            if (groupedRequestsData[arrayInside][i].SecurityStatus == "1" && groupedRequestsData[arrayInside][i].IsItemApproved == "1") {
                                AcceptTxt = "تم الموافقة";
                                AcceptBol = "acc";
                            }
                            else if (groupedRequestsData[arrayInside][i].SecurityStatus == "1" && groupedRequestsData[arrayInside][i].IsItemApproved != "1") {
                                AcceptTxt = "مرفوض";
                                AcceptBol = "ٌrej";
                            }
                            if (groupedRequestsData[arrayInside][i].SecurityStatus == "1") {
                                Acceptsec = "Done";
                            }
                            innerDivs += '<div class="col-md-4"><div class="inner-card"><p class="deviceType title">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceType%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + ' : ' + groupedRequestsData[arrayInside][i].DeviceType + '</p><span class="addStauts ' + (AcceptBol == "acc" ? "Accepted-req" : "rejected-req ") + ' ' + (Acceptsec == "Done" ? "show" : "hide") + ' "></span>';
                            if (groupedRequestsData[arrayInside][i].ItemsCount != "") {
                                innerDivs += '<span class=" my-5 DeviceNumber ">  العدد : ' + groupedRequestsData[arrayInside][i].ItemsCount + '</span>';
                                requestDevicesCount += parseInt(groupedRequestsData[arrayInside][i].ItemsCount);
                            }
                            if (groupedRequestsData[arrayInside][i].DeviceNumber != "") {
                                innerDivs += '<br><span class=" my-5 DeviceNumber ">  رقم الجهاز : ' + groupedRequestsData[arrayInside][i].DeviceNumber + '</span>';
                            }
                            if (groupedRequestsData[arrayInside][i].ManufacturingCompanyName != "") {
                                innerDivs += '<br><span class="my-5 ManufacturingCompanyName">اسم الشركة المصنعة :' + groupedRequestsData[arrayInside][i].ManufacturingCompanyName + '</span><p class="acceptTxt ' + (AcceptBol == " acc" ? "Accepted-status" : "rejected-status ") + '" >' + AcceptTxt + '</p>';
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
                            var supervisorStatusText = securityStatus === "" ? "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,InProgress%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" : securityStatus === "1" ? "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,Accepted%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> " : "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,Rejected%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                            var disableStatusText = supervisorStatus === "" ? " " : supervisorStatus === "1" ? " disable" : "disable ";
                            var supervisorStatusClass = supervisorStatus === "" ? "waiting" : supervisorStatus === "1" ? "accepted" : "rejected";
                            var disableDelete = "";

                            if ((securityStatus == 1 || securityStatus == 2) && (supervisorStatus == 1 || supervisorStatus == 2)) {
                                disableDelete = "disable";
                            }

                            var visitorsCount = groupedRequestsData[arrayInside].length;
                            var statusText = "";
                            var showVisitorLine = "";
                            var supervisorName = trimString(groupedRequestsData[arrayInside][i].SupervisorName, 15);
                            var statusArr = getStatusTextAndClass(supervisorStatus, securityStatus, statusDataArray);
                            statusText = statusArr[0];
                            supervisorStatusClass = statusArr[1];
                            if (supervisorStatusClass == "accepted") {
                                showVisitorLine = "show";
                            }
                            HTML += '<tr id="mainTable" >'
                                + '<td>' + requestID + '</td>'
                                + '<td>' + GetHijriDate(groupedRequestsData[arrayInside][i].CreationDate) + '</td>'
                                + '<td>' + GetHijriDate(groupedRequestsData[arrayInside][i].DevicesRequestDate) + '</td>'
                                + '<td>' + supervisorName + '</td>'
                                + '<td>  <span  class="' + supervisorStatusClass + '">' + statusText + ' </span> </td>'
                            if (!search) {
                                //HTML += '<td>' + groupedRequestsData[arrayInside].length + ' </td>';
                                HTML += '<td>' + requestDevicesCount + ' </td>';
                            }
                            HTML += '<td class="viewoption"><div class="col-12">'
                                + '<a title="<sharepoint:encodedliteral runat="server" text="<%$Resources:MachinesRequests,ViewDevice%>" EncodeMethod="EcmaScriptStringLiteralEncode"/>" class="options-list review" href="javascript:viewRequestItem(' + requestID + ')"></a><a  title="<sharepoint:encodedliteral runat="server" text="<%$Resources:MachinesRequests,EditDevice%>" EncodeMethod="EcmaScriptStringLiteralEncode"/>" class="options-list edit ' + disableStatusText + '" href="EditMachinesRequests.aspx?rid=' + requestID + '"></a><a title="<sharepoint:encodedliteral runat="server" text="<%$Resources:MachinesRequests,DeleteDevice%>" EncodeMethod="EcmaScriptStringLiteralEncode"/>"  class="options-list delete ' + disableStatusText + '" href="javascript:openRejectRequestModel(' + requestID + ')"></a><span><a class="options-list timeline ' + showVisitorLine + '" href="javascript:showTimeLine(' + requestID + ')"></a></span><span class="options-list showmore" role="button" data-toggle="collapse" href="#row' + requestID + '" aria-expanded="false" aria-controls="row' + requestID + '"></span></div></td>'

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
                    hideLoader();

                }

                $(document).ready(function () {

                    var AllData = $("#tablebody.not-printbody tr");

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

            }

        );
        hideLoader();
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

        var requestRequestEnterDateConverted = "";
        if ($("#txtRequestEnterDate").val() != "") {
            requestRequestEnterDateConverted = HijriJS.toGregorian($("#txtRequestEnterDate").val(), "/");

            var day = requestRequestEnterDateConverted.getDate();
            var month = requestRequestEnterDateConverted.getMonth() + 1;
            var year = requestRequestEnterDateConverted.getFullYear();

            requestRequestEnterDateConverted = month + "/" + day + "/" + year;
        }

        var SupervisorName = $("#txtDelegateName").val().trim();
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

        var searchRequestsWithFilterationsAPI$ = apiRootAddress + "DevicesRequest/SearchRequests?ListSiteUrl=" + listSiteUrl + "&UserID=" + currentUserId + "&RequestID=" + requestNumber + "&CreationDate=" + requestRequestDateConverted + "&RequestDate=" + requestRequestEnterDateConverted + "&ApplicantName=&SupervisorName=" + SupervisorName.trim() + "&DeviceType=" + txtDeviceType.trim() + "&DepartmentCode=&SectionCode=&RequestState=" + ddlStatuses + "&OnlyToday=false&RequestType=" + $("#hdnRequestType").val();

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


    function viewRequestItem(rid) {
        getRequest(rid, apiRootAddress, function (data) {
            request = data;

            $("#DeviceNumber").text(request.ID);
            $("#DeviceEnterMessageTitle").text(request.RequestMessage);
            $("#DevicesEnterDatePreview").text(GetHijriDate(request.DevicesRequestDate));
            $("#DevicesEnterTimePreview").text(request.ActionTime);

            $("#delegateNamePreview").text(request.SupervisorName);
            $("#delegateNumberPreview").text(request.IdentityNumber);
            $("#delegateWorkPreview").text(request.WorkingPlace);


            var visitorsCount = request.RequestMachines.length;
            var deviceCount = 0;

            $(".request-device-review").empty();
            var secBol = "";
            if (request.SecurityStatus == "1") {
                secBol = "Done";
            }

            for (var i = 0; i < visitorsCount; i++) {
                var secApprove = "";

                if (request.SecurityStatus == "1" && request.RequestMachines[i].ItemIsApproved == "1") {
                    secApprove = "secApprove";
                }
                var elem = document.createElement("tr");
                elem.classList.add("form-row", "reviewCol");

                var deviceRowBody = '';


                deviceRowBody += '<div class="form-group  col-md-2 ">';
                deviceRowBody += '<span class="nation-icon"></span>';
                if (i == 0)
                    deviceRowBody += "<label class='col-form-label'> <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceType%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </label>";
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
                    deviceRowBody += "  <label class='col-form-label'><sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceNumber%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </label>";

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
                deviceRowBody += '<div class="form-group  col-md-3">';
                deviceRowBody += '<span class="ID-icon"></span>';
                if (i == 0)
                    deviceRowBody += "<label class='col-form-label'><sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,CompanyName%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>  </label>";
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
                deviceRowBody += '</div>';

                deviceRowBody += '<div class="form-group col-md-1">';
                if (i == 0)
                    deviceRowBody += '<label class="col-form-label" style="color:transparent">status</label>';
                deviceRowBody += '<span style="margin-top:0" class="addStauts ' + (secApprove == "secApprove" ? "Accepted-req" : "rejected-req ") + ' ' + (secBol == "Done" ? "show" : "hide") + ' "></span>';

                deviceRowBody += '</div>';

                deviceRowBody += '</div>';
                //}


                elem.innerHTML = deviceRowBody;


                $(".request-device-review").append(elem);
            }


            if (request.SecurityNote != null && request.SecurityNote != "") {
                $("#requestNoteDIV").show();
                $("#requestNoteTitle").html("<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,SecurityNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
                $("#requestNoteText").html(request.SecurityNote);

            } else if (request.SupervisiorNote != null && request.SupervisiorNote != "") {
                $("#requestNoteDIV").show();
                $("#requestNoteTitle").html(" <sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DelegateNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
                $("#requestNoteText").html(request.SupervisiorNote);
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
    function compareBetweenTwoTimes(TimeString) {
        var ampm = new Date().getHours() >= 12 ? 'PM' : 'AM';
        var MyTimeampm = TimeString.split(" ")[1];
        var TimeH = TimeString.split(":")[0];
        if (MyTimeampm == "AM") {
            TimeH = TimeH;
        }
        else if (MyTimeampm == "PM") {
            TimeH = TimeH == 12 ? TimeH : TimeH + 12;
        }
        var nowHours = new Date().getHours();
        //var TimeH= new Date("2000-01-01 " + TimeString.split(":")[0]+":"+TimeString.split(":")[1]+" "+MyTimeampm).getHours();
        var TimeM = TimeString.split(":")[1];
        if (nowHours == TimeH) {
            if (new Date().getMinutes() > TimeM) {
                return 1;
            }
            if (new Date().getMinutes() < TimeM) {
                return 0;
            }
            else {
                return 0;
            }
        }
        else if (nowHours > TimeH) {
            return 0;
        }
        else {
            return 1;
        }
    }


    function compareTwoDates(date, today) {

        if (date > today) return 0;
        else if (date < today) return 1;
        else return 2;

    }
    function getTodayInFormat() {
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth() + 1; //January is 0!

        var yyyy = today.getFullYear();
        if (dd < 10) {
            dd = '0' + dd;
        }
        if (mm < 10) {
            mm = '0' + mm;
        }
        return mm + '/' + dd + '/' + yyyy;
    }

    function showTimeLine(rid) {
        getTimeLineRequest(rid, function (data) {
            timeLinerequest = data;
            $(".visitorTimeLine").empty();
            var RequestTypeStatus = "";
            var checkInArr = [];
            var noCheckInOut = "";
            var innercheckTime = "";
            $("#VisitNumbID").text(rid);
            if (timeLinerequest[0]) {
                var DeviceEnter = GetHijriDate(timeLinerequest[0].DevicesRequestDate);
                $("#timeLineGate").text(timeLinerequest[0].Gate);
                $("#DeviceEnterDate").text(DeviceEnter);
                $("#requestTimeMonitor").text(timeLinerequest[0].ActionTime.split(" ")[0] + " " + timeLinerequest[0].ActionTime.split(" ")[1]);
                var M_EnterDate = timeLinerequest[0].DevicesRequestDate.split("T")[0].split("-");
                var M_status = compareTwoDates(new Date(M_EnterDate[1] + '/' + M_EnterDate[2] + '/' + M_EnterDate[0] + " 00:00"), new Date(getTodayInFormat() + " 00:00"))

                if (M_status == 0) {// Machine Enter Date not oe yet
                    var elem = document.createElement("div");
                    elem.classList.add("col-md-auto", "reviewCol");
                    var visitorRowBody = '<div class="timeline-info loggedoutCard">';
                    visitorRowBody += ' <div class="loggeduser' + (status == "In" ? "  " : "hide ") + ' "></div>';
                    noCheckInOut = "االوقت المحدد لهذا الطلب يبدأ فى" + " : (" + GetHijriDate(timeLinerequest[0].DevicesRequestDate) + ")";
                    visitorRowBody += '<p class="info-data">' + noCheckInOut + '</p>';
                    visitorRowBody += '</div >';
                    elem.innerHTML = visitorRowBody;
                    $(".visitorTimeLine").append(elem);

                }
                else if (M_status == 1) {
                    for (var i = 0; i < timeLinerequest[0].RequestMachines.length; i++) { // Request ended and there is no item in in/out array
                        if (timeLinerequest[0].RequestMachines[i].MachineActions.length == 0) {
                            var elem = document.createElement("div");
                            elem.classList.add("col-md-6", "reviewCol");
                            var visitorRowBody = '<div class="timeline-info loggedoutCard">';
                            visitorRowBody += ' <div class="loggeduser' + (status == "In" ? "  " : "hide ") + ' "></div>';

                            visitorRowBody += '<p class="info-data">  <sharepoint:encodedliteral runat="server" text="<%$Resources:MachinesRequests,GridTitle_DeviceName%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ' + timeLinerequest[0].RequestMachines[i].DeviceType + '</p>';
                            visitorRowBody += '<p class="info-data"> <sharepoint:encodedliteral runat="server" text="<%$Resources:MachinesRequests,DeviceNumber%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ' + timeLinerequest[0].RequestMachines[i].DeviceNumber + '</p>';
                            visitorRowBody += '<p class="info-data"> <sharepoint:encodedliteral runat="server" text="<%$Resources:MachinesRequests,DevicesCount%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ' + timeLinerequest[0].RequestMachines[i].ItemsCount + '</p>';
                            noCheckInOut = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,DeviceNotLoginInHisTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                            visitorRowBody += '<p class="info-data">' + noCheckInOut + '</p>';
                            visitorRowBody += '</div >';
                            elem.innerHTML = visitorRowBody;
                            $(".visitorTimeLine").append(elem);

                        }
                        if (timeLinerequest[0].RequestMachines[i].MachineActions.length > 0) {

                            var CheckIn = timeLinerequest[0].RequestMachines[i].MachineActions[0].ActionDate.split("T")[1];
                            var elem = document.createElement("div");
                            elem.classList.add("col-md-6", "reviewCol");
                            var visitorRowBody = '<div class="timeline-info loggedoutCard">';
                            visitorRowBody += ' <div class="loggeduser' + (status == "In" ? "  " : "hide ") + ' "></div>';
                            visitorRowBody += '<p class="info-data">  <sharepoint:encodedliteral runat="server" text="<%$Resources:MachinesRequests,GridTitle_DeviceName%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ' + timeLinerequest[0].RequestMachines[i].DeviceType + '</p>';
                            visitorRowBody += '<p class="info-data"> <sharepoint:encodedliteral runat="server" text="<%$Resources:MachinesRequests,DeviceNumber%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ' + timeLinerequest[0].RequestMachines[i].DeviceNumber + '</p>';
                            visitorRowBody += '<p class="info-data"> <sharepoint:encodedliteral runat="server" text="<%$Resources:MachinesRequests,DevicesCount%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ' + timeLinerequest[0].RequestMachines[i].ItemsCount + '</p>';
                            visitorRowBody += '<p class="info-data">' + (requestType == "0" ? '<sharepoint:encodedliteral runat="server" text="<%$Resources:MachinesRequests,EnterTime%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ' : '<sharepoint:encodedliteral runat="server" text="<%$Resources:MachinesExitRequests,EnterTime%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ') + convertTime24to12(CheckIn) + '</p>';
                            visitorRowBody += '</div >';
                            elem.innerHTML = visitorRowBody;
                            $(".visitorTimeLine").append(elem);
                        }

                    }

                }

                else if (M_status == 2) {

                    for (var i = 0; i < timeLinerequest[0].RequestMachines.length; i++) {
                        if (timeLinerequest[0].RequestMachines[i].MachineActions.length == 0) {
                            var elem = document.createElement("div");
                            elem.classList.add("col-md-6", "reviewCol");
                            var visitorRowBody = '<div class="timeline-info loggedoutCard">';
                            visitorRowBody += ' <div class="loggeduser' + (status == "In" ? "  " : "hide ") + ' "></div>';
                            visitorRowBody += '<p class="info-data">  <sharepoint:encodedliteral runat="server" text="<%$Resources:MachinesRequests,GridTitle_DeviceName%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ' + timeLinerequest[0].RequestMachines[i].DeviceType + '</p>';
                            visitorRowBody += '<p class="info-data"> <sharepoint:encodedliteral runat="server" text="<%$Resources:MachinesRequests,DeviceNumber%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ' + timeLinerequest[0].RequestMachines[i].DeviceNumber + '</p>';
                            visitorRowBody += '<p class="info-data"> <sharepoint:encodedliteral runat="server" text="<%$Resources:MachinesRequests,DevicesCount%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ' + timeLinerequest[0].RequestMachines[i].ItemsCount + '</p>';
                            noCheckInOut = requestType == "0" ? "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,DeviceLoginNotCompletedTillNow%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" : "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,DeviceLoginNotCompletedTillNow%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                            visitorRowBody += '<p class="info-data">' + noCheckInOut + '</p>';
                            visitorRowBody += '</div >';
                            elem.innerHTML = visitorRowBody;
                            $(".visitorTimeLine").append(elem);
                        }
                        else if (timeLinerequest[0].RequestMachines[i].MachineActions.length > 0) {
                            var elem = document.createElement("div");
                            var CheckIn = timeLinerequest[0].RequestMachines[i].MachineActions[0].ActionDate.split("T")[1];
                            var elem = document.createElement("div");
                            elem.classList.add("col-md-6", "reviewCol");
                            var visitorRowBody = '<div class="timeline-info loggedoutCard">';
                            visitorRowBody += ' <div class="loggeduser' + (status == "In" ? "  " : "hide ") + ' "></div>';
                            visitorRowBody += '<p class="info-data">  <sharepoint:encodedliteral runat="server" text="<%$Resources:MachinesRequests,GridTitle_DeviceName%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ' + timeLinerequest[0].RequestMachines[i].DeviceType + '</p>';
                            visitorRowBody += '<p class="info-data"> <sharepoint:encodedliteral runat="server" text="<%$Resources:MachinesRequests,DeviceNumber%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ' + timeLinerequest[0].RequestMachines[i].DeviceNumber + '</p>';
                            visitorRowBody += '<p class="info-data"> <sharepoint:encodedliteral runat="server" text="<%$Resources:MachinesRequests,DevicesCount%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ' + timeLinerequest[0].RequestMachines[i].ItemsCount + '</p>';
                            visitorRowBody += '<p class="info-data">' + (requestType == "0" ? '<sharepoint:encodedliteral runat="server" text="<%$Resources:MachinesRequests,EnterTime%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ' : '<sharepoint:encodedliteral runat="server" text="<%$Resources:MachinesExitRequests,EnterTime%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ') + convertTime24to12(CheckIn) + '</p>';
                            visitorRowBody += '</div >';
                            elem.innerHTML = visitorRowBody;
                            $(".visitorTimeLine").append(elem);
                        }
                    }
                }
            }

            $("#timeLineModel").modal({ backdrop: 'static', keyboard: false });
            hideLoader();
        });
    }

    function getTimeLineRequest(id, callback) {
        var timeLineRequestsAPI$ = apiRootAddress + "DevicesRequest/GetActions?ListSiteUrl=" + listSiteUrl + "&RequestID=" + id + "&ToDay=false&UserID=0&RequestCreateDate=null&Gate=&ApplicantName=&SupervisorName=&DeviceType=&DepartmentCode=&SectionCode=&RequestType=" + $("#hdnRequestType").val();

        getDataByAPI(
            timeLineRequestsAPI$,
            function (data) {
                callback(data);
            }
        );
    }
    function isNumber(evt) {
        var iKeyCode = (evt.which) ? evt.which : evt.keyCode
        if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57)) {
            return false;

        }

        return true;
    }
    function showSendMsg(Msg) {
        $("#MsgID").text(Msg);
        $('#DeleteModel').modal({ backdrop: 'static', keyboard: false });
    }
    $('.textPicker').on('input', function () {
        if ($(this).val() == "") {
            $(this).siblings(".daytext").text(" ");

        }
    });
    $("#showSearch").click(function () {
        $("#SearchOptions").toggleClass("is-opend");
    });

    $("#lblGridTitle_RequestNumberth1").click(function () {
        sort = !sort;
        renderSearchResult(mydata, sort);
    });
</script>
