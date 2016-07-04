$("#confirmSend").live("click",function(){
	var logisticsSendId = this.getAttribute("thisTagertId");
	if(this.className.indexOf("glyphicon-triangle-right") !=-1){
		return;
	}
	
	$.ajax({
		  url: startUp.getRootPath()+"/a/logisticsSend/logiticsSendDetail?logisticsSendId="+logisticsSendId,
		  type:"post",
		  cache: false,
		  timeout:7000,
		  dataType:"json",
		  success: function(data){
			  $.each(data, function(idx,item){
				  var logisticsSend = item.logisticsSend;
				  $("#logisticssendCode").attr("value",logisticsSend.logisticssendCode);
				  $("#logisticssendid").attr("value",logisticsSend.logisticssendid);
				  $("#sendFactory").attr("value",logisticsSend.sendFactory);
				  $("#suppliersId").attr("value",logisticsSend.suppliersId);
				  $("#carriageContractId").attr("value",logisticsSend.carriageContractId);
				  $("#vehicleLength").attr("value",logisticsSend.vehicleLength);
				  $("#requireWeight").attr("value",logisticsSend.requireWeight);
				  $("#receiverAddress").attr("value",logisticsSend.receiverAddress);
				  $("#receiverUser").attr("value",logisticsSend.receiverUser);
				  $("#receiverPhone").attr("value",logisticsSend.receiverPhone);
				  $("#sendUser").attr("value",logisticsSend.sendUser);
				  $("#sendPhone").attr("value",logisticsSend.sendPhone);
				  $("#planSendDate").attr("value",logisticsSend.planSendDate);
				  $("#requireDate").attr("value",logisticsSend.requireDate);
				  $("#remark").attr("value",logisticsSend.remark);
				  $("#driveName").attr("value",logisticsSend.driveName);
				  $("#drivePhone").attr("value",logisticsSend.drivePhone);
				  $("#credentials").attr("value",logisticsSend.credentials);
				  $("#vehicleNumber").attr("value",logisticsSend.vehicleNumber);
				  $("#weight").attr("value",logisticsSend.weight);
				  $("#quantity").attr("value",logisticsSend.quantity);
				  var boxList =$("#boxList");
				  var tr = "";
				  var items = item.boxs;
				  $.each(items, function(idx,box){
					  var statu = "";
					  if(box.status == 1){
						  statu = "待入库"
					  }else if(box.status == 2){
						  statu = "已入库";
					  }else if(box.status == 3){
						  statu = "应发未发";
					  }else if(box.status == 4){
						  statu = "待发货";
					  }else if(box.status == 5){
						  statu = "待收货";
					  }else if(box.status == 6){
						  statu = "已收货";
					  }
					  tr +="<tr>"+
					        	  "<td><input type=\"checkbox\" name=\"checkdbox\" id='"+box.id+"'></td>"+
					        	  "<td>"+box.boxNo+"</td>"+
					        	  "<td>"+box.orderBomId+"</td>"+
					        	  "<td>"+statu+"</td>"+
					          "</tr>";
				  });
				  boxList.html(tr);
			  }); 
		  }
	});
});
function submitData(){
	var boxCheckd =[]; 
	$('input[name="checkdbox"]:checked').each(function(){ 
		boxCheckd.push($(this).attr("id")); 
		//alert($(this).attr("id"));
	}); 
	if(boxCheckd.length==0){
		//alert( "您还没勾选箱号！"); 
		window.alertx("您还没勾选箱号！"); 
		return;
	}
	if(window.confirmx("确定要提交？")){
		var inputForm = $('#inputForm');
		inputForm.attr('action',startUp.getRootPath()+"/a/logisticsSend/confirmSend?boxCheckd="+boxCheckd);
		inputForm.submit();				
	}
}
$("#viewDetail").live("click",function(){
	var logisticsSendId = this.getAttribute("thisTagertId");
	if(this.className.indexOf("glyphicon-triangle-right") !=-1){
		return;
	}
//    $("#viewboxList").detach();
	$.ajax({
		  url: startUp.getRootPath()+"/a/logisticsSend/logiticsSendDetail?logisticsSendId="+logisticsSendId,
		  type:"post",
		  cache: false,
		  timeout:7000,
		  dataType:"json",
		  success: function(data){
			  $.each(data, function(idx,item){
				  var logisticsSend = item.logisticsSend;
				  $("#viewlogisticssendCode").attr("value",logisticsSend.logisticssendCode);
				  $("#viewlogisticssendid").attr("value",logisticsSend.logisticssendid);
				  $("#viewsendFactory").attr("value",logisticsSend.sendFactory);
				  $("#viewsuppliersId").attr("value",logisticsSend.suppliersId);
				  $("#viewcarriageContractId").attr("value",logisticsSend.carriageContractId);
				  $("#viewvehicleLength").attr("value",logisticsSend.vehicleLength);
				  $("#viewrequireWeight").attr("value",logisticsSend.requireWeight);
				  $("#viewreceiverAddress").attr("value",logisticsSend.receiverAddress);
				  $("#viewreceiverUser").attr("value",logisticsSend.receiverUser);
				  $("#viewreceiverPhone").attr("value",logisticsSend.receiverPhone);
				  $("#viewsendUser").attr("value",logisticsSend.sendUser);
				  $("#viewsendPhone").attr("value",logisticsSend.sendPhone);
				  $("#viewplanSendDate").attr("value",logisticsSend.planSendDate);
				  $("#viewrequireDate").attr("value",logisticsSend.requireDate);
				  $("#viewremark").attr("value",logisticsSend.remark);
				  $("#viewdriveName").attr("value",logisticsSend.driveName);
				  $("#viewdrivePhone").attr("value",logisticsSend.drivePhone);
				  $("#viewcredentials").attr("value",logisticsSend.credentials);
				  $("#viewvehicleNumber").attr("value",logisticsSend.vehicleNumber);
				  $("#viewweight").attr("value",logisticsSend.weight);
				  $("#viewquantity").attr("value",logisticsSend.quantity);
				  var boxList =$("#viewboxList");
				  var items = item.boxs;
				  var tr = "";
				  $.each(items, function(idx,box){
					  var statu = "";
					  if(box.status == 1){
						  statu = "待入库"
					  }else if(box.status == 2){
						  statu = "已入库";
					  }else if(box.status == 3){
						  statu = "应发未发";
					  }else if(box.status == 4){
						  statu = "待发货";
					  }else if(box.status == 5){
						  statu = "待收货";
					  }else if(box.status == 6){
						  statu = "已收货";
					  }
					  tr +="<tr>"+
					        	  "<td>"+box.boxNo+"</td>"+
					        	  "<td>"+box.orderBomId+"</td>"+
					        	  "<td>"+statu+"</td>"+
					          "</tr>";
				  });
				 boxList.html(tr);
			  }); 
		  }
	});
});	
function confirmReceive(){
	var boxCheckd =[]; 
	$('input[name="checkdbox"]:checked').each(function(){ 
		boxCheckd.push($(this).attr("id")); 
		//alert($(this).attr("id"));
	}); 
	if(boxCheckd.length==0){
		//alert( "您还没勾选箱号！");
		window.alertx("您还没勾选箱号！");
		return;
	}
	if(window.confirmx("确定要提交？")){
		var inputForm = $('#inputForm');
		inputForm.attr('action',startUp.getRootPath()+"/a/logisticsSend/confirmReceive?boxCheckd="+boxCheckd);
		inputForm.submit();				
	}
}

