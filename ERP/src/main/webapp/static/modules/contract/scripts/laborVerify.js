$(function(){
	
	//数据筛选
    $(document).off("click","input[name*='actRadio']").on("click","input[name*='actRadio']",function(e){
    	var radioVal = $("input[name='actRadio']:checked").val();// e.target.value;
    	var url="";
    	if(radioVal==1){
    		url=startUp.getRootPath() + '/a/contract/laborcontract/findMyLaborcontract';
		}else if(radioVal==2){
			url=startUp.getRootPath() + '/a/contract/laborcontract/findUnAuditLaborcontract';
		}else if(radioVal==3){
			url=startUp.getRootPath() + '/a/contract/laborcontract/findAuditDoneLaborcontract';
		}else if(radioVal==4){
			url=startUp.getRootPath() + '/a/contract/laborcontract/allList';
		}
    	$("#actRadio").val(radioVal);
    	$("#searchForm").attr("action",url);
    	$("#searchForm").submit();
	});
	
	
	$(document).on("select2-opening","select[name ='ctypeSel']",function(){
		var projectId = $("#projectId").val();
		var exeScope = $("#exeScope").val();
		//请求详情数据
		var d = {"projectId":projectId,"exeScope":exeScope};
		var option ="<option value=''>请选择</option>";
		var url = "/a/contract/execution/list2labor";
		var sel = $(this);
		sel.text("");
		sel.append(option);
		startUp.postAsyncData(url,d,function(data){
			var listMap = data.list;
			$.each(listMap,function(i,item){
				var option ="<option value='"+item.name+"'>"+item.name+"</option>";
				sel.append(option);
			});
		});
		
		});
	
	var ctypeVal;
	$(document).on("change","select[name ='ctypeSel']",function(){
		var name = $(this).val();
		ctypeChange(name);
//		$("#ctype").val(name);
//		var d = {"name":name};
//		var url = "/a/contract/execution/getByName";
//		startUp.postData(url,d,function(data){
//			$("#projectleadBid").val(data.delegate)
//			$("#projectleadBidtel").val(data.delegateTel)
//		});
	});
	$(document).off("blur",".ctype").on("blur",".ctype",function(){
		var name = $("#ctype").val();
		ctypeChange(name);
	});
	//非标准合同不需要填写一级二级类别，当选择非标准合同时，取消这两个字段的必填标识
	$(document).off("change","select[name='isStandardContract']").on("change","select[name='isStandardContract']",function(){
		changeIsSC();
	});
	
	function ctypeChange(name){
		if(name==ctypeVal){
			return;
		}
		ctypeVal = name;
//		$("#ctype").val(name);
		$("#ctype").attr("value",name);
		$("select[name='ctype']").val(name);
		var d = {"name":name};
		var url = "/a/contract/execution/getByName";
		startUp.postData(url,d,function(data){
			if(data){
				$("#projectleadBid").val(data.delegate);
				$("#projectleadBidtel").val(data.delegateTel);
			}else{
				$("#projectleadBid").val("");
				$("#projectleadBidtel").val("");
			}
			
		});
	}
	/**
	 * 承接范围可选可输入
	 */
    $(document).ready(function () {
    	var type = $("#acceptScope").attr("tag");
    	if(type){
    		var url = "/a/project/querydictlist?type="+type;
    		startUp.getAsyncData(url,function(data){
    			var label = new Array();
    			for(var i=0;i<data.length;i++){
    				label[i] = data[i].label;
    			}
    			$("#acceptScope").select2({tags:label});
    		});
    	}
    	
    });
    
    $("#startdate,#enddate").on("blur",function() {
		if($("#enddate").val()){
			var startdate = $("#startdate").val();
			var enddate = $("#enddate").val();
			$("#duration").val("");
			if(startdate !="" && enddate !=""){ 
				var beforeTime= new Date(Date.parse(startdate));
				var afterTime= new Date(Date.parse(enddate));
				var data= (afterTime - beforeTime) / (1000 * 60 * 60 * 24);
				if(data < 0){
					window.alertx("竣工日期不能早于开工日期!");
				}
				if(data >= 0){
					$("#duration").val(Number(data)+1);
				}
				
			}
		}
	});
    
	/**
	 * 绑定数据字典下拉框
	 */
	$("#subProjectList tr td>select").live("select2-opening",function(){
		var type = this.getAttribute("tag");
		if(type){
			var url ="/a/project/querydictlist?type="+type;
			var obj =this;
			startUp.getAsyncData(url,function(data){
				var str =$(obj);
				str.text("");
				str.append("<option value='-1'>请选择</option>");
				$.each(data, function(idx,item){
					var option ="<option value='"+item.value+"'>"+item.label+"</option>";
					str.append(option);
				});	
			});
		}
	});
	
	
	
	/**
	 * 由项目id带出二级楼栋户型
	 */
	$("#projectId").on("change", function(){
		$("#listSub").html("");
	});
	
	/**
	 * 点击添加合同
	 */
	$("#addContract").on("click",function(){
		 window.location.href=startUp.getRootPath()+"/a/contract/laborcontract/formVerify";
	});
	/**
	 * 点击提交合同
	 */
	$("#editBtn").on("click",function(){
		changeForContractNo();
		//处理下面的多行数据
		var checkTr =$(".table-eidt"+" tbody tr td").find("input[type=checkbox]");
		var laborContractArr=new Array();
		if(checkTr.length>0){
			checkTr.each(function(idx,item){
				var houseType =$(this).parents("tr").children()[1].lastElementChild.value;
				var building =$(this).parents("tr").children()[2].lastElementChild.value;
				var boneArea =$(this).parents("tr").children()[3].lastElementChild.value;
				var stoneArea =$(this).parents("tr").children()[4].lastElementChild.value;
				var otherArea =$(this).parents("tr").children()[5].lastElementChild.value;
				var substartdate =$(this).parents("tr").children()[6].lastElementChild.value;
				var subenddate =$(this).parents("tr").children()[7].lastElementChild.value;
				var subduration =$(this).parents("tr").children()[8].lastElementChild.value;
				var subisHurry =$(this).parents("tr").children()[9].lastElementChild.value;
				var subcontractPrice =$(this).parents("tr").children()[10].lastElementChild.value;
				var substandardPrice ="";
				if($(this).parents("tr").children()[11]){
					substandardPrice = $(this).parents("tr").children()[11].lastElementChild.value;
				}
				var subbudgetPrice = "";
				if($(this).parents("tr").children()[11]){
					subbudgetPrice =$(this).parents("tr").children()[12].lastElementChild.value;
				}
				
				var subid =$(this).parents("tr").attr("id");
				var temp = {"house":{"houseType":houseType,"building":building,"subid":subid,
									 "boneArea":boneArea,"stoneArea":stoneArea,"otherArea":otherArea,
									 "substartdate":substartdate,"subenddate":subenddate,"subduration":subduration,
									 "subisHurry":subisHurry,"subcontractPrice":subcontractPrice,"substandardPrice":substandardPrice,
									 "subbudgetPrice":subbudgetPrice
									}
							}
				var str = JSON.stringify(temp);
				laborContractArr[idx] = str;
			})
			if(laborContractArr.length > 0){
				laborContractArr = encodeURIComponent(laborContractArr.toString());
				$("#house").val(laborContractArr);
			}
		}else{
			window.alertx("没有签订楼栋数，不能生成合同！");
			return;
		}
		
		$("#inputForm").submit();
	});
	
// //上传附件
// $("#btnUpload").click(function(){
// $.jBox($("#annexBox").html(), {title:"上传附件", buttons:{"关闭":true},
// bottomText:""});
// });
	/**
	 * 上传附件
	 */
	$("#btnUpload").live("click",function(){
		$("#annexBox").slideToggle();
	});
	$("#btnImport").live("click",function(){
		$("#importBox").slideToggle();
	});
	$("#uploadAttachment").live("click",function(){
		var uploadContractId = $("#uploadContractId").val();
		var url ="/a/contract/laborcontract/upload";
		var param ={"uploadContractId":uploadContractId};
    	var fileId="file";
    	startUp.ajaxFileUpload(url,fileId,param,function(data){
    		var url ="/a/attachment/attachment/findattachlist?type="+uploadContractId;
    		startUp.getData(url,function(data){
    			var showAttach = $("#showAttach");
    			showAttach.text("");
    			$.each(data, function(idx,item){
    				var a ="<div>\
						<a id='"+item.id+"' href='"+ctx+item.attachUrl+"/download?id="+item.id+"'>"+item.name+" </a>&nbsp;&nbsp;\
				 		<span id='deleteAttach' deleteId='"+item.id+"'  class='glyphicon glyphicon-remove-circle'></span>\
				 		</div>";
    				showAttach.append(a);
    			});
    		});
    	});
	});
	
	/**
	 * 删除附件
	 */
	$("#deleteAttach").live("click", function(){
		var deleteId = this.getAttribute("deleteId");
		var url = "/a/attachment/attachment/deleteAttach?deleteId="+deleteId;
		startUp.getData(url,function(data){
			$("a#"+deleteId).parent().remove();
		});
	});
	
// //导入明细
// $("#btnImport").click(function(){
// $.jBox($("#importBox").html(), {title:"导入明细", buttons:{"关闭":true},
// bottomText:"导入文件不能超过5M，仅允许导入“xls”或“xlsx”格式文件！"});
// });
	
	/**
	 * 下拉选择劳务分项
	 */
	$("#laborList tr td>select[name$='name']").live("select2-opening", function(){
		var url = "/a/contract/laborItemsPrice/findDetailPriceList";
		var obj = this;
		startUp.getAsyncData(url, function(data){
			var str = $(obj);
			str.text("");
			str.append("<option value='-1'>===请选择===</option>");
			$.each(data,function(idx,item){
				var option ="<option value='"+item.name+"'>"+item.name+"</option>";
				str.append(option);
			});
			$("ul.select2-results").css("max-height","150px");
		});
	});
	
	/**
	 * 选择分项名,带出信息
	 */
	$("#laborList tr td>select[name$='name']").live("change",function(){
		var obj = this;
		var name = $(this).val();
		var url = "/a/contract/laborItemsPrice/getByName";
		var data = {"name":name};
		startUp.postData(url,data,function(data){
			var tr = $(obj).parents("tr").eq(0);
			var prefix = tr.attr("list")+"["+tr.attr("index")+"].";
			$("[id='"+prefix+"seriesnumber']").val(data.seriesnumber);
			$("[id='"+prefix+"speclength']").val(data.speclength);
			$("[id='"+prefix+"specwidth']").val(data.specwidth);
			$("[id='"+prefix+"spechigth']").val(data.spechigth);
			$("[id='"+prefix+"unit']").val(data.unit);
			$("[id='"+prefix+"nskeletonprice']").val(data.nskeletonprice);
			$("[id='"+prefix+"skeletonprice']").val(data.skeletonprice);
			$("[id='"+prefix+"nstoneprice']").val(data.nstoneprice);
			$("[id='"+prefix+"stoneprice']").val(data.stoneprice);
			$("[id='"+prefix+"standardprice']").val(data.tstandardprice);
		});
	});
	
	/**
	 * 选择施工合同,带出劳务需求
	 */
	$("#laborcontract").live("change", function(){
		var laborcontract = $("#laborcontract").val();
		var url = "/a/contract/laborDemand/getDemandByNum";
		var da = {"laborcontract":laborcontract};
		startUp.postAsyncData(url, da, function(data){
			
    		var urlx ="/a/attachment/attachment/findattachlist?type="+data.id;
    		startUp.getData(urlx,function(da){
    			var showAttach = $("#showAttach");
    			showAttach.text("");
    			$.each(da, function(idx,item){
    				var aa ="<div>\
						<a id='"+item.id+"' href='"+ctx+item.attachUrl+"/download?id="+item.id+"'>"+item.name+" </a>&nbsp;&nbsp;\
				 		<span id='deleteAttach' deleteId='"+item.id+"'  class='glyphicon glyphicon-remove-circle'></span>\
				 		</div>";
    				showAttach.append(aa);
    			});
    		});
    		
			  $("#proName").val(data.proName);
			  $("#laborcontract").select2("val", data.laborcontract);
			  $("#address").val(data.address);
			  $("#exetype").val(data.exetype);
			  $("#subsidy").select2("val", data.subsidy);
			  $("#ctype").val(data.ctype);
			  $("#house").val(data.house);
			  $("#buildings").val(data.buildings);
			  $("#hurrybuildings").val(data.hurrybuildings);
			  $("#startdate").val(data.startdate);
			  $("#enddate").val(data.enddate);
			  $("#duration").val(data.duration);
			  $("#projectleadBid").val(data.projectleadBid);
			  $("#projectleadBidtel").val(data.projectleadBidtel);
			  $("#projectmanagerAid").val(data.projectmanagerAid);
			  $("#projectmanagerAidtel").val(data.projectmanagerAidtel);
			  $("#mfloatratio").val(data.mfloatratio);
			  $("#contractscopeadjust").val(data.contractscopeadjust);
			  $("#rightrespadjust").val(data.rightrespadjust);
			  $("#qualityreqadjust").val(data.qualityreqadjust);
			  $("#warrantyadjust").val(data.warrantyadjust);
			  $("#settletermadjust").val(data.settletermadjust);

		});
	});
	
	/**
	 * 点击成本预算量,数量浮动比例计算合同量
	 */
	$("#qnumber").on("focusout", function(){
		countContractAmount();
	});
	$("#qfloatratio").on("focusout", function(){
		countContractAmount();
	});
	function countContractAmount(){
		var amount = $("#qnumber").val();
		var ratio = $("#qfloatratio").val();
		var contractAmount = "";
		if(amount != "" && ratio != ""){
			contractAmount = amount*ratio*0.01;
		}
		$("#cnumber").val(contractAmount);
	}
	
	/**
	 * 导入明细回显
	 */
	$("#btnImportSubmit").live("click", function(){
		var url = "/a/contract/laborcontract/importDetail";
		var fileId = "importFile";
		var html="<input type='hidden' name='delId' id='delId' value=''/>";
		startUp.uploadReturnJson(url,fileId,function(data){
			if(data){
				$.each(data, function(idx,item){
						var id = startUp.uuid();
					    var tr="<tr list='detailList' index='"+idx+"'>\
							<td class='check'>\
								<input type='checkbox'>\
							</td>\
							<td><input type='text' readonly='true' class='input110' name='detailList["+idx+"].seriesnumber' id='detailList["+idx+"].seriesnumber' value='"+item.seriesnumber+"'/></td>\
							<td><input type='text' readonly='true' class='input110' name='detailList["+idx+"].name' id='detailList["+idx+"].name' value='"+item.name+"'/></td>\
							<td><input type='text' readonly='true' class='input110' name='detailList["+idx+"].standard' id='detailList["+idx+"].standard' value='"+item.standard+"'/></td>\
							<td><input type='text' readonly='true' class='input60' name='detailList["+idx+"].length' id='detailList["+idx+"].length' value='"+item.length+"'/></td>\
							<td><input type='text' readonly='true' class='input60' name='detailList["+idx+"].width' id='detailList["+idx+"].width' value='"+item.width+"'/></td>\
							<td><input type='text' readonly='true' class='input60' name='detailList["+idx+"].heigh' id='detailList["+idx+"].heigh' value='"+item.heigh+"'/></td>\
							<td><input type='text' readonly='true' class='input60' name='detailList["+idx+"].unit' id='detailList["+idx+"].unit' value='"+item.unit+"'/></td>\
							<td><input type='text' readonly='true' class='input60' name='detailList["+idx+"].processOne' id='detailList["+idx+"].processOne' value='"+item.processOne+"'/></td>\
							<td><input type='text' readonly='true' class='input60' name='detailList["+idx+"].processTwo' id='detailList["+idx+"].processTwo' value='"+item.processTwo+"'/></td>\
							<td><input type='text' readonly='true' class='input60' name='detailList["+idx+"].processThree' id='detailList["+idx+"].processThree' value='"+item.processThree+"'/></td>\
							<td><input type='text' readonly='true' class='input60' name='detailList["+idx+"].processFour' id='detailList["+idx+"].processFour' value='"+item.processFour+"'/></td>\
							<td><input type='text' readonly='true' class='input60' name='detailList["+idx+"].preNumberFour' id='detailList["+idx+"].preNumberFour' value='"+item.preNumberFour+"'/></td>\
							<td><input type='text' readonly='true' class='input60' name='detailList["+idx+"].numberRatioFour' id='detailList["+idx+"].numberRatioFour' value='"+item.numberRatioFour+"'/></td>\
							<td><input type='text' readonly='true' class='input60' name='detailList["+idx+"].afterNumberFour' id='detailList["+idx+"].afterNumberFour' value='"+item.afterNumberFour+"'/></td>\
							<td><input type='text' readonly='true' class='input60' name='detailList["+idx+"].processPriceOne' id='detailList["+idx+"].processPriceOne' value='"+item.processPriceOne+"'/></td>\
							<td><input type='text' readonly='true' class='input60' name='detailList["+idx+"].processPriceTwo' id='detailList["+idx+"].processPriceTwo' value='"+item.processPriceTwo+"'/></td>\
							<td><input type='text' readonly='true' class='input60' name='detailList["+idx+"].processPriceThree' id='detailList["+idx+"].processPriceThree' value='"+item.processPriceThree+"'/></td>\
							<td><input type='text' readonly='true' class='input60' name='detailList["+idx+"].processPriceFour' id='detailList["+idx+"].processPriceFour' value='"+item.processPriceFour+"'/></td>\
							<td><input type='text' readonly='true' class='input60' name='detailList["+idx+"].priceRatio' id='detailList["+idx+"].priceRatio' value='"+item.priceRatio+"'/></td>\
							<td><input type='text' readonly='true' class='input60' name='detailList["+idx+"].standardPrice' id='detailList["+idx+"].standardPrice' value='"+item.standardPrice+"'/></td>\
							<td><input type='text' readonly='true' class='input60' name='detailList["+idx+"].contractPrice' id='detailList["+idx+"].contractPrice' value='"+item.contractPrice+"'/></td>\
							<td><input type='text' readonly='true' class='input60' name='detailList["+idx+"].priceDifference' id='detailList["+idx+"].priceDifference' value='"+item.priceDifference+"'/></td>\
							<td><input type='text' readonly='true' class='input60' name='detailList["+idx+"].budgetPrice' id='detailList["+idx+"].budgetPrice' value='"+item.budgetPrice+"'/></td>\
							</tr>";
						html+=tr;
				  });
				  $("#laborList").html(html);
			}
			
		});
	});
	
	$("#contractType").on("select2-opening",function(){
		provinceCitytown("1","contractType");
	});
	$("#fristType").on("select2-opening",function(){
		var parentId =  $("#isStandardContract").val();
		provinceCitytownLabor(parentId,"fristType");
	});
	$("#secondType").on("select2-opening",function(){
		var parentId =  $("#fristType").val();
		provinceCitytown(parentId,"secondType");
	});
	
	var contractType =$("#contractType").val();
	var fristType =$("#fristType").val();
	var secondType =$("#secondType").val();
	provinceCitytown("1","contractType");
	provinceCitytownLabor($("#isStandardContract").val(),"fristType");
	provinceCitytown(fristType,"secondType");
	$("#contractType").select2("val", contractType);
	$("#fristType").select2("val", fristType);
	$("#secondType").select2("val", secondType);
		

	//提交
	$("#startWorkflow").on("click", function(){
		loading();
		var contractId = $("#contractId").val();
		//var url = "/a/contract/laborcontract/startAuditFlow/" + contractId;
		var url = "/a/contract/laborcontract/startProcess/" + contractId;
		startUp.getAsyncData(url, function(data){
			loaded();
			if(data !=null && data.code==200){
				$.jBox.info(data.message, '提示信息');
				waitTimesAndCallback(callbackWhenActionDone);
			}else if(data !=null && data.code==500){
				$.jBox.alert(data.message, '警告');
			//自定义业务异常返回的信息(许俊雄 20160519)
			}else if(data && data.status){
				$.jBox.alert(data.message, '警告');
			}else{
				$.jBox.error('操作失败', '错误');
			}

		});
	});
	
	//项目id
	$("#projectId").on("click", function(){
		var projectId = $("#projectId").val();
		if(!projectId){
			return;
		}
		var url = "/a/contract/laborDemand/getProjectById?projectId="+projectId;
		startUp.getAsyncData(url,function(data){
			var project = data.project;
			var housetypes = data.houseTypes;
			$("#projectmanagerAid").val(dealWithUndefined(project.projectManager.name));
			$("#projectmanagerAidtel").val(dealWithUndefined(project.projectManager.mobile));
			$("#address").val(dealWithUndefined(project.address));
		});
	});
	
	//班组
	$(document).on("click","select[name ='ctype']",function(){
		var ctype = $("#ctype").val();
		var d = {"ctype":ctype};
		if(!ctype){
			return;
		}
		var url = "/a/contract/execution/byCtype";
		startUp.postData(url,d,function(data){
			var execution = data.execution;
			$("#projectleadBid").val(dealWithUndefined(execution.person));
			$("#projectleadBidtel").val(dealWithUndefined(execution.personTel));
		});
	});
	
	//质保金条款
	$("#qualityitem").on("click", function(){
		debugger;
		var qualityitem = $("#qualityitem").val();
		var d = {"item":qualityitem};
		if(!qualityitem){
			return;
		}
		var url = "/a/qualityitem/getbyitem";
		startUp.postData(url,d,function(data){
			var qualityitem = data.qualityitem;
			$("#exscheduleRatio").val(dealWithUndefined(qualityitem.exscheduleRatio));
			$("#accountRatio").val(dealWithUndefined(qualityitem.accountRatio));
			$("#qualityRatioFrist").val(dealWithUndefined(qualityitem.qualityRatioFrist));
			$("#qualityPayDateFrist").val(dealWithUndefined(qualityitem.qualityPayDateFrist));
			$("#qualityRatioSecond").val(dealWithUndefined(qualityitem.qualityRatioSecond));
			$("#qualityPayDateSecond").val(dealWithUndefined(qualityitem.qualityPayDateSecond));
		});
	});
});

//选择判断是否标准合同
function changeIsSC(){
	var val = $("select[name='isStandardContract']").val();
	if(val=='4'){
		$(".isSCFont").hide();
		$(".isSC").removeClass("required");
		$(".isSC").parent().find("span[class='error']").remove();
	}else{
		$(".isSCFont").show();
		$(".isSC").addClass("required");
	}
}

//for (var i in engines) {
//          engine.append('<option>' + engines[i] + '</option>');
//      }


/**
 * 
 */
function provinceCitytown(parentId,type){
	var url ="/a/contract/contractAccountType/findTypeByParentId?parentId="+parentId;
	if(parentId){
		startUp.getAsyncData(url,function(data){
			var town =$("#"+type);
			town.text("");
			town.append("<option value=''>请选择</option>");
			$.each(data, function(idx,item){
				var option ="<option value='"+item.id+"'>"+item.name+"</option>";
				town.append(option);
			});
		});
	}
}

function provinceCitytownLabor(parentId,type){
	var url ="/a/contract/contractAccountType/findTypeByParentId?parentId="+parentId;
	if(parentId){
		startUp.getAsyncData(url,function(data){
			var town =$("#"+type);
			town.text("");
			town.append("<option value=''>请选择</option>"); 
			$.each(data, function(idx,item){
				var option ="<option value='"+item.id+"'>"+item.name+"</option>";
				if("劳务类" == item.name){
					town.append(option);
				}
			});
		});
	}
}


function housechange(object){
	debugger;
	
	//同一个项目 同一个楼栋和其他的项目楼栋是没有关系的
	var houseType =$(object).parents("tr").children()[1].lastElementChild.value;
	var projectId = $("#projectId").val();
	//请求详情数据
	var param = '{"projectId":"'+projectId+'","house":"'+houseType+'"}';
	var requestURL = startUp.getRootPath()+"/a/contract/laborcontract/getBuildingbyhouse";
	
//	var sel = $(object).parent().parent().children()[2].children;
	debugger;
	var sel = $(object).parent("td").next().find("select[name='htmlbuildings']");//.parent().children()[2].children;
	var option ="<option >请选择</option>";
	$(sel).text("");
	$(sel).append(option);
//	$(sel).select2();
	
	$.ajax({
		 type: "POST" , 
	     url: requestURL ,
	     async: false,
	     data: param ,
	     dataType : "JSON",
	     contentType:"application/json; charset=utf-8",
	     success: function(data){
	 		var listMap = data.buildings;
			$.each(listMap,function(i,item){
				var option ="<option value='"+item.buildings+"'>"+item.buildingsDisName+"</option>";
				$(sel).append(option);
//				$(sel).select2();
			});
	     } , 
	     error: function(errorMsg){
	        alert("请求失败：" + errorMsg);
	    }
	});
}


function buildingsclick(object){
	debugger;
	
	//同一个项目 同一个楼栋和其他的项目楼栋是没有关系的
	var houseType =$(object).parents("tr").children()[1].lastElementChild.value;
	var building =$(object).parents("tr").children()[2].lastElementChild.value;
	var projectId = $("#projectId").val();
	//请求详情数据
	var param = '{"projectId":"'+projectId+'","house":"'+houseType+'","buildings":"'+building+'"}';
	var requestURL = startUp.getRootPath()+"/a/contract/laborcontract/getlaborArea";
	$.ajax({
		 type: "POST" , 
	     url: requestURL ,
	     async: false,
	     data: param ,
	     dataType : "JSON",
	     contentType:"application/json; charset=utf-8",
	     success: function(data){
	    	 if(data.boneArea == undefined || data.stoneArea == undefined || data.otherArea == undefined ){
	    		 $(object).parents("tr").children()[3].lastElementChild.value = 0;
		 		 $(object).parents("tr").children()[4].lastElementChild.value = 0;
		 		 $(object).parents("tr").children()[5].lastElementChild.value = 0;
	    	 }else{
	    		 $(object).parents("tr").children()[3].lastElementChild.value = data.boneArea;
		 		 $(object).parents("tr").children()[4].lastElementChild.value = data.stoneArea;
		 		 $(object).parents("tr").children()[5].lastElementChild.value = data.otherArea;
	    	 }
	    	 
	     } , 
	     error: function(errorMsg){
	        alert("请求失败：" + errorMsg);
	    }
	});
	changeForContractNo();
}

function changeForContractNo(){
	var requestURL = startUp.getRootPath()+"/a/contract/laborcontract/changeForContractNo";
	var fristType = $("#fristType")[0].selectedOptions[0].innerText;
	var secondType = $("#secondType")[0].selectedOptions[0].innerText;
//	var fristType= $("#fristType").val();
//	var secondType = $("#secondType").val();
	var projectCode = $("#projectId")[0].selectedOptions[0].innerText;
	var projectId = $("#projectId").val();
	var ctype = $("#ctype").val();
	var exeScope = $("#exeScope")[0].selectedOptions[0].innerText;
	var id = $("#contractId").val();
	var buildings = "";
	
	debugger;
	
	$("select[name='htmlbuildings']").each(function(){  
			buildings = buildings+"、"+ $(this)[0].selectedOptions[0].innerText;
		}  
	) 
	$("input[name='htmlbuildings']").each(function(){  
			buildings = buildings+"、"+$(this).val();
		}  
	) 
	buildings = buildings.substring(1);
	var isStandardContract = $("#isStandardContract")[0].selectedOptions[0].innerText;
	//获取显示名称作为合同编号。
	var buildingsDisName = $("#buildingsDisName").val();
	
	var param = '{"fristType":"'+fristType+'","id":"'+id+'","secondType":"'+secondType+'","projectId":"'+projectId+'",\
			"partyBCode":"'+projectCode+'","ctype":"'+ctype+'",\
			"exeScope":"'+exeScope+'","buildings":"'+buildings+'","isStandardContract":"'+isStandardContract+'"}';
	debugger;
	$.ajax({
		 type: "POST" , 
	     url: requestURL ,
	     async: false,
	     data: param ,
	     dataType : "JSON",
	     contentType:"application/json; charset=utf-8",
	     success: function(data){
	    	 $("#contractNo").val(data.contractNo);
	    	 $("#proName").val(data.proName);
	     } , 
	     error: function(errorMsg){
	        alert("请求失败：" + errorMsg);
	    }
	});
	/*startUp.postActData(requestURL,param,"application/json; charset=utf-8", function(data){
		debugger;
		
	});*/
}

function contractPriceClick(object){
	var contractPrice = 0.00;
	$("input[name='subcontractPrice']").each(function(){  
		var value = parseFloat(this.value);
		if((typeof value == "number") && value){
			contractPrice = contractPrice + value;
		}
	});
	$("#contractPrice").val(contractPrice.toFixed(2));
	allRatioVal();
}

function standardPriceClick(){
	var standardPrice = 0.00;
	$("input[name='substandardPrice']").each(function(){  
		var value = parseFloat(this.value);
		if((typeof value == "number") && value){
			standardPrice = standardPrice + value;
		}
	});  
	$("#standardPrice").val(standardPrice.toFixed(2));
	allRatioVal();
}
//浮动比例处理
function allRatioVal(){
	var contractPrice = $("#contractPrice").val();
	var standardPrice = $("#standardPrice").val();
	if(parseFloat(standardPrice)<=0){
		$("#allRatio").val("");
	}else{
		var allRatioVal = (((contractPrice-standardPrice)/standardPrice)*100).toFixed(2);
		if("NaN" != allRatioVal){
			$("#allRatio").val(allRatioVal<0?"":allRatioVal);
		}
	}
//	var allRatioVal = ((($("#contractPrice").val()-$("#standardPrice").val())/$("#standardPrice").val())*100).toFixed(2);
	
}

function budgetPriceClick(){
	var budgetPrice = 0.00;
	$("input[name='subbudgetPrice']").each(function(){  
		var value = parseFloat(this.value);
		if((typeof value == "number") && value){
			budgetPrice = budgetPrice + value;
		}
	});
	$("#budgetPrice").val(budgetPrice.toFixed(2));
}

function timeinput(){
	WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});
}


function callbackWhenActionDone(){
	var url = $("#managementPageUrl").val();
	window.location.href = url;
}



function changeProjectId(){
	var projectId = $("#projectId").val();
	if(!projectId){
		alertx("请选择项目");
		return;
	}
	var url = "/a/contract/laborDemand/getProjectById?projectId="+projectId;
	startUp.getAsyncData(url,function(data){
		var project = data.project;
		var housetypes = data.houseTypes;
		$("#proName").val(dealWithUndefined(project.name));
		$("#projectmanagerAid").val(dealWithUndefined(project.projectManager.name));
		$("#projectmanagerAidtel").val(dealWithUndefined(project.projectManager.mobile));
		$("#address").val(dealWithUndefined(project.address));
		
		var timestamp=new Date().getTime();	
		var html=loadHouseTypeBuildingHtml(project.subList,housetypes,timestamp);
		$("#listSub").append(html);
		document.body.scrollTop = document.body.scrollHeight;
//		$(".loadSel"+timestamp).select2();
	});
}



function loadHouseTypeBuildingHtml(subList,housetypes,timestamp){
	debugger;
	var html="";
	var laborContractDetail = {};
	
	var htmlhouses = "<select class='input80 htmlhouseType dropdown loadSel"+timestamp+"' name='houseType' onchange='housechange(this)'  ><option>请选择</option> ";
	var htmlbuildings = "<select class='input70 htmlbuildings dropdown loadSel"+timestamp+"' name='htmlbuildings' onchange='buildingsclick(this)' > <option>请选择</option>";
	
	for(var i = 0 ; i < housetypes.length ; i++){
		htmlhouses = htmlhouses + "<option value="+housetypes[i].houseType+" >"+housetypes[i].houseType+"</option>";
	}
	htmlhouses = htmlhouses + "</select>";
	
	for(var i = 0 ; i < subList.length ; i++){
		htmlbuildings = htmlbuildings + '<option value='+encodeURIComponent(subList[i].building)+' >'+subList[i].buildingDisplayName+'</option>';
	}
	htmlbuildings = htmlbuildings + "</select>";
	var whiteHtml="";
	if($("#white").val()){
		whiteHtml+="<td><input class='input80 number' type='text' name='substandardPrice' onblur='standardPriceClick(this)' value=''></td>\
			<td><input class='input80 number' type='text' name='subbudgetPrice' onblur='budgetPriceClick(this)' value=''></td>";
	}
	html+="<tr id='' class='active' >\
		<td><input type='checkbox' name='buildingBox'></td>\
		<td>"+htmlhouses+"</td>\
		<td>"+htmlbuildings+"</td>\
		<td><input class='input60' type='text' name='boneArea' value=''></td>\
		<td><input class='input60' type='text' name='stoneArea' value=''></td>\
		<td><input class='input60' type='text' name='otherArea' value=''></td>\
		<td><input class='input80' type='text' name='substartdate' onblur='onblurSumDuration(this)' class='input-medium Wdate ' onclick='timeinput()' value=''></td>\
		<td><input class='input80' type='text' name='subenddate' onblur='onblurSumDuration(this)' class='input-medium Wdate ' onclick='timeinput()' value=''></td>\
		<td><input class='input-min' type='text' name='subduration' disabled='disabled' onclick='getDuration(this)' value=''></td>\
		<td><select class='input60 loadSel' name='subisHurry' class='input-medium'> <option value='0' > 否</option> <option value='1' > 是</option></select> </td>\
		<td><input class='input80 number' type='text' name='subcontractPrice' onblur='contractPriceClick(this)' value=''></td>\
	"+whiteHtml+"</tr>";
	
	return html;
}
//光标离开计算工期
function onblurSumDuration(obj){
	var tr = $(obj).parent().parent();
	var startDate = tr.find("input[name='substartdate']").val();
	var endDate = tr.find("input[name='subenddate']").val();
	var duration = Number(Math.floor((new Date(endDate).getTime()-new Date(startDate).getTime())/(24*3600*1000)))+1;
	if(duration > 0){
		tr.find("input[name='subduration']").val(duration);
	}
}
