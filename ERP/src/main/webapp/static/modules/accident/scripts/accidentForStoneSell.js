$(function(){	
	/**
	 * 添加
	 */
	$("#addAccident").on("click",function(){
		var accidentType = $("#accidentType").val();
		 window.location.href=startUp.getRootPath()+"/a/accident/accidentManage/form?type="+accidentType;
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
	 * 绑定箱号下拉框数据
	 */
	$("#accidentList tr td>select").live("select2-opening",function(){
		var orderBomId = $("#materialsFormSelect").val();
		var accidentType = $("#accidentType").val();
		var auditProcess = $("#auditProcess").val();
		if(orderBomId){
			var str =$(this);
			var url ="";
			if(str.attr("tag") == "boxNo"){
				url ="/a/orbom/orderBomDetail/findBoxesByOrderId/"+orderBomId;
				startUp.getAsyncData(url,function(data){
					str.text("");
					str.append("<option value=''>请选择</option>");
					$.each(data, function(idx,item){
						var option ="<option  value='"+item+"'>"+item+"</option>";
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

	//选择箱号带出石材编号
	$("#accidentList tr td>select[name*='boxNo']").live("change",function(){
		var boxNo = $(this).val();
		var orderBomId = $(this).find("option[value='"+boxNo+"']").attr("orderBomId");

//		var tr  = $(this).parent().parent("tr");
		var sel=$(this);
		sel.parent().nextAll().find("input[name*='orderBomBaseId']").val(orderBomId);
		if(boxNo){
			url ="/a/accident/accidentManage/getOrderBomDetailByOrderID";//?orderBomId="+orderBomId+"&boxNo="+boxNo;
			var d={orderBomId:orderBomId,boxNo:boxNo};
//			startUp.getAsyncData(url,function(data){
			startUp.postAsyncData(url,d,function(data){
				var msel = sel.parent().next().find("select[name*='materielNo']");
				msel.text("");
				msel.append("<option value=''>请选择</option>");
				$.each(data, function(idx,item){
					var option ="<option value='"+item.materielNo+"'>"+item.materielNo+"</option>";
					msel.append(option);
				});	
			});
		}
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
		obj.parent().nextAll().find("input[name*='sj']").val(0);
		obj.parent().nextAll().find("input[name*='bz']").val(0);
		obj.parent().nextAll().find("input[name*='jgc']").val(0);

		if(accidentDetailTypeId){
			url ="/a/accident/accidentManage/getAccidentType?accidentDetailTypeId="+accidentDetailTypeId;
			startUp.getAsyncData(url,function(data){
				obj.parent().nextAll().find("input[name*='attchUrl']").val(data[0].encloseMaterials);
				obj.parent().nextAll().find("input[name*='dataSubmit']").attr("title", data[0].tips);
				$.each(data, function(idx,item){
					if(item.respPart == "项目部"){
						obj.parent().nextAll().find("input[name*='xmb']").val(item.ratio);
					}
					else if(item.respPart == "设计"){
						obj.parent().nextAll().find("input[name*='sj']").val(item.ratio);
					}
					else if(item.respPart == "班组"){
						obj.parent().nextAll().find("input[name*='bz']").val(item.ratio);
					}
					else if(item.respPart == "加工厂"){
						obj.parent().nextAll().find("input[name*='jgc']").val(item.ratio);
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
		var sj=0,sjPrice=0,sumSJPrice=0;
		var bz=0,bzPrice=0,sumBZPrice=0;
		var jgc=0,jgcPrice=0,sumJgcPrice=0;
		var price=0;
		var item = obj;
		if(flag){
			item = obj.parent().parent().parent("tbody").children("tr");
		}
		item.each(function(index,tr){
		    jgc = $(tr).find("td[name*='jgc']").find("input[name*='jgc']").val();
		    xmb = $(tr).find("td[name*='xmb']").find("input[name*='xmb']").val();
		    sj = $(tr).find("td[name*='sj']").find("input[name*='sj']").val();
			bz = $(tr).find("td[name*='bz']").find("input[name*='bz']").val();
		    price = $(tr).find("td[name*='price']").find("input[name*='price']").val();
			price = isNaN(parseFloat(price))?0:parseFloat(price);
			xmb = isNaN(parseFloat(xmb))?0:parseFloat(xmb/100);
			sj = isNaN(parseFloat(sj))?0:parseFloat(sj/100);
			bz = isNaN(parseFloat(bz))?0:parseFloat(bz/100);
			jgc = isNaN(parseFloat(jgc))?0:parseFloat(jgc/100);
			xmbPrice = price*xmb;
			sjPrice = price*sj;
			bzPrice= price*bz;
			jgcPrice = price*jgc;
			sumXmbPrice = sumXmbPrice + xmbPrice;
			sumSJPrice = sumSJPrice + sjPrice;
			sumBZPrice = sumBZPrice + bzPrice;
			sumJgcPrice = sumJgcPrice + jgcPrice;
		});

		$("#asmList\\[0\\]\\.accidentPrice").val(sumXmbPrice.toFixed(2));
		$("#asmList\\[1\\]\\.accidentPrice").val(sumSJPrice.toFixed(2));
		$("#asmList\\[2\\]\\.accidentPrice").val(sumBZPrice.toFixed(2));
		$("#asmList\\[3\\]\\.accidentPrice").val(sumJgcPrice.toFixed(2));
		updateTotal();
	}
	
	//保存
	$("#editBtn").on("click",function(){
		$("#inputForm").submit();
	});

});


//合计
function updateTotal(){
	//罚款金额
	var xmbForfeitPrice = isNaN(parseFloat($("#asmList\\[0\\]\\.accidentPrice").val()))?0:parseFloat($("#asmList\\[0\\]\\.accidentPrice").val());
	var sjForfeitPrice = isNaN(parseFloat($("#asmList\\[1\\]\\.accidentPrice").val()))?0:parseFloat($("#asmList\\[1\\]\\.accidentPrice").val());
	var bzForfeitPrice = isNaN(parseFloat($("#asmList\\[2\\]\\.accidentPrice").val()))?0:parseFloat($("#asmList\\[2\\]\\.accidentPrice").val());
	var jgcForfeitPrice = isNaN(parseFloat($("#asmList\\[3\\]\\.accidentPrice").val()))?0:parseFloat($("#asmList\\[3\\]\\.accidentPrice").val());

	//质量事故金额
	var xmbAccidentPrice = isNaN(parseFloat($("#asmList\\[0\\]\\.forfeitPrice").val()))?0:parseFloat($("#asmList\\[0\\]\\.forfeitPrice").val());
	var sjAccidentPrice = isNaN(parseFloat($("#asmList\\[1\\]\\.forfeitPrice").val()))?0:parseFloat($("#asmList\\[1\\]\\.forfeitPrice").val());
	var bzAccidentPrice = isNaN(parseFloat($("#asmList\\[2\\]\\.forfeitPrice").val()))?0:parseFloat($("#asmList\\[2\\]\\.forfeitPrice").val());
	var jgcAccidentPrice = isNaN(parseFloat($("#asmList\\[3\\]\\.forfeitPrice").val()))?0:parseFloat($("#asmList\\[3\\]\\.forfeitPrice").val());
	//合计金额
	$("#asmList\\[0\\]\\.totalPrice").val((xmbForfeitPrice+xmbAccidentPrice).toFixed(2));
	$("#asmList\\[1\\]\\.totalPrice").val((sjForfeitPrice+sjAccidentPrice).toFixed(2));
	$("#asmList\\[2\\]\\.totalPrice").val((bzForfeitPrice+bzAccidentPrice).toFixed(2));
	$("#asmList\\[3\\]\\.totalPrice").val((jgcForfeitPrice+jgcAccidentPrice).toFixed(2));

}