$(function(){
	
	/**
	 * 添加白名单表单
	 */
	$("#addWhitelists").click(function(){
		window.location.href=startUp.getRootPath()+"/a/whitelists/form";
	});
	
	
	/**
	 * 保存白名单
	 */
	$("#addBtn").click(function(){
		var name = $("#name").val();
		var description = $("#description").val();
		if(!name){
			$("#whitelistName").text("白名单不能为空!");
			return;
		}
		if(!description){
			$("#whitelistDesc").text("白名单描述不能为空!");
			return;
		}
		
		var url ="/a/whitelists/count";
		startUp.postData(url,{"name":name},function(data){
			//检测白名单是否已存在
			var id = $("#id").val();
			if(data && !id){
				$("#whitelistName").text("白名单已存在，请重新输入!");
			}else{
				$("#inputForm").submit();
			}
		});
	});
	
	/**
	 * 文本框获得焦点内容清空
	 */
	$("#name").focus(function(){
		$("#whitelistName").empty();
	});
	
	/**
	 * 文本框获得焦点内容清空
	 */
	$("#description").focus(function(){
		$("#whitelistDesc").empty();
	});
})
	
