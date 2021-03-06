<%@ Assembly Name="DevicesRequestsWFWebparts, Version=1.0.0.0, Culture=neutral, PublicKeyToken=97afcd5d4112e71c" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProtectionDevicesRequestsReportWPUserControl.ascx.cs" Inherits="DevicesRequestsWFWebparts.ProtectionDevicesRequestsReportWP.ProtectionDevicesRequestsReportWPUserControl" %>

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
                    Text="<%$Resources:MachinesRequests,FilterData %>"></asp:Literal>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="container">

        <div id="SearchOptions" class="formLayout-container bb-none is-opend">
            <div class="row">
                <!-- <div class="col-md-3">
                    <div class="form-group ">
                        <label for="txtRequestNumber" class="col-form-label">رقم الطلب</label>
                        <input type="text" class="form-control" id="txtRequestNumber"
                            onkeypress="javascript:return isNumber(event)" />
                        <label class="numbval"></label>
                    </div>
                </div> -->

                <!-- <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtRequestDate" class="col-form-label">تاريخ إدخال المواد </label>
                        <input type="text" class="form-control textPicker" id="txtRequestDate" autocomplete="off" />
                        <label class="daytext"></label>
                    </div>
                </div> -->
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtApplicantName" class="col-form-label">
                            <asp:Literal runat="server"
                                Text="<%$Resources:MachinesRequests,GridTitle_RequestOwnerName %>"></asp:Literal>
                        </label>
                        <input type="text" id="txtApplicantName" class="form-control" />
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtCreationDate" class="col-form-label">تاريخ الطلب</label>

                        <input type="text" class="form-control textPicker" id="txtCreationDate" autocomplete="off" />
                        <label class="daytext"></label>
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtSupervisorName" class="col-form-label">
                            <asp:Literal runat="server"
                                Text="<%$Resources:MachinesRequests,security__supervisorName %>"></asp:Literal>
                        </label>
                        <input type="text" id="txtSupervisorName" class="form-control" />
                    </div>
                </div>
                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="txtDeviceType" class="col-form-label">
                            <asp:Literal runat="server"
                                Text="<%$Resources:MachinesRequests,GridTitle_DeviceType %>"></asp:Literal>
                        </label>
                        <input type="text" id="txtDeviceType" class="form-control" />
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group ">
                        <label for="ddlDepartments" class="col-form-label">
                            <asp:Literal runat="server"
                                Text="<%$Resources:MachinesRequests,Departments %>"></asp:Literal>
                        </label>
                        <select id="ddlDepartments" class="form-control"></select>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group ">
                        <label for="ddlSections" class="col-form-label">
                            <asp:Literal runat="server"
                                Text="<%$Resources:MachinesRequests,Sections %>"></asp:Literal>
                        </label>
                        <select id="ddlSections" class="form-control"></select>
                    </div>
                </div>

                <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="ddlGates" class="col-form-label">
                            <asp:Literal runat="server"
                                Text="<%$Resources:MachinesRequests,security__gate %>"></asp:Literal>
                        </label>
                        <select id="ddlGates" class="form-control"></select>
                    </div>
                </div>

                <!-- <div class=" col-md-3">
                    <div class="form-group ">
                        <label for="ddlStatuses" class="col-form-label">حالة الطلب</label>
                        <select id="ddlStatuses" class="form-control">
                        </select>
                    </div>
                </div> -->
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
    </div>

    <div class="container">
        <div id="PrintArea"></div>
        <div id="printAreaView" class="tableview">
            <div class="table-responsive formLayout-table printedtable">
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
                            <th class="col-xs-2"><strong>الإدارة</strong></th>
                            <th class="col-xs-2"><strong>تاريخ الطلب</strong></th>
                            <th class="col-xs-2"><strong>إسم المندوب </strong></th>
                            <th class="col-xs-2"><strong>اسم مقدم الطلب</strong></th>
                            <th class="col-xs-2"><strong>إسم مندوب الأمن</strong></th>
                            <th class="col-xs-2"><strong>تاريخ دخول الجهاز</strong></th>
                            <th class="col-xs-2">عدد الاجهزة</th>
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
                        <th class="col-xs-2"><strong>رقم الطلب</strong></th>
                        <th class="col-xs-2"><strong>البوابة</strong></th>
                        <th class="col-xs-2"><strong>الإدارة</strong></th>
                        <th class="col-xs-2"><strong>تاريخ الطلب</strong></th>
                        <th class="col-xs-2"><strong>إسم المندوب </strong></th>
                        <th class="col-xs-2"><strong>اسم مقدم الطلب</strong></th>
                        <th class="col-xs-2"><strong>إسم مندوب الأمن</strong></th>
                        <th class="col-xs-2"><strong>
                            <asp:Label runat="server" ID="GridTitle_RequestEnterDate" ClientIDMode="Static">
                            </asp:Label>
                        </strong></th>
                        <th class="col-xs-2">عدد الاجهزة</th>
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
    var apiRootAddress = $("#hdnAPIRootURL").val();
    var listSiteURL = $("#hdnWFWebUrl").val()
    var requestType = $("#hdnRequestType").val();
    $("#showSearch").click(function () {
        $("#SearchOptions").toggleClass("is-opend");
    });
    function renderSearchResult(data) {
        $("#dataTable > tbody").empty();
        var datacount = 0;
        $(".PaggerDiv").show();
        if (data == null || data.length == 0) {
            $("#RowNumb").text(datacount);
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
            var remainingVisitorsCount = 0;
            var RequestTypeStatus = "";
            var checkInArr = [];
            var requestDevicesCount = 0;
            for (var i = 0; i < requestsArrayData[x].RequestMachines.length; i++) {
                for (var j = 0; j < requestsArrayData[x].RequestMachines[i].MachineActions.length; j++) {
                    checkInArr.push(requestsArrayData[x].RequestMachines[i].MachineActions[j].ActionDate);

                }
                var lastCheckIn = checkInArr.pop();
                //lastCheckIn = new Date(lastCheckIn);
                //var lastCheckInTime = convertTime24to12(lastCheckIn.getHours() + ": " + lastCheckIn.getMinutes());

                var lastCheckInTime = requestType == "0" ? "لم يتم دخول الجهاز حتى الآن" : "لم يتم خروج الجهاز حتى الآن";
                if (lastCheckIn != undefined) {
                    lastCheckIn = new Date(lastCheckIn);
                    lastCheckInTime = convertTime24to12(lastCheckIn.getHours() + ": " + lastCheckIn.getMinutes());
                }



                //if (requestsArrayData[x].RequestMachines[i].MachineActions.length > 0) {
                if (requestsArrayData[x].RequestType == 0) {
                    RequestTypeStatus = "In";
                }
                innerDivs += '<div class="col-md-4"><div class="inner-card accept-request"><span id="cardMaterialID" style="display:none">' + requestsArrayData[x].RequestMachines[i].ID + '</span><p id="cardMaterialName" class="title"> نوع الجهاز :' + requestsArrayData[x].RequestMachines[i].DeviceType + '</p>';
                if (requestsArrayData[x].RequestMachines[i].ItemsCount != "") {
                    innerDivs += '<span class=" my-5 DeviceNumber ">  العدد : ' + requestsArrayData[x].RequestMachines[i].ItemsCount + '</span>';
                    requestDevicesCount += parseInt(requestsArrayData[x].RequestMachines[i].ItemsCount);
                }
                if (requestsArrayData[x].RequestMachines[i].DeviceNumber != "") {
                    innerDivs += '<p id="cardMaterialQuantity" class="ActionTime"> رقم الجهاز :' + requestsArrayData[x].RequestMachines[i].DeviceNumber + '</p>';
                }
                if (requestsArrayData[x].RequestMachines[i].ManufacturingCompanyName != "") {
                    innerDivs += '<p id="cardMaterialTime" class="ActionTime"> اسم الشركة المصنعة :' + requestsArrayData[x].RequestMachines[i].ManufacturingCompanyName + '</p>';
                }


                var protectionPerson = '';
                if (requestsArrayData[x].RequestMachines[i].MachineActions != null && requestsArrayData[x].RequestMachines[i].MachineActions.length > 0) {
                    protectionPerson = '<p id="protectionManName" class="Quantity"> مندوب الحماية : ' + requestsArrayData[x].RequestMachines[i].MachineActions[0].ActionDoneByName + '</p>'
                }

                innerDivs += '<p><span>' + (requestType == "0" ? " وقت الدخول" : " وقت الخروج   ") + '</span><span>:</span><span class="check-time">' + lastCheckInTime + '</span></p>' + protectionPerson + '</div ></div > ';
                remainingVisitorsCount++;

                //}

            }
            var departmentName = getDepartmentName(requestsArrayData[x].ApplicantAdministration, departmentList);
            if (remainingVisitorsCount > 0) {
                HTML += '<tr class="mainTable" >'
                    + '<td>' + requestsArrayData[x].ID + '</td>'
                    + '<td>' + requestsArrayData[x].Gate + '</td>'
                    + '<td>' + departmentName + '</td>'
                    + '<td>' + GetHijriDate(requestsArrayData[x].DevicesRequestDate) + '</td>'
                    + '<td>' + requestsArrayData[x].SupervisorName + '</td>'
                    + '<td>' + requestsArrayData[x].ApplicantName + '</td>'
                    + '<td>' + requestsArrayData[x].ApprovedBySecurityName + '</td>'
                    + '<td>' + GetHijriDate(requestsArrayData[x].CreationDate) + '</td>'
                    + '<td>' + requestDevicesCount + ' <span class="options-list showmore" role="button" data-toggle="collapse" href="#row' + requestID + '" aria-expanded="false" aria-controls="row' + requestID + '"></div> </td>'
                    + '</tr>';

                for (var i = 0; i < requestsArrayData[x].RequestMachines.length; i++) {
                    if (i === 0) {
                        var status = "";
                        var statusText = "";
                        HTML += '<tr class="rowhidden">' +
                            '<td colspan="7" class="hiddenRow">' +
                            '<div class="show"  style="padding: 8px 29px;" id="row' + requestID + '">' +
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
            $("#dataTable > tbody").append("<tr><td>لم يتم العثور علي بيانات</td></tr>");
        }
        hideLoader();
    }


    $(function () {

        $(".daytext").text(weekdays[new Date().getDay()]);
        $("#txtCreationDate").val(GetHijriDateInMonthIndex(adjusDate()));
        if ($("#hdnRequestType").val() == "0") {
            document.getElementById("GridTitle_RequestEnterDate").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests ,DevicesEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";


        } else {

            document.getElementById("GridTitle_RequestEnterDate").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesExitRequests ,DevicesEnterDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";

        }

        getAllGates(
            apiRootAddress,
            function (data) {
                $("#ddlGates").append("<option value=''><sharepoint:encodedliteral runat='server' text='<%$Resources:MachinesRequests,Choose%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></option>");
                data.forEach(function (item) {
                    $("#ddlGates").append('<option value="' + item.ID + '">' + item.Title + '</option>');
                });
            }
        );
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
                $("#ddlStatuses").append('<option value="">الكل</option>');
                data.forEach(function (item) {
                    $("#ddlStatuses").append('<option value="' + item.Code + '">' + item.Title + '</option>');
                });
            }
        );

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

        getRequests();

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
    function getRequests() {
        if ($("#txtCreationDate").val() != "") {
            requestCreationDateConverted = HijriJS.toGregorian($("#txtCreationDate").val(), "/");
            var day = requestCreationDateConverted.getDate();
            var month = requestCreationDateConverted.getMonth() + 1;
            var year = requestCreationDateConverted.getFullYear();

            requestCreationDateConverted = month + "/" + day + "/" + year;
        }

        var requestCreationDate = requestCreationDateConverted;

        var searchRequestsAPI$ = apiRootAddress + "DevicesRequest/GetActions?ListSiteUrl=" + listSiteURL + "&RequestID=0&ToDay=false&UserID=0&RequestCreateDate=" + requestCreationDate + "&Gate=&ApplicantName=&SupervisorName=&DeviceType=&DepartmentCode=&SectionCode=&RequestType=" + $("#hdnRequestType").val();

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
    }
    $("#btnSearch").click(function (e) {
        e.preventDefault();
        searchRequest();
    });
    $("#btnReset").click(function (e) {
        e.preventDefault();
        ResetSearch();
    });
    function ResetSearch() {
        getAllSections(
            apiRootAddress,
            function (data) {
                sectionList = data;
                hideLoader();
            }
        );
        $("#ddlSections").empty();
        $("#ddlSections").append('<option value="">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,All%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>');

        $("#txtApplicantName").val("");
        $("#txtSupervisorName").val("");
        $("#txtDeviceType").val("");
        $("#ddlDepartments").val("");
        $("#ddlGates").val("");
        $(".daytext").text(weekdays[new Date().getDay()]);
        $("#txtCreationDate").val(GetHijriDateInMonthIndex(adjusDate()));
        
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

        var applicantName = $("#txtApplicantName").val();
        var supervisorName = $("#txtSupervisorName").val();
        var deviceType = $("#txtDeviceType").val();
        var departmentCode = $("#ddlDepartments").val();
        var sectionCode = $("#ddlSections").val();
        var requestStatus = $("#ddlStatuses").val();

        var gate = $("#ddlGates").val() != "" ? $("#ddlGates option:selected").text() : "";

        var searchRequestsWithFilterationsAPI$ = apiRootAddress + "DevicesRequest/GetActions?ListSiteUrl=" + listSiteURL + "&RequestID=0&ToDay=false&UserID=0&RequestCreateDate=" + requestCreationDate + "&Gate=" + gate + "&ApplicantName=" + applicantName.trim() + "&SupervisorName=" + supervisorName.trim() + "&DeviceType=" + deviceType.trim() + "&DepartmentCode=" + departmentCode + "&SectionCode=" + sectionCode + "&RequestType=" + $("#hdnRequestType").val();

        getDataByAPI(searchRequestsWithFilterationsAPI$, function (data, status, xhr) {
            if (xhr.getResponseHeader('StatusCode') == 1) {
                hideGeneralErrorMessage();
                actualData = data;
                renderSearchResult(data);
            }
            else {
                //Show Error message
                showGeneralErrorMessage();
            }

        });
    }


</script>
