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
							var url=startUp.getRootPath()+"/a/task/adminPlan/deletetaskQuotaPlan";
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
			$("#submitTaskQuotaPlan").live("click",function(){
				var falg = $("input[name='chktaskQuotaPlan']").is(':checked');
				var deptId = $("#deptId").val();
				var ids ="";
				if(falg){
					window.confirmx('确认要提交该计划吗？',function(){
						var lists =$("input[name='chktaskQuotaPlan']:checked");
						
						$.each(lists, function(idx,item){
							ids =ids+item.id+",";
						});
						if(ids){
							ids=ids.substring(0,ids.lastIndexOf(","));						
							var url=startUp.getRootPath()+"/a/task/adminPlan/setTaskQuotaStatus";
							window.location.href=url+"?id="+ids+"&deptId="+deptId;
						}
					});
				}else{
					window.alertx("请选择需要提交的计划!");
				}
			});
			
			
			
		
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
});


		
	$(function(){
		$("#saveProject").on("click",function(){
			$("#inputForm").submit();
		});
		/**
		 * 添加指标型计划
		 */
		$(".saveTaskQuotaPlan").bind("click",function(){
			var defaultMonth = $("#monthToday").val();
			$(".taskMonth").attr("value",defaultMonth);
			$("#inputForm").attr("action",startUp.getRootPath()+"/a/task/adminPlan/saveTaskQuotaPlan");
		});
		/**
		 * 修改指标型计划
		 */
		$(".updateTaskQuotaPlan").bind("click",function(){
			$("#inputForm").attr("action",startUp.getRootPath()+"/a/task/adminPlan/updateTaskQuotaPlan");
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
				var url="/a/task/taskQuotaPlan/updateDiscussionSuggestion/"+id+"/0/"+deptId;
				startUp.getData(url,function(data){});
			}else{
				var url="/a/task/taskQuotaPlan/updateDiscussionSuggestion/"+id+"/"+status+"/"+deptId;
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
				var url="/a/task/taskQuotaPlan/updateLongTermTask/"+id+"/0/"+deptId;
				startUp.getData(url,function(data){});
			}else{
				var url="/a/task/taskQuotaPlan/updateLongTermTask/"+id+"/"+status+"/"+deptId;
				startUp.getData(url,function(data){});
			}
		}
	});
	
	/**
	 * 设置集团关注
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
				var url="/a/task/taskQuotaPlan/updateGroupConcern/"+id+"/0/"+deptId;
				startUp.getData(url,function(data){});
			}else{
				var url="/a/task/taskQuotaPlan/updateGroupConcern/"+id+"/"+status+"/"+deptId;
				startUp.getData(url,function(data){});
			}
		}
	});
	
	/**
	 * 获取责任人或者复评部门
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
	
	//获取默认月份
	//获取默认月份
	$(function(){
		debugger;
		var mydate = new Date();
		var year = mydate.getFullYear(); //获取完整的年份(4位,1970-????)
		var month = $("#monthToday").val();
		var thisYear = month.substring(0,4);
		var thisMonth = month.substring(5);
		for(var m = year; m<year+2; m++){
			for(var i = 1; i < 13; i++){
				if(i<10){
					if(m==thisYear && i==thisMonth){
						$("#taskMonth").append("<option value='"+m+"-0"+i+"' selected='selected'>"+m+"-0"+i+"</option>");
					}else{
						$("#taskMonth").append("<option value='"+m+"-0"+i+"'>"+m+"-0"+i+"</option>");
					}
				}else{
					if(m==thisYear && i==thisMonth){
						$("#taskMonth").append("<option value='"+m+"-"+i+"' selected='selected'>"+m+"-"+i+"</option>");
					}else{
						$("#taskMonth").append("<option value='"+m+"-"+i+"'>"+m+"-"+i+"</option>");
					}
				}
			}
		}
		
		$("#taskMonth").select2();
	});
	
	
	