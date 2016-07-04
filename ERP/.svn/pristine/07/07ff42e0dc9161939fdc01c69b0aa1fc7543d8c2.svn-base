$(function(){	
	
	/**
	 * 点击添加合同
	 */
	$("#addContract").on("click",function(){
		 window.location.href=startUp.getRootPath()+"/a/contract/conYearContract/form";
	});
	/**
	 * 点击提交合同
	 */
	$("#editBtn").on("click",function(){
		$("#inputForm").submit();
	});
	$("#btnImport").click(function(){
		$.jBox($("#importBox").html(), {title:"导入数据", buttons:{"关闭":true}, 
			bottomText:"导入文件不能超过5M，仅允许导入“xls”或“xlsx”格式文件！"});
	});
	
	/**
	 * 上传附件
	 */
	$("#btnUpload").live("click",function(){
		$("#annexBox").slideToggle();
	});
	$("#uploadAttachment").live("click",function(){
		debugger
		var uploadContractId = $("#uploadContractId").val();
		var url ="/a/contract/conYearContract/upload";
		var param ={"uploadContractId":uploadContractId};
    	var fileId="file";
    	startUp.ajaxFileUpload(url,fileId,param,function(data){
    		var url ="/a/attachment/attachment/findattachlist?type="+uploadContractId;
    		startUp.getData(url,function(data){
    			var showAttach = $("#showAttach");
    			showAttach.text("");
    			$.each(data, function(idx,item){
    				var a ="<div>\
						<a id='"+item.id+"' href='"+ctx+item.attachUrl+"/download?id="+item.id+"'>"+item.name+" </a>&nbsp;&nbsp;\
				 		<span id='deleteAttach' deleteId='"+item.id+"'  class='glyphicon glyphicon-remove-circle'></span>\
				 		</div>";
			showAttach.append(a);
    			});
    		});
    	});
	});
	
	/**
	 * 删除附件
	 */
	$("#deleteAttach").live("click", function(){
		debugger
		var deleteId = this.getAttribute("deleteId");
		var url = "/a/attachment/attachment/deleteAttach?deleteId="+deleteId;
		startUp.getData(url,function(data){
			$("a#"+deleteId).parent().remove();
		});
	});
	
	/**
	 * 选择施工组,带出信息
	 */
	$("#name").live("change",function(){
		var executionName= $("#name").val();
		var url = "/a/contract/execution/getByName";
		var da = {"name":executionName};
		startUp.postData(url, da, function(data){
			if(data){
				$("#exeType").val(data.exeType);
				$("#partyBCode").val(data.code);
				  $("#exeNumber").val(data.exeNumber);
				  $("#person").val(data.person);
				  $("#personNum").val(data.personNum);
				  $("#personTel").val(data.personTel);
				  $("#bank").val(data.bank);
				  $("#bankNum").val(data.bankNum);
				  $("#bankPerson").val(data.bankPerson);
				  $("#exeRecord").val(data.exeRecord);
				  $("#exeQuality").val(data.exeQuality);
			}
		});
	});
	
	/**
	 * 选择终止日期类型
	 */
	$("#limitDate").live("change", function(){
		var limitDate = $("#limitDate").val();
		if(limitDate == "contractLimit1"){
			$("#enddate").prop("class","");
			$("#endtime").prop("class","hide");
		}
		if(limitDate == "contractLimit2"){
			$("#endtime").prop("class","");
			$("#enddate").prop("class","hide");
		}
	});
	
});


