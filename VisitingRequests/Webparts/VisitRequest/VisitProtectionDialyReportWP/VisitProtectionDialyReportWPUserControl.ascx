<%@ Assembly Name="VisitRequest, Version=1.0.0.0, Culture=neutral, PublicKeyToken=7d812edf42fd645f" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VisitProtectionDialyReportWPUserControl.ascx.cs" Inherits="VisitRequest.VisitProtectionDialyReportWP.VisitProtectionDialyReportWPUserControl" %>

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
        <div id="SearchOptions" class="formLayout-container bb-none is-opend">
            <div class="row">
                <%--  <div class="col-md-3">
                    <div class="form-group ">
                     <label for="txtRequestNumber" class="col-form-label">
                 <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequesrtNumber %>">
                </asp:Literal>
                </label>
                <input type="text" class="form-control" id="txtRequestNumber"
                    onkeypress="javascript:return isNumber(event)" />
                <label class="numbval"></label>
            </div>
        </div>--%>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtRequestDate" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequestDate %>">
                            </asp:Literal>
                        </label>

                        <input type="text" class="form-control textPicker" id="txtRequestDate" autocomplete="off" />
                        <label class="daytext" id="DayText"></label>
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtVisitDate" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,visitEnterDate %>">
                            </asp:Literal>
                        </label>
                        <input type="text" class="form-control textPicker" id="txtVisitDate" autocomplete="off" />
                        <label class="daytext"></label>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group ">
                        <label for="txtApplicantName" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitUserName %>">
                            </asp:Literal>
                        </label>
                        <input type="text" id="txtApplicantName" class="form-control" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group ">
                        <label for="txtVisitorFirstName" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,FirstName %>">
                            </asp:Literal>
                        </label>
                        <input type="text" id="txtVisitorFirstName" class="form-control" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group ">
                        <label for="txtVisitorFatherName" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,FatherName %>">
                            </asp:Literal>
                        </label>
                        <input type="text" id="txtVisitorFatherName" class="form-control" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group ">
                        <label for="txtVisitorFamilyName" class="col-form-label">

                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,FamilyName %>">
                            </asp:Literal>
                        </label>
                        <input type="text" id="txtVisitorFamilyName" class="form-control" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group ">
                        <label for="txtVisitorLastName" class="col-form-label">
                            <asp:Literal runat="server" Text="<%$Resources:VisitRequest,LastName %>">
                            </asp:Literal>
                        </label>
                        <input type="text" id="txtVisitorLastName" class="form-control" />
                    </div>
                </div>
                <div class="col-md-3">
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
                <div class="col-md-3">
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
                <div class="table-responsive formLayout-table  printedtable">
                    <div class="table-options">

                        <div class="totalnumb">
                            <span>العدد الاجمالي للسجلات المتوفرة </span>
                            <span>:</span>
                            <span id="RowNumb" class="numb">0</span>
                        </div>
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

                        <div class="clearfix"></div>
                    </div>
                    <table id="dataTable" class="table ">
                        <thead>
                            <tr class="active">
                                <th class="col-xs-2"><strong>رقم الطلب</strong></th>
                                <th class="col-xs-2"><strong>البوابة</strong></th>
                                <th class="col-xs-2"><strong>الادارة</strong></th>
                                <th class="col-xs-2"><strong>تاريخ الطلب</strong></th>
                                <th class="col-xs-2"><strong>اسم مقدم الطلب</strong></th>
                                <th class="col-xs-2"><strong>إسم المشرف </strong></th>
                                <th class="col-xs-2"><strong>إسم مندوب الأمن</strong></th>
                            </tr>
                        </thead>
                        <tbody id="tablebody">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="table-responsive formLayout-table">
            <table id="dataTable" class="table ">
                <thead>
                    <tr class="active">
                        <th class="col-xs-2"><strong>رقم الطلب</strong></th>
                        <th class="col-xs-2"><strong>البوابة</strong></th>
                        <th class="col-xs-2"><strong>الادارة</strong></th>
                        <th class="col-xs-2"><strong>تاريخ الطلب</strong></th>
                        <th class="col-xs-2"><strong>اسم مقدم الطلب</strong></th>
                        <th class="col-xs-2"><strong>إسم المشرف </strong></th>
                        <th class="col-xs-2"><strong>إسم مندوب الأمن</strong></th>
                    </tr>
                </thead>
                <tbody id="tablebody" class="not-printbody">
                </tbody>
            </table>
            <div class='PaggerDiv'></div>
        </div>

    </div>
</div>

<script src="/modwf/style Library/branding/js/general/helpers.js"></script>
<script type="text/javascript">
    var weekdays = ["الأحد", "الإثنين", "الثلاثاء", "الأربعاء", "الخميس", "الجمعة", "السبت"];
    function compareTwoDates(date, today) {

        if (date > today) return 0;
        else if (date < today) return 1;
        else return 2;

    }
    function formatDate(date) {
        var d = new Date(date),
            month = '' + (d.getMonth() + 1),
            day = '' + d.getDate(),
            year = d.getFullYear();

        if (month.length < 2)
            month = '0' + month;
        if (day.length < 2)
            day = '0' + day;

        return [year, month, day].join('-');
    }
    function adjusDate() {
        var today = new Date() + "";
        today = today.split(" ")[0] + " " + today.split(" ")[1] + " " + today.split(" ")[2] + " ," + today.split(" ")[3];
        return formatDate(today) + "T00:00:00.205Z";
    }
    function GetHijriDateInMonthIndex(date) {
        var SplitedDate = (date.split("T")[0]).split("-");
        var s = HijriJS.gregorianToHijri(SplitedDate[0], SplitedDate[1], SplitedDate[2])
        return s.day + "/" + s.month + "/" + s.year
    }
    function GetHijriDate(date) {
        var SplitedDate = (date.split("T")[0]).split("-");
        var s = HijriJS.gregorianToHijri(SplitedDate[0], SplitedDate[1], SplitedDate[2]);
        var stringmonth = Hijrimonths[s.month - 1];
        return s.day + "-" + stringmonth + "-" + s.year
    }
    $("#btnReset").click(function (e) {
        e.preventDefault();
        ResetSearch();
    });
    function ResetSearch() {
        showLoader();
        getAllSections(
            apiRootAddress,
            function (data) {
                sectionList = data;
            }
        );
        $("#ddlSections").empty();
        $("#ddlSections").append('<option value="">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>');

        $("#txtRequestDate").val("");
        $("#txtApplicantName").val("");
        $("#txtVisitorFirstName").val("");
        $("#txtVisitorFatherName").val("");
        $("#txtVisitorFamilyName").val("");
        $("#txtVisitorLastName").val("");
        $("#txtIdentityNumber").val("");
        $("#ddlNationalities").val(0);
        $("#ddlDepartments").val("");
        $("#ddlGates").val("");
        $("#txtRequestDate").next().text(" ");
        hideLoader();
        txtRequestDate
        $("#txtRequestDate").val("");
        $(".daytext").text(weekdays[new Date().getDay()]);
        $("#DayText").text("");
        $("#txtVisitDate").val(GetHijriDateInMonthIndex(adjusDate()));
    }

    $("#status").hide();
    var requestsArrayData = [];
    var requestaction = "";
    var departmentList;
    var apiRootAddress = $("#hdnAPIRootURL").val();
    var currentUserId = _spPageContextInfo.userId;
    var listSiteURL = $("#hdnWFWebUrl").val();
    $("#showSearch").click(function () {
        $("#SearchOptions").toggleClass("is-opend");
    });
    $(function () {

        $(".daytext").text(weekdays[new Date().getDay()]);
        $("#DayText").text("");
        $("#txtVisitDate").val(GetHijriDateInMonthIndex(adjusDate()));
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

    $("#btnSearch").click(function (e) {
        e.preventDefault();
        searchRequest();
    });

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
        var visitDateConverted = "";
        if ($("#txtVisitDate").val() != "") {
            visitDateConverted = HijriJS.toGregorian($("#txtVisitDate").val(), "/");
            var day = visitDateConverted.getDate();
            var month = visitDateConverted.getMonth() + 1;
            var year = visitDateConverted.getFullYear();

            visitDateConverted = month + "/" + day + "/" + year;
        }

        var requestVisitDate = visitDateConverted;

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
        var searchRequestsWithFilterationsAPI$ = apiRootAddress + "VisitRequest/GetCheckInCheckOut?ListSiteUrl=" + listSiteURL +
            "&RequestID=0&ToDay=false&UserID=0&Nationality=" +
            nationality + "&RequestCreateDate=" + requestRequestDate +
            "&RequestDate=" + requestVisitDate + "&Gate=" + gate + "&ApplicantName=" + applicantName.trim() + "&IdentityNumber=" + identityNumber + "&FirstName=" + visitorFirstName.trim() + "&FatherName=" + visitorFatherName.trim() + "&FamilyName=" + visitorFamilyName.trim() + "&LastName=" + visitorLastName.trim() + "&DepartmentCode=" + departmentCode + "&SectionCode=" + sectionCode + "&DailyReport=true";

        getDataByAPI(searchRequestsWithFilterationsAPI$, function (data, status, xhr) {
            if (xhr.getResponseHeader('StatusCode') == 1) {
                hideGeneralErrorMessage();
            actualData = data;
                renderSearchResult(data, requestVisitDate);
            }
            else {
                //Show Error message
                showGeneralErrorMessage();
            }

        });
    }

    $("#ddlDepartments").change(function () {
        getSectionsByDepartmentCode($(this).val());
    });
    function getVisitsByVisitDay(visitDate) {
        var V_EndDate = timeLinerequest[0].VisitEndDate.split("T")[0].split("-");
        var v_status = compareTwoDates(new Date(V_EndDate[1] + '/' + V_EndDate[2] + '/' + V_EndDate[0] + " 00:00"), new Date(getTodayInFormat() + " 00:00"))

    }

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

    function getRequests() {
        var requestCreationDateConverted = "";
        if ($("#txtRequestDate").val() != "") {
            requestCreationDateConverted = HijriJS.toGregorian($("#txtRequestDate").val(), "/");
            var day = requestCreationDateConverted.getDate();
            var month = requestCreationDateConverted.getMonth() + 1;
            var year = requestCreationDateConverted.getFullYear();

            requestCreationDateConverted = month + "/" + day + "/" + year;
        }

        var requestCreationDate = requestCreationDateConverted;

        var visitDateConverted = "";
        if ($("#txtVisitDate").val() != "") {
            visitDateConverted = HijriJS.toGregorian($("#txtVisitDate").val(), "/");
            var day = visitDateConverted.getDate();
            var month = visitDateConverted.getMonth() + 1;
            var year = visitDateConverted.getFullYear();

            visitDateConverted = month + "/" + day + "/" + year;
        }

        var requestVisitDate = visitDateConverted;

        var searchRequestsAPI$ = apiRootAddress + "VisitRequest/GetCheckInCheckOut?ListSiteUrl=" + listSiteURL + "&RequestID=0&ToDay=false&UserID=0&Nationality=0&RequestCreateDate=" + requestCreationDate + "&RequestDate=" + requestVisitDate + "&Gate=&ApplicantName=&FirstName=&FatherName&FamilyName&LastName=&DepartmentCode=&SectionCode=&IdentityNumber=&DailyReport=true";
        getDataByAPI(searchRequestsAPI$, function (data, status, xhr) {
            if (xhr.getResponseHeader('StatusCode') == 1) {
                hideGeneralErrorMessage();
                renderSearchResult(data, requestVisitDate);
                
            }
            else {
                //Show Error message
                showGeneralErrorMessage();
            }
        });
    }


    $("#btnSumbitRequest").click(function () {
        $("#status").show();
        // The model that represents the post array object
        var RequestPersonModel = [];
        var dvicees = [];
        var allRequest = [];
        
        $("input:checkbox[name=RowToCheck]:checked").each(function () {
            // The original data array
            allRequest = requestsArrayData;
            // get the checked checkbox value to if is request in addition to the RequestID, PersonID Request-PersonID-RequestID
            var array = $(this).val().split("-");

            //check if row object is person or device
            if (array[0] == "Person") {
                if (dvicees.length != 0) {
                    RequestPersonModel[RequestPersonModel.length - 1].VisitDevices = dvicees;
                } else {
                    dvicees = [];
                }

                //get the selected request
                var request = allRequest.filter(r => r.ID == array[2])[0];
                var person = request.VisitPersons.filter(r => r.ID == array[1])[0];

                var checkObject;
                if (requestaction == 'CHECKIN') {
                    checkObject = {
                        "ApprovedPersonID": person.ID,
                        "CheckInNotes": "Person CheckIn Notes"
                    };
                }
                else {
                    checkObject = {
                        "ApprovedPersonID": person.ID,
                        "CheckOutNotes": "Person CheckOut Notes"
                    };
                }

                person.PersonCheckInOuts = [];
                person.PersonCheckInOuts.push(checkObject);
                RequestPersonModel.push(person);

            } else if (array[0] == "Device") {
                var requestd = allRequest.filter(r => r.ID == array[3])[0];
                var deviceRequest = requestd.VisitPersons.filter(r => r.ID == array[2])[0].VisitDevices;
                var device = deviceRequest.filter(r => r.ID == array[1])[0];

                var checkObject;

                if (requestaction == 'CHECKIN') {
                    checkObject = {
                        "DeviceID": device.ID,
                        "DeviceCheckInNote": "Device CheckIn Note"
                    };
                } else {
                    checkObject = {
                        "DeviceID": device.ID,
                        "DeviceCheckOutNote": "Device CheckOut Note"
                    };
                }

                dvicees = [];
                device.DeviceCheckInOut = [];
                device.DeviceCheckInOut.push(checkObject);
                dvicees.push(device);




            }
        });

        if (dvicees.length != 0) {
            RequestPersonModel[RequestPersonModel.length - 1].VisitDevices = dvicees;
        } else {
            dvicees = [];
        }

        var Ajaxurl;
        if (requestaction == 'CHECKIN') {
            Ajaxurl = 'VisitRequest/AddCheckIn?ListSiteUrl=testCT'
        } else {
            Ajaxurl = 'VisitRequest/AddCheckOut?ListSiteUrl=testCT'
        }

        PostDataByAPI(Ajaxurl, JSON.stringify(RequestPersonModel), function (Result) {
            if (Result.statusCode == 1) {
                alert('تم تنفيذ العملية بنجاح');
                $('#myModalRequest').modal('hide');
                getRequests();
            }
            else {
                alert(Result.statusMessage);
            }

        });


        setTimeout(function () { $('#myModalRequest').modal('hide'); $("#status").hide(); }, 3000);


    });

    $("#btnSubmitVisitor").click(function () {
        $("#status").show();
        // The model that represents the post array object
        var RequestPersonModel = [];
        var dvicees = [];
        var allRequest = [];


        var actionType = $("#hdnActionType").val();
        var requestID = $("#hdnRequestIDForOneVisitor").val();
        var personID = $("#hdnPersonIDForOneVisitor").val();

        allRequest = requestsArrayData;

        //make a record for the head person

        //get the selected request
        var request = allRequest.filter(r => r.ID == requestID)[0];
        var person = request.VisitPersons.filter(r => r.ID == personID)[0];

        if (dvicees.length != 0) {
            RequestPersonModel[RequestPersonModel.length - 1].VisitDevices = dvicees;
        } else {
            dvicees = [];
        }

        var checkObject;
        if (actionType == 'CHECKIN') {
            checkObject = {
                "ApprovedPersonID": person.ID,
                "CheckInNotes": "Person CheckIn Notes"
            };
        }
        else {
            checkObject = {
                "ApprovedPersonID": person.ID,
                "CheckOutNotes": "Person CheckOut Notes"
            };
        }

        person.PersonCheckInOuts = [];
        person.PersonCheckInOuts.push(checkObject);
        RequestPersonModel.push(person);

        $("input:checkbox[name=chkDeviceForOneVisitor]:checked").each(function () {
            // The original data array
            allRequest = requestsArrayData;
            // get the checked checkbox value to if is request in addition to the RequestID, PersonID Request-PersonID-RequestID
            var array = $(this).val().split("-");

            var requestd = allRequest.filter(r => r.ID == requestID)[0];
            var deviceRequest = requestd.VisitPersons.filter(r => r.ID == personID)[0].VisitDevices;
            var device = deviceRequest.filter(r => r.ID == array[2])[0];

            var checkObject;

            if (actionType == 'CHECKIN') {
                checkObject = {
                    "DeviceID": device.ID,
                    "DeviceCheckInNote": "Device CheckIn Note"
                };
            } else {
                checkObject = {
                    "DeviceID": device.ID,
                    "DeviceCheckOutNote": "Device CheckOut Note"
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
            Ajaxurl = 'VisitRequest/AddCheckIn?ListSiteUrl=testCT'
        } else {
            Ajaxurl = 'VisitRequest/AddCheckOut?ListSiteUrl=testCT'
        }



        PostDataByAPI(Ajaxurl, JSON.stringify(RequestPersonModel), function (Result) {
            if (Result.statusCode == 1) {
                alert('تم تنفيذ العملية بنجاح');
                $('#myModal').modal('hide');
                getRequests();
            }
            else {
                alert(Result.statusMessage);
            }

        });
        setTimeout(function () { $('#myModal').modal('hide'); $("#status").hide(); }, 3000);
    });

    function PostDataByAPI(API, data, callback) {
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
    function renderSearchResult(data, visitDate) {
        $("#dataTable > tbody").empty();
        var datacount = 0;
        $(".PaggerDiv").show();
        if (data == null || data.length == 0) {
            $("#dataTable > tbody").append("<tr><td>لم يتم العثور علي بيانات</td></tr>");
             
            $("#RowNumb").text("0");
            $(".PaggerDiv").hide();
            return;
        }
        requestsArrayData = data;
        for (var x = 0; x < requestsArrayData.length; x++) {

            var HTML = "";
            var requestID = requestsArrayData[x].ID;

            var innerDivs = "";
            var checkinTime = '';
            var checkoutTime = '';
            var V_Date = "";
            if (visitDate) {
                V_Date = visitDate.split("/");
            }
            var visitorFullName;
            for (var i = 0; i < requestsArrayData[x].VisitPersons.length; i++) {
                if (i >= 0) {


                    visitorFullName = requestsArrayData[x].VisitPersons[i].FirstName + " " + requestsArrayData[x].VisitPersons[i].FatherName + " " + requestsArrayData[x].VisitPersons[i].FamilyName + " " + requestsArrayData[x].VisitPersons[i].LastName;

                    if (requestsArrayData[x].VisitPersons[i].PersonCheckInOuts != null && requestsArrayData[x].VisitPersons[i].PersonCheckInOuts.length == 0) {
                        innerDivs += '<div class="col-md-4"><div class="inner-card accept-request"><p class="title">' + visitorFullName + '</p><span class="nationality"><span class="nation-icon"></span> ' + requestsArrayData[x].VisitPersons[i].NationalityValue + '</span><span class="visitorid"><span class="id-icon"></span>' + requestsArrayData[x].VisitPersons[i].IdentityNumber + '</span><p>' + 'الزائر لم يدخل فى هذا اليوم' + '</div></div>';
                    }
                    else if (requestsArrayData[x].VisitPersons[i].PersonCheckInOuts != null && requestsArrayData[x].VisitPersons[i].PersonCheckInOuts.length >= 0) {
                        var actionDate = '';
                        var checkInTime = '';
                        var checkedInByName = '';
                        var checkOutTime = '';
                        var checkedOutByName = '';
                        var actionText = '';
                        for (var j = 0; j < requestsArrayData[x].VisitPersons[i].PersonCheckInOuts.length; j++) {


                            actionDate = requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[j].CheckIN.split("T")[0];
                            checkInTime = new Date(requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[j].CheckIN).getHours() + ": " + new Date(requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[j].CheckIN).getMinutes();
                            checkedInByName = requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[j].ActionDoneByName;
                            checkedOutByName = requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[j].ActionModifiedByName;
                            checkOutTime = requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[j].CheckOut != null ? convertTime24to12(new Date(requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[j].CheckOut).getHours() + ": " + new Date(requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[j].CheckOut).getMinutes()) + '<span style="color: #212529;font-weight: 600; margin: 0 4px;">بواسطة</span>' + checkedOutByName : "الزائر مازال بالداخل";

                            actionText = '<p style="color: #928f8f;">وقت الدخول: ' + convertTime24to12(checkInTime) + '<span style="color: #212529;font-weight: 600; margin: 0 4px;">بواسطة</span>' + checkedInByName + '</p>';
                            if (checkOutTime != null) {
                                actionText += '<p style="color: #928f8f;"> وقت الخروج: ' + checkOutTime + '</p>';
                            }

                            if (V_Date) {
                                var V_EndDate = requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[j].CheckIN.split("T")[0].split("-");
                                var v_status = compareTwoDates(new Date(V_Date[0] + '/' + V_Date[1] + '/' + V_Date[2] + " 00:00"), new Date(V_EndDate[1] + '/' + V_EndDate[2] + '/' + V_EndDate[0] + " 00:00"))
                                if (v_status == 2) {
                                    innerDivs += '<div class="col-md-4"><div class="inner-card accept-request"><p class="title">' + visitorFullName + '</p><span class="nationality"><span class="nation-icon"></span> ' + requestsArrayData[x].VisitPersons[i].NationalityValue + '</span><span class="visitorid"><span class="id-icon"></span>' + requestsArrayData[x].VisitPersons[i].IdentityNumber + '</span><p style="font-weight: bold;margin-top: 5px;">' + GetHijriDate(actionDate) + '<p/>' + actionText + '</div></div>';
                                }
                            }
                            else {
                                innerDivs += '<div class="col-md-4"><div class="inner-card accept-request"><p class="title">' + visitorFullName + '</p><span class="nationality"><span class="nation-icon"></span> ' + requestsArrayData[x].VisitPersons[i].NationalityValue + '</span><span class="visitorid"><span class="id-icon"></span>' + requestsArrayData[x].VisitPersons[i].IdentityNumber + '</span><p style="font-weight: bold;margin-top: 5px;">' + GetHijriDate(actionDate) + '<p/>' + actionText + '</div></div>';
                            }
                        }
                    }




                    var status = "";
                    var statusText = "";
                    var checkInArr = [];
                    var checkOutArr = [];
                    //for (var j = 0; j < requestsArrayData[x].VisitPersons[i].PersonCheckInOuts.length; j++) {
                    //    if (V_Date) {
                    //        var V_EndDate = requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[j].CheckIN.split("T")[0].split("-");
                    //        var v_status = compareTwoDates(new Date(V_Date[0] + '/' + V_Date[1] + '/' + V_Date[2] + " 00:00"), new Date(V_EndDate[1] + '/' + V_EndDate[2] + '/' + V_EndDate[0] + " 00:00"))
                    //        if (v_status == 2) {
                    //            checkInArr.push(requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[j].CheckIN);
                    //            checkOutArr.push(requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[j].CheckOut)
                    //        }
                    //    }

                    //    else {
                    //        checkInArr.push(requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[j].CheckIN);
                    //        checkOutArr.push(requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[j].CheckOut)
                    //    }
                    //}
                    //var lastCheckIn = checkInArr.length > 0 ? checkInArr.pop() : null;
                    //if (lastCheckIn != null) {
                    //    lastCheckIn = new Date(lastCheckIn);
                    //    var lastCheckInTime = lastCheckIn.getHours() + ": " + lastCheckIn.getMinutes();
                    //}

                    //var lastCheckOut = checkOutArr.length > 0 ? checkOutArr.pop() : null;
                    //var lastCheckOutTime = "";
                    //if (lastCheckOut != null) {
                    //    lastCheckOut = new Date(lastCheckOut);
                    //    lastCheckOutTime = lastCheckOut.getHours() + ": " + lastCheckOut.getMinutes();
                    //    lastCheckOutTime = convertTime24to12(lastCheckOutTime);
                    //}

                    //if (lastCheckOut == null) {
                    //    lastCheckOutTime = "الزائر مازال بالداخل";
                    //}

                    //if (requestsArrayData[x].VisitPersons[i].PersonCheckInOuts.length == 0) {
                    //    lastCheckInTime = "الزائر لم يدخل إلى الآن";
                    //    lastCheckOutTime = "الزائر لم يدخل إلى الآن";
                    //}

                    //if (requestsArrayData[x].VisitPersons[i].PersonCheckInOuts.length != 0) {
                    //    if (requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[requestsArrayData[x].VisitPersons[i].PersonCheckInOuts.length - 1].CheckIN != null &&
                    //        requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[requestsArrayData[x].VisitPersons[i].PersonCheckInOuts.length - 1].CheckOut == null) {
                    //        status = "In";
                    //        statusText = "تم الدخول";
                    //    }
                    //    else if (requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[requestsArrayData[x].VisitPersons[i].PersonCheckInOuts.length - 1].CheckOut != null) {
                    //        status = "Out";
                    //        statusText = "تم الخروج";
                    //    } else {
                    //        status = ""
                    //    }
                    //}
                    //visitorFullName = requestsArrayData[x].VisitPersons[i].FirstName + " " + requestsArrayData[x].VisitPersons[i].FatherName + " " + requestsArrayData[x].VisitPersons[i].FamilyName + " " + requestsArrayData[x].VisitPersons[i].LastName;

                    //if (lastCheckInTime)
                    //    innerDivs += '<div class="col-md-4"><div class="inner-card accept-request"><p class="title">' + visitorFullName + '</p><span class="nationality"><span class="nation-icon"></span> ' + requestsArrayData[x].VisitPersons[i].NationalityValue + '</span><span class="visitorid"><span class="id-icon"></span>' + requestsArrayData[x].VisitPersons[i].IdentityNumber + '</span><p>' + (requestsArrayData[x].VisitPersons[i].PersonCheckInOuts.length != 0 ? '<span>وقت الدخول </span><span> : </span><span class="check-time">' + convertTime24to12(lastCheckInTime) + '</span></p><p><span>وقت الخروج </span><span>: </span><span class="check-time">' + lastCheckOutTime + '</span>' : '<b>' + lastCheckInTime + '</b>') + '</p> </div></div>';
                    //else
                    //innerDivs += '<div class="col-md-4"><div class="inner-card accept-request"><p class="title">' + visitorFullName + '</p><span class="nationality"><span class="nation-icon"></span> ' + requestsArrayData[x].VisitPersons[i].NationalityValue + '</span><span class="visitorid"><span class="id-icon"></span>' + requestsArrayData[x].VisitPersons[i].IdentityNumber + '</span><p>' + 'الزائر لم يدخل فى هذا اليوم' + '</div></div>';

                }
            }

            var departmentName = getDepartmentName(requestsArrayData[x].ApplicantAdministration, departmentList);
            HTML += '<tr class="mainTable" role="button" data-toggle="collapse" href="#row' + requestID + '" aria-expanded="false" aria-controls="row' + requestID + '">'
                + '<td>' + requestsArrayData[x].ID + '</td>'
                + '<td>' + requestsArrayData[x].Gate + '</td>'
                + '<td>' + departmentName + '</td>'
                + '<td>' + GetHijriDate(requestsArrayData[x].RequestDate) + '</td>'
                + '<td>' + requestsArrayData[x].UserName + '<span class="options-list " role="button" data-toggle="collapse" href="#row' + requestID + '" aria-expanded="false" aria-controls="row' + requestID + '"></td>'
                + '<td>' + requestsArrayData[x].ApprovedBySupervisorName + '</td>'
                + '<td>' + requestsArrayData[x].ApprovedBySecurityName + '</td>'
                + '</tr>';

            for (var i = 0; i < requestsArrayData[x].VisitPersons.length; i++) {
                if (i === 0) {
                    var status = "";
                    var statusText = "";

                    if (requestsArrayData[x].VisitPersons[i].PersonCheckInOuts.length != 0) {

                        if (requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[requestsArrayData[x].VisitPersons[i].PersonCheckInOuts.length - 1].CheckIN != null &&
                            requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[requestsArrayData[x].VisitPersons[i].PersonCheckInOuts.length - 1].CheckOut == null) {
                            status = "In";
                            statusText = "تم الدخول";
                        }
                        else if (requestsArrayData[x].VisitPersons[i].PersonCheckInOuts[requestsArrayData[x].VisitPersons[i].PersonCheckInOuts.length - 1].CheckOut != null) {
                            status = "Out";
                            statusText = "تم الخروج";
                        } else {
                            status = ""
                        }
                    }

                    HTML += '<tr class="rowhidden">' +
                        '<td colspan="7" class="hiddenRow">' +
                        '<div class="show" style="padding: 8px 29px;" id="row' + requestID + '">' +
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

        hideLoader();
    }
</script>
