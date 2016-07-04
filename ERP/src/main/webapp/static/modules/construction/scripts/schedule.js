$(function(){	
	function queryList(projectId){
		if(!projectId){
			if($("#queryScheduleList")[0]){
				projectId=$("#queryScheduleList")[0].getAttribute("thisTagertId");
			}
		}
		$("#projectId").val(projectId);
		var url="/a/schedule/queryschedulelist?projectId="+projectId;
		startUp.getData(url,function(data){
			var projectlist =$("#project"+projectId);
			  $("#project"+projectId).siblings("[pid=project"+projectId+"]").remove();
			  $.each(data, function(idx,item){					  
				 debugger;
				 var tr ="<tr pid='project"+projectId+"' class='active' haschild='true' previd='' islastone='true' depth='2'>"+
				 		 "<td class='td_fr'>└<input type='checkbox'></td>"+
	                     "<td class='operation-project' showWidth='800px' thisTagert='appoint-saider2' id='scheduleDetail' thisTagertId='"+item.id+"'><a href='javascript:void(0)'>"+item.name+"</a></td>"+
	                     "<td id='"+item.id+"Building'>"+item.Building+"</td>"+
			             "<td >"+item.Status+"</td>"+
			             "<td >"+item.SkelentonPlanRatio+"%/"+item.SkeletonCompRatio+"%</td>"+
			             "<td >"+item.StonePlanRatio+"%/"+item.StoneCompRatio+"%</td>"+
			             "<td class='operation-project' showWidth='500px' thisTagert='appoint-saider5' id='scenePhotos' thisTagertId='"+item.scheduleId+"'><a href='javascript:void(0)'>现场照片</a></td>"+
			             "<td id='addScheduleDetail' class='operation-project' showWidth='800px' thisTagert='appoint-saider' thisTagBuilding='"+item.Building+"' thisTagertId='"+item.id+"'><a href='javascript:void(0)'>填写进度</a></td>"+
			             "</tr>";
				 projectlist.after(tr);
			  });
		});
	}
	
	/**
	 * 点击查询二级项目进度
	 */
	$("#queryScheduleList").live("click",function(){
		var projectId=this.getAttribute("thisTagertId");
		if(this.className.indexOf("glyphicon-triangle-right") !=-1){
			return;
		}
		queryList(projectId);
	});
	
	/**
	 * 填写进度
	 */
	$("#addScheduleDetail").live("click",function(){
		var projectId=this.getAttribute("thisTagertId");
		var building=this.getAttribute("thisTagBuilding");
		$("#building").val(building);
		$("#subProjectId").val(projectId);
		$("#scheduleId").val(startUp.uuid());
	});
	
	/**
	 *上传附件
	 */
	$("#uploadAttachment").live("click",function(){
		var scheduleId = $("#scheduleId").val();
		var url ="/a/schedule/uploadfile";
		var param ={"scheduleId":scheduleId};
    	var fileId="file";
    	startUp.ajaxFileUpload(url,fileId,param,function(data){
    		var url ="/a/schedule/findattachlist?scheduleId="+scheduleId;
    		startUp.getData(url,function(data){
    			var showAttach = $("#showAttach");
    			showAttach.text("");
    			$.each(data, function(idx,item){
    				var a = "<a href='"+item.attachUrl+"/download?fileName="+item.name+"'>"+item.name+"</a>&nbsp;&nbsp;";
    				showAttach.append(a);
    			});
    		});
    	});
    	$("#appoint-saider3").css("display","none");
	});
	
	/**
	 * 计算产值 各栋预计总产值*（骨架完成百分比*20%+石材完成百分比*80%）
	 */
    var revenueCount = function(EstimateRevenue,SkeletonCompRatio,StoneCompRatio){
    	var revenue=0;
    	revenue = parseInt(EstimateRevenue*((SkeletonCompRatio/100)*0.2+(StoneCompRatio/100)*0.8));
    	$("#revenue").val(revenue);
    	return revenue;
    }
	
    /**
     * 上传图片
     */
    $("#uploadImages").live("click",function(){
    	var scheduleId = $("#scheduleId").val();
    	var iconImg = $("#iconImg").val();
    	if(!iconImg){
    		return;
    	}
    	iconImg =iconImg.substring(iconImg.lastIndexOf(".")+1,iconImg.length);
    	if(!startUp.verificationPic(iconImg)){
			alert("图片格式不正确!");
			return;
		}
		var url ="/a/schedule/uploadimage";
    	var param ={"scheduleId":scheduleId};
    	var fileId="iconImg";
    	startUp.ajaxFileUpload(url,fileId,param,function(){
        	var url ="/a/schedule/findattachlist?scheduleId="+scheduleId;
        	startUp.getData(url,function(data){
    			var showImg = $("#showImg");
    			showImg.text("");
    			$.each(data, function(idx,item){
    				var img = "<img style='width:40px;' src='"+item.attachUrl+"/download?fileName="+item.name+"' />&nbsp;&nbsp;";
    				if(startUp.verificationPic(item.attachType)){
    					showImg.append(img);
    				}
    			});
    		});
    	});
    	$("#appoint-saider4").css("display","none");
	}); 
    
    
    /**
     * 点击查看详细进度
     */
    $("#scheduleDetail").live("click",function(){
    	var subProjectId=this.getAttribute("thisTagertId");
    	var url ="/a/schedule/findscheduledetail?subProjectId="+subProjectId;
    	startUp.getData(url,function(data){
			debugger;
			var scheduleDetailList = $("#scheduleDetailList");
			scheduleDetailList.text("");
			$.each(data, function(idx,item){
				var tr = "<tr>"+
							"<td>"+$("#"+subProjectId+"Building").text()+"</td>"+
			               	"<td>"+item.skeletoncompratio+"</td>"+
			               	"<td>"+item.skelentonplanratio+"</td>"+
			               	"<td>"+item.stonecompratio+"</td>"+
			               	"<td>"+item.stoneplanratio+"</td>"+
			               	"<td>"+item.revenue+"</td>"+
			               	"<td>"+item.visaCount+"</td>"+
						 "</tr>";
				scheduleDetailList.append(tr);
			});
		});
    });
    
    
    /**
     * 点击查看现场照片
     */
    $("#scenePhotos").live("click",function(){
    	debugger
    	var scheduleId=this.getAttribute("thisTagertId");
    	var url ="/a/schedule/findattachlist?scheduleId="+scheduleId;
    	startUp.getData(url,function(data){
			var showImages = $("#showDetailImages");
			showImages.text("");
			$.each(data, function(idx,item){
				var img = "<li><img src='"+item.attachUrl+"/download?fileName="+item.name+"' /></li>";
				if(startUp.verificationPic(item.attachType)){
					showImages.append(img);
				}
			});
		});
    });
    
    $("#accidentDetail").live("click",function(){
    	var projectId=this.getAttribute("thisTagertId");
    	 var url="/a/accident/listdetail?projectId="+projectId;
    		startUp.getData(url,function(data){
    			 var accidentlist =$("#accidentDetailList");
    			 accidentlist.text("");
    			  $.each(data, function(idx,item){
    				  var status = item.status==0?"待处理":"已处理";
    				  var tr ="<tr>"+
    	                     "<td>"+item.problemComment+"</td>"+
    	                     "<td>"+item.problemType+"</td>"+
    			             "<td>"+item.punishPrice+"</td>"+
    			             "<td>"+item.supplyPrice+"</td>"+
    			             "<td>"+fomatDate(item.createDate)+"</td>"+
    			             "<td>"+status+"</td>"+
    			             "</tr>";
    				  accidentlist.append(tr);
    			  });
    		});
    });

	queryList();
});
