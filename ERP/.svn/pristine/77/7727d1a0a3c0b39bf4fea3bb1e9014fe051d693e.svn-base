$(function(){
	//数据筛选
    $(document).off("click","input[name*='actRadio']").on("click","input[name*='actRadio']",function(e){
    	var url=$(this).attr("attrUrl");
    	window.location.href=url;
	});
	/**
	 * 点击提交按钮
	 */
	$("#editBtn").on("click",function(){
		$("#inputForm").submit();
	});
	
	/**
	 * 流程控制
	 */
	$(document).ready(function(){
		var submitUrl = $("#submitUrl").val();
		var successUrl = $("#successUrl").val();
		actButton();
		actControl(submitUrl,successUrl,'editApplyForm');
	});
	
	/**
	 * 选择计价方式,确定合同价
	 */
	$("#settlementWay").bind("change", function(){
		//计价方式
		var settlementWay = $("#settlementWay").val();
		//各类合同价
		var singleCarPrice = $("#singleCarPrice").val();
		var splitPrice = $("#splitPrice").val();
		var splitLightPrice = $("#splitLightPrice").val();
		
		if(settlementWay == '整车运输'){
			$("#contractPrice").val(singleCarPrice);
			var settleWeight = $("#theoryWeight").val();
			$("#settleWeight").val(settleWeight);
			$("#settleWeight").removeAttr("readonly");
			sum(settlementWay);
		}
		if(settlementWay== '零担运输'){
			$("#contractPrice").val(splitPrice);
			var settleWeight = $("#theoryWeight").val();
			$("#settleWeight").val(settleWeight);
			$("#settleWeight").removeAttr("readonly");
			sum(settlementWay);
		}
		if(settlementWay== '零担轻货'){
			$("#contractPrice").val(splitLightPrice);
			var settleWeight = $("#theoryWeight").val();
			$("#settleWeight").val(settleWeight);
			$("#settleWeight").removeAttr("readonly");
			sum(settlementWay);
		}
		if(settlementWay== '包车'){
			$("#contractPrice").val("");
			$("#settleWeight").val("1");
			$("#settleWeight").attr("readonly", "readonly");
			sum(settlementWay);
		}
	});
	/**
	 * 输入参数,触发价格计算
	 */
	$("#unloadPrice").live("keyup", function(){
		countPrice();
		
		//计价方式
		var settlementWay = $("#settlementWay").val();
		sum(settlementWay);
	});
	$("#unloadTimes").live("keyup", function(){
		countPrice();

		var settlementWay = $("#settlementWay").val();
		sum(settlementWay);
	});
	$("#loadPrice").live("keyup", function(){
		var settlementWay = $("#settlementWay").val();
		sum(settlementWay);
	});
	$("#settleWeight").live("keyup", function(){
		var settlementWay = $("#settlementWay").val();
		sum(settlementWay);
	});
	$("#contractPrice").live("keyup", function(){
		var settlementWay = $("#settlementWay").val();
		sum(settlementWay);
	});
//	$("#tax").live("change", function(){
//		sum();
//	});
	function countPrice(){
		var unloadPrice = $("#unloadPrice").val();
		var unloadTimes = $("#unloadTimes").val();
		var unloadTotalPrice = unloadPrice * unloadTimes;
		$("#unloadTotalPrice").val(unloadTotalPrice);
	}
	function sum(settlementWay){
		
		var unloadTotalPrice = $("#unloadTotalPrice").val();
		var loadPrice = $("#loadPrice").val();
		var settleWeight = $("#settleWeight").val();
		var contractPrice = $("#contractPrice").val();
		
		var sumPrice = 0;
		if(settlementWay == '整车运输'){
			if(unloadTotalPrice!="" && loadPrice!="" && settleWeight!=""){
				sumPrice = parseFloat(unloadTotalPrice) + parseFloat(loadPrice) + settleWeight * contractPrice;
				sumPrice = sumPrice.toFixed(2);
				$("#sumPrice").val(sumPrice);
			}
		}
		if(settlementWay == '零担运输' || settlementWay== '零担轻货' || settlementWay== '包车'){
			if(settleWeight!=""){
				sumPrice = settleWeight * contractPrice;
				sumPrice = sumPrice.toFixed(2);
				$("#sumPrice").val(sumPrice);
			}
		}
//		var tax = $("#tax").val();
//		
//		var preTaxSumPrice = 0;
//		var afterTaxSumPrice = 0;
//		if(unloadTotalPrice!="" && loadPrice!="" && settleWeight!=""){
//			preTaxSumPrice = parseFloat(unloadTotalPrice) + parseFloat(loadPrice) + settleWeight * contractPrice;
//			preTaxSumPrice = preTaxSumPrice.toFixed(2);
//			$("#preTaxSumPrice").val(preTaxSumPrice);
//		}
//		
//		//税后总金额
//		if(tax != "0"){
//			taxPrice = preTaxSumPrice * parseFloat(tax) * 0.01 ;
//			afterTaxSumPrice = preTaxSumPrice - taxPrice;
//			afterTaxSumPrice = afterTaxSumPrice.toFixed(2);
//			$("#afterTaxSumPrice").val(afterTaxSumPrice);
//		}else{
//			$("#afterTaxSumPrice").val(preTaxSumPrice);
//		}
		
	}
	
	/**
	 * 计算平摊价格
	 */
	$("#countDividePrice").live("click", function(){
		var logisticSend = $("#logisticSend").val();
		var sumPrice = $("#sumPrice").val();
		if(sumPrice == 0){
			window.alertx("请先计算结算总金额!");
		}
		
		if(sumPrice != 0){
			var url = "/a/finance/transportationSettlement/countDividePrice";
			var da= '{"logisticSend":"'+logisticSend+'","sumPrice":"'+sumPrice+'"}';
			startUp.postActData(url,da,"application/json",function(data){
				if(data){
					$("#formView").prop("class","hide");
					var dividePriceForm = $("#dividePriceForm");
					dividePriceForm.text("");
	    			$.each(data, function(idx,item){
	    				var a ="<tr>\
										<td>"+dealWithUndefined(item.orderBomNo)+"</td>\
										<td>"+dealWithUndefined(item.projectName)+"</td>\
										<td>"+dealWithUndefined(item.provinceName)+"</td>\
										<td>"+dealWithUndefined(item.cityName)+"</td>\
										<td>"+dealWithUndefined(item.projectAddress)+"</td>\
										<td>"+dealWithUndefined(item.factoryName)+"</td>\
										<td>"+dealWithUndefined(item.requiredDate)+"</td>\
										<td>"+dealWithUndefined(item.sendDate)+"</td>\
										<td>"+dealWithUndefined(item.receiverName)+"</td>\
										<td>"+dealWithUndefined(item.receiverTel)+"</td>\
										<td>"+dealWithUndefined(item.boxNumber)+"</td>\
										<td>"+dealWithUndefined(item.area)+"</td>\
										<td>"+dealWithUndefined(item.theoryWeight)+"</td>\
										<td>"+dealWithUndefined(item.dividePrice)+"</td>\
					 				</tr>";
	    				dividePriceForm.append(a);
	    			});
				}
			});
		}
		
	});
	
	
});



