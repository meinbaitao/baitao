$(function() {
	
	/**
	 * 点击提交合同
	 */
	$("#editBtn").on("click",function(){
		var subURL = "/a/contract/accCarriageContractBase/save";
		var successURL = ctxPath+"/contract/accCarriageContractBase/form?id=";
		submitForm(subURL,successURL);
	});
	/**
	 * 流程控制
	 */
	$(document).ready(function(){
		var submitUrl = $("submitUrl").val();
		var successUrl = $("successUrl").val();
		actButton();
		actControl(submitUrl,successUrl, 'adjustApllyForm');
	});
	/**
	 * 供应商选定
	 */
	$("#supplier").live("change", function(){
		var url = "/a/contract/accCarriageContractBase/changeFromSupplier";
		changeFromSupplier(url);
	});	
	/**
	 * 上传附件
	 */
	$("#uploadAttachment").live("click",function(){
		var url ="/a/contract/accCarriageContractBase/upload";
		uploadAttachment(url);
	});
	
	
	
	//上传附件
//	$("#btnUpload").click(function(){
//		$.jBox($("#annexBox").html(), {title:"上传附件", buttons:{"关闭":true},
//			bottomText:""});
//	});
	
	//导入明细
//	$("#btnImport").click(function(){
//		$.jBox($("#importBox").html(), {title:"导入明细", buttons:{"关闭":true},
//			bottomText:"导入文件不能超过5M，仅允许导入“xls”或“xlsx”格式文件！"});
//	});
	/**
	 * 绑定数据字典下拉框
	 */
//	$("#detailPriceList tr td>select").live("select2-opening",function(){
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
	 * 导入明细,回显页面
	 */
	$("#btnImportSubmit").live("click", function(){
		var url = "/a/contract/accCarriageContractBase/importDetail";
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
						<td><input type='text' readonly='true' class='input60' name='oneToFive'\
								value='"+item.oneToFive+"'/></td>\
						<td><input type='text' readonly='true' class='input60' name='fiveToTen'\
								value='"+item.fiveToTen+"'/></td>\
						<td><input type='text' readonly='true' class='input60' name='tenToFifty'\
								value='"+item.tenToFifty+"'/></td>\
						<td><input type='text' readonly='true' class='input60' name='fiftyToTwenty'\
								value='"+item.fiftyToTwenty+"'/></td>\
						<td><input type='text' readonly='true' class='input60' name='twentyToTwentyfive'\
								value='"+item.twentyToTwentyfive+"'/></td>\
						<td><input type='text' readonly='true' class='input60' name='twentyfiveToThirty'\
								value='"+item.twentyfiveToThirty+"'/></td>\
						<td><input type='text' readonly='true' class='input60' name='thirtyToThirtyfive'\
								value='"+item.thirtyToThirtyfive+"'/></td>\
						<td><input type='text' readonly='true' class='input60' name='thirtyfiveAbove'\
								value='"+item.thirtyfiveAbove+"'/></td>\
						<td><input type='text' readonly='true' class='input60' name='uploadPrice'\
								value='"+item.uploadPrice+"'/></td>\
						<td><input type='text' readonly='true' class='input60' name='fixedPrice'\
								value='"+item.fixedPrice+"'/></td>\
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




