$(function(){
	//根据项目拉取二级项目项目数据
	$("#projectNameOne").live("change",function(){
		var proID = $(this).val();
		var d={proID:proID};
		var url="/a/purchase/applyPurchase/getSubByProID";
		startUp.postData(url,d,function(data){
			var html="<select name='houseTypeTwo' id=\"houseTypeTwo\" class='input-medium requireds'>";
			html+="<option value1='' value=''>请选择</option>";
			for(var i=0;i<data.length;i++){
				html+="<option value1='"+data[i].subID+"' value='"+data[i].subHouseType+"'>"+data[i].subHouseType+"</option>";
			}
			html+="</select>";
			$("#houseTypeOne").html(html);
			$("#houseTypeTwo").select2();
		});
	});
	//根据项目拉取二级项目项目数据
	$("#houseTypeOne").live("change",function(){
		var c = $("#houseTypeTwo").val();
		$("#subprojectId").val($("#houseTypeTwo").find("option[value='"+c+"']").attr("value1"));
		var proID = $("#projectNameOne").val();
		var houseType = $("#houseTypeTwo").val();
		var d={proID:proID,houseType:houseType};
		var url="/a/purchase/applyPurchase/getSubByHouseType";
		startUp.postData(url,d,function(data){
			var html="<select name='buildingTwo' id='buildingTwo' class='input-medium'>";
			html+="<option value=''>请选择</option>";
			for(var i=0;i<data.length;i++){
				html+="<option value='"+data[i].subBuilding+"'>"+data[i].subBuilding+"</option>";
			}
			html+="</select>";
//			html+="";
			$("#buildingOne").html(html);
			$("#buildingTwo").select2();
		});
	});
	//隐藏/显示 导入操作
	$("#btnImport").click(function(){
		$("#importBox").slideToggle();
	});
	
	//导入
	$("#btnImportSubmit").click(function(){
		var subprojectId = $("#subprojectId").val();
		var houseType = $("#houseTypeTwo").val();
		var uploadFile = $("#uploadFile").val();
		if(houseType == '' || subprojectId == ''){
			//alert("请先选择项目和户型！");
			window.alertx("请先选择项目和户型！");
			return;
		}
		if(uploadFile ==''){
			//alert("请先选择文件！");
			window.alertx("请先选择文件！");
			return;
		}
		//if(confirm("确定要提交？")){
		var inputForm = $('#importForm');
		inputForm.attr('action',startUp.getRootPath()+"/a/cost/volumeControl/volumeControlImport");
		inputForm.submit();				
		//}
	});
	
	//删除
	$("#btnDelete").click(function(){
		var vCheckd =[]; 
		$('input[name="checkdbox"]:checked').each(function(){ 
			vCheckd.push($(this).attr("id")); 
		}); 
		if(vCheckd.length==0){
			//alert("请先勾选删除项！"); 
			window.alertx("请先勾选删除项！"); 
			return;
		}
		window.confirmx("确定要删除？",function(){
			var inputForm = $('#deleteForm');
			inputForm.attr('action',startUp.getRootPath()+"/a/cost/volumeControl/delete?vCheckd="+vCheckd);
			inputForm.submit();	
		});

	});
	//删除明细
	$("#btnDeleteDetail").click(function(){
		var vCheckd =[]; 
		$('input[name="checkdbox"]:checked').each(function(){ 
			vCheckd.push($(this).attr("id")); 
		}); 
		if(vCheckd.length==0){
			//alert("请先勾选删除项！"); 
			window.alertx("请先勾选删除项！");
			return;
		}
		window.confirmx("确定要删除？",function(){
			var inputForm = $('#deleteDetailForm');
			inputForm.attr('action',startUp.getRootPath()+"/a/cost/volumeControlDetail/delete?vCheckd="+vCheckd);
			inputForm.submit();				
		});
	});
	//明细查询
//	$("#btnquery").click(function(){
//		var subprojectId = $("#subprojectId").val();
//		var houseType = $("#houseTypeTwo").val();
//		if(houseType == '' || subprojectId == ''){
//			alert("请先选择项目和户型！");
//			return;
//		}
//		var inputForm = $('#searchForm');
//		inputForm.attr('action',startUp.getRootPath()+"/a/cost/volumeControlDetail/list?volumeControlId="+subprojectId);
//		inputForm.submit();				
//	});
	
});