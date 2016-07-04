$(function() {
	
	/**
	 * 点击添加
	 */
	$("#addContract").on("click",function(){
		 window.location.href=startUp.getRootPath()+"/a/contract/execution/form";
	});
	/**
	 * 点击提交
	 */
	$("#editBtn").on("click",function(){
		if(isNaN($("#exeNumber").val().trim())){
			$("#exeNumber").after("<font color='red'>施工班组人数应该是一个数字</font>");
			return ;
		}
		
		var flag = false;
		var val = $("#personNum").val();
		var id = $("#id").val();
		var d = {"personNum":val,"id":id};
		var url ="/a/contract/execution/getByPersonNum";
		startUp.postAsyncData(url,d,function(data){
			if(data.existExe == "true"){
				$("#personNum").after("<font color='red'>该身份证已经存在，请勿重复添加 ！</font>");
				$("#personNum").focus();
				flag = true;
			}
		});
		if(flag){
			return ;
		}
		
		$("#inputForm").submit();
	});
	
	
	
});





	
