<%@ Assembly Name="VisitRequest, Version=1.0.0.0, Culture=neutral, PublicKeyToken=7d812edf42fd645f" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VisitProtectionActionsWPUserControl.ascx.cs" Inherits="VisitRequest.VisitProtectionActionsWP.VisitProtectionActionsWPUserControl" %>

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

    button#btnVisitorsView.active {
        background: #07a761;
    }

    button#btnRequestsView.active {
        background: #07a761;
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
                <asp:Literal runat="server" Text="<%$Resources:VisitRequest,FilterResults %>">
                </asp:Literal>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="container">


        <div id="SearchOptions" class="formLayout-container bb-none">
            <div class="row">
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtRequestDate" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequestDate %>">
                            </asp:Literal>
                        </label>

                        <input type="text" class="form-control textPicker" id="txtRequestDate" autocomplete="off" />
                        <label class="daytext"></label>
                    </div>
                </div>

                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtApplicantName" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitUserName %>">
                            </asp:Literal>
                        </label>
                        <input type="text" id="txtApplicantName" class="form-control" />
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtVisitorFirstName" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,FirstName %>">
                            </asp:Literal>
                        </label>
                        <input type="text" id="txtVisitorFirstName" class="form-control" />
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtVisitorFatherName" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,FatherName %>">
                            </asp:Literal>
                        </label>
                        <input type="text" id="txtVisitorFatherName" class="form-control" />
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtVisitorFamilyName" class="col-form-label">

                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,FamilyName %>">
                            </asp:Literal>
                        </label>
                        <input type="text" id="txtVisitorFamilyName" class="form-control" />
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtVisitorLastName" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,LastName %>">
                            </asp:Literal>
                        </label>
                        <input type="text" id="txtVisitorLastName" class="form-control" />
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="ddlNationalities" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,Nationality %>">
                            </asp:Literal>
                        </label>
                        <select id="ddlNationalities" class="form-control"></select>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group ">
                        <label for="ddlDepartments" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,Departments %>">
                            </asp:Literal>
                        </label>
                        <select id="ddlDepartments" class="form-control"></select>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group ">
                        <label for="ddlSections" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,Sections %>">
                            </asp:Literal>
                        </label>
                        <select id="ddlSections" class="form-control"></select>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group ">
                        <label for="txtIdentityNumber" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,IdentityNumber %>">
                            </asp:Literal>
                        </label>
                        <input type="text" id="txtIdentityNumber" class="form-control" onkeypress="javascript:return isNumber(event)" />
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="ddlGates" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,Gate %>">
                            </asp:Literal>
                        </label>
                        <select id="ddlGates" class="form-control"></select>
                    </div>
                </div>
                <div class="form-group col-md-12">
                    <button id="btnSearch" class="btn preview-btn send-btn">
                        <asp:Literal runat="server" Text="<%$Resources:VisitRequest,Search %>">
                        </asp:Literal>
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
                <div class="table-options hide">

                    <div class="totalnumb">
                        <span>
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,TotalNumberForAvalilableRequests %>">
                            </asp:Literal>
                        </span>
                        <span>:</span>
                        <span id="RowNumb" class="numb">0</span>
                    </div>
                    <div class="pageTools no-print printPreview-hide">

                        <ul class="pagOptions">

                            <li>
                                <button id="btnRefreshData" class="btn preview-btn send-btn" style="margin: 0;">
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

                                    تحديث البيانات

                                </button>
                            </li>

                            <li>
                                <button id="btnVisitorsView" class="btn preview-btn send-btn active" style="margin: 0;">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="-42 0 512 512.002" width="20px" height="20px" class="hovered-paths">
                                        <g>
                                            <path d="m210.351562 246.632812c33.882813 0 63.222657-12.152343 87.195313-36.128906 23.972656-23.972656 36.125-53.304687 36.125-87.191406 0-33.875-12.152344-63.210938-36.128906-87.191406-23.976563-23.96875-53.3125-36.121094-87.191407-36.121094-33.886718 0-63.21875 12.152344-87.191406 36.125s-36.128906 53.308594-36.128906 87.1875c0 33.886719 12.15625 63.222656 36.132812 87.195312 23.976563 23.96875 53.3125 36.125 87.1875 36.125zm0 0" data-original="#000000" class="active-path" data-old_color="#000000" fill="#FFFFFF" />
                                            <path d="m426.128906 393.703125c-.691406-9.976563-2.089844-20.859375-4.148437-32.351563-2.078125-11.578124-4.753907-22.523437-7.957031-32.527343-3.308594-10.339844-7.808594-20.550781-13.371094-30.335938-5.773438-10.15625-12.554688-19-20.164063-26.277343-7.957031-7.613282-17.699219-13.734376-28.964843-18.199219-11.226563-4.441407-23.667969-6.691407-36.976563-6.691407-5.226563 0-10.28125 2.144532-20.042969 8.5-6.007812 3.917969-13.035156 8.449219-20.878906 13.460938-6.707031 4.273438-15.792969 8.277344-27.015625 11.902344-10.949219 3.542968-22.066406 5.339844-33.039063 5.339844-10.972656 0-22.085937-1.796876-33.046874-5.339844-11.210938-3.621094-20.296876-7.625-26.996094-11.898438-7.769532-4.964844-14.800782-9.496094-20.898438-13.46875-9.75-6.355468-14.808594-8.5-20.035156-8.5-13.3125 0-25.75 2.253906-36.972656 6.699219-11.257813 4.457031-21.003906 10.578125-28.96875 18.199219-7.605469 7.28125-14.390625 16.121094-20.15625 26.273437-5.558594 9.785157-10.058594 19.992188-13.371094 30.339844-3.199219 10.003906-5.875 20.945313-7.953125 32.523437-2.058594 11.476563-3.457031 22.363282-4.148437 32.363282-.679688 9.796875-1.023438 19.964844-1.023438 30.234375 0 26.726562 8.496094 48.363281 25.25 64.320312 16.546875 15.746094 38.441406 23.734375 65.066406 23.734375h246.53125c26.625 0 48.511719-7.984375 65.0625-23.734375 16.757813-15.945312 25.253906-37.585937 25.253906-64.324219-.003906-10.316406-.351562-20.492187-1.035156-30.242187zm0 0" data-original="#000000" class="active-path" data-old_color="#000000" fill="#FFFFFF" />
                                        </g>
                                    </svg>
                                    عرض الزائرين


                                </button>
                            </li>

                            <li>
                                <button id="btnRequestsView" class="btn preview-btn send-btn" style="margin: 0;">
                                    <svg xmlns="http://www.w3.org/2000/svg" id="Layer_1" enable-background="new 0 0 512 512" height="20px" viewBox="0 0 512 512" width="20px" class="">
                                        <g>
                                            <g>
                                                <path d="m205.182 143.679h95.259c8.284 0 15-6.716 15-15s-6.716-15-15-15h-95.259c-8.284 0-15 6.716-15 15s6.715 15 15 15z" data-original="#000000" class="active-path" data-old_color="#000000" fill="#FFFFFF" />
                                                <path d="m366.03 0h-351.03c-8.284 0-15 6.716-15 15v482c0 8.284 6.716 15 15 15h351.03c8.284 0 15-6.716 15-15v-482c0-8.284-6.716-15-15-15zm-15 482h-321.03v-452h321.03z" data-original="#000000" class="active-path" data-old_color="#000000" fill="#FFFFFF" />
                                                <path d="m512 363.502v-312.591c0-28.072-22.839-50.911-50.911-50.911-28.073 0-50.912 22.839-50.912 50.911v312.59c0 7.826 5.996 14.245 13.643 14.931l-12.748 35.22c-1.34 3.703-1.171 7.784.472 11.362l35.912 78.242c2.445 5.328 7.771 8.743 13.633 8.743s11.188-3.415 13.633-8.743l35.911-78.242c1.643-3.579 1.812-7.66.472-11.362l-12.748-35.22c7.647-.686 13.643-7.104 13.643-14.93zm-71.823-15v-223.596h41.823v223.595h-41.823zm20.912-318.502c11.53 0 20.911 9.381 20.911 20.911v43.995h-41.823v-43.995c0-11.53 9.381-20.911 20.912-20.911zm0 431.041-19.716-42.956 14.327-39.584h10.777l14.328 39.584z" data-original="#000000" class="active-path" data-old_color="#000000" fill="#FFFFFF" />
                                                <path d="m90.701 157.197c2.813 2.813 6.628 4.394 10.606 4.394s7.794-1.581 10.606-4.393l45.563-45.563c5.858-5.858 5.858-15.355 0-21.213-5.857-5.858-15.355-5.858-21.213 0l-34.956 34.956-10.866-10.868c-5.856-5.858-15.354-5.858-21.213 0-5.858 5.858-5.858 15.355 0 21.213z" data-original="#000000" class="active-path" data-old_color="#000000" fill="#FFFFFF" />
                                                <path d="m205.182 234.684h95.259c8.284 0 15-6.716 15-15s-6.716-15-15-15h-95.259c-8.284 0-15 6.716-15 15s6.715 15 15 15z" data-original="#000000" class="active-path" data-old_color="#000000" fill="#FFFFFF" />
                                                <path d="m90.701 248.201c2.813 2.813 6.628 4.394 10.606 4.394s7.794-1.581 10.606-4.393l45.563-45.563c5.858-5.858 5.858-15.355 0-21.213-5.857-5.858-15.355-5.858-21.213 0l-34.956 34.956-10.866-10.866c-5.856-5.858-15.354-5.858-21.213 0-5.858 5.858-5.858 15.355 0 21.213z" data-original="#000000" class="active-path" data-old_color="#000000" fill="#FFFFFF" />
                                                <path d="m205.182 325.688h95.259c8.284 0 15-6.716 15-15s-6.716-15-15-15h-95.259c-8.284 0-15 6.716-15 15s6.715 15 15 15z" data-original="#000000" class="active-path" data-old_color="#000000" fill="#FFFFFF" />
                                                <path d="m205.182 420.178h95.259c8.284 0 15-6.716 15-15s-6.716-15-15-15h-95.259c-8.284 0-15 6.716-15 15s6.715 15 15 15z" data-original="#000000" class="active-path" data-old_color="#000000" fill="#FFFFFF" />
                                                <path d="m90.701 339.206c2.813 2.813 6.628 4.394 10.606 4.394s7.794-1.581 10.606-4.393l45.563-45.562c5.858-5.858 5.858-15.355 0-21.213-5.857-5.858-15.355-5.857-21.213 0l-34.956 34.956-10.866-10.868c-5.856-5.858-15.354-5.858-21.213 0s-5.858 15.355 0 21.213z" data-original="#000000" class="active-path" data-old_color="#000000" fill="#FFFFFF" />
                                            </g>
                                        </g>
                                    </svg>
                                    عرض الطلبات

                                </button>
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
                    </thead>
                    <tbody id="tablebody">
                    </tbody>
                </table>

            </div>
        </div>


        <div class="table-responsive formLayout-table">
            <table id="dataTable" class="table ">
                <thead>
                </thead>
                <tbody id="tablebody" class="not-printbody">
                </tbody>
            </table>
            <div class='PaggerDiv'></div>
        </div>

    </div>
</div>

<!-- for 1 visitor -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered formLayout-model formLayout-visitormodel" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <p class="modal-title" id="exampleModalLongTitle"><span id="visitorPopupTitle"></span></p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">


                <div class="visitinfo">
                    <div class="form-group ">
                        <input type="hidden" id="hdnActionType" />
                        <input type="hidden" id="hdnRequestIDForOneVisitor" />
                        <input type="hidden" id="hdnPersonIDForOneVisitor" />

                        <p id="visitorName" class="info-data"></p>
                    </div>
                    <div class="form-row">


                        <div class="form-group col-md-4">
                            <label class="col-form-label">
                                <asp:Literal runat="server" Text="<%$Resources:VisitRequest,Nationality %>">
                                </asp:Literal>
                            </label>
                            <span id="visitorNationality" class="info-data"></span>
                        </div>

                        <div class="form-group col-md-4">
                            <label class="col-form-label">
                                <asp:Literal runat="server" Text="<%$Resources:VisitRequest,IdentityNumber %>">
                                </asp:Literal>
                            </label>
                            <span id="visitorIdentityNumber" class="info-data"></span>
                        </div>
                    </div>
                </div>


                <div class="form-row">
                    <div class="table-responsive formLayout-table">
                        <table id="dataTabledevice" class="table ">
                            <thead>
                                <tr class="active">
                                    <th class="col-xs-2"><strong>
                                        <asp:Literal runat="server" Text="<%$Resources:VisitRequest,DeviceType %>">
                                        </asp:Literal>
                                    </strong></th>
                                    <th class="col-xs-2"><strong>
                                        <asp:Literal runat="server"
                                            Text="<%$Resources:VisitRequest,DeviceNumber %>">
                                        </asp:Literal>
                                    </strong></th>
                                    <th class="col-xs-2"><strong>
                                        <asp:Literal runat="server" Text="<%$Resources:VisitRequest,Note %>">
                                        </asp:Literal>
                                    </strong></th>
                                    <th class="col-xs-2"><strong>
                                        <asp:Literal runat="server" Text="<%$Resources:VisitRequest,Process %>">
                                        </asp:Literal>
                                    </strong></th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>



                <div class="visitinfo">
                    <div class="form-group ">
                        <p class="info-data">ملاحظات الأمن</p>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <span id="securityNotes"></span>
                        </div>
                    </div>
                </div>



            </div>

            <div class="modal-footer">
                <button type="button" id="btnSubmitVisitor" class="btn preview-btn send-btn" disabled="true"
                    data-toggle="modal" data-target="#exampleModalCenter">
                    <span
                        id="visitorPopupButtonText"></span>
                </button>
                <!-- <button type="button" class="btn preview-btn " data-dismiss="modal">إغلاق</button> -->
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

                <p id="status"></p>

            </div>

        </div>

    </div>

</div>
<script src="/modwf/style Library/branding/js/general/helpers.js"></script>
<script type="text/javascript">

    var requestsArrayData = [];
    var requestaction = "";
    var apiRootAddress = $("#hdnAPIRootURL").val();
    var listSiteURL = $("#hdnWFWebUrl").val();
    var currentUserId = _spPageContextInfo.userId;
    var departmentList;
    var sectionList;
    $(function () {

        var lookupsDataAPI$ = apiRootAddress + "VisitRequest/GetAllLookups?ListSiteUrl=" + listSiteURL;
        var nationalitiesData;
        var gatesData;
        getDataByAPI(
            lookupsDataAPI$,
            function (data) {
                nationalitiesData = data.NationalityList;
                gatesData = data.GatesList;
                $("#ddlNationalities").append('<option value="0">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>');
                nationalitiesData.forEach(function (item) {
                    $("#ddlNationalities").append('<option value="' + item.ID + '">' + item.Title + '</option>');
                });
            }
        );
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
        );
        getAllGates(
            apiRootAddress,
            function (data) {
                $("#ddlGates").append('<option value="">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>');
                data.forEach(function (item) {
                    $("#ddlGates").append('<option value="' + item.ID + '">' + item.Title + '</option>');
                });
            }
        );

        var departmentsLookupsAPI$ = apiRootAddress + "Lookups/GetDepartments";
        getDataByAPI(
            departmentsLookupsAPI$,
            function (data) {
                $("#ddlDepartments").append('<option value="">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>');
                data.forEach(function (item) {
                    $("#ddlDepartments").append('<option value="' + item.Code + '">' + item.Title + '</option>');
                });
            }
        );
        $("#ddlSections").append('<option value="">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>');

        getRequests();
        
    });

    $("#ddlDepartments").change(function () {
        getSectionsByDepartmentCode($(this).val());
    });

    function getSectionsByDepartmentCode(departmentCode) {
        var commonLookupsAPI$ = apiRootAddress + "Lookups/GetDepartmentSestions?departmentCode=" + departmentCode;

        if (departmentCode != "") {
            getDataByAPI(
                commonLookupsAPI$,
                function (data) {
                    $("#ddlSections").empty();
                    $("#ddlSections").append('<option value="">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>');
                    data.forEach(function (item) {
                        $("#ddlSections").append('<option value="' + item.Code + '">' + item.Title + '</option>');
                    });
                }
            );
        } else {
            $("#ddlSections").empty();
            $("#ddlSections").append('<option value="">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>');
        }
    }

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


    $(document).on("change", ".device-checkbox[type=checkbox]", function (event) {
        $('.person-checkbox[data-request="' + $(this).attr("data-request") + '"]').prop("checked", true);

        if ($('.person-checkbox:checked').length > 0) {
            $("#btnSumbitRequest").attr("disabled", false);
        } else {
            $("#btnSumbitRequest").attr("disabled", true);
        }

    });

    $(document).on("change", ".person-checkbox[type=checkbox]", function (event) {
        $('.device-checkbox[data-request="' + $(this).attr("data-request") + '"]').prop("checked", $(this).prop("checked"));

        if ($('.person-checkbox:checked').length > 0) {
            $("#btnSumbitRequest").attr("disabled", false);
        } else {
            $("#btnSumbitRequest").attr("disabled", true);
        }

    });

    function getRequests() {
        
        var searchRequestsAPI$ = apiRootAddress + "VisitRequest/GetCheckInCheckOut?ListSiteUrl=" + listSiteURL + "&RequestID=0&ToDay=true&UserID=0&Nationality=0&RequestCreateDate=null&RequestDate=null&Gate=&ApplicantName=&FirstName=&FatherName&FamilyName&LastName=&DepartmentCode=&SectionCode=&IdentityNumber=";

        getDataByAPI(searchRequestsAPI$, function (data, status, xhr) {
            if (xhr.getResponseHeader('StatusCode') == 1) {

                $(".table-options").removeClass("hide");

                hideGeneralErrorMessage();

                requestsArrayData = data;
                renderSearchResult(data);
                
            }
            else {
                //Show Error message
                showGeneralErrorMessage();
            }
        });
    }

    function ResetSearch() {
        showLoader();
        $("#txtRequestDate").val("");
        $("#txtApplicantName").val("");
        $("#txtVisitorFirstName").val("");
        $("#txtVisitorFatherName").val("");
        $("#txtVisitorFamilyName").val("");
        $("#txtVisitorLastName").val("");
        $("#txtIdentityNumber").val("");
        $("#ddlNationalities").val(0);
        $("#ddlDepartments").val("");
        $("#ddlSections").val("");
        $("#ddlGates").val("");
        $("#txtRequestDate").next().text(" ");
        hideLoader();
    }

    function searchRequest() {

        var requestRequestDateConverted = "";
        if ($("#txtRequestDate").val() != "") {
            requestRequestDateConverted = HijriJS.toGregorian($("#txtRequestDate").val(), "/");
            var day = requestRequestDateConverted.getDate();
            var month = requestRequestDateConverted.getMonth() + 1;
            var year = requestRequestDateConverted.getFullYear();

            requestRequestDateConverted = month + "/" + day + "/" + year;
        }

        var requestRequestDate = requestRequestDateConverted;
        var applicantName = $("#txtApplicantName").val();
        var visitorFirstName = $("#txtVisitorFirstName").val();
        var visitorFatherName = $("#txtVisitorFatherName").val();
        var visitorFamilyName = $("#txtVisitorFamilyName").val();
        var visitorLastName = $("#txtVisitorLastName").val();
        var nationality = $("#ddlNationalities").val() != "" ? $("#ddlNationalities").val() : 0;
        var departmentCode = $("#ddlDepartments").val();
        var sectionCode = $("#ddlSections").val();
        var identityNumber = $("#txtIdentityNumber").val();
        var gate = $("#ddlGates").val() != "" ? $("#ddlGates option:selected").text() : "";
        var identityNumber = $("#txtIdentityNumber").val();
        //var searchRequestsWithFilterationsAPI$ = apiRootAddress + "VisitRequest/GetCheckInCheckOut?ListSiteUrl=" + listSiteURL + "&RequestID=0&ToDay=false&UserID=0&Nationality=" + nationality + "&RequestCreateDate=" + requestRequestDate+ "&RequestDate=" + requestVisitDate + "&Gate=" + gate + "&ApplicantName=" + applicantName.trim() + "&IdentityNumber=" + identityNumber + "&FirstName=" + visitorFirstName.trim() + "&FatherName=" + visitorFatherName.trim() + "&FamilyName=" + visitorFamilyName.trim() + "&LastName=" + visitorLastName.trim() + "&DepartmentCode=" + departmentCode + "&SectionCode=" + sectionCode + "&DailyReport=true";

        var searchRequestsWithFilterationsAPI$ = apiRootAddress + "VisitRequest/GetCheckInCheckOut?ListSiteUrl=" + listSiteURL + "&RequestID=0&ToDay=true&UserID=0&Nationality=" + nationality + "&RequestCreateDate=" + requestRequestDate + "&RequestDate=null" + "&Gate=" + gate + "&ApplicantName=" + applicantName.trim() + "&IdentityNumber=" + identityNumber + "&FirstName=" + visitorFirstName.trim() + "&FatherName=" + visitorFatherName.trim() + "&FamilyName=" + visitorFamilyName.trim() + "&LastName=" + visitorLastName.trim() + "&DepartmentCode=" + departmentCode + "&SectionCode=" + sectionCode;
        console.log('getDataByAPI start', new Date());
        getDataByAPI(searchRequestsWithFilterationsAPI$, function (data, status, xhr) {
            if (xhr.getResponseHeader('StatusCode') == 1) {
                hideGeneralErrorMessage();
                requestsArrayData = actualData = data;
                renderSearchResult(data);
            }
            else {
                //Show Error message
                showGeneralErrorMessage();
            }
        });
    }

    $("#btnSubmitVisitor").click(function () {
        // The model that represents the post array object
        // debugger;
        $(".modal-footer #btnSubmitVisitor").attr("disabled", true);
        // $("#btnSubmitVisitor").attr("disabled", true);
        showLoader();

        var RequestPersonModel = [];
        var dvicees = [];
        var allRequest = [];

        var actionType = $("#hdnActionType").val();
        var requestID = $("#hdnRequestIDForOneVisitor").val();
        var personID = $("#hdnPersonIDForOneVisitor").val();

        allRequest = requestsArrayData;

        //make a record for the head person

        //get the selected request
        //var request = allRequest.filter(r => r.ID == requestID)[0];
        var request = allRequest.filter(function (r) { return r.ID == requestID })[0];

        var person = request.VisitPersons.filter(function (r) { return r.ID == personID })[0];

        if (dvicees.length != 0) {
            RequestPersonModel[RequestPersonModel.length - 1].VisitDevices = dvicees;
        } else {
            dvicees = [];
        }

        var checkObject;
        if (actionType == 'CHECKIN') {
            checkObject = {
                "ApprovedPersonID": person.ID,
                "CheckInNotes": "Person CheckIn Notes",
                "CheckOutNotes": "Person CheckOut Notes"
            };
        }
        else {
            checkObject = {
                "ApprovedPersonID": person.ID,
                "CheckInNotes": "Person CheckIn Notes",
                "CheckOutNotes": "Person CheckOut Notes"
            };
        }

        person.PersonCheckInOuts = [];
        person.PersonCheckInOuts.push(checkObject);
        RequestPersonModel.push(person);

        $(".device-checkbox[selected-attr=yes]:checked").each(function () {
            // The original data array
            allRequest = requestsArrayData;
            // get the checked checkbox value to if is request in addition to the RequestID, PersonID Request-PersonID-RequestID
            var array = $(this).val().split("-");

            var requestd = allRequest.filter(function (r) { return r.ID == requestID })[0];
            var deviceRequest = requestd.VisitPersons.filter(function (r) { return r.ID == personID })[0].VisitDevices;
            var device = deviceRequest.filter(function (r) { return r.ID == array[2] })[0];

            var checkObject;

            if (actionType == 'CHECKIN') {
                checkObject = {
                    "DeviceID": device.ID,
                    "DeviceCheckOutNote": "Device CheckOut Note",
                    "DeviceCheckInNote": "Device CheckIn Note"
                };
            } else {
                checkObject = {
                    "DeviceID": device.ID,
                    "DeviceCheckOutNote": "Device CheckOut Note",
                    "DeviceCheckInNote": "Device CheckIn Note"
                };
            }

            device.DeviceCheckInOut = [];
            device.DeviceCheckInOut.push(checkObject);
            dvicees.push(device);

        });

        if (dvicees.length != 0) {
            RequestPersonModel[RequestPersonModel.length - 1].VisitDevices = dvicees;
        } else {
            RequestPersonModel[RequestPersonModel.length - 1].VisitDevices = [];
        }

        var Ajaxurl;
        if (actionType == 'CHECKIN') {
            Ajaxurl = 'VisitRequest/AddCheckIn?ListSiteUrl=' + listSiteURL;
        } else {
            Ajaxurl = 'VisitRequest/AddCheckOut?ListSiteUrl=' + listSiteURL;
        }

        PostDataByAPI(Ajaxurl, JSON.stringify(RequestPersonModel), function (Result) {
            if (Result.statusCode == 1) {
                $('#myModal').modal('hide');
                searchRequest();
                //$('#sendModel').modal({ backdrop: 'static', keyboard: false });
                $("#btnSubmitVisitor").attr("disabled", false);
            }
            else {
                hideLoader();
                $("#btnSubmitVisitor").attr("disabled", false);
                alert(Result.statusMessage);
            }
        });
        setTimeout(function () { $('#sendModel').modal('hide'); }, 3000);
    });

    function PostDataByAPI(API, data, callback) {
        showLoader();
        var headers = {};
        var ajaxCall = $.ajax({
            type: 'POST',
            url: apiRootAddress + API,
            data: data,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            headers: headers,
            error: function (er) {
            },
            success: function (data, status, xhr) {
                callback(data, status, xhr);
            }
        });

        return ajaxCall;
    };

    function openVisitorPopup(event, personid, requestid) {
        event.preventDefault();
        event.stopPropagation();
        $("#dataTabledevice > tbody").html(null)
        var request = requestsArrayData.filter(function (r) { return r.ID == requestid })[0];

        var person = request.VisitPersons.filter(function (r) { return r.ID == personid })[0];
        var PersonName = person.FirstName + ' ' + person.FatherName + ' ' + person.FamilyName + ' ' + person.LastName;
        $("#hdnRequestIDForOneVisitor").val(requestid);
        $("#hdnPersonIDForOneVisitor").val(personid);
        $("#visitorName").html(PersonName);
        $("#visitorNationality").html(person.NationalityValue);
        $("#visitorIdentityNumber").html(person.IdentityNumber);

        if (request.SecurityNote.trim() != "") {
            $("#securityNotes").html(request.SecurityNote);
        }
        else {
            $("#securityNotes").html("لا توجد ملاحظات للأمن");
        }


        var device = [];

        // First case - the persons did not checked in before
        if (person.PersonCheckInOuts == null || person.PersonCheckInOuts.length == 0) {
            $("#hdnActionType").val("CHECKIN");
            for (var i = 0; i < person.VisitDevices.length; i++) {
                device.push(person.VisitDevices[i]);
            }
        }

        if (person.PersonCheckInOuts != null && person.PersonCheckInOuts.length != 0) {

            var personLastRecordCheckIn = person.PersonCheckInOuts[person.PersonCheckInOuts.length - 1].CheckIN;
            var personLastRecordCheckOut = person.PersonCheckInOuts[person.PersonCheckInOuts.length - 1].CheckOut;

            if (personLastRecordCheckIn != null && personLastRecordCheckOut != null) {
                $("#hdnActionType").val("CHECKIN");
                for (var i = 0; i < person.VisitDevices.length; i++) {

                    if (person.VisitDevices[i].DeviceCheckInOut == null || person.VisitDevices[i].DeviceCheckInOut.length == 0) {
                        device.push(person.VisitDevices[i]);
                    } else {

                        var lastDeviceRecordCheckIn = person.VisitDevices[i].DeviceCheckInOut[person.VisitDevices[i].DeviceCheckInOut.length - 1].DeviceCheckIn;
                        var lastDeviceRecordCheckOut = person.VisitDevices[i].DeviceCheckInOut[person.VisitDevices[i].DeviceCheckInOut.length - 1].DeviceCheckOut;

                        if (lastDeviceRecordCheckIn != null && lastDeviceRecordCheckOut != null) {
                            device.push(person.VisitDevices[i]);
                        }
                    }
                }
            }
            if (personLastRecordCheckIn != null && personLastRecordCheckOut == null) {
                $("#hdnActionType").val("CHECKOUT");
                if (person.VisitDevices != null && person.VisitDevices.length > 0) {
                    for (var i = 0; i < person.VisitDevices.length; i++) {
                        if (person.VisitDevices[i].DeviceCheckInOut != null && person.VisitDevices[i].DeviceCheckInOut.length > 0) {
                            var lastDeviceRecord = person.VisitDevices[i].DeviceCheckInOut.length - 1;
                            var lastDeviceRecordCheckIn = person.VisitDevices[i].DeviceCheckInOut[lastDeviceRecord].DeviceCheckIn;
                            var lastDeviceRecordCheckOut = person.VisitDevices[i].DeviceCheckInOut[lastDeviceRecord].DeviceCheckOut;

                            if (lastDeviceRecordCheckIn != null && lastDeviceRecordCheckOut == null) {
                                device.push(person.VisitDevices[i]);
                            }
                        }
                    }
                }
            }



        }




        if (device != null && device.length > 0) {
            var deviceIndex = -1;
            for (var i = 0; i < device.length; i++) {
                deviceIndex++;
                var HTMLdevice = '<tr class="hasDevices">'
                    + '<td>' + device[i].DeviceType + '</td>'
                    + '<td>' + device[i].DeviceNumber + '</td>'
                    + '<td>' + device[i].NotesAboutDevice + '</td>'
                    // + '<td><label class="labelcontainer"><input type="checkbox" checked="checked" id=' + device[i].ID + '   name = "chkDeviceForOneVisitor" value =' + requestid + '-' + personid + '-' + device[i].ID + '><span class="checkmark"></label></td>'
                    + '<td>'
                    + '<p class="have-materials">'
                    + '<label class="labelRadiocontainer"><input class="device-checkbox" type="radio" id=' + device[i].ID + '  name="device' + deviceIndex + '" value =' + requestid + '-' + personid + '-' + device[i].ID + '  selected-attr="yes" /><span class="checkmark"></span></label>'
                    + '<label class="labelRadiocontainer reject-radio"><input class="device-checkbox " type="radio" id=' + device[i].ID + '  name="device' + deviceIndex + '" value =' + requestid + '-' + personid + '-' + device[i].ID + '  selected-attr="No" /><span class="checkmark"></span>   </label>'
                    + '</p>'
                    + '</td>'

                    + '</tr>';

                $("#dataTabledevice > tbody").append(HTMLdevice);
                $(".modal-footer #btnSubmitVisitor").attr("disabled", true);
            }
        }
        else {
            $("#dataTabledevice > tbody").append("<tr><td colspan='4'><sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,ThereIsNoDevicesToT%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>  </td></tr>");
            $(".modal-footer #btnSubmitVisitor").attr("disabled", false);
        }

        if ($("#hdnActionType").val() === "CHECKIN") {
            $("#btnSubmitVisitor").css("background", "#0F7C4D");
            $("#visitorPopupButtonText").html("<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,EnterT%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
            $("#visitorPopupTitle").html("<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,VisitorEnterInProcess%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
            $("#status").text("<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,EnterDone%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
        } else {
            $("#btnSubmitVisitor").css("background","#717171");
            $("#visitorPopupButtonText").html("<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,ExitT%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
            $(".reject-radio").addClass("hide");
            $("#visitorPopupTitle").html("<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,VisitorExitInProcess%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
            $("#status").text("<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,ExitDone%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
        }

        $('#myModal').modal({ backdrop: 'static', keyboard: false });
    }

    function isNumber(evt) {
        var iKeyCode = (evt.which) ? evt.which : evt.keyCode
        if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57)) {
            return false;

        }

        return true;
    }
    var Hijrimonths = ["محرم", "صفر", "ربيع الأول", "ربيع الثاني", "جمادي الأول", "جمادي الثاني",
        " رجب", "شعبان", "رمضان", "شوال", "ذو القعدة", "ذو الحجة"];
    function GetHijriDate(date) {
        var SplitedDate = (date.split("T")[0]).split("-");
        var s = HijriJS.gregorianToHijri(SplitedDate[0], SplitedDate[1], SplitedDate[2]);
        var stringmonth = Hijrimonths[s.month - 1];
        return s.day + "-" + stringmonth + "-" + s.year
    }

    var displayView = 0;

    function setDataTableHead() {
        $("#dataTable > thead").empty();
        var headerRow;
        headerRow = "<tr  class='active'>";
        if (displayView == 0) {
            headerRow += "<th class='col-xs-2'> <strong><sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,RequesrtNumber%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></strong> </th>";
            headerRow += "<th class='col-xs-2'><strong><sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Gate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></strong> </th>";
            headerRow += "<th class='col-xs-2'><strong><sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,VisitUserDepartment%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </strong></th>";
            headerRow += "<th class='col-xs-2'><strong>إسم المشرف</strong></th>";
            headerRow += "<th class='col-xs-2'><strong>إسم مندوب الأمن</strong></th>";
            headerRow += "<th class='col-xs-2'><strong>الجنسية</strong></th>";
            headerRow += "<th class='col-xs-2'><strong>رقم الهوية</strong></th>";
            headerRow += "<th class='col-xs-2'><strong>إسم الزائر</strong></th>";
            headerRow += "<th class='col-xs-2'><strong>الإجراء</strong></th>";
        } else {
            headerRow += "<th class='col-xs-2'> <strong><sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,RequesrtNumber%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></strong> </th>";
            headerRow += "<th class='col-xs-2'><strong><sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Gate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></strong> </th>";
            headerRow += "<th class='col-xs-2'><strong><sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,VisitUserDepartment%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </strong></th>";
            headerRow += "<th class='col-xs-2'><strong><sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,VisitUserSection%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </strong></th>";
            headerRow += "<th class='col-xs-2'><strong><sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,RequestOwnerName%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </strong></th>";
            headerRow += "<th class='col-xs-2'><strong>إسم المشرف</strong></th>";
            headerRow += "<th class='col-xs-2'><strong>إسم مندوب الأمن</strong></th>";
            headerRow += "<th class='col-xs-2'><strong><sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,VisitorsCount%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </strong></th>";
        }
        headerRow += "<tr>";
        $("#dataTable > thead").append(headerRow);
    }
    function renderSearchResult(data) {
        
        setDataTableHead();
        $("#dataTable > tbody").empty();
        $(".PaggerDiv").show();
        var datacount = 0;
        if (requestsArrayData == null || requestsArrayData.length == 0) {

            $("#RowNumb").text(datacount);
            $(".PaggerDiv").hide();
            $("#dataTable > tbody").append("<tr><td> <sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,ThereIsNoData%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </td></tr>");
            return;
        }
        $(".PaggerDiv").show();

        requestsArrayData.sort(function (a, b) {
            return new Date('1970/01/01 ' + a.VisitTime) - new Date('1970/01/01 ' + b.VisitTime);
        });

        for (var x = 0; x < requestsArrayData.length; x++) {
            var HTML = "";
            var requestID = requestsArrayData[x].ID;

            var innerDivs = "";
            var remainingVisitorsCount = 0;
            var sectionName = "";
            var userSectionCode = requestsArrayData[x].ApplicantSection;
            var userDepartmentCode = requestsArrayData[x].ApplicantAdministration;
            var departmentName = getDepartmentName(requestsArrayData[x].ApplicantAdministration, departmentList);
            if (userSectionCode != null && userDepartmentCode != null) {
                sectionName = getSectionName(userSectionCode, userDepartmentCode, sectionList);
            }

            if (displayView == 0) {

                for (var i = 0; i < requestsArrayData[x].VisitPersons.length; i++) {

                    var status = "";

                    if ((requestsArrayData[x].VisitPersons[i].PersonCheckInOuts == null || requestsArrayData[x].VisitPersons[i].PersonCheckInOuts.length == 0) ||
                        (requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[0].CheckIN != null && requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[0].CheckOut == null)
                    ) {
                        HTML += '<tr class="mainTable" >'
                            + '<td>' + requestsArrayData[x].ID + '</td>'
                            + '<td>' + requestsArrayData[x].Gate + '</td>'
                            + '<td>' + departmentName + '</td>'
                            + '<td>' + requestsArrayData[x].ApprovedBySupervisorName + '</td>'
                            + '<td>' + requestsArrayData[x].ApprovedBySecurityName + '</td>'

                        if (requestsArrayData[x].VisitPersons[i].PersonCheckInOuts.length != 0) {


                            if (requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[requestsArrayData[x].VisitPersons[i].PersonCheckInOuts.length - 1].CheckIN != null &&
                                requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[requestsArrayData[x].VisitPersons[i].PersonCheckInOuts.length - 1].CheckOut == null) {
                                status = "In";
                                statusText = "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,EnterHasBeenDone%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                            }
                            else if (requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[requestsArrayData[x].VisitPersons[i].PersonCheckInOuts.length - 1].CheckOut != null) {
                                status = "Out";
                                statusText = "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,ExitHasBeenDone%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                            } else {
                                status = ""
                            }
                        }
                        var personFullName = requestsArrayData[x].VisitPersons[i].FirstName + " " + requestsArrayData[x].VisitPersons[i].FatherName + " " + requestsArrayData[x].VisitPersons[i].FamilyName + " " + requestsArrayData[x].VisitPersons[i].LastName;
                        HTML += '<td>' + requestsArrayData[x].VisitPersons[i].NationalityValue + '</td>';
                        HTML += '<td>' + requestsArrayData[x].VisitPersons[i].IdentityNumber + '</td>';
                        HTML += '<td>' + personFullName + '</td>';
                        HTML += '<td>' + '<button class="btn preview-btn send-btn btn-log" onclick="openVisitorPopup(event,' + requestsArrayData[x].VisitPersons[i].ID + ',' + requestID + ')"  style="background:' + (status == "In" ? "#717171":"")+'">' + (status == "In" ? "تسديد خروج" : "تسديد دخول") + '</button>' + '</td>';
                        HTML += '</tr>';
                        //innerDivs += '<div class="col-md-4"><div class="inner-card accept-request ' + (status == "In" ? " outcard" : "incard ") + '"> <div class="loggeduser ' + (status == "In" ? "  " : "hide ") + ' "></div> <p class="title">' + personFullName + '</p><span class="nationality"><i class="mdi mdi-flag-variant"></i> ' + requestsArrayData[x].VisitPersons[i].NationalityValue + '</span><span class="visitorid"><i class=" mdi mdi-account-card-details"></i>' + requestsArrayData[x].VisitPersons[i].IdentityNumber + '</span><button class="btn preview-btn send-btn btn-log" onclick="openVisitorPopup(event,' + requestsArrayData[x].VisitPersons[i].ID + ',' + requestID + ')" id="btnSubmitVisitor">' + (status == "In" ? "تسديد خروج" : "تسديد دخول") + '</button><p class="infoInOut">' + (status == "In" ? " تم تسديد الدخول" : "لم يتم تسديد الدخول ") + '</p> </div></div>';
                        datacount++;
                    }
                }

                $("#RowNumb").text(datacount);
                $("#dataTable > tbody").append(HTML);
            }
            else if (displayView == 1) {

                for (var i = 0; i < requestsArrayData[x].VisitPersons.length; i++) {

                    var status = "";

                    if ((requestsArrayData[x].VisitPersons[i].PersonCheckInOuts == null || requestsArrayData[x].VisitPersons[i].PersonCheckInOuts.length == 0) ||
                        (requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[0].CheckIN != null && requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[0].CheckOut == null)
                    ) {
                        remainingVisitorsCount++;
                        if (requestsArrayData[x].VisitPersons[i].PersonCheckInOuts.length != 0) {


                            if (requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[requestsArrayData[x].VisitPersons[i].PersonCheckInOuts.length - 1].CheckIN != null &&
                                requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[requestsArrayData[x].VisitPersons[i].PersonCheckInOuts.length - 1].CheckOut == null) {
                                status = "In";
                                statusText = "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,EnterHasBeenDone%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                            }
                            else if (requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[requestsArrayData[x].VisitPersons[i].PersonCheckInOuts.length - 1].CheckOut != null) {
                                status = "Out";
                                statusText = "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,ExitHasBeenDone%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                            } else {
                                status = ""
                            }
                        }
                        var personFullName = requestsArrayData[x].VisitPersons[i].FirstName + " " + requestsArrayData[x].VisitPersons[i].FatherName + " " + requestsArrayData[x].VisitPersons[i].FamilyName + " " + requestsArrayData[x].VisitPersons[i].LastName;
                        innerDivs += '<div class="col-md-4"><div class="inner-card accept-request ' + (status == "In" ? " outcard" : "incard ") + '"> <div class="loggeduser ' + (status == "In" ? "  " : "hide ") + ' "></div> <p class="title">' + personFullName + '</p><span class="nationality"><i class="mdi mdi-flag-variant"></i> ' + requestsArrayData[x].VisitPersons[i].NationalityValue + '</span><span class="visitorid"><i class=" mdi mdi-account-card-details"></i>' + requestsArrayData[x].VisitPersons[i].IdentityNumber + '</span><button class="btn preview-btn send-btn btn-log" onclick="openVisitorPopup(event,' + requestsArrayData[x].VisitPersons[i].ID + ',' + requestID + ')">' + (status == "In" ? "تسديد خروج" : "تسديد دخول") + '</button><p class="infoInOut">' + (status == "In" ? " تم تسديد الدخول" : "لم يتم تسديد الدخول ") + '</p> </div></div>';
                    }
                }

                if (remainingVisitorsCount > 0) {
                    HTML += '<tr class="mainTable" >'
                        + '<td>' + requestsArrayData[x].ID + '</td>'
                        + '<td>' + requestsArrayData[x].Gate + '</td>'
                        + '<td>' + departmentName + '</td>'
                        + '<td>' + sectionName + '</td>'
                        + '<td>' + requestsArrayData[x].UserName + '</td>'
                        + '<td>' + requestsArrayData[x].ApprovedBySupervisorName + '</td>'
                        + '<td>' + requestsArrayData[x].ApprovedBySecurityName + '</td>'
                        + '<td>' + requestsArrayData[x].VisitPersons.length + ' <span class="options-list showmore" role="button" data-toggle="collapse" href="#row' + requestID + '" aria-expanded="false" aria-controls="row' + requestID + '"></div> </td>'
                        + '</tr>';

                    for (var i = 0; i < requestsArrayData[x].VisitPersons.length; i++) {
                        if (i === 0) {
                            var status = "";
                            var statusText = "";

                            if (requestsArrayData[x].VisitPersons[i].PersonCheckInOuts.length != 0) {

                                if (requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[requestsArrayData[x].VisitPersons[i].PersonCheckInOuts.length - 1].CheckIN != null &&
                                    requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[requestsArrayData[x].VisitPersons[i].PersonCheckInOuts.length - 1].CheckOut == null) {
                                    status = "In";
                                    statusText = "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,EnterHasBeenDone%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                                }
                                else if (requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[requestsArrayData[x].VisitPersons[i].PersonCheckInOuts.length - 1].CheckOut != null) {
                                    status = "Out";
                                    statusText = "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,ExitHasBeenDone%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
                                } else {
                                    status = ""
                                }
                            }

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
                }

                $("#RowNumb").text(datacount);
                $("#dataTable > tbody").append(HTML);
            }
        }
        if ($("#dataTable > tbody tr").length > 0) {
            $(document).ready(function () {

                var AllData = $("#tablebody.not-printbody tr");
                var pagersize = 16;
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

            });
        }
        else {
            $("#dataTable > tbody").append("<tr><td> <sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,ThereIsNoData%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </td></tr>");
        }
        hideLoader();
    }



    $("#btnVisitorsView").click(function (e) {
        e.preventDefault();
        displayView = 0;
        $("#btnRequestsView").removeClass("active");
        $(this).addClass("active");
        renderSearchResult(null);
    });

    $("#btnRequestsView").click(function (e) {
        e.preventDefault();
        displayView = 1;
        $("#btnVisitorsView").removeClass("active");
        $(this).addClass("active");
        renderSearchResult(null);
    });

    $("#showSearch").click(function () {
        $("#SearchOptions").toggleClass("is-opend");
    });
    var isChecked = false;
    $(document).on("change", "#dataTabledevice [type=radio]", function (event) {
        var devicesLsit = $(this).closest("#dataTabledevice").find('.hasDevices');
        for (var i = 0; i < devicesLsit.length; i++) {
            if ($(devicesLsit[i]).find("input[type=radio]").is(':checked')) { isChecked = true }
            else { isChecked = false }
        }
        if (isChecked) {
            $(".modal-footer #btnSubmitVisitor").attr("disabled", false);
        }
        else {
            $(".modal-footer #btnSubmitVisitor").attr("disabled", true);
        }


    });
</script>
