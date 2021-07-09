<%@ Assembly Name="MaterialsRequestsWFWebparts, Version=1.0.0.0, Culture=neutral, PublicKeyToken=8f2240e9e9a12cbf" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmployeeMaterialsRequestsWPUserControl.ascx.cs" Inherits="MaterialsRequestsWFWebparts.EmployeeMaterialsRequestsWP.EmployeeMaterialsRequestsWPUserControl" %>



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
                <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,FilterData %>"></asp:Literal>
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
                            <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,RequestNumber %>">
                            </asp:Literal>
                        </label>
                        <input type="text" class="form-control" id="txtRequestNumber"
                            onkeypress="javascript:return isNumber(event)" />
                        <label class="numbval"></label>
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtCreationDate" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,RequestCreateDate %>">
                            </asp:Literal>
                        </label>

                        <input type="text" class="form-control textPicker" id="txtCreationDate" autocomplete="off" />
                        <label class="daytext"></label>
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtRequestDate" class="col-form-label">
                            <asp:Label runat="server" ID="lblDevicesEntryDateText2" ClientIDMode="Static"></asp:Label>

                            <!-- تاريخ إدخال المواد  -->

                        </label>
                        <input type="text" class="form-control textPicker" id="txtRequestDate" autocomplete="off" />
                        <label class="daytext"></label>
                    </div>
                </div>

                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtSupervisorName" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,SupervisorName %>">
                            </asp:Literal>
                        </label>
                        <input type="text" id="txtSupervisorName" class="form-control" />
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtMaterialName" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,MaterialName %>">
                            </asp:Literal>
                        </label>
                        <input type="text" id="txtMaterialName" class="form-control" />
                    </div>
                </div>

                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="ddlStatuses" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,RequestStatus %>">
                            </asp:Literal>
                        </label>
                        <select id="ddlStatuses" class="form-control">
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                </div>
                <div class="form-group col-md-6">
                    <button id="btnSearch" class="btn preview-btn send-btn">
                        <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,Search %>"></asp:Literal>
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
        <div id="PrintArea"></div>
        <div id="printAreaView" class="tableview">
            <div class="table-responsive formLayout-table printedtable">
                <div class="table-options">
                    <div class="totalnumb">
                        <span>
                            <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,TotalAvaliableNumber %>">
                            </asp:Literal>
                        </span>
                        <span>:</span>
                        <span id="RowNumb" class="numb">0</span>
                    </div>
                    <div class="new-request">
                        <a href="AddMaterialsRequest.aspx" class="btn preview-btn send-btn btn-request">
                            <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,NewRequest %>">
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
                <table id="dataTable" class="table ">
                    <thead>
                        <tr class="active">
                            <th class="col-xs-2"><strong>
                                <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,RequestNumber %>">
                                </asp:Literal>
                            </strong></th>
                            <th class="col-xs-2"><strong>
                                <asp:Literal runat="server"
                                    Text="<%$Resources:MaterialsRequests,RequestCreateDate %>"></asp:Literal>
                            </strong></th>
                            <th class="col-xs-6"><strong>
                                <asp:Label runat="server" ID="lblDevicesEntryDateText" ClientIDMode="Static">
                                </asp:Label>

                            </strong></th>
                            <th class="col-xs-2"><strong>
                                <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,SupervisorName %>">
                                </asp:Literal>
                            </strong></th>
                            <th class="col-xs-2 count"><strong>
                                <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,MatrialsName %>">
                                </asp:Literal>
                            </strong></th>
                            <th class="col-xs-2"><strong>
                                <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,RequestStatus %>">
                                </asp:Literal>
                            </strong></th>

                            <th class="viewoption">
                                <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,ReviewRequest %>">
                                </asp:Literal>
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
                            <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,RequestNumber %>">
                            </asp:Literal>
                        </strong></th>
                        <th class="col-xs-2"><strong>
                            <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,RequestCreateDate %>">
                            </asp:Literal>
                        </strong></th>
                        <th class="col-xs-6"><strong>
                            <asp:Label runat="server" ID="lblDevicesEntryDateText1" ClientIDMode="Static">
                            </asp:Label>

                            <!-- // تاريخ إدخال المواد -->
                        </strong></th>
                        <th class="col-xs-2"><strong>
                            <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,SupervisorName %>">
                            </asp:Literal>
                        </strong></th>
                        <th class="col-xs-2 count"><strong>
                            <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,MatrialsName %>">
                            </asp:Literal>
                        </strong></th>
                        <th class="col-xs-2"><strong>
                            <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,RequestStatus %>">
                            </asp:Literal>
                        </strong></th>

                        <th class="viewoption">
                            <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,ReviewRequest %>">
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
                        <asp:Label runat="server" ID="RequestReview" ClientIDMode="Static">
                        </asp:Label>
                    </p>
                    <p class="visitnumber">رقم : <span id="VisitNumb"></span></p>
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
                                    <asp:Label runat="server" ID="MtiralEntryDate" ClientIDMode="Static">
                                    </asp:Label>
                                </label>

                                <p id="EntryDatePreview" class="info-data"></p>
                            </div>
                            <div class="form-group col-md-4">
                                <i class=" mdi mdi-av-timer "></i>
                                <label class="col-form-label">
                                    <asp:Label runat="server" ID="lblMaterialEntryTime" ClientIDMode="Static">
                                    </asp:Label>
                                </label>

                                <p id="EntryTimePreview" class="info-data"></p>
                            </div>
                        </div>
                    </div>
                    <!-- <div class="heading-title">
                        <p>
                            بيانات مقدم الطلب
                        </p>
                    </div> -->
                    <!-- <div class="emp-request">
                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <span id="applicantNamePreview" class="info-data"></span>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="col-form-label">المرتبة </label>
                                <p id="applicantTitlePreview" class="info-data"></p>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="col-form-label">القسم </label>
                                <p id="applicantSectionPreview" class="info-data"></p>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="col-form-label">الإدارة </label>
                                <p id="applicantDepartmentPreview" class="info-data"></p>
                            </div>
                        </div>
                    </div> -->
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

<div class="modal fade" id="rejectModelCenter" tabindex="-1" role="dialog" aria-labelledby="rejectModelCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered formLayout-model action-model delete-model" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <p class="modal-title" id="rejectModelCenterModalLongTitle">
                    <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,DeleteEnterMaterialRequest %>">
                    </asp:Literal>
                </p>
                <p class="visitnumber">
                    <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,Rqam %>"></asp:Literal>
                    : <span id="requestNumberReject"></span>
                </p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <label id="rejectMsg" class="col-form-label">
                    <asp:Literal runat="server"
                        Text="<%$Resources:MaterialsRequests,AreYouSureYouWantToDeleteYourRequest %>"></asp:Literal>
                </label>
            </div>
            <div class="modal-footer">
                <button type="button" id="btnReject" class="btn preview-btn send-btn" data-toggle="modal">
                    <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,Confirm %>"></asp:Literal>
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
                        <asp:Label runat="server" ID="lblViewTodayMaterialRequests" ClientIDMode="Static" Text="">
                        </asp:Label>
                    </label>
                </p>
                <p class="visitnumber">
                    <span>
                        <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,RequestNumber %>">
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
                    <label class="info-data">
                        <span>
                            <asp:Label runat="server" ID="lblEntryGate" ClientIDMode="Static">
                            </asp:Label>

                        </span><span>:</span><span class="welcome" id="timeLineGate"></span></label>
                </div>

                <div class="RequestInfo">
                    <label class="info-data"></label>
                    <asp:Label class="col-form-label" runat="server" ID="lblRequestDateMonitor" ClientIDMode="Static">                    
                    </asp:Label>
                    <span>:</span><span class="welcome" id="MaterialEnterDate"></span>


                    <label class="info-data"></label>
                    <asp:Label class="col-form-label" runat="server" ID="lblRequestTimeMonitor" ClientIDMode="Static">                    
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
<script type="text/javascript">


    function translateLables() {
        //    // In/ Out Text
        if ($("#hdnRequestType").val() == "0") {
            document.getElementById("lblDevicesEntryDateText").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,MtiralEntryDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblDevicesEntryDateText1").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,MtiralEntryDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblDevicesEntryDateText2").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,MtiralEntryDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("RequestReview").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,RequestReview%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("MtiralEntryDate").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,MtiralEntryDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblMaterialEntryTime").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,EntryTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblEntryGate").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,TitleGate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";

            document.getElementById("lblViewTodayMaterialRequests").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,ViewTodayMaterialRequests%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblRequestDateMonitor").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,MaterialEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblRequestTimeMonitor").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,EntryTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";

        } else {

            document.getElementById("lblDevicesEntryDateText").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,MtiralEntryDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblDevicesEntryDateText1").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,MtiralEntryDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblDevicesEntryDateText2").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,MtiralEntryDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("RequestReview").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,RequestReview%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("MtiralEntryDate").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,MtiralEntryDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblMaterialEntryTime").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,EntryTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblEntryGate").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,TitleGate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";

            document.getElementById("lblViewTodayMaterialRequests").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,ViewTodayMaterialRequests%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblRequestDateMonitor").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,MaterialEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblRequestTimeMonitor").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,EntryTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
        }
    }


    var search = false;
    var statusArray;
    $("#showSearch").click(function () {
        $("#SearchOptions").toggleClass("is-opend");
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


    var apiRootAddress = $("#hdnAPIRootURL").val();
    var listSiteUrl = $("#hdnWFWebUrl").val()
    var requestType = $("#hdnRequestType").val();
    var currentUserId = _spPageContextInfo.userId;
    function ResetSearch() {
        $("#txtRequestNumber").val("");
        $("#txtCreationDate").val("");
        $("#txtRequestDate").val("");
        $("#txtSupervisorName").val("");
        $("#txtMaterialName").val("");
        $("#ddlStatuses").val(0);
        $("#txtRequestDate").next().text(" ");
        $("#txtCreationDate").next().text(" ");
    }

    function searchRequest() {

        var requestNumber = $("#txtRequestNumber").val() !== "" ? $("#txtRequestNumber").val() : 0;


        var requestCreationDateConverted = "";
        if ($("#txtCreationDate").val() != "") {
            requestCreationDateConverted = HijriJS.toGregorian($("#txtCreationDate").val(), "/");

            var day = requestCreationDateConverted.getDate();
            var month = requestCreationDateConverted.getMonth() + 1;
            var year = requestCreationDateConverted.getFullYear();

            requestCreationDateConverted = month + "/" + day + "/" + year;
        }

        var requestCreationDate = requestCreationDateConverted;

        var requestDateConverted = "";
        if ($("#txtRequestDate").val() != "") {
            requestDateConverted = HijriJS.toGregorian($("#txtRequestDate").val(), "/");

            var day = requestDateConverted.getDate();
            var month = requestDateConverted.getMonth() + 1;
            var year = requestDateConverted.getFullYear();

            requestDateConverted = month + "/" + day + "/" + year;
        }
        var requestDate = requestDateConverted;


        var supervisorName = $("#txtSupervisorName").val();
        if ($("#txtMaterialName").val() != "") {
            search = true;
            $(".count").hide();
        }
        else {
            search = false;
            $(".count").show();
        }
        var matrialName = $("#txtMaterialName").val();
        var requestStatus = $("#ddlStatuses").val();

        var searchRequestsWithFilterationsAPI$ = apiRootAddress + "MaterialsRequest/SearchRequests?ListSiteUrl=" + listSiteUrl + "&UserID=" + currentUserId + "&RequestID=" + requestNumber + "&CreationDate=" + requestCreationDate + "&RequestDate=" + requestDate + "&ApplicantName=&SupervisorName=" + supervisorName.trim() + "&MaterialName=" + matrialName.trim() + "&DepartmentCode=&SectionCode=&RequestState=" + requestStatus + "&OnlyToday=false&RequestType=" + $("#hdnRequestType").val();

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

    $(function () {

        translateLables();

        getAllStatuses(
            apiRootAddress,
            function (data) {
                statusArray = data;
                $("#ddlStatuses").append("<option value='0'><sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></option>");
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

        var searchRequestsAPI$ = apiRootAddress + "MaterialsRequest/SearchRequests?ListSiteUrl=" + listSiteUrl + "&UserID=" + currentUserId + "&RequestID=0&CreationDate=&RequestDate=&ApplicantName=&SupervisorName=&MaterialName=&DepartmentCode=&SectionCode=&RequestState=0&OnlyToday=false&RequestType=" + $("#hdnRequestType").val();

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


    function renderSearchResult(data, search) {
        // search = false;
        $("#dataTable > tbody").empty();
        var datacount = 0;
        $(".PaggerDiv").show();
        if (data == null || data.length == 0) {
            $("#dataTable > tbody").append("<tr><td><sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,ThereIsNoData%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </td></tr>");

            $("#RowNumb").text("0");
            $(".PaggerDiv").hide();
            return;
        }
        // const groupBy = key => array =>
        //     array.reduce((objectsByKeyValue, obj) => {
        //         const value = obj[key];
        //         objectsByKeyValue[value] = (objectsByKeyValue[value] || []).concat(obj);
        //         return objectsByKeyValue;
        //     }, {});
        // const groupByID = groupBy('RequestID');

        // var groupedRequestsData = groupByID(data);
        groupedRequestsData = groupBy(data, 'RequestID');
        //groupedRequestsData = Object.assign({}, Object.values(groupedRequestsData).reverse());
        groupedRequestsData = Object.keys(groupedRequestsData).map(function (itm) { return groupedRequestsData[itm]; }).reverse();
        for (var arrayInside in groupedRequestsData) {
            var HTML = "";
            var innerDivs = "";
            var AcceptBol = "";
            var AcceptTxt = "";
            var Acceptsec = "";
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
                    innerDivs += "<div class='col-md-4'><div class='inner-card'><p class='title'><sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Type%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> :" + groupedRequestsData[arrayInside][i].MaterialName + '</p><span class="addStauts ' + (AcceptBol == "acc" ? "Accepted-req" : "rejected-req ") + ' ' + (Acceptsec == "Done" ? "show" : "hide") + ' "></span><p class="Quantity"> العدد  :' + groupedRequestsData[arrayInside][i].Quantity + '</p><p class="acceptTxt ' + (AcceptBol == "acc" ? "Accepted-status" : "rejected-status ") + '" >' + AcceptTxt + '</p></div></div>';
                }
            }
            for (var i = 0; i < groupedRequestsData[arrayInside].length; i++) {
                if (i === 0) {
                    var requestID = groupedRequestsData[arrayInside][i].RequestID;
                    var ApplicantName = groupedRequestsData[arrayInside][i].ApplicantName;
                    var SupervisorName = trimString(groupedRequestsData[arrayInside][i].SupervisorName, 30);
                    var RequestDate = GetHijriDate(groupedRequestsData[arrayInside][i].RequestDate);
                    var CreationDate = GetHijriDate(groupedRequestsData[arrayInside][i].CreationDate);
                    var supervisorStatus = groupedRequestsData[arrayInside][i].SupervisorStatus;
                    var securityStatus = groupedRequestsData[arrayInside][i].SecurityStatus;
                    var supervisorStatusText = securityStatus === "" ? " <sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,InProgress%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" : securityStatus === "1" ? " <sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Accepted%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" : "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Rejected%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                    var disableStatusText = supervisorStatus === "" ? " " : supervisorStatus === "1" ? " disable" : "disable";
                    var disableDelete = "";
                    if ((securityStatus == 1 || securityStatus == 2) && (supervisorStatus == 1 || supervisorStatus == 2)) {
                        disableDelete = "disable";
                    }
                    var supervisorStatusClass = supervisorStatus === "" ? "waiting" : supervisorStatus === "1" ? "accepted" : "rejected";


                    var statusText = "";
                    var showVisitorLine = "";
                    var statusArr = getStatusTextAndClass(supervisorStatus, securityStatus, statusArray);
                    statusText = statusArr[0];
                    supervisorStatusClass = statusArr[1];
                    if (supervisorStatusClass == "accepted") {
                        showVisitorLine = "show";
                    }
                    HTML += '<tr id="mainTable" >'
                        + '<td>' + requestID + '</td>'
                        + '<td>' + CreationDate + '</td>'
                        + '<td>' + RequestDate + '</td>'
                        + '<td>' + SupervisorName + '</td>';
                    if (!search) {
                        HTML += '<td>' + groupedRequestsData[arrayInside].length + '</td>';
                    }
                    HTML += '<td>  <span  class="' + supervisorStatusClass + '">' + statusText + ' </span> </td>'
                        + '<td class="viewoption">' + '<a title="<sharepoint:encodedliteral runat="server" text="<%$Resources:MaterialsRequests,ViewMaterial%>" EncodeMethod="EcmaScriptStringLiteralEncode"/>" class="options-list review" title="عرض الطلب" href="javascript:viewRequestItem(' + requestID + ')"></a><a title="<sharepoint:encodedliteral runat="server" text="<%$Resources:MaterialsRequests,EditMaterial%>" EncodeMethod="EcmaScriptStringLiteralEncode"/>"  class="options-list edit ' + disableStatusText + '" href="MaterialsEditRequest.aspx?rid=' + requestID + '"></a><a title="<sharepoint:encodedliteral runat="server" text="<%$Resources:MaterialsRequests,DeleteMaterial%>" EncodeMethod="EcmaScriptStringLiteralEncode"/>"  class="options-list delete ' + disableStatusText + '" href="javascript:openRejectRequestModel(' + requestID + ')"></a><span><a title="متابعة الطلب" class="options-list timeline ' + showVisitorLine + '" href="javascript:showTimeLine(' + requestID + ')"></a></span><span class="options-list showmore" role="button" data-toggle="collapse" href="#row' + requestID + '" aria-expanded="false" aria-controls="row' + requestID + '"></span></td>'
                        + '</tr >';
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
            hideLoader();
        });

    }


    function openRejectRequestModel(id) {
        $("#requestNumberReject").text(id);
        $("#rejectMsg").text("<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,AreYouSureYouWantToDeleteYourRequest%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
        $("#btnReject").show();
        $('#rejectModelCenter').modal({ backdrop: 'static', keyboard: false });
    }

    $("#btnReject").click(function (e) {
        e.preventDefault();
        showLoader();
        $("#btnReject").attr("disabled", true);
        var rid = $("#requestNumberReject").text();
        var deleteRequestAPI$ = apiRootAddress + 'MaterialsRequest/DeleteRequest?ListSiteUrl=' + listSiteUrl + '&ReqID=' + rid;
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


    // function deleteRequest(rid) {

    //     if (confirm("هل تريد حذف الطلب؟") == true) {
    //         var deleteRequestAPI$ = apiRootAddress + 'MaterialsRequest/DeleteRequest?ListSiteUrl=' + listSiteUrl + '&ReqID=' + rid;

    //         getDataByAPI(deleteRequestAPI$, function (result) {
    //             if (result.statusCode == 1) {
    //                 alert('تم حذف الطلب بنجاح');
    //             } else {
    //                 alert(result.statusMessage);
    //             }
    //         });
    //     }
    // }
    function getRequest(id, callback) {
        var visitReasonsDataAPI$ = apiRootAddress + "MaterialsRequest/GetRequestDetails?ListSiteUrl=" + listSiteUrl + "&RequestID=" + id;
        getDataByAPI(
            visitReasonsDataAPI$,
            function (data) {
                callback(data);
            }
        );
    }
    function viewRequestItem(rid) {
        getRequest(rid, function (data) {
            request = data;
            $("#VisitNumb").text(request.ID);
            $("#materialRequestMessageView").text(request.RequestMessage);
            $('#EntryDatePreview').text(GetHijriDate(request.RequestDate));
            $('#EntryTimePreview').text(request.ActionTime);
            $('#applicantNamePreview').text(request.ApplicantName);
            $('#applicantTitlePreview').text(request.ApplicantRank);
            $('#applicantSectionPreview').text(request.ApplicantSection);
            $('#applicantDepartmentPreview').text(request.ApplicantAdministration);
            $('#superVisorNamePreview').text(request.SupervisorName);
            $('#superVisorIdentityPreview').text(request.IdentityNumber);
            $('#superVisorWorkPreview').text(request.WorkingPlace);

            var MatrialsCount = request.RequestMaterials.length;
            $(".request-visitors-review").empty();
            var secBol = "";
            if (request.SecurityStatus == "1") {
                secBol = "Done";
            }
            request.RequestMaterials.forEach(function (matrial) {
                var secApprove = "";

                if (request.SecurityStatus == "1" && matrial.ItemIsApproved == "1") {
                    secApprove = "secApprove";
                }

                var elem = document.createElement("div");
                elem.classList.add("form-row", "reviewCol");
                var visitorRowBody = '';
                visitorRowBody += '<span class="addStauts ' + (secApprove == "secApprove" ? "Accepted-req" : "rejected-req ") + ' ' + (secBol == "Done" ? "show" : "hide") + ' "></span>';
                visitorRowBody += '<div class="form-group info-data  col-md-7">';
                visitorRowBody += "<label class='col-form-label'><sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Type%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>  </label>";
                visitorRowBody += '<p id="MaterialName" class="info-data"> ';
                visitorRowBody += matrial.MaterialName;
                visitorRowBody += '</p>';
                visitorRowBody += '</div>';

                visitorRowBody += '<div class="form-group info-data  col-md-6">';
                visitorRowBody += "<label class='col-form-label'>  <sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Number%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></label>";
                visitorRowBody += '<p id="matrialQuantity" class="info-data"> ';
                visitorRowBody += matrial.Quantity;
                visitorRowBody += '</p>';
                visitorRowBody += '</div>';

                if (matrial.Notes != "") {
                    visitorRowBody += '<div class="form-group info-data  col-md-6">';
                    visitorRowBody += "<label class='col-form-label'>  <sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,MatrialNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></label>";
                    visitorRowBody += '<p id="Notes" class="info-data"> ';
                    visitorRowBody += matrial.Notes;
                    visitorRowBody += '</p>';
                    visitorRowBody += '</div>';
                }

                visitorRowBody += '</div>';
                elem.innerHTML = visitorRowBody;
                $(".request-visitors-review").append(elem);
            });

            if (request.SecurityNote != null && request.SecurityNote != "") {
                $("#requestNoteDIV").show();
                $("#requestNoteTitle").html("<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,SecurityNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
                $("#requestNoteText").html(request.SecurityNote);

            } else if (request.SupervisiorNote != null && request.SupervisiorNote != "") {
                $("#requestNoteDIV").show();
                $("#requestNoteTitle").html("<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,DelegateNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
                $("#requestNoteText").html(request.SupervisiorNote);
            }
            else {
                $("#requestNoteDIV").hide();
            }


            $('#viewModel').modal({ backdrop: 'static', keyboard: false });
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
            timeLinerequest = data;
            $(".visitorTimeLine").empty();
            var RequestTypeStatus = "";
            var checkInArr = [];
            var noCheckInOut = "";
            var innercheckTime = "";
            $("#VisitNumbID").text(rid);
            if (timeLinerequest[0]) {
                var MterialEnter = GetHijriDate(timeLinerequest[0].RequestDate);
                $("#MaterialEnterDate").text(MterialEnter);
                $("#requestTimeMonitor").text(timeLinerequest[0].ActionTime);
                $("#timeLineGate").text(timeLinerequest[0].RequestGate);
                var M_EnterDate = timeLinerequest[0].RequestDate.split("T")[0].split("-");
                var M_status = compareTwoDates(new Date(M_EnterDate[1] + '/' + M_EnterDate[2] + '/' + M_EnterDate[0] + " 00:00"), new Date(getTodayInFormat() + " 00:00"))

                if (M_status == 0) {// Machine Enter Date lost
                    var elem = document.createElement("div");
                    elem.classList.add("col-md-auto", "reviewCol");
                    var visitorRowBody = '<div class="timeline-info loggedoutCard">';
                    visitorRowBody += ' <div class="loggeduser' + (status == "In" ? "  " : "hide ") + ' "></div>';
                    noCheckInOut = "الوقت المحدد لهذا الطلب يبدأ فى" + " : (" + GetHijriDate(timeLinerequest[0].RequestDate) + ")";
                    visitorRowBody += '<p class="info-data">' + noCheckInOut + '</p>';
                    visitorRowBody += '</div >';
                    elem.innerHTML = visitorRowBody;
                    $(".visitorTimeLine").append(elem);

                }
                else if (M_status == 1) {
                    for (var i = 0; i < timeLinerequest[0].RequestMaterials.length; i++) { // Request ended and there is no item in in/out array
                        if (timeLinerequest[0].RequestMaterials[i].MaterialActions.length == 0) {
                            var elem = document.createElement("div");
                            elem.classList.add("col-md-6", "reviewCol");
                            var visitorRowBody = '<div class="timeline-info loggedoutCard">';
                            visitorRowBody += ' <div class="loggeduser' + (status == "In" ? "  " : "hide ") + ' "></div>';
                            visitorRowBody += '<p class="info-data">  <sharepoint:encodedliteral runat="server" text="<%$Resources:MaterialsRequests,MName%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ' + timeLinerequest[0].RequestMaterials[i].MaterialName + '</p>';

                            visitorRowBody += '<p class="info-data"> <sharepoint:encodedliteral runat="server" text="<%$Resources:MaterialsRequests,Number%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ' + timeLinerequest[0].RequestMaterials[i].Quantity + '</p>';
                            noCheckInOut = requestType == "0" ? '<sharepoint:encodedliteral runat="server" text="<%$Resources:MaterialsRequests,MaterialsNotLoginInHisTime%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ' : '<sharepoint:encodedliteral runat="server" text="<%$Resources:MaterialsExitRequests,MaterialsNotLoginInHisTime%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ';

                            visitorRowBody += '<p class="info-data">' + noCheckInOut + '</p>';
                            visitorRowBody += '</div >';
                            elem.innerHTML = visitorRowBody;
                            $(".visitorTimeLine").append(elem);

                        }
                        if (timeLinerequest[0].RequestMaterials[i].MaterialActions.length > 0) {
                            var CheckIn = timeLinerequest[0].RequestMaterials[i].MaterialActions[0].ActionDate.split("T")[1];
                            var elem = document.createElement("div");
                            elem.classList.add("col-md-6", "reviewCol");
                            var visitorRowBody = '<div class="timeline-info loggedoutCard">';
                            visitorRowBody += ' <div class="loggeduser' + (status == "In" ? "  " : "hide ") + ' "></div>';
                            visitorRowBody += '<p class="info-data">  <sharepoint:encodedliteral runat="server" text="<%$Resources:MaterialsRequests,MName%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ' + timeLinerequest[0].RequestMaterials[i].MaterialName + '</p>';
                            visitorRowBody += '<p class="info-data"> <sharepoint:encodedliteral runat="server" text="<%$Resources:MaterialsRequests,Number%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ' + timeLinerequest[0].RequestMaterials[i].Quantity + '</p>';
                            visitorRowBody += '<p class="info-data">' + (requestType == "0" ? '<sharepoint:encodedliteral runat="server" text="<%$Resources:MaterialsRequests,EnteranceTime%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ' : '<sharepoint:encodedliteral runat="server" text="<%$Resources:MaterialsExitRequests,EnteranceTime%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ') + convertTime24to12(CheckIn) + '</p>';
                            visitorRowBody += '</div >';
                            elem.innerHTML = visitorRowBody;
                            $(".visitorTimeLine").append(elem);
                        }

                    }

                }

                else if (M_status == 2) {



                    for (var i = 0; i < timeLinerequest[0].RequestMaterials.length; i++) {
                        if (timeLinerequest[0].RequestMaterials[i].MaterialActions.length == 0) {
                            var elem = document.createElement("div");
                            elem.classList.add("col-md-6", "reviewCol");
                            var visitorRowBody = '<div class="timeline-info loggedoutCard">';
                            visitorRowBody += ' <div class="loggeduser' + (status == "In" ? "  " : "hide ") + ' "></div>';
                           <%-- visitorRowBody += '<p class="info-data">  <sharepoint:encodedliteral runat="server" text="<%$Resources:MaterialsRequests,MName%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ' + timeLinerequest[0].RequestMachines[i].DeviceType + '</p>';
                    
                            visitorRowBody += '<p class="info-data"> <sharepoint:encodedliteral runat="server" text="<%$Resources:MaterialsRequests,Number%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ' + timeLinerequest[0].RequestMachines[i].DeviceNumber + '</p>';--%>

                            visitorRowBody += '<p class="info-data">  <sharepoint:encodedliteral runat="server" text="<%$Resources:MaterialsRequests,MName%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ' + timeLinerequest[0].RequestMaterials[i].MaterialName + '</p>';
                            visitorRowBody += '<p class="info-data"> <sharepoint:encodedliteral runat="server" text="<%$Resources:MaterialsRequests,Number%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ' + timeLinerequest[0].RequestMaterials[i].Quantity + '</p>';


                            noCheckInOut = requestType == "0" ? "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,MaterialsLoginNotCompletedTillNow%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" : "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,MaterialsLoginNotCompletedTillNow%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";

                            visitorRowBody += '<p class="info-data">' + noCheckInOut + '</p>';
                            visitorRowBody += '</div >';
                            elem.innerHTML = visitorRowBody;
                            $(".visitorTimeLine").append(elem);
                        }
                        else if (timeLinerequest[0].RequestMaterials[i].MaterialActions.length > 0) {
                            var CheckIn = timeLinerequest[0].RequestMaterials[i].MaterialActions[0].ActionDate.split("T")[1];
                            var elem = document.createElement("div");
                            elem.classList.add("col-md-6", "reviewCol");
                            var visitorRowBody = '<div class="timeline-info loggedoutCard">';
                            visitorRowBody += ' <div class="loggeduser' + (status == "In" ? "  " : "hide ") + ' "></div>';
                            visitorRowBody += '<p class="info-data">  <sharepoint:encodedliteral runat="server" text="<%$Resources:MaterialsRequests,MName%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ' + timeLinerequest[0].RequestMaterials[i].MaterialName + '</p>';
                            visitorRowBody += '<p class="info-data"> <sharepoint:encodedliteral runat="server" text="<%$Resources:MaterialsRequests,Number%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ' + timeLinerequest[0].RequestMaterials[i].Quantity + '</p>';
                            //visitorRowBody += '<p class="info-data"> وقت الدخول: ' + convertTime24to12(CheckIn) + '</p>';

                            visitorRowBody += '<p class="info-data">' + (requestType == "0" ? '<sharepoint:encodedliteral runat="server" text="<%$Resources:MaterialsRequests,EnteranceTime%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ' : '<sharepoint:encodedliteral runat="server" text="<%$Resources:MaterialsExitRequests,EnteranceTime%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> : ') + convertTime24to12(CheckIn) + '</p>';

                            visitorRowBody += '</div >';
                            elem.innerHTML = visitorRowBody;
                            $(".visitorTimeLine").append(elem);
                        }

                    }



                    //    var timeStatus=compareBetweenTwoTimes(timeLinerequest[0].ActionTime);
                    //    if(timeStatus==1){// time incoming
                    //        var elem = document.createElement("div");
                    //            elem.classList.add("col-md-auto", "reviewCol");
                    //            var visitorRowBody = '<div class="timeline-info loggedoutCard">';
                    //            visitorRowBody += ' <div class="loggeduser' + (status == "In" ? "  " : "hide ") + ' "></div>';
                    //            noCheckInOut = "الوقت المحدد لهذا الطلب فى"+" : ("+timeLinerequest[0].ActionTime +")";
                    //            visitorRowBody += '<p class="info-data">' + noCheckInOut + '</p>';
                    //            visitorRowBody += '</div >';
                    //            elem.innerHTML = visitorRowBody;
                    //            $(".visitorTimeLine").append(elem);   
                    //    }
                    //    else if(timeStatus==0){ // time left

                    //}
                }
            }

            $("#timeLineModel").modal({ backdrop: 'static', keyboard: false });
            hideLoader();
        });
    }

    function getTimeLineRequest(id, callback) {
        var timeLineRequestsAPI$ = apiRootAddress + "MaterialsRequest/GetActions?ListSiteUrl=" + listSiteUrl + "&RequestID=" + id + "&ToDay=false&UserID=0&RequestCreateDate=null&Gate=&ApplicantName=&SupervisorName=&MaterialName=&DepartmentCode=&SectionCode=&RequestType=" + $("#hdnRequestType").val();

        getDataByAPI(
            timeLineRequestsAPI$,
            function (data) {
                callback(data);
            }
        );
    }

    $('.textPicker').on('input', function () {
        if ($(this).val() == "") {
            $(this).siblings(".daytext").text(" ");

        }
    });



</script>
