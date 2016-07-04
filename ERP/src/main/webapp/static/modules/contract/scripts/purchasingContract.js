$(function() {
	
	/**
	 * 点击提交合同
	 */
	$("#editBtn").on("click",function(){
		var subURL = "/a/contract/purchasingContractBase/save";
		var successURL = ctxPath+"/contract/purchasingContractBase/form?id=";
		submitFormX(subURL,successURL);
	});
	/**
	 * 流程控制
	 */
	$(document).ready(function(){
		var submitUrl = $("#submitUrl").val();
		var successUrl = $("#successUrl").val();
		actButton();
		actControl(submitUrl,successUrl, 'adjust_contract');
	});
	/**
	 * 供应商选定
	 */
	$("#supplier").live("change", function(){
		var url = "/a/contract/purchasingContractBase/changeFromSupplier";
		changeFromSupplier(url);
	});
	/**
	 * 上传附件
	 */
	$("#uploadAttachment").live("click",function(){
		var url ="/a/contract/purchasingContractBase/upload";
		uploadAttachment(url);
	});
	/**
	 * 导入明细
	 */
//	$("#btnImport").click(function(){
//		$.jBox($("#importBox").html(), {title:"导入明细", buttons:{"关闭":true},
//			bottomText:"导入文件不能超过5M，仅允许导入“xls”或“xlsx”格式文件！"});
//	});
	/**
	 * 绑定数据字典下拉框
	 */
//	$("#purchasingList tr td>select").live("select2-opening",function(){
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
	 * 下拉选择物料编号
	 */
//	$("#purchasingList tr td>select[name*='materielNo']").live("select2-opening",function(){
//		var url = "/a/material/material/findMaterielList";
//		var obj =this;
//		startUp.getAsyncData(url,function(data){
//			var str =$(obj);
//			str.text("");
//			str.append("<option value='-1'>===请选择===</option>");
//			$.each(data, function(idx,item){
//				var option ="<option value='"+item.seriesNumber+"'>"+item.seriesNumber+"</option>";
//				str.append(option);
//			});
//		});
//	});
	/**
	 * 选中物料编号,带出物料信息
	 */
//	$("#purchasingList tr td>select[name*='materielNo']").live("change", function(){
//		var seriesNumber = $(this).val();
//		var tr = $(this).parents("tr");
//		var url = "/a/material/material/getBySeriesNumber?seriesNumber="+seriesNumber;
//		startUp.getAsyncData(url, function(data){
//			if(data){
//				var prefix =tr.attr("list")+"["+tr.attr("index")+"].";
//		  		  $("[id='"+prefix+"materielName']").val(data.name);
//		  		  $("[id='"+prefix+"materielType']").val(data.type);
//		  		  $("[id='"+prefix+"materielSize']").val(data.model);
//		  		  $("[id='"+prefix+"materielTexture']").val(data.materia);
//		  		  $("[id='"+prefix+"unit']").val(data.unit);
//			}
//		});
//	});
	$("#tr_detail_delX").bind("click",function(){
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
				$("#delIdsX").val(ids);
			}
		}else{
			window.alertx("选择需要删除的行!");
		}
	});
	
	/**
	 * 明细column控制
	 */
	var secondType = $("#secondType").val();
	var columnCondition_1 = [21,22,26];
	var columnCondition_2 = [23,24];
	if(isInArray(secondType,columnCondition_1)){
		$("#contentTable tr>[name*='stoneType']").attr("class","hide");
		$("#contentTable tr>[name*='length']").attr("class","hide");
		$("#contentTable tr>[name*='width']").attr("class","hide");
		$("#contentTable tr>[name*='height']").attr("class","hide");
		$("#contentTable tr>[name*='materielType']").attr("class","hide");
	}else if(isInArray(secondType,columnCondition_2)){
		$("#contentTable tr>[name*='materielType']").attr("class","hide");
		$("#contentTable tr>[name*='brand']").attr("class","hide");
		$("#contentTable tr>[name*='materielSize']").attr("class","hide");
	}else{
		$("#contentTable tr>[name*='stoneType']").attr("class","hide");
		$("#contentTable tr>[name*='length']").attr("class","hide");
		$("#contentTable tr>[name*='width']").attr("class","hide");
		$("#contentTable tr>[name*='height']").attr("class","hide");
		$("#contentTable tr>[name*='brand']").attr("class","hide");
	}
	
	/**
	 * 导入明细回显
	 */
	$("#btnImportSubmit").live("click", function(){
		var url = "/a/contract/purchasingContractBase/importDetail";
		var fileId = "importFile";
		var html=$("#detailList").html();
		if(!$('#importFile').val()){
			window.alertx("请选择附件!");
			return;
		}
		startUp.uploadReturnJson(url,fileId,function(data){
			if(data){
				$.each(data, function(idx,item){
				    var tr="<tr>\
						<td class='check'>\
							<input type='checkbox'>\
						</td>\
						<td><input type='text' readonly='true' class='input110' name='materielNo'\
								 value='"+item.materielNo+"'/></td>\
						<td><input type='text' readonly='true' class='input110' name='materielName'\
								 value='"+item.materielName+"'/></td>\
						<td><input type='text' readonly='true' class='input110' name='materielType'\
								 value='"+item.materielType+"'/></td>\
						<td><input type='text' readonly='true' class='input110' name='brand'\
								 value='"+item.brand+"'/></td>\
						<td><input type='text' readonly='true' class='input110' name='stoneType'\
								 value='"+item.stoneType+"'/></td>\
						<td><input type='text' readonly='true' class='input110' name='materielSize'\
								 value='"+item.materielSize+"'/></td>\
						<td><input type='text' readonly='true' class='input60' name='length'\
								 value='"+item.length+"'/></td>\
						<td><input type='text' readonly='true' class='input60' name='width'\
								 value='"+item.width+"'/></td>\
						<td><input type='text' readonly='true' class='input60' name='height'\
								 value='"+item.height+"'/></td>\
						<td><input type='text' readonly='true' class='input60' name='unit'\
								 value='"+item.unit+"'/></td>\
						 <td class='hide'><input type='text' readonly='true' class='input60' name='isInProvince'\
								 value='"+item.isInProvince+"'/></td>\
						 <td><input type='text' readonly='true' class='input60' name='isInProvinceDpName'\
								 value='"+item.isInProvinceDpName+"'/></td>\
						<td><input type='text' readonly='true' class='input110' name='price'\
								 value='"+item.price+"'/></td>\
						<td><input type='text' readonly='true' class='input110' name='contractPrice'\
								 value='"+item.contractPrice+"'/></td>\
						<td><input type='text' readonly='true' class='input110' name='priceDifference'\
								 value='"+item.priceDifference+"'/></td>\
						<td><input type='text' readonly='true' class='input110' name='remark'\
								 value='"+item.remark+"'/></td>\
						</tr>";
					html+=tr;
				});
				$("#detailList").html(html);
				
				if(isInArray(secondType,columnCondition_1)){
					$("#contentTable tr td>[name*='stoneType']").parent().attr("class","hide");
					$("#contentTable tr td>[name*='length']").parent().attr("class","hide");
					$("#contentTable tr td>[name*='width']").parent().attr("class","hide");
					$("#contentTable tr td>[name*='height']").parent().attr("class","hide");
					$("#contentTable tr td>[name*='materielType']").parent().attr("class","hide");
				}else if(isInArray(secondType,columnCondition_2)){
					$("#contentTable tr td>[name*='brand']").parent().attr("class","hide");
					$("#contentTable tr td>[name*='materielSize']").parent().attr("class","hide");
					$("#contentTable tr td>[name*='materielType']").parent().attr("class","hide");
				}else{
					$("#contentTable tr td>[name*='stoneType']").parent().attr("class","hide");
					$("#contentTable tr td>[name*='length']").parent().attr("class","hide");
					$("#contentTable tr td>[name*='width']").parent().attr("class","hide");
					$("#contentTable tr td>[name*='height']").parent().attr("class","hide");
					$("#contentTable tr td>[name*='brand']").parent().attr("class","hide");
				}
			}
		});
	});
	/**
	 * 付款条款下拉选
	 */
	$("#detailList_2 tr td>select[name*='payClause']").live("select2-opening",function(){
		var type = this.getAttribute("tag");
		var obj = this;
    	if(type){
    		var url = "/a/project/querydictlist?type="+type;
			startUp.getAsyncData(url,function(data){
				var str=$(obj);
				str.text("");
//				str.append("<option value='-1'>请选择</option>");
				$.each(data, function(idx,item){
					var option ="<option value='"+item.label+"'>"+item.label+"</option>";
					str.append(option);
				});
			});
    	}
	});
	/**
	 * 付款金额计算
	 */
	$("#detailList_2 tr td>[name*='payRatio']").live("keyup",function(){
		var contractPrice = $("#contractPrice").val();
		if(contractPrice){
			var payRatio = $(this).val();
			var price = parseFloat(contractPrice)*parseFloat(payRatio)*0.01;
			if(isNaN(price)){
				alertx("请输入正确数值!");
			}else{
				$(this).parent().next("[name='price']").children("[name='price']").attr("value",price);
			}
			
		}
	});
	
	/**
	 * 价格类型下拉框 许俊雄
	 */
	$("#detailList tr td>[name*='isInProvince']").live("select2-opening",function(){
		var type = this.getAttribute("tag");
		if(type){
			var url ="/a/project/querydictlist?type="+type;
			var obj =this;
			startUp.getAsyncData(url,function(data){
				var str =$(obj);
				str.text("");
				str.append("<option value=''>请选择</option>");
				$.each(data, function(idx,item){
					var option ="<option value='"+item.value+"'>"+item.label+"</option>";
					str.append(option);
				});	
			});
		}
	});
	
	
});

submitFormX = function (subURL,successURL){
	var jsonBase = $("#baseForm").serializeJsonObj();
	var jsonDetails = $("#detailsForm").serializeJsonObj();
	var jsonDetailsX = $("#detailsFormX").serializeJsonObj();
	
	$("#baseForm").validate();
	if($("#baseForm").valid()){
		//加载等待界面
		loading();
		if(!$.isEmptyObject(jsonDetails)){
			if($.isArray(jsonDetails)){
				jsonBase.detailList = jsonDetails;
			}else{
				var list = new Array();
				list.push(jsonDetails);
				jsonBase.detailList = list;
			}
		}
		if(!$.isEmptyObject(jsonDetailsX)){
			if($.isArray(jsonDetailsX)){
				jsonBase.detailListX = jsonDetailsX;
			}else{
				var list = new Array();
				list.push(jsonDetailsX);
				jsonBase.detailListX = list;
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
	
	
}
