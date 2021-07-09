<%@ Assembly Name="VisitRequest, Version=1.0.0.0, Culture=neutral, PublicKeyToken=7d812edf42fd645f" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmployeeVisitRequestListWPUserControl.ascx.cs" Inherits="VisitRequest.EmployeeVisitRequestListWP.EmployeeVisitRequestListWPUserControl" %>


<asp:HiddenField ID="hdnAPIRootURL" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hdnWFWebUrl" runat="server" ClientIDMode="Static" />
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

    .today {
        background-color: azure !important;
    }

    .green {
        font-weight: 700;
        color: green;
    }

    .visitor-status {
        text-align: center;
        font-size: 18px !important;
        margin-bottom: 12px;
        margin-top: 10px;
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
                <asp:Label ID="Label2" runat="server" Text="<%$Resources:VisitRequest,FilterResults %>"
                    ClientIDMode="Static"></asp:Label>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>



    <div class="container">



        <div id="SearchOptions" class="formLayout-container bb-none ">
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group ">
                        <label for="txtRequestNumber" class="col-form-label">
                            <asp:Label ID="Label31" runat="server" Text="<%$Resources:VisitRequest,RequesrtNumber %>"
                                ClientIDMode="Static"></asp:Label>
                        </label>
                        <input type="text" class="form-control" id="txtRequestNumber"
                            onkeypress="javascript:return isNumber(event)" />
                        <label class="numbval"></label>
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtRequestDate" class="col-form-label">
                            <asp:Label ID="Label237" runat="server" Text="<%$Resources:VisitRequest,RequestDate %>"
                                ClientIDMode="Static"></asp:Label>
                        </label>
                        <input type="text" class="form-control textPicker" id="txtRequestDate" autocomplete="off" />
                        <label class="daytext"></label>
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtVisitDate" class="col-form-label">
                            <asp:Label ID="Label3" runat="server" Text="<%$Resources:VisitRequest,visitEnterDate %>"
                                ClientIDMode="Static"></asp:Label>
                        </label>
                        <input type="text" class="form-control textPicker" id="txtVisitDate" autocomplete="off" />
                        <label class="daytext"></label>
                    </div>
                </div>

                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtVisitorFirstName" class="col-form-label">
                            <asp:Label ID="Label4" runat="server" Text="<%$Resources:VisitRequest,FirstName %>"
                                ClientIDMode="Static"></asp:Label>
                        </label>
                        <input type="text" id="txtVisitorFirstName" class="form-control" />
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtVisitorFatherName" class="col-form-label">
                            <asp:Label ID="Label5" runat="server" Text="<%$Resources:VisitRequest,FatherName %>"
                                ClientIDMode="Static"></asp:Label>
                        </label>
                        <input type="text" id="txtVisitorFatherName" class="form-control" />
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtVisitorFamilyName" class="col-form-label">
                            <asp:Label ID="Label6" runat="server" Text="<%$Resources:VisitRequest,FamilyName %>"
                                ClientIDMode="Static"></asp:Label>
                        </label>
                        <input type="text" id="txtVisitorFamilyName" class="form-control" />
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtVisitorLastName" class="col-form-label">
                            <asp:Label ID="label7" runat="server" Text="<%$Resources:VisitRequest,LastName %>"
                                ClientIDMode="Static"></asp:Label>
                        </label>
                        <input type="text" id="txtVisitorLastName" class="form-control" />
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="ddlNationalities" class="col-form-label">
                            <asp:Label ID="Label8" runat="server" Text="<%$Resources:VisitRequest,Nationality %>"
                                ClientIDMode="Static"></asp:Label>
                        </label>
                        <select id="ddlNationalities" class="form-control"></select>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group ">
                        <label for="txtIdentityNumber" class="col-form-label">
                            <asp:Label ID="Label9" runat="server" Text="<%$Resources:VisitRequest,IdentityNumber %>"
                                ClientIDMode="Static"></asp:Label>
                        </label>
                        <input type="text" id="txtIdentityNumber" class="form-control"
                            onkeypress="javascript:return isNumber(event)" />
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="ddlStatuses" class="col-form-label">
                            <asp:Label ID="Label10" runat="server" Text="<%$Resources:VisitRequest,RequestState%>"
                                ClientIDMode="Static"></asp:Label>
                        </label>
                        <select id="ddlStatuses" class="form-control">
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                </div>
                <div class="form-group col-md-4">
                    <button id="btnSearch" class="btn preview-btn send-btn">
                        <asp:Label ID="Label11" runat="server" Text="<%$Resources:VisitRequest,Search %>"
                            ClientIDMode="Static"></asp:Label>
                    </button>
                    <button id="btnReset" class="btn preview-btn send-btn">
                        <asp:Label runat="server" Text="<%$Resources:VisitRequest,SearchReset %>" ClientIDMode="Static">
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
                            <asp:Label ID="Label12" runat="server"
                                Text="<%$Resources:VisitRequest,TotalNumberForAvalilableRequests %>"
                                ClientIDMode="Static"></asp:Label>
                        </span>
                        <span>:</span>
                        <span id="RowNumb" class="numb">0</span>
                    </div>
                    <div class="new-request">
                        <a href="AddVisitingRequest.aspx" class="btn preview-btn send-btn btn-request">
                            <asp:Label ID="Label13" runat="server" Text="<%$Resources:VisitRequest,NewRequest %>"
                                ClientIDMode="Static"></asp:Label>
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
                <table id="dataTable" class="table ">
                    <thead>
                        <tr class="active">
                            <th class="col-xs-2"><strong>
                                <asp:Label ID="Label14" runat="server"
                                    Text="<%$Resources:VisitRequest,RequesrtNumber	 %>" ClientIDMode="Static">
                                </asp:Label>
                            </strong></th>
                            <th class="col-xs-2"><strong>
                                <asp:Label ID="Label15" runat="server"
                                    Text="<%$Resources:VisitRequest,RequestDate %>" ClientIDMode="Static">
                                </asp:Label>
                            </strong></th>
                            <th class="col-xs-6"><strong>
                                <asp:Label ID="Label16" runat="server"
                                    Text="<%$Resources:VisitRequest,visitEnterDate %>" ClientIDMode="Static">
                                </asp:Label>
                            </strong></th>
                            <th class="col-xs-2 count"><strong>
                                <asp:Label ID="Label17" runat="server"
                                    Text="<%$Resources:VisitRequest,VisitorsCount %>" ClientIDMode="Static">
                                </asp:Label>
                            </strong></th>
                            <th class="col-xs-2"><strong>
                                <asp:Label ID="Label1" runat="server"
                                    Text="<%$Resources:VisitRequest,RequestState %>" ClientIDMode="Static">
                                </asp:Label>
                            </strong></th>
                            <th class="viewoption">
                                <asp:Label ID="Label18" runat="server" Text="<%$Resources:VisitRequest,RequestView %>"
                                    ClientIDMode="Static"></asp:Label>
                            </th>


                        </tr>
                    </thead>
                    <tbody id="tablebody">
                    </tbody>
                </table>

            </div>
        </div>



        <div class="table-responsive formLayout-table">



            <table id="dataTable" class="table  ">
                <thead>
                    <tr class="active">
                        <th class="col-xs-2"><strong>
                            <asp:Label ID="Label19" runat="server"
                                Text="<%$Resources:VisitRequest,RequesrtNumber %>" ClientIDMode="Static">
                            </asp:Label>

                        </strong></th>
                        <th class="col-xs-2"><strong>
                            <asp:Label ID="Label20" runat="server" Text="<%$Resources:VisitRequest,RequestDate %>"
                                ClientIDMode="Static"></asp:Label>
                        </strong></th>
                        <th class="col-xs-6"><strong>
                            <asp:Label ID="Label21" runat="server"
                                Text="<%$Resources:VisitRequest,visitEnterDate	 %>" ClientIDMode="Static">
                            </asp:Label>
                        </strong></th>
                        <th class="col-xs-2 count"><strong>
                            <asp:Label ID="Label22" runat="server" Text="<%$Resources:VisitRequest,VisitorsCount %>"
                                ClientIDMode="Static"></asp:Label>
                        </strong></th>
                        <th class="col-xs-2"><strong>
                            <asp:Label ID="Label23" runat="server" Text="<%$Resources:VisitRequest,RequestState	 %>"
                                ClientIDMode="Static"></asp:Label>
                        </strong></th>

                        <th class="viewoption">
                            <asp:Label ID="Label24" runat="server" Text="<%$Resources:VisitRequest,RequestView %>"
                                ClientIDMode="Static"></asp:Label>
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
                        <asp:Label ID="Label25" runat="server" Text="<%$Resources:VisitRequest,VisitRequestReview %>"
                            ClientIDMode="Static"></asp:Label>
                    </p>
                    <p class="visitnumber">
                        <asp:Label ID="Label266" runat="server" Text="<%$Resources:VisitRequest,Number	 %>"
                            ClientIDMode="Static"></asp:Label>

                        : <span id="VisitNumb"></span>
                    </p>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p class="request-msgtitle">
                        <asp:Label ID="Label26" runat="server" Text="<%$Resources:VisitRequest,RequestMsg %>"
                            ClientIDMode="Static"></asp:Label>
                    </p>
                    <p class="request-msg">
                        <span id="visitMessageTitle"></span>
                    </p>

                    <div class="visitinfo">

                        <div class="form-row">
                            <div class="form-group col-md-3">
                                <i class=" mdi mdi-calendar "></i>
                                <label class="col-form-label">
                                    <asp:Label ID="Label27" runat="server"
                                        Text="<%$Resources:VisitRequest,VisitStartDate	 %>" ClientIDMode="Static">
                                    </asp:Label>
                                </label>

                                <p id="visitStartDatePreview" class="info-data"></p>
                            </div>

                            <div class="form-group col-md-3">
                                <i class=" mdi mdi-calendar "></i>
                                <label class="col-form-label">
                                    <asp:Label ID="Label28" runat="server"
                                        Text="<%$Resources:VisitRequest,VisitEndDate	 %>" ClientIDMode="Static">
                                    </asp:Label>
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
                                    <asp:Label ID="Label299" runat="server"
                                        Text="<%$Resources:VisitRequest,VisitReason %>" ClientIDMode="Static">
                                    </asp:Label>
                                </label>
                                <p id="visitReasonPreview" class="info-data"></p>
                            </div>
                        </div>
                    </div>

                    <div class="heading-title">
                        <p>
                            <asp:Label ID="Label30" runat="server" Text="<%$Resources:VisitRequest,VisitorsDataa %>"
                                ClientIDMode="Static"></asp:Label>
                        </p>
                    </div>

                    <div class="request-visitors-review-scroll">
                        <div class="request-visitors-review"></div>
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
                    <asp:Label ID="Label296" runat="server" Text="<%$Resources:VisitRequest,VisitRequestSend%>"
                        ClientIDMode="Static"></asp:Label>
                </p>

                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p id="MsgID">
                    <asp:Label runat="server" Text="<%$Resources:VisitRequest,yourRequestSendSuccessfully %>"
                        ClientIDMode="Static">
                    </asp:Label>
                </p>
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

                    <asp:Label runat="server" Text="<%$Resources:VisitRequest,ViewVisitorsDataToday %>"
                        ClientIDMode="Static">
                    </asp:Label>
                </p>
                <p class="visitnumber">
                    <span>
                        <asp:Label runat="server" Text="<%$Resources:VisitRequest,RequesrtNumber %>"
                            ClientIDMode="Static">
                        </asp:Label>
                    </span>

                    : <span id="VisitNumbID"></span>
                </p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="GateInfo">
                    <label class="info-data">
                        <span>
                            <asp:Label ID="Label295" runat="server" Text="<%$Resources:VisitRequest,EnterFromGate %>"
                                ClientIDMode="Static">
                            </asp:Label>
                        </span><span>:</span><span class="welcome" id="timeLineGate"></span></label>
                </div>

                <div class="startD">
                    <label class="info-data">
                        <span>
                            <asp:Label ID="Label2951" runat="server" Text="<%$Resources:VisitRequest,VisitStartDate %>"
                                ClientIDMode="Static">
                            </asp:Label>
                        </span><span>:</span><span class="welcome" id="timeLineVisitStartDate"></span></label>
                </div>

                <div class="startE">
                    <label class="info-data">
                        <span>
                            <asp:Label ID="Label2952" runat="server" Text="<%$Resources:VisitRequest,VisitEndDate %>"
                                ClientIDMode="Static">
                            </asp:Label>
                        </span><span>:</span><span class="welcome" id="timeLineVisitEndDate"></span></label>
                </div>
                <div class="startE">
                    <label class="info-data">
                        <span>
                            <asp:Label ID="Label29" runat="server" Text="وقت الزيارة"
                                ClientIDMode="Static">
                            </asp:Label>
                        </span><span>:</span><span class="welcome" id="timeLineVisitTime"></span></label>
                </div>
                <div class="row visitorTimeLine ">
                </div>
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
                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,DeleteEnterMaterialRequest %>">
                    </asp:Literal>
                </p>
                <p class="visitnumber">رقم : <span id="requestNumberReject"></span></p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <label id="rejectMsg" class="col-form-label">هل انت متأكد من انك تريد حذف طلبك ؟ </label>
            </div>
            <div class="modal-footer">
                <button type="button" id="btnReject" class="btn preview-btn send-btn" data-toggle="modal">تأكيد</button>
            </div>
        </div>
    </div>
</div>
<script src="/modwf/style Library/branding/js/general/helpers.js"></script>
<script type="text/javascript">
    var actualData = [];
    var apiRootAddress = $("#hdnAPIRootURL").val();
    var currentUserId = _spPageContextInfo.userId;
    var listSiteURL = $("#hdnWFWebUrl").val();
    var search = false;
    $(function () {

        var lookupsDataAPI$ = apiRootAddress + "VisitRequest/GetAllLookups?ListSiteUrl=" + listSiteURL;
        getDataByAPI(
            lookupsDataAPI$,
            function (data) {
                nationalitiesData = data.NationalityList;
                $("#ddlNationalities").append('<option value="0"> ' +
                    "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                    + '</option>');
                nationalitiesData.forEach(function (item) {
                    $("#ddlNationalities").append('<option value="' + item.ID + '">' + item.Title + '</option>');
                });
            }
        );

        getAllStatuses(
            apiRootAddress,
            function (data) {
                $("#ddlStatuses").append('<option value="0">' +
                    "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                    + '</option>');
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


        var searchRequestsAPI$ = apiRootAddress + "VisitRequest/SearchRequests?ListSiteUrl=" + listSiteURL + "&UserID=" + currentUserId + "&RequestID=0&RequestCreateDate=&RequestVisitDate=&ApplicantName=&FirstName=&FatherName&FamilyName&LastName&Nationality=0&DepartmentCode=&SectionCode=&IdentyNumber=&RequestState=0&OnlyToday=false";

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

    });
    var Hijrimonths = ["محرم", "صفر", "ربيع الأول", "ربيع الثاني", "جمادي الأول", "جمادي الثاني",
        " رجب", "شعبان", "رمضان", "شوال", "ذو القعدة", "ذو الحجة"];

    function ResetSearch() {
        $("#txtRequestNumber").val("");
        $("#txtRequestDate").val("");
        $("#txtVisitDate").val("");
        $("#txtVisitorFirstName").val("");
        $("#txtVisitorFatherName").val("");
        $("#txtVisitorFamilyName").val("");
        $("#txtVisitorLastName").val("");
        $("#txtIdentityNumber").val("");
        $("#ddlNationalities").val(0);
        $("#ddlStatuses").val(0);
        $("#txtRequestDate").next().text(" ");
        $("#txtVisitDate").next().text(" ");
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

        var visitorFirstName = $("#txtVisitorFirstName").val().trim();
        var visitorFatherName = $("#txtVisitorFatherName").val().trim();
        var visitorFamilyName = $("#txtVisitorFamilyName").val().trim();
        var visitorLastName = $("#txtVisitorLastName").val().trim();
        var nationality = $("#ddlNationalities").val();
        var identityNumber = $("#txtIdentityNumber").val();
        var requestStatus = $("#ddlStatuses").val();
        if ($("#txtVisitorFirstName").val().trim() != "" || $("#txtVisitorFatherName").val().trim() != "" || $("#txtVisitorFamilyName").val().trim() != "" || $("#txtVisitorLastName").val().trim() != "") {
            search = true;
            $(".count").hide();
        }
        else {
            search = false;
            $(".count").show();
        }
        // requestRequestDate = requestRequestDate.replace('/', '-');
        var searchRequestsWithFilterationsAPI$ = apiRootAddress +
            "VisitRequest/SearchRequests?ListSiteUrl=" + listSiteURL +
            "&UserID=" + currentUserId + "&RequestID=" + requestNumber +
            "&RequestCreateDate=" + requestRequestDate +
            "&RequestVisitDate=" + visitDate +
            "&ApplicantName=&FirstName=" + visitorFirstName +
            "&FatherName=" + visitorFatherName +
            "&FamilyName=" + visitorFamilyName +
            "&LastName=" + visitorLastName +
            "&Nationality=" + nationality +
            "&DepartmentCode=&SectionCode=&IdentyNumber=" + identityNumber +
            "&RequestState=" + requestStatus + "&OnlyToday=" + false + "&format=json";

        getDataByAPI(searchRequestsWithFilterationsAPI$, function (data, status, xhr) {
            if (xhr.getResponseHeader('StatusCode') == 1) {
                hideGeneralErrorMessage();
                actualData = data;
                renderSearchResult(data, search);
            }
            else {
                //Show Error message
                showGeneralErrorMessage();
            }
        });
    }

    function changePaggerNumb() {
        //searchRequest ()
        renderSearchResult(actualData);

    }

    function renderSearchResult(data, search) {
        //search=false;
        $("#dataTable > tbody").empty();
        var datacount = 0;
        $(".PaggerDiv").show();
        if (data == null || data.length == 0) {
            $("#dataTable > tbody").append("<tr><td>" +
                "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,ThereIsNoData%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + "</td></tr>");

            $("#RowNumb").text("0");
            $(".PaggerDiv").hide();
            return;
        }

        getAllStatuses(
            apiRootAddress,
            function (statusDataArray) {

                //this is our function to group by 
                // const groupBy = key => array =>

                //     array.reduce((objectsByKeyValue, obj) => {
                //         const value = obj[key];
                //         objectsByKeyValue[value] = (objectsByKeyValue[value] || []).concat(obj);
                //         return objectsByKeyValue;
                //     }, {});


                // const groupByID = groupBy('RequestID');
                // var groupedRequestsData = groupByID(data);
                // groupedRequestsData = Object.assign({}, Object.values(groupedRequestsData).reverse());


                //     var groupBy = function(xs, key) {
                //       return xs.reduce(function(rv, x) {
                // (rv[x[key]] = rv[x[key]] || []).push(x);
                //  return rv;
                //        }, {});
                //   };
                groupedRequestsData = groupBy(data, 'RequestID');
                // groupedRequestsData = Object.assign({}, Object.values(groupedRequestsData).reverse());
                groupedRequestsData = Object.keys(groupedRequestsData).map(function (itm) { return groupedRequestsData[itm]; }).reverse();

                for (var arrayInside in groupedRequestsData) {
                    var HTML = "";
                    var innerDivs = "";
                    var AcceptTxt = "";
                    var AcceptBol = "";
                    var Acceptsec = "";
                    var visitorFullName;
                    for (var i = 0; i < groupedRequestsData[arrayInside].length; i++) {
                        if (groupedRequestsData[arrayInside][i].SecurityStatus == "1" && groupedRequestsData[arrayInside][i].ItemIsApproved == "1") {
                            AcceptTxt = "تم الموافقة";
                            AcceptBol = "acc";
                        }
                        else if (groupedRequestsData[arrayInside][i].SecurityStatus == "1" && groupedRequestsData[arrayInside][i].ItemIsApproved != "1") {
                            AcceptTxt = "تم الرفض";
                            AcceptBol = "ٌrej";
                        }
                        if (groupedRequestsData[arrayInside][i].SecurityStatus == "1") {
                            Acceptsec = "Done";
                        }
                        if (i >= 0) {
                            visitorFullName = groupedRequestsData[arrayInside][i].FirstName + " " + groupedRequestsData[arrayInside][i].FatherName + " " + groupedRequestsData[arrayInside][i].FamilyName + " " + groupedRequestsData[arrayInside][i].LastName;
                            innerDivs += '<div class="col-md-4"><div class="inner-card"><p class="title">' + visitorFullName + '</p><span class="addStauts ' + (AcceptBol == "acc" ? "Accepted-req" : "rejected-req ") + ' ' + (Acceptsec == "Done" ? "show" : "hide") + ' "></span><span class="nationality"><span class="nation-icon"></span> ' + groupedRequestsData[arrayInside][i].NationalityValue + '</span><span class="visitorid"><span class="id-icon"></span>' + groupedRequestsData[arrayInside][i].UserIdentyID + '</span><p class="acceptTxt ' + (AcceptBol == "acc" ? "Accepted-status" : "rejected-status ") + '" >' + AcceptTxt + '</p></div></div>';
                        }
                    }

                    for (var i = 0; i < groupedRequestsData[arrayInside].length; i++) {
                        if (i === 0) {
                            //HTML = "";
                            var requestID = groupedRequestsData[arrayInside][i].RequestID;
                            var supervisorStatus = groupedRequestsData[arrayInside][i].SupervisorStatus;
                            var securityStatus = groupedRequestsData[arrayInside][i].SecurityStatus;
                            var supervisorStatusText = securityStatus === "" ? "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,InProgress%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" : securityStatus === "1" ? "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Accepted%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" : "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Rejected%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                            var disableStatusText = supervisorStatus === "" ? " " : supervisorStatus === "1" ? "disable" : "disable";
                            var supervisorStatusClass = supervisorStatus === "" ? "waiting" : supervisorStatus === "1" ? "accepted" : "rejected";
                            var visitorsCount = groupedRequestsData[arrayInside].length;

                            var statusText = "";
                            var showVisitorLine = "";

                            var statusArr = getStatusTextAndClass(supervisorStatus, securityStatus, statusDataArray);
                            statusText = statusArr[0];
                            supervisorStatusClass = statusArr[1];
                            if (supervisorStatusClass == "accepted") {
                                showVisitorLine = "show";

                            }


                            HTML += '<tr id="mainTable" >'
                                + '<td>' + requestID + '</td>'
                                + '<td>' + GetHijriDate(groupedRequestsData[arrayInside][i].RequestCreatedDate) + '</td>'
                                + '<td>' + GetHijriDate(groupedRequestsData[arrayInside][i].VisitDate) + '</td>'
                            if (!search) {
                                HTML += '<td>' + visitorsCount + '</td>';
                            }
                            HTML += '<td>  <span  class="' + supervisorStatusClass + '">' + statusText + ' </span> </td>'
                                + '<td class="viewoption">' + '<a  title="<sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,ViewVisit%>" EncodeMethod="EcmaScriptStringLiteralEncode"/>" class="options-list review" href="javascript:viewRequestItem(' + requestID + ')"></a><a title="<sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,EditVisit%>" EncodeMethod="EcmaScriptStringLiteralEncode"/>" class="options-list edit ' + disableStatusText + '" href="EmployeeVisitRequestEdit.aspx?rid=' + requestID + '"></a><a title="<sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,DeleteVisit%>" EncodeMethod="EcmaScriptStringLiteralEncode"/>" class="options-list delete ' + disableStatusText + '" href="javascript:deleteRequest(' + requestID + ')"></a><span><a title="<sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,FollowVisit%>" EncodeMethod="EcmaScriptStringLiteralEncode"/>" class="options-list timeline ' + showVisitorLine + '" href="javascript:showTimeLine(' + requestID + ')"></a></span><span class="options-list showmore" role="button" data-toggle="collapse" href="#row' + requestID + '" aria-expanded="false" aria-controls="row' + requestID + '"></span class="' + showVisitorLine + '" ></td>'

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
                        var Pageddata = paginate(AllData, pagersize, pageNumber);
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

    function viewRequestItem(rid) {
        getRequest(rid, function (data) {
            request = data;

            $("#VisitNumb").text(request.ID);
            $("#visitMessageTitle").text(request.VisitMessage);
            $("#visitStartDatePreview").text(GetHijriDate(request.VisitStartDate));
            $("#visitTimePreview").text(request.VisitTime);
            $("#visitEndDatePreview").text(GetHijriDate(request.VisitEndDate));
            $("#visitReasonPreview").text(request.VisitReasonValue);
            $("#applicantNamePreview").text(request.UserName);
            $("#applicantTitlePreview").text(request.ApplicantRank);
            $("#applicantSectionPreview").text(request.ApplicantSection);
            $("#applicantDepartmentPreview").text(request.ApplicantAdministration);


            var visitorsCount = request.VisitPersons.length;
            var deviceCount = 0;

            $(".request-visitors-review").empty();
            var secBol = "";
            if (request.SecuertyState == "1") {
                secBol = "Done";
            }
            request.VisitPersons.forEach(function (visitor) {
                var elem = document.createElement("div");
                elem.classList.add("form-row", "reviewCol");
                var secApprove = "";

                if (request.SecuertyState == "1" && visitor.ItemIsApproved == "1") {
                    secApprove = "secApprove";
                }

                var visitorRowBody = '';
                visitorRowBody += '<span class="addStauts ' + (secApprove == "secApprove" ? "Accepted-req" : "rejected-req ") + ' ' + (secBol == "Done" ? "show" : "hide") + ' "></span>';
                visitorRowBody += '<div class="form-group info-data  col-md-8">';
                visitorRowBody += visitor.FirstName + ' ' + visitor.FatherName + ' ' + visitor.FamilyName + ' ' + visitor.LastName;
                visitorRowBody += '</div>';
            <%--    visitorRowBody += '<div class="form-group info-data col-md-4">';
                visitorRowBody += '<p class="dateTime-label"> <i class=" mdi mdi-av-timer "></i>  <span>' +
                    "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,VisitTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                    + "</span><span> : </span> <span class='time'>" + visitor.VisitTime + "</span></p>";
                visitorRowBody += '</div>';--%>

                visitorRowBody += '<div class="form-group  col-md-4">';
                visitorRowBody += '<span class="nation-icon"></span>';
                visitorRowBody += '  <label class="col-form-label">' +
                    "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Nationality%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                    + ' </label>';
                visitorRowBody += '<p class="info-data">' + visitor.NationalityValue + ' </p>';
                visitorRowBody += '</div>';


                visitorRowBody += '<div class="form-group  col-md-4">';
                visitorRowBody += '<span class="ID-icon"></span>';
                visitorRowBody += '  <label class="col-form-label">' +
                    "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Identity	%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"

                    + '</label>';
                visitorRowBody += '<p class="info-data" >';
                visitorRowBody += '<span >';
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
                    visitorRowBody += '  <label class="col-form-label">' +
                    "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,WorkingPlace%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                        + '</label>';
                    visitorRowBody += '<p class="info-data">' + visitor.WorkingPlace + ' </p>';

                    visitorRowBody += '</div>';
                }



                //End of form-row visitorRowData



                visitorRowBody += '<div class="visitor-row-dev">';

                visitorRowBody += '<div class="form-row">';
                visitorRowBody += '<div class="form-group col-md-12  devices-title">';
                visitorRowBody += '<span class="devices-icon"></span>';
                visitorRowBody += "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,AttachedDevices%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                visitorRowBody += '</div>';

                visitorRowBody += '</div >';


                if (visitor.VisitDevices != null && visitor.VisitDevices.length > 0) {
                    visitor.VisitDevices.forEach(function (device) {
                        var secApproveDev = "";

                        if (request.SecuertyState == "1" && device.ItemIsApproved == "1") {
                            secApproveDev = "secApprove";
                        }
                        visitorRowBody += '<div class="devices" style="vertical-align: top">';
                        visitorRowBody += '<span class="addStauts ' + (secApproveDev == "secApprove" ? "Accepted-req" : "rejected-req ") + ' ' + (secBol == "Done" ? "show" : "hide") + ' "></span>';

                        visitorRowBody += '<p class="devicetype info-data">';
                        visitorRowBody += '<span> ' + device.DeviceType + '  </span>';
                        if (device.ManufacturingCompanyName != '') {
                            visitorRowBody += '<span class="info-data">( ' + device.ManufacturingCompanyName + ' ) </span>';
                        }
                        visitorRowBody += '</p>';

                        if (device.DeviceNumber != '') {
                            visitorRowBody += '<p>';
                            visitorRowBody += '<span> ' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,DeviceNumber%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                                + '</span><span> : </span>';
                            visitorRowBody += device.DeviceNumber;
                            visitorRowBody += '</p>';
                        }

                        if (device.NotesAboutDevice != '') {
                            visitorRowBody += '<p >';
                            visitorRowBody += '<span> ' +
                                "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Notes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
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
                $(".request-visitors-review").append(elem);
            });


            if (request.SecurityNote != null && request.SecurityNote != "") {
                $("#requestNoteDIV").show();
                $("#requestNoteTitle").html("<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,SecurityNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
                $("#requestNoteText").html(request.SecurityNote);

            } else if (request.SuperVisiorNote != null && request.SuperVisiorNote != "") {
                $("#requestNoteDIV").show();
                $("#requestNoteTitle").html("<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,DelegateNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
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

    function compareTwoDates(date, today) {

        if (date > today) return 0;
        else if (date < today) return 1;
        else return 2;

    }
    // VisitTime: "7:30 AM"
    function compareBetweenTwoTimes(TimeString) {
        var ampm = new Date().getHours() >= 12 ? 'PM' : 'AM';
        var nowHours = new Date().getHours();
        var TimeH = TimeString.split(":")[0];
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

    function getDaysArrayBetweenTwoDates(start, end) {
        for (var arr = [], dt = start; dt <= end; dt.setDate(dt.getDate() + 1)) {
            arr.push(new Date(dt));
        }
        return arr;
    };

    function showTimeLine(rid) {
        getTimeLineRequest(rid, function (data) {
            timeLinerequest = data;
            $(".visitorTimeLine").empty();
            if (timeLinerequest[0]) {

                var VisitStart = GetHijriDate(timeLinerequest[0].VisitStartDate);
                var VisitEnd = GetHijriDate(timeLinerequest[0].VisitEndDate);
                $("#timeLineVisitStartDate").text(VisitStart);
                $("#timeLineVisitEndDate").text(VisitEnd);
                $("#timeLineGate").text(timeLinerequest[0].Gate);
                $("#timeLineVisitTime").text(timeLinerequest[0].VisitTime);
                var daylistBtweenStarAndEnd = getDaysArrayBetweenTwoDates(new Date(timeLinerequest[0].VisitStartDate.split("T")[0])
                    , new Date(timeLinerequest[0].VisitEndDate.split("T")[0]));

                daylistBtweenStarAndEnd = daylistBtweenStarAndEnd.map((v) => v.toISOString().slice(0, 10)).join(",");
                var V_EndDate = timeLinerequest[0].VisitEndDate.split("T")[0].split("-");
                var v_status = compareTwoDates(new Date(V_EndDate[1] + '/' + V_EndDate[2] + '/' + V_EndDate[0] + " 00:00"), new Date(getTodayInFormat() + " 00:00"))

                if (v_status == 1) { // visit Ended

                    for (var i = 0; i < timeLinerequest[0].VisitPersons.length; i++) { // visit endedand there is no item in in/out array

                        if (timeLinerequest[0].VisitPersons[i].PersonCheckInOuts.length == 0) {
                            var personFullName = timeLinerequest[0].VisitPersons[i].FirstName + " " + timeLinerequest[0].VisitPersons[i].FatherName + " " + timeLinerequest[0].VisitPersons[i].FamilyName + " " + timeLinerequest[0].VisitPersons[i].LastName;
                            var elem = document.createElement("div");
                            elem.classList.add("col-md-6", "reviewCol");
                            var visitorRowBody = '<div class="timeline-info loggedoutCard">';
                            visitorRowBody += ' <div class="loggeduser' + (status == "In" ? "  " : "hide ") + ' "></div>';
                            visitorRowBody += '<p class="info-data">' + personFullName + '</p>';
                            visitorRowBody += '<p class="info-data"><span>' +
                            "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Nationality%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                                + '</span><span>:</span><span>' + timeLinerequest[0].VisitPersons[i].NationalityValue + '</span></p>';

                            visitorRowBody += '<p class="info-data"><span>' +
                            "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,VisitTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                                + '</span><span>:</span><span>' + timeLinerequest[0].VisitTime + '</span></p>';
                            noCheckInOut = "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,DoNotLoginTillNow%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                            visitorRowBody += '<p class="info-data">' + noCheckInOut + '</p>';
                            visitorRowBody += '</div >';
                            elem.innerHTML = visitorRowBody;
                            $(".visitorTimeLine").append(elem);

                        }
                        if (timeLinerequest[0].VisitPersons[i].PersonCheckInOuts.length > 0) {
                            var elem = document.createElement("div");
                            elem.classList.add("col-md-12", "reviewCol");
                            var visitorRowBody = ("<p class='welcome visitor-status' > حالة الزائر " + "( " + timeLinerequest[0].VisitPersons[i].FirstName + "  " + timeLinerequest[0].VisitPersons[i].LastName + ") بالنسبة لأيام الزيارة </p>");

                            visitorRowBody += ("<table class='table table-striped list-visit'>");
                            visitorRowBody += "<thead>"
                            visitorRowBody += "<tr>";
                            visitorRowBody += "<th scope='col'>تاريخ الزيارة</th>";
                            visitorRowBody += "<th scope='col'>وقت الدخول</th>";
                            visitorRowBody += "<th scope='col'>وقت الخروج</th>";
                            visitorRowBody += "</tr>";
                            visitorRowBody += "</thead>";
                            var daysBetween = daylistBtweenStarAndEnd.split(",");
                            for (var n = 0; n < daysBetween.length; n++) {
                                for (var j = 0; j < timeLinerequest[0].VisitPersons[i].PersonCheckInOuts.length; j++) {
                                    if (daysBetween[n] == timeLinerequest[0].VisitPersons[i].PersonCheckInOuts[j].CheckIN.split("T")[0]) {
                                        var CheckIn = timeLinerequest[0].VisitPersons[i].PersonCheckInOuts[0].CheckIN.split("T")[1];
                                        var CheckOut = timeLinerequest[0].VisitPersons[i].PersonCheckInOuts[0].CheckOut;
                                        CheckOut = CheckOut ? timeLinerequest[0].VisitPersons[i].PersonCheckInOuts[0].CheckOut.split("T")[1] : null;
                                        var VisitDate = GetHijriDate(timeLinerequest[0].VisitPersons[i].PersonCheckInOuts[0].Created.split("T")[0])
                                        console.log("checkIn", VisitDate)
                                        visitorRowBody += "<tr>";
                                        visitorRowBody += "<td>" + GetHijriDate(daysBetween[n]) + "</td>";
                                        visitorRowBody += "<td>" + convertTime24to12(CheckIn) + "</td>";
                                        if (CheckOut) {
                                            visitorRowBody += "<td>" + convertTime24to12(CheckOut) + "</td>";
                                        }
                                        else {
                                            visitorRowBody += "<td>الزئر مازال بالداخل</td>";
                                        }
                                        visitorRowBody += '</tr>';
                                    }
                                    else {
                                        visitorRowBody += "<tr>";
                                        visitorRowBody += "<td>" + GetHijriDate(daysBetween[n]) + "</td>";
                                        visitorRowBody += "<td colspan='2'>الزائر لم يحضر فى هذا اليوم</td>";
                                        visitorRowBody += '</tr>';
                                    }
                                }
                            }

                            visitorRowBody += ' </tbody>';
                            visitorRowBody += ' </table>';
                            visitorRowBody += ' </div>';
                            elem.innerHTML = visitorRowBody;
                            $(".visitorTimeLine").append(elem);
                        }
                    }

                }
                else {
                    var V_StartDate = timeLinerequest[0].VisitStartDate.split("T")[0].split("-");
                    var v_start_status = compareTwoDates(new Date(V_StartDate[1] + '/' + V_StartDate[2] + '/' + V_StartDate[0]), new Date(getTodayInFormat() + " 00:00"));

                    if (v_start_status == 0) { //if start Date not come yet
                        var elem = document.createElement("div");
                        elem.classList.add("col-md-auto", "reviewCol");
                        var visitorRowBody = '<div class="timeline-info loggedoutCard">';
                        visitorRowBody += ' <div class="loggeduser' + (status == "In" ? "  " : "hide ") + ' "></div>';
                        noCheckInOut = "االوقت المحدد لهذه الزيارة يبدأ فى" + " : (" + GetHijriDate(timeLinerequest[0].VisitStartDate) + ")";
                        visitorRowBody += '<p class="info-data">' + noCheckInOut + '</p>';
                        visitorRowBody += '</div >';
                        elem.innerHTML = visitorRowBody;
                        $(".visitorTimeLine").append(elem);
                    }
                    else if (v_start_status == 2 && v_status == 2) {//if today is the start date and End Date

                        for (var i = 0; i < timeLinerequest[0].VisitPersons.length; i++) {

                            if (timeLinerequest[0].VisitPersons[i].PersonCheckInOuts.length == 0) {
                                var personFullName = timeLinerequest[0].VisitPersons[i].FirstName + " " + timeLinerequest[0].VisitPersons[i].FatherName + " " + timeLinerequest[0].VisitPersons[i].FamilyName + " " + timeLinerequest[0].VisitPersons[i].LastName;
                                var elem = document.createElement("div");
                                elem.classList.add("col-md-6", "reviewCol");
                                var visitorRowBody = '<div class="timeline-info loggedoutCard">';
                                visitorRowBody += ' <div class="loggeduser' + (status == "In" ? "  " : "hide ") + ' "></div>';
                                visitorRowBody += '<p class="info-data">' + personFullName + '</p>';
                                visitorRowBody += '<p class="info-data"><span>' +
                            "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Nationality%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                                    + '</span><span>:</span><span>' + timeLinerequest[0].VisitPersons[i].NationalityValue + '</span></p>';

                                visitorRowBody += '<p class="info-data"><span>' +
                            "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,VisitTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
                                    + '</span><span>:</span><span>' + timeLinerequest[0].VisitTime + '</span></p>';
                                    <%--noCheckInOut = "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,DoNotLoginTillNow%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                                visitorRowBody += '<p class="info-data">' + noCheckInOut + '</p>';--%>
                                visitorRowBody += '</div >';
                                elem.innerHTML = visitorRowBody;
                                $(".visitorTimeLine").append(elem);
                            }
                            else if (timeLinerequest[0].VisitPersons[i].PersonCheckInOuts.length > 0) {
                                var elem = document.createElement("div");
                                elem.classList.add("col-md-12");
                                var visitorRowBody = ("<p class='welcome visitor-status' > حالة الزائر ( " + " " + timeLinerequest[0].VisitPersons[i].FirstName + "  " + timeLinerequest[0].VisitPersons[i].LastName + " ) بالنسبة لأيام الزيارة </p>");

                                visitorRowBody += ("<table class='table table-striped list-visit'>");
                                visitorRowBody += "<thead>"
                                visitorRowBody += "<tr>";
                                visitorRowBody += "<th scope='col'>تاريخ الزيارة</th>";
                                visitorRowBody += "<th scope='col'>وقت الدخول</th>";
                                visitorRowBody += "<th scope='col'>وقت الخروج</th>";
                                visitorRowBody += "</tr>";
                                visitorRowBody += "</thead>";
                                var CheckIn = timeLinerequest[0].VisitPersons[i].PersonCheckInOuts[0].CheckIN.split("T")[1];
                                var CheckOut = timeLinerequest[0].VisitPersons[i].PersonCheckInOuts[0].CheckOut;
                                CheckOut = CheckOut ? timeLinerequest[0].VisitPersons[i].PersonCheckInOuts[0].CheckOut.split("T")[1] : null;
                                var VisitDate = GetHijriDate(timeLinerequest[0].VisitPersons[i].PersonCheckInOuts[0].Created.split("T")[0])
                                visitorRowBody += "<tr>";
                                visitorRowBody += "<td>" + VisitDate + "</td>";
                                visitorRowBody += "<td>" + convertTime24to12(CheckIn) + "</td>";
                                if (CheckOut) {
                                    visitorRowBody += "<td>" + convertTime24to12(CheckOut) + "</td>";
                                }
                                else {
                                    visitorRowBody += "<td>الزائر مازال بالداخل</td>";
                                }
                                visitorRowBody += '</tr>';
                                visitorRowBody += ' </tbody>';
                                visitorRowBody += ' </table>';
                                visitorRowBody += ' </div>';
                                elem.innerHTML = visitorRowBody;
                                $(".visitorTimeLine").append(elem);
                            }
                        }
                    }
                    else if ((v_start_status == 1 && v_status == 0) || (v_start_status == 2 && v_status == 0) || (v_start_status == 1 && v_status == 2)) {//if today is between start date and End Date or today equal start and less than end Date

                        var daysBetween = daylistBtweenStarAndEnd.split(",");
                        for (var visitor = 0; visitor < timeLinerequest[0].VisitPersons.length; visitor++) {
                            var elem = document.createElement("div");
                            elem.classList.add("col-md-12", "reviewCol");
                            var visitorRowBody = ("<p class='welcome visitor-status' > حالة الزائر (" + " " + timeLinerequest[0].VisitPersons[visitor].FirstName + "  " + timeLinerequest[0].VisitPersons[visitor].LastName + ") بالنسبة لأيام الزيارة </p>");
                            visitorRowBody += ("<table class='table table-striped list-visit'>");
                            visitorRowBody += "<thead>"
                            visitorRowBody += "<tr>";
                            visitorRowBody += "<th scope='col'>تاريخ الزيارة</th>";
                            visitorRowBody += "<th scope='col'>وقت الدخول</th>";
                            visitorRowBody += "<th scope='col'>وقت الخروج</th>";
                            visitorRowBody += "</tr>";
                            visitorRowBody += "</thead>";
                            visitorRowBody += "</tbody>";
                            if (timeLinerequest[0].VisitPersons[visitor].PersonCheckInOuts.length == 0) {
                                for (var visitday = 0; visitday < daysBetween.length; visitday++) {
                                    var day = daysBetween[visitday].split("-");
                                    var visitday_status = compareTwoDates(new Date(day[1] + '/' + day[2] + '/' + day[0]), new Date(getTodayInFormat() + " 00:00"));
                                    if (visitday_status == 1) {

                                        visitorRowBody += "<tr>";
                                        visitorRowBody += "<td>" + GetHijriDate(daysBetween[visitday]) + "</td>";
                                        visitorRowBody += "<td colspan='2'> لم يحضر فى هذا اليوم</td>";
                                        visitorRowBody += '</tr>';
                                    }
                                    else if (visitday_status == 0) {
                                        visitorRowBody += "<tr>";
                                        visitorRowBody += "<td>" + GetHijriDate(daysBetween[visitday]) + "</td>";
                                        visitorRowBody += "<td colspan='2'>  فى انتظار دخول الزائر فى هذا اليوم </td>";
                                        visitorRowBody += '</tr>';
                                    }
                                    else {

                                        visitorRowBody += "<tr class='today'>";
                                        visitorRowBody += "<td class='green'>" + GetHijriDate(daysBetween[visitday]) + "</td>";
                                        visitorRowBody += "<td class='green' colspan='2'> " + " الوقت المحدد لهذه الزيارة اليوم فى" + "  (" + timeLinerequest[0].VisitTime + ")</td>";
                                        visitorRowBody += '</tr>';
                                    }
                                }
                            }
                            else if (timeLinerequest[0].VisitPersons[visitor].PersonCheckInOuts.length > 0) {
                                var userHaveCheckIns;
                                for (var visitday = 0; visitday < daysBetween.length; visitday++) {
                                    userHaveCheckIns = false;
                                    for (var vsitorStatus = 0; vsitorStatus < timeLinerequest[0].VisitPersons[visitor].PersonCheckInOuts.length; vsitorStatus++) {
                                        if (daysBetween[visitday] == timeLinerequest[0].VisitPersons[visitor].PersonCheckInOuts[vsitorStatus].CheckIN.split("T")[0]) {
                                            userHaveCheckIns = true;
                                            var CheckIn = timeLinerequest[0].VisitPersons[visitor].PersonCheckInOuts[vsitorStatus].CheckIN.split("T")[1];
                                            //var CheckOut = CheckOut ? timeLinerequest[0].VisitPersons[visitor].PersonCheckInOuts[0].CheckOut.split("T")[1] : null;
                                            var CheckOut = timeLinerequest[0].VisitPersons[visitor].PersonCheckInOuts[vsitorStatus].CheckOut;
                                            CheckOut = CheckOut ? timeLinerequest[0].VisitPersons[visitor].PersonCheckInOuts[vsitorStatus].CheckOut.split("T")[1] : null;

                                            var VisitDate = GetHijriDate(timeLinerequest[0].VisitPersons[visitor].PersonCheckInOuts[vsitorStatus].Created.split("T")[0])
                                            visitorRowBody += "<tr>";
                                            visitorRowBody += "<td>" + GetHijriDate(daysBetween[visitday]) + "</td>";
                                            visitorRowBody += "<td>" + convertTime24to12(CheckIn) + "</td>";
                                            if (CheckOut) {
                                                visitorRowBody += "<td>" + convertTime24to12(CheckOut) + "</td>";
                                            }
                                            else {
                                                visitorRowBody += "<td>الزائر مازال بالداخل</td>";
                                            }
                                            visitorRowBody += '</tr>';
                                        }
                                    }
                                    if (userHaveCheckIns == false) {

                                        var day = new Date(daysBetween[visitday]).getDate();
                                        var month = new Date(daysBetween[visitday]).getMonth();
                                        var year = new Date(daysBetween[visitday]).getFullYear();


                                        var compare_status = compareTwoDates(new Date(year, month, day), new Date(getTodayInFormat() + " 00:00"));
                                        visitorRowBody += "<tr>";
                                        visitorRowBody += "<td >" + GetHijriDate(daysBetween[visitday]) + "</td>";
                                        if (compare_status == 0) {
                                            visitorRowBody += "<td colspan='2'>  فى انتظار دخول الزائر فى هذا اليوم </td>";
                                        }
                                        else if (compare_status == 1) {
                                            visitorRowBody += "<td colspan='2'> لم يحضر فى هذا اليوم</td>";
                                        }
                                        else {
                                            visitorRowBody += "<td colspan='2'> في إنتظار الزائر اليوم</td>";
                                        }
                                        visitorRowBody += '</tr>';
                                    }
                                }
                            }


                            visitorRowBody += ' </tbody>';
                            visitorRowBody += ' </table>';
                            visitorRowBody += ' </div>';
                            elem.innerHTML = visitorRowBody;
                            $(".visitorTimeLine").append(elem);
                        }

                    }
                }
            }

            id = rid;
            $("#VisitNumbID").text(rid);
            $("#timeLineModel").modal({ backdrop: 'static', keyboard: false });

            hideLoader();

        });
    }

    function getTimeLineRequest(id, callback) {
        var timeLineRequestsAPI$ = apiRootAddress + "VisitRequest/GetCheckInCheckOut?ListSiteUrl=" + listSiteURL + "&RequestID=" + id + "&ToDay=false&UserID=0&Nationality=0&RequestCreateDate=null&RequestDate=null&Gate=&ApplicantName=&FirstName=&FatherName&FamilyName&LastName=&DepartmentCode=&SectionCode=&IdentityNumber=";
        getDataByAPI(
            timeLineRequestsAPI$,
            function (data) {
                callback(data);
            }
        );
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



    function deleteRequest(id) {
        $("#requestNumberReject").text(id);
        $("#rejectMsg").text("هل انت متأكد من انك تريد حذف طلبك ؟");
        $("#btnReject").show();
        $('#rejectModelCenter').modal({ backdrop: 'static', keyboard: false });

    }

    $("#btnReject").click(function (e) {
        e.preventDefault();
        showLoader();
        $("#btnReject").attr("disabled", true);
        var rid = $("#requestNumberReject").text();
        var deleteRequestAPI$ = apiRootAddress + 'VisitRequest/DeleteRequest?ListSiteUrl=' + listSiteURL + '&ReqID=' + rid;
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

    //$('#rejectModelCenter').on('hidden.bs.modal', function () {
    //    searchRequest();
    //})

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

    $("#showSearch").click(function () {
        $("#SearchOptions").toggleClass("is-opend");
    });

    $('.textPicker').on('input', function () {
        if ($(this).val() == "") {
            $(this).siblings(".daytext").text(" ");

        }
    });
</script>
