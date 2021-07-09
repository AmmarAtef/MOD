<%@ Assembly Name="VisitRequest, Version=1.0.0.0, Culture=neutral, PublicKeyToken=7d812edf42fd645f" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReportsWPUserControl.ascx.cs" Inherits="VisitRequest.ReportsWP.ReportsWPUserControl" %>

<asp:HiddenField ID="hdnAPIRootURL" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hdnWFWebUrl" runat="server" ClientIDMode="Static" />

<div class="formLayout">
    <div class="overlay"></div>
    <div class="loader">
        <svg class="lds-spinner" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 100 100" preserveAspectRatio="xMidYMid">
            <g transform="rotate(0 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.9166666666666666s" repeatCount="indefinite"></animate>
                </rect>
            </g><g transform="rotate(30 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.8333333333333334s" repeatCount="indefinite"></animate>
                </rect>
            </g><g transform="rotate(60 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.75s" repeatCount="indefinite"></animate>
                </rect>
            </g><g transform="rotate(90 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.6666666666666666s" repeatCount="indefinite"></animate>
                </rect>
            </g><g transform="rotate(120 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.5833333333333334s" repeatCount="indefinite"></animate>
                </rect>
            </g><g transform="rotate(150 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.5s" repeatCount="indefinite"></animate>
                </rect>
            </g><g transform="rotate(180 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.4166666666666667s" repeatCount="indefinite"></animate>
                </rect>
            </g><g transform="rotate(210 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.3333333333333333s" repeatCount="indefinite"></animate>
                </rect>
            </g><g transform="rotate(240 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.25s" repeatCount="indefinite"></animate>
                </rect>
            </g><g transform="rotate(270 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.16666666666666666s" repeatCount="indefinite"></animate>
                </rect>
            </g><g transform="rotate(300 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.08333333333333333s" repeatCount="indefinite"></animate>
                </rect>
            </g><g transform="rotate(330 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#137a4d">
                    <animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="0s" repeatCount="indefinite"></animate>
                </rect>
            </g></svg>
    </div>

    <div class="container">
 

        <div class="formLayout-title">
            <p>
                <asp:Label ID="lblVisitorMessageValue" runat="server" Text="" ClientIDMode="Static"></asp:Label>

            </p>

        </div>
        <div class="formLayout-container bb-none empdata">
            <div class="formLayout-headTitles">
                <p>بيانات مقدم الطلب</p>
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
                            <asp:Label ID="lblUserPositionText" runat="server" Text="<%$Resources:VisitRequest,VisitUserPosition %>" ClientIDMode="Static"></asp:Label>

                        </span>
                        <span>:</span>
                        <span>
                            <asp:Label ID="lblUserPositionValue" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                        </span>
                    </p>
                </div>
                <div class="col-md-3">
                    <p class="formLayout-empInfo">
                        <span class="empinfo">
                            <asp:Label ID="lblUserSectionText" runat="server" Text="<%$Resources:VisitRequest,VisitUserSection %>" ClientIDMode="Static"></asp:Label>

                        </span>
                        <span>:</span>
                        <span>
                            <asp:Label ID="lblUserSectionValue" runat="server" Text="" ClientIDMode="Static"></asp:Label>

                        </span>
                    </p>
                </div>
                <div class="col-md-3">
                    <p class="formLayout-empInfo">
                        <span class="empinfo">
                            <asp:Label ID="lblUserDepartmentText" runat="server" Text="<%$Resources:VisitRequest,VisitUserDepartment %>" ClientIDMode="Static"></asp:Label>
                        </span>
                        <span>:</span>
                        <span>
                            <asp:Label ID="lblUserDepartmentValue" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                        </span>
                    </p>
                </div>



            </div>


        </div>

        <div class="formLayout-container">
            <div class="formLayout-headTitles">
                <p>بيانات الزيارة</p>
            </div>

            <p>
                <asp:Label ID="lblVisitorMessageText" runat="server" Text="<%$Resources:VisitRequest,VisitMessage %>" ClientIDMode="Static"></asp:Label>
            </p>
            <form>

                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group ">
                            <label class="col-form-label">
                                <asp:Label ID="lblVisitStartDate" runat="server" Text="<%$Resources:VisitRequest,VisitStartDate %>" ClientIDMode="Static"></asp:Label>

                            </label>
                            <asp:TextBox ID="txtVisitStartDate" required="required" MaxLength="15" CssClass="form-control textPicker" runat="server" ClientIDMode="Static" autocomplete="off"></asp:TextBox>
                            <label class="daytext"></label>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group ">
                            <label class="col-form-label">
                                <asp:Label ID="lblVisitEndDate" runat="server" Text="<%$Resources:VisitRequest,VisitEndDate %>" ClientIDMode="Static"></asp:Label>
                            </label>
                            <asp:TextBox ID="txtVisitEndDate" required="required" MaxLength="15" CssClass="form-control textPicker" runat="server" ClientIDMode="Static" autocomplete="off"></asp:TextBox>
                            <label class="daytext"></label>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group ">
                            <label class="col-form-label">
                                <asp:Label ID="lblVisitReason" runat="server" Text="<%$Resources:VisitRequest,VisitReason %>" ClientIDMode="Static"></asp:Label>
                            </label>
                            <asp:DropDownList ID="ddlVisitReason" required="required" runat="server" CssClass="form-control " ClientIDMode="Static"></asp:DropDownList>
                        </div>

                    </div>
                  
            </form>


        </div>


        <div class="formLayout-container">
            <div class="formLayout-headTitles">
                <p>بيانات  الزوار</p>
            </div>

            <p class="formLayout-title">
                <asp:Label ID="lblVisitorsList" runat="server" Text="<%$Resources:VisitRequest,Visitors %>" ClientIDMode="Static"></asp:Label>
            </p>
            <div class="l-addvisitor add-visitor">
                <button id="AddVisitorBTN" class="btn btn-apply hvr-shutter-out-horizontal" tabindex="1">+ اضف زائر آخر</button>
            </div>
            <div class="request-visitors">
                <div class=" visitorRow">

                    <div class=" visitorRowData">
                        <div class="row">

                            <div class=" col-md-3">
                                <div class="form-group ">
                                    <label class="col-form-label">
                                        <asp:Label ID="lblVisitorName" runat="server" Text="<%$Resources:VisitRequest,PersonName %>" ClientIDMode="Static"></asp:Label>
                                    </label>
                                    <asp:TextBox ID="txtVisitorName" MaxLength="60" required="required" runat="server" ClientIDMode="Static" CssClass="visitor-Name form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group ">
                                    <label class="col-form-label">
                                        <asp:Label ID="lblVisitorNationality" runat="server" Text="<%$Resources:VisitRequest,Nationality %>" ClientIDMode="Static"></asp:Label>
                                    </label>
                                    <asp:DropDownList ID="ddlVisitorNationalities" required="required" runat="server" ClientIDMode="Static" CssClass="visitor-Nationality form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <div class=" col-md-2">
                                <div class="form-group ">
                                    <label class="col-form-label">
                                        <asp:Label ID="lblVisitorIdentityType" runat="server" Text="<%$Resources:VisitRequest,IdentityType %>" ClientIDMode="Static"></asp:Label>
                                    </label>
                                    <asp:DropDownList ID="ddlVisitorIdentityTypes" required="required" runat="server" ClientIDMode="Static" CssClass="visitor-IdentityType form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group ">
                                    <label class="col-form-label">
                                        <asp:Label ID="lblVisitorIdentityNumber" runat="server" Text="<%$Resources:VisitRequest,IdentityNumber %>" ClientIDMode="Static"></asp:Label>
                                    </label>
                                    <asp:TextBox ID="txtVisitorIdentityNumber" required="required" MaxLength="15" runat="server" ClientIDMode="Static" CssClass="visitor-IdentityNumber form-control" onkeypress="javascript:return isNumber(event)"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group ">
                                    <label class="col-form-label">
                                        <asp:Label ID="lblVisitorWorkingPlace" runat="server" Text="<%$Resources:VisitRequest,WorkingPlace %>" ClientIDMode="Static"></asp:Label>
                                    </label>
                                    <asp:TextBox ID="txtVisitorWorkingPlace" required="required" MaxLength="60" runat="server" ClientIDMode="Static" CssClass="visitor-WorkingPlace form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-1">
                                <div class="form-group ">
                                    <label class="col-form-label">
                                        <asp:Label ID="lblVisitorVisitTime" runat="server" Text="<%$Resources:VisitRequest,VisitTime %>" ClientIDMode="Static"></asp:Label>
                                    </label>
                                    <asp:TextBox ID="txtVisitorVisitTime" autocomplete="off" required="required" MaxLength="25" runat="server" ClientIDMode="Static" CssClass="visitor-VisitTime form-control timepicker" placeholder="00:00"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="visitor-row-devices">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="addDevice">
                                    <button class="AddDeviceBTN btn btn-apply hvr-shutter-out-horizontal" tabindex="1">+الأجهزة المرفقة  </button>
                                </div>
                            </div>
                            <div class="col-md-2 hidden-cols">

                                <label class="col-form-label">
                                    <asp:Label ID="lblDeviceType" runat="server" Text="<%$Resources:VisitRequest,DeviceType %>" ClientIDMode="Static"></asp:Label>
                                </label>

                            </div>
                            <div class="col-md-2 hidden-cols">

                                <label class="col-form-label">
                                    <asp:Label ID="lblDeviceNumber" runat="server" Text="<%$Resources:VisitRequest,DeviceNumber %>" ClientIDMode="Static"></asp:Label>
                                </label>

                            </div>
                            <div class="col-md-2 hidden-cols">

                                <label class="col-form-label">
                                    <!-- <asp:Label ID="lblManufacturingCompanyName" runat="server" Text="<%$Resources:VisitRequest,ManufacturingCompanyName %>" ClientIDMode="Static"></asp:Label> -->
                                    <span>الشركة المصنعة</span>
                                </label>

                            </div>
                            <div class="col-md-2 hidden-cols">

                                <label class="col-form-label">
                                    <asp:Label ID="lblNotesAboutDevice" runat="server" Text="<%$Resources:VisitRequest,NotesAboutDevice %>" ClientIDMode="Static"></asp:Label>
                                </label>

                            </div>
                        </div>


                    </div>
                </div>


            </div>
        </div>

    </div>
    <div class="container">
        <div class="form-row">

            <div class="form-group col-md-12">

                <button type="button" class="btn preview-btn" id="btnPreview">
                    <asp:Literal runat="server" ID="ltrPreview" Text="<%$Resources:VisitRequest,RequestPreview %>"></asp:Literal>
                </button>

                <button type="button" class="btn preview-btn send-btn" id="btnSend">
                    <asp:Literal runat="server" ID="ltrSend" Text="<%$Resources:VisitRequest,RequestSend %>"></asp:Literal>
                </button>

                <!-- <button id="btnReset">Reset form</button> -->

            </div>
        </div>
    </div>

</div>

<br />


<!-- Modal -->



<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered formLayout-model" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <p class="modal-title" id="exampleModalLongTitle">طلب زيارة</p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p class="welcome">
                    <span id="visitMessageTitle"></span>

                </p>
                <p class="request-msg">
                    رسالة الطلب

                </p>
                <div class="visitinfo">
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label class="col-form-label">تاريخ بداية الزيارة </label>
                            <span id="visitStartDatePreview" class="info-data"></span>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-form-label">تاريخ نهاية الزيارة </label>
                            <span id="visitEndDatePreview" class="info-data"></span>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="col-form-label">الغرض من الزيارة </label>
                            <span id="visitReasonPreview" class="info-data"></span>
                        </div>
                          <div class="form-group col-md-4">
                            <label class="col-form-label">2الغرض من الزيارة </label>
                            <span id="visitReasonPreview2" class="info-data"></span>
                        </div>
                        
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label class="col-form-label">إسم مقدم الطلب </label>
                        <span id="applicantNamePreview" class="info-data"></span>
                    </div>
                    <div class="form-group col-md-3">
                        <label class="col-form-label">المرتبة </label>
                        <span id="applicantTitlePreview" class="info-data"></span>
                    </div>
                    <div class="form-group col-md-3">
                        <label class="col-form-label">القسم </label>
                        <span id="applicantSectionPreview" class="info-data"></span>
                    </div>
                    <div class="form-group col-md-3">
                        <label class="col-form-label">الإدارة </label>
                        <span id="applicantDepartmentPreview" class="info-data"></span>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-md-12">
                        <p class="welcome">الأشخاص المطلوب لهم الزيارة</p>
                    </div>
                </div>
                <!-- <div class="visitors-list">
                        <div class="form-row">
                                <div class="form-group col-md-3">
                                        <label class="col-form-label"> 
                                                <asp:Label ID="NameLabel" runat="server" Text="<%$Resources:VisitRequest,PersonName %>" ClientIDMode="Static"></asp:Label>
                                                </label>
                                                </div>
                                                <div class="form-group col-md-2">
                                        <label class="col-form-label"> 
                                                <asp:Label ID="NationalityLabel" runat="server" Text="<%$Resources:VisitRequest,Nationality %>" ClientIDMode="Static"></asp:Label>
                                                </label>
                               </div>
                               <div class="form-group col-md-2">
                                        <label class="col-form-label"> 
                                                <asp:Label ID="IdentityTypeLabel" runat="server" Text="<%$Resources:VisitRequest,IdentityType %>" ClientIDMode="Static"></asp:Label>
                                </label>
                                </div>
                                <div class="form-group col-md-2">
                                        <label class="col-form-label"> 
                                                <asp:Label ID="IdentityNumberLabel" runat="server" Text="<%$Resources:VisitRequest,IdentityNumber %>" ClientIDMode="Static"></asp:Label>
                                        </label>
                                 </div>
                                 <div class="form-group col-md-2">
                                        <label class="col-form-label"> 
                                                <asp:Label ID="WorkingPlaceLabel" runat="server" Text="<%$Resources:VisitRequest,WorkingPlace %>" ClientIDMode="Static"></asp:Label>
                                                     </label>
                                  </div>
                                  <div class="form-group col-md-1">
                                        <label class="col-form-label"> 
                                                <asp:Label ID="VisitTimeLabel" runat="server" Text="<%$Resources:VisitRequest,VisitTime %>" ClientIDMode="Static"></asp:Label>
                                            </label>
                                            </div>
                            </div>
                 </div> -->


                <div class="request-visitors-review">
                    <div class="form-group col-6 col-md-3">

                        <asp:Label ID="Label1" runat="server" class="info-data" Text="<%$Resources:VisitRequest,PersonName %>" ClientIDMode="Static"></asp:Label>

                    </div>
                    <div class="form-group col-6 col-md-2">

                        <asp:Label ID="Label2" runat="server" class="info-data" Text="<%$Resources:VisitRequest,Nationality %>" ClientIDMode="Static"></asp:Label>
                    </div>
                    <div class="form-group col-6 col-md-2">

                        <asp:Label ID="Label3" runat="server" class="info-data" Text="<%$Resources:VisitRequest,IdentityType %>" ClientIDMode="Static"></asp:Label>
                    </div>
                    <div class="form-group col-6 col-md-2">

                        <asp:Label ID="Label4" runat="server" class="info-data" Text="<%$Resources:VisitRequest,IdentityNumber %>" ClientIDMode="Static"></asp:Label>
                    </div>
                    <div class="form-group col-6 col-md-2">

                        <asp:Label ID="Label5" runat="server" class="info-data" Text="<%$Resources:VisitRequest,WorkingPlace %>" ClientIDMode="Static"></asp:Label>
                    </div>

                    <div class="form-group col-6 col-md-1">

                        <asp:Label ID="Label6" runat="server" class="info-data" Text="<%$Resources:VisitRequest,VisitTime %>" ClientIDMode="Static"></asp:Label>
                    </div>

                </div>

            </div>
            <div class="modal-footer">
                <button type="button" id="btnSendRequestFromPreview" class="btn preview-btn" data-toggle="modal" data-target="#exampleModalCenter">إرسال</button>
                <button type="button" class="btn preview-btn send-btn" data-dismiss="modal">إغلاق</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="sendModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered formLayout-modelSend" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <p class="modal-title" id="exampleModalLongTitle">ارسال طلب زيارة</p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p id="MsgID">تم ارسال طلبك بنجاح</p>
            </div>

        </div>

    </div>

</div>
<script type="text/javascript">
    $(".hidden-cols").hide();
    $(".loader").hide();
    $(".overlay").hide();

    var apiRootAddress = "http://41.33.222.130/ModApi/api/";
    var listSiteURL = "testCT";

    $(function () {

        $(document).on("blur", "[required]", function () {
            $(this).next("span").remove();
            if ($(this).val().trim() === '') {
                $(this).after('<span class="text-danger">يجب إدخال قيمة لهذا الحقل</span>');
            }
            else {
                $(this).next("span").remove();
            }

        });

        $(document).on("change", "[required]", function (e) {
            $(this).next("span").remove();
            if ($(this).val().trim() !== '') {
                $(this).next("span").remove();
            }
        });

        $(document).on("click", ".ui-corner-all", function (e) {
            $(".visitor-VisitTime").next("span").remove();
            if ($(".visitor-VisitTime").val().trim() !== '') {
                $(".visitor-VisitTime").next("span").remove();
            }
        });

        $(document).on("blur", "#txtVisitStartDate, #txtVisitEndDate", function () {
            validateVisitDates($(this));
        });

        $(document).on("change", "#txtVisitStartDate, #txtVisitEndDate", function (e) {
            validateVisitDates($(this));
        });

        getWFMessage('visit');
        var siteUrl = '/modwf/Services';
        function getWFMessage(wfType) {
            $.ajax({
                url: _spPageContextInfo.siteAbsoluteUrl + "/Services/_api/Web/Lists/GetByTitle('WFMessages')/items?$select=Id,Title, Message&$filter=substringof('" + wfType + "', Title)",
                type: "GET",
                headers: { "Accept": "application/json;odata=verbose" },
                cache: false,

                success: function (data) {
                    if (data != null && data.d != null && data.d.results != null && data.d.results[0] != null) {
                        $("#lblVisitorMessageValue").text(data.d.results[0]["Message"]);
                    }
                },
                error: function (data) {
                    console.log('data.responseJSON.error', data.responseJSON.error);
                    alert(data.responseJSON.error);
                }
            });
        }

        var devicesContainer = $('.request-devices');

        $("#btnPreview").click(function (event) {
            event.preventDefault();

            if (!isFormValid()) {
                return;
            }

            $("#visitMessageTitle").text($("#lblVisitorMessageValue").text());
            $("#visitStartDatePreview").text($("#txtVisitStartDate").val());
            $("#visitEndDatePreview").text($("#txtVisitEndDate").val());
            $("#visitReasonPreview").text($("#ddlVisitReason option:selected").text());
            $("#visitReasonPreview2").text($("#myName").val());

            $("#applicantNamePreview").text($("#lblRequestUserNameValue").text());
            $("#applicantTitlePreview").text($("#lblUserPositionValue").text());
            $("#applicantSectionPreview").text($("#lblUserSectionValue").text());
            $("#applicantDepartmentPreview").text($("#lblUserDepartmentValue").text());


            var visitorsCount = $(".visitorRow").length;
            var deviceCount = 0;

            $(".request-visitors-review").empty();

            for (var i = 0; i < visitorsCount; i++) {

                var elem = document.createElement("tr");
                elem.classList.add("form-row", "reviewCol");

                var visitorRowBody = '';


                visitorRowBody += '<div class="form-group info-data visitor-name col-md-10 ">';

                visitorRowBody += $(".visitorRow:eq(" + i + ") .visitor-Name").val();
                visitorRowBody += '</div>';

                visitorRowBody += '<div class="form-group info-data  dateTime col-md-2 ">';
                visitorRowBody += '<p class="dateTime-label">وقت الزيارة</p>';
                visitorRowBody += $(".visitorRow:eq(" + i + ") .visitor-VisitTime").val();
                visitorRowBody += '</div>';
                visitorRowBody += '<div class="form-group info-data col-md-4 ">';
                visitorRowBody += '<span class="nation-icon"></span>';
                visitorRowBody += $(".visitorRow:eq(" + i + ") .visitor-Nationality option:selected").text();

                visitorRowBody += '</div>';



                visitorRowBody += '<div class="form-group info-data col-md-4 ">';
                visitorRowBody += '<span class="ID-icon"></span>';
                visitorRowBody += '<span style="display: inline-block">';
                visitorRowBody += '<p>';
                visitorRowBody += $(".visitorRow:eq(" + i + ") .visitor-IdentityNumber").val();
                visitorRowBody += '</p>';
                visitorRowBody += '<p>';
                visitorRowBody += $(".visitorRow:eq(" + i + ") .visitor-IdentityType option:selected").text();
                visitorRowBody += '</p>';
                visitorRowBody += '</span >';
                visitorRowBody += '</div>';

                visitorRowBody += '<div class="form-group info-data col-md-4">';
                visitorRowBody += '<span class="work-icon"></span>';
                visitorRowBody += $(".visitorRow:eq(" + i + ") .visitor-WorkingPlace").val();
                visitorRowBody += '</div>';



                //End of form-row visitorRowData



                visitorRowBody += '<div class="visitor-row-dev">';

                visitorRowBody += '<div class="form-row">';

                visitorRowBody += '<div class="form-group col-md-12 welcome devices">';
                visitorRowBody += 'الأجهزة المرفقة';
                visitorRowBody += '</div>';

                visitorRowBody += '</div >';




                deviceCount = $(".visitorRow:eq(" + i + ") .deviceRow").length;
                if (deviceCount > 0) {
                    for (var j = 0; j < deviceCount; j++) {
                        visitorRowBody += '<div class="form-row devices">';

                        visitorRowBody += '<div class="form-group col-md-3">';
                        visitorRowBody += $(".visitorRow:eq(" + i + ") .deviceRow:eq(" + j + ") .device-DeviceType").val();
                        visitorRowBody += '</div>';

                        visitorRowBody += '<div class="form-group col-md-3">';
                        visitorRowBody += $(".visitorRow:eq(" + i + ") .deviceRow:eq(" + j + ") .device-DeviceNumber").val();
                        visitorRowBody += '</div>';

                        visitorRowBody += '<div class="form-group col-md-3">';
                        visitorRowBody += $(".visitorRow:eq(" + i + ") .deviceRow:eq(" + j + ") .device-ManufacturingCompanyName").val();
                        visitorRowBody += '</div>';

                        visitorRowBody += '<div class="form-group col-md-3">';
                        visitorRowBody += $(".visitorRow:eq(" + i + ") .deviceRow:eq(" + j + ") .device-NotesAboutDevice").val();
                        visitorRowBody += '</div>';

                        visitorRowBody += '</div>';
                    }
                }
                else {
                    visitorRowBody += '<p class="welcome" >لا يوجد اجهزة للزائر</p>';
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

        $("#btnSendRequestFromPreview").click(function (event) {
            event.preventDefault();
            sendRequest();
            $('#myModal').modal("hide");
        });

        //Devices
        //Add & delete device button
        $(document).on("click", ".visitor-row-devices", function (event) {

            if (
                event.target &&
                event.target.nodeName === "BUTTON" &&
                event.target.classList.contains("AddDeviceBTN")
            ) {
                $(".hidden-cols").show();
                event.preventDefault();
                event.target.parentElement.parentElement.parentElement.append(RenderNewDevice());
            }

            //Remove device button
            if (
                event.target &&
                event.target.nodeName === "BUTTON" &&
                event.target.classList.contains("request-deleteDevice")
            ) {
                event.preventDefault();
                event.target.parentElement.parentElement.remove();
            }

        });

        var RenderNewDevice = function () {
            var elem = document.createElement("div");
            elem.classList.add("deviceRow");


            var deviceRowBody = '';


            deviceRowBody += '<div class="row">';
            deviceRowBody += '<div class="form-group col-md-3" style="visibility:hidden"><input type="text" class=" form-control" /></div>';
            deviceRowBody += '<div class="form-group col-md-2">';
            deviceRowBody += '<input type="text" required="required" maxlength="25" class="device-DeviceType form-control" />';
            deviceRowBody += '</div>';

            deviceRowBody += '<div class="form-group col-md-2">';
            deviceRowBody += '<input type="text" required="required" maxlength="25" class="device-DeviceNumber form-control" />';
            deviceRowBody += '</div>';

            deviceRowBody += '<div class="form-group col-md-2">';
            deviceRowBody += '<input type="text" required="required" maxlength="25" class="device-ManufacturingCompanyName form-control" />';
            deviceRowBody += '</div>';


            deviceRowBody += '<div class="form-group col-md-2">';
            deviceRowBody += '<textarea required="required" maxlength="40" class="device-NotesAboutDevice form-control"></textarea>';
            deviceRowBody += '</div>';
            deviceRowBody += '</div>';

            deviceRowBody += '<div class="delete-row">';
            deviceRowBody += '<button  class="request-deleteDevice btn  hvr-shutter-out-horizontal" title="delete"> - </button>';
            deviceRowBody += '</div>';
            elem.innerHTML = deviceRowBody;
            return elem;
        };

        //Visitors
        //Add button
        $("#AddVisitorBTN").on("click", function (event) {
            event.preventDefault();
            visitorsContainer.append(RenderNewVisitor());
            $('.timepicker').timepicker({
                timeFormat: 'h:mm p',
                interval: 30,
                minTime: '10',
                maxTime: '6:00pm',
                defaultTime: '00',
                startTime: '10:00',
                dynamic: false,
                dropdown: true,
                scrollbar: true
            });
        });

        var visitorsContainer = $('.request-visitors');
        //Visitors 
        var RenderNewVisitor = function () {

            var elem = document.createElement("div");
            elem.classList.add("visitorRow");
            // elem.classList.add("form-row");

            var visitorRowBody = '';
            visitorRowBody = `<div class="row visitorRowData">
            <div class="form-group col-md-3">
             <label class="col-form-label">الإسم</label>
             <input type="text" required="required" maxlength="60" class="visitor-Name form-control" />
             </div>

             <div class="form-group col-md-2">
             <label class="col-form-label">الجنسية</label>
            <select required="required" class="visitor-Nationality form-control">
            <option value="">اختر</option>`
            nationalitiesData.forEach(function (item) {
                visitorRowBody += '<option value="' + item.ID + '" >' + item.Title + '</option>';
            });

            visitorRowBody += '</select>';
            visitorRowBody += '</div>';


            visitorRowBody += '<div class="form-group col-md-2">';
            visitorRowBody += '<label class="col-form-label">نوع الهوية</label>';
            visitorRowBody += '<select required="required" class="visitor-IdentityType form-control">'
            visitorRowBody += '<option value="">اختر</option>';
            identityTypesData.forEach(function (item) {
                visitorRowBody += '<option value="' + item.ID + '" >' + item.Title + '</option>';
            });
            visitorRowBody += '</select>';
            visitorRowBody += '</div>';

            visitorRowBody += '<div class="form-group col-md-2">';
            visitorRowBody += '<label class="col-form-label">رقم الهوية</label>';
            visitorRowBody += '<input required="required" type="text" maxlength="15" class="visitor-IdentityNumber form-control"  onkeypress="javascript:return isNumber(event)"/>';
            visitorRowBody += '</div>';

            visitorRowBody += '<div class="form-group col-md-2">';
            visitorRowBody += '<label class="col-form-label">جهة العمل</label>';
            visitorRowBody += '<input type="text" required="required" maxlength="60" class="visitor-WorkingPlace form-control" />';
            visitorRowBody += '</div>';


            visitorRowBody += '<div class="form-group col-md-1">';
            visitorRowBody += '<label class="col-form-label">وقت الزيارة</label>';
            visitorRowBody += '<input type="text" autocomplete="off" required="required" class="visitor-VisitTime form-control timepicker" />';
            visitorRowBody += '</div>';

            //End of form-row visitorRowData
            visitorRowBody += '</div>';
            visitorRowBody += '<div class=" delete-row delete-visitor">';
            visitorRowBody += '<button  class="request-deleteVisitor btn  hvr-shutter-out-horizontal" title="delete"> - </button>';
            visitorRowBody += '</div>';

            visitorRowBody += '<div class="visitor-row-devices">';

            visitorRowBody += '<div class="form-row">';

            visitorRowBody += '<div class="l-addDevice col-md-2">'
            visitorRowBody += '<button class="AddDeviceBTN btn btn-apply hvr-shutter-out-horizontal" tabindex="1">+ الأجهزة المرفقة </button>'
            visitorRowBody += '</div>';
            visitorRowBody += '</div >';

            visitorRowBody += '</div>';

            elem.innerHTML = visitorRowBody;
            return elem;
        };

        //Delete visitor
        $('.request-visitors').on("click", function (event) {
            if (
                event.target &&
                event.target.nodeName === "BUTTON" &&
                event.target.classList.contains("request-deleteVisitor")
            ) {
                event.preventDefault();
                event.target.parentElement.parentElement.remove()
            }
        });

        function validateVisitDates(dateElement) {
            var isValid = true;
            if (dateElement != null && dateElement.val() != "") {
                var elementDateConverted = HijriJS.toGregorian(dateElement.val(), "/");
                elementDateConverted.setMonth(elementDateConverted.getMonth() - 1);
                if (elementDateConverted.setDate(elementDateConverted.getDate() + 1) < new Date()) {
                    dateElement.next("span.text-danger").remove();
                    dateElement.after('<span class="text-danger">لايمكن إدخال طلبات بتاريخ قديم</span>');
                    return false;
                } else {
                    dateElement.next("span.text-danger").remove();
                }
            }

            var visitStartDate = $("#txtVisitStartDate").val();
            var visitEndDate = $("#txtVisitEndDate").val();

            if (visitStartDate != "" && visitEndDate != "") {
                var startDateConverted = HijriJS.toGregorian($("#txtVisitStartDate").val(), "/");
                startDateConverted.setMonth(startDateConverted.getMonth() - 1);
                var endDateConverted = HijriJS.toGregorian($("#txtVisitEndDate").val(), "/");
                endDateConverted.setMonth(endDateConverted.getMonth() - 1);

                if (startDateConverted.setDate(startDateConverted.getDate() + 1) < new Date()) {
                    $("#txtVisitStartDate").next("span.text-danger").remove();
                    $("#txtVisitStartDate").after('<span class="text-danger">لايمكن إدخال طلبات بتاريخ قديم</span>');
                    return false;
                }

                if (endDateConverted.setDate(endDateConverted.getDate() + 1) < new Date()) {
                    $("#txtVisitEndDate").next("span.text-danger").remove();
                    $("#txtVisitEndDate").after('<span class="text-danger">لايمكن إدخال طلبات بتاريخ قديم</span>');
                    return false;
                }

                $("#txtVisitStartDate, #txtVisitEndDate").next("span.text-danger").remove();
                if (startDateConverted > endDateConverted) {
                    $("#txtVisitEndDate").after('<span class="text-danger">تاريخ بداية الزيارة يجب أن يكون أقل من تاريخ نهاية الزيارة</span>');
                    isValid = false;
                }
                else {
                    $("#txtVisitStartDate,#txtVisitEndDate").next("span.text-danger").remove();
                }
            }

            return isValid;
        }

        function isFormValid() {
            var isFormValid = true;

            for (var i = 0; i < $("[required]").length; i++) {
                $("[required]:eq(" + i + ")").next("span").remove();

                if ($("[required]:eq(" + i + ")").val() === '') {
                    $("[required]:eq(" + i + ")").after("<span class='text-danger'>يجب إدخال قيمة لهذا الحقل</span>");

                    isFormValid = false;
                }
            }

            var isVisitDatesValid = validateVisitDates(null);
            if (!isVisitDatesValid) {
                isFormValid = false;
            }

            return isFormValid;
        }

        $("#btnSend").on("click", function (event) {
            event.preventDefault();
            sendRequest();
        });

        function sendRequest() {
            if (!isFormValid()) {
                return;
            }

            var requestObject =
            {
                VisitMessage: "",
                VisitStartDate: "",
                VisitEndDate: "",
                VisitReason: "",
                UserName: "",
                ApplicantRank: "",
                ApplicantAdministration: "",
                ApplicantSection: "",
                ISDeleted: "",
                VisitPersons: []
            };

            var visitor = {
                PersonName: "",
                Nationality: "",
                IdentityType: "",
                IdentityNumber: "",
                WorkingPlace: "",
                VisitTime: "",
                IsDeleted: false,
                VisitDevices: []
            };

            var device = {
                DeviceType: "",
                DeviceNumber: "",
                ManufacturingCompanyName: "",
                NotesAboutDevice: "",
                IsDeleted: false,
            };
            $(".overlay").show();
            $(".loader").show();
            requestObject.VisitMessage = $("#lblVisitorMessageValue").text();
            var startDateConverted = HijriJS.toGregorian($("#txtVisitStartDate").val(), "/");
            startDateConverted.setMonth(startDateConverted.getMonth() - 1);
            requestObject.VisitStartDate = startDateConverted;
            var endDateConverted = HijriJS.toGregorian($("#txtVisitEndDate").val(), "/");
            endDateConverted.setMonth(endDateConverted.getMonth() - 1);
            requestObject.VisitEndDate = endDateConverted;
            requestObject.VisitReason = $("#ddlVisitReason").val();
            requestObject.UserName = $("#lblRequestUserNameValue").text();
            requestObject.ApplicantRank = $("#lblUserPositionValue").text();
            requestObject.ApplicantSection = $("#lblUserSectionValue").text();
            requestObject.ApplicantAdministration = $("#lblUserDepartmentValue").text();
            requestObject.ISDeleted = false;


            var visitorsCount = $(".visitorRow").length;
            var deviceCount = 0;

            requestObject.VisitPersons = [];
            for (var i = 0; i < visitorsCount; i++) {
                visitor = {};
                visitor.PersonName = $(".visitorRow:eq(" + i + ") .visitor-Name").val();
                visitor.Nationality = $(".visitorRow:eq(" + i + ") .visitor-Nationality").val();
                visitor.IdentityType = $(".visitorRow:eq(" + i + ") .visitor-IdentityType").val();
                visitor.IdentityNumber = $(".visitorRow:eq(" + i + ") .visitor-IdentityNumber").val();
                visitor.WorkingPlace = $(".visitorRow:eq(" + i + ") .visitor-WorkingPlace").val();
                visitor.VisitTime = $(".visitorRow:eq(" + i + ") .visitor-VisitTime").val();
                visitor.IsDeleted = false;

                deviceCount = $(".visitorRow:eq(" + i + ") .deviceRow").length;
                if (deviceCount > 0) {
                    visitor.VisitDevices = [];
                    for (var j = 0; j < deviceCount; j++) {
                        device = {};
                        device.DeviceType = $(".visitorRow:eq(" + i + ") .deviceRow:eq(" + j + ") .device-DeviceType").val();
                        device.DeviceNumber = $(".visitorRow:eq(" + i + ") .deviceRow:eq(" + j + ") .device-DeviceNumber").val();
                        device.ManufacturingCompanyName = $(".visitorRow:eq(" + i + ") .deviceRow:eq(" + j + ") .device-ManufacturingCompanyName").val();
                        device.NotesAboutDevice = $(".visitorRow:eq(" + i + ") .deviceRow:eq(" + j + ") .device-NotesAboutDevice").val();
                        device.IsDeleted = false;
                        visitor.VisitDevices.push(device);
                    }
                }
                requestObject.VisitPersons.push(visitor);
            }
            postRequest(JSON.stringify(requestObject));
        }


        // Lookups data      
        var visitReasonsData = null;
        var nationalitiesData = null;
        var identityTypesData = null;
        var lookupsDataAPI$ = apiRootAddress + "VisitRequest/GetAllLookups?ListSiteUrl=" + listSiteURL;
        getDataByAPI(
            lookupsDataAPI$,
            function (data) {
                visitReasonsData = data.VisitingReasonsList;

                console.log('lookupsData', data);

                $("#ddlVisitReason").append('<option value="">اختر</option>');
                visitReasonsData.forEach(function (item) {
                    $("#ddlVisitReason").append('<option value="' + item.ID + '">' + item.Title + '</option>');
                });


                nationalitiesData = data.NationalityList;
                $("#ddlVisitorNationalities").append('<option value="">اختر</option>');
                nationalitiesData.forEach(function (item) {
                    $("#ddlVisitorNationalities").append('<option value="' + item.ID + '">' + item.Title + '</option>');
                });

                identityTypesData = data.IdentityList;
                $("#ddlVisitorIdentityTypes").append('<option value="">اختر</option>');
                identityTypesData.forEach(function (item) {
                    $("#ddlVisitorIdentityTypes").append('<option value="' + item.ID + '">' + item.Title + '</option>');
                });
            }
        );

        function resetForm() {
            $("input").val('');
            $("select").val('');
            $("div.request-visitors>.visitorRow:not(:first)").remove();
            $("div.request-visitors>.visitorRow:not(:first), .deviceRow").remove();
            $(".visitor-row-devices>.row > div:not(:first)").hide();
        }


        function postRequest(requestData) {
            var url = apiRootAddress + "VisitRequest/AddVisitRequest?ListSiteUrl=" + listSiteURL;
            $.ajax({
                url: url,
                type: 'POST',
                contentType: 'application/json',
                data: requestData,
                success: function (result) {
                    console.log('result', result)
                    if (result.statusCode == 1) {
                        $(".loader").hide();
                        $(".overlay").hide();
                        // window.location.href = "default.aspx";
                        showSendMsg("تم إرسال الطلب بنجاح");
                    }
                    else {
                        showSendMsg(result.statusMessage);
                    }
                }
                ,
                error: function (err) {

                },

                complete: function () {

                }
            });
        }



    });
    function getDataByAPI(API, callback) {
        var headers = {};
        var ajaxCall = $.ajax({
            type: 'GET',
            url: API,
            dataType: 'json',
            contentType: 'application/json;charset=utf-8',
            Accept: "application/json; charset=UTF-8",
            data: { format: 'json' },
            headers: headers,
            error: function (er) {

            },
            success: function (data, status, xhr) {
                callback(data, status, xhr);
            }
        });

        return ajaxCall;
    }



    //time picker
    function isNumber(evt) {
        var iKeyCode = (evt.which) ? evt.which : evt.keyCode
        if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57)) {
            return false;

        }

        return true;
    }

    function showSendMsg(Msg) {
        $(".daytext").text("");
        $("#MsgID").text(Msg);
        $('#sendModel').modal({ backdrop: 'static', keyboard: false });
    }

    $(document).ready(function () {
        $('.timepicker').timepicker({});

    });

    $('.timepicker').timepicker({
        timeFormat: 'h:mm p',
        interval: 30,
        minTime: '10',
        maxTime: '6:00pm',
        defaultTime: '00',
        startTime: '10:00',
        dynamic: false,
        dropdown: true,
        scrollbar: true



    });
    $('.textPicker').on('input', function () {
        if ($(this).val() == "") {
            $(this).siblings(".daytext").text(" ");

        }
    });

    $('#sendModel').on('hidden.bs.modal', function () {
        window.location.href = "default.aspx";
    })
</script>
