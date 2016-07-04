$(function(){
	
	//数据筛选
    $(document).off("click","input[name*='actRadio']").on("click","input[name*='actRadio']",function(e){
    	var radioVal = $("input[name='actRadio']:checked").val();// e.target.value;
    	var url="";
    	if(radioVal==1){
    		url=startUp.getRootPath() + '/a/finance/laborSettlement/findMylaborSettlement';
		}else if(radioVal==2){
			url=startUp.getRootPath() + '/a/finance/laborSettlement/findUnAuditLaborSettlement';
		}else if(radioVal==3){
			url=startUp.getRootPath() + '/a/finance/laborSettlement/findAuditDoneLaborSettlement';
		}else if(radioVal==4){
			url=startUp.getRootPath() + '/a/finance/laborSettlement/allList';
		}
    	$("#actRadio").val(radioVal);
    	$("#searchForm").attr("action",url);
    	$("#searchForm").submit();
	});
    	
});
function laborContractClick(object){
	var contractId = $(object).val();
	//重置带出信息
	$("#partyBName").val("");
	$("#projectName").val("");
	$("#startDate").val("");
	$("#endDate").val("");
	$("#duration").val("");
	$("#contractPrice").val("");
	var detailList = $("#formEdit");
	detailList.text("");
	var html = "";
	
	if(contractId){
		var url = "/a/finance/laborSettlement/getContractById?contractId="+contractId;
		startUp.getData(url, function(data){
			if(data){
				//计算价格	
				var price = $("#price").val();
				countPrice(data.contractPrice, price);
				//带出信息	
				$("#partyBName").val(data.executionName);
				$("#projectName").val(data.proName);
				$("#contractscopeadjust").val(data.contractscopeadjust);
				$("#startDate").val(data.startdate);
				$("#endDate").val(data.enddate);
				$("#duration").val(data.duration);
				$("#contractPrice").val(data.contractPrice);
				$("#houseType").val(data.house);
				$("#building").val(data.buildings);
				$("#jiaEndDate").val(data.jiaContractDetail.endDate);
				
/*         					//户型下拉
				if(data.house){
					var houseType = $("#houseType");
					houseType.text("");
					var houseOptions = stringToOptions(data.house);
					houseType.append(houseOptions);
				}
				//楼栋下拉
				if(data.buildings){
					var buildings = $("#building");
					buildings.text("");
					var buildingOptions = stringToOptions(data.buildings);
					buildings.append(buildingOptions);
				} */
				//结算明细	
				if(data.detailList){
					$.each(data.detailList, function(idx, item){
						var id = startUp.uuid();
						var tr="<tr list='detailList' index='"+idx+"'>\
						<input type='hidden' class='hide' name='detailList["+idx+"].id' id='detailList["+idx+"].id' value='"+id+"'/>\
						<input type='hidden' class='hide' name='detailList["+idx+"].laborDetailId' id='detailList["+idx+"].laborDetailId' value='"+item.id+"'/>\
						<td>"+dealWithUndefined(item.seriesnumber)+"</td>\
						<td>"+dealWithUndefined(item.name)+"</td>\
						<td>"+dealWithUndefined(item.length)+"</td>\
						<td>"+dealWithUndefined(item.width)+"</td>\
						<td>"+dealWithUndefined(item.heigh)+"</td>\
						<td>"+dealWithUndefined(item.unit)+"</td>\
						<td><input type='text' class='input-medium' id='detailList["+idx+"].afterNumber' \
									value='"+item.afterNumber+"' readonly='readonly'/></td>\
						<td><input type='text' class='input-medium' name='detailList["+idx+"].realWorkload' \
									id='detailList["+idx+"].realWorkload' value='"+item.afterNumber+"' /></td>\
						<td><input type='text' class='input-medium' name='detailList["+idx+"].settleWorkload' \
									id='detailList["+idx+"].settleWorkload'/></td>\
						<td>"+item.contractPrice+"</td>\
						<td><input type='text' class='input-medium' name='detailList["+idx+"].price' \
									id='detailList["+idx+"].price'/></td>\
						</tr>";
						html += tr;
					});
					detailList.append(html);
				}
			}
		});
	}
	
}

function changeProjectId(){
	var code = $("#projectCode").val();
	if(!code){
		return;
	}
	var d={code:code};
	var url="/a/finance/laborSettlement/getContractNoByCode";
	startUp.postData(url,d,function(data){	
		var html = "";
		var htmllaborContract = "<select name='laborContract' onchange='laborContractClick(this)' class='input-medium requireds'>";
		for(var i=0;i<data.length;i++){
			htmllaborContract = htmllaborContract + "<option value="+data[i].id+" >"+data[i].contractNo +"--"+ data[i].buildings+"</option>";
		}
		htmllaborContract = htmllaborContract + "</select>";
		html += "<tr id='' class='active' >\
			<td><input type='checkbox' name='laborcontractBox'></td>\
			<td>"+htmllaborContract+"</td>\
			<td><input type='text' name='projectName' value=''></td>\
			<td><input type='text' name='partyBName' value=''></td>\
			<td><input type='text' name='contractscopeadjust' value=''></td>\
			<td><input type='text' name='houseType' class='input-medium Wdate ' value=''></td>\
			<td><input type='text' name='building' class='input-medium Wdate '  value=''></td>\
			<td><input type='text' name='startDate' value=''></td>\
			<td><input type='text' name='endDate' value=''></td>\
			<td><input type='text' name='duration' value=''></td>\
			<td><input type='text' name='contractPrice'value=''></td>\
			<td><input type='text' name='price' value=''></td>\
			<td><input type='text' name='priceDifference' value=''></td>\
			<td><input type='text' name='priceDifferenceRatio' value=''></td>\
		</tr>";
		
		$("#laborContract").append(html);	
	});
}