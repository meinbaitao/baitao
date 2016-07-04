$(document).ready(function() {
			$("#deletetaskPersonalPlanList").live("click",function(){
				var falg = $("input[name='chktaskPlan']").is(':checked');
				var taskId = $("#taskId").val();
				var ids ="";
				if(falg){
					window.confirmx('确认要删除该计划吗？',function(){
						var lists =$("input[name='chktaskPlan']:checked");
						
						$.each(lists, function(idx,item){
							ids =ids+item.id+",";
						});
						if(ids){
							ids=ids.substring(0,ids.lastIndexOf(","));						
							var url=startUp.getRootPath()+"/a/task/taskPersonalPlan/deleteTaskPersonalPlan";
							window.location.href=url+"?id="+ids+"&taskId="+taskId;
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
		
		$(".savetaskPersonalPlanList").bind("click",function(){
			var taskId = $("#taskId").val();
			$("#inputForm").attr("action",startUp.getRootPath()+"/a/task/taskPersonalPlan/saveTaskPersonalPlan?taskId="+taskId);
		});
		
		$(".updatetaskPersonalPlanList").bind("click",function(){
			$("#inputForm").attr("action",startUp.getRootPath()+"/a/task/taskPersonalPlan/updateTaskPersonalPlan");
		});
	});
	
	
	
	