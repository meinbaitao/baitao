$(function(){
	var buildingScheduleId = $("#buildingScheduleId").val();
	var url ="/a/report/weekly/buildingSchedule/attchlist/"+buildingScheduleId;
	startUp.getData(url,function(data){
	var defaul = "<img src='"+ctxStatic+"/images/buildingSchelduleDefaultIcon.jpg' width='300' height='400'/>";
	
	var southImgId = $("#southImgId").html(defaul);
	var northImgId = $("#northImgId").html(defaul);
	var eastImgId = $("#eastImgId").html(defaul);
	var westImgId = $("#westImgId").html(defaul);

	$.each(data, function(idx,item){
		var defaultUrl = ctxStatic+"/images/buildingSchelduleDefaultIcon.jpg";
		var imgSrc = "<img src='"+ ctx + item.attachUrl+"/download?id="+item.id +"' width='300' height='400' onerror='"+defaultUrl+"'/>";
		if(item.type.indexOf("south")!=-1){
			southImgId.empty();
			southImgId.append(imgSrc);
		}else if(item.type.indexOf("north")!=-1){
			northImgId.empty();
			northImgId.append(imgSrc);
		}else if(item.type.indexOf("east")!=-1){
			eastImgId.empty();
			eastImgId.append(imgSrc);
		}else if(item.type.indexOf("west")!=-1){
			westImgId.empty();
			westImgId.append(imgSrc);
		}
		});
	});
});