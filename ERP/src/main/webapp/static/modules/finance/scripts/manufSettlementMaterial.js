$(function(){
	$(document).ready(function() {
		form_validate("inputForm");
	});
	
	$("#editBtn").click(function(){
		//锁屏验证提交表单
		var vCheckd =[]; 
		$('input[name="checkdbox"]:checked').each(function(){ 
			vCheckd.push($(this).attr("id")); 
		});
		
		if(vCheckd.length==0){
			window.alertx("请先勾选加工项！"); 
			return;
		}

		var inputForm = $('#inputForm');
		inputForm.attr('action',startUp.getRootPath()+"/a/material/settlementMaterial/detailsave?vCheckd="+vCheckd);
		submitWValidLoading($("#inputForm"));
	});
});