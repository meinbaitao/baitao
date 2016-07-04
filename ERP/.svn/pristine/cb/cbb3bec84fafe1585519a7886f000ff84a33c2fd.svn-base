$(function() {
	
	/**
	 * 收款条款比例 可选可输入
	 */
	$(document).ready(function () {
		$("#paycollectionratio").select2({tags:[]});
    });
	
	/**
	 * 流程控制
	 */
	$(document).ready(function(){
		var submitUrl = $("#submitUrl").val();
		var successUrl = $("#successUrl").val();
		actButton();
		actControl(submitUrl,successUrl, 'contract_adjust');
	});
	
	/**
	 * 点击添加合同
	 */
	$("#addContract").on("click",function(){
		 window.location.href=startUp.getRootPath()+"/a/contract/jiaContract/form";
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
		var url ="/a/contract/jiaContract/upload";
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
		var deleteId = this.getAttribute("deleteId");
		var url = "/a/attachment/attachment/deleteAttach?deleteId="+deleteId;
		startUp.getData(url,function(data){
			$("a#"+deleteId).parent().remove();
		});
	});
	
//	/**
//	 * 二级项目联动
//	 */
//	function findBuildings(){
//		var projectId = $("#projectId").val();
//		var url = "/a/contract/jiaContract/findSubprojectById?projectId="+projectId;
//		startUp.getData(url,function(data){
//			if(data){
//				var bulidings =$("#buildings");
//				bulidings.text("");
//				$.each(data, function(idx,item){
//					var option ="<option value='"+item.building+"'>"+item.building+"</option>";
//					bulidings.append(option);
//				});
//			}
//		});
//	}
	$("#manufList tr td>select[name*='subprojectId']").live("select2-opening",function(){
		var projectId = $("#projectId").val();
		var url = "/a/contract/jiaContract/findSubprojectById?projectId="+projectId;
		var obj =this;
		startUp.getAsyncData(url,function(data){
			var str =$(obj);
			str.text("");
			$.each(data, function(idx,item){
				var option ="<option value='"+item.building+"'>"+item.buildingDisplayName+"</option>";
				str.append(option);
			});
		});
	});
//	$(document).ready(function() {
//		findBuildings();
//	});
	
});


	
