<%@ Assembly Name="MaterialsRequestsWFWebparts, Version=1.0.0.0, Culture=neutral, PublicKeyToken=8f2240e9e9a12cbf" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SecurityMaterialsRequestsWPUserControl.ascx.cs" Inherits="MaterialsRequestsWFWebparts.SecurityMaterialsRequestsWP.SecurityMaterialsRequestsWPUserControl" %>

<style>
    .hidden {
        display: none;
    }

    <style >
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

    .visitorRow {
        min-height: 135px !important;
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

                        <input type="text" class="form-control textPicker" id="txtCreationDate" name="text1" autocomplete="off" />
                        <label class="daytext"></label>
                        <!-- <div class="text-danger" id="errr" style="display: none;">يجب ادخال صيغة صحيحة</div> -->
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtRequestDate" class="col-form-label">

                            <asp:Label runat="server" ID="lblDevicesEntryDateText3" ClientIDMode="Static">
                            </asp:Label>
                        </label>
                        <input type="text" class="form-control textPicker" id="txtRequestDate" autocomplete="off" />
                        <label class="daytext"></label>
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtApplicantName" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,ApplicantName %>">
                            </asp:Literal>
                        </label>
                        <input type="text" id="txtApplicantName" class="form-control" />
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

                <div class="col-md-3">
                    <div class="form-group ">
                        <label for="ddlDepartments" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,Departments %>">
                            </asp:Literal>
                        </label>
                        <select id="ddlDepartments" class="form-control"></select>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group ">
                        <label for="ddlSections" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,Sections %>"></asp:Literal>
                        </label>
                        <select id="ddlSections" class="form-control"></select>
                    </div>
                </div>


                <div class="form-group col-md-12">
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
                            <th class="col-xs-2"><strong>
                                <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,ApplicantName %>">
                                </asp:Literal>
                            </strong></th>
                            <th class="col-xs-2"><strong>
                                <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,Department %>">
                                </asp:Literal>
                            </strong><span>/</span><strong>
                                <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,Section %>">
                                </asp:Literal>
                            </strong></th>
                            <th class="col-xs-2 count"><strong>
                                <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,MatrialsName %>">
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

                        </strong></th>
                        <th class="col-xs-2"><strong>
                            <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,SupervisorName %>">
                            </asp:Literal>
                        </strong></th>
                        <th class="col-xs-2"><strong>
                            <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,ApplicantName %>">
                            </asp:Literal>
                        </strong></th>
                        <th class="col-xs-2"><strong>
                            <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,Department %>">
                            </asp:Literal>
                        </strong><span>/</span><strong>
                            <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,Section %>">
                            </asp:Literal>
                        </strong></th>
                        <!-- <th class="col-xs-2"><strong> القسم</strong></th> -->
                        <th class="col-xs-2 count"><strong>
                            <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,MatrialsName %>">
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
                        <asp:Label runat="server" ID="lblReviewEnterMaterialText1" ClientIDMode="Static">
                        </asp:Label>

                    </p>
                    <p class="visitnumber">
                        <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,Rqam %>"></asp:Literal>
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

                                <p id="EntryDateView" class="info-data"></p>
                            </div>
                            <div class="form-group col-md-4">
                                <i class=" mdi mdi-av-timer "></i>
                                <label class="col-form-label">
                                    <asp:Label runat="server" ID="lblEntryView" ClientIDMode="Static">
                                    </asp:Label>
                                </label>

                                <p id="EntryTimeView" class="info-data"></p>
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
                    <div class="request-visitors-view">
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

                    <asp:Label runat="server" ID="lblAcceptedPopupTitleText1" ClientIDMode="Static">
                    </asp:Label>

                </p>
                <p class="visitnumber">
                    <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,Rqam %>"></asp:Literal>
                    : <span id="materialRequestIDPreview"></span>
                </p>

                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p class="request-msgtitle">
                    <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,RequestMsg %>"></asp:Literal>
                </p>
                <p class="request-msg" id="materialMessageTitlePreview"></p>

                <div class="visitinfo">
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <i class=" mdi mdi-calendar "></i>
                            <label class="col-form-label">

                                <asp:Label runat="server" ID="lblDevicesEntryDateText2" ClientIDMode="Static">
                                </asp:Label>
                            </label>
                            <p id="materialEntryDatePreview" class="info-data"></p>
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
                        <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,ApplicantNameData %>">
                        </asp:Literal>
                    </p>
                </div>
                <div class="emp-request">
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <span id="materialApplicantNamePreview" class="info-data"></span>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-form-label">
                                <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,Position %>">
                                </asp:Literal>
                            </label>
                            <p id="materialApplicantTitlePreview" class="info-data"></p>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-form-label">
                                <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,Section %>">
                                </asp:Literal>
                            </label>
                            <p id="materialApplicantSectionPreview" class="info-data"></p>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-form-label">
                                <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,Department %>">
                                </asp:Literal>
                            </label>
                            <p id="materialApplicantDepartmentPreview" class="info-data"></p>
                        </div>
                    </div>
                </div>
                <div class="heading-title">
                    <p>
                        <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,SupervisorInfo %>">
                        </asp:Literal>
                    </p>
                </div>
                <div class="emp-request">
                    <div class="form-row">

                        <div class="form-group col-md-4">
                            <label class="col-form-label">
                                <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,SupervisorName %>">
                                </asp:Literal>
                            </label>
                            <p id="materialsuperVisorNamePreview" class="info-data"></p>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-form-label">
                                <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,SupervisorID %>">
                                </asp:Literal>
                            </label>
                            <p id="materialsuperVisorIdentityPreview" class="info-data"></p>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-form-label">

                                <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,WorkingPlace %>">
                                </asp:Literal>
                            </label>
                            <p id="materialsuperVisorWorkPreview" class="info-data"></p>
                        </div>
                    </div>
                </div>
                <div class="heading-title">
                    <p>
                        <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,MatrialInfoTitle %>">
                        </asp:Literal>
                    </p>
                </div>

                <div class="request-visitors-review">
                </div>

                <div class="form-row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <p class="welcome">

                                <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,Gate %>"></asp:Literal>
                            </p>
                            <select id="ddlGates" required="required" class="form-control"></select>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-md-6">
                        <p class="welcome">

                            <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,MatrialNotes %>">
                            </asp:Literal>
                        </p>
                        <textarea id="txtNote" cols="50" rows="3" class="form-control"></textarea>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" id="btnSubmit" class="btn preview-btn send-btn"
                    data-toggle="modal" data-target="#exampleModalCenter">
                    <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,Accept %>"></asp:Literal>
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

                    <asp:Label runat="server" ID="lblRejectedPopupTitle" ClientIDMode="Static">
                    </asp:Label>
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

                <div class="visitinfo">
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <i class=" mdi mdi-calendar "></i>
                            <label class="col-form-label">
                                <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,RequestCreateDate %>">
                                </asp:Literal>
                            </label>
                            <p id="requestDateReject" class="info-data"></p>
                        </div>
                        <div class="form-group col-md-4">
                            <i class=" mdi mdi-calendar "></i>
                            <label class="col-form-label">
                                <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,MaterialEnterDate %>">
                                </asp:Literal>
                            </label>
                            <p id="visitDateReject" class="info-data"></p>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-form-label">
                                <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,ApplicantName %>">
                                </asp:Literal>
                            </label>
                            <p id="applicantNameReject" class="info-data"></p>
                        </div>
                    </div>
                </div>


                <div class="form-row">
                    <div class="col-md-7">
                        <p class="welcome">
                            <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,Comment %>"></asp:Literal>

                        </p>
                        <textarea id="txtRejectComment" class="form-control" cols="50" rows="5">

                        </textarea>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" id="btnReject" class="btn preview-btn send-btn" data-toggle="modal">

                    <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,Reject %>"></asp:Literal>
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
                    <asp:Label runat="server" ID="SendAddMaterialRequest" ClientIDMode="Static">
                        <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,TitlePupRehect %>">
                        </asp:Literal>
                    </asp:Label>
                </p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p id="MsgID">

                    <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,YourRequestSendSuccessfully %>">
                    </asp:Literal>
                </p>
            </div>

        </div>

    </div>
</div>

<script src="/modwf/style Library/branding/js/general/helpers.js"></script>
<script type="text/javascript">
    $("#txtCreationDate").after("");


    var apiRootAddress = $("#hdnAPIRootURL").val();
    var listSiteUrl = $("#hdnWFWebUrl").val()
    var requestType = $("#hdnRequestType").val();
    var departmentList;
    var sectionList;

    $(function () {
        $("span.text-danger").remove();
        getAllGates(
            apiRootAddress,
            function (data) {
                $("#ddlGates").append("<option value=''><sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Choose%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></option>");
                data.forEach(function (item) {
                    $("#ddlGates").append('<option value="' + item.ID + '">' + item.Title + '</option>');
                });
            }
        );
        if ($("#hdnRequestType").val() == "0") {
            document.getElementById("lblVisitStartDate2").innerHTML = document.getElementById("lblDevicesEntryDateText").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,MtiralEntryDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblDevicesEntryDateText1").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,MtiralEntryDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblDevicesEntryDateText2").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,MtiralEntryDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblDevicesEntryDateText3").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,MtiralEntryDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblRejectedPopupTitle").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,TitlePupRehect%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblAcceptedPopupTitleText1").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,TitlePupApproved%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblReviewEnterMaterialText1").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,RequestReview%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblMaterialEntryTime").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,EntryTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblEntryView").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,EntryTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";

        } else {
            document.getElementById("lblVisitStartDate2").innerHTML = document.getElementById("lblDevicesEntryDateText").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,MtiralEntryDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblDevicesEntryDateText1").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,MtiralEntryDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblDevicesEntryDateText2").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,MtiralEntryDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblDevicesEntryDateText3").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,MtiralEntryDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblRejectedPopupTitle").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,TitlePupRehect%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblAcceptedPopupTitleText1").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,TitlePupApproved%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblReviewEnterMaterialText1").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,RequestReview%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblMaterialEntryTime").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,EntryTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblEntryView").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,EntryTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
        }

        getAllDepartments(
            apiRootAddress,
            function (data) {
                departmentList = data;
                $("#ddlDepartments").append("<option value=''><sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></option>");
                data.forEach(function (item) {
                    $("#ddlDepartments").append('<option value="' + item.Code + '">' + item.Title + '</option>');
                });
            }
        );
        $("#ddlSections").append("<option value=''><sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></option>");

        getAllSections(
            apiRootAddress,
            function (data) {
                sectionList = data;
            }
        );

        getAllStatuses(
            apiRootAddress,
            function (data) {
                $("#ddlStatuses").append("<option value=''><sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></option>");
                data.forEach(function (item) {
                    $("#ddlStatuses").append('<option value="' + item.Code + '">' + item.Title + '</option>');
                });
            }
        );

        var searchRequestsAPI$ = apiRootAddress + "MaterialsRequest/SearchRequests?ListSiteUrl=" + listSiteUrl + "&UserID=0&RequestID=0&CreationDate=&RequestDate=&ApplicantName=&SupervisorName=&MaterialName=&DepartmentCode=&SectionCode=&RequestState=0&OnlyToday=true&RequestType=" + $("#hdnRequestType").val();

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


        $("#btnDoAction").click(function (e) {
            e.preventDefault();

            var isFormValid = true;
            for (var i = 0; i < $("[required]").length; i++) {
                $("[required]:eq(" + i + ")").next("span").remove();

                if ($("[required]:eq(" + i + ")").val().trim() === '') {
                    $("[required]:eq(" + i + ")").after("<span class='text-danger'>  <sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,YouMustEnterValueInThisField%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>  </span>");
                    isFormValid = false;
                }
            }
            if (!isFormValid) {
                return;
            }
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

    });

    $("#showSearch").click(function () {
        $("#SearchOptions").toggleClass("is-opend");
    });
    function openRejectRequestModel(obj) {
        $("#txtRejectComment").val("");
        $("#requestNumberReject").text(obj.id);
        $("#requestDateReject").text(obj.visitDate);
        $("#visitDateReject").text(obj.requestDate);
        $("#applicantNameReject").text(obj.applicantName);

        $('#rejectModelCenter').modal({ backdrop: 'static', keyboard: false });
    }

    $("#btnReject").click(function (e) {
        e.preventDefault();

        $("#btnReject").attr("disabled", true);
        $("#rejectModelCenter").css('z-index', 0)

        if ($("#txtRejectComment").val().trim() == "") {
            $("#txtRejectComment").next("span").remove();

            $("#txtRejectComment").after("<span class='text-danger'>  <sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,YouMustEnterValueInThisField%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>  </span>");
            hideLoader();
            $("#rejectModelCenter").css('z-index', 1050);
            $("#btnReject").attr("disabled", false);
            return;
        }
        else {
            $("#txtRejectComment").next("span").remove();
        }


        var postData = {
            "Group": $("#hdnDepartment").val(),
            "ReqID": $("#requestNumberReject").text(),
            "Status": "2",
            "StatusNote": $("#txtRejectComment").val(),
            "Gate": 0
        };
        showLoader();
        postInitialRequestApprove(JSON.stringify(postData), function (result) {
            if (result.statusCode == 1) {
                //alert("تم تنفيد العملية بنجاح");
                showSendMsg("  <sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,YourRequestSendSuccessfully%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> ");
                searchRequests();
                hideLoader();
                $("#btnReject").attr("disabled", false);
                $("#rejectModelCenter").css('z-index', 1050);
                $('#rejectModelCenter').modal('hide');
            }
            else {
                hideLoader();
                $("#rejectModelCenter").css('z-index', 1050);
                $("#btnReject").attr("disabled", false);
                alert(result.statusMessage);
            }
        });
        $("#rejectModelCenter").css('z-index', 1050);
    });

    function renderSearchResult(data, search) {
        //search = false;
        $("#dataTable > tbody").empty();
        var datacount = 0;
        $(".PaggerDiv").show();
        if (data == null || data.length == 0) {

            $("#dataTable > tbody").append("<tr><td>   <sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,ThereIsNoData%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </td></tr>");

            $("#RowNumb").text("0");
            $(".PaggerDiv").hide();
            return;
        }
        groupedRequestsData = groupBy(data, 'RequestID');
        groupedRequestsData = Object.keys(groupedRequestsData).map(function (itm) { return groupedRequestsData[itm]; }).reverse();

        for (var arrayInside in groupedRequestsData) {
            var HTML = "";
            var innerDivs = "";
            for (var i = 0; i < groupedRequestsData[arrayInside].length; i++) {
                if (i >= 0) {

                    innerDivs += "<div class='col-md-4'><div class='inner-card'><p class='title'> <sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,MaterialName%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>  : " + groupedRequestsData[arrayInside][i].MaterialName + '</p><p class="Quantity"> العدد : ' + groupedRequestsData[arrayInside][i].Quantity + '</p></div></div>';
                }
            }
            for (var i = 0; i < groupedRequestsData[arrayInside].length; i++) {
                if (i === 0) {
                    var requestID = groupedRequestsData[arrayInside][i].RequestID;
                    var ApplicantName = groupedRequestsData[arrayInside][i].ApplicantName;
                    var SupervisorName = trimString(groupedRequestsData[arrayInside][i].SupervisorName, 30);
                    var RequestDate = GetHijriDate(groupedRequestsData[arrayInside][i].RequestDate);
                    var CreationDate = GetHijriDate(groupedRequestsData[arrayInside][i].CreationDate) + ' <b>(' + convertTime24to12(groupedRequestsData[arrayInside][i].CreationDate.split("T")[1]) + ')</b>';
                    var supervisorStatus = groupedRequestsData[arrayInside][i].SupervisorStatus;
                    var securityStatus = groupedRequestsData[arrayInside][i].SecurityStatus;

                    var supervisorStatusText = securityStatus === "" ? "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,InProgress%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> " : securityStatus === "1" ? "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Accepted%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" : "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Rejected%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                        var disableStatusText = supervisorStatus === "" ? " " : supervisorStatus === "1" ? " disable" : "disable ";
                        var supervisorStatusClass = supervisorStatus === "" ? "waiting" : supervisorStatus === "1" ? "accepted" : "rejected";
                        var departmentName = getDepartmentName(groupedRequestsData[arrayInside][i].ApplicantAdministration, departmentList);
                        var sectionName = "";

                        var userSectionCode = groupedRequestsData[arrayInside][i].ApplicantSection;
                        var userDepartmentCode = groupedRequestsData[arrayInside][i].ApplicantAdministration;

                        if (userSectionCode != null && userDepartmentCode != null) {
                            sectionName = getSectionName(userSectionCode, userDepartmentCode, sectionList);
                        }

                        HTML += '<tr id="mainTable" >'
                            + '<td>' + requestID + '</td>'
                            + '<td>' + CreationDate + '</td>'
                            + '<td>' + RequestDate + '</td>'
                            + '<td>' + SupervisorName + '</td>'
                            + '<td>' + ApplicantName + '</td>'
                            + '<td><p>' + departmentName + '</p><p>' + sectionName + '</p></td>'
                        // + '<td>' + sectionName + '</td>';
                        var obj = {
                            id: requestID,
                            requestDate: RequestDate,
                            visitDate: CreationDate,
                            applicantName: ApplicantName
                        };
                        if (!search) {
                            HTML += '<td>' + groupedRequestsData[arrayInside].length + ' </td>';
                        }
                        // HTML += `<td class="viewoption"><a class="options-list review" href="javascript:viewRequestItem(` + requestID + `)"></a><a class="options-list accepted" href="javascript:viewRequestItemForAction(` + requestID + `)"></a><a class="options-list rejected" href="javascript:openRejectRequestModel(` + requestID + `,'` + CreationDate + `','` + RequestDate + `','` + ApplicantName + `')"></a><span class="options-list showmore" role="button" data-toggle="collapse" href="#row` + requestID + `" aria-expanded="false" aria-controls="row` + requestID + `"></span></td>`
                        HTML += "<td class='viewoption'><a title='<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,ViewMaterial%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>' class='options-list review' href='javascript:viewRequestItem(" + requestID + ")'></a><a title='<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,AcceptMaterial%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>' class='options-list accepted' href='javascript:viewRequestItemForAction(" + requestID + ")'></a><a title='<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,RejectMaterial%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>' class='options-list rejected' href='javascript:openRejectRequestModel(" + JSON.stringify(obj) + " )'></a><span class='options-list showmore' role='button' data-toggle='collapse' href='#row" + requestID + "' aria-expanded='false' aria-controls='row" + requestID + "'></span></td>"

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

        });
        hideLoader();
    }
    function showSendMsg(Msg) {
        $(".daytext").text("");
        $('#sendModel').modal({ backdrop: 'static', keyboard: false });

    }

    function openAcceptRequestModel(id, requestDate, visitDate, applicantName) {
        $("#hdnActionType").val("1");
        $("#ddlGates").val("");
        $(".text-danger").text("");
        $("#exampleModalLongTitleAction").html("<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Accept%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
        $("#btnActionText").text("<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,RequestSend%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
        $("#requestNumberAccept").text(id);
        $("#requestDateAccept").text(requestDate);
        $("#visitDateAccept").text(visitDate);
        $("#applicantNameAccept").text(applicantName);
        $("#txtAcceptComment").next("span.text-danger").remove();
        $("#txtAcceptComment").removeAttr("required");
        $("#txtAcceptComment").val('');
        $('#actionModelCenter').modal({ backdrop: 'static', keyboard: false });
    }

    function GetHijriDateWithSlashFormat(date) {
        var SplitedDate = (date.split("T")[0]).split("-");
        var s = HijriJS.gregorianToHijri(SplitedDate[0], SplitedDate[1], SplitedDate[2])
        return s.day + "/" + s.month + "/" + s.year
    }
    function viewRequestItemForAction(rid) {
        //event.preventDefault();
        //event.stopPropagation();
        $("#btnSubmit").attr("disabled", false);

        $("#ddlGates").val("");
        $(".text-danger").text("");
        // $("#btnSubmit").attr("disabled", true);
        getRequest(rid, function (data) {
            request = data;

            $("#materialRequestIDPreview").text(request.ID);
            $("#materialMessageTitlePreview").text(request.RequestMessage);
            $("#materialEntryDatePreview").text(GetHijriDate(request.RequestDate));
            $("#EntryTimePreview").text(request.ActionTime);
            $("#materialApplicantNamePreview").text(request.ApplicantName);
            $("#materialApplicantTitlePreview").text(request.ApplicantRank);
            $("#materialApplicantSectionPreview").text(request.ApplicantSection);
            $("#materialApplicantDepartmentPreview").text(request.ApplicantAdministration);
            $("#materialsuperVisorNamePreview").text(request.SupervisorName);
            $("#materialsuperVisorIdentityPreview").text(request.IdentityNumber);
            $("#materialsuperVisorWorkPreview").text(request.WorkingPlace);
            $("#txtNote").val("");

            var materialsCount = request.RequestMaterials.length;

            var materialCount = 0;

            $(".request-visitors-review").empty();
            var matreialIndex = -1;
            request.RequestMaterials.forEach(function (material) {
                matreialIndex++;
                var elem = document.createElement("div");
                elem.classList.add("visitorRow");
                elem.classList.add("reviewCol");
                elem.style.minHeight = "109px";

                var visitorRowBody = '';
                visitorRowBody += ' <p class="have-materials"> ';
                visitorRowBody += '<label class="labelRadiocontainer"><input type="radio" name="material' + matreialIndex + '" value="yes"/><span class="checkmark"></span></label>';
                if (materialsCount != 1)
                    visitorRowBody += '<label class="labelRadiocontainer"><input type="radio" name="material' + matreialIndex + '" value="No"/><span class="checkmark"></span>   </label>';
                visitorRowBody += '</p>';

                visitorRowBody += '<div class="form-row visitorRowData">';


                visitorRowBody += '<div class="form-group col-md-1 hidden">';
                visitorRowBody += '<input type="hidden" class="material-Id" value="' + material.ID + '" />';
                visitorRowBody += '</div>';

                visitorRowBody += '<div class="form-group info-data   col-md-6">';
                visitorRowBody += "<span > <sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,MName%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </span><span> : </span>";
                visitorRowBody += '<span class="material-Name">' + material.MaterialName + '</span>';
                visitorRowBody += '</div>';


                    <%--visitorRowBody += '<div class="form-group info-data  col-md-4">';
                    visitorRowBody += "<p class='dateTime-label'> <i class=' mdi mdi-av-timer '></i>  <sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,EnteranceTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>  : ";
                    visitorRowBody += '<span class="time material-actiontime">' + material.ActionTime + '</span>';
                    visitorRowBody += '</p> </div>';--%>


                visitorRowBody += '<div class="form-group info-data  col-md-6">';
                visitorRowBody += "<span > <sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Number%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </span><span> : </span>";

                visitorRowBody += '<span class="time material-quantity">' + material.Quantity + '</span>';
                visitorRowBody += ' </div>';

                if (material.Notes != "") {
                    visitorRowBody += '<div class="form-group info-data  col-md-6">';
                    visitorRowBody += "<span > <sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,MatrialNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </span><span> : </span>";

                    visitorRowBody += '<span class="time material-materialNotes">' + material.Notes + '</span>';
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
            $("#VisitNumb").text(request.ID);
            $("#materialRequestMessageView").text(request.RequestMessage);
            $('#EntryDateView').text(GetHijriDate(request.RequestDate));
            $("#EntryTimeView").text(request.ActionTime);
            $('#applicantNamePreview').text(request.ApplicantName);
            $('#applicantTitlePreview').text(request.ApplicantRank);
            $('#applicantSectionPreview').text(sectionName);
            $('#applicantDepartmentPreview').text(applicantDepartmentName);
            $('#superVisorNamePreview').text(request.SupervisorName);
            $('#superVisorIdentityPreview').text(request.IdentityNumber);
            $('#superVisorWorkPreview').text(request.WorkingPlace);

            var MatrialsCount = request.RequestMaterials.length;
            $(".request-visitors-view").empty();

            request.RequestMaterials.forEach(function (matrial) {
                var elem = document.createElement("div");
                elem.classList.add("form-row", "reviewCol");
                var visitorRowBody = '';

                visitorRowBody += '<div class="form-group info-data  col-md-8">';
                visitorRowBody += "<span > <sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,MName%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </span><span> : </span>";
                visitorRowBody += matrial.MaterialName;
                visitorRowBody += '</div>';

                   <%-- visitorRowBody += '<div class="form-group info-data col-md-4">';

                    visitorRowBody += "<p class='dateTime-label'> <i class=' mdi mdi-av-timer '></i>  <span> <sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,VisitTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>  </span><span> : </span>"
                    visitorRowBody += '<span class="time">' + matrial.ActionTime + '</span></p>';
                    visitorRowBody += '</div>';--%>

                visitorRowBody += '<div class="form-group info-data  col-md-6">';
                visitorRowBody += "<span > <sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Number%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </span><span> : </span>";
                visitorRowBody += matrial.Quantity;
                visitorRowBody += '</div>';

                if (matrial.Notes != "") {
                    visitorRowBody += '<div class="form-group info-data  col-md-6">';
                    visitorRowBody += "<span > <sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,MatrialNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </span><span> : </span>";
                    visitorRowBody += matrial.Notes;
                    visitorRowBody += '</div>';
                }


                visitorRowBody += '</div>';
                elem.innerHTML = visitorRowBody;
                $(".request-visitors-view").append(elem);
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

    function postInitialRequestApprove(requestData, callback) {
        var supervisorApproveAPI$ = apiRootAddress + 'MaterialsRequest/AprroveSecurity?ListSiteUrl=' + listSiteUrl;

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
        var url = apiRootAddress + "MaterialsRequest/AddFinalAproveForRequest?ListSiteUrl=" + listSiteUrl;
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

        if (confirm("<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,AreYouSureYouWantToDelete%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>") == true) {

            var postData = {
                "Group": $("#hdnDepartment").val(),
                "ReqID": rid,
                "Status": "2",
                "StatusNote": "note",
                "Gate": 0
            };
            showLoader();
            postInitialRequestApprove(JSON.stringify(postData), function (result) {
                if (result.statusCode == 1) {
                    alert("<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,ProcessCompltedSuccessfully%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> ");
                    searchRequests();
                }
                else {
                    alert(result.statusMessage);
                }
                hideLoader();
            });
        }
    }

    $(document).on("change", "[required]", function (e) {
        if ($(this).val().trim() !== '') {
            $(this).next("span").remove();
        }
        var allMatrials = $(".request-visitors-review .visitorRow").length;
        for (var i = 0; i < allMatrials; i++) {
            $(".visitorRow:eq(" + i + ")").find("span").closest(".text-danger").remove();
            $(".submitError").text("");
            $(".visitorRow:eq(" + i + ") .have-materials");
            if ($(".visitorRow:eq(" + i + ") .have-materials").find("input").closest("input[name='material" + i + "']:checked").length == 0) {
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


    $("#btnSubmit").click(function (e) {
        e.preventDefault();
        $("#btnSubmit").attr("disabled", true);
        showLoader();
        $("#myModal").css('z-index', 0)
        var allMatrials = $(".request-visitors-review .visitorRow").length;
        var isFormValid = true;
        for (var i = 0; i < allMatrials; i++) {
            $(".visitorRow:eq(" + i + ")").find("span").closest(".text-danger").remove();
            $(".visitorRow:eq(" + i + ") .have-materials");
            if ($(".visitorRow:eq(" + i + ") .have-materials").find("input").closest("input[name='material" + i + "']:checked").length == 0) {
                $(".visitorRow:eq(" + i + ") .have-materials").append("<span class='text-danger'>يجب تحديد الإجراء لهذا العنصر</span>");
                isFormValid = false;
            }
        }


        for (var i = 0; i < $("[required]").length; i++) {
            $("[required]:eq(" + i + ")").next("span").remove();

            if ($("[required]:eq(" + i + ")").val().trim() === '') {
                $("[required]:eq(" + i + ")").after("<span class='text-danger'><sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,YouMustEnterValueInThisField%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </span>");
                isFormValid = false;
            }
        }
        if (!isFormValid) {
            $(".submitError").text(" بيانات قبول الطلب غير مكتمة برجاء إكمال البياات المطلوبة");
            hideLoader();
            $("#myModal").css('z-index', 1050)
            $("#btnSubmit").attr("disabled", false);
            return;
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
            "ReqID": $("#materialRequestIDPreview").text(),
            "Status": "1",
            "StatusNote": matrialsNotesObject,
            "Gate": $("#ddlGates").val()
        };
        showLoader();
        postInitialRequestApprove(JSON.stringify(initialApprovePostData), function (data) {
            var requestObject =
            {
                ID: $("#materialRequestIDPreview").text(),
                RequestType: requestType,
                RequestMessage: $("#materialMessageTitlePreview").text(),
                RequestDate: $("#materialEntryDatePreview").text(),
                ActionTime: $("#EntryTimePreview").text(),
                SupervisorName: $("#materialsuperVisorNamePreview").text(),
                IdentityNumber: $("#materialsuperVisorIdentityPreview").text(),
                WorkingPlace: $("#materialsuperVisorWorkPreview").text(),
                ApplicantSection: $("#materialApplicantSectionPreview").text(),
                ApplicantRank: $("#materialApplicantTitlePreview").text(),
                ApplicantAdministration: $("#materialApplicantDepartmentPreview").text(),
                ApplicantName: $("#materialApplicantNamePreview").text(),
                ISDeleted: false,
                RequestMaterials: []
            };

            var materialsCount = $(".request-visitors-review .visitorRow").length;
            requestObject.RequestMaterials = [];
            for (var i = 0; i < materialsCount; i++) {
                var checkedMaterial = $(".visitorRow:eq(" + i + ") .have-materials").find("input").closest("input[type='radio']:checked");

                if (checkedMaterial && checkedMaterial.val() == "yes") {

                    material = {};
                    material.ID = $(".visitorRow:eq(" + i + ") .material-Id").val();
                    material.MaterialName = $(".visitorRow:eq(" + i + ") .material-Name").text();
                    material.ActionTime = $(".visitorRow:eq(" + i + ") .material-actiontime").text();
                    material.Quantity = $(".visitorRow:eq(" + i + ") .material-quantity").text();
                    material.Notes = $(".visitorRow:eq(" + i + ") .material-materialNotes").text();

                    material.IsDeleted = false;
                    requestObject.RequestMaterials.push(material);

                }
            }

            postFinalRequestForApprove(JSON.stringify(requestObject), function (result) {
                if (result.statusCode == 1) {
                    $('#myModal').modal('hide');
                    searchRequests();
                    hideLoader();
                    $("#myModal").css('z-index', 1050)
                    $("#btnSubmit").attr("disabled", false);
                    $(".reviewCol").click(function () {
                        $(this).toggleClass("opend");
                    });
                }
                else {
                    hideLoader();
                    $("#myModal").css('z-index', 1050);
                    $("#btnSubmit").attr("disabled", false);
                    alert(result.statusMessage);
                }

            });
        });

        $(".myModal").css('z-index', 1050)

    });

    function searchRequests() {

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
        var departmentCode = $("#ddlDepartments").val();
        var sectionCode = $("#ddlSections").val();
        var requestStatus = $("#ddlStatuses").val();
        if ($("#txtMaterialName").val() != "") {
            search = true;
            $(".count").hide();
        }
        else {
            search = false;
            $(".count").show();
        }
        var searchRequestsWithFilterationsAPI$ = apiRootAddress + "MaterialsRequest/SearchRequests?ListSiteUrl=" + listSiteUrl + "&UserID=0&RequestID=" + requestNumber + "&CreationDate=" + requestCreationDate + "&RequestDate=" + requestDate + "&ApplicantName=" + applicantName.trim() + "&SupervisorName=" + supervisorName.trim() + "&MaterialName=" + matrialName.trim() + "&DepartmentCode=" + departmentCode + "&SectionCode=" + sectionCode + "&RequestState=0&OnlyToday=true&RequestType=" + $("#hdnRequestType").val();
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



    $(document).on("change", "#txtCreationDate", function (e) {
        // $("#txtCreationDate").on("focusout", function(){
        $("#txtCreationDate").next("span.text-danger").remove();
        var dateReg = /^\d{2}([./-])\d{2}\1\d{4}$/
        if ($("#txtCreationDate").val().match(dateReg) == null) {
            $("#txtCreationDate").next("span.text-danger").remove();
            $("#txtCreationDate").after("<span class='text-danger'>يجب إدخال قيمة صحيحة للتاريخ</span>");

        }
        else {
            $("#txtCreationDate").next("span.text-danger").remove();
        }
        console.log("value", $(this).val());

    });



    $("#ddlDepartments").change(function () {
        if ($(this).val() != "") {
            getSectionsByDepartmentCode(
                apiRootAddress,
                $(this).val(),
                function (data) {
                    $("#ddlSections").empty();
                    $("#ddlSections").append("<option value=''><sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></option>");
                    data.forEach(function (item) {
                        $("#ddlSections").append('<option value="' + item.Code + '">' + item.Title + '</option>');
                    });
                }
            );

        } else {
            $("#ddlSections").empty();
            $("#ddlSections").append("<option value=''><sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></option>");
        }

    });

    $(document).on("change", ".request-visitors-review [type=radio]", function (event) {

        var allMatrials = $(".request-visitors-review .visitorRow").length;
        for (var i = 0; i < allMatrials; i++) {
            $(".visitorRow:eq(" + i + ")").find("span").closest(".text-danger").remove();
            $(".submitError").text("");
            $(".visitorRow:eq(" + i + ") .have-materials");
            if ($(".visitorRow:eq(" + i + ") .have-materials").find("input").closest("input[name='material" + i + "']:checked").length == 0) {
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
    function ResetSearch() {
        $("#txtRequestNumber").val("");
        $("#txtCreationDate").val("");
        $("#txtRequestDate").val("");
        $("#txtApplicantName").val("");
        $("#txtSupervisorName").val("");
        $("#txtMaterialName").val("");
        $("#ddlDepartments").val("");
        $("#ddlSections").val("");
        $("#txtRequestDate").next().text(" ");
        $("#txtCreationDate").next().text(" ");
    }

    $("#txtCreationDate").change(function () {

    });

//         function validatedate(inputText)
//   {
//   var dateformat = /^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/;
//   // Match the date format through regular expression
//   if(inputText.value.match(dateformat))
//   {
//   document.form1.text1.focus();
//   //Test which seperator is used '/' or '-'
//   var opera1 = inputText.value.split('/');
//   var opera2 = inputText.value.split('-');
//   lopera1 = opera1.length;
//   lopera2 = opera2.length;
//   // Extract the string into month, date and year
//   if (lopera1>1)
//   {
//   var pdate = inputText.value.split('/');
//   }
//   else if (lopera2>1)
//   {
//   var pdate = inputText.value.split('-');
//   }
//   var dd = parseInt(pdate[0]);
//   var mm  = parseInt(pdate[1]);
//   var yy = parseInt(pdate[2]);
//   // Create list of days of a month [assume there is no leap year by default]
//   var ListofDays = [31,28,31,30,31,30,31,31,30,31,30,31];
//   if (mm==1 || mm>2)
//   {
//   if (dd>ListofDays[mm-1])
//   {
//     document.getElementById('errr').style.display = 'block';
//      // $("#errr").style.display = 'block';
//     //$(this).append("<span class='text-danger'>يجب تحديد الإجراء لهذا العنصر</span>");
//  // alert('Invalid date format!');
//   return false;
//   }
//   }
//   if (mm==2)
//   {
//   var lyear = false;
//   if ( (!(yy % 4) && yy % 100) || !(yy % 400)) 
//   {
//   lyear = true;
//   }
//   if ((lyear==false) && (dd>=29))
//   {
//     document.getElementById('errr').style.display = 'block';

//    // $("#errr").style.display = 'block';
//     //$(this).append("<span class='text-danger'>يجب تحديد الإجراء لهذا العنصر</span>");

//   //alert('Invalid date format!');
//   return false;
//   }
//   if ((lyear==true) && (dd>29))
//   {
//       console.log(this);
//       document.getElementById('errr').style.display = 'block';

//      // $("#errr").style.display = 'block';
//     //$(this).append("<span class='text-danger'>يجب تحديد الإجراء لهذا العنصر</span>");

//   //alert('Invalid date format!');
//   return false;
//   }
//   }
//   }
//   else
//   {
//    // document.getElementById('errr').style.display = 'block';

//    // $("#errr").style.display = 'block';
//     //$(this).append("<span class='text-danger'>يجب تحديد الإجراء لهذا العنصر</span>");

//   //alert("Invalid date format!");
//   document.form1.text1.change();
//   return false;
//   }
//   }


</script>
