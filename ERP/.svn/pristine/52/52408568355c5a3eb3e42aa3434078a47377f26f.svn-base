$(function(){	
	//根据选择的项目查看对应的下料单
	$(".purchaseDetail").unbind("focus").bind("focus",function(){
		var url = "/a/datatrack/getPurchaseDetailByBaseBomID";
		getObbDetailByUrl($(this),url);
	});
	
	$(".purchaseDetail").unbind("blur").bind("blur",function(){
		var isOpen = $("#contTable");
		if(isOpen){//判断有下级数据则删除数据并不请求后台
			$("#contTable").remove();
		}
	});
	//生成项目的下级
	function getObbDetailByUrl(thisTagert,url){
		var obbID = $("#orderBomId").val();
		var status = $("#status").val();
		//请求详情数据
		var d = {obbID:obbID,status:status};
		startUp.postData(url,d,function(data){
			var html="";
			var obbDetail =$("#baseBomdiv");
				html=commissionerAssignHtml(obbID,data,status);
			
			obbDetail.after(html);
		});
	}
	
	
	//运营主管根据下料单编号获取相应的列表详情数据	commissionerAssign
	function commissionerAssignHtml(obbID,data,isStatus){
		var html="";
		var objs = data.list;
		var mapSC = data.mapSC;
		var mapRC = data.mapRC;
		var mapCG = data.mapCG;
		var mapPC = data.mapPC;
		var mapSF = data.mapSF;
		var mapAssignLog = data.mapAssignLog;
		
		var table = "<table id=\"contTable\" class=\"table table-striped table-bordered table-condensed  table-eidt table-tab\">" +
		"<thead>" +
		"<tr list=\"subList\">" +
		"<th type=\"text\" >材料类型</th>" +
		"<th type=\"text\" >材料名称</th>" +
		"<th type=\"text\" >要求到货时间</th>" +
		"<th type=\"text\" >设计数量</th>" +
		"<th type=\"text\" >运营专员下单数量</th>" +
		"<th type=\"text\" >待运营主管审核数量</th>" +
		"<th type=\"text\" >待采购数量</th>" +
		"<th type=\"text\" >已采购数量</th>" +
		"<th type=\"text\" >已发货数量</th>" +
		"<th type=\"text\" >已收货数量</th>" +
		"<th type=\"text\" >是否完全收货</th>" +
		"</tr>" +
		"<thead>" +
		"<tbody id=\"subProjectList\"  copy=\"false\">";
		
		for(var i=0;i<objs.length;i++){
			var obj=objs[i];
			var flag = (obj.count-mapSC[obj.id])>0;
			var tdInput = "<td><input name='yy"+obj.id+"' id='yy"+obj.id+"' value='"+(obj.count-mapSC[obj.id])+"' type='text' class='input-min'></td>";
			if(isStatus=="40"){
				flag = mapRC[obj.id]>0;
				tdInput="";
			}
			var boxTD = cBoxHtml(flag,"cBox",obj.id);
			var requireDate = requireDateVal(obj);
			var fcount=0;
			var scount=0;
			if(mapSF[obj.id]){
				fcount=mapSF[obj.id].fcount;
				scount=mapSF[obj.id].scount;
			}
			var tr="<tr pid='obb"+obbID+"' class='active' haschild='true' previd='' islastone='true' depth='2'>\
				<td>"+obj.orderBomDetail.materielNo+"</td>\
				<td>"+obj.orderBomDetail.materielName+"</td>\
				<td>"+requireDate+"</td>\
				<td>"+obj.count+"</td>\
				<td>"+mapSC[obj.id]+"</td>\
				<td>"+mapRC[obj.id]+"</td>\
				<td>"+(mapCG[obj.id]-mapPC[obj.id])+"</td>\
				<td>"+mapPC[obj.id]+"</td>\
				<td>"+fcount+"</td>\
				<td>"+scount+"</td>\
				<td>"+(obj.count <= scount?'<span >是</span>':'<span style="color:red">否</span>')+"</td>\
				</tr>";
//			html+=tr;
			html = trHtml(flag,tr,html);
		}
		var tail = "</tbody></table>";;
		return table+html+tail;
	}
	function requireDateVal(obj){	//判断要求到货时间
		var requireDate="";
		if(obj.orderBomBase.uniformMaterielType=="1"){	//挂石材料
			requireDate=obj.sub.pendantExpectDate;
		}else if(obj.orderBomBase.uniformMaterielType=="2"){	//骨架材料
			requireDate=obj.sub.skeletonExpectDate;
		}
		return requireDate;
	}
	//项目下面的详细下料单界面
	function getObbaseHtmlByPro(data,isStatus ){
		var html="";
		var objs = data.list;
		var returnUrl = $("#returnUrl").val();
		var table = "<table id=\"contTable\" class=\"table table-striped table-bordered table-condensed  table-eidt table-tab\">" +
					"<thead>" +
					"<tr list=\"subList\">" +
					"<th type=\"text\" >材料类型</th>" +
					"<th type=\"text\" >材料名称</th>" +
					"<th type=\"text\" >到货时间</th>" +
					"<th type=\"text\" >设计数量</th>" +
					"<th type=\"text\" >运营下单数量</th>" +
					"<th type=\"text\" >可驳回数量</th>" +
					"<th type=\"text\" >运营下单数量</th>" +
					"</tr>" +
					"<thead>" +
					"<tbody id=\"subProjectList\"  copy=\"false\">";
		
		for(var i=0;i<objs.length;i++){
			var obj=objs[i];
			var boxTD = cBoxHtml(obj.status==isStatus,"obbaseBox",obj.orderBomBase.id);
			
			var tr="<tr id='obb"+obj.orderBomBase.id+"'  class='active' haschild='false' islastone='true' depth='2'>\
							<td >\
								<div style='float:left;'>\
									"+boxTD+"\
							        <label class='operation-project'>\
							        		"+obj.orderBomDetail.materielNo+"\
							        </label>\
							    </div>\
							</td>\<td >\
								<div style='float:left;'>\
									"+boxTD+"\
							        <label class='operation-project'>\
							        		"+obj.orderBomDetail.materielName+"\
							        </label>\
							    </div>\
							</td>\<td >\
								<div style='float:left;'>\
									"+boxTD+"\
							        <label class='operation-project'>\
							        		"+obj.orderBomDetail.materielName+"\
							        </label>\
							    </div>\
							</td>\<td >\
								<div style='float:left;'>\
									"+boxTD+"\
							        <label class='operation-project'>\
							        		"+obj.orderBomDetail.materielName+"\
							        </label>\
							    </div>\
							</td>\<td >\
								<div style='float:left;'>\
									"+boxTD+"\
							        <label class='operation-project'>\
							        		"+obj.statusLab+"\
							        </label>\
							    </div>\
							</td>\
					</tr>"
					
			html = trHtml(obj.status==isStatus,tr,html);
		}
		var tail = "</tbody></table>";;
		return table+html+tail;
	}
	
	//true tr加在原有的html前面，反之加在后面
	function trHtml(flag,tr,html){
		if(flag){
			return html=tr+html;
		}else{
			return html+=tr;
		}
	}
	
	//根据状态生成对应的界面显示
	function cBoxHtml(flag,cBoxName,cBoxID){
		var cBoxHtml="";
		return cBoxHtml;
	}
	
	/**
	 * 点击项目,带出人员信息
	 */
	$("#projectList tr td a[flag='projectName']").live("click",function(){
//		debugger;
		var projectId = this.getAttribute("value");
		var url = "/a/project/getProjectById?projectId="+projectId;
		startUp.getData(url,function(data){
			var array="";
			var designers= data.designer
			if(designers){
				var designerss = new Array();
				designerss = designers.split(",")
				
				var designerphones = data.designer_phone?data.designer_phone:"";
				var designerphoness = new Array();
				designerphoness = designerphones.split(",")
							
				for(i=0;i<designerss.length;i++){
					array += designerss[i] + "-" + designerphoness[i]+"<br/>";
				}
			}
			
			var personList = "";
			var personList="<tr class='personListTable'><td style='width:50px;'>项目负责人</td><td style='width:80px;'>"+dealWithUndefined(data.project_manager)+'-'+dealWithUndefined(data.project_manager_phone)+"</td></tr>\
									<tr class='personListTable'><td style='width:50px;'>区域经理</td><td style='width:80px;'>"+dealWithUndefined(data.regional_manager)+'-'+dealWithUndefined(data.regional_manager_phone)+"</td></tr>\
									<tr class='personListTable'><td style='width:50px;'>运营经理</td><td style='width:80px;'>"+dealWithUndefined(data.pc_director)+'-'+dealWithUndefined(data.pc_director_phone)+"</td></tr>\
									<tr class='personListTable'><td style='width:50px;'>运营主管</td><td style='width:80px;'>"+dealWithUndefined(data.coordinator_leader)+'-'+dealWithUndefined(data.coordinator_leader_phone)+"</td></tr>\
									<tr class='personListTable'><td style='width:50px;'>运营专员</td><td style='width:80px;'>"+dealWithUndefined(data.operation_specialist)+'-'+dealWithUndefined(data.operation_specialist_phone)+"</td></tr>\
									<tr class='personListTable'><td style='width:50px;'>甲方项目总经理</td><td style='width:80px;'>"+dealWithUndefined(data.general_manager)+'-'+dealWithUndefined(data.general_manager_phone)+"</td></tr>\
									<tr class='personListTable'><td style='width:50px;'>甲方项目区域总经理</td><td style='width:80px;'>"+dealWithUndefined(data.regional_manager)+'-'+dealWithUndefined(data.regional_manager_phone)+"</td></tr>\
									<tr class='personListTable'><td style='width:50px;'>甲方现场跟进人</td><td style='width:80px;'>"+dealWithUndefined(data.local_manager)+'-'+dealWithUndefined(data.local_manager_phone)+"</td></tr>\
									<tr class='personListTable'><td style='width:50px;'>材料员</td><td style='width:80px;'>"+dealWithUndefined(data.material_staff)+'-'+dealWithUndefined(data.material_staff_phone)+"</td></tr>\
									<tr class='personListTable'><td style='width:50px;'>施工员</td><td style='width:80px;'>"+dealWithUndefined(data.construct_staff)+'-'+dealWithUndefined(data.construct_staff_phone)+"</td></tr>\
									<tr class='personListTable'><td style='width:50px;'>成本负责人</td><td style='width:80px;'>"+dealWithUndefined(data.cost_manager)+'-'+dealWithUndefined(data.cost_manager_phone)+"</td></tr>\
									<tr class='personListTable'><td style='width:50px;'>成本组长</td><td style='width:80px;'>"+dealWithUndefined(data.cost_officer)+'-'+dealWithUndefined(data.cost_officer_phone)+"</td></tr>\
									<tr class='personListTable'><td style='width:50px;'>成本主管</td><td style='width:80px;'>"+dealWithUndefined(data.cost_leader)+'-'+dealWithUndefined(data.cost_leader_phone)+"</td></tr>\
									<tr class='personListTable'><td style='width:50px;'>设计师</td><td style='width:80px;'>"+array+"</td></tr>\
									<tr class='personListTable'><td style='width:50px;'>设计主管</td><td style='width:80px;'>"+dealWithUndefined(data.design_leader_info)+"</td></tr>";
			$("#personList").html("");
			$("#personList").html(personList);
		});
	});
	/**
	 * 点击添加项目
	 */
	$("#addProject").on("click",function(){
		 window.location.href=startUp.getRootPath()+"/a/project/form";
	});
	
	/**
	 * 点击添加项目
	 */
	$("#listProject").on("click",function(){
		 window.location.href=startUp.getRootPath()+"/a/project/list";
	});
	
	$("#editBtn").on("click",function(){
		//锁屏验证提交表单
		submitWValidLoading($("#inputForm"));
	});
	
	
	/**
	 * 省市区级联
	 */
	$("#province").on("select2-opening",function(){
		provinceCitytown("cc508e3293504948ab98d499c8e4d488a896","province");
	});
	
	/**
	 * 市区级联
	 */
	$("#city").on("select2-opening",function(){
		var parentId =  $("#province").val();
		provinceCitytown(parentId,"city");
	});
	
	/**
	 * 市区级联
	 */
	$("#town").on("select2-opening",function(){
		var parentId =  $("#city").val();
		provinceCitytown(parentId,"town");
	});
	
	/**
	 * 调用省市区服务
	 */
	function provinceCitytown(parentId,type){
		var url ="/a/project/queryarea?id="+parentId;
		if(parentId){
			startUp.getAsyncData(url,function(data){
				var town =$("#"+type);
				town.text("");
				town.append("<option value='-1'>===请选择===</option>");
				$.each(data, function(idx,item){
					var option ="<option value='"+item.provinceid+"'>"+item.provincename+"</option>";
					town.append(option);
				});
			});
		}
	}
	
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
				str.append("<option value=''>请选择</option>");
				$.each(data, function(idx,item){
					var option ="<option value='"+item.value+"'>"+item.label+"</option>";
					str.append(option);
				});	
			});
		}
	});
	
	$(document).ready(function() {
		var province =$("#province").val();
		var city =$("#city").val();
		var town =$("#town").val();
		if(province ){
			provinceCitytown("cc508e3293504948ab98d499c8e4d488a896","province");
			provinceCitytown(province,"city");
			provinceCitytown(city,"town");
			$("#province").select2("val", province);
			$("#city").select2("val", city);
			$("#town").select2("val", town);
		}
		
	});
	
	/**
	 * 绑定下拉框
	 */
	$(".div_right ul li label>select").on("click",function(){
		var type = this.value;
		var phone = this.getAttribute("phone");
		if(type){
			var array = type.split(",");
			//$("#"+this.id).val(array[0]);
			$("#"+phone).val(array[1]);
		}
	});
	
	/**
	 * 提交
	 */
	$("#submitProject").on("click",function(){
		var falg = $("input[name='chkproject']").is(':checked');
		var lists =$("input[name='chkproject']:checked");
		var ids="";
		if(!falg){
			window.alertx("请选择需要填写的项目!");
			return;
		}
		$.each(lists, function(idx,item){
			ids =ids+item.id+",";
		});
		if(ids){
			ids=ids.substring(0,ids.lastIndexOf(","));
			$("#projectId").val(ids);
		}
		$("#addprojectForm").submit();
	});
	
	/**
	 * 查找复选框
	 */
	var table_obj= function(This){
		 var table;
		  if($(This).attr("target")!==undefined){
			   table="#"+$(This).attr("target");
		   }else{
			   table=".table-eidt"; 
		   }
		  return table;
	 };
	
	/**
	 * 删除Tab
	 */
	$("#tr_project_del,.tr_project_del").bind("click",function(){
		var table=table_obj(this);
		var ids="";
		var checkTr =$(table+" tbody tr td").find("input[type=checkbox]:checked");
		if(checkTr.length>0){
			checkTr.each(function(idx,item){
				ids =ids+item.id+",";
				$(this).parents("tr").remove();
			})
			if(ids){
				ids=ids.substring(0,ids.lastIndexOf(","));
				$("#delId").val(ids);
			}
		}else{
			window.alertx("选择需要删除的行!");
		}
   })
	
   /**
	 * 删除项目
	 */
	$("#deleteProject").live("click",function(){
		var falg = $("input[name='chkproject']").is(':checked');
		var ids ="";
		if(falg){
			window.confirmx('确认要删除该项目吗？',function(){
				var lists =$("input[name='chkproject']:checked");
				$.each(lists, function(idx,item){
					ids =ids+item.id+",";
				});
				if(ids){
					ids=ids.substring(0,ids.lastIndexOf(","));
					var url="/a/project/delete";
					window.location.href=startUp.getRootPath()+url+"?projectId="+ids;
				}
			});
		}else{
			window.alertx("请选择需要删除的项目!");
		}
	});
	
	/**
	 * 点击查询二级项目信息列表
	 */
	$("#querySubProjectList").live("click",function(){
		debugger;
		var projectId=this.getAttribute("thisTagertId");
		var isOpen = $("#project"+projectId).siblings("tr[pid=project"+projectId+"]");
		if(isOpen.length>0){
			//判断有下级数据则删除数据并不请求后台
			isOpen.remove();
			return;
		}
		if(!projectId){
			projectId=$("#querySubProjectList")[0].getAttribute("thisTagertId");
		}
		var url ="/a/project/getSubProjectById?projectId="+projectId;
		startUp.getData(url,function(data){
			 var projectlist =$("#project"+projectId);
			 $("#project"+projectId).siblings("[pid=project"+projectId+"]").remove();
			 $.each(data, function(idx,item){
				 debugger;
				 var showStatus=item.showStatus;
				 var showdesigner=item.showdesigner;
				 var showdesignLeader=item.showdesignLeader;
				 var designerMobile=item.designerMobile;
				 if(!showStatus){
					 showStatus = "";
				 }
				 if(!showdesigner){
					 showdesigner = "";			 
				 }
				 if(!showdesignLeader){
					 showdesignLeader="";
				 }
				 if(!designerMobile){
					 designerMobile = "";
				 }
				 var tr ="<tr pid='project"+projectId+"' id='"+item.id+"' class='active' haschild='true' previd='' islastone='true' depth='2'>"+
				 		 "<td class='td_fr'>└<input type='checkbox' name='checkdbox' id='"+item.id+"'></td>"+
	                     "<td>"+item.houseType+"</td>"+
	                     "<td>"+item.building+"</td>"+
			             "<td >"+showStatus+"</td>"+
			             "<td >"+showdesignLeader+"</td>"+
			             "<td >"+showdesigner+"</td>"+
			             "<td >"+designerMobile+"</td>"+
			             "</tr>";
				 projectlist.after(tr);
			 });
		});
	});
	
	
	/**
	 * 启动流程
	 */
	$("#startWorkflow").on("click",function(){
		var projectId = $("#projectId").val();
		var url ="/a/project/startworkflow?projectId="+projectId;
		startUp.getData(url,function(data){
			window.alertx("提交项目成功！");
			window.location.href=startUp.getRootPath()+"/a/project/list";
		});
	});
	
	/**
	 * 点击查看流程图
	 */
	$("#showWorkflowImg").on("click",function(){
		var wfId = $("#workflowid").val();
		var wfStatus =$("#workflowstatus").val();
		if(parseInt(wfStatus)==4){
			showTraceDiagramInHistory(wfId);
		}else{
			showTraceDiagramInRuntime(wfId);
		}	
	});
	
	/**
	 * 审核通过
	 */
	$("#okWorkflow").on("click",function(){
		var wfId = $("#workflowid").val();
		var wfStatus =$("#workflowstatus").val();
		var url = "/a/act/access/task/direct/complete";
		var json ='{"processInstanceId":"'+wfId+'","approval":"1","rejectBackReason":""}';
		startUp.postActData(url,json,"application/json",function(data){
			window.alertx("审核成功！");
			window.location.href=startUp.getRootPath()+"/a/project/list";
		});
	});
	
	/**
	 * 审核驳回
	 */
	$("#retrunWorkflow").on("click",function(){
		var wfId = $("#workflowid").val();
		var wfStatus =$("#workflowstatus").val();
		var html = "<div style='padding:10px;'>输入点什么：<input type='text' id='some' name='some' /></div>";
		var submit = function(v, h, f) {
		    if(f.some == ""){
		        top.$.jBox.tip("请输入点什么。", "error", { focusId: "some" }); // 关闭设置 some 为焦点
		        return false;	//标识窗口不被关闭
		    }
		    var wfId = $("#workflowid").val();
			var url = "/a/act/access/task/direct/complete";
			var json ='{"processInstanceId":"'+wfId+'","approval":"0","rejectBackReason":""}';
			startUp.postActData(url,json,"application/json",function(data){
				window.alertx("驳回成功！");
				window.location.href=startUp.getRootPath()+"/a/project/list";
			});
		    return true;//标识窗口关闭
		};
		top.$.jBox(html, { title: "输入", submit: submit });
	});
	
	
	/**
	 * 点击签收
	 */
	$("#signWorkflow").on("click",function(){
		var wfId = $("#workflowid").val();
		var url = "/a/act/access/task/direct/claim/"+wfId;
		startUp.getData(url,function(data){
			$("#signWorkflow").attr("disabled","disabled");
			$("#okWorkflow").removeAttr("disabled");
			$("#retrunWorkflow").removeAttr("disabled");
		});
	});
	
	$("#statusFlag").live("change",function(){
		debugger;
		$("#searchForm").submit();
	});
	
	$(document).ready(function() {
		var wfId = $("#workflowid").val();
		var wfStatus =$("#workflowstatus").val();
		if(wfId && wfStatus){
			$(".startWorkflow").css("display","none");
			$("#showWorkflowImg").removeAttr("disabled");
			$("#editBtn").attr("disabled","disabled");
			if(wfStatus=="1" || wfStatus=="2"){

				var url = "/a/act/access/task/direct/isCandidateUser/"+wfId;
				startUp.postData(url,{},function(data){
					if(!data){
						$("#signWorkflow").attr("disabled","disabled");
						var url = "/a/act/access/task/direct/isAssigneeUser/"+wfId;
						startUp.getData(url,function(data){

							if(!data){
								$("#okWorkflow").attr("disabled", "disabled");
								$("#retrunWorkflow").attr("disabled", "disabled");
							}else{
								$("#editBtn").attr("disabled","disabled");
								var url = "/a/act/access/task/direct/getTaskForm/"+wfId;
								$.ajax({
									url : startUp.getRootPath()+url,
									type : "GET",
									success : function(data) {
										if(data){
											$("#editBtn").removeAttr("disabled");
											$("#okWorkflow").removeAttr("disabled");
											$("#retrunWorkflow").attr("disabled", "disabled");
										}else{
											$("#okWorkflow").removeAttr("disabled");
											$("#retrunWorkflow").removeAttr("disabled");
										}
									}
								});
							}
						});

					}else{
						$("#signWorkflow").removeAttr("disabled");
						$("#okWorkflow").attr("disabled", "disabled");
						$("#retrunWorkflow").attr("disabled", "disabled");
					}
				});

			}
		}else{		
			//如果流程没有启动，则显示 返回、保存、提交按钮
			$("#signWorkflow").attr("disabled","disabled");
			$("#showWorkflowImg").attr("disabled","disabled");
			$(".startWorkflow").css("display","none");
			var flag =$("#flag").val();
			if(flag=="view"){
				$(".startWorkflow").css("display","block");
			}
			$("#okWorkflow").attr("disabled","disabled");
			$("#retrunWorkflow").attr("disabled","disabled");
		}

		if(wfId && wfStatus=="4"){
			$("#signWorkflow").attr("disabled","disabled");
			$("#editBtn").attr("disabled","disabled");
			$("#okWorkflow").attr("disabled","disabled");
			$("#retrunWorkflow").attr("disabled","disabled");
			$(".startWorkflow").css("display","none");
		}
	});
});
