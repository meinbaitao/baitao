$(function(){

/**
 *	工作流按钮控制,打开页面查看当前登录用户是否在流程用户组中
 */
	actButton = function (){
	    var wfId = $("#workflowid").val();
	    var wfStatus =$("#workflowstatus").val();
	    if(wfId && wfStatus){
	        $(".startWorkflow").css("display","none");
	        $("#showWorkflowImg").removeAttr("disabled");
			$("#showWorkflowAuditHistory").removeAttr("disabled");
	        $("#editBtn").attr("disabled","disabled");
	        if(wfStatus=="1" || wfStatus=="2"){

	            var url = "/a/act/access/task/direct/isCandidateUser/"+wfId;
	            startUp.postData(url,{},function(data){
	                if(!data){
	                    $("#signWorkflow").attr("disabled","disabled");
	                    var url = "/a/act/access/task/direct/isAssigneeUser/"+wfId;
	                    startUp.getData(url,function(data){

	                        if(!data){
	                            $("#okWorkflow").attr("disabled", "disabled");
	                            $("#retrunWorkflow").attr("disabled", "disabled");
	                        }else{
	                            $("#editBtn").attr("disabled","disabled");
	                            var url = "/a/act/access/task/direct/getTaskForm/"+wfId;
	                            $.ajax({
	                                url : startUp.getRootPath()+url,
	                                type : "GET",
	                                success : function(data) {
	                                    if(data){
	                                        $("#editBtn").removeAttr("disabled");
	                                        $("#okWorkflow").removeAttr("disabled");
	                                        $("#retrunWorkflow").attr("disabled", "disabled");
	                                    }else{
	                                        $("#okWorkflow").removeAttr("disabled");
	                                        $("#retrunWorkflow").removeAttr("disabled");
	                                    }
	                                }
	                            });
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
			$(".startWorkflow").css("display","block");
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
}


/**
 * 工作流控制
 */
	actControl = function(submitUrl,successUrl, originNodeId){
	
		/**
		 * 启动流程
		 */
		$("#startWorkflow").on("click",function(){
			$("#startWorkflow").attr("disabled","disabled");
			var bindingId = $("#bindingId").val();
			var url =  submitUrl+"?bindingId="+bindingId;
			startUp.getData(url,function(data){
				if(data){
					console.log(JSON.stringify(data));
					//兼容fjy自定义WFOperationResult信息形式
					if(data.message){
						window.alertx(data.message);
					}else{
						window.alertx(data);
					}
					
				}else{
					confirmx('提交成功！是否跳转列表页面.', startUp.getRootPath()+successUrl);
				}
				
//				window.alertx("提交成功！");
//				window.location.href=startUp.getRootPath()+successUrl;
			});
		});
		
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
		 * 审核通过
		 */
		$("#okWorkflow").on("click",function(){
			$("#okWorkflow").attr("disabled","disabled");
			var wfId = $("#workflowid").val();
			var wfStatus =$("#workflowstatus").val();
			var url = "/a/act/access/task/direct/complete";
			var json ='{"processInstanceId":"'+wfId+'","approval":"1","rejectBackReason":""}';
			startUp.postActData(url,json,"application/json",function(data){
				if(data==null){
					window.alertx("审核失败！");
				}else{
					window.alertx("审核成功！");
					waitTimesAndCallback(callbackWhenActionDone);
				}

			});
		});

		/**
		 * 审核驳回
		 */
		bindRejectEvent($("#retrunWorkflow"), originNodeId, callbackWhenActionDone, $("#workflowid").val());

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
		$("#signWorkflow").on("click",function(){
			$("#signWorkflow").attr("disabled","disabled");
			var wfId = $("#workflowid").val();
			var url = "/a/act/access/task/direct/claim/"+wfId;
			startUp.getData(url,function(data){
				$("#okWorkflow").removeAttr("disabled");
				$("#retrunWorkflow").removeAttr("disabled");
			});
		});
	
	}

 });


function callbackWhenActionDone(){
	window.location.href=startUp.getRootPath() + $("#successUrl").val();
}


