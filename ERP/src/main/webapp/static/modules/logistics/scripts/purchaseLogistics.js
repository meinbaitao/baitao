$(function(){
	//承运方下拉列表
	$(document).off("change","#cyf").on("change","#cyf",function(){
		var id = $(this).val();
		var contactphone = $(this).find("option[value='"+id+"']").attr("contactphone");
		$("#contactphone").val(contactphone);
	});
	//常用联系人
	$(document).off("change","#commPer").on("change","#commPer",function(){
		var id = $(this).val();
		var phone = $(this).find("option[value='"+id+"']").attr("phone");
		$("#cphone").val(phone);
		var name = $(this).find("option[value='"+id+"']").attr("name");
		$("#cname").val(name);
	});
});

