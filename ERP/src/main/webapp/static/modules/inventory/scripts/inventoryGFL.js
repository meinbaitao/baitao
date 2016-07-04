$(function(){
	/**
	 * start	2015年12月3日
	 */
	//保存按钮提交表单
	$(document).off("click","#saveBtn").on("click","#saveBtn",function(){
//	$("#saveBtn").on("click",function(){
//		$("#saveFrom").submit();
		submitWValidLoading($("#saveForm"));
	});
	//选择项目带出户型
	$(document).off("change","select[name^='listPro']").on("change","select[name^='listPro']",function(){
		cleanClaimHouseType();
		cleanOutHouseType();
		
		var projectName = $(this).val();
		var tr = $(this).parent().parent("tr"); 
		var url = "/a/inventory/inventory/getHouseTypeByProjectName";
		var imt = $("#imt").val();	//INVENTORY_MATERIAL_TYPE
		var d={projectName:projectName,imt:imt};
		startUp.postAsyncData(url,d,function(data){
			//出库户型
			var sel = $("#outHouseType");
			sel.text("");
			sel.append("<option selected='selected' value=''>请选择</option>");
			$.each(data.listOut,function(i,item){
				var option ="<option value='"+item.sub.houseType+"'>"+item.sub.houseType+"</option>";
				sel.append(option);
			});
			houseTypeInit($("#claimHouseType"),data.listIn);	//用到户型
		});
	});
	//领料户型带出领料楼栋
	$(document).off("change","select[name^='claimHouseType']").on("change","select[name^='claimHouseType']",function(){
		cleanClaimBuilding();
		var houseType = $(this).val();
		var projectName = $("#listPro").val();
		var tr = $(this).parent().parent("tr"); 
		var imt = $("#imt").val();	//INVENTORY_MATERIAL_TYPE
		var url = "/a/inventory/inventory/getInBuildingByHouseType";
		var d={projectName:projectName,houseType:houseType,imt:imt};
		startUp.postAsyncData(url,d,function(data){
			buildingInit($("#claimBuilding"),data.listBuilding);	//用到户型
		});
	});
	//选择用到栋号带出相应的	劳务合同已经相关的下料数据以及劳务合同
	$(document).off("change","select[name^='claimBuilding']").on("change","select[name^='claimBuilding']",function(){
		getContractAndListByProject();
	});
	$(document).off("change","select[name^='materielType']").on("change","select[name^='materielType']",function(){
		getContractAndListByProject();
	});
	$(document).off("change","select[name^='orderType']").on("change","select[name^='orderType']",function(){
		getContractAndListByProject();
	});
	function cleanClaimHouseType(){
		$("#claimHouseType").empty();
		$("#claimHouseType").select2();
		cleanClaimBuilding();
	}
	function cleanClaimBuilding(){
		$("#claimBuilding").empty();
		$("#claimBuilding").select2();
	}
	function cleanOutHouseType(){
		$("#outHouseType").empty();
		$("#outHouseType").select2();
		cleanOutBuilding();
	}
	function cleanOutBuilding(){
		$("#outBuilding").empty();
		$("#outBuilding").select2();
	}
	//出库户型带出出库楼栋
	$(document).off("change","select[name^='outHouseType']").on("change","select[name^='outHouseType']",function(){
		cleanOutBuilding();
		var houseType = $(this).val();
		var projectName = $("#listPro").val();
		var tr = $(this).parent().parent("tr"); 
		var imt = $("#imt").val();	//INVENTORY_MATERIAL_TYPE
		var url = "/a/inventory/inventory/getOutBuildingByHouseType";
		var d={projectName:projectName,houseType:houseType,imt:imt};
		startUp.postAsyncData(url,d,function(data){
			var sel=$("#outBuilding");
			sel.text("");
			sel.append("<option selected='selected' value=''>请选择</option>");
			$.each(data.listBuilding,function(i,item){
				var option ="<option value='"+item.sub.building+"'>"+item.sub.buildingDisplayName+"</option>";
				sel.append(option);
			});
		});
	});
	//选择出库楼栋带出相应的数据
	$(document).off("change","select[name^='outBuilding']").on("change","select[name^='outBuilding']",function(){
		getDataByOutBuildingFunction();
	});
	
	//确认出库
	$(document).off("click","input[name^='confirmOutBtn']").on("click","input[name^='confirmOutBtn']",function(){
		var flag = $("input[name='cBox']").is(':checked');
		if(!flag){
			window.alertx("请选择相应的列表数据！");
			return;
		}
		var json = cBoxsJsonUtils();
		$("#json").val($.toJSON(json));
		loading();
		$("#saveFrom").submit();
//		submitWValidLoading($("#saveForm"));
	});
	//选择箱号带出箱里面的详细数据
	$(document).off("click","a[attrID^='claimSCbox']").on("click","a[attrID^='claimSCbox']",function(){
		var tr = $(this).parent().parent("tr");
		
		var parentID = tr.attr("id");
		var isOpen = tr.siblings("tr[pid^='"+parentID+"']");
		if(isOpen.length>0){//判断有下级数据则删除数据且不请求后台
			isOpen.remove();
			tr.removeClass("tr_chked");
			tr.find('td:first').find('input').removeAttr("checked");
			tr.find('td:first').find('input').hide();
			return;
		}
		tr.find('td:first').find('input').show();
		
		var obbaseID = tr.attr("attrBaseID");
		var obboxNo = tr.attr("attrBoxNo");
		var projectName = $("#listPro").val();
		var building = $("#claimBuilding").val();
		var url = "/a/inventory/inventory/getBoxDetail";
		var d={projectName:projectName,building:building,obbaseID:obbaseID,obboxNo:obboxNo};
		startUp.postAsyncData(url,d,function(data){
			var html="";
			var obboxList = tr;//$(document).off("#"+parentID).on("#"+parentID);//$("#"+parentID);
			var remarks =$("#remarks");
			html=scBoxDetailHtml(data,parentID);
			
			obboxList.after(html);
			treeTable_input_chk();
		});
		getDataByOutBuildingFunction();
	});
	//石材确认出库
	$(document).off("click","input[name^='confirmSCOutBtn']").on("click","input[name^='confirmSCOutBtn']",function(){
		var flag = $("input[name='cBox']").is(':checked');
		var flagDetail = $("input[name='cBoxDetail']").is(':checked');
		if(!flag&&!flagDetail){
			window.alertx("请选择相应的列表数据！");
			return;
		}
		var cBoxs = $("input[name='cBox']:checked");
		var boxs="";
		for(var i=0;i<cBoxs.length;i++){
			var boxNo = $(cBoxs[i]).attr("value");
			boxs+=boxNo;
			if(i+1<cBoxs.length){
				boxs+=",";
			}
		}
		var cbds = $("input[name='cBoxDetail']:checked");
		var json={inv:[]};
		for(var i=0;i<cbds.length;i++){
			var materielNo = $(cbds[i]).attr("materielNo");
			var detailId = $(cbds[i]).attr("detailId");
			var boxNo = $(cbds[i]).attr("boxNo");
			var countVal = $("#outCount"+materielNo).val();
			
			var p={materielNo:materielNo,detailId:detailId,countVal:countVal,boxNo:boxNo};
			json.inv.push(p);
		}
		$("#json").val($.toJSON(json));
		$("#boxs").val(boxs);
		loading();
		$("#saveFrom").submit();
//		submitWValidLoading($("#saveForm"));
	});
	
	/**
	 * public function
	 */
	//根据相应的项目信息带出相关的列表数据以及相关的施工班组信息
	function getContractAndListByProject(){
		var building = $("#claimBuilding").val();
		var projectName = $("#listPro").val();
		var tr = $("#claimBuilding").parent().parent("tr"); 
		var imt = $("#imt").val();
		var materielType = $("#materielType").val();
		var orderType = $("#orderType").val();
		var url = "/a/inventory/inventory/getContractAndListByProject";
		var d={projectName:projectName,building:building,imt:imt,materielType:materielType,orderType:orderType};
		startUp.postAsyncData(url,d,function(data){
			var list = data.listData;
			var sel = $("#laborDemand");
			if(list.length==0){
				$("#ldTD").html("<input id='laborDemand' class='input-small required' name='laborDemand' value='' type='text'><span class='red'>*</span>");
			}else{
				sel.text("");
				sel.append("<option selected='selected' value=''>请选择</option>");
				$.each(list,function(i,item){
					var option ="<option value='"+item.id+"'>"+item.ctype+"</option>";
					sel.append(option);
				});
			}
			var html="";
			$("#claimDetail").html("");
			if(imt=="gfl"){
				html=gflHtml(data);
			}else if(imt=="sc"){
				html=scHtml(data);
			}
			$("#claimDetail").append(html);
			getDataByOutBuildingFunction();
		});
	}
	//根据楼栋号获取对应的材料数据
	function getDataByOutBuildingFunction(){
		//清空原有数据
		$("td[icID^='ic']").html("0");
		$("input[name^='outCount']").val(0);
		
		var building = $("#outBuilding").val();
		var projectName = $("#listPro").val();
		var orderType = $("#orderType").val();
		if(building){
			var imt = $("#imt").val();	//INVENTORY_MATERIAL_TYPE
			var url = "/a/inventory/inventory/getDataByOutBuilding";
			var d={projectName:projectName,building:building,imt:imt,orderType:orderType};
			startUp.postAsyncData(url,d,function(data){
				var listMap = data.mapQuantity;
				$.each(listMap, function(key, value) { 
					$("td[icID='ic"+key+"']").html(value+"");
					$("input[id='outCount"+key+"']").val(value+"");
				}); 
			});
		}
		//循环判断复选框是否需要显示attrName='checkBox'
		var tds = $("input[attrName='checkBox']");
		for(var i=0;i<tds.length;i++){
			var materielNo = $(tds[i]).attr("materielNo");
			var val = $("input[id='outCount"+materielNo+"']").val();
			if(parseInt(val)<=0){
				$(tds[i]).hide();
			}else{
				$(tds[i]).show();
			}
		}
	}
	//列表数据的json组装
	function cBoxsJsonUtils(){
		var boxs = $("input[name='cBox']:checked");
		var pJson={inv:[]};
		for(var i=0;i<boxs.length;i++){
			var materielNo = $(boxs[i]).attr("value");
			var countVal = $("#outCount"+materielNo).val();
			
			var p={materielNo:materielNo,countVal:countVal};
			pJson.inv.push(p);
		}
		return pJson;
	}
	//楼栋数据初始化
	function buildingInit(sel,data){
		sel.text("");
		sel.append("<option selected='selected' value=''>请选择</option>");
		$.each(data,function(i,item){
			var option ="<option value='"+item.building+"'>"+item.buildingDisplayName+"</option>";
			sel.append(option);
		});
	}
	//户型数据初始化
	function houseTypeInit(sel,data){
		sel.text("");
		sel.append("<option selected='selected' value=''>请选择</option>");
		$.each(data,function(i,item){
			var option ="<option value='"+item.houseType+"'>"+item.houseType+"</option>";
			sel.append(option);
		});
	}
	//钢辅料详情
	function gflHtml(data){
		var listDetail = data.listDetail;
		var html="";
		for(var i=0;i<listDetail.length;i++){
			var obj=listDetail[i];
			var tr="<tr pid='gflCheck'>\
	            		<td ><input attrID='cBox' attrName='checkBox' type='checkbox' name='cBox' materielNo='"+obj.materielNo+"' value='"+obj.materielNo+"'></td>\
	            		<td >"+obj.materielNo+"</td>\
						<td >"+obj.materielName+"</td>\
						<td >"+obj.standardDesc+"</td>\
						<td >"+obj.count+"</td>\
						<td >"+obj.unit+"</td>\
						<td >"+obj.extraData.hasClaimCountQuantity+"</td>\
						<td >"+obj.extraData.notClaimCountQuantity+"</td>\
						<td >"+obj.extraData.exceedCount+"</td>\
						<td icID='ic"+obj.materielNo+"'>0</td>\
						<td ><input id='outCount"+obj.materielNo+"' name='outCount"+obj.materielNo+"' value='0' type='text' class='input-mini' /></td>\
						<td >"+obj.remark+"</td>\
					</tr>";
			html+=tr;
		}
		return html;
	}
	//石材列表详情
	function scHtml(data){
		var listDetail = data.listDetail;
		var html="";
		for(var i=0;i<listDetail.length;i++){
			var obj=listDetail[i];
			var tr="<tr id='parent"+obj.orderBomBase.id+obj.boxNo+"' attrBaseID='"+obj.orderBomBase.id+"' attrBoxNo='"+obj.boxNo+"'>\
	            		<td class='all-check'><input style='display:none;' attrID='cBox' type='checkbox' name='cBox' value='"+obj.boxNo+"'></td>\
	            		<td ><a attrID='claimSCbox' href='javascript:void(0)' class='glyphicon glyphicon-triangle-right'></a>"
	            				+obj.orderBomBase.orderTypeVal+"</td>\
						<td >"+obj.boxNo+"</td>\
						<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td >"+obj.count+"</td>\
						<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td >&nbsp;</td>\
						<td >&nbsp;</td>\
					</tr>";
			html+=tr;
		}
		return html;
	}
	
	//加载石材箱的详情
	function scBoxDetailHtml(data,parentID){
		var listDetail = data.listDetail;
		var html="";
		for(var i=0;i<listDetail.length;i++){
			var obj=listDetail[i];
			var tr="<tr pid='"+parentID+"'>\
	            		<td >&nbsp;</td>\
	            		<td class='check'><input attrName='checkBox' attrID='cBox' type='checkbox' name='cBoxDetail' materielNo='"+obj.materielNo+"' detailId='"+obj.id+"' boxNo='"+obj.boxNo+"'></td>\
						<td >"+obj.boxNo+"</td>\
						<td >"+obj.materielNo+"</td>\
						<td >"+obj.standardRadius+"</td>\
						<td >"+obj.standardLong+"</td>\
						<td >"+obj.standardWidth+"</td>\
						<td >"+obj.standardDepth+"</td>\
						<td >"+obj.processChartNo+"</td>\
						<td >"+obj.extraData.countOrderBomBase+"</td>\
						<td >"+obj.extraData.hasClaimCountQuantity+"</td>\
						<td >"+obj.extraData.notClaimCountQuantity+"</td>\
						<td >"+obj.extraData.exceedCount+"</td>\
						<td icID='ic"+obj.materielNo+"'>0</td>\
						<td ><input id='outCount"+obj.materielNo+"' name='outCount"+obj.materielNo+"' value='0' type='text' class='input-min' /></td>\
						<td >"+obj.remark+"</td>\
					</tr>";
			html+=tr;
		}
		return html;
	}
	/**
	 * end	2015年12月3日
	 */
	
	
//	
//	//选择户型带出楼栋号
//	$(document).off("change","select[name^='housetypeSel']").on("change","select[name^='housetypeSel']",function(){
//		var houseType = $(this).val();
//		var proName = $("#listPro").val();
////		var obbMaterialType = $("#obbMaterialType").val();
////		var materialType = $("#materialType").val();
//		var imt = $("#imt").val();	//INVENTORY_MATERIAL_TYPE
//		var tr = $(this).parent().parent("tr"); 
//		var sel = $("#buildingSel");
//		var url = "/a/inventory/inventory/getBuildingByHouseType";
//		var d={proName:proName,houseType:houseType,imt:imt};
//		startUp.postAsyncData(url,d,function(data){
//			var list = data.listBuilding;
//			sel.text("");
//			sel.append("<option selected='selected' value=''>请选择</option>");
//			$.each(list,function(i,item){
//				var option ="<option building='"+item.sub.building+"' value='"+item.sub.id+"'>"+item.sub.building+"</option>";
//				sel.append(option);
//			});
//		});
//	});
//	//选择楼栋号带出数据	
//	$(document).off("change","select[name^='buildingSel']").on("change","select[name^='buildingSel']",function(){
//		var houseType = $("#houseTypeSel").val();
//		var proName = $("#listPro").val();
//		var buildingID = $(this).val();
//		var building = $(this).find("option[value='"+buildingID+"']").attr("building");//val();
//		var detailHtml = $("#claimDetail");
//		var imt = $("#imt").val();	//INVENTORY_MATERIAL_TYPE
//		var url = "/a/inventory/inventory/getDataByBuilding";
//		var d={proName:proName,houseType:houseType,building:building,imt:imt};
//		startUp.postAsyncData(url,d,function(data){
//			var list = data.listData;
//			var html="";
//			if(imt=="gfl"){
//				html=getGFLHtml(list);
//			}else if(imt=="sc"){
//				html=getSCHtml(list);
//			}
//			detailHtml.html(html);
//		});
//	});
//	function getGFLHtml(data){
//		var html="";
//		$.each(data,function(i,item){
//			html+="<tr list='listInv' class='copy' index='"+i+"'>\
//		   		 <td ><input type='checkbox' name='cBox' class='check' name='listInv["+i+"].id' id='listInv["+i+"].id' value='"+item.id+"'></td>\
//			     <td >"+item.materialNo+"</td>\
//			     <td >"+item.materialType+"</td>\
//			     <td >"+item.materialName+"</td>\
//			     <td >"+item.quantity+"</td>\
//			     <td ><input type='text' class='required input-min' name='quantity"+item.id+"' id='quantity"+item.id+"' value='"+item.quantity+"'></td>\
//             </tr>";
//		});
//		return html;
//	}
//	function getSCHtml(data){
//		var html="";
//		$.each(data,function(i,item){
//			html+="<tr list='listInv' class='copy' index='"+i+"'>\
//		   		 <td ><input type='checkbox' name='cBox' class='check' name='listInv["+i+"].id' id='listInv["+i+"].id' value='"+item.id+"'></td>\
//			     <td >"+item.orderBomDetail.boxNo+"</td>\
//			     <td >"+item.materialNo+"</td>\
//			     <td >"+item.materialName+"</td>\
//			     <td >"+item.quantity+"</td>\
//			     <td ><input type='text' class='required input-min' name='quantity"+item.id+"' id='quantity"+item.id+"' value='"+item.quantity+"'></td>\
//             </tr>";
//		});
//		return html;
//	}
//
//	//根据项目相关信息获取对应的劳务合同
//	$(document).off("change","select[name^='claimBuilding']").on("change","select[name^='claimBuilding']",function(){
//		var building = $("#claimBuilding").val();
//		var proName = $("#listPro").val();
//		var tr = $(this).parent().parent("tr"); 
//		var sel = $("#laborDemand");
//		var url = "/a/inventory/inventory/getContractByProject";
//		var d={proName:proName,building:building};
//		startUp.postAsyncData(url,d,function(data){
//			var list = data.listData;
//			if(list.length==0){
//				$("#ldTD").html("<input id='laborDemand' name='laborDemand' value='' type='text'>");
//			}else{
//				sel.text("");
//				sel.append("<option selected='selected' value=''>请选择</option>");
//				$.each(list,function(i,item){
//					var option ="<option value='"+item.id+"'>"+item.ctype+"</option>";
//					sel.append(option);
//				});
//			}
//		});
//	});
//	//选择接收人（施工班组）获取对应的列表数据
//	$(document).off("change","select[name^='sendeeSel']").on("change","select[name^='sendeeSel']",function(){
//		var sendee = $(this).val();
//		var imt = $("#imt").val();
//		var proName = $("#listPro").val();
//		var building = $("#building").val();
//		var url = "/a/inventory/standingBook/searchStandingBook";
//		var d={sendee:sendee,imt:imt,building:building,proName:proName};
//		startUp.postAsyncData(url,d,function(data){
//			var list = data.listSBDetail;
//			var html="";
//			$.each(list,function(i,item){
//				html+="<tr >\
//					   		<td >"+(i+1)+"</td>\
//					   		<td >"+item.inventory.materialName+"</td>\
//					   		<td >"+item.inventory.orderBomDetail.size +"</td>\
//					     	<td >"+item.inventory.orderBomDetail.unit +"</td>\
//					     	<td >"+item.inventory.orderBomDetail.count +"</td>\
//					     	<td >0</td>\
//					     	<td >"+item.quantity+"</td>\
//					     	<td >"+item.inventory.quantity +"</td>\
//						   	<td >"+item.standingBook.sendee +"</td>\
//						   	<td >"+item.logLab +"</td>\
//			            </tr>";
//			});
//			$("#standingBookDetail").html(html);
//		});
//	});
//	//库存统计查询列表
//	$(document).off("change","select[name^='outBuildingSel']").on("change","select[name^='outBuildingSel']",function(){
//		var sendee = $(this).val();
//		var imt = $("#imt").val();
//		var proName = $("#listPro").val();
//		var building = $("#outBuildingSel").val();
//		var url = "/a/inventory/inventory/statisticSel";
//		var d={proName:proName,building:building,imt:imt};
//		startUp.postAsyncData(url,d,function(data){
//			var list = data.listData;
//			var html="";
//			if(imt=="gfl"){
//				html=statisticGFLHtml(data.listData);
//			}else if(imt=="sc"){
//				html=statisticSCHtml(data.listData);
//			}
//			$("#statisticDetail").html(html);
//		});
//	});
//	function statisticGFLHtml(list){
//		var html="";
//		$.each(list,function(i,item){
//			var incount=parseInt(parseInt(item.quantity)+parseInt(item.outQuantity));//库存余量+领料
//			html+="<tr>\
//		   		<td >"+(i+1)+"</td>\
//			   	<td >"+item.materialName+"</td>\
//		     	<td >"+item.orderBomDetail.size+"</td>\
//		     	<td >"+item.orderBomDetail.unit+"</td>\
//		     	<td >"+item.orderBomDetail.count+"</td>\
//		     	<td >0</td>\
//		     	<td >"+incount+"</td>\
//		     	<td >"+parseInt(parseInt(item.orderBomDetail.count)-incount)+"</td>\
//		     	<td >"+item.outQuantity+"</td>\
//		     	<td >"+item.quantity+"</td>\
//		     	<td >0</td>\
//		     	<td >0</td>\
//            </tr>";
//		});
//		return html;
//	}
//	function statisticSCHtml(list){
//		var html="";
//		$.each(list,function(i,item){
//			var incount=parseInt(parseInt(item.quantity)+parseInt(item.outQuantity));//库存余量+领料
//			html+="<tr>\
//		   		<td >"+(i+1)+"</td>\
//			   	<td >"+item.orderBomDetail.boxNo+"</td>\
//		     	<td >"+item.orderBomDetail.materielNo+"</td>\
//		     	<td >"+item.orderBomDetail.count+"</td>\
//		     	<td >0</td>\
//		     	<td >"+incount+"</td>\
//		     	<td >"+parseInt(parseInt(item.orderBomDetail.count)-incount)+"</td>\
//		     	<td >"+item.outQuantity+"</td>\
//		     	<td >"+item.quantity+"</td>\
//		     	<td >0</td>\
//		     	<td >0</td>\
//            </tr>";
//		});
//		return html;
//	}
//	/**
//	 * end	
//	 */
	
	/**
	 * 调拨	start
	 */
	//调拨选择出库数据
	$(document).off("select2-opening","#transferDetail tr td>select[attr*='outProSel']").on("select2-opening","#transferDetail tr td>select[attr*='outProSel']",function(){
		var materialType = $("#materialType").val();
		var url = "/a/inventory/standingBook/listOutPro";
		var sel = $(this);
		var d={materialType:materialType};
		startUp.postAsyncData(url,d,function(data){
			var listMap = data.listOutPro;
			sel.text("");
			sel.append("<option value=''>请选择</option>");
			$.each(listMap,function(i,item){
				var option ="<option value='"+item.project.name+"'>"+item.project.name+"</option>";
				sel.append(option);
			});
		});
	});
	//调拨选择入库数据
	$(document).off("select2-opening","#transferDetail tr td>select[attr*='inProSel']").on("select2-opening","#transferDetail tr td>select[attr*='inProSel']",function(){
		var materialType = $("#materialType").val();
		var url = "/a/inventory/standingBook/listInPro";
		var sel = $(this);
		var d={materialType:materialType};
		startUp.postAsyncData(url,d,function(data){
			var listMap = data.listInPro;
			sel.text("");
			sel.append("<option value=''>请选择</option>");
			$.each(listMap,function(i,item){
				var option ="<option value='"+item.proName+"'>"+item.proName+"</option>";
				sel.append(option);
			});
		});
	});
});

	/**
	 * 调拨	end
	 */
