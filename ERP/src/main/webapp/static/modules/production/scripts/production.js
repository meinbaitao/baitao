$(function(){
	//表单提交
	$("#signBtn").unbind("click").bind("click",function(){
//		$("#signForm").submit();
		submitWValidLoading($("#signForm"));
	});
	//入库提交
	$("#intakeBtn").unbind("click").bind("click",function(){
//		$("#intakeForm").submit();
		submitWValidLoading($("#intakeForm"));
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
	//选择加工厂连带数据
	$(document).off("change","#jgc").on("change","#jgc",function(){
		var jgcID = $(this).val();
		var contactphone = $(this).find("option[value='"+jgcID+"']").attr("contactphone");
		var contact = $(this).find("option[value='"+jgcID+"']").attr("contact");
		if(contactphone){
			$("#contactphone").val(contactphone);
		}
		if(contact){
			$("#contact").val(contact);
		}
	});
	//根据选择的项目查看对应的下料单
	$("i[attrID='getObbByProID']").unbind("click").bind("click",function(){
		var url = "/a/production/production/getObbByProID";
		var attrVal = $(this).attr("attrVal");
		getObbDetailByUrl($(this),url,attrVal);
	});
	//
	$(document).off("click","i[attrID='getDetailByObbID']").on("click","i[attrID='getDetailByObbID']",function(){
		var url = "/a/production/production/getDetailByObbID";
		var attrVal = $(this).attr("attrVal");
		getDetailByUrl($(this),url,attrVal);
	});
	//生成项目的下级
	function getObbDetailByUrl(thisTagert,url,attrID){
		var proID = thisTagert.attr("thisTagertId");
//		var status = thisTagert.attr("attrStatus");
		var isStatus = $("#isStatus").val();
		var searchStatus = $("#searchStatus").val();
		var isOpen = $("#pro"+proID).siblings("tr[pid=pro"+proID+"]");
		if(isOpen.length>0){//判断有下级数据则删除数据并不请求后台
			isOpen.remove();
			cleanChildrens(isOpen);
			return;
		}
		//请求详情数据
		var d = {proID:proID,isStatus:isStatus,attrID:attrID,searchStatus:searchStatus};
		startUp.postData(url,d,function(data){
			var html="";
			var obbDetail =$("#pro"+proID);
			if(attrID=="commissionerAssign"){
				html=getObbaseHtmlByProForcommissionerAssign(proID,data,isStatus,attrID);
			}else{
				html=getObbaseHtmlByPro(proID,data,isStatus,attrID);
			}
			
			if(!html){
				html="<tr pid='pro"+proID+"' class='active' haschild='true' previd='' islastone='true' depth='2'>\
						<td colspan='8' class='red'>暂无数据</td>\
					  </tr>";
			}
			
			removeChildren($("#pro"+proID).siblings("tr[pid^=pro"+proID+"]"));	//重复点击是删除上次沉余的数据
			obbDetail.after(html);
			treeTable_input_chk();
		});
	}
	//项目下面的详细下料单界面
	function getObbaseHtmlByPro(proID,data,isStatus,attrID){
		var html="";
		var objs = data.list;
		var returnUrl = $("#returnUrl").val();
		for(var i=0;i<objs.length;i++){
			var obj=objs[i];
			var boxTD = cBoxHtml(obj.status==isStatus,"obbaseBox",obj.orderBomBase.id);
			var tr="<tr id='obb"+obj.orderBomBase.id+"' pid='pro"+proID+"' class='active' haschild='true' islastone='true' depth='2'>\
						<td colspan='10'>\
							<div style='float:left;padding-left:20px;'>\
								"+boxTD+"\
					        	<a style='color:grey;' href='javascript:void(0)'><i thisTagertId='"+obj.orderBomBase.id+"' attrStatus='"+isStatus+"' attrVal='"+attrID+"' attrID='getDetailByObbID' class='glyphicon glyphicon-triangle-right'></i></a>\
						        <label class='operation-project'>\
						        	<a href='"+startUp.getRootPath()+"/a/orbom/orderBomShowDetail/showDetail?orderBomId="+obj.orderBomBase.id+"&orderType="+obj.orderBomBase.orderType+"&uniformMaterielType="+obj.orderBomBase.uniformMaterielType+"&returnUrl="+returnUrl+"'>\
						        		"+obj.orderBomBase.orderBomNo+"&nbsp;&nbsp;【"+obj.orderBomBase.orderTypeVal+"】&nbsp;&nbsp;【"+obj.orderBomBase.stoneColorName+"】&nbsp;&nbsp;【"+obj.sub.stoneExpectDate+"】&nbsp;&nbsp;【"+parseFloat(obj.orderBomDetail.area).toFixed(2)+"】\
						        	</a>\
						        </label>\
						    </div>\
						</td>\
				</tr>";
			html = trHtml(obj.status==isStatus,tr,html);
//			html+=tr;
		}
		return html;
	}
	//根据送进来的url获取相应的详情列表数据
	function getDetailByUrl(thisTagert,url,attrVal){
		var obbID = thisTagert.attr("thisTagertId");
//		var status = thisTagert.attr("attrStatus");
		var isStatus = $("#isStatus").val();
		var isOpen = $("#obb"+obbID).siblings("[pid=obb"+obbID+"]");
		if(isOpen.length>0){//判断有下级数据则删除数据并不请求后台
			$("#obb"+obbID).siblings("[pid=obb"+obbID+"]").remove();
			cleanChildrens(isOpen);
			return;
		}
		//请求详情数据
		var d = {obbID:obbID,attrVal:attrVal,isStatus:isStatus};
		startUp.postData(url,d,function(data){
			var html="";
			var obbDetail =$("#obb"+obbID);
			if(attrVal=="commissionerAssign"){
				html=commissionerAssignHtml(obbID,data,isStatus);
			}else if(attrVal=="operateAssign"){
				html=operateAssignHtml(obbID,data,isStatus);
			}else if(attrVal=="waitAssign"){
				html=waitAssignHtml(obbID,data,isStatus);
			}else if(attrVal=="waitSign"||attrVal=="waitProduction"||attrVal=="waitIntake"){
				html=jgcProductionHtml(obbID,data,isStatus);
			}/*else if(fname=="waitProduction"){
				html=jgcProductionHtml(obbID,data,isStatus);
			}else if(fname=="waitIntake"){
				html=jgcProductionHtml(obbID,data,isStatus);
			}*/
			
			removeChildren($("#obb"+obbID).siblings("[pid=obb"+obbID+"]"));	//重复点击是删除上次沉余的数据
			obbDetail.after(html);
			treeTable_input_chk();
		});
	}
	//运营下石材管理显示下料单
	function getObbaseHtmlByProForcommissionerAssign(proID,data,isStatus){
		var html="";
		var objs = data.list;
		var returnUrl = $("#returnUrl").val();
		for(var i=0;i<objs.length;i++){
			var obj=objs[i];
			var boxTD = cBoxHtml(obj.status==isStatus,"cBox",obj.orderBomBase.id);
			var tr="<tr pid='pro"+proID+"' class='active' haschild='true' previd='' islastone='true' depth='2'>\
				<td class='td_fr'>&nbsp;&nbsp;└"+boxTD+"</td>\
				<td><a href='"+startUp.getRootPath()+"/a/orbom/orderBomShowDetail/showDetail?orderBomId="+obj.orderBomBase.id+"&orderType="+obj.orderBomBase.orderType+"&uniformMaterielType="+obj.orderBomBase.uniformMaterielType+"&returnUrl="+returnUrl+"'>\
						        		"+obj.orderBomBase.orderBomNo+"&nbsp;&nbsp;\
						        	</a></td>\
				<td>"+obj.orderBomBase.orderTypeVal+"</td>\
				<td>"+obj.orderBomBase.stoneColorName+"</td>\
				<td>"+parseFloat(obj.orderBomDetail.area).toFixed(2)+"</td>\
				<td>"+obj.sub.stoneExpectDate+"</td>\
				<td>"+obj.directorremarks+"</td>\
				<td>"+obj.amaldarremarks+"</td>\
				</tr>";
//			html+=tr;
			html = trHtml(obj.status==isStatus,tr,html);
		}
		return html;
	}
	
	//运营主管根据下料单编号获取相应的列表详情数据	operateAssign
	function operateAssignHtml(obbID,data,isStatus){
		var html="";
		var objs = data.list;
		for(var i=0;i<objs.length;i++){
			var obj=objs[i];
			var boxTD = cBoxHtml(obj.status==isStatus,"cBox",obj.id);
			var tr="<tr pid='obb"+obbID+"' class='active' haschild='true' previd='' islastone='true' depth='2'>\
				<td class='td_fr'></td>\
				<td>&nbsp;&nbsp;└"+boxTD+"</td>\
				<td>"+obj.orderBomDetail.boxNo+"</td>\
				<td>"+obj.orderBomDetail.materielNo+"</td>\
				<td>"+obj.assignto.name+"</td>\
				<td>"+obj.supp.name+"</td>\
				<td>"+obj.supp.businessPreson+"</td>\
				<td>"+obj.supp.businessTel+"</td>\
				<td>"+obj.statusLab+"</td>\
				</tr>";
//			html+=tr;
			html = trHtml(obj.status==isStatus,tr,html);
		}
		return html;
	}
	//生产经理查看待指派列表数据
	function waitAssignHtml(obbID,data,isStatus){
		var html="";
		var objs = data.list;
		for(var i=0;i<objs.length;i++){
			var obj=objs[i];
			var boxTD = cBoxHtml(obj.status==isStatus,"cBox",obj.id);
			var tr="<tr pid='obb"+obbID+"' class='active' haschild='true' previd='' islastone='true' depth='2'>\
				<td></td>\
				<td class='td_fr'>&nbsp;&nbsp;└"+boxTD+"</td>\
				<td>"+obj.orderBomDetail.boxNo+"</td>\
				<td>"+obj.orderBomDetail.materielNo+"</td>\
				<td>"+obj.documentaryby.name+"</td>\
				<td>"+obj.supp.name+"</td>\
				<td>"+obj.supp.businessPreson+"</td>\
				<td>"+obj.supp.businessTel+"</td>\
				<td>"+obj.amaldarremarks+"</td>\
				<td>"+obj.statusLab+"</td>\
				</tr>";
//			html+=tr;
			html = trHtml(obj.status==isStatus,tr,html);
		}
		return html;
	}
	//加工厂界面Html
	function jgcProductionHtml(obbID,data,isStatus){
		var html="";
		var objs = data.list;
		for(var i=0;i<objs.length;i++){
			var obj=objs[i];
			var boxTD = cBoxHtml(obj.status==isStatus,"cBox",obj.id);
			var tr="<tr pid='obb"+obbID+"' class='active' haschild='true' previd='' islastone='true' depth='2'>\
				<td></td>\
				<td class='td_fr'>&nbsp;&nbsp;└"+boxTD+"</td>\
				<td>"+obj.orderBomDetail.boxNo+"</td>\
				<td>"+obj.orderBomDetail.materielNo+"</td>\
				<td>"+obj.finishDateLab+"</td>\
				<td>"+obj.remarks+"</td>\
				<td>"+obj.statusLab+"("+obj.supp.businessPreson+")</td>\
				</tr>";
//			html+=tr;
			html = trHtml(obj.status==isStatus,tr,html);
		}
		return html;
	}
	//选择生产经理带出相应的加工厂数据
	$(document).off("change","#scjl").on("change","#scjl",function(){
//		$("#saveAP").removeAttr("disabled");
		var uid = $(this).val();
		var sel = $("#jgc"); 
		var d={uid:uid};
		var url="/a/production/production/getSuppByUid";
		startUp.postData(url,d,function(data){
			sel.text("");
			sel.append("<option value=''>请选择</option>");
			$.each(data,function(i,item){
				var option ="<option contactphone='"+item.supp.businessTel+"' contact='"+item.supp.businessPreson+"' value='"+item.supp.id+"'>"+item.supp.name+"</option>";
				sel.append(option);
			});
		});
	});
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
	//true tr加在原有的html前面，反之加在后面
	function trHtml(flag,tr,html){
		if(flag){
			return html=tr+html;
		}else{
			return html+=tr;
		}
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

