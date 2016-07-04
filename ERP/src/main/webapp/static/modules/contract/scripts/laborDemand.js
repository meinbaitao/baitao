$(function() {
	/**
	 * 流程控制
	 */
	$(document).ready(function(){
		debugger;
		var submitUrl = $("#submitUrl").val();
		var successUrl = $("#successUrl").val();
		actButton();
		actControl(submitUrl,successUrl, 'editApplyForm');
	});
	
	/**
	 * 点击提交合同
	 */
	$("#editBtn").on("click",function(){
		$("#inputForm").submit();
	});
	
	/**
	 * 上传附件
	 */
//	$("#btnUpload").live("click",function(){
//		$("#annexBox").slideToggle();
//	});
	$("#uploadAttachment").live("click",function(){
		var uploadContractId = $("#uploadContractId").val();
		var url ="/a/contract/laborDemand/upload";
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
		debugger
		var deleteId = this.getAttribute("deleteId");
		var url = "/a/attachment/attachment/deleteAttach?deleteId="+deleteId;
		startUp.getData(url,function(data){
			$("a#"+deleteId).parent().remove();
		});
	});
	
	/**
	 * 选择施工班组带出施工班组信息
	 */
	$("#ctype").on("click",function(){
		var id = $("#ctype").val();
		var url = "/a/contract/execution/getById?id="+id;
		startUp.getData(url,function(data){
			$("#partyBCode").val(data.code);
			$("#exetype").val(data.exeType);
			$("#projectleadBid").val(data.person);
			$("#projectleadBidtel").val(data.personTel);
		});
	});
	
	/**
	 * 由项目id带出二级楼栋户型
	 */
	$("#projectId").on("click", function(){
		changeProjectId();
	});
	//点击户型
	$(document).off("click","i[attrID='houseType']").on("click","i[attrID='houseType']",function(){
		var houseType = $(this).attr("thisTagertId");
		var isShow = $("tr[attrHouseType='"+houseType+"']").css("display");
		if(isShow=="none"){
			$("tr[attrHouseType='"+houseType+"']").removeAttr("style");//css("display","block");
		}else{
			$("tr[attrHouseType='"+houseType+"']").css("display","none");
		}
		
	});
	/**
	 * 由楼栋号获取赶工楼栋号
	 */
	$("#buildings").on("click", function(){
		var buildings = $("#buildings").val();
		getHurryBuildings(buildings);
	});
	function getHurryBuildings(buildings){
		var hurrybuildings = $("#hurrybuildings");
		hurrybuildings.text("");
		var temp = new Array();
		temp=buildings.toString().split(",");
		tempLength = temp.length;
		for(var i=0;i<tempLength;i++){
			var optionHurry = "<option value='"+temp[i]+"'>"+temp[i]+"</option>";
			hurrybuildings.append(optionHurry);
		}
	}
	
	/**
	 * 计算工程工期
	 */
	$("#startdate").on("focusout", function(){
		countDate();
	});
	$("#enddate").on("focusout", function(){
		countDate();
	});
	function countDate(){
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
	
	/**
	 * 数组去重
	 */
	Array.prototype.unique = function()
	{
		this.sort();
		var re=[this[0]];
		for(var i = 1; i < this.length; i++)
		{
			if( this[i] !== re[re.length-1])
			{
				re.push(this[i]);
			}
		}
		return re;
	}
	
});

function changeProjectId(){
	var projectId = $("#projectId").val();
	if(!projectId){
		return;
	}
	var url = "/a/contract/laborDemand/getProjectById?projectId="+projectId;
	startUp.getAsyncData(url,function(data){
		var project = data.project;
		$("#proName").val(dealWithUndefined(project.name));
		$("#projectmanagerAid").val(dealWithUndefined(project.projectManager.name));
		$("#projectmanagerAidtel").val(dealWithUndefined(project.projectManager.mobile));
		$("#address").val(dealWithUndefined(project.address));
//		//二级户型,楼栋下拉选
//		var house =$("#house");
//		var buildings =$("#buildings");
//		house.text("");
//		buildings.text("");
//		var houseArray = new Array();
//		var buildingArray = new Array();
//		$.each(project.subList, function(idx,item){
//			houseArray.push(item.houseType);
//			buildingArray.push(item.building); 
//			houseArray = houseArray.unique();
//			buildingArray = buildingArray.unique();
//		});
//		for(var i=0;i<houseArray.length;i++){
//			var optionHouse ="<option value='"+houseArray[i]+"'>"+houseArray[i]+"</option>";
//			house.append(optionHouse);
//		}
//		for(var i=0;i<buildingArray.length;i++){
//			var optionBuilding ="<option value='"+buildingArray[i]+"'>"+buildingArray[i]+"</option>";
//			buildings.append(optionBuilding);
//		}
//		//甲方合同下拉选
//		var jiaContractList = $("#laborcontract");
//		jiaContractList.text("");
//		$.each(project.jiaContractList,function(idx,item){
//			var optionJiaContract = "<option value='"+item.cid+"'>"+item.cid+"</option>";
//			jiaContractList.append(optionJiaContract);
//		});
		var html=loadHouseTypeHtml(data.houseTypes,project.subList);
		$("#listSub").html(html);
		debugger;
		treeTable_input_chk();
	});
}
function loadHouseTypeHtml(list,subList){
	var html="";
	$.each(list,function(i,item){
		html+="<tr id='"+item.houseType+"' class='active' haschild='true' islastone='true' depth='1'>\
					<td><a href='javascript:void(0);'><i thisTagertId='"+item.houseType+"' attrID='houseType' class='glyphicon glyphicon-triangle-right'></a></i>\
					<input type='checkbox' name='houseTypeBox' value='"+item.houseType+"'></td>\
					<td>"+item.houseType+"</td>\
					<td>&nbsp;</td>\
				</tr>";
		html+=loadBuildingHtml(subList,item.houseType);
	});
	return html;
}
function loadBuildingHtml(subList,houseType){
	var html="";
	$.each(subList,function(i,item){
		if(item.houseType==houseType){
			//修改item.building 为item.buildingDisplayName用来显示看 许俊雄 20160406
			html+="<tr style='display:none;' id='"+item.building+"' pid='"+houseType+"' attrHouseType='"+houseType+"' class='active' haschild='true' previd='' islastone='true' depth='2'>\
				<td>&nbsp;</td>\
				<td><input type='checkbox' name='buildingBox' value='"+item.building+"'></td>\
				<td>"+item.buildingDisplayName+"</td>\
			</tr>";
		}
	});
	return html;
}
