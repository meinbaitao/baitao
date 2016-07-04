$(function(){

	//数据筛选
    $(document).off("click","input[name*='actRadio']").on("click","input[name*='actRadio']",function(e){
    	var url=$(this).attr("attrUrl");
    	window.location.href=url;
//    	var radioVal = e.target.value;
//    	if(e.target.value==1){
//			window.location.href=startUp.getRootPath() + '/a/contract/laborDemand/findMyPurchase';
//		}else if(e.target.value==2){
//			window.location.href=startUp.getRootPath() + '/a/contract/laborDemand/findUnAuditPurchase';
//		}else if(e.target.value==3){
//			window.location.href=startUp.getRootPath() + '/a/contract/laborDemand/findAuditDonePurchase';
//		}
	});
    
	/**
	 * 合同总价下拉选
	 */
	var condition = [10,11,12];
	var fristType = $("#fristType").val();
	if(!isInArray(fristType,condition)){
		var contractPrice = ["价格合同","框架合同"];
		$("#contractPrice").select2({tags:contractPrice});
	}
	
	/**
	 * 结算方式下拉
	 */
	var settlementType = ["月结","零星付款","按进度付款"];
	$("#settlementType").select2({tags:settlementType});
	
	/**
	 * 支付方式下拉选
	 */
	var paymentType = ["银行转账","银行承兑"];
	$("#paymentType").select2({tags:paymentType});
	
	/**
	 * 发票类型下拉选
	 */
	var invoiceType = ["增值税专用发票","普通发票","建安发票","货物运输业增值税专用发票","不可开票"];
	$("#invoiceType").select2({tags:invoiceType});
	
	/**
	 * 税率下拉选
	 */
	var taxRate = ["17%","13%","11%","6%","3%","0%",];
	$("#taxRate").select2({tags:taxRate});
	
	/**
	 * 类别下拉
	 * @param parentId
	 * @param type
	 */
	var secondType = $("#secondType").val();
	findType(secondType,"thirdType");
	
	/**
	 * 表单验证
	 */
	form_validate("baseForm");
	form_validate("detailsForm");

/*	*//**
	 * 分类下拉初始化
	 *//*
	getType = function(id){
		var url = "/a/contract/contractAccountType/getById?id="+id;
		startUp.getData(url,function(data){
			$("#fristType").val(data.name);
		});
	}
	findType = function(parentId,type){
		var url ="/a/contract/contractAccountType/findTypeByParentId?parentId="+parentId;
		if(parentId){
			startUp.getAsyncData(url,function(data){
				var loaction =$("#"+type);
				loaction.text("");
//				loaction.append("<option value='-1'>===请选择===</option>");
				$.each(data, function(idx,item){
					var option ="<option value='"+item.id+"'>"+item.name+"<options/>";
					loaction.append(option);
				});
			});
		}
	}
	var fristTypeValue =$("#fristTypeValue").val();
	var secondTypeValue =$("#secondTypeValue").val();
	if(fristTypeValue){
		getType(fristTypeValue);
		findType(fristTypeValue,"secondType");
		$("#secondType").select2("val", secondTypeValue);
	}*/
	
	/**
	 * 选择供应商,确定简称,生成编号
	 */
//	$("#supplier").live("change", function(){
//		var supplierId = $("#supplier").val();
//		var contractType = $("#contractType").val();
//		var fristType = $("#fristType").val();
//		var secondType = $("#secondType").val();
//		var param = '{"partyBName":"'+supplierId+'","contractType":"'+contractType+'",\
//				"fristType":"'+fristType+'","secondType":"'+secondType+'",}';
//		startUp.postActData(url,param,"application/json; charset=utf-8", function(data){
//			$("#partyBCode").val(data.code);
//		});
//		
//	});
	
	/**
	 * 删除明细
	 */
	$("#tr_detail_del,.tr_detail_del").bind("click",function(){
		var table=table_obj(this);
		var ids="";
		var checkTr =$(table+" tbody tr td").find("input[type=checkbox]:checked");
		if(checkTr.length>0){
			checkTr.each(function(idx,item){
				ids =ids+item.value+",";
				$(this).parents("tr").remove();
			})
			if(ids){
				ids=ids.substring(0,ids.lastIndexOf(","));
				$("#delIds").val(ids);
			}
		}else{
			window.alertx("选择需要删除的行!");
		}
	});
	
	/**
	 * 单选按钮控制
	 */
	$(":radio").click(function(){
		ratioControl();
	});
	ratioControl();
	
	
	/**
	 * 上传附件
	 */
	$("#btnUpload").live("click",function(){
		$("#annexBox").slideToggle();
	});
	$("#btnImport").live("click",function(){
		$("#importBox").slideToggle();
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
	/**
	 * 结算方式可选可输入
	 */
//    $(document).ready(function () {
//    	var type = $("#settlementType").attr("tag");
//    	if(type){
//    		var url = "/a/project/querydictlist?type="+type;
//    		startUp.getAsyncData(url,function(data){
//    			var label = new Array();
//    			for(var i=0;i<data.length;i++){
//    				label[i] = data[i].label;
//    			}
//    			$("#settlementType").select2({tags:label});
//    		});
//    	}
//    });
//	$("#btnExport").click(function(){
//		top.$.jBox.confirm("确认要导出数据吗？","系统提示",function(v,h,f){
//			if(v=="ok"){
//				$("#searchForm").attr("action","${ctx}/contract/accCarriageContractBase/export");
//				$("#searchForm").submit();
//			}
//		},{buttonsFocus:1});
//		top.$('.jbox-body .jbox-icon').css('top','55px');
//	});
 });




findType = function(parentId,type){
	var url ="/a/contract/contractAccountType/findTypeByParentId?parentId="+parentId;
	var options = new Array();
	if(parentId){
		startUp.getAsyncData(url,function(data){
			$.each(data, function(idx,item){
				options.push(item.name);
			});
			$("#"+type).select2({tags:options});
		});
	}else{
		$("#"+type).select2({tags:options});
	}
}
submitForm = function (subURL,successURL){
	var jsonBase = $("#baseForm").serializeJsonObj();
	var jsonDetails = $("#detailsForm").serializeJsonObj();
	if(!$.isEmptyObject(jsonDetails)){
		if($.isArray(jsonDetails)){
			jsonBase.detailList = jsonDetails;
		}else{
			var list = new Array();
			list.push(jsonDetails);
			jsonBase.detailList = list;
		}
	}
	var jsonStr =JSON.stringify(jsonBase);
	var url=subURL;
	startUp.postActData(url,jsonStr,"application/json; charset=utf-8",function(data){
		if(data){
			window.location.href = successURL+data.id;
		}
	});
}
changeFromSupplier = function(requestURL){
	var supplierId = $("#supplier").val();
	if(typeof(supplierId) == "undefined"){
		supplierId = $("#execution").val();
	}
	var contractType = $("#contractType").val();
	var fristType = $("#fristType").val();
	var secondType = $("#secondType").val();
	var param = '{"partyBName":"'+supplierId+'","contractType":"'+contractType+'",\
			"fristType":"'+fristType+'","secondType":"'+secondType+'"}';
	startUp.postActData(requestURL,param,"application/json; charset=utf-8", function(data){
		$("#contractNo").val(data.contractNo);
		$("#partyBCode").val(data.partyBCode);
	});
}
uploadAttachment = function(requestURL){
	var uploadContractId = $("#bindingId").val();
	var param ={"uploadContractId":uploadContractId};
	var fileId="file";
	startUp.ajaxFileUpload(requestURL,fileId,param,function(data){
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
}
isInArray = function(param,Array){
	var result = false;
	$.each(Array,function(idx,item){
		if(param == item){
			result = true;
		}
	});
	return result;
}
ratioControl = function(){
	if($("#isIncludeQuality1").attr("checked") == "checked"){
		$("#qualityGuaranteePrice").removeAttr("readonly");
		$("#qualityGuaranteeWay").removeAttr("readonly");
		$("#qualityReturnWay").removeAttr("readonly");
	}
	if($("#isIncludeQuality2").attr("checked") == "checked"){
		$("#qualityGuaranteePrice").attr("readonly","true");
		$("#qualityGuaranteeWay").attr("readonly","true");
		$("#qualityReturnWay").attr("readonly","true");
	}
	if($("#isIncludeExecute1").attr("checked") == "checked"){
		$("#executeGuaranteePrice").removeAttr("readonly");
		$("#executeGuaranteeWay").removeAttr("readonly");
		$("#executeReturnWay").removeAttr("readonly");
	}
	if($("#isIncludeExecute2").attr("checked") == "checked"){
		$("#executeGuaranteePrice").attr("readonly","true");
		$("#executeGuaranteeWay").attr("readonly","true");
		$("#executeReturnWay").attr("readonly","true");
	}
}