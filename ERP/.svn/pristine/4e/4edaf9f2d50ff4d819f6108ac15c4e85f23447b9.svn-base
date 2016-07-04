$(function(){
	/**
	 * start	2015年12月3日
	 */
	//保存按钮提交表单
	$("#saveBtn").on("click",function(){
//		$("#saveFrom").submit();
		submitWValidLoading($("#saveForm"));
	});
//	//选择项目带出户型
//	$(document).off("change","select[name^='listPro']").on("change","select[name^='listPro']",function(){
//		var projectName = $(this).val();
//		var tr = $(this).parent().parent("tr"); 
//		var url = "/a/inventory/inventory/getHouseTypeByProjectName";
//		var imt = $("#imt").val();	//INVENTORY_MATERIAL_TYPE
//		var d={projectName:projectName,imt:imt};
//		startUp.postAsyncData(url,d,function(data){
//			//出库户型
//			var sel = $("#housetypeSel");
//			sel.text("");
//			sel.append("<option selected='selected' value=''>请选择</option>");
//			$.each(data.listOut,function(i,item){
//				var option ="<option value='"+item.sub.houseType+"'>"+item.sub.houseType+"</option>";
//				sel.append(option);
//			});
//			houseTypeInit($("#claimHouseType"),data.listIn);	//用到户型
//		});
//	});
//	//户型数据初始化
//	function houseTypeInit(sel,data){
//		sel.text("");
//		sel.append("<option selected='selected' value=''>请选择</option>");
//		$.each(data,function(i,item){
//			var option ="<option value='"+item.houseType+"'>"+item.houseType+"</option>";
//			sel.append(option);
//		});
//	}
//	//领料户型带出领料楼栋
//	$(document).off("change","select[name^='claimHouseType']").on("change","select[name^='claimHouseType']",function(){
//		var houseType = $(this).val();
//		var projectName = $("#listPro").val();
//		var tr = $(this).parent().parent("tr"); 
//		var imt = $("#imt").val();	//INVENTORY_MATERIAL_TYPE
//		var url = "/a/inventory/inventory/getInBuildingByHouseType";
//		var d={projectName:projectName,houseType:houseType,imt:imt};
//		startUp.postAsyncData(url,d,function(data){
//			buildingInit($("#claimBuilding"),data.listBuilding);	//用到户型
//		});
//	});
//	//出库户型带出出库楼栋
//	$(document).off("change","select[name^='housetypeSel']").on("change","select[name^='housetypeSel']",function(){
//		var houseType = $(this).val();
//		var projectName = $("#listPro").val();
//		var tr = $(this).parent().parent("tr"); 
//		var imt = $("#imt").val();	//INVENTORY_MATERIAL_TYPE
//		var url = "/a/inventory/inventory/getOutBuildingByHouseType";
//		var d={projectName:projectName,houseType:houseType,imt:imt};
//		startUp.postAsyncData(url,d,function(data){
//			var sel=$("#buildingSel");
//			sel.text("");
//			sel.append("<option selected='selected' value=''>请选择</option>");
//			$.each(data.listBuilding,function(i,item){
//				var option ="<option value='"+item.sub.building+"'>"+item.sub.building+"</option>";
//				sel.append(option);
//			});
//		});
//	});
//	//楼栋数据初始化
//	function buildingInit(sel,data){
//		sel.text("");
//		sel.append("<option selected='selected' value=''>请选择</option>");
//		$.each(data,function(i,item){
//			var option ="<option value='"+item.building+"'>"+item.building+"</option>";
//			sel.append(option);
//		});
//	}
//	//根据项目相关信息获取对应的	劳务合同已经相关的下料
//	$(document).off("change","select[name^='claimBuilding']").on("change","select[name^='claimBuilding']",function(){
//		var building = $("#claimBuilding").val();
//		var projectName = $("#listPro").val();
//		var tr = $(this).parent().parent("tr"); 
//		var imt = $("#imt").val();
//		var url = "/a/inventory/inventory/getContractAndListByProject";
//		var d={projectName:projectName,building:building,imt:imt};
//		startUp.postAsyncData(url,d,function(data){
//			var list = data.listData;
//			var sel = $("#laborDemand");
//			if(list.length==0){
//				$("#ldTD").html("<input id='laborDemand' class='input-small' name='laborDemand' value='' type='text'>");
//			}else{
//				sel.text("");
//				sel.append("<option selected='selected' value=''>请选择</option>");
//				$.each(list,function(i,item){
//					var option ="<option value='"+item.id+"'>"+item.ctype+"</option>";
//					sel.append(option);
//				});
//			}
//			if(imt=="gfl"){
//				gflHtml(data);
//			}else if(imt=="sc"){
//				scHtml(data);
//			}
//			
//		});
//	});
//	function gflHtml(data){
//		var listDetail = data.listDetail;
//		var html="";
//		for(var i=0;i<listDetail.length;i++){
//			var obj=listDetail[i];
//			var tr="<tr >\
//	            		<td ><input attrID='cBox' type='checkbox' name='cBox' value='"+obj.id+"'></td>\
//	            		<td >"+obj.materielNo+"</td>\
//						<td >"+obj.materielName+"</td>\
//						<td >"+obj.standardDesc+"</td>\
//						<td >"+obj.count+"</td>\
//						<td >"+obj.unit+"</td>\
//						<td >0</td>\
//						<td >0</td>\
//						<td >0</td>\
//						<td >0</td>\
//						<td >0</td>\
//						<td >"+obj.remark+"</td>\
//					</tr>";
//			html+=tr;
//		}
//		$("#claimDetail").append(html);
//	}
//	function scHtml(data){
//		var listDetail = data.listDetail;
//		var html="";
//		for(var i=0;i<listDetail.length;i++){
//			var obj=listDetail[i];
//			var tr="<tr >\
//	            		<td ><input attrID='cBox' type='checkbox' name='cBox' value='"+obj.id+"'></td>\
//	            		<td >"+obj.materielName+"</td>\
//						<td >"+obj.boxNo+"</td>\
//						<td >"+obj.materielNo+"</td>\
//						<td >"+obj.standardRadius+"</td>\
//						<td >"+obj.standardLong+"</td>\
//						<td >"+obj.standardWidth+"</td>\
//						<td >"+obj.standardDepth+"</td>\
//						<td >"+obj.processChartNo+"</td>\
//						<td >0</td>\
//						<td >0</td>\
//						<td >0</td>\
//						<td >0</td>\
//						<td >0</td>\
//						<td >0</td>\
//						<td >"+obj.remark+"</td>\
//					</tr>";
//			html+=tr;
//		}
//		$("#claimDetail").append(html);
//	}
	
	/**
	 * end
	 */
	
	//选择户型带出楼栋号
	$(document).off("change","select[name^='housetypeSel']").on("change","select[name^='housetypeSel']",function(){
		var houseType = $(this).val();
		var proName = $("#listPro").val();
//		var obbMaterialType = $("#obbMaterialType").val();
//		var materialType = $("#materialType").val();
		var imt = $("#imt").val();	//INVENTORY_MATERIAL_TYPE
		var tr = $(this).parent().parent("tr"); 
		var sel = $("#buildingSel");
		var url = "/a/inventory/inventory/getBuildingByHouseType";
		var d={proName:proName,houseType:houseType,imt:imt};
		startUp.postAsyncData(url,d,function(data){
			var list = data.listBuilding;
			sel.text("");
			sel.append("<option selected='selected' value=''>请选择</option>");
			$.each(list,function(i,item){
				var option ="<option building='"+item.sub.building+"' value='"+item.sub.id+"'>"+item.sub.building+"</option>";
				sel.append(option);
			});
		});
	});
	//选择楼栋号带出数据	
	$(document).off("change","select[name^='buildingSel']").on("change","select[name^='buildingSel']",function(){
		var houseType = $("#houseTypeSel").val();
		var proName = $("#listPro").val();
		var buildingID = $(this).val();
		var building = $(this).find("option[value='"+buildingID+"']").attr("building");//val();
		var detailHtml = $("#claimDetail");
		var imt = $("#imt").val();	//INVENTORY_MATERIAL_TYPE
		var url = "/a/inventory/inventory/getDataByBuilding";
		var d={proName:proName,houseType:houseType,building:building,imt:imt};
		startUp.postAsyncData(url,d,function(data){
			var list = data.listData;
			var html="";
			if(imt=="gfl"){
				html=getGFLHtml(list);
			}else if(imt=="sc"){
				html=getSCHtml(list);
			}
			detailHtml.html(html);
		});
	});
	function getGFLHtml(data){
		var html="";
		$.each(data,function(i,item){
			html+="<tr list='listInv' class='copy' index='"+i+"'>\
		   		 <td ><input type='checkbox' name='cBox' class='check' name='listInv["+i+"].id' id='listInv["+i+"].id' value='"+item.id+"'></td>\
			     <td >"+item.materialNo+"</td>\
			     <td >"+item.materialType+"</td>\
			     <td >"+item.materialName+"</td>\
			     <td >"+item.quantity+"</td>\
			     <td ><input type='text' class='required input-min' name='quantity"+item.id+"' id='quantity"+item.id+"' value='"+item.quantity+"'></td>\
             </tr>";
		});
		return html;
	}
	function getSCHtml(data){
		var html="";
		$.each(data,function(i,item){
			html+="<tr list='listInv' class='copy' index='"+i+"'>\
		   		 <td ><input type='checkbox' name='cBox' class='check' name='listInv["+i+"].id' id='listInv["+i+"].id' value='"+item.id+"'></td>\
			     <td >"+item.orderBomDetail.boxNo+"</td>\
			     <td >"+item.materialNo+"</td>\
			     <td >"+item.materialName+"</td>\
			     <td >"+item.quantity+"</td>\
			     <td ><input type='text' class='required input-min' name='quantity"+item.id+"' id='quantity"+item.id+"' value='"+item.quantity+"'></td>\
             </tr>";
		});
		return html;
	}

	//根据项目相关信息获取对应的劳务合同
	$(document).off("change","select[name^='claimBuilding']").on("change","select[name^='claimBuilding']",function(){
		var building = $("#claimBuilding").val();
		var proName = $("#listPro").val();
		var tr = $(this).parent().parent("tr"); 
		var sel = $("#laborDemand");
		var url = "/a/inventory/inventory/getContractByProject";
		var d={proName:proName,building:building};
		startUp.postAsyncData(url,d,function(data){
			var list = data.listData;
			if(list.length==0){
				$("#ldTD").html("<input id='laborDemand' name='laborDemand' value='' type='text'>");
			}else{
				sel.text("");
				sel.append("<option selected='selected' value=''>请选择</option>");
				$.each(list,function(i,item){
					var option ="<option value='"+item.id+"'>"+item.ctype+"</option>";
					sel.append(option);
				});
			}
		});
	});
	//选择接收人（施工班组）获取对应的列表数据
	$(document).off("change","select[name^='sendeeSel']").on("change","select[name^='sendeeSel']",function(){
		var sendee = $(this).val();
		var imt = $("#imt").val();
		var proName = $("#listPro").val();
		var building = $("#building").val();
		var url = "/a/inventory/standingBook/searchStandingBook";
		var d={sendee:sendee,imt:imt,building:building,proName:proName};
		startUp.postAsyncData(url,d,function(data){
			var list = data.listSBDetail;
			var html="";
			$.each(list,function(i,item){
				html+="<tr >\
					   		<td >"+(i+1)+"</td>\
					   		<td >"+item.inventory.materialName+"</td>\
					   		<td >"+item.inventory.orderBomDetail.size +"</td>\
					     	<td >"+item.inventory.orderBomDetail.unit +"</td>\
					     	<td >"+item.inventory.orderBomDetail.count +"</td>\
					     	<td >0</td>\
					     	<td >"+item.quantity+"</td>\
					     	<td >"+item.inventory.quantity +"</td>\
						   	<td >"+item.standingBook.sendee +"</td>\
						   	<td >"+item.logLab +"</td>\
			            </tr>";
			});
			$("#standingBookDetail").html(html);
		});
	});
	//库存统计查询列表
	$(document).off("change","select[name^='outBuildingSel']").on("change","select[name^='outBuildingSel']",function(){
		var sendee = $(this).val();
		var imt = $("#imt").val();
		var proName = $("#listPro").val();
		var building = $("#outBuildingSel").val();
		var url = "/a/inventory/inventory/statisticSel";
		var d={proName:proName,building:building,imt:imt};
		startUp.postAsyncData(url,d,function(data){
			var list = data.listData;
			var html="";
			if(imt=="gfl"){
				html=statisticGFLHtml(data.listData);
			}else if(imt=="sc"){
				html=statisticSCHtml(data.listData);
			}
			$("#statisticDetail").html(html);
		});
	});
	function statisticGFLHtml(list){
		var html="";
		$.each(list,function(i,item){
			var incount=parseInt(parseInt(item.quantity)+parseInt(item.outQuantity));//库存余量+领料
			html+="<tr>\
		   		<td >"+(i+1)+"</td>\
			   	<td >"+item.materialName+"</td>\
		     	<td >"+item.orderBomDetail.size+"</td>\
		     	<td >"+item.orderBomDetail.unit+"</td>\
		     	<td >"+item.orderBomDetail.count+"</td>\
		     	<td >0</td>\
		     	<td >"+incount+"</td>\
		     	<td >"+parseInt(parseInt(item.orderBomDetail.count)-incount)+"</td>\
		     	<td >"+item.outQuantity+"</td>\
		     	<td >"+item.quantity+"</td>\
		     	<td >0</td>\
		     	<td >0</td>\
            </tr>";
		});
		return html;
	}
	function statisticSCHtml(list){
		var html="";
		$.each(list,function(i,item){
			var incount=parseInt(parseInt(item.quantity)+parseInt(item.outQuantity));//库存余量+领料
			html+="<tr>\
		   		<td >"+(i+1)+"</td>\
			   	<td >"+item.orderBomDetail.boxNo+"</td>\
		     	<td >"+item.orderBomDetail.materielNo+"</td>\
		     	<td >"+item.orderBomDetail.count+"</td>\
		     	<td >0</td>\
		     	<td >"+incount+"</td>\
		     	<td >"+parseInt(parseInt(item.orderBomDetail.count)-incount)+"</td>\
		     	<td >"+item.outQuantity+"</td>\
		     	<td >"+item.quantity+"</td>\
		     	<td >0</td>\
		     	<td >0</td>\
            </tr>";
		});
		return html;
	}
	/**
	 * end	2015年12月3日
	 */
	
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
