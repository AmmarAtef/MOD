<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MaterialsRequestDetailsWPUserControl.ascx.cs" Inherits="MaterialsRequestsWFWebparts.MaterialsRequestDetailsWP.MaterialsRequestDetailsWPUserControl" %>

<asp:HiddenField ID="hdnAPIRootURL" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hdnWFWebUrl" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hdnRequestType" runat="server" ClientIDMode="Static" />

<style type="text/css">
    input[type=text][disabled],textarea[disabled], select[disabled], .sp-peoplepicker-topLevelDisabled, .ms-inputBoxDisabled
    {
        color:#000;
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
    <div class="container">
        <div class="form-row">
            <div class="form-group col-md-12 hidden">
                <asp:Label ID="lblRequestId" runat="server" Text="" ClientIDMode="Static"></asp:Label>
            </div>
        </div>
        <div class="formLayout-title">
            <p>

                <asp:Label ID="lblVisitorMessageValue" runat="server" Text="" ClientIDMode="Static"></asp:Label>
            </p>

        </div>
        <div class="formLayout-container bb-none empdata">
            <div class="formLayout-headTitles">
                <p>
                    <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,ApplicantNameData %>">
                    </asp:Literal>
                </p>
            </div>

            <p class="formLayout-empInfo">
                <span>
                    <asp:Label ID="lblApplicantName" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                </span>
            </p>
            <div class="row">
                <div class="col-md-3">
                    <p class="formLayout-empInfo">
                        <span class="empinfo">
                            <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,Posit %>">
                            </asp:Literal>
                        </span>
                        <span>:</span>
                        <span>
                            <asp:Label ID="lblApplicantPosition" runat="server" Text="" ClientIDMode="Static">
                            </asp:Label>
                        </span>
                    </p>
                </div>
                <div class="col-md-3">
                    <p class="formLayout-empInfo">
                        <span class="empinfo">
                            <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,Section %>">
                            </asp:Literal>
                        </span>
                        <span>:</span>
                        <span>
                            <asp:Label ID="lblApplicantSection" runat="server" Text="" ClientIDMode="Static">
                            </asp:Label>

                        </span>
                    </p>
                </div>
                <div class="col-md-3">
                    <p class="formLayout-empInfo">
                        <span class="empinfo">
                            <asp:Literal runat="server" Text="<%$Resources:MaterialsRequests,Department %>">
                            </asp:Literal>
                        </span>
                        <span>:</span>
                        <span>
                            <asp:Label ID="lblApplicantDepartment" runat="server" Text="" ClientIDMode="Static">
                            </asp:Label>
                        </span>
                    </p>
                </div>
            </div>
        </div>
        <div class="formLayout-container">
            <div class="formLayout-headTitles">
                <p>
                    <asp:Label runat="server" ID="lblMatrialInfoText" ClientIDMode="Static">
                    </asp:Label>

                </p>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group ">
                        <label class="col-form-label">
                            <asp:Label runat="server" ID="lblMatrialInfoText1" ClientIDMode="Static">
                            </asp:Label>
                        </label>
                        <asp:TextBox ID="txtEntryDate" Enabled="false"
                            CssClass="form-control textPicker" runat="server" ClientIDMode="Static">
                        </asp:TextBox>
                        <label class="daytext"></label>

                    </div>
                </div>

                <div class=" col-md-3">
                    <div class="form-group ">
                        <label class="col-form-label">
                            <asp:Label runat="server" ID="lblMaterialEntryTime" ClientIDMode="Static">
                            </asp:Label>

                        </label>
                        <asp:TextBox ID="txtEntryTime" Enabled="false" runat="server"
                            ClientIDMode="Static" CssClass="form-control matrial-time timepicker"
                            placeholder="00:00"></asp:TextBox>

                    </div>
                </div>

            </div>
        </div>
        <div class="formLayout-container">
            <div class="formLayout-headTitles">
                <p>
                    <SharePoint:EncodedLiteral runat='server' Text='<%$Resources:MaterialsRequests,SupervisorInfo%>' />
                </p>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group ">
                        <label class="col-form-label">
                            <span id="lblSupervisorName">
                                <SharePoint:EncodedLiteral runat='server'
                                    Text='<%$Resources:MaterialsRequests,SupervisorName%>' />
                            </span>
                        </label>
                        <asp:TextBox ID="txtSupervisorName" Enabled="false" runat="server"
                            ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group ">
                        <label class="col-form-label">
                            <span id="lblIdentityNum">
                                <SharePoint:EncodedLiteral runat='server'
                                    Text='<%$Resources:MaterialsRequests,SupervisorID%>' />
                            </span>
                        </label>
                        <asp:TextBox ID="txtIdentityNum" Enabled="false" runat="server"
                            ClientIDMode="Static" CssClass="form-control"
                            onkeypress="javascript:return isNumber(event)"></asp:TextBox>


                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group ">
                        <label class="col-form-label">
                            <span id="lblWork">
                                <SharePoint:EncodedLiteral runat='server'
                                    Text='<%$Resources:MaterialsRequests,WorkingPlace%>' />
                            </span>
                        </label>
                        <asp:TextBox ID="txtWork" Enabled="false" runat="server"
                            ClientIDMode="Static" CssClass="form-control"></asp:TextBox>



                    </div>
                </div>

            </div>
        </div>
        <div class="formLayout-container">
            <div class="formLayout-headTitles">
                <p>
                    <SharePoint:EncodedLiteral runat='server'
                        Text='<%$Resources:MaterialsRequests,MatrialInfoTitle%>' />
                </p>
            </div>
            <p class="formLayout-title">
                <asp:Label runat="server" ID="MatrialMsg" ClientIDMode="Static">
                </asp:Label>

            </p>

            <div class="matrialcontainer">
            </div>


        </div>

    </div>


</div>

<script src="/modwf/style Library/branding/js/general/helpers.js"></script>

<script type="text/javascript">
    $(".loader").hide();
    $(".overlay").hide();
    var matrialcontainer = $('.matrialcontainer');

    var apiRootAddress = $("#hdnAPIRootURL").val();
    var listSiteUrl = $("#hdnWFWebUrl").val()
    var requestType = $("#hdnRequestType").val();
    var currentUserId = _spPageContextInfo.userId;

    $(function () {

        translatePageLabels();

        var rid = getUrlParameter('rid');
        getRequestForView(rid, apiRootAddress, function (data) {
            if (data == null) {
                $(".formLayout .container").hide();
                $(".formLayout").append("<div class='container'><p style='text-align:center;padding: 100px'>لم يتم العثور علي البيانات المطلوبة</p></div>")
                return;
            }
            request = data;
            $("#hdnRequestID").val(request.ID);
            $("#lblVisitorMessageValue").text(request.RequestMessage);
            $('.daytext').text(GetHijriDayName(request.RequestDate));
            $("#lblApplicantName").text(request.ApplicantName);
            $("#lblApplicantPosition").text(request.ApplicantRank);
            $("#lblApplicantSection").text(request.ApplicantSection);
            $("#lblApplicantDepartment").text(request.ApplicantAdministration);
            $("#txtEntryDate").val(GetHijriDate(request.RequestDate));
            $("#txtEntryTime").val(request.ActionTime);
            $("#txtSupervisorName").val(request.SupervisorName);
            $("#txtIdentityNum").val(request.IdentityNumber);
            $("#txtWork").val(request.WorkingPlace);

            request.RequestMaterials.forEach(function (item, index) {
                matrialcontainer.append(renderNewMaterial(item, index));
            });

        });
    });


    function translatePageLabels() {
        if ($("#hdnRequestType").val() == "0") {
            document.getElementById("lblMatrialInfoText").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,MtiralEntryDate	%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblMatrialInfoText1").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,MtiralEntryDate	%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblMaterialEntryTime").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,EntryTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("MatrialMsg").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests ,MatrialMsg%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
        } else {

            document.getElementById("lblMatrialInfoText").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,MtiralEntryDate	%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblMatrialInfoText1").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,MtiralEntryDate	%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("MatrialMsg").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,MatrialMsg%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
            document.getElementById("lblMaterialEntryTime").innerHTML = "<sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsExitRequests ,EntryTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";

        }
    }

    function getRequestForView(id, apiRootAddress, callback) {
        var visitReasonsDataAPI$ = apiRootAddress + "MaterialsRequest/GetMaterialsRequestDetailsForView?ListSiteUrl=" + listSiteUrl + "&CurrentUserId=" + currentUserId + "&RequestID=" + id;
        getDataByAPI(
            visitReasonsDataAPI$,
            function (data) {
                callback(data);
            }
        );
    }

    function renderNewMaterial(material, index) {
        var elem = document.createElement("div");
        elem.classList.add("visitorRow");

        var visitorRowBody = '';
        visitorRowBody += '<div class=" MatrialRowData">';
        visitorRowBody += '<div class="row">';
        visitorRowBody += '<div class=" col-md-4">';
        visitorRowBody += '<div class="form-group ">';
        visitorRowBody += "<label class='col-form-label'><sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Type%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></label>";
        visitorRowBody += '<input type="text" disabled="disabled" value="' + (material !== null ? material.MaterialName : "") + '"  class="matrial-type form-control" />';
        visitorRowBody += '</div >';
        visitorRowBody += '</div >';

        visitorRowBody += '<div class=" col-md-3">';
        visitorRowBody += '<div class="form-group ">';
        visitorRowBody += "<label class='col-form-label'><sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,Number%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></label>";
        visitorRowBody += '<input type="text" disabled="disabled" value="' + (material !== null ? material.Quantity : "") + '" class="matrial-number form-control" onkeypress="javascript:return isNumber(event)" />';
        visitorRowBody += '</div >';
        visitorRowBody += '</div >';

        visitorRowBody += '<div class=" col-md-5">';
        visitorRowBody += '<div class="form-group ">';
        visitorRowBody += "<label class='col-form-label'><sharepoint:encodedliteral runat='server' text='<%$Resources:MaterialsRequests,MatrialNotes%>' EncodeMethod='EcmaScriptStringLiteralEncode'/></label>";
        visitorRowBody += '<textarea type="text"  disabled="disabled" class="matrial-notes form-control">' + (material !== null ? material.Notes : "") + '</textarea>';
        visitorRowBody += '</div >';
        visitorRowBody += '</div >';


        visitorRowBody += '</div >';

        visitorRowBody += '</div >';

        elem.innerHTML = visitorRowBody;
        return elem;

    }
</script>
