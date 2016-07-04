/*创建申购计划  start  2015年9月8日12:04:18*/
$(function(){
	//申购计划添加行数据
	//绑定项目名称下拉框。下拉时填充数据
	$(document).off("select2-opening","#apDetail tr td>select[name^='proSel']").on("select2-opening","#apDetail tr td>select[name^='proSel']",function(){
		var url = "/a/purchase/applyPurchase/listPro";
		var sel = $(this);
		startUp.getAsyncData(url,function(data){
			var listMap = data.listMap;
//			var html="";
//			html+="<option value=''>请选择</option>";
			sel.text("");
			sel.append("<option value=''>请选择</option>");
			$.each(listMap,function(i,item){
				var option ="<option value='"+item.proID+"'>"+item.proName+"</option>";
				sel.append(option);
			});
		});
	});
	//根据项目拉取二级项目项目数据
	$(document).off("change","#apDetail tr td>select[name^='proSel']").on("change","#apDetail tr td>select[name^='proSel']",function(){
		$("#saveAP").removeAttr("disabled");
		var proID = $(this).val();
		var tr = $(this).parent().parent("tr"); 
		$(this).parent().nextAll().text("");	//清空自己之后的全部兄弟节点数据
		var d={proID:proID};
		var url="/a/purchase/applyPurchase/getSubByProID";
		startUp.postData(url,d,function(data){
			var html="<select style='width:100px;' name='hxSel' class='input-medium'>";
			html+="<option value=''>请选择</option>";
			for(var i=0;i<data.length;i++){
				html+="<option value='"+data[i].subHouseType+"'>"+data[i].subHouseType+"</option>";
			}
			html+="</select>";
			tr.find("td").eq(2).html(html);	//户型
		});
	});
	//根据户型拉取二级项目项目数据
	var subMap = {};
	$(document).off("change","select[name='hxSel']").on("change","select[name='hxSel']",function(){
		var tr = $(this).parent().parent("tr"); 
		var proID = tr.find("td>select[name^='proSel']").val();
		var houseType = $(this).val();
		$(this).parent().nextAll().text("");
		var d={proID:proID,houseType:houseType};
		var url="/a/purchase/applyPurchase/getSubByHouseType";
		startUp.postData(url,d,function(data){
			var html="<select style='width:100px;' name='ldhSel' class='input-medium'>";
			html+="<option value=''>请选择</option>";
			for(var i=0;i<data.length;i++){
				html+="<option value='"+data[i].subID+"'>"+data[i].subBuilding+"</option>";
				subMap[data[i].subID] = data[i];
			}
			html+="</select>";
			tr.find("td").eq(3).html(html);	//楼栋号
		});
	});
	//根据楼栋号拉取类型和挂石面积
	$(document).off("change","select[name='ldhSel']").on("change","select[name='ldhSel']",function(){
		var tr = $(this).parent().parent("tr"); 
		var subID = $(this).val();
		//不能重复选择二级项目
		var count=0;
		var checks = $("input[name='delBox']");
		for(var i=0;i<checks.length;i++){
			var trs = $(checks[i]).parent().parent("tr");
			var origin = trs.find("td>select[name^='ldhSel']").val();
			if(subID==origin){
				count+=1;
			}
		}
		//项目选择
		if(parseInt(count)>1){
			$(this).find("option[value='']").attr("selected","selected");
			window.alertx("楼栋号不能重复选择");
			return;
		}
		var sub = subMap[subID];
		tr.find("td").eq(4).html(sub.subType);	//类型
		tr.find("td").eq(5).html(sub.subAreaofstone);	//挂石面积
		//获取相应的材料规格数据填入表单
		subTypeTD(sub.subType,tr);
		//总计挂石面积
		sumGSMJ(sub.subAreaofstone);
		
	});
	//保存数据
	$("#saveAP").unbind("click").bind("click",function(){
		var seriesnumber = $("#seriesnumber").val();
		var processInstanceId = $("#processInstanceId").val();
		//二级项目ID
		var subIDs="";
		var checks = $("input[name='delBox']");
		for(var i=0;i<checks.length;i++){
			var tr = $(checks[i]).parent().parent("tr");
			var subID=tr.find("td>select[name^='ldhSel']").val();
			if(!subID){
				window.alertx("楼栋号必须选择");
				return;
			}
			subIDs+=subID;
			if(i+1<checks.length){
				subIDs+=",";
			}
		}
		//材料需求数据json组装
		var pdJson=pdJsonUtils();
		
		//组装提交数据
		var url = "/a/purchase/applyPurchase/saveAP";
		var d={seriesnumber:seriesnumber,processInstanceId:processInstanceId,
				pdJson:$.toJSON(pdJson),subIDs:subIDs}
		startUp.postData(url,d,function(data){
			window.alertx(data.message);
			$("#submitAP").removeAttr("disabled");
		});
	});
	//提交数据
	$("#submitAP").unbind("click").bind("click",function(){
		$("#saveAP").attr("disabled","disabled");
		var seriesnumber=$("#seriesnumber").val();
		var url = "/a/purchase/applyPurchase/submitAP";
		var d = {seriesnumber:seriesnumber};
		startUp.postData(url,d,function(data){
			window.alertx("提交成功");
			$("#submitSN").val("");
			$("#submitAPForm").submit();
		});
	});
	$("#passAP").unbind("click").bind("click",function(){
		$("#passAP").attr("disabled","disabled");
		$("#rebutAP").attr("disabled","disabled");
		$("#passAPForm").submit();
	});
	//查看数据详情，编辑详情数据
	$("a[name='apDetail']").unbind("click").bind("click",function(){
		var seriesnumber = $(this).attr("sn");
		$("#seriesnumber").val(seriesnumber);
		$("#apDetailFrom").submit();
	});
	//删行
	$("li[attr='applyDelRow']").bind("click",function(){
		//没有项目数据的时候删除相关的材料需求输入框
		if($("input[name='delBox']").length<=0){
			$("#cg10").hide();
			$("#cg8").hide();
			$("#jg555").hide();
			$("#cg6d3").hide();
			$("#jg554").hide();
			$("#gsmj").html("");
		}
		//删行需要重新计算挂石面积
		sumGSMJ();
	});
	
});
/*start2015年9月7日16:15:15*/
//根据项目类型进行数据填充
function subTypeTD(type,tr){
	$("#cg10").show();
	if(type=="别墅"){
		tr.find("td").eq(7).html("0.1支/㎡");
		tr.find("td").eq(10).html("0.5支/㎡");
		tr.find("td").eq(8).html("");
		tr.find("td").eq(9).html("");
		$("#cg8").show();
		$("#jg555").show();
	}else if(type=="商铺"||type=="综合楼"){
		tr.find("td").eq(8).html("0.06支/㎡");
		tr.find("td").eq(9).html("0.55支/㎡");
		tr.find("td").eq(7).html("");
		tr.find("td").eq(10).html("");
		$("#cg6d3").show();
		$("#jg554").show();
	}
}
function subTypeVal(type,index){
	index = parseInt(index);
	if(type=="别墅"&&(index==7||index==10)){
		return "0.1支/㎡-0.5支/㎡";
	}else if((type=="商铺"||type=="综合楼")&&(index==8||index==9)){
		return "0.06支/㎡-0.55支/㎡";
	}
	return " - ";
}
//计算总的挂石面积
function sumGSMJ(){
	var gsmj = 0;
	var cg8=0;
	var cg6d3=0;
	var jg555=0;
	var jg554=0;
	var checks = $("input[name='delBox']");
	var tr;
	for(var i=0;i<checks.length;i++){
		tr = $(checks[i]).parent().parent("tr");
		var subType = tr.find("td").eq(4).html();	//楼栋类型
		var g = tr.find("td").eq(5).html();	//挂石面积
		cg8+=parseInt(budgetCG8(g,subType));
		cg6d3+=parseInt(budgetCG6d3(g,subType));
		jg555+=parseInt(budgetJG555(g,subType));
		jg554+=parseInt(budgetJG554(g,subType));
		gsmj+=parseInt(g);
	}
	$("#gsmj").html(gsmj);
	$("#cg8").val(cg8);
	$("#cg6d3").val(cg6d3);
	$("#jg555").val(jg555);
	$("#jg554").val(jg554);
}
/*预算需求数量 start*/
function budgetCG8(gsmj,subType){
	if(subType=="别墅"){
		return parseInt(gsmj)*0.1;
	}else{
		return 0;
	}
}
function budgetCG6d3(gsmj,subType){
	if(subType=="综合楼"||subType=="商铺"){
		return parseInt(gsmj)*0.06;
	}else{
		return 0;
	}
}
function budgetJG555(gsmj,subType){
	if(subType=="别墅"){
		return parseInt(gsmj)*0.5;
	}else{
		return 0;
	}
}
function budgetJG554(gsmj,subType){
	if(subType=="综合楼"||subType=="商铺"){
		return parseInt(gsmj)*0.55;
	}else{
		return 0;
	}
}
/*预算需求数量 end*/
//材料需求数量json组装
function pdJsonUtils(){
	var pdJson={pd:[]};
	var cg10 = $("#cg10").val();
	if(parseInt(cg10)>0){
		var p = {count:parseInt(cg10),type:"10#槽钢"};
		pdJson.pd.push(p);
	}
	var cg8 = $("#cg8").val();
	if(parseInt(cg8)>0){
		var p = {count:parseInt(cg8),type:"8#槽钢"};
		pdJson.pd.push(p);
	}
	var cg6d3 = $("#cg6d3").val();
	if(parseInt(cg6d3)>0){
		var p = {count:parseInt(cg6d3),type:"6.3#槽钢"};
		pdJson.pd.push(p);
	}
	var jg555 = $("#jg555").val();
	if(parseInt(jg555)>0){
		var p = {count:parseInt(jg555),type:"50*50*5角钢"};
		pdJson.pd.push(p);
	}
	var jg554 = $("#jg554").val();
	if(parseInt(jg554)>0){
		var p = {count:parseInt(jg554),type:"50*50*4角钢"};
		pdJson.pd.push(p);
	}
	return pdJson;
}
/*申购计划数据填充end*/
/*创建申购计划  end 2015年9月8日12:04:18*/

/*根据申购编号查看相关详细数据 start*/
//查看详情界面回调此函数进行读取详情数据
function apDetail(seriesnumber){
	var url = "/a/purchase/applyPurchase/ajaxApDetail";
	var d = {seriesnumber:seriesnumber};
	startUp.postData(url,d,function(data){
		var listM = data.listM;
		//循环填充项目列表数据
		var html="";
		var tr="";
		var processInstanceId="";
		for(var i=0;i<listM.length;i++){
			var sort = (i+1);
			var tr="<tr id='rS"+sort+"' sort='"+sort+"'>\
			<td><input sort='"+sort+"' name='delBox' type='checkbox'></td>\
			<td>"+selUtils("proSel",sort,listM[i].proID,listM[i].proName,150)+"</td>\
			<td id='hxTD"+sort+"'>"+selUtils("hxSel",sort,listM[i].subHouseType,listM[i].subHouseType,100)+"</td>\
			<td id='ldhTD"+sort+"'>"+selUtils("ldhSel",sort,listM[i].subID,listM[i].subBuilding,100)+"</td>\
			<td id='lbTD"+sort+"'>"+listM[i].subType+"</td>\
			<td id='gsmjTD"+sort+"'>"+listM[i].subAreaofstone+"</td>\
			<td>&nbsp;</td>\
			<td>"+subTypeVal(listM[i].subType,7).split("-")[0]+"</td>\
			<td>"+subTypeVal(listM[i].subType,8).split("-")[0]+"</td>\
			<td>"+subTypeVal(listM[i].subType,9).split("-")[1]+"</td>\
			<td>"+subTypeVal(listM[i].subType,10).split("-")[1]+"</td>\
			</tr>";
			
			html+=tr;
			processInstanceId=listM[i].workflowid;
		}
		var listPD = data.listPD;
		for(var i=0;i<listPD.length;i++){
			loadPD(listPD[i],"");
		}
		$("#apDetail").append(html);
		validateSignAP(processInstanceId);
		validateStatus(data.wfStatus);
		$("#processInstanceId").val(processInstanceId);
		$("#trackAP").attr("pid",processInstanceId);
		$("#trackAP").attr("wfStatus",data.wfStatus);
		loadPro(data.listPro);
		sumGSMJ();
	});
}
function loadPro(listPro){
//	var html="<select style='width:100px;' name='ldhSel' class='input-medium'>";
	var html="";
	for(var i=0;i<listPro.length;i++){
		html+="<option value='"+listPro[i].proID+"'>"+listPro[i].proName+"</option>";
//		subMap[listPro[i].subID] = listPro[i];
	}
	var sels = $("select[name^='proSel']");
	for(var i=0;i<sels.length;i++){
		$(sels[i]).append(html);
	}
}
//加载申购数据	isRead-是否只读
function loadPD(pd,isDis){
	if(pd.mtype=="50*50*5角钢"){
		$("#jg555").show();
		$("#jg555").val(pd.count);
	}else if(pd.mtype=="50*50*4角钢"){
		$("#jg554").show();
		$("#jg554").val(pd.count);
	}else if(pd.mtype=="6.3#槽钢"){
		$("#cg6d3").show();
		$("#cg6d3").val(pd.count);
	}else if(pd.mtype=="8#槽钢"){
		$("#cg8").show();
		$("#cg8").val(pd.count);
	}else if(pd.mtype=="10#槽钢"){
		$("#cg10").show();
		$("#cg10").val(pd.count);
	} 
	
}
//验证状态
function validateStatus(wfStatus){
	
	if(parseInt(wfStatus)>0){
		$("#saveAP").attr("disabled","disabled");
//		$("#trackAP").removeAttr("disabled");
		//原可编辑字段全部只读
		originDisabled();
	}else{
		$("#saveAP").removeAttr("disabled");
		$("#submitAP").removeAttr("disabled");
	}
		
}
function originDisabled(){//原可编辑字段全部只读
	$("input[name='delBox']").attr("disabled","disabled");
	$("select[name^='proSel']").attr("disabled","disabled");
	$("select[name^='hxSel']").attr("disabled","disabled");
	$("select[name^='ldhSel']").attr("disabled","disabled");
	
	$("input[class='ap']").attr("disabled","disabled");
	$("#editRow").hide();
}
function originShow(){//原可编辑字段全部还原回可编辑
	$("input[name='delBox']").removeAttr("disabled");
	$("select[name^='proSel']").removeAttr("disabled");
	$("select[name^='hxSel']").removeAttr("disabled");
	$("select[name^='ldhSel']").removeAttr("disabled");
	
	$("input[class='ap']").removeAttr("disabled");
	$("#editRow").show();
}
//验证判断是否拥有控件的相应权限
function validateSignAP(processInstanceId){
	if(processInstanceId){//如果有流程ID则说明流程已经开启并进行中
		$("#trackAP").removeAttr("disabled");
	}
	var url = "/a/act/access/task/direct/isCandidateUser/"+processInstanceId;
	startUp.postData(url,{},function(data){
		if(data){
			$("#signAP").removeAttr("disabled");
//			validateEditButton(processInstanceId,true);
		}
		validateEditButton(processInstanceId,true);
	});
}
//验证驳回以及提交的按钮
function validateEditButton(processInstanceId,flag){
	if(flag){
		var url = "/a/act/access/task/direct/isAssigneeUser/"+processInstanceId;
		startUp.postData(url,{},function(data){
			if(data){
				$("#submitAP").hide();
				$("#passAP").show();
				$("#passAP").removeAttr("disabled");
				$("#rebutAP").removeAttr("disabled");
				var url = "/a/act/access/task/direct/getTaskForm/"+processInstanceId;
				$.ajax({
					url : startUp.getRootPath()+url,
					type : "GET",
					success : function(data) {
						if(data!=""&&data!=null&&data=="editApplyForm"){
							$("#processInstanceId").val(processInstanceId);
							$("#passAP").removeAttr("disabled");
							$("#saveAP").removeAttr("disabled");
							$("#rebutAP").attr("disabled","disabled");
							originShow();
						}
					}
				});
			}else{
				if(processInstanceId){
					$("#submitAP").attr("disabled","disabled");
					$("#saveAP").attr("disabled","disabled");
				}
			}
		});
	}else{
		var url = "/a/act/access/task/direct/isCandidateUser/"+processInstanceId;
		startUp.postData(url,{},function(data){
			if(data){
				var url = "/a/act/access/task/direct/isAssigneeUser/"+processInstanceId;
				startUp.postData(url,{},function(data){
					if(data){
						$("#passAP").removeAttr("disabled");
						$("#rebutAP").removeAttr("disabled");
					}
				});
			}
		});
	}
	
}
//下来列表select工具类
function selUtils(name,sort,val,lable,width){
	var sel="<select style='width:"+width+"px;' name='"+name+"' id='"+name+sort+"' sort='"+sort+"' class='input-medium'>";
	sel+="<option value='"+val+"'>"+lable+"</option>";
	sel+="</select>";
	return sel;
}
/*根据申购编号查看相关详细数据 end*/

/*流程 start*/
$(function(){
	//签收任务
	$("#signAP").unbind("click").bind("click",function(){
		var input = $(this);
		var processInstanceId = $("#processInstanceId").val();
		//组装提交数据
		var url = "/a/act/access/task/direct/claim/"+processInstanceId;
		startUp.postData(url,{},function(data){
			if(data){
				window.alertx("签收成功");
				input.attr("disabled","disabled");
				$("#submitAP").hide();
				$("#passAP").show();
				validateEditButton(processInstanceId,true);
			}
		});
	});
	//驳回申购计划
	$("#rebutAP").unbind("click").bind("click",function(){
		var html = "<div style='padding:10px;'>输入点什么：<input type='text' id='some' name='some' /></div>";
		var submit = function(v, h, f) {
		    if(f.some == ""){
		        top.$.jBox.tip("请输入点什么。", "error", { focusId: "some" }); // 关闭设置 some 为焦点
		        return false;	//标识窗口不被关闭
		    }
		    $("#rebutMessage").val(f.some);
		    $("#rebutPID").val($("#processInstanceId").val());
		    $("#rebutAPForm").submit();
		    return true;	//标识窗口关闭
		};
		top.$.jBox(html, { title: "输入", submit: submit });
	});
	$("#trackAP").unbind("click").bind("click",function(){
		var processInstanceId = $(this).attr("pid");
		var wfStatus = $(this).attr("wfStatus");
		if(parseInt(wfStatus)==4){
			showTraceDiagramInHistory(processInstanceId);
		}else{
			showTraceDiagramInRuntime(processInstanceId);
		}
			
	});
});

/*流程 end*/



