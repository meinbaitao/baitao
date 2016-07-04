<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>劳务评审管理</title>
<meta name="decorator" content="default" />
<%@include file="/WEB-INF/views/include/activitiHeader.jsp"%>
<script src="${ctxStatic}/jquery/jquery.json.js" type="text/javascript"></script>
<script src="${ctxStatic}/common/common_service.js "
	type="text/javascript"></script>
<script
	src="${ctxStatic}/common/activiti/flowCommonController.js?tsf=${jsVersion}"
	type="text/javascript"></script>
<script
	src="${ctxStatic}/modules/contract/scripts/laborVerify.js?tsf=${jsVersion}"
	type="text/javascript"></script>
<script
	src="${ctxStatic}/modules/contract/scripts/common_contract_laborspacial.js?tsf=${jsVersion}"
	type="text/javascript"></script>
<script src="${ctxStatic}/ajaxfileupload/ajaxfileupload.js "
	type="text/javascript"></script>
<script>
	var ctxPath = "${ctx}";
	$(function() {
		form_validate("inputForm");
		/* changeProjectId(); */
	});
	function page(n, s) {
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
		return false;
	}
	function getDuration(object){
		var enddate = object.parentElement.previousElementSibling;
		var startdate = enddate.previousElementSibling;
		var endvalue = enddate.firstElementChild.value;
		var startvalue = startdate.firstElementChild.value;
		
		var duration = Number(Math.floor((new Date(endvalue).getTime()-new Date(startvalue).getTime())/(24*3600*1000)))+1;
		if(duration > 0){
			$(object).val(duration);
		}
	}
	
	//变更
	function changeCon(){
		$("#editBtn").removeAttr("disabled");
		$(".okWorkflow").hide();
		$(".startWorkflow").show();
		$("#workflowid").val("");
		$("#workflowstatus").val("0");
	}
</script>
</head>
<body>
	<div class="list-content">

		<!--上传div  -->
		<div id="annexBox" class="hide">
			<form id="uploadAttachForm"
				action="${ctx}/contract/laborcontract/upload" method="post"
				enctype="multipart/form-data" class="form-search"
				style="padding-left: 20px; text-align: center;">
				<br /> <input id="uploadContractId" name="uploadContractId"
					type="hidden" value="${laborcontract.id}" /> <input id="file"
					name="file" type="file" style="width: 330px" /><br />
				<br /> <input id="uploadAttachment" class="btn btn-primary"
					type="button" value="   上传   " />
			</form>
		</div>

		<!-- 导入div -->
		<div id="importBox" class="hide">
			<form id="importForm" action="${ctx}/contract/laborcontract/import"
				method="post" enctype="multipart/form-data" class="form-search"
				style="padding-left: 20px; text-align: center;">
				<br /> <input id="importFile" name="importFile" type="file"
					style="width: 330px" /><br />
				<br /> <input id="btnImportSubmit" class="btn btn-primary"
					type="button" value="   导    入   " />
			</form>
		</div>

		<div class="nav-operate">
			<ul class="operationg-new">
				<li><input id="btnCancel" class="btn btn-primary" type="button"
					value="返 回" onclick="javascript:window.location.href=startUp.getRootPath()+'/a/contract/laborcontract/listVerify'" /></li>
				<shiro:hasAnyRoles name="${fns:getWhitelistsList('lwpsgl')}">
					<li><input type="button" name="editBtn" id="editBtn"
						class="btn btn-primary" value="保存" /></li>
					<!-- <li><input type="button" name="btnUpload" id="btnUpload"
					class="btn btn-primary" value="附件" /></li> -->
					<%--<li><a href="${ctx}/contract/laborcontract/import/template" class="btn btn-primary">下载明细模板</a>
						</li>
						<li>
							<input type="button" name="btnImport" id="btnImport" class="btn btn-primary" value="导入合同明细"/>
						</li> --%>
					<li class="startWorkflow"><input type="button"
						name="startWorkflow" id="startWorkflow" class="btn btn-primary"
						value="提交" /></li>
				</shiro:hasAnyRoles>
				<li class="signWorkflow"><input type="button"
					name="signWorkflow" id="signWorkflow" class="btn btn-primary"
					value="签收" /></li>
				<li class="okWorkflow"><input type="button" name="okWorkflow"
					id="okWorkflow" class="btn btn-primary" value="通过" /></li>
				<li class="retrunWorkflow"><input type="button"
					name="retrunWorkflow" id="retrunWorkflow" class="btn btn-primary"
					value="驳回" /></li>
				<li class="showWorkflowImg"><input type="button"
					name="showWorkflowImg" id="showWorkflowImg" class="btn btn-primary"
					value="流程图" /></li>

				<li class="showWorkflowAuditHistory"><input type="button"
					name="showWorkflowAuditHistory" id="showWorkflowAuditHistory"
					class="btn btn-primary" value="流程轨迹" /></li>
				
				<shiro:hasAnyRoles name="${fns:getWhitelistsList('lwpsglzzjcqxzz')}">
					<li><input value="中止" onclick="javascript:location='${ctx}/contract/laborcontract/stop?id=${laborcontract.id}'" class="btn btn-primary" type="button" <c:if test="${empty laborcontract.extraData.stop or laborcontract.extraData.stop}">disabled="disabled"</c:if>  /></li>
					<li><input value="解除" onclick="javascript:location='${ctx}/contract/laborcontract/relieve?id=${laborcontract.id}'" class="btn btn-primary" type="button" <c:if test="${empty laborcontract.extraData.relieve or laborcontract.extraData.relieve}">disabled="disabled"</c:if> /></li>
					<li><input value="取消中止" onclick="javascript:location='${ctx}/contract/laborcontract/cancelStop?id=${laborcontract.id}'" class="btn btn-primary" type="button" <c:if test="${empty laborcontract.extraData.cancelStop or laborcontract.extraData.cancelStop}">disabled="disabled"</c:if>  /></li>
					<li><input value="变更" onclick="javascript:changeCon();" class="btn btn-primary" type="button" <c:if test="${laborcontract.extraData.relieve or not laborcontract.extraData.cancelStop or laborcontract.workflowstatus ne '4'}">disabled="disabled"</c:if>  /></li>	
				</shiro:hasAnyRoles>
					<c:if test="${isChange}"><li><a class="btn btn-primary" href="${ctx}/contract/laborcontract/bill/list?id=${laborcontract.id}">变更记录</a></li></c:if>
				<%-- <li><a class="btn btn-primary" href="${ctx}/contract/laborcontract/bill/list?id=${laborcontract.id}">变更记录</a></li> --%>
				<li id="showAttach"><c:forEach items="${attachListDemand}"
						var="obj">
						<div>
							<a id="${obj.id}"
								href="${ctx}${obj.attachUrl}/download?id=${obj.id}">${obj.name}
							</a>&nbsp;&nbsp;<span id="deleteAttach" deleteId="${obj.id }"
								class="glyphicon glyphicon-remove-circle"></span>
						</div>
					</c:forEach> <c:forEach items="${attachListVerify}" var="obj">
						<div>
							<a id="${obj.id}"
								href="${ctx}${obj.attachUrl}/download?id=${obj.id}">${obj.name}
							</a>&nbsp;&nbsp;<span id="deleteAttach" deleteId="${obj.id }"
								class="glyphicon glyphicon-remove-circle"></span>
						</div>
					</c:forEach></li>
			</ul>
			<div class="clear"></div>

		</div>
		<div class="form-content">
			<sys:message content="${message}" />
			<form:form id="inputForm" modelAttribute="laborcontract"
				action="${ctx}/contract/laborcontract/saveVerify" method="post"
				class="form-horizontal magbtm0">
				<form:hidden id="contractId" path="id" />
				<form:hidden path="workflowid" id="workflowid" />
				<form:hidden path="workflowstatus" id="workflowstatus" />
				<input type="hidden" name="flag" id="flag" value="${flag}" />
				<form:hidden path="delIds" id="delIds" htmlEscape="false" />
				<form:hidden id="buildings" path="buildings" />
				<form:hidden id="house" path="house" />
				<!-- 隐藏显示名称作为合同编号要使用的 许俊雄 -->
				<form:hidden id="buildingsDisName" path="buildingsDisName" />
				<input type="hidden" id="managementPageUrl"
					value="${ctx}/contract/laborcontract/listVerify" />
				<ul>
					<li class="tips">项目信息</li>
					<li><span class="tab-name">甲方：<font color="red">*</font></span> <label> <form:select
								name="contractJiafang" id="contractJiafang" 
								path="contractJiafang" class="input-medium required">
								<form:option value="" label="" />
								<form:options items="${fns:getDictList('ht_jiafang')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
					</label></li>

					<li><span class="tab-name">项目名称：<font color="red">*</font></span> <label> <select
							id="projectId" name="projectId" path = "projectId" class="input-medium required">
								<option value="">请选择</option>
								<c:forEach items="${projectList}" var="obj">
									<option value="${obj.id}" 
										<c:if test="${obj.id==laborcontract.projectId}">selected="selected"</c:if>>${obj.name}</option>
								</c:forEach>
						</select> <span class="help-inline"><font color="red">*</font> </span>
					</label></li>

					<li><span class="tab-name">项目负责人：<font color="red">*</font></span> <label> <input
							type="text" name="projectmanagerAid" path = "projectmanagerAid" id="projectmanagerAid"
							value="${laborcontract.projectmanagerAid }" maxlength="50"
							class="input-medium required" />
					</label></li>
					<li><span class="tab-name">项目负责人联系方式：<font color="red">*</font></span> <label> <input
							type="text" name="projectmanagerAidtel" path = "projectmanagerAidtel" id="projectmanagerAidtel"
							value="${laborcontract.projectmanagerAidtel }" maxlength="50"
							class="input-medium required" />
					</label></li>
					<li><span class="tab-name">项目地址：<font color="red">*</font></span> <label> <input
							type="text" id="address" path = "address" name="address" maxlength="200"
							class="input-medium required" value="${laborcontract.address }" />
					</label></li>

					<li><span class="tab-name">承接范围：<font color="red">*</font></span> <label> <form:select
								id="exeScope" path="exeScope" class="input-medium required">
								<form:option value="-1">请选择</form:option>
								<form:options items="${fns:getDictList('executionArea')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
					</label></li>

					<li><span class="tab-name">住宿补贴：</span> <label> <form:select
								path="subsidy" class="input-medium required">
								<form:options items="${fns:getDictList('yes_no')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select> <span class="help-inline"><font color="red">*</font> </span>
					</label></li>
					<li class="tips">乙方信息</li>
					<li><span class="tab-name">施工班组：<font color="red">*</font></span> 
					<label style="position: relative;" > 
						<select name="ctypeSel" class="ctype input-medium">
								<option value="${laborcontract.ctype}">${laborcontract.ctype}</option>
						</select> 
				        <input type="text" class="ctype input-medium required" id="ctype" name="ctype" path="ctype" value="${laborcontract.ctype}" style="position: absolute; top: 0;  left: 0; width: 143px;"  />
					</label></li>

					<li><span class="tab-name">驻地管理人：<font color="red">*</font></span> <label> <input
							type="text" name="projectleadBid" path = "projectleadBid" id="projectleadBid"
							value="${laborcontract.projectleadBid}" maxlength="50" class="input-medium required" />
					</label></li>
					<li><span class="tab-name">驻地管理人电话：<font color="red">*</font></span> <label> <input
							type="text" name="projectleadBidtel" path = "projectleadBidtel" id="projectleadBidtel"
							value="${laborcontract.projectleadBidtel}" maxlength="50" class="input-medium required" />
					</label></li>

					<li class="tips">合同一级信息</li>

					<li><span class="tab-name">合同编号：</span> <label> <input readonly="readonly"
							id="contractNo" name="contractNo" path = "contractNo" type="text"
							class="input-medium" value="${laborcontract.contractNo}" />
					</label></li>
				<%-- 	<li><span class="tab-name">合同类型：</span> <label> <select
							name="contractType" class="input-medium required " path="contractType"
							id="contractType">
								<option value="${laborcontract.contractType}">请选择</option>
						</select> <span class="help-inline"><font color="red">*</font> </span>
					</label></li> --%>
					<li><span class="tab-name">标准合同:<font color="red">*</font></span> <label> 
							<form:select
								path="isStandardContract" class="isStandardContractSel input-medium required">
								<form:option value="3">是</form:option>
								<form:option value="4">否</form:option>
							</form:select> <%-- <form:radiobuttons path="isStandardContract" items="${fns:getDictList('yes_no')}" 
								itemLabel="label" itemValue="value" htmlEscape="false" class=""/> --%>
					</label></li>
					<li><span class="tab-name">工程名称：<font color="red">*</font></span> <label> <input readonly="readonly"
							type="text" id="proName" name="proName" path="proName" class="input-medium required"
							value="${laborcontract.proName}" />
					</label></li>
					<li><span class="tab-name">一级类别：<font class="isSCFont" color="red">*</font></span> <label> 
						<select readonly="readonly"
							id="fristType" name="fristType" path="fristType" class="isSC input-medium required" >
								<option value="${laborcontract.fristType}">请选择</option>
						</select> 
					</label></li>
					<li><span class="tab-name">二级类别：<font class="isSCFont" color="red">*</font></span> <label> 
						<select
							id="secondType" name="secondType" path="secondType" class="isSC input-medium required" >
								<option value="${laborcontract.secondType}">请选择</option>
						</select>
					</label></li>

					<li><span class="tab-name">结算方式：<font color="red">*</font></span> <label> <form:select
								path="settlementType" class="input-medium required">
								<form:options items="${fns:getDictList('settlementTypeVerify')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
					</label></li>

					<li><span class="tab-name">签约日期：<font color="red">*</font></span> <label> <input
							id="agreementDate" name="agreementDate"  path="agreementDate" type="text"
							maxlength="20" class="input-medium Wdate required"
							value="${laborcontract.agreementDate }"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />
					</label></li>

					<li><span class="tab-name">工程开工日期：</span> <label> <input
							id="startdate" name="startdate" path="startdate" type="text" maxlength="20"
							class="input-medium Wdate " value="${laborcontract.startdate }" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />
					</label></li>
					<li><span class="tab-name">工程竣工日期：</span> <label> <input
							id="enddate" name="enddate"  path="enddate"  type="text" maxlength="20"
							class="input-medium Wdate " value="${laborcontract.enddate }" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
					</label></li>
					<li><span class="tab-name">合同总工期(天)：</span> <label> <input readonly="readonly"
							type="text" name="duration"  path="duration" id="duration" class="input-medium "
							value="${laborcontract.duration }" />
					</label></li>


					<li class="tips">劳务价款</li>
					<li><span class="tab-name">合同总造价(元)：</span> <label> <input readonly="readonly"
							type="text" id="contractPrice" path="contractPrice" name="contractPrice"  class="input-medium "
							value="${laborcontract.contractPrice }" />
					</label></li>
					<shiro:hasAnyRoles name="${fns:getWhitelistsList('lwzj')}">
						<li><span class="tab-name">标准造价(元)：</span> <label> <input readonly="readonly"
								type="text" id="standardPrice"  path="standardPrice"  name="standardPrice" 
								class="input-medium " value="${laborcontract.standardPrice }" />
						</label></li>
						<li><span class="tab-name">预算总造价(元)：</span> <label> <input readonly="readonly"
								type="text" id="budgetPrice"  path="budgetPrice"  name="budgetPrice" 
								class="input-medium " value="${laborcontract.budgetPrice }" />
						</label></li>
					</shiro:hasAnyRoles>
					<li><span class="tab-name">总体浮动比例(%)：</span> <label> <input readonly="readonly"
							type="text" name="allRatio"  path="allRatio"   id="allRatio" class="input-medium "
							value="${laborcontract.allRatio }" />
					</label></li>
					<li>
					
					<span class="tab-name">合同条款：<font color="red">*</font></span> <label> <select
							id="qualityitem" name="qualityitem"  path="qualityitem"   class="input-medium required">
								<option value="">请选择</option>
								<c:forEach items="${qualitylist}" var="obj">
									<option value="${obj.item}" <c:if test="${obj.item ==laborcontract.qualityitem}">selected="selected"</c:if>>${obj.item}</option>
								</c:forEach>
						</select>
					</label></li>
					<li><span class="tab-name">进度款最高申请<br>支付比例(%)：
					</span> <label> <input type="text"  path="exscheduleRatio"  name="exscheduleRatio"  readonly="readonly"
							id="exscheduleRatio" class="input-medium "
							value="${laborcontract.exscheduleRatio }" />
					</label></li>
					<li><span class="tab-name">结算款最高申请<br>支付比例(%)：
					</span> <label> <input type="text"  path="accountRatio"  name="accountRatio"  readonly="readonly"
							id="accountRatio" class="input-medium "
							value="${laborcontract.accountRatio }" />
					</label></li>
					<li><span class="tab-name">质保金申请比例1：</span> <label> <input
							type="text" name="qualityRatioFrist" path="qualityRatioFrist"   id="qualityRatioFrist"  readonly="readonly"
							class="input-medium " value="${laborcontract.qualityRatioFrist }" />
					</label></li>
					
					<li><span class="tab-name">质保金申请比例2：</span> <label> <input
							type="text" name="qualityRatioSecond" id="qualityRatioSecond" path="qualityRatioSecond"  readonly="readonly"
							class="input-medium " disabled="true"
							value="${laborcontract.qualityRatioSecond }" />
					</label></li>
					<li><span class="tab-name">质保金比例1到期条款：</span> <label>
							<span>甲方合同竣工验收日期+ <input type="text"
								name="qualityPayDateFrist" id="qualityPayDateFrist"  path="qualityPayDateFrist"  readonly="readonly"
								style="width: 25px;"
								value="${laborcontract.qualityPayDateFrist }" />天
						</span>
					</label></li>
					<li><span class="tab-name">质保金比例2到期条款：</span> <label>
							<span>甲方合同竣工验收日期+ <input type="text"
								name="qualityPayDateSecond" id="qualityPayDateSecond"   path="qualityPayDateSecond"  readonly="readonly"
								style="width: 25px;"
								value="${laborcontract.qualityPayDateSecond }" />天
						</span>
					</label></li>

					<li class="tips">相关补充或调整</li>
					<li><span class="tab-name">批量浮动比例(%)：</span> <label> <input
							type="text" name="mfloatratio" id="mfloatratio"  path="mfloatratio"
							class="input-medium " value="${laborcontract.mfloatratio}" />
					</label></li>
					<li><span class="tab-name">甲乙方权利责任的补充调整：</span> <label>
					<form:select path="rightrespadjust" id="rightrespadjust" name="rightrespadjust" class="input-medium required">
								<form:option value="0">无</form:option>
								<form:option value="1">其他</form:option>
					</form:select>
					</label></li>
					<li><span class="tab-name">质量要求的补充调整：</span> <label> <input
							type="text" name="qualityreqadjust" id="qualityreqadjust"  path="qualityreqadjust"
							maxlength="200" class="input-medium "
							value="${laborcontract.qualityreqadjust}" />
					</label></li>
					<li><span class="tab-name">保修要求的补充调整：</span> <label> <input
							type="text" name="warrantyadjust" id="warrantyadjust"  path="warrantyadjust"
							maxlength="200" class="input-medium "
							value="${laborcontract.warrantyadjust}" />
					</label></li>
					<li><span class="tab-name">工程验收、进度请款及结算方式要求的补充调整：</span> <label>
							<input type="text" name="settletermadjust" id="settletermadjust"  path="settletermadjust"
							maxlength="200" class="input-medium "
							value="${laborcontract.settletermadjust}" />
					</label></li>
					<li><span class="tab-name">工程验收请款结算：</span> <label> <input
							type="text" name="settleterm" id="settleterm" maxlength="200"   path="settleterm"
							class="input-medium " value="${laborcontract.settleterm}" />
					</label></li>
					<li><span class="tab-name">备注信息：</span> <label> <form:input
								path="remarks" htmlEscape="false" maxlength="255"
								class="input-medium " />
					</label></li>
					<li class="tips">劳务清单</li>
					<div class="nav-operate">
						<ul class="operationg-new" style="margin-top: 4px !important;">

							<li id="tr_add1" onclick="changeProjectId()"><span
								class="glyphicon glyphicon-plus"></span>添行</li>
							<li id="tr_detail_del"><span
								class="glyphicon glyphicon-remove"></span>删行</li>
						</ul>
					</div>
					<div class="table_scroll" style="margin-bottom: 0px;">
						<shiro:hasAnyRoles name="${fns:getWhitelistsList('lwzj')}">
							<input type="hidden" value="true" id="white">
						</shiro:hasAnyRoles>
						<table id="contentTable"
							class="table table-striped table-bordered table-condensed table-eidt">
							<thead>
								<tr list="detailList">
									<th class="all-check"><input type="checkbox"
										id="all-check"> <label for="all-check">选择</label></th>
									<th type="text" class="input60">户型</th>
									<th type="text" class="input-min">楼栋号</th>
									<th type="text" class="input60">骨架施工面积</th>
									<th type="text" class="input60">石材施工面积</th>
									<th type="text" class="input60">其他施工面积</th>
									<th type="text" class="input80">工程开工日期</th>
									<th type="text" class="input80">工程竣工日期</th>
									<th type="text" class="input-min">工期</th>
									<th type="text" class="input60">是否赶工</th>
									<th type="text" class="input80">劳务清单总价(元)</th>
									<shiro:hasAnyRoles name="${fns:getWhitelistsList('lwzj')}">
										<th type="text" class="input80">标准造价(元)</th>
										<th type="text" class="input80">预算总造价(元)</th>
									</shiro:hasAnyRoles>
									<!-- <th>差异</th>
						<th>劳务清单</th>
						<th>操作</th> -->
								</tr>
								</tr>
							</thead>
							<c:choose>
								<c:when test="${flag eq 'edit' }">
								<tbody id="listSub">
									  <c:forEach var="var" items="${laborcontract.labcontractList}">
											<tr id="${var.id}" class="active">
												<td><input type="checkbox" name="buildingBox" ></td>
												<td><input class="input60" type="text" name="houseType" class="houseType" value="${var.house}"></td>
												<td>
													<input class="input-min" type="text" name="htmlbuildings" onblur='changeForContractNo()' class="htmlbuildings" value="${var.buildingsDisName}">
													<input class="input-min" type="hidden" value="${var.buildings}">
												</td>
												<td><input class="input60" type="text" name="boneArea" value="${var.boneArea }"></td>
												<td><input class="input60" type="text" name="stoneArea" value="${var.stoneArea }"></td>
												<td><input class="input60" type="text" name="otherArea" value="${var.otherArea }"></td>
												<td><input class="input80" type="text" name="substartdate" onblur="onblurSumDuration(this)" class="input-medium Wdate " value="${var.startdate }" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"></td>
												<td><input class="input80" type="text" name="subenddate" onblur="onblurSumDuration(this)" class="input-medium Wdate " value="${var.enddate }" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"></td>
												<td><input class="input-min" type='text' name='subduration' disabled='disabled' onclick='getDuration(this)' value="${var.duration }"></td>
												<td><select class="input60"  name='subisHurry' class="input-medium">
													<option value="0" > 否</option>
													<option value="1" > 是</option>
												</select> </td>
												<td><input class="input80 number" type="text" name="subcontractPrice" onblur='contractPriceClick(this)' value="${var.contractPrice }"></td>
												<shiro:hasAnyRoles name="${fns:getWhitelistsList('lwzj')}">
													<td><input class="input80 number" type="text" name="substandardPrice" onblur='standardPriceClick(this)' value="${var.standardPrice }"></td>
													<td><input class="input80 number" type="text" name="subbudgetPrice" onblur='budgetPriceClick(this)' value="${var.budgetPrice }"></td>
												</shiro:hasAnyRoles>
											</tr>
									   </c:forEach>
								   </tbody>
								</c:when>
								<c:otherwise>
									<tbody id="listSub">

									</tbody>
								</c:otherwise>
							</c:choose>
							</div>
							</form:form>
							</div>


							</div>
<script type="text/javascript">
	$(document).ready(function() {
		changeIsSC();//判断是否为标准合同
	});
	
</script>
</body>
</html>