$(function() {
//	获取光标
//	var orginVal;
//	$(document).off("focus","input[name^='listLaboritems']").on("focus","input[name^='listLaboritems']",function(){
//		var val = $(this).val();
//		if(val){
//			orginVal = parseFloat(val).toFixed(3);
//		}else{
//			orginVal = 0;
//		}
//	});
	$(document).off("blur","input[name^='listLaboritems']").on("blur","input[name^='listLaboritems']",function(){
		var val = $(this).val();
		var orginVal = $(this).attr("orginVal");
		if(val){
			val = parseFloat(val).toFixed(3);
		}else{
			val = 0;
		}
		if(orginVal){
			orginVal = parseFloat(orginVal).toFixed(3);
		}else{
			orginVal = 0;
		}
		if(orginVal<val){
			$(this).css("color","red");
		}else if(orginVal>val){
			$(this).css("color","green");
		}
	});
	
	$(document).off("change","#laboritemsType").on("change","#laboritemsType",function(){
		loadData();
	});
	
	$("#listLaborItems tr td>[name*='.preNumber']").live("blur",function(){
		//成本预算量
		var vIDpreNumber=$(this).attr("id");
		//浮动比例
		var vIDnumberRatio=vIDpreNumber.replace("preNumber","numberRatio");
		//合同量
		var vIDafterNumber=vIDpreNumber.replace("preNumber","afterNumber");
		var thisNumber=$(this).val();
		var preNumber=thisNumber;
		var numberRatio=$("[id='"+vIDnumberRatio+"']").val();		

		var regex = /^\d+\.?\d{0,2}$/;
		if (regex.test(thisNumber)) {
			if (regex.test(numberRatio)) {
				var vSum = parseFloat((numberRatio / 100) * preNumber)
				.toFixed(2);
				$("[id='" + vIDafterNumber + "']").val(vSum);
			}
//			var vIDcolligatePrice=vIDpreNumber.replace("preNumber","colligatePrice");
//			var colligatePrice=$("[id='"+vIDcolligatePrice+"']").val();
//			if(regex.test(colligatePrice)){
//
//			}
		} else {
			$(this).val("");
			$(this).focus();
		}		
	});
//	$("#listLaborItems tr td>[name*='.numberRatio']").live("blur",function(){
//		//成本预算量
//		var vIDpreNumber=$(this).attr("id");
//		//浮动比例
//		var vIDnumberRatio=vIDpreNumber.replace("preNumber","numberRatio");
//		//合同量
//		var vIDafterNumber=vIDpreNumber.replace("preNumber","afterNumber");
//		var thisNumber=$(this).val();
//		var preNumber=thisNumber;
//		var numberRatio=$("[id='"+vIDnumberRatio+"']").val();		
//
//		var regex = /^\d+\.?\d{0,2}$/;
//		if (regex.test(thisNumber)) {
//			if (regex.test(numberRatio)) {
//				var vSum = parseFloat((numberRatio / 100) * preNumber)
//				.toFixed(2);
//				$("[id='" + vIDafterNumber + "']").val(vSum);
//			}
//			var vIDcolligatePrice=vIDpreNumber.replace("preNumber","colligatePrice");
//			var colligatePrice=$("[id='"+vIDcolligatePrice+"']").val();
//			if(regex.test(colligatePrice)){
//				
//			}
//		} else {
//			$(this).val("");
//			$(this).focus();
//		}		
//	});
	
});
function loadData(){
	var type = $("#laboritemsType").val();
	var subId = $("#subId").val();
	var url = "/a/contract/laboritems/getItemsByCondition";
	var d = {type:type,subId:subId};
	startUp.postData(url,d,function(data){
		var html="";
		$("#listLaborItems").html(html);
		if(type){
			html=loadDataByType(data.listLaborItemsPrice,subId);
		}else{
			html=loadDataBySubId(data.listLaborItems,subId);
		}
		$("#listLaborItems").html(html);
	});
	
}
function loadDataByType(list,subId){
	var html="";
	for(var i=0;i<list.length;i++){
		var obj = list[i];
		html+="<tr>\
			<td>"+(i+1)+"\
				<input class='input-mini' id='listLaboritems["+i+"].originId' name='listLaboritems["+i+"].originId' type='hidden' value='"+obj.id+"'/>\
				<input class='input-mini' id='listLaboritems["+i+"].sub.id' name='listLaboritems["+i+"].sub.id' type='hidden' value='"+subId+"'/></td>\
			<td><input class='input-mini' id='listLaboritems["+i+"].name' name='listLaboritems["+i+"].name' type='text' value='"+obj.name+"' orginVal='"+obj.name+"'/></td>\
			<td>图样</td>\
			<td>\
				<input class='input-mini' id='listLaboritems["+i+"].length' name='listLaboritems["+i+"].length' type='text' value='"+obj.speclength+"' orginVal='"+obj.speclength+"'/></td>\
			<td>\
				<input class='input-mini' id='listLaboritems["+i+"].width' name='listLaboritems["+i+"].width' type='text' value='"+obj.specwidth+"' orginVal='"+obj.specwidth+"'/></td>\
			<td>\
				<input class='input-mini' id='listLaboritems["+i+"].heigh' name='listLaboritems["+i+"].heigh' type='text' value='"+obj.spechigth+"' orginVal='"+obj.spechigth+"'/></td>\
			<td>\
				<input class='input-mini' id='listLaboritems["+i+"].preNumber' name='listLaboritems["+i+"].preNumber' type='text' value='"+obj.costBudget+"' orginVal='"+obj.costBudget+"'/></td>\
			<td>\
				<input class='input-mini' id='listLaboritems["+i+"].numberRatio' name='listLaboritems["+i+"].numberRatio' type='text' value='"+obj.floatingRatioOne+"' orginVal='"+obj.floatingRatioOne+"'/></td>\
			<td>\
				<input class='input-mini' id='listLaboritems["+i+"].afterNumber' name='listLaboritems["+i+"].afterNumber' type='text' value='"+obj.contractQuantity+"' orginVal='"+obj.contractQuantity+"'/></td>\
			<td>\
				<input class='input-mini' id='listLaboritems["+i+"].unit' name='listLaboritems["+i+"].unit' type='text' value='"+obj.unit+"' orginVal='"+obj.unit+"'/></td>\
			<td>\
				<input class='input-mini' id='listLaboritems["+i+"].colligatePrice' name='listLaboritems["+i+"].colligatePrice' type='text' value='"+obj.standardUnitPrice+"' orginVal='"+obj.standardUnitPrice+"'/></td>\
	 		<td>\
	 			<input class='input-mini' id='listLaboritems["+i+"].colligatePriceStone' name='listLaboritems["+i+"].colligatePriceStone' type='text' value='"+obj.standardSkeleton+"' orginVal='"+obj.standardSkeleton+"'/></td>\
	 		<td>\
	 			<input class='input-mini' id='listLaboritems["+i+"].colligatePriceSkeleton' name='listLaboritems["+i+"].colligatePriceSkeleton' type='text' value='"+obj.standardStone+"' orginVal='"+obj.standardStone+"'/></td>\
			<td>\
				<input class='input-mini' id='listLaboritems["+i+"].priceRatio' name='listLaboritems["+i+"].priceRatio' type='text' value='"+obj.floatingRatioTwo+"' orginVal='"+obj.floatingRatioTwo+" '/></td>\
			<td>\
				<input class='input-mini' id='listLaboritems["+i+"].contractColligatePrice' name='listLaboritems["+i+"].contractColligatePrice' type='text' value='"+obj.contractUnitPrice+"' orginVal='"+obj.contractUnitPrice+"'/></td>\
	 		<td>\
	 			<input class='input-mini' id='listLaboritems["+i+"].contractPriceStone' name='listLaboritems["+i+"].contractPriceStone' type='text' value='"+obj.contractSkeleton+"' orginVal='"+obj.contractSkeleton+"'/></td>\
	 		<td>\
	 			<input class='input-mini' id='listLaboritems["+i+"].contractPriceSkeleton' name='listLaboritems["+i+"].contractPriceSkeleton' type='text' value='"+obj.contractStone+"' orginVal='"+obj.contractStone+"'/></td>\
			<td>\
				<input class='input-mini' id='listLaboritems["+i+"].standardPrice' name='listLaboritems["+i+"].standardPrice' type='text' value='"+obj.standardTotal+"' orginVal='"+obj.standardTotal+"'/></td>\
			<td>\
				<input class='input-mini' id='listLaboritems["+i+"].contractPrice' name='listLaboritems["+i+"].contractPrice' type='text' value='"+obj.contractTotal+"' orginVal='"+obj.contractTotal+"'/></td>\
			<td>\
				<input class='input-mini' id='listLaboritems["+i+"].budgetPrice' name='listLaboritems["+i+"].budgetPrice' type='text' value='"+obj.costBudgetTotal+"' orginVal='"+obj.costBudgetTotal+"'/></td>\
        </tr>";
	}
	return html;
}
function loadDataBySubId(list,subId){
	var html="";
	for(var i=0;i<list.length;i++){
		var obj = list[i];
		html+="<tr>\
				<td>"+(i+1)+"\
					<input id='listLaboritems["+i+"].id' name='listLaboritems["+i+"].id' type='hidden' value='"+obj.id+"'/>\
					<input class='input-mini' id='listLaboritems["+i+"].sub.id' name='listLaboritems["+i+"].sub.id' type='hidden' value='"+subId+"'/>\
					<input id='listLaboritems["+i+"].originId' name='listLaboritems["+i+"].originId' type='hidden' value='"+obj.originId+"'/></td>\
				<td><input class='input-mini' id='listLaboritems["+i+"].name' name='listLaboritems["+i+"].name' type='text' value='"+obj.name+"' orginVal='"+obj.name+"'/></td>\
				<td>图样</td>\
				<td>\
					<input class='input-mini' id='listLaboritems["+i+"].length' name='listLaboritems["+i+"].length' type='text' value='"+obj.length+"' orginVal='"+obj.length+"'/></td>\
				<td>\
					<input class='input-mini' id='listLaboritems["+i+"].width' name='listLaboritems["+i+"].width' type='text' value='"+obj.width+"' orginVal='"+obj.width+"'/></td>\
				<td>\
					<input class='input-mini' id='listLaboritems["+i+"].heigh' name='listLaboritems["+i+"].heigh' type='text' value='"+obj.heigh+"' orginVal='"+obj.heigh+"'/></td>\
				<td>\
					<input class='input-mini' id='listLaboritems["+i+"].preNumber' name='listLaboritems["+i+"].preNumber' type='text' value='"+obj.preNumber+"' orginVal='"+obj.preNumber+"'/></td>\
				<td>\
					<input class='input-mini' id='listLaboritems["+i+"].numberRatio' name='listLaboritems["+i+"].numberRatio' type='text' value='"+obj.numberRatio+"' orginVal='"+obj.numberRatio+"'/></td>\
				<td>\
					<input class='input-mini' id='listLaboritems["+i+"].afterNumber' name='listLaboritems["+i+"].afterNumber' type='text' value='"+obj.afterNumber+"' orginVal='"+obj.afterNumber+"'/></td>\
				<td>\
					<input class='input-mini' id='listLaboritems["+i+"].unit' name='listLaboritems["+i+"].unit' type='text' value='"+obj.unit+"' orginVal='"+obj.unit+"'/></td>\
				<td>\
					<input class='input-mini' id='listLaboritems["+i+"].colligatePrice' name='listLaboritems["+i+"].colligatePrice' type='text' value='"+obj.colligatePrice+"' orginVal='"+obj.colligatePrice+"'/></td>\
   		 		<td>\
   		 			<input class='input-mini' id='listLaboritems["+i+"].colligatePriceStone' name='listLaboritems["+i+"].colligatePriceStone' type='text' value='"+obj.colligatePriceStone+"' orginVal='"+obj.colligatePriceStone+"'/></td>\
   		 		<td>\
   		 			<input class='input-mini' id='listLaboritems["+i+"].colligatePriceSkeleton' name='listLaboritems["+i+"].colligatePriceSkeleton' type='text' value='"+obj.colligatePriceSkeleton+"' orginVal='"+obj.colligatePriceSkeleton+"'/></td>\
				<td>\
					<input class='input-mini' id='listLaboritems["+i+"].priceRatio' name='listLaboritems["+i+"].priceRatio' type='text' value='"+obj.priceRatio+"' orginVal='"+obj.priceRatio+"'/></td>\
				<td>\
					<input class='input-mini' id='listLaboritems["+i+"].contractColligatePrice' name='listLaboritems["+i+"].contractColligatePrice' type='text' value='"+obj.contractColligatePrice+"' orginVal='"+obj.contractColligatePrice+"'/></td>\
   		 		<td>\
   		 			<input class='input-mini' id='listLaboritems["+i+"].contractPriceStone' name='listLaboritems["+i+"].contractPriceStone' type='text' value='"+obj.contractPriceStone+"' orginVal='"+obj.contractPriceStone+"'/></td>\
   		 		<td>\
   		 			<input class='input-mini' id='listLaboritems["+i+"].contractPriceSkeleton' name='listLaboritems["+i+"].contractPriceSkeleton' type='text' value='"+obj.contractPriceSkeleton+"' orginVal='"+obj.contractPriceSkeleton+"'/></td>\
				<td>\
					<input class='input-mini' id='listLaboritems["+i+"].standardPrice' name='listLaboritems["+i+"].standardPrice' type='text' value='"+obj.standardPrice+"' orginVal='"+obj.standardPrice+"'/></td>\
				<td>\
					<input class='input-mini' id='listLaboritems["+i+"].contractPrice' name='listLaboritems["+i+"].contractPrice' type='text' value='"+obj.contractPrice+"' orginVal='"+obj.contractPrice+"'/></td>\
				<td>\
					<input class='input-mini' id='listLaboritems["+i+"].budgetPrice' name='listLaboritems["+i+"].budgetPrice' type='text' value='"+obj.budgetPrice+"' orginVal='"+obj.budgetPrice+"'/></td>\
            </tr>";
	}
	return html;
}


