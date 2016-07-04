

$(function() {

/**
 * 点击查看流程图
 */
$("#showWorkflowImg").on("click",function(){
    var wfId = $("#workflowid").val();
    var wfStatus =$("#workflowstatus").val();
    if(parseInt(wfStatus)==4){
        showTraceDiagramInHistory(wfId);
    }else{
        showTraceDiagramInRuntime(wfId);
    }
});


/**
 * 流程轨迹
 */
$("#showWorkflowAuditHistory").on("click", function(){
    var wfId = $("#workflowid").val();
    showFlowAuditHistoryTrace(wfId);
});

/**
 * 审核通过
 */
$("#okWorkflow").on("click",function(){
    var wfId = $("#workflowid").val();
    var url = "/a/act/access/task/direct/complete";
    var json ='{"processInstanceId":"'+wfId+'","approval":"1","rejectBackReason":""}';
    startUp.postActData(url,json,"application/json",function(data){
        if(data==null){
            window.alertx("审核失败！");
        }else{
            window.alertx("审核成功！");
            waitTimesAndCallback(callbackWhenActionDone);	//启动成功回调函数
        }
    });
});


/**
 * 审核驳回
 * 参数：按钮Id 节点 驳回成功回调函数	流程Id
 */
bindRejectEvent($("#retrunWorkflow"), 'editApplyForm', callbackWhenActionDone, $("#workflowid").val());



/**
 * 点击签收
 */
$("#signWorkflow").on("click",function(){
    var wfId = $("#workflowid").val();
    var url = "/a/act/access/task/direct/claim/"+wfId;
    startUp.getData(url,function(data){	
        if(data==null){
            window.alertx("签收失败!");
        }else{
            $("#signWorkflow").attr("disabled","disabled");
            $("#okWorkflow").removeAttr("disabled");
            $("#retrunWorkflow").removeAttr("disabled");
        }
    });
});

//判断按钮是否可操作
calculateButtonsOperPermission();

});


/**
 * 判断按钮是否可操作
 */
function calculateButtonsOperPermission() {
    var wfId = $("#workflowid").val();
    var wfStatus =$("#workflowstatus").val();
    loading();
    if(wfId && wfStatus){ //判断流程启用
        $(".startWorkflow").css("display","none");
        $("#showWorkflowImg").removeAttr("disabled");
        $("#showWorkflowAuditHistory").removeAttr("disabled");
        $("#editBtn").attr("disabled","disabled");
        if(wfStatus=="1" || wfStatus=="2"){ //判断流程是否已经结束
            var url = "/a/act/access/task/direct/isCandidateUser/"+wfId;//调用接口判断用户是否在当前流程的当前节点的候选范围内
            startUp.syncGet(url,function(data){
                if(!data){//判断用户是否在当前流程的当前节点的候选范围内
                    $("#signWorkflow").attr("disabled","disabled");
                    var url = "/a/act/access/task/direct/isAssigneeUser/"+wfId;	//调用接口判断是否已经签收或者直接分配给了当前用户
                    startUp.syncGet(url,function(data){
                        if(data){//判断是否已经签收或者直接分配给了当前用户
                        	$("#editBtn").attr("disabled","disabled");
                            var url = "/a/act/access/task/direct/getTaskForm/"+wfId; //调用接口判断是当前流程节点：修改/审核
                            $.ajax({
                                url : startUp.getRootPath()+url,
                                type : "GET",
                                timeout : 18000,
                                async:false,
                                success : function(data) {
                                    if(data && data == 'editApplyForm'){
                                        $("#editBtn").removeAttr("disabled");
                                        $("#okWorkflow").removeAttr("disabled");
                                        $("#retrunWorkflow").attr("disabled", "disabled");
                                    }else{
                                        $("#okWorkflow").removeAttr("disabled");
                                        $("#retrunWorkflow").removeAttr("disabled");
                                    }
                                }
                            });
                        }else{
                        	$("#okWorkflow").attr("disabled", "disabled");
                            $("#retrunWorkflow").attr("disabled", "disabled");
                        }
                    });
                }else{
                    $("#signWorkflow").removeAttr("disabled");
                    $("#okWorkflow").attr("disabled", "disabled");
                    $("#retrunWorkflow").attr("disabled", "disabled");
                }
            });
        }
    }else{
        $("#signWorkflow").attr("disabled","disabled");
        $("#showWorkflowImg").attr("disabled","disabled");
        $("#showWorkflowAuditHistory").attr("disabled","disabled");
        $(".startWorkflow").css("display","none");
        var flag =$("#flag").val();
        if(flag=="edit"){
            $(".startWorkflow").css("display","block");
        }
        $("#okWorkflow").attr("disabled","disabled");
        $("#retrunWorkflow").attr("disabled","disabled");
    }
    if(wfId && wfStatus=="4"){
        $("#signWorkflow").attr("disabled","disabled");
        $("#editBtn").attr("disabled","disabled");
        $("#okWorkflow").attr("disabled","disabled");
        $("#retrunWorkflow").attr("disabled","disabled");
        $(".startWorkflow").css("display","none");
    }
    loaded();
}

