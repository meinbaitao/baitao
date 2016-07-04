$(function(){
	//选择项目带出户型
	$(document).off("change","select[name^='projectName']").on("change","select[name^='projectName']",function(){
		cleanHouseType();
		changeProjectName();
	});
	//选择户型带出楼栋号
	$(document).off("change","select[name^='houseType']").on("change","select[name^='houseType']",function(){
		cleanBuilding();
		changeHouseType();
	});
	//选择户型带出楼栋号
	$(document).off("change","select[name^='building']").on("change","select[name^='building']",function(){
		cleanSendee();
		changeBuilding();
	});
	//选择施工班组带出材料名称
	$(document).off("change","select[name^='sendee']").on("change","select[name^='sendee']",function(){
		cleanMaterialName();
		changeSendee();
	});
});
function cleanHouseType(){
	$("#houseType").empty();
	$("#houseType").select2();
	cleanBuilding();
}
function cleanBuilding(){
	$("#building").empty();
	$("#building").select2();
	cleanSendee();
}
function cleanSendee(){
	$("#sendee").empty();
	$("#sendee").select2();
	cleanMaterialName();
}
function cleanMaterialName(){
	$("#materialName").empty();
	$("#materialName").select2();
	$("#orderTypeVal").empty();
	$("#orderTypeVal").select2();
}
//选择项目带出户型
function changeProjectName(){
	var projectName = $("#projectName").val();
	if(!projectName){
		return;
	}
	var imt = $("#imt").val();
	var url = "/a/inventory/standingBook/getHouseTypeByProjectName";
	var d={projectName:projectName,imt:imt};
	startUp.postAsyncData(url,d,function(data){
		//户型
		var houseType = $("#houseType");
		var defaultHouseType = $("#defaultHouseType").val();
		houseType.text("");
		houseType.append("<option value=''> </option>");
		var option="";
		$.each(data.listData,function(i,item){
			if(defaultHouseType==item.standingBook.subIn.houseType){
				option ="<option selected='selected' value='"+item.standingBook.subIn.houseType+"'>"+item.standingBook.subIn.houseType+"</option>";
			}else{
				option ="<option value='"+item.standingBook.subIn.houseType+"'>"+item.standingBook.subIn.houseType+"</option>";
			}
			houseType.append(option);
		});
		$("#building").text("");
		$("#materialName").text("");
		changeHouseType();
	});
}
//选择户型带出楼栋号
function changeHouseType(){
	var projectName = $("#projectName").val();
	var houseType = $("#houseType").val();
	if(!houseType){
		return;
	}
	var imt = $("#imt").val();
	var url = "/a/inventory/standingBook/getBuildingByHouseType";
	var d={projectName:projectName,houseType:houseType,imt:imt};
	startUp.postAsyncData(url,d,function(data){
		var building = $("#building");
		var defaultBuilding = $("#defaultBuilding").val();
		building.text("");
		building.append("<option value=''> </option>");
		var option ="";
		$.each(data.listData,function(i,item){
			if(defaultBuilding==item.standingBook.subIn.building){
				option ="<option selected='selected' value='"+item.standingBook.subIn.building+"'>"+item.standingBook.subIn.buildingDisplayName+"</option>";
			}else{
				option ="<option value='"+item.standingBook.subIn.building+"'>"+item.standingBook.subIn.buildingDisplayName+"</option>";
			}
			building.append(option);
		});
		building.select2();
		$("#materialName").text("");
		changeBuilding();
	});
}
//选择楼栋带出相应的数据
function changeBuilding(){
	var projectName = $("#projectName").val();
	var houseType = $("#houseType").val();
	var building = $("#building").val();
	if(!building){
		return;
	}
	var imt = $("#imt").val();
	var url = "/a/inventory/standingBook/getSendeeByBuilding";
	var d={projectName:projectName,houseType:houseType,building:building,imt:imt};
	startUp.postAsyncData(url,d,function(data){
		var sendee = $("#sendee");
		var defaultSendee = $("#defaultSendee").val();
		sendee.text("");
		sendee.append("<option value=''> </option>");
		var option ="";
		$.each(data.listData,function(i,item){
			if(defaultSendee==item.standingBook.sendee){
				option ="<option selected='selected' value='"+item.standingBook.sendee+"'>"+item.standingBook.sendee+"</option>";
			}else{
				option ="<option value='"+item.standingBook.sendee+"'>"+item.standingBook.sendee+"</option>";
			}
			sendee.append(option);
		});
		sendee.select2();
		changeSendee();
		//户型
//		if(imt=="gfl"){	//钢辅料
//			var materialName = $("#materialName");
//			var defaultMaterialName = $("#defaultMaterialName").val();
//			materialName.text("");
//			materialName.append("<option value=''> </option>");
//			var option ="";
//			$.each(data.listData,function(i,item){
//				if(defaultMaterialName==item.materialName){
//					option ="<option selected='selected' value='"+item.materialName+"'>"+item.materialName+"</option>";
//				}else{
//					option ="<option value='"+item.materialName+"'>"+item.materialName+"</option>";
//				}
//				materialName.append(option);
//			});
//		}else if(imt=="sc"){	//石材
//			var orderTypeVal = $("#orderTypeVal");
//			var defaultOrderTypeVal = $("#defaultOrderTypeVal").val();
//			orderTypeVal.text("");
//			orderTypeVal.append("<option value=''> </option>");
//			var option ="";
//			$.each(data.listOut,function(i,item){
//				if(defaultOrderTypeVal==item.orderBomBase.orderTypeVal){
//					option ="<option selected='selected' value='"+item.orderBomBase.orderTypeVal+"'>"+item.orderBomBase.orderTypeVal+"</option>";
//				}else{
//					option ="<option value='"+item.orderBomBase.orderTypeVal+"'>"+item.orderBomBase.orderTypeVal+"</option>";
//				}
//				orderTypeVal.append(option);
//			});
//		}
		
	});
}
//选择施工班组
function changeSendee(){
	var projectName = $("#projectName").val();
	var houseType = $("#houseType").val();
	var building = $("#building").val();
	var sendee = $("#sendee").val();
	if(!sendee){
		return;
	}
	var imt = $("#imt").val();
	var url = "/a/inventory/standingBook/getDataBySendee";
	var d={projectName:projectName,houseType:houseType,building:building,sendee:sendee,imt:imt};
	startUp.postAsyncData(url,d,function(data){
		var materialName = $("#materialName");
		var defaultMaterialName = $("#defaultMaterialName").val();
		materialName.text("");
		materialName.append("<option value=''> </option>");
		var option ="";
		if(imt=="gfl"){	//钢辅料
			$.each(data.listData,function(i,item){
				if(defaultMaterialName==item.inventory.materialName){
					option ="<option selected='selected' value='"+item.inventory.materialName+"'>"+item.inventory.materialName+"</option>";
				}else{
					option ="<option value='"+item.inventory.materialName+"'>"+item.inventory.materialName+"</option>";
				}
				materialName.append(option);
			});
		}else {
			var orderTypeVal = $("#orderTypeVal");
			var defaultOrderTypeVal = $("#defaultOrderTypeVal").val();
			orderTypeVal.text("");
			orderTypeVal.append("<option value=''> </option>");
			var option ="";
			$.each(data.listOrderTypes,function(i,item){
				if(defaultOrderTypeVal==item.orderBomBase.orderTypeVal){
					option ="<option selected='selected' value='"+item.orderBomBase.orderTypeVal+"'>"+item.orderBomBase.orderTypeVal+"</option>";
				}else{
					option ="<option value='"+item.orderBomBase.orderTypeVal+"'>"+item.orderBomBase.orderTypeVal+"</option>";
				}
				orderTypeVal.append(option);
			});
//			$.each(data.listData,function(i,item){
//				if(defaultMaterialName==item.inventory.materialName){
//					option ="<option selected='selected' value='"+item.inventory.materialName+"'>"+item.inventory.materialName+"</option>";
//				}else{
//					option ="<option value='"+item.inventory.materialName+"'>"+item.inventory.materialName+"</option>";
//				}
//				materialName.append(option);
//			});
		}
		
		materialName.select2();
		//户型
//		if(imt=="gfl"){	//钢辅料
//			var materialName = $("#materialName");
//			var defaultMaterialName = $("#defaultMaterialName").val();
//			materialName.text("");
//			materialName.append("<option value=''> </option>");
//			var option ="";
//			$.each(data.listData,function(i,item){
//				if(defaultMaterialName==item.materialName){
//					option ="<option selected='selected' value='"+item.materialName+"'>"+item.materialName+"</option>";
//				}else{
//					option ="<option value='"+item.materialName+"'>"+item.materialName+"</option>";
//				}
//				materialName.append(option);
//			});
//		}else if(imt=="sc"){	//石材
//			var orderTypeVal = $("#orderTypeVal");
//			var defaultOrderTypeVal = $("#defaultOrderTypeVal").val();
//			orderTypeVal.text("");
//			orderTypeVal.append("<option value=''> </option>");
//			var option ="";
//			$.each(data.listOut,function(i,item){
//				if(defaultOrderTypeVal==item.orderBomBase.orderTypeVal){
//					option ="<option selected='selected' value='"+item.orderBomBase.orderTypeVal+"'>"+item.orderBomBase.orderTypeVal+"</option>";
//				}else{
//					option ="<option value='"+item.orderBomBase.orderTypeVal+"'>"+item.orderBomBase.orderTypeVal+"</option>";
//				}
//				orderTypeVal.append(option);
//			});
//		}
		
	});
}
