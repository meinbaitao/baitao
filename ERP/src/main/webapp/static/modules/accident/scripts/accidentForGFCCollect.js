$(function(){	
	/**
	 * 添加
	 */
	$("#addAccident").on("click",function(){
		var accidentType = $("#accidentType").val();
		 window.location.href=startUp.getRootPath()+"/a/accident/accidentManage/form?type="+accidentType;
	});

	//选择采购单，修改采购
	$("#purchaseOrderSelect").unbind("change").bind("change", function(){
		var purchaseSerialNumber = $("#purchaseOrderSelect").val();

	});

	
	//删除
	$("#deleteAccident").live("click",function(){
		var falg = $("input[name='checkdbox']").is(':checked');
		var accidentType = $("#accidentType").val();
		var ids ="";
		if(falg){
			window.confirmx('确认要删除该事故单吗？',function(){
				var lists =$("input[name='checkdbox']:checked");
				$.each(lists, function(idx,item){
					ids =ids+item.id+",";
				});
				if(ids){
					ids=ids.substring(0,ids.lastIndexOf(","));
					var url="/a/accident/accidentManage/delete";
					window.location.href=startUp.getRootPath()+url+"?accidentId="+ids+"&accidentType="+accidentType;
				}
			});
		}else{
			window.alertx("请选择需要删除的事故单!");
		}
	});
	
	//选择采购单后，填充要求到货时间
	$("#purchaseOrderSelect").live("change",function(){
		var orderId = $(this).val();
		var url = '/a/accident/accidentManage/getOnePurchaseBySeriesNumber/' + orderId;
		startUp.getAsyncData(url,function(data){
			var formatedDate = $.format.date(data.requireDate, 'yyyy-MM-dd')
			$("#requireArriveDate").val(formatedDate);
		});
	});
	

	
	/**
	 * 删除Tab
	 */
	$("#tr_accident_del,.tr_accident_del").bind("click",function(){
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
				var flag=$("#flag");
				var tby=$("#accidentList").children("tr");
//				alert(tby.length);
				updateSumData(tby,false);
			}
		}else{
			window.alertx("选择需要删除的行!");
		}
   })
   
   /**
	 * 绑定数据下拉框
	 */
	$("#accidentList tr td>select").live("select2-opening",function(){
		var serializeNumber = $("#purchaseOrderSelect").val(); //采购编号
		var accidentType = $("#accidentType").val();
		var auditProcess = $("#auditProcess").val();
		if(serializeNumber){
			var str =$(this);
			var url ="";
			if(str.attr("tag") == "materielName"){
				url = '/a/accident/accidentManage/getOrderDetailByPurchaseNO/'+serializeNumber;
				startUp.getAsyncData(url,function(data){
					str.text("");
					str.append("<option value=''>请选择</option>");
					$.each(data, function(idx,item){
						var option ="<option materielNo='"+item.materielNo+"' purchaseId='"+item.purchaseId+"' orderBomBaseId='"+item.orderBomId+"' standardDesc='"+item.standardDesc+"' value='"+item.materielName+"'>"+item.materielName+"</option>";
						str.append(option);
					});	
				});
			}
			if(str.attr("tag") == "sglx"){
				url ="/a/accident/accidentManage/getUniqueAccidentType?auditProcess="+auditProcess+"&accidentType="+accidentType;
				startUp.getAsyncData(url,function(data){
					str.text("");
					str.append("<option value=''>请选择</option>");
					$.each(data, function(idx,item){
						var option ="<option value='"+item.accidentDetailTypeId+"'>"+item.accidentDetailType+"</option>";
						str.append(option);
					});	
				});
			}
		}
	});

	//选择材料名称连带数据
	$("#accidentList tr td>select[name*='materielName']").live("change",function(){
		var materielNameValue = $(this).val();
		var standardDescValue = $(this).find("option[value='"+materielNameValue+"']").attr("standardDesc");
		$(this).parent().next().find("input[name*='standardDesc']").val(standardDescValue);

		var orderBomBaseIdValue = $(this).find("option[value='"+materielNameValue+"']").attr("orderBomBaseId");
		$(this).parent().parent().find("input[name*='orderBomBaseId']").val(orderBomBaseIdValue);

		var purchaseIdValue = $(this).find("option[value='"+materielNameValue+"']").attr("purchaseId");
		$(this).parent().parent().find("input[name*='purchaseId']").val(purchaseIdValue);

		var materielNoValue = $(this).find("option[value='"+materielNameValue+"']").attr("materielNo");
		$(this).parent().parent().find("input[name*='materielNo']").val(materielNoValue);
	});
	
	/**
	 * 绑定数据下拉框
	 */
	$("#accidentList tr td>select[name*='solvePlan']").live("select2-opening",function(){
		$(this).text("");
		$(this).append("<option value='0'>补料</option>");
		$(this).append("<option value='1'>罚款</option>");
	});
	
	//选择事故类型连带数据
	$("#accidentList tr td>select[name*='accidentTypeId']").live("change",function(){
		var accidentDetailTypeId = $(this).val();
		var obj = $(this);
		obj.parent().nextAll().find("input[name*='xmb']").val(0);
		obj.parent().nextAll().find("input[name*='gys']").val(0);
		obj.parent().nextAll().find("input[name*='wl']").val(0);

		if(accidentDetailTypeId){
			url ="/a/accident/accidentManage/getAccidentType?accidentDetailTypeId="+accidentDetailTypeId;
			startUp.getAsyncData(url,function(data){
				obj.parent().nextAll().find("input[name*='attchUrl']").val(data[0].encloseMaterials);
				obj.parent().nextAll().find("input[name*='dataSubmit']").attr("title", data[0].tips);
				$.each(data, function(idx,item){
					if(item.respPart == "项目部"){
						obj.parent().nextAll().find("input[name*='xmb']").val(item.ratio);
					}
					if(item.respPart == "供应商"){
						obj.parent().nextAll().find("input[name*='gys']").val(item.ratio);
					}
					if(item.respPart == "物流"){
						obj.parent().nextAll().find("input[name*='wl']").val(item.ratio);
					}

				});	
			});
			updateSumData($(this),true);
		}
	});
	
	//计算金额
	$("#accidentList tr td>input[name*='unitPrice']").live("change",function(){
		var count = $(this).parent().prev().find("input[name*='count']");
		var price = parseFloat($(this).val())*Number(count.val());
		if(price){
			$(this).parent().nextAll().find("input[name*='price']").val(price);
		}
		updateSumData($(this),true);
	});
	
	//计算金额
	$("#accidentList tr td>input[name*='count']").live("change",function(){
		var unitPrice = $(this).parent().next().find("input[name*='unitPrice']");
		var price = Number($(this).val())*parseFloat(unitPrice.val());
		if(price){
			unitPrice.parent().nextAll().find("input[name*='price']").val(price);
		}
		updateSumData($(this),true);
	});
	
	
	//汇总计算
	function updateSumData(obj,flag){
		var xmb=0,xmbPrice=0,sumXmbPrice=0;
		var gys=0,gysPrice=0,sumGysPrice=0;
		var wl=0,wlPrice=0,sumWlPrice=0;

		var price=0;
		var accidentType = $("#accidentType").val();//事故单类型1-石材收货事故2-钢辅材收货事故3-石材销售事故4-钢辅材销售事故
		var item = obj;
		if(flag){
			item = obj.parent().parent().parent("tbody").children("tr");
		}

		item.each(function(index,tr){
		    xmb = $(tr).find("td[name*='xmb']").find("input[name*='xmb']").val();
			gys = $(tr).find("td[name*='gys']").find("input[name*='gys']").val();
			wl = $(tr).find("td[name*='wl']").find("input[name*='wl']").val();
		    price = $(tr).find("td[name*='price']").find("input[name*='price']").val();
			price = isNaN(parseFloat(price))?0:parseFloat(price);
			xmb = isNaN(parseFloat(xmb))?0:parseFloat(xmb/100);
			gys = isNaN(parseFloat(gys))?0:parseFloat(gys/100);
			wl = isNaN(parseFloat(wl))?0:parseFloat(wl/100);

			xmbPrice = price*xmb;
			wlPrice = price*wl;
			gysPrice = price*gys;
			sumXmbPrice = sumXmbPrice + xmbPrice;
			sumWlPrice = sumWlPrice + wlPrice;
			sumGysPrice = sumGysPrice + gysPrice;
		});

		$("#asmList\\[0\\]\\.accidentPrice").val(sumXmbPrice.toFixed(2));
		$("#asmList\\[1\\]\\.accidentPrice").val(sumGysPrice.toFixed(2));
		$("#asmList\\[2\\]\\.accidentPrice").val(sumWlPrice.toFixed(2));

		updateTotal();

	}
	
	//保存
	$("#editBtn").on("click",function(){
		$("#inputForm").submit();
	});

});
//合计
function updateTotal(){
	var accidentType = $("#accidentType").val();//事故单类型1-石材收货事故2-钢辅材收货事故3-石材销售事故4-钢辅材销售事故

	//罚款金额
	var xmbForFeitPrice = isNaN(parseFloat($("#asmList\\[0\\]\\.accidentPrice").val()))?0:parseFloat($("#asmList\\[0\\]\\.accidentPrice").val());
	var gysForFeitPrice = isNaN(parseFloat($("#asmList\\[1\\]\\.accidentPrice").val()))?0:parseFloat($("#asmList\\[1\\]\\.accidentPrice").val());
	var wlForFeitPrice = isNaN(parseFloat($("#asmList\\[2\\]\\.accidentPrice").val()))?0:parseFloat($("#asmList\\[2\\]\\.accidentPrice").val());

	//质量事故金额
	var xmbAccidentPrice = isNaN(parseFloat($("#asmList\\[0\\]\\.forfeitPrice").val()))?0:parseFloat($("#asmList\\[0\\]\\.forfeitPrice").val());
	var gysAccidentPrice = isNaN(parseFloat($("#asmList\\[1\\]\\.forfeitPrice").val()))?0:parseFloat($("#asmList\\[1\\]\\.forfeitPrice").val());
	var wlAccidentPrice = isNaN(parseFloat($("#asmList\\[2\\]\\.forfeitPrice").val()))?0:parseFloat($("#asmList\\[2\\]\\.forfeitPrice").val());

	//合计金额
	$("#asmList\\[0\\]\\.totalPrice").val((xmbForFeitPrice+xmbAccidentPrice).toFixed(2));
	$("#asmList\\[1\\]\\.totalPrice").val((gysForFeitPrice+gysAccidentPrice).toFixed(2));
	$("#asmList\\[2\\]\\.totalPrice").val((wlForFeitPrice+wlAccidentPrice).toFixed(2));

}