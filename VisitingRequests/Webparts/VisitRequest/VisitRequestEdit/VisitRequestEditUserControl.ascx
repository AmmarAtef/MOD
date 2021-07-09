<%@ Assembly Name="VisitRequest, Version=1.0.0.0, Culture=neutral, PublicKeyToken=7d812edf42fd645f" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VisitRequestEditUserControl.ascx.cs" Inherits="VisitRequest.VisitRequestEdit.VisitRequestEditUserControl" %>

<asp:HiddenField ID="hdnAPIRootURL" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hdnWFWebUrl" runat="server" ClientIDMode="Static" />

<style>
    .hidden {
        display: none;
    }
</style>

<div class="formLayout">
        <div class="overlay"></div>
        <div class="loader">
            <svg class="lds-spinner" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"
                xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 100 100" preserveAspectRatio="xMidYMid">
                <g transform="rotate(0 50 50)">
                    <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                        <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s"
                            begin="-0.9166666666666666s" repeatCount="indefinite">
                        </animate>
                    </rect>
                </g>
                <g transform="rotate(30 50 50)">
                    <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                        <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s"
                            begin="-0.8333333333333334s" repeatCount="indefinite">
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
                        <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s"
                            begin="-0.6666666666666666s" repeatCount="indefinite">
                        </animate>
                    </rect>
                </g>
                <g transform="rotate(120 50 50)">
                    <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                        <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s"
                            begin="-0.5833333333333334s" repeatCount="indefinite">
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
                        <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s"
                            begin="-0.4166666666666667s" repeatCount="indefinite">
                        </animate>
                    </rect>
                </g>
                <g transform="rotate(210 50 50)">
                    <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                        <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s"
                            begin="-0.3333333333333333s" repeatCount="indefinite">
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
                        <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s"
                            begin="-0.16666666666666666s" repeatCount="indefinite">
                        </animate>
                    </rect>
                </g>
                <g transform="rotate(300 50 50)">
                    <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                        <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s"
                            begin="-0.08333333333333333s" repeatCount="indefinite">
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
    <div class="container">
        <div class="form-row">
            <div class="form-group col-md-12 hidden">
                <asp:Label ID="lblRequestId" runat="server" Text="" ClientIDMode="Static"></asp:Label>
            </div>
        </div>
        <div class="formLayout-title">
             <p>
                <asp:Label ID="lblVisitorMessageText" runat="server" Text="<%$Resources:VisitRequest,VisitMessage %>"
                    ClientIDMode="Static"></asp:Label>

            </p>
            <p>
                <asp:Label ID="lblVisitorMessageValue" runat="server" Text="" ClientIDMode="Static"></asp:Label>

            </p>

        </div>
        <div class="formLayout-container bb-none empdata">
            <div class="formLayout-headTitles">
                <p>
                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequestApplicantData %>"></asp:Literal>
                </p>
            </div>
            <p class="formLayout-empInfo">

                <span>
                    <asp:Label ID="lblRequestUserNameValue" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                </span>
            </p>
            <div class="row">
                <div class="col-md-3">
                    <p class="formLayout-empInfo">
                        <span class="empinfo">
                            <asp:Label ID="lblUserPositionText" runat="server"
                                Text="<%$Resources:VisitRequest,VisitUserPosition %>" ClientIDMode="Static"></asp:Label>
                        </span>
                        <span>:</span>
                        <span>
                            <asp:Label ID="lblUserPositionValue" runat="server" Text="" ClientIDMode="Static">
                            </asp:Label>
                        </span>
                    </p>
                </div>
                <div class="col-md-3">
                    <p class="formLayout-empInfo">
                        <span class="empinfo">
                            <asp:Label ID="lblUserSectionText" runat="server"
                                Text="<%$Resources:VisitRequest,VisitUserSection %>" ClientIDMode="Static"></asp:Label>
                        </span>
                        <span>:</span>
                        <span>
                            <asp:HiddenField ID="hdnSectionCode" runat="server" ClientIDMode="Static" />
                            <asp:Label ID="lblUserSectionName" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                        </span>
                    </p>
                </div>
                <div class="col-md-3">
                    <p class="formLayout-empInfo">
                        <span class="empinfo">
                            <asp:Label ID="lblUserDepartmentText" runat="server"
                                Text="<%$Resources:VisitRequest,VisitUserDepartment %>" ClientIDMode="Static">
                            </asp:Label>
                        </span>
                        <span>:</span>
                        <span>
                            <asp:HiddenField ID="hdnDepartmentCode" runat="server" ClientIDMode="Static" />
                            <asp:Label ID="lblUserDepartmentName" runat="server" Text="" ClientIDMode="Static">
                            </asp:Label>
                        </span>
                    </p>
                </div>
            </div>


        </div>

        <div class="formLayout-container">
            <div class="formLayout-headTitles">
                <p>
                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitDate %>"></asp:Literal>

                </p>
            </div>
           

            <div class="row">
                <div class="col-md-3">
                    <div class="form-group ">
                        <label class="col-form-label">
                            <asp:Label ID="lblVisitStartDate" runat="server"
                                Text="<%$Resources:VisitRequest,VisitStartDate %>" ClientIDMode="Static"></asp:Label>
                            <span class="is-required">*</span>
                        </label>
                        <asp:TextBox ID="txtVisitStartDate" onblur="isInputRequired(this);" isMandatory MaxLength="15"
                            CssClass="form-control textPicker" runat="server" ClientIDMode="Static"></asp:TextBox>
                        <label class="daytext daytextVisitStartDate"></label>

                    </div>
                </div>
              
                <div class="col-md-3">
                    <div class="form-group ">
                        <label class="col-form-label">
                            <asp:Label ID="lblVisitEndDate" runat="server"
                                Text="<%$Resources:VisitRequest,VisitEndDate %>" ClientIDMode="Static"></asp:Label>
                            <span class="is-required">*</span>
                        </label>
                        <asp:TextBox ID="txtVisitEndDate" runat="server" onblur="isInputRequired(this);" isMandatory
                            MaxLength="15" CssClass="form-control textPicker" ClientIDMode="Static"></asp:TextBox>
                        <label class="daytext daytextVisitEndDate"></label>

                    </div>
                </div>
                  <div class="col-md-4 col-lg-3">
                    <div class="form-group ">
                        <label class="col-form-label">
                            <asp:Label ID="lblVisitStartTime" runat="server"
                                Text="<%$Resources:VisitRequest,VisitTime %>" ClientIDMode="Static">
                            </asp:Label>
                            <span class="is-required">*</span>
                        </label>
                        <asp:TextBox ID="txtVisitorVisitTime" autocomplete="off" isMandatory MaxLength="15"
                            CssClass="form-control time timepicker" runat="server" ClientIDMode="Static" placeholder="00:00"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group ">
                        <label class="col-form-label">
                            <asp:Label ID="lblVisitReason" runat="server"
                                Text="<%$Resources:VisitRequest,VisitReason %>" ClientIDMode="Static"></asp:Label>
                            <span class="is-required">*</span>
                        </label>
                        <asp:DropDownList ID="ddlVisitReason" runat="server" required="required"
                            CssClass="form-control " ClientIDMode="Static">
                        </asp:DropDownList>
                    </div>
                </div>


            </div>

        </div>

        <div class="formLayout-container">
            <div class="formLayout-headTitles">
                <p>
                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitorsData%>"></asp:Literal>
                </p>
            </div>
            <p class="formLayout-title">
                <asp:Label ID="lblVisitorsList" runat="server" Text="<%$Resources:VisitRequest,Visitors %>"
                    ClientIDMode="Static"></asp:Label>

            </p>
            <div class="l-addvisitor add-visitor">

                <button class="AddVisitorBTN btn btn-apply hvr-shutter-out-horizontal" tabindex="1">
                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,AddVisitor %>"></asp:Literal>
                </button>
            </div>
            <div class="request-visitors">
            </div>
        </div>


    </div>

    <div class="container">
        <div class="form-row">
            <div class="form-group col-md-12">
                <button type="button" class="btn preview-btn" id="btnPreview">
                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequestPreview %>"></asp:Literal>
                </button>
                <button type="button" class="btn preview-btn send-btn" id="btnSend">
                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequestEdit %>"></asp:Literal>

                </button>
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
                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitRequest %>"></asp:Literal>
                </p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p class="request-msgtitle">
                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequestMsg %>"></asp:Literal>
                </p>
                <p class="request-msg">
                    <span id="visitMessageTitle"></span>
                </p>

                <div class="visitinfo">
                    <div class="form-row">
                        <div class="form-group col-md-3">
                            <i class=" mdi mdi-calendar "></i>
                            <label class="col-form-label">
                                <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitStartDate %>">
                                </asp:Literal>
                            </label>
                            <p id="visitStartDatePreview"></p>
                        </div>
                      
                        <div class="form-group col-md-3">
                            <i class=" mdi mdi-calendar "></i>
                            <label class="col-form-label">
                                <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitEndDate %>">
                                </asp:Literal>
                            </label>
                            <p id="visitEndDatePreview"></p>
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
                                <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitReason %>">
                                </asp:Literal>
                            </label>
                            <p id="visitReasonPreview"></p>
                        </div>
                    </div>
                </div>

                <div class="heading-title">
                    <p>
                        <asp:Literal runat="server" Text="<%$Resources:VisitRequest,RequestApplicantData %>">
                        </asp:Literal>

                    </p>
                </div>
                <div class="emp-request">
                    <div class="form-row">
                        <div class="form-group col-md-12">

                            <span id="applicantNamePreview"></span>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-form-label">
                                <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitUserPosition %>">
                                </asp:Literal>
                            </label>
                            <p id="applicantTitlePreview"></p>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-form-label">
                                <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitUserSection %>">
                                </asp:Literal>
                            </label>
                            <p id="applicantSectionPreview"></p>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-form-label">
                                <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitUserDepartment %>">
                                </asp:Literal>
                            </label>
                            <p id="applicantDepartmentPreview"></p>
                        </div>
                    </div>
                </div>
                <div class="heading-title">
                    <p>
                        <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitorsDataa %>"></asp:Literal>
                    </p>
                </div>


                <div class=" request-visitors-review">
                </div>

            </div>
            <div class="modal-footer">

                <button type="button" class="btn preview-btn send-btn" data-dismiss="modal">
                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,Close %>"></asp:Literal>
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
                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,VisitRequestSend %>"></asp:Literal>
                </p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p id="MsgID">
                    <asp:Literal runat="server" Text="<%$Resources:VisitRequest,yourRequestSendSuccessfully %>">
                    </asp:Literal>
                </p>
            </div>

        </div>

    </div>

</div>
<!-- <script src="/modwf/style Library/branding/js/general/helpers.js"></script> -->
<script type="text/javascript">
    
    var request;
    var apiRootAddress = $("#hdnAPIRootURL").val();
    var listSiteURL = $("#hdnWFWebUrl").val();
    var currentUserId = _spPageContextInfo.userId;
    var visitorsContainer = $('.request-visitors');

    var visitReasonsData = null;
    var nationalitiesData = null;
    var identityTypesData = null;

    $(function () {

        var rid = getUrlParameter('rid');
        getRequest(rid, function (data) {
            if (data == null) {
                $(".formLayout .container").hide();
                $(".formLayout").append("<div class='container'><p style='text-align:center;padding: 100px'>غير مسموح لك بتعديل هذا الطلب</p></div>")
                return;

            }
            request = data;
            $("#lblRequestId").text(request.ID);
            $("#lblVisitorMessageValue").text(request.VisitMessage);
            $("#txtVisitStartDate").val(getHijriDateForInput(request.VisitStartDate));
            $("#txtVisitorVisitTime").val(request.VisitTime);
            $("#txtVisitEndDate").val(getHijriDateForInput(request.VisitEndDate));
            $("#lblRequestUserNameValue").text(request.UserName);
            $('.daytextVisitStartDate').text(GetHijriDayName(request.VisitStartDate) + " ");
            $('.daytextVisitEndDate').text(GetHijriDayName(request.VisitEndDate));
            $("#lblUserPositionValue").text(request.ApplicantRank);
            $("#hdnSectionCode").val(request.ApplicantSection);
            $("#hdnDepartmentCode").val(request.ApplicantAdministration);

            //Get Department & Section names
            var departmentAPI$ = apiRootAddress + "Lookups/GetDepartmentNameByCode?departmentCode=" + $("#hdnDepartmentCode").val();
            getDataByAPI(
                departmentAPI$,
                function (data) {
                    $("#lblUserDepartmentName").text(data);
                }
            );

            var sectionsAPI$ = apiRootAddress + "Lookups/GetSectionNameByDeptartmentCodeAndSection?departmentCode=" + $("#hdnDepartmentCode").val() + "&sectionCode=" + $("#hdnSectionCode").val();
            getDataByAPI(
                sectionsAPI$,
                function (data) {
                    $("#lblUserSectionName").text(data);
                }
            );

            var lookupsDataAPI$ = apiRootAddress + "VisitRequest/GetAllLookups?ListSiteUrl=" + listSiteURL;
            getDataByAPI(
                lookupsDataAPI$,
                function (data) {
                    visitReasonsData = data.VisitingReasonsList;

                    $("#ddlVisitReason").append('<option value="">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,choose%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>');
                    visitReasonsData.forEach(function (item) {
                        $("#ddlVisitReason").append('<option value="' + item.ID + '">' + item.Title + '</option>');
                    });
                    $("#ddlVisitReason").val(request.VisitReason);


                    nationalitiesData = data.NationalityList;
                    $("#ddlVisitorNationalities").append('<option value="">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,choose%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>');
                    nationalitiesData.forEach(function (item) {
                        $("#ddlVisitorNationalities").append('<option value="' + item.ID + '">' + item.Title + '</option>');
                    });

                    identityTypesData = data.IdentityList;
                    $("#ddlVisitorIdentityTypes").append('<option value="">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,choose%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>');
                    identityTypesData.forEach(function (item) {
                        $("#ddlVisitorIdentityTypes").append('<option value="' + item.ID + '">' + item.Title + '</option>');
                    });

                    if (request.VisitPersons.length > 0) {
                        //visitorsContainer.append(renderVisitorHeader());
                        request.VisitPersons.forEach(function (item, index) {
                            visitorsContainer.append(renderNewVisitor(item, nationalitiesData, identityTypesData, false, index));

                        });
                    }
                }
            );

            hideLoader();

        });
    });
    $(document).on("click", ".AddVisitorBTN", function (event) {
        event.preventDefault();
        visitorsContainer.append(renderNewVisitor(null, nationalitiesData, identityTypesData, true));
    });



    $("#btnPreview").click(function (event) {
        event.preventDefault();

        if (!isFormValid()) {
            return;
        }
        $("#visitMessageTitle").text($("#lblVisitorMessageValue").text());
        $("#visitStartDatePreview").text($("#txtVisitStartDate").val());
        $("#visitTimePreview").text($("#txtVisitorVisitTime").val());
        $("#visitEndDatePreview").text($("#txtVisitEndDate").val());
        $("#visitReasonPreview").text($("#ddlVisitReason option:selected").text());

        $("#applicantNamePreview").text($("#lblRequestUserNameValue").text());
        $("#applicantTitlePreview").text($("#lblUserPositionValue").text());
        $("#applicantSectionPreview").text($("#lblUserSectionName").text());
        $("#applicantDepartmentPreview").text($("#lblUserDepartmentName").text());


        var visitorsCount = $(".visitorRow").length;
        var deviceCount = 0;

        $(".request-visitors-review").empty();

        for (var i = 0; i < visitorsCount; i++) {

            var elem = document.createElement("div");
            elem.classList.add("form-row", "reviewCol");

            var visitorRowBody = '';

            visitorRowBody += '<div class="form-group info-data  col-md-8">';
            visitorRowBody += $(".visitorRow:eq(" + i + ") .visitor-FirstName").val() + " " + $(".visitorRow:eq(" + i + ") .visitor-FatherName").val() + " " + $(".visitorRow:eq(" + i + ") .visitor-FamilyName").val() + " " + $(".visitorRow:eq(" + i + ") .visitor-LastName").val();
            visitorRowBody += '</div>';


            visitorRowBody += '<div class="form-group  col-md-4 ">';
            visitorRowBody += '<span class="nation-icon"></span>';
            visitorRowBody += '  <label class="col-form-label">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Nationality%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + ' </label>';
            visitorRowBody += '<p class="info-data">';
            visitorRowBody += $(".visitorRow:eq(" + i + ") .visitor-Nationality option:selected").text();
            visitorRowBody += '</p">';
            visitorRowBody += '</div>';


            visitorRowBody += '<div class="form-group  col-md-4">';
            visitorRowBody += '<span class="ID-icon"></span>';
            visitorRowBody += '  <label class="col-form-label">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Identity%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + ' </label>';
            visitorRowBody += '<p class="info-data">';
            visitorRowBody += '<span>';
            visitorRowBody += $(".visitorRow:eq(" + i + ") .visitor-IdentityNumber").val();
            visitorRowBody += '</span>';
            visitorRowBody += '<span class="numberid">';
            visitorRowBody += $(".visitorRow:eq(" + i + ") .visitor-IdentityType option:selected").text();
            visitorRowBody += '</span>';
            visitorRowBody += '</p>';
            visitorRowBody += '</div>';


            var workingPlace = $(".visitorRow:eq(" + i + ") .visitor-WorkingPlace").val();
            if (workingPlace != "") {
                visitorRowBody += '<div class="form-group col-md-4">';
                visitorRowBody += '<span class="work-icon"></span>';
                visitorRowBody += '<label class="col-form-label">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,WorkingPlace%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '  </label>';
                visitorRowBody += '<p class="info-data">';
                visitorRowBody += workingPlace;
                visitorRowBody += '<p>';
                visitorRowBody += '</div>';
            }



            //End of form-row visitorRowData



            visitorRowBody += '<div class="visitor-row-dev">';

            visitorRowBody += '<div class="form-row">';

            visitorRowBody += '<div class="form-group col-md-12 devices-title ">';
            visitorRowBody += "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,AttachedDevices%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            visitorRowBody += '</div>';

            visitorRowBody += '</div >';



            deviceCount = $(".visitorRow:eq(" + i + ") .deviceRow").length;
            if (deviceCount > 0) {
                for (var j = 0; j < deviceCount; j++) {
                    visitorRowBody += '<div class="form-row devices" style="vertical-align: top">';



                    visitorRowBody += '<p class="devicetype">';
                    visitorRowBody += '<span> ' + $(".visitorRow:eq(" + i + ") .deviceRow:eq(" + j + ") .device-DeviceType").val() + '</span>';

                    var manufacturingCompany = $(".visitorRow:eq(" + i + ") .deviceRow:eq(" + j + ") .device-ManufacturingCompanyName").val();
                    if (manufacturingCompany != "") {
                        visitorRowBody += ' <span class="info-data">( </span> ';
                        visitorRowBody += manufacturingCompany;
                        visitorRowBody += ' <span class="info-data">)</span> ';
                        visitorRowBody += '</p>';
                    }


                    var deviceNumber = $(".visitorRow:eq(" + i + ") .deviceRow:eq(" + j + ") .device-DeviceNumber").val();
                    if (deviceNumber != "") {
                        visitorRowBody += '<p class="info-data">';
                        visitorRowBody += "<span><sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,DeviceNumber%>' EncodeMethod='EcmaScriptStringLiteralEncode'/> </span><span> : </span>";
                        visitorRowBody += deviceNumber;
                        visitorRowBody += '</p>';
                    }

                    var noteAboutDevice = $(".visitorRow:eq(" + i + ") .deviceRow:eq(" + j + ") .device-NotesAboutDevice").val();
                    if (noteAboutDevice != "") {
                        visitorRowBody += '<p class="info-data">';
                        visitorRowBody += "<span><sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Notes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>  </span><span> : </span>";
                        visitorRowBody += noteAboutDevice;
                        visitorRowBody += '</p>';
                    }

                    visitorRowBody += '</div>';
                }
            }
            else {
                visitorRowBody += '<p class="welcome" style="padding:5px 60px;color:#333333">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,ThereIsNoDevicesForVisitor%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '  </p>';
            }




            visitorRowBody += '</div>';

            elem.innerHTML = visitorRowBody;


            $(".request-visitors-review").append(elem);

        }




        $('#myModal').modal({ backdrop: 'static', keyboard: false });
        $(".reviewCol").click(function () {
            $(this).toggleClass("opend");
        });
    });

    var deviceRowCount = 0;
    //Devices
    //Add & delete device button
    $(document).on("click", ".visitor-row-devices", function (event) {
        if (
            event.target &&
            event.target.nodeName === "BUTTON" &&
            event.target.classList.contains("AddDeviceBTN")
        ) {
            event.preventDefault();
            $(event.target.parentElement.parentElement.parentElement).append(RenderNewDevice());
        }

        //Remove device button
        if (
            event.target &&
            event.target.nodeName === "BUTTON" &&
            event.target.classList.contains("request-deleteDevice")
        ) {
            event.preventDefault();
            $(event.target.parentElement.parentElement).remove();
        }

    });

    //Delete visitor
    $('.request-visitors').on("click", function (event) {
        if (
            event.target &&
            event.target.nodeName === "BUTTON" &&
            event.target.classList.contains("request-deleteVisitor")
        ) {
            event.preventDefault();
            $(event.target.parentElement.parentElement).remove();
        }
    });

    $(document).on("click", "#btnSend", function (event) {
        event.preventDefault();

        if (!isFormValid()) {
            return;
        }

        if (!validateVisitDates($("#txtVisitStartDate"))) {
            $("#txtVisitStartDate").focus();
            return;
        }

        if (!validateVisitDates($("#txtVisitEndDate"))) {
            $("#txtVisitEndDate").focus();
            return;
        }

        var startDateConverted = HijriJS.toGregorian($("#txtVisitStartDate").val(), "/");
        startDateConverted.setMonth(startDateConverted.getMonth());
        var endDateConverted = HijriJS.toGregorian($("#txtVisitEndDate").val(), "/");
        endDateConverted.setMonth(endDateConverted.getMonth());

        var requestObject =
        {
            ID: $("#lblRequestId").text(),
            VisitMessage: $("#lblVisitorMessageValue").text(),
            VisitStartDate: startDateConverted,
            VisitTime: $("#txtVisitorVisitTime").val(),
            VisitEndDate: endDateConverted,
            VisitReason: $("#ddlVisitReason").val(),
            UserName: $("#lblRequestUserNameValue").text(),
            ApplicantRank: $("#lblUserPositionValue").text(),
            ApplicantAdministration: $("#hdnDepartmentCode").val(),
            ApplicantSection: $("#hdnSectionCode").val(),
            ISDeleted: false,
        };
        $(".loader").show();
        $(".overlay").show();
        $("#btnSend").attr("disabled", true);
        var visitorsCount = $(".visitorRow").length;
        var deviceCount = 0;

        requestObject.VisitPersons = [];
        for (var i = 0; i < visitorsCount; i++) {
            visitor = {};
            visitor.ID = $(".visitorRow:eq(" + i + ") .visitor-Id").val();
            visitor.FirstName = $(".visitorRow:eq(" + i + ") .visitor-FirstName").val();
            visitor.FatherName = $(".visitorRow:eq(" + i + ") .visitor-FatherName").val();
            visitor.FamilyName = $(".visitorRow:eq(" + i + ") .visitor-FamilyName").val();
            visitor.LastName = $(".visitorRow:eq(" + i + ") .visitor-LastName").val();
            visitor.Nationality = $(".visitorRow:eq(" + i + ") .visitor-Nationality").val();
            visitor.IdentityType = $(".visitorRow:eq(" + i + ") .visitor-IdentityType").val();
            visitor.IdentityNumber = $(".visitorRow:eq(" + i + ") .visitor-IdentityNumber").val();
            visitor.WorkingPlace = $(".visitorRow:eq(" + i + ") .visitor-WorkingPlace").val();
            visitor.IsDeleted = false;

            if (visitor.ID == "") {
                // New
                visitor.State = "1";
            } else {
                // Update
                visitor.State = "2";
            }

            deviceCount = $(".visitorRow:eq(" + i + ") .deviceRow").length;
            if (deviceCount > 0) {
                visitor.VisitDevices = [];
                for (var j = 0; j < deviceCount; j++) {
                    device = {};
                    device.ID = $(".visitorRow:eq(" + i + ") .deviceRow:eq(" + j + ") .device-Id").val();
                    device.DeviceType = $(".visitorRow:eq(" + i + ") .deviceRow:eq(" + j + ") .device-DeviceType").val();
                    device.DeviceNumber = $(".visitorRow:eq(" + i + ") .deviceRow:eq(" + j + ") .device-DeviceNumber").val();
                    device.ManufacturingCompanyName = $(".visitorRow:eq(" + i + ") .deviceRow:eq(" + j + ") .device-ManufacturingCompanyName").val();
                    device.NotesAboutDevice = $(".visitorRow:eq(" + i + ") .deviceRow:eq(" + j + ") .device-NotesAboutDevice").val();

                    if (device.ID == "") {
                        // New
                        device.State = "1";
                    } else {
                        // Update
                        device.State = "2";
                    }
                    visitor.VisitDevices.push(device);
                }
            }
            requestObject.VisitPersons.push(visitor);

        }

        // Add the deleted objects to returned object to be deleted
        request.VisitPersons.forEach(function (visitor) {

            var isVisitorRecordStillExist = false;
            requestObject.VisitPersons.forEach(function (visitorObject) {
                if (visitorObject.ID == visitor.ID) {
                    isVisitorRecordStillExist = true;
                }
            });

            if (!isVisitorRecordStillExist) {
                visitor.State = "3";
                visitor.VisitDevices.forEach(function (device) {
                    //To be deleted
                    device.State = "3";
                });
                requestObject.VisitPersons.push(visitor);
            }
            else {
                //Loop through his devices
                // Add the deleted objects to returned object to be deleted
                requestObject.VisitPersons.forEach(function (visitorObject) {
                    if (visitorObject.ID == visitor.ID) {
                        visitor.VisitDevices.forEach(function (device) {

                            isDeviceRecordStillExist = false;

                            if (visitorObject.VisitDevices != null && visitorObject.VisitDevices.length > 0) {
                                visitorObject.VisitDevices.forEach(function (deviceObject) {

                                    if (device.ID == deviceObject.ID) {
                                        isDeviceRecordStillExist = true;
                                    }

                                });
                            }

                            if (!isDeviceRecordStillExist) {
                                //To be deleted
                                device.State = "3";
                                if (visitorObject.VisitDevices == null) {
                                    visitorObject.VisitDevices = [];
                                }
                                visitorObject.VisitDevices.push(device);
                            }
                        });
                    }
                });

                if (!isVisitorRecordStillExist) {
                    //To be deleted
                    visitor.State = "3";
                    requestObject.VisitPersons.push(visitor);
                }
            }
        });

        postRequest(JSON.stringify(requestObject));

    });

    function getRequest(id, callback) {
        var visitReasonsDataAPI$ = apiRootAddress + "VisitRequest/GetRequestDetailsForEdit?ListSiteUrl=" + listSiteURL + "&CurrentUserId=" + currentUserId + "&RequestID=" + id;
        getDataByAPI(
            visitReasonsDataAPI$,
            function (data) {
                callback(data);
            }
        );

    }

    function postRequest(requestData) {
        var url = apiRootAddress + "VisitRequest/UpdateVisitRequest?ListSiteUrl=" + listSiteURL;
        $.ajax({
            url: url,
            type: 'POST',
            contentType: 'application/json',
            data: requestData,
            success: function (result) {
                if (result.statusCode == 1) {

                    showSendMsg("<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,RequestHasBeenEditSuccessfully%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
                    $(".loader").hide();
                    $(".overlay").hide();
                    $("#btnSend").attr("disabled", true);
                }
                else {
                    showSendMsg(result.statusMessage);
                    $(".loader").hide();
                    $(".overlay").hide();
                    $("#btnSend").attr("disabled", true);
                }
            }
            ,
            error: function (err) {

            },

            complete: function () {

            }
        });
    }

    function renderVisitorHeader() {

        var elem = document.createElement("div");
        elem.classList.add("row");

        var visitorRowBody = '';

        visitorRowBody += '<div class="form-group col-md-1">';
        visitorRowBody += 'FirstName';
        visitorRowBody += '</div>';

        visitorRowBody += '<div class="form-group col-md-1">';
        visitorRowBody += 'FatherName';
        visitorRowBody += '</div>';


        visitorRowBody += '<div class="form-group col-md-1">';
        visitorRowBody += 'FamilyName';
        visitorRowBody += '</div>';

        visitorRowBody += '<div class="form-group col-md-1">';
        visitorRowBody += 'LastName';
        visitorRowBody += '</div>';

        visitorRowBody += '<div class="form-group col-md-2">';
        visitorRowBody += "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,Nationality%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
        visitorRowBody += '</div>';



        visitorRowBody += '<div class="form-group col-md-2">';
        visitorRowBody += "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,IdentityType%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
        visitorRowBody += '</div>';

        visitorRowBody += '<div class="form-group col-md-2">';
        visitorRowBody += 'IdentityNumber';
        visitorRowBody += '</div>';

        visitorRowBody += '<div class="form-group col-md-2">';
        visitorRowBody += 'WorkingPlace';
        visitorRowBody += '</div>';


        visitorRowBody += '<div class="form-group col-md-1">';
        visitorRowBody += 'VisitTime';
        visitorRowBody += '</div>';

        //End of form-row visitorRowData
        visitorRowBody += '</div>';

        elem.innerHTML = visitorRowBody;
        return elem;

    };
    function renderNewVisitor(visitor, nationalitiesData, identityTypesData, addRemoveButton, index) {

        var elem = document.createElement("div");
        elem.classList.add("visitorRow");
        elem.classList.add("row");

        var visitorRowBody = '';



        visitorRowBody += '<div class="row visitorRowData">';

        visitorRowBody += '<div class="form-group col-md-1 hidden">';
        visitorRowBody += '<input type="text" class="visitor-Id form-control" value="' + (visitor !== null ? visitor.ID : "") + '" />';
        visitorRowBody += '</div>';

        visitorRowBody += '<div class="form-group col-md-3">';
        visitorRowBody += '<label class="col-form-label"><sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,FirstName%>" EncodeMethod="EcmaScriptStringLiteralEncode"/><span class="is-required">*</span></label>';
        visitorRowBody += '<input type="text" required="required" class="visitor-FirstName form-control" value="' + (visitor !== null ? visitor.FirstName : "") + '" />';
        visitorRowBody += '</div>';

        visitorRowBody += '<div class="form-group col-md-3">';
        visitorRowBody += '<label class="col-form-label"><sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,FatherName%>" EncodeMethod="EcmaScriptStringLiteralEncode"/></label>';
        visitorRowBody += '<input type="text" class="visitor-FatherName form-control" value="' + (visitor !== null ? visitor.FatherName : "") + '" />';
        visitorRowBody += '</div>';


        visitorRowBody += '<div class="form-group col-md-3">';
        visitorRowBody += '<label class="col-form-label"><sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,FamilyName%>" EncodeMethod="EcmaScriptStringLiteralEncode"/></label>';
        visitorRowBody += '<input type="text" class="visitor-FamilyName form-control" value="' + (visitor !== null ? visitor.FamilyName : "") + '" />';
        visitorRowBody += '</div>';

        visitorRowBody += '<div class="form-group col-md-3">';
        visitorRowBody += '<label class="col-form-label"><sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,LastName%>" EncodeMethod="EcmaScriptStringLiteralEncode"/><span class="is-required">*</span></label>';
        visitorRowBody += '<input type="text" required="required" class="visitor-LastName form-control" value="' + (visitor !== null ? visitor.LastName : "") + '" />';
        visitorRowBody += '</div>';

        visitorRowBody += '<div class="form-group col-md-3">';
        visitorRowBody += '<label class="col-form-label"><sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,Nationality%>" EncodeMethod="EcmaScriptStringLiteralEncode"/><span class="is-required">*</span></label>';
        visitorRowBody += '<select required="required" class="visitor-Nationality form-control">'
        visitorRowBody += '<option value="">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,choose%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>';
        if (nationalitiesData != null) {
            nationalitiesData.forEach(function (item) {
                if (visitor != null && item.ID == visitor.Nationality) {
                    visitorRowBody += '<option value="' + item.ID + '" selected>' + item.Title + '</option>';
                }
                else {
                    visitorRowBody += '<option value="' + item.ID + '">' + item.Title + '</option>';
                }
            });
        }

        visitorRowBody += '</select>';
        visitorRowBody += '</div>';



        visitorRowBody += '<div class="form-group col-md-3">';
        visitorRowBody += '<label class="col-form-label"><sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,IdentityType%>" EncodeMethod="EcmaScriptStringLiteralEncode"/><span class="is-required">*</span></label>';
        visitorRowBody += '<select required="required" class="visitor-IdentityType form-control">'
        visitorRowBody += '<option value="">' + "<sharepoint:encodedliteral runat='server' text='<%$Resources:VisitRequest,choose%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>" + '</option>';
        if (identityTypesData != null) {
            identityTypesData.forEach(function (item) {
                if (visitor != null && item.ID == visitor.IdentityType) {
                    visitorRowBody += '<option value="' + item.ID + '" selected>' + item.Title + '</option>';
                }
                else {
                    visitorRowBody += '<option value="' + item.ID + '">' + item.Title + '</option>';
                }
            });
        }
        visitorRowBody += '</select>';
        visitorRowBody += '</div>';

        visitorRowBody += '<div class="form-group col-md-3">';
        visitorRowBody += '<label class="col-form-label"><sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,IdentityNumber%>" EncodeMethod="EcmaScriptStringLiteralEncode"/><span class="is-required">*</span></label>';
        visitorRowBody += '<input type="text" required="required" class="visitor-IdentityNumber form-control" value="' + (visitor !== null ? visitor.IdentityNumber : "") + '"  onkeypress="javascript:return isNumber(event)" />';
        visitorRowBody += '</div>';

        visitorRowBody += '<div class="form-group col-md-3">';
        visitorRowBody += '<label class="col-form-label"><sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,WorkingPlace%>" EncodeMethod="EcmaScriptStringLiteralEncode"/></label>';
        visitorRowBody += '<input type="text" MaxLength="25" class="visitor-WorkingPlace form-control" value="' + (visitor !== null ? visitor.WorkingPlace : "") + '" />';
        visitorRowBody += '</div>';

        //End of form-row visitorRowData
        visitorRowBody += '</div>';

        if (index > 0 || addRemoveButton == true) {
            visitorRowBody += '<div class="delete-row"><button  class="request-deleteVisitor btn  hvr-shutter-out-horizontal" title="delete"> - </button></div>';
        }



        visitorRowBody += '<div class="visitor-row-devices">';

        visitorRowBody += '<div class="row">';

        visitorRowBody += '<div class="l-addDevice col-md-2">';
        visitorRowBody += '<div class="addDevice">';
        visitorRowBody += '<button class="AddDeviceBTN btn btn-apply hvr-shutter-out-horizontal" tabindex="1"><sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,AttachedDevices%>" EncodeMethod="EcmaScriptStringLiteralEncode"/> </button>'
        visitorRowBody += '</div>';
        visitorRowBody += '</div>';
        visitorRowBody += '</div >';

        //Render visitor devices here
        if (visitor != null) {
            visitor.VisitDevices.forEach(function (device, deviceIndex) {
                visitorRowBody += '<div class=" deviceRow">'
                visitorRowBody += RenderNewDevice(device, deviceIndex).innerHTML;
                visitorRowBody += '</div>';
            });
        }

        visitorRowBody += '</div>';


        elem.innerHTML = visitorRowBody;
        return elem;



    };
    function RenderNewDevice(device, index) {
        var elem = document.createElement("div");
        elem.classList.add("deviceRow");
        // elem.classList.add("row");

        var deviceRowBody = '';
        deviceRowBody += '<div class="row">';
        deviceRowBody += '<div class="form-group col-md-2 " style="visibility:hidden">';
        deviceRowBody += '<input type="text"  class="device-Id form-control" value="' + (device !== undefined ? device.ID : "") + '" />';
        deviceRowBody += '</div>';

        deviceRowBody += '<div class="form-group col-md-2">';
        //if (index == 0 || $(".deviceRow").length == 0) {
        deviceRowBody += '<label class="col-form-label"><sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,DeviceType%>" EncodeMethod="EcmaScriptStringLiteralEncode"/><span class="is-required">*</span></label>';
        //}
        deviceRowBody += '<input type="text" required="required" attr-required="required" class="device-DeviceType form-control" value="' + (device !== undefined ? device.DeviceType : "") + '" />';
        deviceRowBody += '</div>';

        deviceRowBody += '<div class="form-group col-md-2">';
        //if (index == 0 || $(".deviceRow").length == 0) { 
        deviceRowBody += '<label class="col-form-label"><sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,DeviceNumber%>" EncodeMethod="EcmaScriptStringLiteralEncode"/></label>';
        // }
        deviceRowBody += '<input type="text" attr-required="required" class="device-DeviceNumber form-control" value="' + (device !== undefined ? device.DeviceNumber : "") + '" />';
        deviceRowBody += '</div>';

        deviceRowBody += '<div class="form-group col-md-2">';
        deviceRowBody += '<label class="col-form-label"><sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,ManufacturingCompanyName%>" EncodeMethod="EcmaScriptStringLiteralEncode"/></label>';
        deviceRowBody += '<input type="text" attr-required="required" class="device-ManufacturingCompanyName form-control" value="' + (device !== undefined ? device.ManufacturingCompanyName : "") + '" />';
        deviceRowBody += '</div>';


        deviceRowBody += '<div class="form-group col-md-3">';
        deviceRowBody += '<label class="col-form-label"><sharepoint:encodedliteral runat="server" text="<%$Resources:VisitRequest,NotesAboutDevice%>" EncodeMethod="EcmaScriptStringLiteralEncode"/></label>';
        deviceRowBody += '<textarea attr-required="required" class="device-NotesAboutDevice form-control">' + (device !== undefined ? device.NotesAboutDevice : "") + '</textarea>';
        deviceRowBody += '</div>';
        deviceRowBody += '</div>';
        deviceRowBody += '<div class="delete-row">';
        deviceRowBody += '<button  class="request-deleteDevice btn  hvr-shutter-out-horizontal"  title="delete"> - </button><a href="#" class="del-dev"></a>';
        deviceRowBody += '</div>';
        elem.innerHTML = deviceRowBody;

        return elem;
    };

    //function GetHijriDate(date) {
    //    var SplitedDate = (date.split("T")[0]).split("-");
    //    var s = HijriJS.gregorianToHijri(SplitedDate[0], SplitedDate[1], SplitedDate[2])
    //    return s.day + "/" + s.month + "/" + s.year
    //}
    //function GetHijriDateWithSlashFormat(date) {
    //    var SplitedDate = (date.split("T")[0]).split("-");
    //    var s = HijriJS.gregorianToHijri(SplitedDate[0], SplitedDate[1], SplitedDate[2])
    //    return s.day + "/" + s.month + "/" + s.year
    //}

    //function showSendMsg(Msg) {
    //    $("#MsgID").text(Msg);
    //    $('#sendModel').modal({ backdrop: 'static', keyboard: false });
    //}


    $('.visitorRowData').on('click', function () {
        if (
            event.target &&
            event.target.nodeName === "BUTTON" &&
            event.target.classList.contains("timepicker")
        ) {
            event.preventDefault();
            $(event.target.parentElement.parentElement.parentElement.parentElement).append(RenderNewDevice());
        }

    });


    $('#sendModel').on('hidden.bs.modal', function () {
        window.location.href = "default.aspx";
    })

</script>

<script src="/modwf/style Library/branding/js/general/helpers.js"></script>
