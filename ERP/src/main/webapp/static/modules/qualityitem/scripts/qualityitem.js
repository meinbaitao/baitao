$(function(){	

   /**
	 * 删除项目
	 */
	$("#deleteProject").live("click",function(){
		var falg = $("input[name='chkproject']").is(':checked');
		var ids ="";
		if(falg){
			window.confirmx('确认要删除该项目吗？',function(){
				var lists =$("input[name='chkproject']:checked");
				$.each(lists, function(idx,item){
					ids =ids+item.id+",";
				});
				if(ids){
					ids=ids.substring(0,ids.lastIndexOf(","));
					var url="/a/project/delete";
					window.location.href=startUp.getRootPath()+url+"?projectId="+ids;
				}
			});
		}else{
			window.alertx("请选择需要删除的项目!");
		}
	});
	
	/**
	 * 点击添加项目
	 */
	$("#addQualityitem").on("click",function(){
		 window.location.href=startUp.getRootPath()+"/a/qualityitem/form";
	});
	
	$("#editBtn").on("click",function(){
		//锁屏验证提交表单
		submitWValidLoading($("#inputForm"));
	});
	
	
});


function callbackWhenActionDone(){
	window.location.href=startUp.getRootPath()+"/a/project/list";
}
