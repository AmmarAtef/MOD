<%@ Assembly Name="MaterialsRequestsWFWebparts, Version=1.0.0.0, Culture=neutral, PublicKeyToken=8f2240e9e9a12cbf" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SupervisorMaterialsRequestsWPUserControl.ascx.cs" Inherits="MaterialsRequestsWFWebparts.SupervisorMaterialsRequestsWP.SupervisorMaterialsRequestsWPUserControl" %>

<asp:HiddenField ID="hdnAPIRootURL" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hdnWFWebUrl" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hdnRequestType" runat="server" ClientIDMode="Static" />
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
                    Text="<%$Resources:MaterialsRequests,FilterData %>"></asp:Literal>
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
                            <asp:Literal runat="server"
                                Text="<%$Resources:MaterialsRequests,RequestNumber %>"></asp:Literal>
                        </label>
                        <input type="text" class="form-control" id="txtRequestNumber"
                            onkeypress="javascript:return isNumber(event)" />
                        <label class="numbval"></label>
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtCreationDate" class="col-form-label">
                            <asp:Literal runat="server"
                                Text="<%$Resources:MaterialsRequests,RequestCreateDate %>"></asp:Literal>
                        </label>
                        <input type="text" class="form-control textPicker" id="txtCreationDate" autocomplete="off" />
                        <label class="daytext"></label>
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtRequestDate" class="col-form-label">
                            <asp:Label runat="server" ID="lblDevicesEntryDateText2" ClientIDMode="Static">
                            </asp:Label>
                        </label>
                        <input type="text" class="form-control textPicker" id="txtRequestDate" autocomplete="off" />
                        <label class="daytext"></label>
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtApplicantName" class="col-form-label">
                            <asp:Literal runat="server"
                                Text="<%$Resources:MaterialsRequests,ApplicantName %>"></asp:Literal>
                        </label>
                        <input type="text" id="txtApplicantName" class="form-control" />
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtSupervisorName" class="col-form-label">
                            <asp:Literal runat="server"
                                Text="<%$Resources:MaterialsRequests,SupervisorName %>"></asp:Literal>
                        </label>
                        <input type="text" id="txtSupervisorName" class="form-control" />
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtMaterialName" class="col-form-label">
                            <asp:Literal runat="server"
                                Text="<%$Resources:MaterialsRequests,MaterialName %>"></asp:Literal>
                        </label>
                        <input type="text" id="txtMaterialName" class="form-control" />
                    </div>
                </div>


                <div class="form-group col-md-12">
                    <button id="btnSearch" class="btn preview-btn send-btn">
                        <asp:Literal runat="server"
                            Text="<%$Resources:MaterialsRequests,Search %>"></asp:Literal>
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
                            <asp:Literal runat="server"
                                Text="<%$Resources:MaterialsRequests,TotalAvaliableNumber %>"></asp:Literal>
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
                                <asp:Literal runat="server"
                                    Text="<%$Resources:MaterialsRequests,RequestNumber %>"></asp:Literal>
                            </strong></th>
                            <th class="col-xs-2"><strong>
                                <asp:Literal runat="server"
                                    Text="<%$Resources:MaterialsRequests,ApplicantName %>"></asp:Literal>
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
                                <asp:Literal runat="server"
                                    Text="<%$Resources:MaterialsRequests,SupervisorName %>"></asp:Literal>
                            </strong></th>
                            <th class="col-xs-2 count"><strong>
                                <asp:Literal runat="server"
                                    Text="<%$Resources:MaterialsRequests,MatrialsName %>"></asp:Literal>
                            </strong></th>

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
                            <asp:Literal runat="server"
                                Text="<%$Resources:MaterialsRequests,RequestNumber %>"></asp:Literal>
                        </strong></th>
                        <th class="col-xs-2"><strong>
                            <asp:Literal runat="server"
                                Text="<%$Resources:MaterialsRequests,ApplicantName %>"></asp:Literal>
                        </strong></th>
                        <th class="col-xs-2"><strong>
                            <asp:Literal runat="server"
                                Text="<%$Resources:MaterialsRequests,RequestCreateDate %>"></asp:Literal>
                        </strong></th>
                        <th class="col-xs-6"><strong>
                            <asp:Label runat="server" ID="lblDevicesEntryDateText1" ClientIDMode="Static">
                            </asp:Label>

                        </strong></th>
                        <th class="col-xs-2"><strong>
                            <asp:Literal runat="server"
                                Text="<%$Resources:MaterialsRequests,SupervisorName %>"></asp:Literal>
                        </strong></th>
                        <th class="col-xs-2 count"><strong>
                            <asp:Literal runat="server"
                                Text="<%$Resources:MaterialsRequests,MatrialsName %>"></asp:Literal>
                        </strong></th>


                        <th class="viewoption" style="text-align: right">
                            <asp:Literal runat="server"
                                Text="<%$Resources:MaterialsRequests,ReviewRequest %>"></asp:Literal>
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
                        <asp:Label runat="server" ID="lblRequestReview" ClientIDMode="Static"
                            Text=""></asp:Label>
                    </p>
                    <p class="visitnumber">
                        <asp:Literal runat="server"
                            Text="<%$Resources:MaterialsRequests,Rqam %>"></asp:Literal>
                        : <span id="VisitNumb"></span>
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
                                    <asp:Label runat="server" ID="lblMaterialEntryTime" ClientIDMode="Static">
                                    </asp:Label>
                                </label>

                                <p id="EntryTimePreview" class="info-data"></p>
                            </div>
                        </div>
                    </div>
                    <div class="heading-title">
                        <p>
                            <asp:Literal runat="server"
                                Text="<%$Resources:MaterialsRequests,ApplicantNameData %>"></asp:Literal>
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
                                        Text="<%$Resources:MaterialsRequests,Position %>"></asp:Literal>
                                </label>
                                <p id="applicantTitlePreview" class="info-data"></p>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="col-form-label">
                                    <asp:Literal runat="server"
                                        Text="<%$Resources:MaterialsRequests,Section %>"></asp:Literal>
                                </label>
                                <p id="applicantSectionPreview" class="info-data"></p>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="col-form-label">
                                    <asp:Literal runat="server"
                                        Text="<%$Resources:MaterialsRequests,Department %>"></asp:Literal>
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
                                    <asp:Literal runat="server"
                                        Text="<%$Resources:MaterialsRequests,SupervisorName %>"></asp:Literal>
                                </label>
                                <p id="superVisorNamePreview" class="info-data"></p>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="col-form-label">
                                    <asp:Literal runat="server"
                                        Text="<%$Resources:MaterialsRequests,SupervisorID %>"></asp:Literal>
                                </label>
                                <p id="superVisorIdentityPreview" class="info-data"></p>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="col-form-label">
                                    <asp:Literal runat="server"
                                        Text="<%$Resources:MaterialsRequests,WorkingPlace %>"></asp:Literal>
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
</div>
<div class="modal fade" id="actionModelCenter" tabindex="-1" role="dialog" aria-labelledby="actionModelCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered formLayout-model action-model" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <p class="modal-title" id="exampleModalLongTitleAction">

                    <asp:Literal runat="server"
                        Text="<%$Resources:MaterialsRequests,RequestAccepted %>"></asp:Literal>
                </p>
                <p class="visitnumber">
                    <asp:Literal runat="server"
                        Text="<%$Resources:MaterialsRequests,Rqam %>"></asp:Literal>
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
                                <asp:Literal runat="server"
                                    Text="<%$Resources:MaterialsRequests,RequestCreateDate %>"></asp:Literal>
                            </label>
                            <p id="requestDateAccept" class="info-data"></p>
                        </div>
                        <div class="form-group col-md-4">
                            <i class=" mdi mdi-calendar "></i>
                            <label class="col-form-label">
                                <asp:Label runat="server" ID="lblDevicesEntryDateText3" ClientIDMode="Static">
                                </asp:Label>

                            </label>
                            <p id="materialDataAccept" class="info-data"></p>
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
                                <asp:Literal runat="server"
                                    Text="<%$Resources:MaterialsRequests,SupervisorName %>"></asp:Literal>
                            </label>
                            <p id="superVisorNamePreview1" class="info-data"></p>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-form-label">
                                <asp:Literal runat="server"
                                    Text="<%$Resources:MaterialsRequests,SupervisorID %>"></asp:Literal>
                            </label>
                            <p id="superVisorIdentityPreview1" class="info-data"></p>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-form-label">
                                <asp:Literal runat="server"
                                    Text="<%$Resources:MaterialsRequests,WorkingPlace %>"></asp:Literal>
                            </label>
                            <p id="superVisorWorkPreview1" class="info-data"></p>
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

                <div class="form-row">
                    <div class="col-md-7">
                        <p class="welcome">
                            <asp:Literal runat="server"
                                Text="<%$Resources:MaterialsRequests,MatrialNotes %>"></asp:Literal>

                        </p>
                        <textarea id="txtAcceptComment" class="form-control" cols="50" rows="5">

                                        </textarea>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" id="btnDoAction" class="btn preview-btn send-btn" data-toggle="modal"
                    data-target="#acceptModelCenter">
                    <span id="btnActionText"></span>
                </button>

            </div>
        </div>
    </div>
</div>


<script src="/modwf/style Library/branding/js/general/helpers.js"></script>
<script type="text/javascript">
    var apiRootAddress = $("#hdnAPIRootURL").val();
    var listSiteUrl = $("#hdnWFWebUrl").val()
    var requestType = $("#hdnRequestType").val();
    var search = false;

    var departmentList;
    var sectionList;
    $(function () {
        getAllDepartments(
            apiRootAddress,
            function (data) {
                departmentList = data;
            }
        );

        getAllSections(
            apiRootAddress,
            function (data) {
                sectionList = data;
            }
        )
        getAllStatuses(
            apiRootAddress,
            function (data) {
                $("#ddlStatuses").append("<option value=''><sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></option>");
                data.forEach(function (item) {
                    $("#ddlStatuses").append('<option value="' + item.Code + '">' + item.Title + '</option>');
                });
            }
        );
        //    // In/ Out Text
        if ($("#hdnRequestType").val() == "0") {
            document.getElementById("lblVisitStartDate2").innerHTML = document.getElementById("lblDevicesEntryDateText").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,MtiralEntryDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblDevicesEntryDateText1").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,MtiralEntryDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblDevicesEntryDateText2").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,MtiralEntryDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblDevicesEntryDateText3").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,MtiralEntryDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblMaterialEntryTime").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,EntryTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblRequestReview").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,RequestReview%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";

        } else {

            document.getElementById("lblVisitStartDate2").innerHTML = document.getElementById("lblDevicesEntryDateText").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,MtiralEntryDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblDevicesEntryDateText1").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,MtiralEntryDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblDevicesEntryDateText2").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,MtiralEntryDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblDevicesEntryDateText3").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,MtiralEntryDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblMaterialEntryTime").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,EntryTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblRequestReview").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,RequestReview%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";

        }

        var searchRequestsAPI$ = apiRootAddress + "MaterialsRequest/SearchRequests?ListSiteUrl=" + listSiteUrl + "&UserID=0&RequestID=0&CreationDate=&RequestDate=&ApplicantName=&SupervisorName=&MaterialName=&DepartmentCode=&SectionCode=&RequestState=0&OnlyToday=true&Department=" + $("#hdnDepartment").val() + "&RequestType=" + $("#hdnRequestType").val();

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

    $("#btnDoAction").click(function (e) {
        e.preventDefault();
        
        $("#btnDoAction").attr("disabled", true);
        $("#actionModelCenter").css('z-index', 0)
        var isFormValid = true;
        for (var i = 0; i < $("[required]").length; i++) {
            $("[required]:eq(" + i + ")").next("span").remove();

            if ($("[required]:eq(" + i + ")").val().trim() === '') {
                $("[required]:eq(" + i + ")").after("<span class='text-danger'><sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,YouMustEnterValueInThisField%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </span>");
                isFormValid = false;
            }
        }
        if (!isFormValid) {
            $("#actionModelCenter").css('z-index', 1050);
            $("#btnDoAction").attr("disabled", false);
            return;
        }

        showLoader();
        var requestData = {
            "Group": "DEV",
            "ReqID": $("#requestNumberAccept").text(),
            "Status": $("#hdnActionType").val(),
            "StatusNote": $("#txtAcceptComment").val() == "" ? "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,ThereIsNoNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> " : $("#txtAcceptComment").val()
        };

        doRequestAction(JSON.stringify(requestData), function () {
            $('#actionModelCenter').modal('hide');
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


    $("#btnReject").click(function () {
        event.preventDefault();

        var requestData = {
            "Group": "DEV",
            "ReqID": 5,
            "Status": 2,
            "StatusNote": " <sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,MatrialNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>"
        };

        doRequestAction(JSON.stringify(requestData), function () {
            hideLoader();
            alert("Successfuly Done");
        });
    });

    function doRequestAction(requestData, callback) {
        var supervisorApproveAPI$ = apiRootAddress + 'MaterialsRequest/AprroveSupervisor?ListSiteUrl=' + listSiteUrl;

        $.ajax({
            url: supervisorApproveAPI$,
            type: 'POST',
            contentType: 'application/json',
            data: requestData,
            success: function (result) {
                if (result.statusCode == 1) {
                    searchRequest();
                    callback();
                    
                    $("#btnDoAction").attr("disabled", false);
                    $("#actionModelCenter").css('z-index', 1050);

                }
                else {
                    hideLoader();
                    $("#btnDoAction").attr("disabled", false);
                    $("#actionModelCenter").css('z-index', 1050);
                    alert(" <sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,SomeThingError%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> ");
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
        $("#actionModelCenter").css('z-index', 1050);
    }

    function renderSearchResult(data, search) {
        //search = false;
        $("#dataTable > tbody").empty();
        var datacount = 0;
        $(".PaggerDiv").show();
        if (data == null || data.length == 0) {
            $("#dataTable > tbody").append("<tr><td><sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,ThereIsNoData%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></td></tr>");
             
            $("#RowNumb").text("0");
            $(".PaggerDiv").hide();
            return;
        }
    
        groupedRequestsData = groupBy(data, 'RequestID');
        //groupedRequestsData = Object.assign({}, Object.values(groupedRequestsData).reverse());
        groupedRequestsData = Object.keys(groupedRequestsData).map(function (itm) { return groupedRequestsData[itm]; }).reverse();
        for (var arrayInside in groupedRequestsData) {
            var HTML = "";
            var innerDivs = "";
            for (var i = 0; i < groupedRequestsData[arrayInside].length; i++) {
                if (i >= 0) {
                    innerDivs += "<div class='col-md-4'><div class='inner-card'><p class='title'>  <sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Type%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>: " + groupedRequestsData[arrayInside][i].MaterialName + '</p><p class="Quantity"> العدد : ' + groupedRequestsData[arrayInside][i].Quantity + '</p></div></div>';
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
                    var supervisorStatusText = securityStatus === "" ? "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,InProgress%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> " : securityStatus === "1" ? "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Accepted%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> " : "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Rejected%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                    var disableStatusText = supervisorStatus === "" ? " " : supervisorStatus === "1" ? " disable" : "disable ";
                    var supervisorStatusClass = supervisorStatus === "" ? "waiting" : supervisorStatus === "1" ? "accepted" : "rejected";

                    var statusText = "";
                    if (supervisorStatus == "") {
                        statusText = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,InProgress%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> ";
                        supervisorStatusClass = "waiting";
                    } else if (supervisorStatus == "2") {
                        statusText = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Redirect%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> ";
                        supervisorStatusClass = "rejected";
                    }
                    else if (supervisorStatus == "1") {
                        if (securityStatus == "") {
                            statusText = " <sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,InProgress%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                            supervisorStatusClass = "waiting";
                        } else if (securityStatus == "1") {
                            statusText = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Accepted%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> ";
                            supervisorStatusClass = "accepted";
                        } else if (securityStatus == "2") {
                            statusText = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Rejected%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> ";
                            supervisorStatusClass = "rejected";
                        }
                    }

                    HTML += '<tr id="mainTable" >'
                        + '<td>' + requestID + '</td>'
                        + '<td>' + ApplicantName + '</td>'
                        + '<td>' + CreationDate + '</td>'
                        + '<td>' + RequestDate + '</td>'
                        + '<td>' + SupervisorName + '</td>'
                    if (!search) {
                        HTML += '<td>' + groupedRequestsData[arrayInside].length + ' </td>';
                    }

                    var obj = {
                        id: requestID,
                        requestDate: RequestDate,
                        visitDate: CreationDate,
                        applicantName: ApplicantName
                    };
                    //  HTML += `<td class="viewoption"><a class="options-list review" href="javascript:viewRequestItem(` + requestID + `)"></a><a class="options-list accepted" href="javascript:openAcceptRequestModel(` + requestID + `,'` + CreationDate + `','` + RequestDate + `','` + ApplicantName + `')"></a><a class="options-list rejected" href="javascript:openRejectRequestModel(` + requestID + `,'` + CreationDate + `','` + RequestDate + `','` + ApplicantName + `')"></a><span class="options-list showmore" role="button" data-toggle="collapse" href="#row` + requestID + `" aria-expanded="false" aria-controls="row` + requestID + `"></span></td>`
                    HTML +="<td class='viewoption'><a title='<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,ViewMaterial%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>' class='options-list review' href='javascript:viewRequestItem(" + requestID + ")'></a><a title='<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,AcceptMaterial%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>' class='options-list accepted' href='javascript:openAcceptRequestModel(" + JSON.stringify(obj) +")'></a><a title='<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,RejectMaterial%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>' class='options-list rejected' href='javascript:openRejectRequestModel(" + JSON.stringify(obj) + ")'></a><span class='options-list showmore' role='button' data-toggle='collapse' href='#row" + requestID + "' aria-expanded='false' aria-controls='row" + requestID + "'></span></td>"
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
    function openAcceptRequestModel(obj) {
        $("#btnDoAction").attr("disabled", false);
        $("#hdnActionType").val("1");
        if ($("#hdnRequestType").val() == "0")
            $("#exampleModalLongTitleAction").html('قبول طلب إدخال مواد');
        else
            $("#exampleModalLongTitleAction").html('قبول طلب خروج مواد');
        $("#btnActionText").text("<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,PassRequest%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
        $("#requestNumberAccept").text(obj.id);
        $("#requestDateAccept").text(obj.visitDate);
        $("#materialDataAccept").text(obj.requestDate);
        $("#applicantNameAccept").text(obj.applicantName);
        $("#txtAcceptComment").next("span.text-danger").remove();
        $("#txtAcceptComment").removeAttr("required");
        $("#txtAcceptComment").val('');
        getRequest(obj.id, function (data) {
            request = data;
            $('#superVisorNamePreview1').text(request.SupervisorName);
            $('#superVisorIdentityPreview1').text(request.IdentityNumber);
            $('#superVisorWorkPreview1').text(request.WorkingPlace);

            var MatrialsCount = request.RequestMaterials.length;
            $(".request-visitors-review").empty();

            request.RequestMaterials.forEach(function (matrial) {
                var elem = document.createElement("div");
                elem.classList.add("form-row", "reviewCol");
                var visitorRowBody = '';

                visitorRowBody += '<div class="form-group info-data  col-md-8">';
                visitorRowBody += "<label class='col-form-label'>  <sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Type%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </label>";
                visitorRowBody += '<p  class="info-data">'
                visitorRowBody += matrial.MaterialName;
                visitorRowBody += '</p>';
                visitorRowBody += '</div>';


                <%--visitorRowBody += '<div class="form-group info-data col-md-4">';
                if ($("#hdnRequestType").val() == "0") {
                    visitorRowBody += '<p class="dateTime-label"> <i class=" mdi mdi-av-timer "></i>  <span>' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,MtiralEntryDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</span><span> : </span> <span class="time">' + matrial.ActionTime + '</span></p>';
                }
                else {
                    visitorRowBody += '<p class="dateTime-label"> <i class=" mdi mdi-av-timer "></i>  <span>' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,MtiralEntryDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</span><span> : </span> <span class="time">' + matrial.ActionTime + '</span></p>';
                }
                visitorRowBody += '</div>';--%>

                visitorRowBody += '<div class="form-group info-data  col-md-6">';
                visitorRowBody += "<label class='col-form-label'> <sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Number%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>  </label>";
                visitorRowBody += '<p  class="info-data">'
                visitorRowBody += matrial.Quantity;
                visitorRowBody += '</p>';
                visitorRowBody += '</div>';

                if (matrial.Notes != "") {
                    visitorRowBody += '<div class="form-group info-data  col-md-6">';
                    visitorRowBody += "<label class='col-form-label'>  <sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,MatrialNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </label>";
                    visitorRowBody += '<p  class="info-data">'
                    visitorRowBody += matrial.Notes;
                    visitorRowBody += '</p>';
                    visitorRowBody += '</div>';
                }


                visitorRowBody += '</div>';
                elem.innerHTML = visitorRowBody;
                $(".request-visitors-review").append(elem);
            });



            $('#actionModelCenter').modal({ backdrop: 'static', keyboard: false });
            $(".reviewCol").click(function () {
                $(this).toggleClass("opend");
            });

            hideLoader();
        });

    }
    function openRejectRequestModel(obj) {
        $("#btnDoAction").attr("disabled", false);
        $("#hdnActionType").val("2");
        if ($("#hdnRequestType").val() == "0")
            $("#exampleModalLongTitleAction").html('رفض  طلب إدخال مواد');
        else
            $("#exampleModalLongTitleAction").html('رفض  طلب إخراج مواد');

        $("#btnActionText").text("<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Redirect%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
        $("#requestNumberAccept").text(obj.id);
        $("#requestDateAccept").text(obj.visitDate);
        $("#materialDataAccept").text(obj.requestDate);
        $("#applicantNameAccept").text(obj.applicantName);

        $("#txtAcceptComment").val('');
        $("#txtAcceptComment").next("span.text-danger").remove();
        $("#txtAcceptComment").attr("required", "required");
        getRequest(obj.id, function (data) {
            request = data;
            $('#superVisorNamePreview1').text(request.SupervisorName);
            $('#superVisorIdentityPreview1').text(request.IdentityNumber);
            $('#superVisorWorkPreview1').text(request.WorkingPlace);

            var MatrialsCount = request.RequestMaterials.length;
            $(".request-visitors-review").empty();

            request.RequestMaterials.forEach(function (matrial) {
                var elem = document.createElement("div");
                elem.classList.add("form-row", "reviewCol");
                var visitorRowBody = '';

                visitorRowBody += '<div class="form-group info-data  col-md-8">';
                visitorRowBody += "<label class='col-form-label'>  <sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Type%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </label>";
                visitorRowBody += '<p  class="info-data">'
                visitorRowBody += matrial.MaterialName;
                visitorRowBody += '</p>';
                visitorRowBody += '</div>';


                <%--visitorRowBody += '<div class="form-group info-data col-md-4">';
                if ($("#hdnRequestType").val() == "0") {
                    visitorRowBody += '<p class="dateTime-label"> <i class=" mdi mdi-av-timer "></i>  <span>' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,MtiralEntryDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</span><span> : </span> <span class="time">' + matrial.ActionTime + '</span></p>';
                }
                else {
                    visitorRowBody += '<p class="dateTime-label"> <i class=" mdi mdi-av-timer "></i>  <span>' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,MtiralEntryDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</span><span> : </span> <span class="time">' + matrial.ActionTime + '</span></p>';
                }
                visitorRowBody += '</div>';--%>

                visitorRowBody += '<div class="form-group info-data  col-md-6">';
                visitorRowBody += "<label class='col-form-label'> <sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Number%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>  </label>";
                visitorRowBody += '<p  class="info-data">'
                visitorRowBody += matrial.Quantity;
                visitorRowBody += '</p>';
                visitorRowBody += '</div>';

                if (matrial.Notes != "") {
                    visitorRowBody += '<div class="form-group info-data  col-md-6">';
                    visitorRowBody += "<label class='col-form-label'>  <sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,MatrialNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </label>";
                    visitorRowBody += '<p  class="info-data">'
                    visitorRowBody += matrial.Notes;
                    visitorRowBody += '</p>';
                    visitorRowBody += '</div>';
                }


                visitorRowBody += '</div>';
                elem.innerHTML = visitorRowBody;
                $(".request-visitors-review").append(elem);
            });



            $('#actionModelCenter').modal({ backdrop: 'static', keyboard: false });
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
            $("#VisitNumb").text(request.ID);
            $("#materialRequestMessageView").text(request.RequestMessage);
            $('#EntryDatePreview').text(GetHijriDate(request.RequestDate));
            $('#EntryTimePreview').text(request.ActionTime);
            $('#applicantNamePreview').text(request.ApplicantName);
            $('#applicantTitlePreview').text(request.ApplicantRank);
            $('#applicantSectionPreview').text(sectionName);
            $('#applicantDepartmentPreview').text(applicantDepartmentName);
            $('#superVisorNamePreview').text(request.SupervisorName);
            $('#superVisorIdentityPreview').text(request.IdentityNumber);
            $('#superVisorWorkPreview').text(request.WorkingPlace);

            var MatrialsCount = request.RequestMaterials.length;
            $(".request-visitors-review").empty();

            request.RequestMaterials.forEach(function (matrial) {
                var elem = document.createElement("div");
                elem.classList.add("form-row", "reviewCol");
                var visitorRowBody = '';

                visitorRowBody += '<div class="form-group info-data  col-md-8">';
                visitorRowBody += "<label class='col-form-label'>  <sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Type%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </label>";
                visitorRowBody += '<p  class="info-data">'
                visitorRowBody += matrial.MaterialName;
                visitorRowBody += '</p>';
                visitorRowBody += '</div>';


                <%--visitorRowBody += '<div class="form-group info-data col-md-4">';
                if ($("#hdnRequestType").val() == "0") {
                    visitorRowBody += '<p class="dateTime-label"> <i class=" mdi mdi-av-timer "></i>  <span>' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,MtiralEntryDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</span><span> : </span> <span class="time">' + matrial.ActionTime + '</span></p>';
                }
                else {
                    visitorRowBody += '<p class="dateTime-label"> <i class=" mdi mdi-av-timer "></i>  <span>' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,MtiralEntryDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</span><span> : </span> <span class="time">' + matrial.ActionTime + '</span></p>';
                }
                visitorRowBody += '</div>';--%>

                visitorRowBody += '<div class="form-group info-data  col-md-6">';
                visitorRowBody += "<label class='col-form-label'> <sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Number%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>  </label>";
                visitorRowBody += '<p  class="info-data">'
                visitorRowBody += matrial.Quantity;
                visitorRowBody += '</p>';
                visitorRowBody += '</div>';

                if (matrial.Notes != "") {
                    visitorRowBody += '<div class="form-group info-data  col-md-6">';
                    visitorRowBody += "<label class='col-form-label'>  <sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,MatrialNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </label>";
                    visitorRowBody += '<p  class="info-data">'
                    visitorRowBody += matrial.Notes;
                    visitorRowBody += '</p>';
                    visitorRowBody += '</div>';
                }


                visitorRowBody += '</div>';
                elem.innerHTML = visitorRowBody;
                $(".request-visitors-review").append(elem);
            });



            $('#viewModel').modal({ backdrop: 'static', keyboard: false });
            $(".reviewCol").click(function () {
                $(this).toggleClass("opend");
            });
            hideLoader();
        });
    }
    function getRequest(id, callback) {
        var visitReasonsDataAPI$ = apiRootAddress + "MaterialsRequest/GetRequestDetails?ListSiteUrl=" + listSiteUrl + "&RequestID=" + id;
        getDataByAPI(
            visitReasonsDataAPI$,
            function (data) {
                callback(data);
            }
        );
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
        var applicantName = $("#txtApplicantName").val();
        var supervisorName = $("#txtSupervisorName").val();
        var matrialName = $("#txtMaterialName").val();
        var requestStatus = $("#ddlStatuses").val();
        if ($("#txtMaterialName").val() != "") {
            search = true;
            $(".count").hide();
        }
        else {
            search = false;
            $(".count").show();
        }
        var searchRequestsWithFilterationsAPI$ = apiRootAddress + "MaterialsRequest/SearchRequests?ListSiteUrl=" + listSiteUrl + "&UserID=0&RequestID=" + requestNumber + "&CreationDate=" + requestCreationDate + "&RequestDate=" + requestDate + "&ApplicantName=" + applicantName.trim() + "&SupervisorName=" + supervisorName.trim() + "&MaterialName=" + matrialName.trim() + "&DepartmentCode=&SectionCode=&RequestState=0&OnlyToday=true&Department=" + $("#hdnDepartment").val() + "&RequestType=" + $("#hdnRequestType").val();
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
    

    $("#btnReset").click(function (e) {
        e.preventDefault();
        ResetSearch();
    });
    function ResetSearch() {
        $("#txtRequestNumber").val("");
        $("#txtCreationDate").val("");
        $("#txtRequestDate").val("");
        $("#txtApplicantName").val("");
        $("#txtSupervisorName").val("");
        $("#txtMaterialName").val("");
        $("#txtRequestDate").next().text(" ");
        $("#txtCreationDate").next().text(" ");
    }
</script>
