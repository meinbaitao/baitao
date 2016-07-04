$(function(){
	/** 2015年12月1日 */
	//跟单员通知发货界面点击查看箱列表数据
	$(document).off("click","a[attrID='waitSendCount']").on("click","a[attrID='waitSendCount']",function(){
		getBoxByCondition($(this).parent().parent("tr"),"waitSendCount");
	});
	$(document).off("click","a[attrID='waitCarCount']").on("click","a[attrID='waitCarCount']",function(){
		getBoxByCondition($(this).parent().parent("tr"),"waitCarCount");
	});
	$(document).off("click","a[attrID='hasCarWaitSend']").on("click","a[attrID='hasCarWaitSend']",function(){
		getBoxByCondition($(this).parent().parent("tr"),"hasCarWaitSend");
	});
	$(document).off("click","a[attrID='confirmReceiveSendBox']").on("click","a[attrID='confirmReceiveSendBox']",function(){
		getBoxByCondition($(this).parent().parent("tr"),"confirmReceiveSendBox");
	});
	//点击查看箱列表数据
	function getBoxByCondition(thisObj,attrID){
		var url = "/a/logistics/productionLogistics/getBoxByCondition";
//		var thisObj = $(this).parent().parent("tr");
		var subID = thisObj.attr("subID");
		var orderType = thisObj.attr("orderType");
		var suppID = thisObj.attr("suppID");
		var obbaseID = thisObj.attr("orderBomBaseId");
		var isStatus = $("#isStatus").val();
		var lid=thisObj.attr("lid");
		//父级ID
		var parentID=subID+orderType+suppID+"";
		if(attrID=="hasCarWaitSend"||attrID=="confirmReceiveSendBox"){
			parentID = (lid+parentID);
		}else if(attrID=="waitCarCount"){
			parentID = (parentID+obbaseID);
		}
		var isOpen = $("#parent"+parentID).siblings("tr[pid^=parent"+parentID+"]");
		if(isOpen.length>0){//判断有下级数据则删除数据且不请求后台
			isOpen.remove();
			cleanChildrens(isOpen);
			return;
		}
		
		//请求条件组装
		var d = {subID:subID,orderType:orderType,suppID:suppID,isStatus:isStatus,lid:lid,obbaseID:obbaseID};
		startUp.postData(url,d,function(data){
			var html="";
			var objs = data.list;
			if(attrID=="waitSendCount"){
				html=waitSendCountHtml(objs,parentID);
			}else if(attrID=="waitCarCount"){
				html=waitCarCountHtml(objs,parentID);
			}else if(attrID=="hasCarWaitSend"){
				html=hasCarWaitSendHtml(objs,(parentID));
			}else if(attrID=="confirmReceiveSendBox"){
				html=confirmReceiveSendBoxHtml(objs,(parentID));
			}
			var obboxList =$("#parent"+parentID);
			obboxList.after(html);
			treeTable_input_chk();
		});
	}
	//跟单员界面箱数据加载
	function waitSendCountHtml(objs,parentID){
		var html="";
		for(var i=0;i<objs.length;i++){
			var obj=objs[i];
			var tr="<tr id='obbox"+obj.orderBomBox.id+"' pid='parent"+parentID+"' class='active' haschild='true' islastone='true' depth='2'>\
	            		<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td >"+obj.orderBomBox.boxNo+"</td>\
						<td >&nbsp;</td>\
						<td >"+obj.orderBomBox.boxNo+"</td>\
						<td >"+obj.orderBomBox.boxNo+"</td>\
						<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td ><input attrID='cBox' type='checkbox' name='cBox' value='"+obj.id+"'></td>\
					</tr>";
			html+=tr;
		}
		return html;
	}
	//物流文员生成发货通知单界面
	function waitCarCountHtml(objs,parentID){
		var html="";
		for(var i=0;i<objs.length;i++){
			var obj=objs[i];
			var tr="<tr id='obbox"+obj.orderBomBox.id+"' pid='parent"+parentID+"' class='active' haschild='true' islastone='true' depth='2'>\
	            		<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td >"+obj.orderBomBox.boxNo+"</td>\
						<td >"+obj.planSendDateLab+"</td>\
						<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td ><input attrID='cBox' type='checkbox' name='cBox' value='"+obj.id+"'></td>\
						<td colspan='5'>&nbsp;</td>\
					</tr>";
			html+=tr;
		}
		return html;
	}
	//选择材料 
	$(document).off("click","input[attrID='cBox']").on("click","input[attrID='cBox']",function(){
		var url = "/a/logistics/productionLogistics/getOBBCountVal";
		var pJson = parentBoxsJsonUtils();	//列表数据的json组装
		var ids = boxIDsUtils();			//箱的ids组装
		//请求详情数据
		var d = {pJson:$.toJSON(pJson),ids:ids};
		startUp.postData(url,d,function(data){
			$("#sumWeightTD").html(parseFloat(data.sumWeight).toFixed(3));
			$("#countBoxTD").html(data.countBox);
			$("#weight").val(parseFloat(data.sumWeight).toFixed(3));
			$("#quantity").val(data.countBox);
		});
	});
	//填充传送数据
	$(document).off("click","input[attrID='noticeSend']").on("click","input[attrID='noticeSend']",function(){
		var pJson = parentBoxsJsonUtils();	//列表数据的json组装
		var ids = boxIDsUtils();			//箱的ids组装
		//填充传送数据
		$("#pJson").val($.toJSON(pJson));
		$("#ids").val(ids);
//		$("#saveForm").submit();
		submitWValidLoading($("#saveForm"));
	});
	//列表数据的json组装
	function parentBoxsJsonUtils(){
		var parentBoxs = $("input[name='parentBox']:checked");
		var pJson={p:[]};
		for(var i=0;i<parentBoxs.length;i++){
			var thisObj = $(parentBoxs[i]).parent().parent("tr");
			var subID = thisObj.attr("subID");
			var lsID = thisObj.attr("lid");
			var orderType = thisObj.attr("orderType");
			var suppID = thisObj.attr("suppID");
			var orderBomBaseId = thisObj.attr("orderBomBaseId");
			var isStatus = $("#isStatus").val();
			
			var p={subID:subID,orderType:orderType,suppID:suppID,isStatus:isStatus,lsID:lsID,orderBomBaseId:orderBomBaseId};
			pJson.p.push(p);
		}
		return pJson;
	}
	//箱的ids组装
	function boxIDsUtils(){
		var checks = $("input[name='cBox']:checked");
		var ids = "";
		for(var i=0;i<checks.length;i++){
			var id = $(checks[i]).attr("value");
			ids+=id;
			if(i+1<checks.length){
				ids+=",";
			}
		}
		return ids;
	}
	//确认发货界面根据发货单ID加载对应的二级详情
	$(document).off("click","a[attrID='hasCarWaitSendCount']").on("click","a[attrID='hasCarWaitSendCount']",function(){
		var lid = $(this).attr("lid");
		var projectId = $(this).attr("projectId");
		var projectName = $(this).attr("projectName");
		var url = "/a/logistics/productionLogistics/getLogisticsSendDetailByID";
		//父级ID
		var parentID=lid+projectId+"";
		var isOpen = $("#lid"+parentID).siblings("tr[pid^=lid"+parentID+"]");
		if(isOpen.length>0){//判断有下级数据则删除数据且不请求后台
			isOpen.remove();
			cleanChildrens(isOpen);
			return;
		}
		
		//请求条件组装
		var d = {lid:lid,projectName:projectName};
		startUp.postData(url,d,function(data){
			var html="";
			var obboxList =$("#lid"+parentID);
			var objs = data.list;
			for(var i=0;i<objs.length;i++){
				var obj=objs[i];
				var id=lid+obj.sub.id+obj.orderBomBase.orderType+obj.supp.id+"";
				var address=obj.project.address?obj.project.address:"";
				var tr="<tr pid='lid"+parentID+"' lid='"+lid+"' id='parent"+id+"' subID='"+obj.sub.id +"' orderType='"+obj.orderBomBase.orderType +"' suppID='"+obj.supp.id +"'>\
		            		<td >"+obj.production.project.province +"</td>\
							<td >"+obj.project.name +"</td>\
							<td >"+obj.sub.buildingDisplayName +"</td>\
							<td >"+obj.orderBomBase.orderTypeVal +"</td>\
							<td >"+obj.supp.name +"</td>\
							<td ><a href='javascript:void(0)' attrID='hasCarWaitSend' >"+obj.extraData.hasCarWaitSendCount+"</a></td>\
							<td >"+obj.production.planSendDateLab+"</td>\
							<td >"+address+"</td>\
							<td ><input attrID='cBox' type='checkbox' name='parentBox'></td>\
							<td >"+obj.production.statusLab+"("+obj.supp.businessPreson+")</td>\
					</tr>";
				html+=tr;
			}
			
			removeChildren($("#lid"+parentID).siblings("tr[pid^=lid"+parentID+"]"));	//重复点击是删除上次沉余的数据
			obboxList.after(html);
			treeTable_input_chk();
		});
	});
	//确认发货界面根据发货单ID加载对应的二级详情
	$(document).off("click","a[attrID='confirmReceiveSendCount']").on("click","a[attrID='confirmReceiveSendCount']",function(){
		var lid = $(this).attr("lid");
		var projectId = $(this).attr("projectId");
		var projectName = $(this).attr("projectName");
		var url = "/a/logistics/productionLogistics/getLogisticsReceiveDetailByID";
		//父级ID
		var parentID=lid+projectId+"";
		var isOpen = $("#lid"+parentID).siblings("tr[pid^=lid"+parentID+"]");
		if(isOpen.length>0){//判断有下级数据则删除数据且不请求后台
			isOpen.remove();
			cleanChildrens(isOpen);
			return;
		}
		
		//请求条件组装
		var d = {lid:lid,projectName:projectName};
		startUp.postData(url,d,function(data){
			var html="";
			var obboxList =$("#lid"+parentID);
			var objs = data.list;
			for(var i=0;i<objs.length;i++){
				var obj=objs[i];
				var id=lid+obj.sub.id+obj.orderBomBase.orderType+obj.supp.id+"";
				var tr="<tr pid='lid"+parentID+"' id='parent"+id+"' lid='"+lid+"' subID='"+obj.sub.id +"' orderType='"+obj.orderBomBase.orderType +"' suppID='"+obj.supp.id +"'>\
		            		<td >"+obj.production.project.province +"</td>\
							<td >"+obj.project.name +"</td>\
							<td >"+obj.sub.buildingDisplayName +"</td>\
							<td >"+obj.orderBomBase.orderTypeVal +"</td>\
							<td >"+obj.supp.name +"</td>\
							<td ><a href='javascript:void(0)' attrID='confirmReceiveSendBox' >"+obj.extraData.sendCount+"</a></td>\
							<td ><input attrID='cBox' type='checkbox' name='parentBox'></td>\
					</tr>";
				html+=tr;
			}
			
			removeChildren($("#lid"+parentID).siblings("tr[pid^=lid"+parentID+"]"));	//重复点击是删除上次沉余的数据
			obboxList.after(html);
			treeTable_input_chk();
		});
	});
	//工厂人员查看发货列表数据
	function hasCarWaitSendHtml(objs,parentID){
		var html="";
		for(var i=0;i<objs.length;i++){
			var obj=objs[i];
			var tr="<tr id='obbox"+obj.orderBomBox.id+"' pid='parent"+parentID+"' class='active' haschild='true' islastone='true' depth='2'>\
	            		<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td >"+obj.orderBomBox.boxNo+"</td>\
						<td >"+obj.planSendDateLab+"</td>\
						<td >&nbsp;</td>\
						<td ><input attrID='cBox' type='checkbox' name='cBox' value='"+obj.id+"'></td>\
						<td >&nbsp;</td>\
					</tr>";
			html+=tr;
		}
		return html;
	}
	//工地查看
	function confirmReceiveSendBoxHtml(objs,parentID){
		var html="";
		for(var i=0;i<objs.length;i++){
			var obj=objs[i];
			var tr="<tr id='obbox"+obj.orderBomBox.id+"' pid='parent"+parentID+"' class='active' haschild='true' islastone='true' depth='2'>\
	            		<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td >"+obj.orderBomBox.boxNo+"</td>\
						<td ><input attrID='cBox' type='checkbox' name='cBox' value='"+obj.id+"'></td>\
					</tr>";
			html+=tr;
		}
		return html;
	}
	//确认发货
	$(document).off("click","input[attrID='confirmSendBtn']").on("click","input[attrID='confirmSendBtn']",function(){
		var pJson = parentBoxsJsonUtils();	//列表数据的json组装
		var ids = boxIDsUtils();			//箱的ids组装
		if(!ids&&pJson.p.length==0){
			window.alertx("没有选择数据不能进行操作");
			return;
		}
		//填充传送数据
		$("#confirmSendpJson").val($.toJSON(pJson));
		$("#confirmSendids").val(ids);
//		$("#confirmSendForm").submit();
		submitWValidLoading($("#confirmSendForm"));
	});
	//退回发货
	$(document).off("click","input[attrID='returnSendBtn']").on("click","input[attrID='returnSendBtn']",function(){
		var pJson = parentBoxsJsonUtils();	//列表数据的json组装
		var ids = boxIDsUtils();			//箱的ids组装
		if(!ids&&pJson.p.length==0){
			window.alertx("没有选择数据不能进行操作");
			return;
		}
		//填充传送数据
		$("#returnSendpJson").val($.toJSON(pJson));
		$("#returnSendids").val(ids);
//		$("#returnSendForm").submit();
		submitWValidLoading($("#returnSendForm"));
	});
	//确认收货
	$(document).off("click","input[attrID='confirmReceiveBtn']").on("click","input[attrID='confirmReceiveBtn']",function(){
		var pJson = parentBoxsJsonUtils();	//列表数据的json组装
		var ids = boxIDsUtils();			//箱的ids组装
		if(!ids&&pJson.p.length==0){
			window.alertx("没有选择数据不能进行操作");
			return;
		}
		//填充传送数据
		$("#confirmReceivepJson").val($.toJSON(pJson));
		$("#confirmReceiveids").val(ids);
//		$("#confirmReceiveForm").submit();
		submitWValidLoading($("#confirmReceiveForm"));
	});
	/** 2015年12月1日 */
	//表单提交
	$("#saveBtn").unbind("click").bind("click",function(){
//		$("#saveForm").submit();
		submitWValidLoading($("#saveForm"));
	});
	//承运方下拉列表
	$(document).off("change","#cyf").on("change","#cyf",function(){
		var id = $(this).val();
		var settlementType = $(this).find("option[value='"+id+"']").attr("settlementType");
		$("#settlement").val(settlementType);
		var sel =$("#sccb");
		sel.text("");
		var url="/a/logistics/productionLogistics/getByPBName";
		var pbName = $(this).find("option[value='"+id+"']").attr("partyBName");
		var d={pbName:pbName};
		startUp.postData(url,d,function(data){
			sel.append("<option value=''>请选择</option>");
			$.each(data,function(i,item){
				var option ="<option value='"+item.id+"'>"+item.contractNo+"</option>";
				sel.append(option);
			});
		});
	});
	//常用联系人
	$(document).off("change","#receiverAddress").on("change","#receiverAddress",function(){
		var id = $(this).val();
		var phone = $(this).find("option[value='"+id+"']").attr("phone");
		$("#receiverPhone").val(phone);
		var name = $(this).find("option[value='"+id+"']").attr("name");
		$("#receiverUser").val(name);
	});
	//根据承运方名称获取运输合同
	$(document).off("change","#sccb").on("change","#sccb",function(){
		var pbName = $(this).val();
		var d={pbName:pbName};
		var url="/a/logistics/productionLogistics/getByPBName";
		startUp.postData(url,d,function(data){
			if(data.length<=0){
				return;
			}
			var html="";
			for(var i=0;i<data.length;i++){
				html+="<option value='"+data[i].id+"'>"+data[i].contractNo+"</option>";
			}
			$("#ysht").html(html);
		});
	});
	//通知发货
	$(document).off("click","i[attrID='noticeSend']").on("click","i[attrID='noticeSend']",function(){
		var url="/a/logistics/productionLogistics/getDetailByObbID";
		getDetailByUrl($(this),url,"noticeSend");
	});
	//生成发货通知单
	$(document).off("click","i[attrID='createSend']").on("click","i[attrID='createSend']",function(){
		var url="/a/logistics/productionLogistics/getDetailByObbID";
		getDetailByUrl($(this),url,"createSend");
	});
	//确认发货详情
	$("i[attrID='productionCSDetail']").unbind("click").bind("click",function(){
		var url="/a/logistics/productionLogistics/getSendDetailByObbID";
		getDetailByUrl($(this),url,"productionCSDetail");
	});
	//确认收货详情
	$("i[attrID='productionRDetail']").unbind("click").bind("click",function(){
		var url="/a/logistics/productionLogistics/getSendDetailByObbID";
		getDetailByUrl($(this),url,"productionRDetail");
	});
	//通知发货
	$("i[attrID='noticeSendPro']").unbind("click").bind("click",function(){
		var url = "/a/logistics/productionLogistics/getListForProjectDetail";
		getObbDetailByUrl($(this),url,"getObbaseHtmlByPro","noticeSend");
	});
	//生成发货通知
	$("i[attrID='createSendPro']").unbind("click").bind("click",function(){
		var url = "/a/logistics/productionLogistics/getListForProjectDetail";
		getObbDetailByUrl($(this),url,"getObbaseHtmlByPro","createSend");
	});
	function getDetailByUrl(thisTagert,url,fname){
		var obbID = thisTagert.attr("thisTagertId");
		var isOpen = $("#obb"+obbID).siblings("[pid=obb"+obbID+"]");
		if(isOpen.length>0){//判断有下级数据则删除数据并不请求后台
			$("#obb"+obbID).siblings("[pid=obb"+obbID+"]").remove();
			cleanChildrens(isOpen);
			return;
		}
		var isStatus = $("#isStatus").val();
		//请求详情数据
		var d = {obbID:obbID,status:isStatus};
		startUp.postData(url,d,function(data){
			var html="";
			var obbDetail =$("#obb"+obbID);
			if(fname=="noticeSend"){
				html=noticeSendHtml(obbID,data,isStatus);
			}else if(fname=="createSend"){
				html=createSendHtml(obbID,data,isStatus);
			}else if(fname=="productionCSDetail"||fname=="productionRDetail"){
				html=logisticsHtml(obbID,data,isStatus);
			}/*else if(fname=="productionRDetail"){
				html=logisticsHtml(obbID,data,isStatus);
			}*/
			obbDetail.after(html);
		});
	}
	//生成项目的下级
	function getObbDetailByUrl(thisTagert,url,fname,attrID){
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
		var d = {proID:proID,status:status,isStatus:isStatus,fname:fname};
		startUp.postData(url,d,function(data){
			var html="";
			var obbDetail =$("#pro"+proID);
			if(fname=="getObbaseHtmlByPro"){
				html=getObbaseHtmlByPro(proID,data,isStatus,attrID);
			}/*else if(fname=="waitProduction"){
				html=jgcProductionHtml(obbID,data,isStatus);
			}else if(fname=="waitIntake"){
				html=jgcProductionHtml(obbID,data,isStatus);
			}*/
			
			removeChildren($("#pro"+proID).siblings("tr[pid^=pro"+proID+"]"));	//重复点击是删除上次沉余的数据
			obbDetail.after(html);
			treeTable_input_chk();
		});
	}
	//项目下面的详细下料单界面
	function getObbaseHtmlByPro(proID,data,isStatus,attrID){
		var html="";
		var objs = data.list;
		for(var i=0;i<objs.length;i++){
			var obj=objs[i];
			var boxTD = cBoxHtml(obj.status==isStatus,"obbaseBox",obj.orderBomBase.id);
			var tr="<tr id='obb"+obj.orderBomBase.id+"' pid='pro"+proID+"' class='active' haschild='true' islastone='true' depth='2'>\
						<td colspan='9'>\
							<div style='float:left;padding-left:20px;'>\
								"+boxTD+"\
					        	<i thisTagertId='"+obj.orderBomBase.id+"' attrStatus='"+isStatus+"' attrID='"+attrID+"' class='glyphicon glyphicon-triangle-right'></i>\
						        <label class='operation-project'>\
						        	<a href='"+startUp.getRootPath()+"/a/production/production/obDetail?orderBomId="+obj.orderBomBase.id+"&orderType="+obj.orderBomBase.orderType+"'>\
						        		"+obj.orderBomBase.orderBomNo+"&nbsp;&nbsp;【"+obj.orderBomBase.orderTypeVal+"】&nbsp;&nbsp;【"+obj.orderBomBase.stoneColorName+"】&nbsp;&nbsp;【"+obj.sub.stoneExpectDate+"】\
						        	</a>\
						        </label>\
						    </div>\
						</td>\
				</tr>";
			html+=tr;
		}
		return html;
	}
	//通知发货		生成发货通知单的时候
	function noticeSendHtml(obbID,data,isStatus){
		var html="";
		for(var i=0;i<data.length;i++){
			var obj=data[i];
			var amaldarremarks = "";
			if(obj.amaldarremarks){
				amaldarremarks=obj.amaldarremarks;
			}
			var boxTD = cBoxHtml(obj.status==isStatus,"cBox",obj.id);
			var tr="<tr pid='obb"+obbID+"' class='active' haschild='true' previd='' islastone='true' depth='2'>\
				<td>&nbsp;&nbsp;</td>\
				<td class='td_fr'>&nbsp;&nbsp;└"+boxTD+"</td>\
				<td>"+obj.orderBomDetail.boxNo+"</td>\
				<td>"+obj.orderBomDetail.materielNo+"</td>\
				<td>"+amaldarremarks+"</td>\
				<td>"+obj.statusLab+obj.orderBomBox.statusLab+"</td>\
				</tr>";
			html+=tr;
		}
		return html;
	}
	function createSendHtml(obbID,data,isStatus){
		var html="";
		debugger;
		for(var i=0;i<data.length;i++){
			var obj=data[i];
			var boxTD = cBoxHtml(obj.status==isStatus,"cBox",obj.id);
			var tr="<tr pid='obb"+obbID+"' class='active' haschild='true' previd='' islastone='true' depth='2'>\
				<td>&nbsp;&nbsp;</td>\
				<td class='td_fr'>&nbsp;&nbsp;└"+boxTD+"</td>\
				<td>"+obj.orderBomDetail.boxNo+"</td>\
				<td>"+obj.orderBomDetail.materielNo+"</td>\
				<td>"+obj.planSendDateLab+"</td>\
				<td>"+obj.statusLab+obj.orderBomBox.statusLab+"</td>\
				</tr>";
			html+=tr;
		}
		return html;
	}
	//物流
	function logisticsHtml(obbID,data,status){
		var html="";
		for(var i=0;i<data.length;i++){
			var obj=data[i];
			var boxTD = "";
//			if(obj.status==status){
			if(true){
				boxTD = "<input name='cBox' value='"+obj.id+"' type='checkbox'>";
			}else{
//				continue;
				boxTD = "<input style='display:none;' disabled='disabled' name='cBox' type='checkbox'>";
			}
			var tr="<tr pid='obb"+obbID+"' class='active' haschild='true' previd='' islastone='true' depth='2'>\
				<td class='td_fr'>&nbsp;&nbsp;└"+boxTD+"</td>\
				<td>"+obj.orderBomDetail.boxNo+"</td>\
				<td>"+obj.orderBomDetail.materielNo+"</td>\
				<td>"+obj.statusLab+"</td>\
				</tr>";
			html+=tr;
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
	//发货通知选择箱或者下料单时统计相关的数据
	$(document).off("click","#noticeSendDetail input[type='checkbox']").on("click","#noticeSendDetail input[type='checkbox']",function(){
		var checks = $("input[name='cBox']:checked");
		var ids = "";
		for(var i=0;i<checks.length;i++){
			var id = $(checks[i]).attr("value");
			ids+=id;
			if(i+1<checks.length){
				ids+=",";
			}
		}
		var obbChecks = $("input[name='obbaseBox']:checked");
		var obbIDs = "";
		for(var i=0;i<obbChecks.length;i++){
			obbIDs+=$(obbChecks[i]).attr("value");
			if(i+1<obbChecks.length)
				obbIDs+=",";
		}
		var url="/a/logistics/productionLogistics/getOrderBomCountVal";
		var d={obbIDs:obbIDs,sendIDs:ids};
		startUp.postData(url,d,function(data){
			if(data){
				$("#theoryWeight").val(data.sumWeight);
				$("#quantity").val(data.countBox);
			}else{
				$("#theoryWeight").val("0");
				$("#quantity").val("0");
			}
		});
	});
	//生成发货通知界面只让选择一个
	$(document).off("click","input[attrID='waitSendBox']").on("click","input[attrID='waitSendBox']",function(){
		var cBox = $(this);
		boxChange(cBox,"cBox");	//调用进行修改样式
		var id = cBox.attr("value");
		$("#id").val(id);
		var url="/a/logistics/productionLogistics/getBasicDetailByID";
		var d={id:id};
		startUp.postData(url,d,function(data){
			if(data.ls){
				var ls = data.ls;
				$("#number").val(ls.number);
				$("#quantity").val(ls.quantity);
				$("#theoryWeight").val(ls.theoryWeight);
				$("#vehicleLength").val(ls.vehicleLength);
				$("#requireWeight").val(ls.requireWeight);
			}
		});
	});
	//点击复选框样式改变
	function boxChange(cBox,boxName){
		var checks = $("input[name='"+boxName+"']:checked");
		for(var i=0;i<checks.length;i++){
			$(checks[i]).removeAttr("checked");
			$(checks[i]).parent().parent("tr").removeAttr("class");
		}
		cBox.attr("checked","checked");
		cBox.parent().parent("tr").attr("class","tr_chked");
	}
	//选中需要新增发货的发货单	(逻辑控制只能选择一个)
	$(document).off("click","input[attrID='sendLSID']").on("click","input[attrID='sendLSID']",function(){
		boxChange($(this),"lsID");
	});
	//加载可进行新增发货的数据
	$(document).off("click","input[attrID='createSendBtn']").on("click","input[attrID='createSendBtn']",function(){
		var as = $("a[attrID='hasCarWaitSendCount']");
		if(as.length==0){
			window.alertx("没有待发货单不能执行新增发货操作");
			return;
		}
		var option="";
		var html="";
		option+="<option value=''>请选择</option>";
		$.each(as,function(i,item){
			var ln = $(item).attr("ln");
			var lid = $(item).attr("lid");
			option+="<option value='"+lid+"'>"+ln+"</option>";
		});
		html+="&nbsp;&nbsp;&nbsp;物流单号：<select id='lsSel' name='lsSel' class='input-medium'>"+option+"</select>";
		html+="&nbsp;&nbsp;&nbsp;楼栋号：<select id='createSubName' name='createSubName' class='input-medium'></select>";
		html+="<br/>&nbsp;&nbsp;<div id='boxDiv' name='boxDiv'><table id='boxTab' name='boxTab' \
					class='table table-striped table-bordered table-condensed resize tree_table'><thead>\
					<tr><th>选择</th><th>箱号</th></tr>\
					</thead><tbody id='boxList' name='boxList'></tbody></table></div>";
		var title="<input class='btn btn-primary' type='button' id='confirmCreateSend' name='confirmCreateSend' value='确认新增发货'>";
		window.jBox.open(html, title, 800, 350, { buttons: { '关闭': true} });
		$("#lsSel").select2();
		$("#createSubName").select2();
		//加载相关数据
//		getBuildingByCondition();
	});
	//确认新增发货
	$(document).off("click","input[name='confirmCreateSend']").on("click","input[name='confirmCreateSend']",function(){
		var flag = $("input[name='productionID']").is(':checked');
		if(!flag){
			window.alertx("请选择需要新增发货的箱号，取消请点关闭");
			return;
		}
		var checks = $("input[name='productionID']:checked");
		var ids = "";
		for(var i=0;i<checks.length;i++){
			var id = $(checks[i]).attr("value");
			ids+=id;
			if(i+1<checks.length){
				ids+=",";
			}
		}
		var lsID = $("#lsSel").val();
		var url="/a/logistics/productionLogistics/createSend";
		var d={ids:ids,lsID:lsID};
		startUp.postData(url,d,function(data){
			if(data.flag){
				window.alertx("新增发货成功");
				$("a[class='jbox-close']").trigger("click");
				window.location.reload();	
			}
		});
	});
	//选择物流单号
	$(document).off("change","select[name='lsSel']").on("change","select[name='lsSel']",function(){
		$("#createSubName").text("");
		$("#createSubName").select2();
		$("#lsSel").select2();
		$("#boxList").html("");
		getBuildingByCondition();
	});	
	//选择楼栋号
	$(document).off("change","select[name='createSubName']").on("change","select[name='createSubName']",function(){
		getDataByCondition();
	});	
	//拉取楼栋数据
	function getBuildingByCondition(){
		var lsID = $("#lsSel").val();
		var url="/a/logistics/productionLogistics/getBoxDataByCondition";
		var d={lsID:lsID};
		startUp.postData(url,d,function(data){
			var subHtml=subHtmlUtils("",data.sub,data.listSub);
			$("#createSubName").html(subHtml);
			getDataByCondition();
//			$("#lsSel").select2();
//			$("#createSubName").select2();
		});
	}
	//根据条件获取相应数据
	function getDataByCondition(){
		var lsID = $("#lsSel").val();
		var subID = $("#createSubName").val();
		
		var url="/a/logistics/productionLogistics/getBoxDataByCondition";
		var d={lsID:lsID,subID:subID};
		startUp.postData(url,d,function(data){
			var boxHtml=boxHtmlUtils(data.listProduction);
			$("#boxList").html(boxHtml);
			
			$("#lsSel").select2();
			$("#createSubName").select2();
		});
	}
	//加载楼栋号
	function subHtmlUtils(subID,subs,listSub){
		var subHtml="";
		if(!subID){
			subHtml+="<option selected='selected' value='"+subs.id+"'>"+subs.buildingDisplayName+"</option>";
			for(var i=1;i<listSub.length;i++){
				var production=listSub[i];
				subHtml+="<option selected='selected' value='"+production.sub.id+"'>"+production.sub.buildingDisplayName+"</option>";
			}
		}else{
			$.each(listSub,function(i,item){
				if(subID==item.id){
					subHtml+="<option selected='selected' value='"+item.sub.id+"'>"+item.sub.buildingDisplayName+"</option>";
				}else{
					subHtml+="<option value='"+item.sub.id+"'>"+item.sub.buildingDisplayName+"</option>";
				}
			});
		}
		return subHtml;
	}
	//加载箱数据
	function boxHtmlUtils(listProduction){
		var boxHtml="";
		$.each(listProduction,function(i,item){
			boxHtml+="<tr>\
					<td><input type='checkbox' name='productionID' value='"+item.id+"'></td>\
					<td>"+item.orderBomBox.boxNo+"</td>\
					</tr>";
		});
		return boxHtml;
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
});

