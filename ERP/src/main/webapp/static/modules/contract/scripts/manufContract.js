$(function(){
	
	/**
	 * 点击提交合同
	 */
	$("#editBtn").on("click",function(){
		var subURL = "/a/contract/manufContractBase/save";
		var successURL = ctxPath+"/contract/manufContractBase/form?id=";
		submitForm(subURL,successURL);
	});
	/**
	 * 流程控制
	 */
	$(document).ready(function(){
		var submitUrl = "/a/contract/manufContractBase/startworkflow";
		var successUrl = "/a/contract/manufContractBase/list";
		actButton();
		actControl(submitUrl,successUrl);
	});
	/**
	 * 供应商选定
	 */
	$("#supplier").live("change", function(){
		var url = "/a/contract/manufContractBase/changeFromSupplier";
		changeFromSupplier(url);
	});	
	/**
	 * 班组选定
	 */
	$("#execution").live("change", function(){
		var url = "/a/contract/manufContractBase/changeFromSupplier";
		changeFromSupplier(url);
	});	
	/**
	 * 上传附件
	 */
	$("#uploadAttachment").live("click",function(){
		var url ="/a/contract/manufContractBase/upload";
		uploadAttachment(url);
	});
	//上传附件jbox框
//	$("#btnUpload").click(function(){
//		$.jBox($("#annexBox").html(), {title:"上传附件", buttons:{"关闭":true},
//			bottomText:""});
//	});
	
	//导入jbox框
//	$("#btnImport").click(function(){
//		$.jBox($("#importBox").html(), {title:"导入明细", buttons:{"关闭":true},
//			bottomText:"导入文件不能超过5M，仅允许导入“xls”或“xlsx”格式文件！"});
//	});
	
	
	/**
	 * 绑定数据字典下拉框
	 */
//	$("#manufList tr td>select").live("select2-opening",function(){
//		var type = this.getAttribute("tag");
//		var url ="/a/project/querydictlist?type="+type;
//		var obj =this;
//		startUp.getAsyncData(url,function(data){
//			var str =$(obj);
//			str.text("");
//			str.append("<option value='-1'>===请选择===</option>");
//			$.each(data, function(idx,item){
//				var option ="<option value='"+item.value+"'>"+item.label+"</option>";
//				str.append(option);
//			});	
//		});
//	});
	/**
	 * 下拉选择加工工艺
	 */
//	$("#manufList tr td>select[name*='manufName']").live("select2-opening",function(){
//		var url = "/a/contract/manufContractDetailPrice/findDetailPriceList";
//		var obj =this;
//		startUp.getAsyncData(url,function(data){
//			var str =$(obj);
//			str.text("");
//			str.append("<option value='-1'>===请选择===</option>");
//			$.each(data, function(idx,item){
//				var option ="<option value='"+item.manufName+"'>"+item.manufName+"</option>";
//				str.append(option);
//			});
//		});
//	});
	/**
	 * 选中加工工艺,带出工艺信息
	 */
//	$("#manufList tr td>select[name*='manufName']").live("change", function(){
//		var obj = this;
//		var manufName = $(this).val();
//		var url = "/a/contract/manufContractDetailPrice/getByManufName";
//		var da = {"name":manufName};
//		startUp.postData(url, da, function(data){
//			if(data){
//				var tr = $(obj).parents("tr");
//			    var prefix =tr.attr("list")+"["+tr.attr("index")+"].";
//		  		  $("[id='"+prefix+"manufObject']").val(data.manufObject);
//		  		  $("[id='"+prefix+"unit']").val(data.unit);
//		  		  $("[id='"+prefix+"standardPrice']").val(data.standardPrice);
//			}
//		});
//	});
	
	/**
	 * 明细column控制
	 */
	var secondType = $("#secondType").val();
	var columnCondition_1 = [29,30];
	var columnCondition_2 = [31];
	if(isInArray(secondType,columnCondition_1)){
		$("#contentTable tr>[name*='standardName']").attr("class","hide");
		//$("#contentTable tr>[name*='stoneType']").attr("class","hide");
		$("#contentTable tr>[name*='province']").attr("class","hide");
		$("#contentTable tr>[name*='size']").attr("class","hide");
	}else if(isInArray(secondType,columnCondition_2)){
		$("#contentTable tr>[name*='province']").attr("class","hide");
		$("#contentTable tr>[name*='size']").attr("class","hide");
	}else{
		$("#contentTable tr>[name*='standardName']").attr("class","hide");
		//$("#contentTable tr>[name*='stoneType']").attr("class","hide");
	}
	
	/**
	 * 导入明细,回显
	 */
	$("#btnImportSubmit").live("click", function(){
		var url = "/a/contract/manufContractBase/importDetail";
		var fileId = "importFile";
		var html=$("#detailList").html();
		startUp.uploadReturnJson(url,fileId,function(data){
			if(data){
				$.each(data, function(idx,item){
					    var tr="<tr>\
							<td class='check'>\
								<input type='checkbox'>\
							</td>\
					    	<td><input type='text' readonly='true' class='input60' name='province' value='"+item.province+"'/></td>\
							<td><input type='text' readonly='true' class='input130' name='manufName' value='"+item.manufName+"'/></td>\
							<td><input type='text' readonly='true' class='input130' name='stoneType' value='"+item.stoneType+"'/></td>\
							<td><input type='text' readonly='true' class='input130' name='standardName' value='"+item.standardName+"'/></td>\
							<td><input type='text' readonly='true' class='input130' name='size' value='"+item.size+"'/></td>\
							<td><input type='text' readonly='true' class='input130' name='manufDetail' value='"+item.manufDetail+"'/></td>\
							<td><input type='text' readonly='true' class='input60' name='unit' value='"+item.unit+"'/></td>\
							<td><input type='text' readonly='true' class='input60' name='standardPrice' value='"+item.standardPrice+"'/></td>\
							<td><input type='text' readonly='true' class='input60' name='contractPrice' value='"+item.contractPrice+"'/></td>\
							<td><input type='text' readonly='true' class='input60' name='priceDifference' value='"+item.priceDifference+"'/></td>\
							<td><input type='text' readonly='true' class='input130' name='remark' value='"+item.remark+"'/></td>\
							</tr>";
						html+=tr;
				  });
				  $("#detailList").html(html);
				  
				  if(isInArray(secondType,columnCondition_1)){
						$("#contentTable tr td>[name*='standardName']").parent().attr("class","hide");
//						$("#contentTable tr td>[name*='stoneType']").parent().attr("class","hide");
						$("#contentTable tr td>[name*='province']").parent().attr("class","hide");
						$("#contentTable tr td>[name*='size']").parent().attr("class","hide");
					}else if(isInArray(secondType,columnCondition_2)){
						$("#contentTable tr td>[name*='province']").parent().attr("class","hide");
						$("#contentTable tr td>[name*='size']").parent().attr("class","hide");
					}else{
						$("#contentTable tr td>[name*='standardName']").parent().attr("class","hide");
//						$("#contentTable tr td>[name*='stoneType']").parent().attr("class","hide");
					}
			}
			
		});
	});
	
});


