$(function() {
		
	/**
	 * 点击提交合同
	 */
	$("#editBtn").on("click",function(){
		var subURL = "/a/contract/stoneCarriageContractBase/save";
		var successURL = ctxPath+"/contract/stoneCarriageContractBase/form?id=";
		submitForm(subURL,successURL);
	});
	/**
	 * 流程控制
	 */
	$(document).ready(function(){
		var submitUrl = $("#submitUrl").val();
		var successUrl = $("#successUrl").val();
		actButton();
		actControl(submitUrl,successUrl, 'adjustApllyForm');
	});
	/**
	 * 供应商选定
	 */
	$("#supplier").live("change", function(){
		var url = "/a/contract/stoneCarriageContractBase/changeFromSupplier";
		changeFromSupplier(url);
	});	
	/**
	 * 上传附件
	 */
	$("#uploadAttachment").live("click",function(){
		var url ="/a/contract/stoneCarriageContractBase/upload";
		uploadAttachment(url);
	});
	//导入明细
//	$("#btnImport").click(function(){
//		$.jBox($("#importBox").html(), {title:"导入明细", buttons:{"关闭":true},
//			bottomText:"导入文件不能超过5M，仅允许导入“xls”或“xlsx”格式文件！"});
//	});
	/**
	 * 导入明细回显
	 */
	$("#btnImportSubmit").live("click", function(){
		var url = "/a/contract/stoneCarriageContractBase/importDetail";
		var fileId = "importFile";
		var html=$("#detailList").html();
		startUp.uploadReturnJson(url,fileId,function(data){
			if(data){
				$.each(data, function(idx,item){
					var tr="<tr>\
						<td class='check'>\
							<input type='checkbox'>\
						</td>\
						<td><input type='text' readonly='true' class='input60' name='seriesnumber'\
								value='"+item.seriesnumber+"'/></td>\
						<td><input type='text' readonly='true' class='input60' name='startAddr'\
								value='"+item.startAddr+"'/></td>\
						<td><input type='text' readonly='true' class='input60' name='province'\
								value='"+item.province+"'/></td>\
						<td><input type='text' readonly='true' class='input60' name='city'\
								value='"+item.city+"'/></td>\
						<td><input type='text' readonly='true' class='input110' name='pastCity'\
								value='"+item.pastCity+"'/></td>\
						<td><input type='text' readonly='true' class='input110' name='companyCity'\
								value='"+item.companyCity+"'/></td>\
						<td><input type='text' readonly='true' class='input60' name='kilometre'\
								value='"+item.kilometre+"'/></td>\
						<td><input type='text' readonly='true' class='input110' name='companyPrice'\
								value='"+item.companyPrice+"'/></td>\
						<td><input type='text' readonly='true' class='input60' name='pastPrice'\
								value='"+item.pastPrice+"'/></td>\
						<td><input type='text' readonly='true' class='input110' name='preTaxFullCarPrice'\
								value='"+item.preTaxFullCarPrice+"'/></td>\
						<td><input type='text' readonly='true' class='input110' name='afterTaxFullCarPrice'\
								value='"+item.afterTaxFullCarPrice+"'/></td>\
						<td><input type='text' readonly='true' class='input110' name='preTaxSplitPrice'\
								value='"+item.preTaxSplitPrice+"'/></td>\
						<td><input type='text' readonly='true' class='input110' name='afterTaxSplitPrice'\
								value='"+item.afterTaxSplitPrice+"'/></td>\
						<td><input type='text' readonly='true' class='input110' name='preTaxLightPrice'\
								value='"+item.preTaxLightPrice+"'/></td>\
						<td><input type='text' readonly='true' class='input110' name='afterTaxLightPrice'\
								value='"+item.afterTaxLightPrice+"'/></td>\
						<td><input type='text' readonly='true' class='input60' name='duration'\
								value='"+item.duration+"'/></td>\
						</tr>";
					html+=tr;
					});
					$("#detailList").html(html);
			}
			
		});
	});
	
});
