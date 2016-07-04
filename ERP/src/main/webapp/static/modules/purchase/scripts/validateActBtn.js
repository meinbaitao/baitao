/* 流程按钮控制   */
$(function(){
	//保存数据
	$("#save").unbind("click").bind("click",function(){
//		$("#saveForm").submit();
		submitWValidLoading($("#saveForm"));
	});
	//查看流程状态
	$("#trackACT").unbind("click").bind("click",function(){
		var wfID = $("#wfID").val();
		var wfStatus = $("#wfStatus").val();
		if(parseInt(wfStatus)==4){//执行完成的流程查看历史数据
			showTraceDiagramInHistory(wfID);
		}else{//否则查看当前的流程
			showTraceDiagramInRuntime(wfID);
		}						
	});
	//提交数据（开启流程）
	$("#submitACT").unbind("click").bind("click",function(){
		var action = $("#submitACTForm").attr("action");
		$("#saveForm").attr("action",action);
//		$("#saveForm").submit();
		submitWValidLoading($("#saveForm"));
	});
	//签收任务
	$("#signACT").unbind("click").bind("click",function(){
		var input = $(this);
		var wfID = $("#wfID").val();
		//组装提交数据
		var url = "/a/act/access/task/direct/claim/"+wfID;
		startUp.postData(url,{},function(data){
			if(data){
				$("#submitACT").hide();
				$("#passACT").show();
				window.alertx("签收成功");
				input.attr("disabled","disabled");
				$("#passACT").removeAttr("disabled");
				$("#rebutACT").removeAttr("disabled");
				validateEditButton(wfID,true);
			}
		});
	});
	//提交（即流程通过，进行下一步）
	$("#passACT").unbind("click").bind("click",function(){
		$("#passACT").attr("disabled","disabled");
		$("#rebutACT").attr("disabled","disabled");
//		$("#passACTForm").submit();
		submitWValidLoading($("#passACTForm"));
	});


	/**
	 * 审核驳回
	 */
	bindRejectEvent($("#rebutACT"), 'editApplyForm', callbackWhenActionDone, $("#wfID").val());


	/**
	 * 流程轨迹
	 */
	$("#showWorkflowAuditHistory").on("click", function(){
		var wfId = $("#wfID").val();
		showFlowAuditHistoryTrace(wfId);
	});

});


function callbackWhenActionDone(){
	window.location.href = startUp.getRootPath() + '/a/purchase/purchase/purchaseGFLList';
}

//验证按钮权限
function validateBtn(wfID,wfStatus){
	validateStatus(wfStatus);
	if(wfID){
		validateSignAP(wfID);
	}
}
function validateStatus(wfStatus){
	debugger;
	if(parseInt(wfStatus)<=0||wfStatus==''){
		$("#save").removeAttr("disabled");
		$("#submitACT").removeAttr("disabled");
	}
}
//验证判断是否拥有控件的相应权限
function validateSignAP(processInstanceId){
	var url = "/a/act/access/task/direct/isCandidateUser/"+processInstanceId;
	startUp.postData(url,{},function(data){
		if(data){
			$("#signACT").removeAttr("disabled");
		}
		validateEditButton(processInstanceId,true);
	});
}
//验证驳回以及提交的按钮
function validateEditButton(processInstanceId,flag){
	if(flag){
		var url = "/a/act/access/task/direct/isAssigneeUser/"+processInstanceId;
		startUp.postData(url,{},function(data){
			if(data){
				$("#submitACT").hide();
				$("#passACT").show();
				$("#passACT").removeAttr("disabled");
				$("#rebutACT").removeAttr("disabled");
				var url = "/a/act/access/task/direct/getTaskForm/"+processInstanceId;
				$.ajax({
					url : startUp.getRootPath()+url,
					type : "GET",
					success : function(data) {
						if(data!=""&&data!=null&&data=="editApplyForm"){
							$("#processInstanceId").val(processInstanceId);
							$("#passACT").removeAttr("disabled");
							$("#save").removeAttr("disabled");
							$("#rebutACT").attr("disabled","disabled");
						}
					}
				});
			}else{
				if(processInstanceId){
					$("#submitACT").attr("disabled","disabled");
					$("#save").attr("disabled","disabled");
				}
			}
		});
	}else{
		var url = "/a/act/access/task/direct/isCandidateUser/"+processInstanceId;
		startUp.postData(url,{},function(data){
			if(data){
				var url = "/a/act/access/task/direct/isAssigneeUser/"+processInstanceId;
				startUp.postData(url,{},function(data){
					if(data){
						$("#passAP").removeAttr("disabled");
						$("#rebutAP").removeAttr("disabled");
					}
				});
			}
		});
	}
	
}
//页面加载验证按钮
$(document).ready(function() {
	var wfID = $("#wfID").val();
	var wfStatus = $("#wfStatus").val();
	validateBtn(wfID,wfStatus);
});

