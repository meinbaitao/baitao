$(document).ready(function() {
			$("#deleteTaskQuotaPlan").live("click",function(){
				var falg = $("input[name='chktaskQuotaPlan']").is(':checked');
				var deptId = $("#deptId").val();
				var ids ="";
				if(falg){
					window.confirmx('确认要删除该计划吗？',function(){
						var lists =$("input[name='chktaskQuotaPlan']:checked");
						
						$.each(lists, function(idx,item){
							ids =ids+item.id+",";
						});
						if(ids){
							ids=ids.substring(0,ids.lastIndexOf(","));						
							var url=startUp.getRootPath()+"/a/task/taskQuotaPlan/deletetaskQuotaPlan";
							window.location.href=url+"?id="+ids+"&deptId="+deptId;
						}
					});
				}else{
					window.alertx("请选择需要删除的计划!");
				}
			});
			
			$("#assignTaskQuotaPlan").live("click",function(){
				window.alertx($("#responsiblePerson").val());
				var falg = $("input[name='chktaskQuotaPlan']").is(':checked');
				var ids ="";
				if(falg){
					var lists =$("input[name='chktaskQuotaPlan']:checked");				
					$.each(lists, function(idx,item){
						ids =ids+item.id+",";
					});
					if(ids){
						ids=ids.substring(0,ids.lastIndexOf(","));
						$("#assignIDs").val(ids);
						$("#assignForm").submit();
					}
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
		
		$(".saveTaskQuotaPlan").bind("click",function(){
			$("#inputForm").attr("action",startUp.getRootPath()+"/a/task/taskQuotaPlan/saveTaskQuotaPlan");
		});
		
		$(".updateTaskQuotaPlan").bind("click",function(){
			$("#inputForm").attr("action",startUp.getRootPath()+"/a/task/taskQuotaPlan/updateTaskQuotaPlan");
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
				var url="/a/task/taskQuotaPlan/updateDiscussionSuggestion/"+id+"/0/"+deptId;
				startUp.getData(url,function(data){});
			}else{
				var url="/a/task/taskQuotaPlan/updateDiscussionSuggestion/"+id+"/"+status+"/"+deptId;
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
				var url="/a/task/taskQuotaPlan/updateLongTermTask/"+id+"/0/"+deptId;
				startUp.getData(url,function(data){});
			}else{
				var url="/a/task/taskQuotaPlan/updateLongTermTask/"+id+"/"+status+"/"+deptId;
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
				var url="/a/task/taskQuotaPlan/updateGroupConcern/"+id+"/0/"+deptId;
				startUp.getData(url,function(data){});
			}else{
				var url="/a/task/taskQuotaPlan/updateGroupConcern/"+id+"/"+status+"/"+deptId;
				startUp.getData(url,function(data){});
			}
		}
	});
	
