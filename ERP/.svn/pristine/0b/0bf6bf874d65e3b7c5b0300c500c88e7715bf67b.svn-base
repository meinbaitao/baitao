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
							var url=startUp.getRootPath()+"/a/task/adminPlan/deletetaskPlan";
							window.location.href=url+"?id="+ids+"&deptId="+deptId;
						}
					});
				}else{
					window.alertx("请选择需要删除的计划!");
				}
			});
			
			/**
			 * 提交草稿
			 */
			$("#submitTaskPlan").live("click",function(){
				var falg = $("input[name='chktaskPlan']").is(':checked');
				var deptId = $("#deptId").val();
				var ids ="";
				if(falg){
					window.confirmx('确认要提交计划吗？',function(){
						var lists =$("input[name='chktaskPlan']:checked");
						
						$.each(lists, function(idx,item){
							ids =ids+item.id+",";
						});
						if(ids){
							ids=ids.substring(0,ids.lastIndexOf(","));						
							var url=startUp.getRootPath()+"/a/task/adminPlan/setTaskStatus";
							window.location.href=url+"?id="+ids+"&deptId="+deptId;
						}
					});
				}else{
					window.alertx("请选择需要提交的计划!");
				}
			});

			
});


		
		
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	$(document).ready(function() {form_validate("inputForm"); });
		
	$(function(){
		
		$("#saveProject").on("click",function(){
			$("#inputForm").submit();
		});
		/**
		 * 添加任务型计划
		 */
		$(".saveTaskPlan").bind("click",function(){
			$("#inputForm").attr("action",startUp.getRootPath()+"/a/task/adminPlan/saveTaskPlan");
		});
		
		/**
		 * 修改任务型计划
		 */
		$(".updateTaskPlan").bind("click",function(){
			$("#inputForm").attr("action",startUp.getRootPath()+"/a/task/adminPlan/updateTaskPlan");
		});
	});
	
	/**
	 * 设置建议讨论
	 */
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
				var url="/a/task/adminPlan/updateDiscussionSuggestion/"+id+"/0/"+deptId;
				startUp.getData(url,function(data){});
			}else{
				var url="/a/task/adminPlan/updateDiscussionSuggestion/"+id+"/"+status+"/"+deptId;
				startUp.getData(url,function(data){});
			}
		}
	});
	
	/**
	 * 设置长期任务
	 */
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
				var url="/a/task/adminPlan/updateLongTermTask/"+id+"/0/"+deptId;
				startUp.getData(url,function(data){});
			}else{
				var url="/a/task/adminPlan/updateLongTermTask/"+id+"/"+status+"/"+deptId;
				startUp.getData(url,function(data){});
			}
		}
	});
	
	/**
	 * 集团关注
	 */
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
				var url="/a/task/adminPlan/updateGroupConcern/"+id+"/0/"+deptId;
				startUp.getData(url,function(data){});
			}else{
				var url="/a/task/adminPlan/updateGroupConcern/"+id+"/"+status+"/"+deptId;
				startUp.getData(url,function(data){});
			}
		}
	});
	
	/**
	 * 设置预警
	 */
	$("span[name='setWarm']").live("click",function(){
		var id = this.getAttribute("id")
		var status = this.getAttribute("status")
		this.className="icon-bell-alt";
		if(!id){
		}else{
			if(!status){
				var url="/a/task/adminPlan/setWarm/"+id+"/0";
				startUp.getData(url,function(data){});
			}else{
				var url="/a/task/adminPlan/setWarm/"+id+"/"+status;
				startUp.getData(url,function(data){});
			}
		}
	});
	
	
	/**
	 * 获取部门责任人或者复评部门
	 */
	$("#subProjectList tr td>select").live("select2-opening",function(){
		var type = "building_type";
		var deptId=$("#deptId").val();
		if(type){
			var obj =this;
			var url ="";
			var status = this.getAttribute("status");
			if(status==1){
				deptId=deptId?deptId:"1";
				url = "/a/task/adminPlan/findResponsiblePerson?deptId="+deptId;
			}else if(status==2){
				url = "/a/task/adminPlan/findReviewOffice";
			}
			
			startUp.getAsyncData(url,function(data){
				var str =$(obj);
				str.text("");
				str.append("<option value=''>请选择</option>");
				$.each(data, function(idx,item){
					var option ="<option value='"+item.id+"'>"+item.name+"</option>";
					str.append(option);
				});	
			});
		}
	});
	