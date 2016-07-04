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
		cleanMaterialName();
		changeBuilding();
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
	var url = "/a/inventory/statistic/getHouseTypeByProjectName";
	var d={projectName:projectName,imt:imt};
	startUp.postAsyncData(url,d,function(data){
		//户型
		var houseType = $("#houseType");
		var defaultHouseType = $("#defaultHouseType").val();
		houseType.text("");
		houseType.append("<option value=''> </option>");
		var option="";
		$.each(data.listOut,function(i,item){
			if(defaultHouseType==item.sub.houseType){
				option ="<option selected='selected' value='"+item.sub.houseType+"'>"+item.sub.houseType+"</option>";
			}else{
				option ="<option value='"+item.sub.houseType+"'>"+item.sub.houseType+"</option>";
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
	var url = "/a/inventory/statistic/getBuildingByHouseType";
	var d={projectName:projectName,houseType:houseType,imt:imt};
	startUp.postAsyncData(url,d,function(data){
		//户型
		var building = $("#building");
		var defaultBuilding = $("#defaultBuilding").val();
		building.text("");
		building.append("<option value=''> </option>");
		var option ="";
		$.each(data.listOut,function(i,item){
			if(defaultBuilding==item.sub.building){
				option ="<option selected='selected' value='"+item.sub.building+"'>"+item.sub.buildingDisplayName+"</option>";
			}else{
				option ="<option value='"+item.sub.building+"'>"+item.sub.buildingDisplayName+"</option>";
			}
			building.append(option);
		});
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
	var url = "/a/inventory/statistic/getDataByBuilding";
	var d={projectName:projectName,houseType:houseType,building:building,imt:imt};
	startUp.postAsyncData(url,d,function(data){
		//户型
		if(imt=="gfl"){	//钢辅料
			var materialName = $("#materialName");
			var defaultMaterialName = $("#defaultMaterialName").val();
			materialName.text("");
			materialName.append("<option value=''> </option>");
			var option ="";
			$.each(data.listOut,function(i,item){
				if(defaultMaterialName==item.materialName){
					option ="<option selected='selected' value='"+item.materialName+"'>"+item.materialName+"</option>";
				}else{
					option ="<option value='"+item.materialName+"'>"+item.materialName+"</option>";
				}
				materialName.append(option);
			});
		}else if(imt=="sc"){	//石材
			var orderTypeVal = $("#orderTypeVal");
			var defaultOrderTypeVal = $("#defaultOrderTypeVal").val();
			orderTypeVal.text("");
			orderTypeVal.append("<option value=''> </option>");
			var option ="";
			$.each(data.listOut,function(i,item){
				if(defaultOrderTypeVal==item.orderBomBase.orderTypeVal){
					option ="<option selected='selected' value='"+item.orderBomBase.orderType+"'>"+item.orderBomBase.orderTypeVal+"</option>";
				}else{
					option ="<option value='"+item.orderBomBase.orderType+"'>"+item.orderBomBase.orderTypeVal+"</option>";
				}
				orderTypeVal.append(option);
			});
		}
		
	});
}
