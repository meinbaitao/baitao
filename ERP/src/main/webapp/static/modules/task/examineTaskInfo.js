$(document).ready(function() {
			$("#noWay").live("click",function(){
				var falg = $("input[name='chktaskPlan']").is(':checked');
				var deptId = $("#deptId").val();
				var ids ="";
				if(falg){
					window.confirmx('确认要驳回该计划吗？',function(){
						var lists =$("input[name='chktaskPlan']:checked");
						
						$.each(lists, function(idx,item){
							ids =ids+item.id+",";
						});
						if(ids){
							ids=ids.substring(0,ids.lastIndexOf(","));						
							var url=startUp.getRootPath()+"/a/task/examineTask/setTaskPlanNo";
							window.location.href=url+"?id="+ids+"&deptId="+deptId;
						}
					});
				}else{
					window.alertx("请选择需要驳回的计划!");
				}
			});
		
			/**
			 * 批准任务型计划
			 */
		$("#accept").live("click",function(){
			var falg = $("input[name='chktaskPlan']").is(':checked');
			var ids ="";
			if(falg){
				window.confirmx('确认要批准这些计划吗？',function(){
					var lists =$("input[name='chktaskPlan']:checked");
					$.each(lists, function(idx,item){
						 $(this).parents("tr").find("input.Wdate").addClass("required");
						 $(this).parents("tr").find("input.review").addClass("required");
						ids =ids+item.id+",";
					});
					if(ids){
						ids=ids.substring(0,ids.lastIndexOf(","));
						$("#inputForm").attr("action",startUp.getRootPath()+"/a/task/examineTask/setTaskPlanOK?ids="+ids);
						$("#inputForm").submit();
					}
				});
			}else{
				window.alertx("请选择需要批准的计划!");
			}
		});
		
		
		
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }

});		
		
	