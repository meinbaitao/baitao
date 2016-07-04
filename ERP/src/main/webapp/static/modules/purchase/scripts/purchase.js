$(function(){
	//表单提交
	$("#assignBtn").unbind("click").bind("click",function(){
//		$("#assignForm").submit();
		submitWValidLoading($("#assignForm"));
	});
	//保存提交
	$("#saveBtn").unbind("click").bind("click",function(){
//		$("#saveForm").submit();
		submitWValidLoading($("#saveForm"));
	});
	//提交按钮
	$("#submitBtn").unbind("click").bind("click",function(){
//		$("#submitForm").submit();
		submitWValidLoading($("#submitForm"));
	});
	//驳回按钮
	$("#rebutBtn").unbind("click").bind("click",function(){
//		$("#rebutForm").submit();
		submitWValidLoading($("#rebutForm"));
	});
	//运营专员提交
	$("#yyzyBtn").unbind("click").bind("click",function(){
		$("#editForm").attr("action",startUp.getRootPath()+"/a/purchase/purchaseDemand/saveStoneExpectDate");
//		$("#editForm").submit();
		submitWValidLoading($("#editForm"));
	});
	//数据筛选
    $(document).off("click","input[name*='actRadio']").on("click","input[name*='actRadio']",function(e){
    	var radioVal = e.target.value;
    	loading();
    	if(e.target.value==1){
			window.location.href=startUp.getRootPath() + '/a/purchase/purchase/findMyPurchase';
		}else if(e.target.value==2){
			window.location.href=startUp.getRootPath() + '/a/purchase/purchase/findUnAuditPurchase';
		}else if(e.target.value==3){
			window.location.href=startUp.getRootPath() + '/a/purchase/purchase/findAuditDonePurchase';
		}
	});
	//点击项目查看归属的相关下料单
	$("i[attrID='listPro']").unbind("click").bind("click",function(){
		var url = "/a/purchase/purchaseDemand/getObbByProID";
		var attrVal = $(this).attr("attrVal");	//根据辅助属性的值判断为哪个页面的操作
		getObbDetailByUrl($(this),url,attrVal);
	});
	//运营主管根据下料单编号获取相应的列表详情数据
	$(document).off("click","i[attrID='commissionerAssign']").on("click","i[attrID='commissionerAssign']",function(){
		var url = "/a/purchase/purchaseDemand/getDetailByObbIDForCommissioner";
		getDetailByUrl($(this),url,"commissionerAssign");
	});
	//采购主管查看	待指派 下料单详情
	$(document).off("click","i[attrID='waitAssign']").on("click","i[attrID='waitAssign']",function(){
		var url = "/a/purchase/purchaseDemand/getDetailByObbIDForWaitAssign";
		getDetailByUrl($(this),url,"waitAssign");
	});
	//采购主管查看	已指派 下料单详情
	$(document).off("click","i[attrID='hasAssign']").on("click","i[attrID='hasAssign']",function(){
		var url = "/a/purchase/purchaseDemand/getDetailByObbIDForWaitAssign";
		getDetailByUrl($(this),url,"hasAssign");
	});
	//采购员查看 待采购 数据
	$(document).off("click","i[attrID='waitPurchase']").on("click","i[attrID='waitPurchase']",function(){
		var url = "/a/purchase/purchaseDemand/getDetailByObbIDForWaitPurchase";
		getDetailByUrl($(this),url,"waitPurchase");
	});
	//采购员查看 已采购 数据
	$(document).off("click","i[attrID='hasPurchase']").on("click","i[attrID='hasPurchase']",function(){
		var url = "/a/purchase/purchaseDemand/getDetailByObbIDForWaitPurchase";
		getDetailByUrl($(this),url,"hasPurchase");
	});
	//生成项目的下级
	function getObbDetailByUrl(thisTagert,url,attrID){
		var proID = thisTagert.attr("thisTagertId");
		var status = thisTagert.attr("attrStatus");
		var isStatus = $("#isStatus").val();
		var isOpen = $("#pro"+proID).siblings("tr[pid^=pro"+proID+"]");
		if(isOpen.length>0){//判断有下级数据则删除数据并不请求后台
			isOpen.remove();
			cleanChildrens(isOpen);
			return;
		}
		//请求详情数据
		var d = {proID:proID,status:status,isStatus:isStatus,attrID:attrID};
		startUp.postData(url,d,function(data){
			var html="";
			var obbDetail =$("#pro"+proID);
			if(attrID=="commissionerAssign"){
				html=getObbaseHtmlByProToOperate(proID,data,isStatus,attrID);
			}else{
				html=getObbaseHtmlByPro(proID,data,isStatus,attrID);
			}
			
			removeChildren($("#pro"+proID).siblings("tr[pid^=pro"+proID+"]"));	//重复点击是删除上次沉余的数据
			obbDetail.after(html);
			treeTable_input_chk();
		});
	}
	//运营列表显示
	function getObbaseHtmlByProToOperate(proID,data,isStatus,attrID){
		var html="";
		var objs = data.list;
		var searchStatus = $("#searchStatus").val();
		var returnUrl = $("#returnUrl").val();
		for(var i=0;i<objs.length;i++){
			var obj=objs[i];
			if(searchStatus!=""&&obj.orderBomBase.status!=searchStatus){
				continue;
			}
			var boxTD = cBoxHtml(obj.orderBomBase.status=="待指派","obbaseBox",obj.orderBomBase.id);
			var statusLab = "";
			if(isStatus){
				statusLab = "【"+obj.orderBomBase.status+"】";
			}
			var tr="<tr id='obb"+obj.orderBomBase.id+"' pid='pro"+proID+"' class='active' haschild='true' islastone='true' depth='2'>\
						<td colspan='10'>\
							<div style='float:left;padding-left:20px;'>\
								"+boxTD+"\
					        	<a style='color:grey;' href='javascript:void(0);'><i thisTagertId='"+obj.orderBomBase.id+"' attrStatus='"+isStatus+"' attrID='"+attrID+"' class='glyphicon glyphicon-triangle-right'></i></a>\
						        <label class='operation-project'>\
						        	<a href='"+startUp.getRootPath()+"/a/orbom/orderBomShowDetail/showDetail?orderBomId="+obj.orderBomBase.id+"&orderType="+obj.orderBomBase.orderType+"&uniformMaterielType="+obj.orderBomBase.uniformMaterielType+"&returnUrl="+returnUrl+"'>\
						        		"+obj.orderBomBase.orderBomNo+"&nbsp;&nbsp;【"+obj.orderBomBase.uniformMaterielTypeLab+"】&nbsp;&nbsp;"+statusLab+"\
						        	</a>\
						        </label>\
						    </div>\
						</td>\
				</tr>";
			html = trHtml(obj.orderBomBase.status=="待指派",tr,html);
		}
		return html;
	}
	//项目下面的详细下料单界面
	function getObbaseHtmlByPro(proID,data,isStatus,attrID){
		var html="";
		var objs = data.list;
		var returnUrl = $("#returnUrl").val();
		var flag=true;
		if(attrID=="hasAssign"||attrID=="hasPurchase"){
			flag=false;
		}
		for(var i=0;i<objs.length;i++){
			var obj=objs[i];
			var boxTD = cBoxHtml(flag,"obbaseBox",obj.orderBomBase.id);
			var statusLab = "";
			var tr="<tr id='obb"+obj.orderBomBase.id+"' pid='pro"+proID+"' class='active' haschild='true' islastone='true' depth='2'>\
						<td colspan='10'>\
							<div style='float:left;padding-left:20px;'>\
								"+boxTD+"\
					        	<a style='color:grey;' href='javascript:void(0);'><i thisTagertId='"+obj.orderBomBase.id+"' attrStatus='"+isStatus+"' attrID='"+attrID+"' class='glyphicon glyphicon-triangle-right'></i></a>\
						        <label class='operation-project'>\
						        	<a href='"+startUp.getRootPath()+"/a/orbom/orderBomShowDetail/showDetail?orderBomId="+obj.orderBomBase.id+"&orderType="+obj.orderBomBase.orderType+"&uniformMaterielType="+obj.orderBomBase.uniformMaterielType+"&returnUrl="+returnUrl+"'>\
						        		"+obj.orderBomBase.orderBomNo+"&nbsp;&nbsp;【"+obj.orderBomBase.uniformMaterielTypeLab+"】\
						        	</a>\
						        </label>\
						    </div>\
						</td>\
				</tr>";
			html = trHtml(obj.status!=isStatus,tr,html);
		}
		return html;
	}
	//根据送进来的url获取相应的详情列表数据
	function getDetailByUrl(thisTagert,url,attrID){
		var obbID = thisTagert.attr("thisTagertId");
		var status = thisTagert.attr("attrStatus");
		var isStatus = $("#isStatus").val();
		var isOpen = $("#obb"+obbID).siblings("[pid=obb"+obbID+"]");
		if(isOpen.length>0){//判断有下级数据则删除数据并不请求后台
			$("#obb"+obbID).siblings("[pid=obb"+obbID+"]").remove();
			cleanChildrens(isOpen);
			return;
		}
		//请求详情数据
		var d = {obbID:obbID,status:status,attrID:attrID,isStatus:isStatus};
		startUp.postData(url,d,function(data){
			var html="";
			var obbDetail =$("#obb"+obbID);
			if(attrID=="commissionerAssign"){
				html=commissionerAssignHtml(obbID,data,isStatus);
			}else if(attrID=="waitAssign"){
				html=waitAssignHtml(obbID,data,isStatus);
			}else if(attrID=="waitPurchase"){
				html=waitPurchaseHtml(obbID,data,isStatus);
			}else if(attrID=="hasAssign"){
				html=hasAssignHtml(obbID,data,isStatus);
			}else if(attrID=="hasPurchase"){
				html=hasPurchaseHtml(obbID,data,isStatus);
			}
			
			removeChildren($("#obb"+obbID).siblings("[pid=obb"+obbID+"]"));	//重复点击是删除上次沉余的数据
			obbDetail.after(html);
			treeTable_input_chk();
		});
	}
	//运营根据下料单编号获取相应的列表详情数据	commissionerAssign
	function commissionerAssignHtml(obbID,data,isStatus){
		var html="";
		var objs = data.list;
		var mapSC = data.mapSC;
		var mapRC = data.mapRC;
		var mapAssignLog = data.mapAssignLog;
		for(var i=0;i<objs.length;i++){
			var obj=objs[i];
			var flag = (obj.count-mapSC[obj.id])>0;
			var tdInput = "<td><input name='yy"+obj.id+"' id='yy"+obj.id+"' value='"+(obj.count-mapSC[obj.id])+"' type='text' class='input-min number'></td>";
			if(isStatus=="40"){
				flag = mapRC[obj.id]>0;
				tdInput="";
			}
			var boxTD = cBoxHtml(flag,"cBox",obj.id);
			var requireDate = requireDateVal(obj);
			var tr="<tr pid='obb"+obbID+"' class='active' haschild='true' previd='' islastone='true' depth='2'>\
				<td class='td_fr'></td>\
				<td>&nbsp;&nbsp;└"+boxTD+"</td>\
				<td>"+obj.orderBomDetail.materielNo+"</td>\
				<td>"+obj.orderBomDetail.materielName+"</td>\
				<td>"+requireDate+"</td>\
				<td id='sj"+obj.id+"'>"+obj.count+"</td>\
				<td id='yyyx"+obj.id+"'>"+mapSC[obj.id]+"</td>\
				<td>"+mapRC[obj.id]+"</td>"+tdInput+"\
				<td>"+mapAssignLog[obj.id]+"</td>\
				</tr>";
//			html+=tr;
			html = trHtml(flag,tr,html);
		}
		return html;
	}
	function requireDateVal(obj){	//判断要求到货时间
		var requireDate="";
		if(obj.orderBomBase.uniformMaterielType=="1"){	//挂石材料
			requireDate=obj.sub.pendantExpectDate;
		}else if(obj.orderBomBase.uniformMaterielType=="2"){	//骨架材料
			requireDate=obj.sub.skeletonExpectDate;
		}
		return requireDate;
	}
	function waitAssignHtml(obbID,data,isStatus){
		var html="";
		var objs=data.list;
		var mapSC = data.mapSC;
		var mapPC = data.mapPC;
		for(var i=0;i<objs.length;i++){
			var obj=objs[i];
			var boxTD = cBoxHtml(mapSC[obj.id]!=mapPC[obj.id],"cBox",obj.id);//当运营下单数量等于采购已经下单数量则代表无需指派
			var tr="<tr pid='obb"+obbID+"' class='active' haschild='true' previd='' islastone='true' depth='2'>\
				<td class='td_fr'></td>\
				<td>&nbsp;&nbsp;└"+boxTD+"</td>\
				<td>"+obj.orderBomDetail.materielNo+"</td>\
				<td>"+obj.orderBomDetail.materielName+"</td>\
				<td>"+obj.count+"</td>\
				<td>"+mapSC[obj.id]+"</td>\
				<td>"+mapPC[obj.id]+"</td>\
				<td>"+obj.assignto.name+"</td>\
				</tr>";
//			html+=tr;
			html = trHtml(mapSC[obj.id]!=mapPC[obj.id],tr,html);
		}
		return html;
	}
	function hasAssignHtml(obbID,data,isStatus){
		var html="";
		var objs=data.list;
		var mapSC = data.mapSC;
		var mapPC = data.mapPC;
		for(var i=0;i<objs.length;i++){
			var obj=objs[i];
			var boxTD = cBoxHtml(false,"cBox",obj.id);//当运营下单数量等于采购已经下单数量则代表无需指派
			var tr="<tr pid='obb"+obbID+"' class='active' haschild='true' previd='' islastone='true' depth='2'>\
				<td class='td_fr'></td>\
				<td>&nbsp;&nbsp;└"+boxTD+"</td>\
				<td>"+obj.orderBomDetail.materielNo+"</td>\
				<td>"+obj.orderBomDetail.materielName+"</td>\
				<td>"+obj.count+"</td>\
				<td>"+mapSC[obj.id]+"</td>\
				<td>"+mapPC[obj.id]+"</td>\
				<td>"+obj.assignto.name+"</td>\
				</tr>";
//			html+=tr;
			html = trHtml(mapSC[obj.id]!=mapPC[obj.id],tr,html);
		}
		return html;
	}
	function waitPurchaseHtml(obbID,data,isStatus){
		var html="";
		var objs=data.list;
		var mapSC = data.mapSC;
		var mapPC = data.mapPC;
		var defaultVal = 0;
		for(var i=0;i<objs.length;i++){
			var obj=objs[i];
			defaultVal = (mapSC[obj.id]-mapPC[obj.id]);
			if(defaultVal<0){
				defaultVal=0;
			}
//			var boxTD = cBoxHtml(mapSC[obj.id]!=mapPC[obj.id],"cBox",obj.id);
			var boxTD = cBoxHtml(defaultVal>0,"cBox",obj.id);
			var tr="<tr pid='obb"+obbID+"' class='active' haschild='true' previd='' islastone='true' depth='2'>\
				<td class='td_fr'></td>\
				<td>&nbsp;&nbsp;└"+boxTD+"</td>\
				<td>"+obj.orderBomDetail.materielNo+"</td>\
				<td>"+obj.orderBomDetail.materials+"</td>\
				<td>"+obj.orderBomDetail.standardDesc+"</td>\
				<td>"+obj.orderBomDetail.materielName+"</td>\
				<td>"+obj.count+"</td>\
				<td id='yy"+obj.id+"'>"+mapSC[obj.id]+"</td>\
				<td id='yx"+obj.id+"'>"+mapPC[obj.id]+"</td>\
				<td><input name='xd"+obj.id+"' id='xd"+obj.id+"' value='"+defaultVal+"' type='text' class='input-min number'></td>\
				</tr>";
			html = trHtml(mapSC[obj.id]!=mapPC[obj.id],tr,html);
		}
		return html;
	}
	function hasPurchaseHtml(obbID,data,isStatus){
		var html="";
		var objs=data.list;
		var mapSC = data.mapSC;
		var mapPC = data.mapPC;
		for(var i=0;i<objs.length;i++){
			var obj=objs[i];
			var boxTD = cBoxHtml(false,"cBox",obj.id);
			var tr="<tr pid='obb"+obbID+"' class='active' haschild='true' previd='' islastone='true' depth='2'>\
				<td class='td_fr'></td>\
				<td>&nbsp;&nbsp;└"+boxTD+"</td>\
				<td>"+obj.orderBomDetail.materielNo+"</td>\
				<td>"+obj.orderBomDetail.materials+"</td>\
				<td>"+obj.orderBomDetail.standardDesc+"</td>\
				<td>"+obj.orderBomDetail.materielName+"</td>\
				<td>"+obj.count+"</td>\
				<td id='yy"+obj.id+"'>"+mapSC[obj.id]+"</td>\
				<td id='yx"+obj.id+"'>"+mapPC[obj.id]+"</td>\
				</tr>";
			html = trHtml(mapSC[obj.id]!=mapPC[obj.id],tr,html);
		}
		return html;
	}
	//根据状态生成对应的界面显示
	function cBoxHtml(flag,cBoxName,cBoxID){
		var cBoxHtml="";
		if(flag){
			cBoxHtml = "<input name='"+cBoxName+"' value='"+cBoxID+"' type='checkbox' >";
		}else{
			cBoxHtml = "<input style='display:none;' disabled='disabled' name='"+cBoxName+"' type='checkbox'>";
		}
		return cBoxHtml;
	}
	//选择供应商带出相应的数据已经相关的合同
	$(document).off("change","#gys").on("change","#gys",function(){
		changeGYS();
	});
	//点击生成采购订单
	$("#generatePurchase").unbind("click").bind("click",function(){
		var falg = $("input[name='cBox']").is(':checked');
		if(!falg){
			window.alertx("请选择相应的列表数据！");
			return;
		}
//		$("#generateForm").submit();
		submitWValidLoading($("#generateForm"));
	});
	//查看采购单详情
	$("a[name='purchaseDetail']").unbind("click").bind("click",function(){
		var sn = $(this).attr("sn");
		$("#detailSN").val(sn);
//		$("#detailForm").submit();
		submitWValidLoading($("#detailForm"));
	});
//	//选择合同编号带出详情匹配相应的单价
//	$(document).off("change","#htbh").on("change","#htbh",function(){
//		changeHtbh();
//	});
	//true tr加在原有的html前面，反之加在后面
	function trHtml(flag,tr,html){
		if(flag){
			return html=tr+html;
		}else{
			return html+=tr;
		}
	}
	//选择省内/外价格
	$("input[name='isprovince']").unbind("click").bind("click",function(){
		initCleanPrices();
		var gysID = $("#gys").val();
		var gysName = $("#gys").find("option[value='"+gysID+"']").attr("attrName");
		var isprovince = $("input[name='isprovince']:checked").val();
		getPriceBySuppName(gysName,isprovince);
	});
});
////选择合同编号加载相应的数据
//function changeHtbh(){
//	var contractId = $("#htbh").val();
//	if(!contractId)
//		return;
//	var url="/a/purchase/purchase/getPurchasingContractDetailByBaseID";
//	var d = {contractId:contractId};
//	startUp.postData(url,d,function(data){
//		var obj = data.listPCD;
//		$.each(obj,function(i,item){
//			$("#priceTD"+item.materielNo).html(item.price+"");
//		});
//		sumPrices();
//	});
//}
function initCleanPrices(){
	var tds = $("td[name='priceTD']");
	$.each(tds,function(i,item){
		var no = $(item).attr("attrNo");
		$("td[attrId='priceTD"+no+"']").html("");
		$("td[attrId='sumPriceTD"+no+"']").html("");
//		$("#sumPriceTD"+no).html("");
//		$("#priceTD"+no).html("");
	});
}
//统计价格
function sumPrices(){
	var tds = $("td[name='priceTD']");
	var sumPrice=0;
	var sumCount=0;
	var sumCountPrice=0;
	debugger;
	$.each(tds,function(i,item){
		var no = $(item).attr("attrNo");
		var count = $(item).prev().html();//$("#countTD"+no).html();
		var price = item.innerText;
		if(count){
			sumCount+=parseInt(count);
			if(parseFloat(price)>0){
				sumPrice+=parseFloat(price);
				sumCountPrice=sumCountPrice+(parseInt(count)*parseFloat(price));
//				$("#sumPriceTD"+no)
				$(item).next().html((parseInt(count)*parseFloat(price)).toFixed(2)+"");
			}else{
//				$("#sumPriceTD"+no)
				$(item).next().html("");
			}
		}
	});
	$("#sumCountTD").html(parseInt(sumCount)+"");	//统计数量
//	$("#sumPriceTD").html(sumPrice+"");	//统计单价
	$("#sumPriceTD").html(parseFloat(sumCountPrice).toFixed(2)+"");	//统计总价格
}
//选择供应商
function changeGYS(){
	sumPrices();
	var gysID = $("#gys").val();
	var gysName = $("#gys").find("option[value='"+gysID+"']").attr("attrName");
	var isprovince = $("input[name='isprovince']:checked").val();
	var sel =$("#htbh");
	sel.text("");
	sel.select2();
	$("#businessTel").html("");
	$("#businessPreson").html("");
	if(!gysID){
		return;
	}
	var url="/a/purchase/purchase/getDataBySuppName";
	var d = {gysName:gysName};
	startUp.postData(url,d,function(data){
		var obj = data.listPCB[0];
		$("#businessTel").html(obj.supp.businessTel);
//		if(!obj.supp.businessPreson){
//			window.alertx("1");
//		}
		$("#businessPreson").html(obj.supp.businessPreson);
		
		sel.append("<option value=''>请选择</option>");
		$.each(data.listPCB,function(i,item){
			var option ="<option value='"+item.id+"'>"+item.contractNo+"</option>";
			sel.append(option);
		});
	});
	getPriceBySuppName(gysName,isprovince);
}
//根据供应商名称加载相关价格
function getPriceBySuppName(gysName,isprovince){
	var url="/a/purchase/purchase/getListByPurchasingContractName";
	var d = {purchasingContractName:gysName,isprovince:isprovince};
	startUp.postData(url,d,function(data){
		var obj = data.listPCD;
		$.each(obj,function(i,item){
//			$("#priceTD"+item.materielNo).html(item.contractPrice+"");
			$("td[attrId='priceTD"+item.materielNo+"']").html(item.contractPrice+"");
		});
		sumPrices();
	});
}


function removeChildren(childrens){
	if(childrens.length>0){//判断有数据直接移除
		childrens.remove();
	}
} 
//删除被关闭数据的子项
function cleanChildrens(data){
	$.each(data,function(i,obj){
		var id = $(obj).attr("id");
		$("tr[pid*="+id+"]").remove();
	});
}
