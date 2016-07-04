$(function(){
	function queryList(projectId){
		if(!projectId){
			projectId=$("#queryAccidentList")[0].getAttribute("thisTagertId");
		}
		var url="/a/accident/listdetail?projectId="+projectId;
		startUp.getData(url,function(data){
			 var projectlist =$("#project"+projectId);
			  $("#project"+projectId).siblings("[pid=project"+projectId+"]").remove();
			  $.each(data, function(idx,item){
				  var status = item.status==0?"待处理":"已处理";
				  var tr ="<tr pid='project"+projectId+"' class='active' haschild='true' previd='' islastone='true' depth='2'>"+
				 		 "<td class='td_fr'>└<input type='checkbox'></td>"+
	                     "<td class='operation-project accident-td' showWidth='800px' thisTagert='appoint-saider' id='scheduleDetail' thisTagertId='"+item.id+"'><a href='javascript:void(0)'>"+item.problemComment+"</a></td>"+
	                     "<td>"+item.problemType+"</td>"+
			             "<td>"+item.punishPrice+"</td>"+
			             "<td>"+item.supplyPrice+"</td>"+
			             "<td>"+fomatDate(item.createDate)+"</td>"+
			             "<td>"+status+"</td>"+
			             "</tr>";
				  projectlist.after(tr);
			  });
		});
	}

	/**
	 * 根据项目ID查询事故问题
	 */
	$("#queryAccidentList").live("click",function(){
		var projectId=this.getAttribute("thisTagertId");
		if(this.className.indexOf("glyphicon-triangle-right") !=-1){
			return;
		}
		queryList(projectId);
	});
	
	/**
	 * 根据项目ID查询事故问题
	 */
	$("#scheduleDetail").live("click",function(){
		var accidentId=this.getAttribute("thisTagertId");
		$("#accidentId").val(accidentId);
		var url="/a/accident/queryaccidentdetail?accidentId="+accidentId;
		startUp.getData(url,function(data){
			$("#projectId").select2("val",data.projectId); //项目名称
			$("#problemType").select2("val",data.problemType); //事故类型
			$("#problemComment").val(data.problemComment); //事故描述
			if(data.isSupply==1){
				$("input[name='isSupply']").attr("checked", true);
			}else{
				$("input[name='isSupply']").attr("checked", false);
			}
			if(data.isPunish==1){
				$("input[name='isPunish']").attr("checked", true);
			}else{
				$("input[name='isPunish']").attr("checked", false);
			}
			$("#punishPrice").val(data.punishPrice); //罚款金额
			$("#supplyPrice").val(data.supplyPrice); //补料金额
			$("#punishManagerBid").val(data.punishManagerBid); //处罚人
			selectRadio("isInfluenct",data.isInfluenct);//是否影响施工
			selectRadio("companyType",data.companyType);//所属成员
			selectRadio("status",data.status);//是否生效
		});
	});
	
	/**
	 * 单选按钮回显
	 */
	function selectRadio(type,param){//定义一个函数 
		var name =$("input[name='"+type+"']");
		if(name){
			for(var i=0;i<name.length;i++){ 
				if(name[i].value==param){//得到选中的单选按钮如果要得到值 那么可以：
					name[i].checked=true;
				}else{
					name[i].checked=false;
				}
			} 
		}
	}
	
	queryList();
});
