
$(function() {

    /***************石材收货审核流程start*****************/
    /**
     * 启动流程
     */
    $("#startWorkflow").on("click", function () {
        var accidentId = $("#accidentId").val();
        var auditProcess = $("#auditProcess").val();
        var url = "/a/accident/accidentManage/startWorkflow?accidentId=" + accidentId + "&auditProcess=" + auditProcess;
        startUp.getData(url, function (data) {
            if(data.code==200){
                window.alertx(data.message);
                redirectToManagementPage();
            }else{
                window.alertx(data.message);
            }
        });
    });

    /**
     * 点击查看流程图
     */
    $("#showWorkflowImg").on("click", function () {
        var wfId = $("#workflowid").val();
        var wfStatus = $("#workflowstatus").val();
        if (parseInt(wfStatus) == 4) {
            showTraceDiagramInHistory(wfId);
        } else {
            showTraceDiagramInRuntime(wfId);
        }
    });

    /**
     * 审核通过
     */
    $("#okWorkflow").on("click", function () {
        var manufactoryId = $("#manufactorySelect").val();
        if($("#manufactoryContainer").css("display")=='block' && manufactoryId == ''){
            $("#selectManufactoryHint").html("请选择加工厂");
            return false;
        }
        var wfId = $("#workflowid").val();
        var wfStatus = $("#workflowstatus").val();
        var url = "/a/accident/accidentManage/act/complete";
        var json = '{"processInstanceId":"' + wfId + '","approval":"1","rejectBackReason":"","manufactory":"'+manufactoryId+'"}';
        startUp.postActData(url, json, "application/json", function (data) {
            if(data==null){
                window.alertx("审核失败！");
            }else{
                window.alertx("审核成功！");
                redirectToManagementPage();
            }
        });

        cleanManufactoryHint();
    });


    /**
     * 审核驳回
     */
    bindRejectEvent($("#retrunWorkflow"), 'editApplyForm', redirectToManagementPage, $("#workflowid").val());


    /**
     * 流程轨迹
     */
    $("#showWorkflowAuditHistory").on("click", function(){
        var wfId = $("#workflowid").val();
        showFlowAuditHistoryTrace(wfId);
    });


    /**
     * 点击签收
     */
    $("#signWorkflow").on("click", function () {
        var wfId = $("#workflowid").val();
        var url = "/a/act/access/task/direct/claim/" + wfId;
        startUp.getData(url, function (data) {
            if(data==null){
                window.alertx("签收失败！");
            }else{
                $("#signWorkflow").attr("disabled", "disabled");
                $("#okWorkflow").removeAttr("disabled");
                $("#retrunWorkflow").removeAttr("disabled");
            }

        });
    });


    /**
     * 打开页面查看当前登录用户是否在流程用户组中
     */
    $(document).ready(function () {
        var wfId = $("#workflowid").val();
        var wfStatus = $("#workflowstatus").val();

        loading();

        if (wfId && wfStatus) {
            $("#showWorkflowImg").removeAttr("disabled");
            $("#showWorkflowAuditHistory").removeAttr("disabled");
            
            if (wfStatus == "1") {
                var url = "/a/act/access/task/direct/isAssigneeUser/" + wfId;
                startUp.syncGet(url, function (data) {
                    $(".startWorkflow").css("display", "none");
                    if(!data){
                        $("#okWorkflow").attr("disabled", "none");
                        $("#retrunWorkflow").attr("disabled", "none");
                    }else{
                        var url = "/a/act/access/task/direct/getTaskForm/" + wfId;
                        $.ajax({
                            url: startUp.getRootPath() + url,
                            type: "GET",
                            timeout : 18000,
                            async:false,
                            success: function (data) {
                                if (data && data == "editApplyForm") {
                                    $(".startWorkflow").css("display", "none");
                                    $("#editBtn").removeAttr("disabled");
                                    $("#signWorkflow").attr("disabled", "disabled");
                                    $("#retrunWorkflow").attr("disabled", "disabled");
                                    $("#okWorkflow").removeAttr("disabled");
                                } else if (data && data == "distributeManufactory") {
                                    //判断是否是运营经理审批,显示工厂选择控件
                                    var fetchAllManufactoryUrl = "/a/factory/manufPerson/findAllManufactory";
                                    $.ajax({
                                        url: startUp.getRootPath() + fetchAllManufactoryUrl,
                                        type: "GET",
                                        timeout : 18000,
                                        async:false,
                                        success: function (manuData) {
                                            $("#manufactorySelect").empty();
                                            $("#manufactorySelect").append('<option value="">--请选择加工厂--</option>');
                                            $.each(manuData, function (index, value) {
                                                $("#manufactorySelect").append('<option value="' + value.id + '">'+value.factory+'</option>');
                                            });
                                            $("#manufactoryContainer").css("display", "block");
                                            $("#okWorkflow").removeAttr("disabled");
                                            $("#retrunWorkflow").removeAttr("disabled");
                                        }
                                    });
                                }else if(data && data == "tracerAudit"){
                                    //跟单员值能通过不能驳回
                                    $("#okWorkflow").removeAttr("disabled");
                                }
                            }
                        });

                        $("#editBtn").attr("disabled", "disabled");
                    }

                    $("#editBtn").attr("disabled", "disabled");

                });
                var url = "/a/act/access/task/direct/isCandidateUser/" + wfId;
                startUp.syncGet(url, function (data) {
                    if (!data) {
                        $("#signWorkflow").attr("disabled", "disabled");
                    }
                });
            }
        } else {
            $("#signWorkflow").attr("disabled", "disabled");
            $("#showWorkflowImg").attr("disabled", "disabled");
            $("#showWorkflowAuditHistory").attr("disabled", "disabled");
            $(".startWorkflow").css("display", "none");
            var flag = $("#flag").val();
            if (flag == "edit") {
                $(".startWorkflow").css("display", "block");
            }
            $("#okWorkflow").attr("disabled", "disabled");
            $("#retrunWorkflow").attr("disabled", "disabled");
        }

        if (wfId && wfStatus == "4") {
            $("#signWorkflow").attr("disabled", "disabled");
            $("#editBtn").attr("disabled", "disabled");
            $("#okWorkflow").attr("disabled", "disabled");
            $("#retrunWorkflow").attr("disabled", "disabled");
            $(".startWorkflow").css("display", "none");
        }

        loaded();

    });

});


function cleanManufactoryHint(){
    $("#selectManufactoryHint").html("");
    $("#manufactoryContainer").css("display", "none");
    $("#manufactorySelect").empty();
}

function redirectToManagementPage(){
    var type = $("#accidentType").val();
    window.location.href = startUp.getRootPath() + "/a/accident/accidentManage/list?type="+type;
}
/***************审核流程end*****************/
