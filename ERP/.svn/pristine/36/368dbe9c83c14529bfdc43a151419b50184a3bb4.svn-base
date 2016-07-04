/**
 * 
 */$(function(){
	
	 
	/**
	 * 点击添加按钮
	 */
	$("#addTransportation").on("click",function(){
		 window.location.href=startUp.getRootPath()+"/a/finance/payment/transportationForm";
	});
	$("#addManuf").on("click",function(){
		window.location.href=startUp.getRootPath()+"/a/finance/payment/manufForm";
	});
		
	/**
	 * 点击提交按钮
	 */
	$("#editBtn").on("click",function(){
		$("#inputForm").submit();
	});
	
	/**
	 * 下拉选择发货通知单
	 */
	$("#paymentList tr td>select[name*='logisticSend']").live("select2-opening",function(){
		var url = "/a/finance/payment/findFinishSettlement";
		var obj =this;
		startUp.getAsyncData(url,function(data){
			var str =$(obj);
			str.text("");
			str.append("<option value='-1'>===请选择===</option>");
			$.each(data, function(idx,item){
				var option ="<option value='"+item.seriesnumber+"'>"+item.seriesnumber+"</option>";
				str.append(option);
			});
		});
	});
	
	/**
	 * 选中发货通知单,带出运费结算
	 */
	$("#paymentList tr td>select[name*='logisticSend']").live("change", function(){
		var seriesNumber = $(this).val();
		var tr = $(this).parents("tr");
		var url = "/a/finance/payment/getSettlementByNum?logisticSend="+seriesNumber;
		startUp.getAsyncData(url, function(data){
			if(data){
				var prefix =tr.attr("list")+"["+tr.attr("index")+"].";
				  $("[id='"+prefix+"id']").val(data.id);
		  		  $("[id='"+prefix+"transportationNum']").val(data.transportationNum);
		  		  $("[id='"+prefix+"startArea']").val(data.startArea);
		  		  $("[id='"+prefix+"realWeight']").val(data.realWeight);
		  		  $("[id='"+prefix+"settleWeight']").val(data.settleWeight);
		  		  $("[id='"+prefix+"contractPrice']").val(data.contractPrice);
		  		  $("[id='"+prefix+"loadPrice']").val(data.loadPrice);
		  		  $("[id='"+prefix+"unloadTotalPrice']").val(data.unloadTotalPrice);
		  		  $("[id='"+prefix+"sumPrice']").val(data.sumPrice);
		  		  
		  		//删除对应发货通知单号的明细
		  		var mappingId = $("[id='"+prefix+"mappingId']").val();
		  		var delView = $("#formView> tr[flag='"+mappingId+"'");
		  		delView.remove();
				var delCount = $("#formCount> tr[flag='"+prefix+"']");
				delCount.remove();
				
		  	    var dataList = data.detailList;
				var formCount = $("#formCount");
				if(dataList){
	    			$.each(dataList, function(idx,item){
	    				var a ="<tr flag='"+prefix+"'>\
	    								<td>"+seriesNumber+"</td>\
										<td>"+dealWithUndefined(item.obbaseNo)+"</td>\
										<td>"+dealWithUndefined(item.receiveAddress)+"</td>\
										<td>"+dealWithUndefined(item.supplierName)+"</td>\
										<td>"+dealWithUndefined(item.requiredDate)+"</td>\
										<td>"+dealWithUndefined(item.sendDate)+"</td>\
										<td>"+dealWithUndefined(item.receiveName)+"</td>\
										<td>"+dealWithUndefined(item.receivePhone)+"</td>\
										<td>"+dealWithUndefined(item.area)+"</td>\
										<td>"+dealWithUndefined(item.price)+"</td>\
					 				</tr>";
	    				formCount.append(a);
	    			});
				}
			}
		});
	});
	
	/**
	 * 选中供应商,带出信息
	 */
	$("#paymentObject").live("change", function(){
		var carriageContractId = $("#paymentObject").val();
		var url = "/a/finance/payment/getCarriageContractById?carriageContractId="+carriageContractId;
		startUp.getData(url, function(data){
			$("#bankName").val(data.partyBAccountBank);
			$("#accountName").val(data.partyBAccountName);
			$("#account").val(data.partyBAccountNo);
		});
	});
	
	/**
	 * 选中扣款类型,生成金额输入框
	 */
	$("#punishType").live("change", function(){
		deletePunish();
		countPrice();
		var  punishType = $(this).val();
		if(punishType){
			var price = "";
			var length = punishType.length;
			for(var i=0; i<length; i++){
				var inputExist = $("#addPunish li label>input[pname='"+punishType[i]+"'");
				if(inputExist.length == 0){
					var input = "<li>\
						<span class='tab-name'>"+punishType[i]+"：</span>\
						<label>\
							<input type='text' id='punish["+i+"]' pname='"+punishType[i]+"' class='input-medium'>\
						</lable>\
						</li>";	
					price += input;
				}
			}	
			var punish = $("#punish").val();
			$("#addPunish").append(price);
		}
	});
	/**
	 * 删除未选扣款金额控件
	 */
	function deletePunish(){
		var punishType = $("#punishType").val();
		var punishInput = $("#addPunish li label>input");
		if(punishInput){
			$.each(punishInput, function(idx,item){
				var punishName = item.getAttribute("pname");
				if($.inArray(punishName,punishType) == -1){
					$(item).parents("li").remove();
				}
			});
		}
		
	}
	
	
	/**
	 *  付款,扣款计算
	 */
	$("#addPunish li label>input").live("keyup", function(){
		countPrice();
	});
	$("#requiredPrice").live("keyup", function(){
		countPrice();
	});
	/**
	 *	应付,应扣计算
	 */
	function countPrice(){
		var punishList = new Array();
		punishList = $("#addPunish li label>input");
		var punish = "";
		var punishPrice = 0;
		var requiredPrice = $("#requiredPrice").val();
		var paymentPrice = 0;
		var length = punishList.length;
		for(var i=0; i<length; i++){
			var punishName = punishList[i].getAttribute("pname");
			var Price = punishList[i].value;
			if(Price){
				punishPrice += parseInt(Price);
			}
			if(punish){
				punish =punish+","+ punishName +":"+punishPrice;
			}else{
				punish = punishName+":"+punishPrice;
			}
		}
		//付款金额
		if(requiredPrice){
			paymentPrice = requiredPrice - punishPrice;
		}
		$("#paymentPrice").val(paymentPrice);
		$("#punishPrice").val(punishPrice);
		$("#punish").val(punish);
	
	}
	
	/**
	 * 点击查看,生成扣款分项 
	 */
	$(document).ready(function () {
		createPunish();
    });
	function createPunish(){
		var punish = $("#punish").val();
		var punishType  = $("#punishType").val();
		var punishList = new Array();
		if(punish){
			punishList = punish.split(",");
		}
		if(punishList){
			var punishInput = "";
			var length = punishList.length;
			for(var i=0; i<length; i++){
				var punishTemp = new Array();
				punishTemp = punishList[i].split(":");
				if($.inArray(punishTemp[0], punishType.toArray)){
					var input = "<li>\
						<span class='tab-name'>"+punishTemp[0]+"：</span>\
						<label>\
							<input type='text' id='punish["+i+"]' pname='"+punishTemp[0]+"' value='"+punishTemp[1]+"' class='input-medium'>\
						</lable>\
						</li>";	
					punishInput += input;
				}
				
			}
			$("#addPunish").append(punishInput);
		}
	}
	
	
	/**
	 * 删除明细
	 */
	$("#tr_payment_del,.tr_payment_del").bind("click",function(){
		var table=table_obj(this);
		var ids="";
		var checkTr =$(table+" tbody tr td").find("input[type=checkbox]:checked");
		if(checkTr.length>0){
			checkTr.each(function(idx,item){
				ids =ids+item.id+",";
				$(this).parents("tr").remove();
			})
			if(ids){
				ids=ids.substring(0,ids.lastIndexOf(","));
				$("#delId").val(ids);
			}
		}else{
			window.alertx("选择需要删除的行!");
		}
   });
	
	
});