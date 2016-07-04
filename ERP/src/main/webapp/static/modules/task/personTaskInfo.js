$(document).ready(function() {
			$("#deleteTaskPlan").live("click",function(){
				var falg = $("input[name='chktaskPlan']").is(':checked');
				var deptId = $("#deptId").val();
				var ids ="";
				if(falg){
					window.confirmx('确认要删除该计划吗？',function(){
						var lists =$("input[name='chktaskPlan']:checked");
						
						$.each(lists, function(idx,item){
							ids =ids+item.id+",";
						});
						if(ids){
							ids=ids.substring(0,ids.lastIndexOf(","));						
							var url=startUp.getRootPath()+"/a/task/taskQuotaPlan/deletetaskPlan";
							window.location.href=url+"?id="+ids+"&deptId="+deptId;
						}
					});
				}else{
					window.alertx("请选择需要删除的计划!");
				}
			});
		});
		
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		
		
	$(function(){
		$("#saveProject").on("click",function(){
			$("#inputForm").submit();
		});
		
		$(".saveTaskPlan").bind("click",function(){
			$("#inputForm").attr("action",startUp.getRootPath()+"/a/task/taskQuotaPlan/saveTaskPlan");
		});
		
		$(".updateTaskPlan").bind("click",function(){
			$("#inputForm").attr("action",startUp.getRootPath()+"/a/task/taskQuotaPlan/updateTaskPlan");
		});
	});
	
	
	$("span[name='discu']").live("click",function(){
		var id = this.getAttribute("id")
		var deptId = this.getAttribute("deptid")
		var status = this.getAttribute("status")
			if(this.className=="icon-comment-alt"){
				this.className="icon-comment";
			}else{
				this.className="icon-comment-alt";
			}
		if(!id){
		}else{
			if(!status){
				var url="/a/task/taskPlan/updateDiscussionSuggestion/"+id+"/0/"+deptId;
				startUp.getData(url,function(data){});
			}else{
				var url="/a/task/taskPlan/updateDiscussionSuggestion/"+id+"/"+status+"/"+deptId;
				startUp.getData(url,function(data){});
			}
		}
	});
	
	
	$("span[name='termTask']").live("click",function(){
		var id = this.getAttribute("id")
		var deptId = this.getAttribute("deptid")
		var status = this.getAttribute("status")
			if(this.className=="icon-bookmark-empty"){
				this.className="icon-bookmark";
			}else{
				this.className="icon-bookmark-empty";
			}
		if(!id){
		}else{
			if(!status){
				var url="/a/task/taskPlan/updateLongTermTask/"+id+"/0/"+deptId;
				startUp.getData(url,function(data){});
			}else{
				var url="/a/task/taskPlan/updateLongTermTask/"+id+"/"+status+"/"+deptId;
				startUp.getData(url,function(data){});
			}
		}
	});
	
	
	$("span[name='group']").live("click",function(){
		var id = this.getAttribute("id")
		var deptId = this.getAttribute("deptid")
		var status = this.getAttribute("status")
			if(this.className=="icon-star-empty"){
				this.className="icon-star";
			}else{
				this.className="icon-star-empty";
			}
		if(!id){
		}else{
			if(!status){
				var url="/a/task/taskPlan/updateGroupConcern/"+id+"/0/"+deptId;
				startUp.getData(url,function(data){});
			}else{
				var url="/a/task/taskPlan/updateGroupConcern/"+id+"/"+status+"/"+deptId;
				startUp.getData(url,function(data){});
			}
		}
	});
	
	
	$("span[name='setWarm']").live("click",function(){
		var id = this.getAttribute("id")
		var status = this.getAttribute("status")
		this.className="icon-bell-alt";
		if(!id){
		}else{
			if(!status){
				var url="/a/task/taskPlan/setWarm/"+id+"/0";
				startUp.getData(url,function(data){});
			}else{
				var url="/a/task/taskPlan/setWarm/"+id+"/"+status;
				startUp.getData(url,function(data){});
			}
		}
	});
	
	
	$("span[name='setSubTask']").live("click",function(){
		var taskId = this.getAttribute("id")
		var taskStatus = this.getAttribute("status")
		this.className="icon-plus-sign-alt";
		var url = "";
			if(!taskStatus){
				url="/a/task/taskPlan/updateSubTask/taskId="+taskId+"&taskStatus="+taskStatus;
			}else{
				url="/a/task/taskPlan/updateSubTask?taskId="+taskId+"&taskStatus=0";
			}
		startUp.getData(url,function(data){
			if(data=='1'){
				window.location.href = startUp.getRootPath()+"/a/task/taskPersonalPlan/list?taskId="+taskId;
			}
		});
	});
	
	
	
	
	