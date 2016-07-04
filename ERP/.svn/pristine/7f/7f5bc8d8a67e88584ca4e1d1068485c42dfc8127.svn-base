$(function(){
	/**
	 * 控件验证
	 */
	form_validate("inputForm");
	
	/**
	 * 新添加
	 */
	$("#addContract").on("click",function(){
		 window.location.href=ctxPath+"/contract/contractAccount/form";
	});
	
	/**
	 * 表单提交
	 */
	$("#editBtn").unbind("click").bind("click",function(){
		$("#inputForm").submit();
	});
	
	/**
	 * 分页
	 */
	function page(n,s){
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
		return false;
	}
	
	/***
	 * 分类下拉联动
	 */
	function findType(parentId,type){
		var url ="/a/contract/contractAccount/findTypeByParentId?id="+parentId;
		if(parentId){
			startUp.getAsyncData(url,function(data){
				var loaction =$("#"+type);
				loaction.text("");
//				loaction.append("<option value='-1'>===请选择===</option>");
				$.each(data, function(idx,item){
					var option ="<option value='"+item.id+"'>"+item.name+"</option>";
					loaction.append(option);
				});
			});
		}
	}
	
	/**
	 * 执行部门
	 */
	$("#department").on("select2-opening",function(){
		findType("0","department");
	});
	/**
	 * 一级类别
	 */
	$("#fristType").on("select2-opening",function(){
		var parentId =  $("#department").val();
		findType(parentId,"fristType");
	});
	/**
	 * 二级类别
	 */
	$("#secondType").on("select2-opening",function(){
		var parentId =  $("#fristType").val();
		findType(parentId,"secondType");
	});
	
	$(document).ready(function() {
		var department =$("#department").val();
		var fristType =$("#fristType").val();
		var secondType =$("#secondType").val();
		if(department && fristType && secondType){
			findType("0","department");
			findType(department,"fristType");
			findType(fristType,"secondType");
			$("#department").select2("val", department);
			$("#fristType").select2("val", fristType);
			$("#secondType").select2("val", secondType);
		}
		
	});
	
	/**
	 * 招标时间控制
	 */
	$("#isInvitation1").on("click", function(){
		var isInvitation = $("#isInvitation1").attr("checked");
		var onclick = "WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"
		if("checked" == isInvitation){
			$("#invitationDate").attr("onclick", onclick);
		} 
	});
	$("#isInvitation2").on("click", function(){
		var isInvitation = $("#isInvitation2").attr("checked");
		if("checked" == isInvitation){
			$("#invitationDate").removeAttr("onclick");
		} 
	});
	
	/** 
	 * 合同有效期判断
	 */
	$("#endDate").live("focusout", function(){
		debugger
		var endDateTemp = $("#endDate").val();
		var endDate = new Date(Date.parse(endDateTemp));
		var now = new Date();
		var nowCount = now.getTime();
		var endCount = endDate.getTime();
		var result = nowCount - endCount;
		if(result > 0){
			$("#isValid").val("是");
		}else{
			$("#isValid").val("否");
		}
	});
	
});