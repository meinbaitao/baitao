<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>甲方合同管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/activitiHeader.jsp"%>
	<%@ include file="/WEB-INF/views/include/commonScript.jsp"%>
	<script type="text/javascript" src="${ctxStatic}/modules/contract/scripts/jiaContract.js "></script>
	<script type="text/javascript" src="${ctxStatic}/modules/contract/scripts/common_contract.js "></script>
<%-- 	<script type="text/javascript" src="${ctxStatic}/ajaxfileupload/ajaxfileupload.js " ></script>
	<script type="text/javascript"  src="${ctxStatic}/common/common_service.js " ></script> --%>
	<script type="text/javascript">
    	var ctxPath="${ctx}";
    	$(function(){
    		form_validate("inputForm");
    	});
    	function page(n,s){
    		$("#pageNo").val(n);
    		$("#pageSize").val(s);
    		$("#searchForm").submit();
    		return false;
    	}
    </script>
</head>
<body>
	
	<!--上传div -->
		<div id="annexBox" class="hide">
			<form id="uploadAttachForm" action="${ctx}/contract/jiaContract/upload" method="post" enctype="multipart/form-data" style="padding-left:20px;text-align:center;">
				<br/>
				<input id="uploadContractId" name="uploadContractId" type="hidden" value="${jiaContract.id}"/>　
				<ul>
				<li><input id="file" name="file" type="file" class="input-medium"/></li>　　
				<li><input id="uploadAttachment" class="btn btn-primary" type="button" value="   上传   "/></li>
				</ul>
			</form>
		</div>	
		
	<div class="list-content">
		<div class="nav-operate">
			<ul class="operationg-new" >
				<li>
					<input id="btnCancel" class="btn btn-primary" type="button" value="返 回" onclick="history.go(-1)"/>
				</li>
				<shiro:hasAnyRoles name="${fns:getWhitelistsList('jfht')}">
					<li>
						<input type="button" name="editBtn" id="editBtn" class="btn btn-primary" value="保存"/>
					</li>
					<li class="startWorkflow">
						<input type="button" name="startWorkflow" id="startWorkflow" class="btn btn-primary" value="提交"/>
					</li>
					<!-- <li>
						<input  type="button" name="btnUpload" id="btnUpload" class="btn btn-primary" value="附件"/>
					</li> -->
				</shiro:hasAnyRoles>
				<li class="signWorkflow">
					<input type="button" name="signWorkflow" id="signWorkflow" class="btn btn-primary" value="签收"/>
				</li>
				<li class="okWorkflow">
					<input type="button" name="okWorkflow" id="okWorkflow" class="btn btn-primary" value="通过"/>
				</li>
				<li class="retrunWorkflow">
					<input type="button" name="retrunWorkflow" id="retrunWorkflow" class="btn btn-primary" value="驳回"/>
				</li>
				<li class="showWorkflowImg">
					<input type="button" name="showWorkflowImg" id="showWorkflowImg" class="btn btn-primary" value="流程图"/>
				</li>
				<li class="showWorkflowAuditHistory">
					<input type="button" name="showWorkflowAuditHistory" id="showWorkflowAuditHistory" class="btn btn-primary" value="流程轨迹"/>
				</li>
				<li id="showAttach">
					<c:forEach items="${attachList}" var="obj">
					<div>
						<a id="${obj.id}" href="${ctx}${obj.attachUrl}/download?id=${obj.id}">${obj.name} </a>&nbsp;&nbsp;<span id="deleteAttach" deleteId="${obj.id }"  class="glyphicon glyphicon-remove-circle"></span></div>
					</c:forEach>
				</li>
	   		 </ul>
		</div>
		
		<div class="form-content">
			<div id="hiddenContainer">
				<input type="hidden" id="submitUrl" value="/a/contract/jiaContract/startworkflow" />
				<input type="hidden" id="successUrl" value="/a/contract/jiaContract/list" />
			</div>
		<sys:message content="${message}"/>
		<form:form id="inputForm" modelAttribute="jiaContract" action="${ctx}/contract/jiaContract/save" method="post" class="form-horizontal">
			<input type="hidden" id="bindingId" name="id" value="${jiaContract.id }"/>
			<input type="hidden" id="workflowid" name="workflowid" value="${jiaContract.workflowid }"/>
			<input type="hidden" id="workflowstatus" name="workflowstatus" value="${jiaContract.workflowstatus }"/>
			<input type="hidden" name="flag" id="flag" value="${flag}"/>
			<ul>
			<li>
				<span class="tab-name">项目名称：</span>
				<label>
					<form:select id="projectId" path="projectId" class="input-medium required">
						<form:option value="" label="请选择"/>
						<form:options items="${projectList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
					</form:select>
					<span class="help-inline"><font color="red">*</font> </span>
				</label>
			</li>
			<%-- <li>
				<span class="tab-name">楼栋：</span>
				<label>
					<select id="buildings" name="buildings" class="input-medium required">
						<option value="${jiaContract.buildings}">${jiaContract.buildings}</optiAaon>
					</select>
					<span class="help-inline"><font color="red">*</font> </span>
				</label>
			</li> --%>
			<li>
				<span class="tab-name">合同编号：</span>
				<label>
					<form:input id="cid"  path="cid" maxlength="200" htmlEscape="false" class="input-medium required"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</label>
			</li>
			<li>
				<span class="tab-name">合同名称：</span>
				<label>
					<form:input path="name" value="" htmlEscape="false" maxlength="100" class="input-medium required"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</label>
			</li>
	<%-- 		<li>
				<span class="tab-name">合同状态：</span>
				<label>
					<form:input path="status" htmlEscape="false" maxlength="10" class="input-medium "/>
				</label>
			</li> --%>
			<li>
				<span class="tab-name">预算面积(m²)：</span>
				<label>
					<input type="text" id="estimatedarea" name="estimatedarea" class="input-medium number" 
						value="${jiaContract.estimatedarea }" placeholder=""/>
				</label>
			</li>
			<li>
				<span class="tab-name">石材总面积(m²)：</span>
				<label>
					<input type="text" id="areaofstone" name="areaofstone" class="input-medium number" 
						value="${jiaContract.areaofstone }" placeholder=""/>
				</label>
			</li>
 			<li>
				<span class="tab-name">估算造价(元)：</span>
				<label>
					<input type="text" id="estimatedcost" name="estimatedcost" class="input-medium number" 
						value="${jiaContract.estimatedcost }" />
				</label>
			</li>
			<li>
				<span class="tab-name">合同造价(元)：</span>
				<label>
					<input type="text" id="cost" name="cost" class="input-medium number" 
						value="${jiaContract.cost }" placeholder=""/>
				</label>
			</li>
			<li>
				<span class="tab-name">预付款比例(%)：</span>
				<label>
					<form:input path="prepayratio" htmlEscape="false" class="input-medium "/>
				</label>
			</li>
			<li>
				<span class="tab-name">质保金比例(%)：</span>
				<label>
					<form:input path="qualityratio" htmlEscape="false" class="input-medium "/>
				</label>
			</li>
			<li>
				<span class="tab-name">挂靠费比例(%)：</span>
				<label>
					<form:input path="attachfeeratio" htmlEscape="false" class="input-medium "/>
				</label>
			</li>
			<li>
				<span class="tab-name">当地综合税率(%)：</span>
				<label>
					<form:input path="taxratio" htmlEscape="false" class="input-medium "/>
				</label>
			</li>
			<li>
				<span class="tab-name">签约对方：</span>
				<label>
					<form:input path="signedcounterparty" htmlEscape="false" maxlength="100" class="input-medium "/>
				</label>
			</li>
			<li>
				<span class="tab-name">施工/外包单位：</span>
				<label>
					<form:input path="operationunit" htmlEscape="false" maxlength="100" class="input-medium "/>
				</label>
			</li>
			<li>
				<span class="tab-name">挂靠单位：</span>
				<label>
					<form:input path="attachunit" htmlEscape="false" maxlength="200" class="input-medium "/>
				</label>
			</li>
			<li>
				<span class="tab-name">签约日期：</span>
				<label>
					<input name="signeddate" id="signeddate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
						value="${jiaContract.signeddate }"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				</label>
			</li>
			<li>
				<span class="tab-name">竣工验收日期：</span>
				<label>
					<input name="completiondate" id="completiondate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
						value="${jiaContract.completiondate }"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				</label>
			</li>
			<li>
				<span class="tab-name">收款条款比例(%)：</span>
				<label>
					<input type="text" id="paycollectionratio" name="paycollectionratio"  value="${jiaContract.paycollectionratio }" 
						placeholder="输入可添加新选项" class="select2-offscreen input-medium">
				</label>
			</li>
			<li class="autoHeight">
				<span class="tab-name">备注信息：</span>
				<label>
					<form:textarea path="remarks" htmlEscape="false" maxlength="255" class="input-xmedium "/>
				</label>
			</li>
			
			
<%-- 			<li class="tips"></li>
			
			<li>
				<span class="tab-name">印花税申购：</span>
				<label>
					<form:radiobuttons id="stamptaxapplied" path="stamptaxapplied" items="${fns:getDictList('yes_no')}" 
					itemLabel="label" itemValue="value" htmlEscape="false" />
					<form:input path="stamptaxapplied" htmlEscape="false" maxlength="50" class="input-medium "/>
				</label>
			</li>
			<li>
				<span class="tab-name">外经证办理：</span>
				<label>
					<input type="button" value="确定"/>
					<form:input path="certapplied" htmlEscape="false" maxlength="50" class="input-medium "/>
				</label>
			</li>
			<li>
				<span class="tab-name">结算面积(m²)：</span>
				<label>
					<input type="text" id="settlearea" name="settlearea" class="input-medium number" 
						value="${jiaContract.settlearea }" placeholder=""/>
				</label>
			</li>
			<li>
				<span class="tab-name">结算金额(元)：</span>
				<label>
					<input type="text" id="settleamount" name="settleamount" class="input-medium number" 
						value="${jiaContract.cost }" placeholder=""/>
				</label>
			</li>
			<li>
				<span class="tab-name">结算日期：</span>
				<label>
					<input  name="settledate" id="settledate" type="text" readonly="readonly"  class="input-medium Wdate "
						value="${jiaContract.settledate }"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				</label>
			</li>
			<li>
				<span class="tab-name">外经证到期：</span>
				<label>
					<input name="certexpirydate" id="certexpirydate" type="text" readonly="readonly" 
						 value="${jiaContract.certexpirydate }" class="input-medium Wdate "
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />
				</label>
			</li> --%>
			
			
			</ul>
			   <div class="nav-operate" >
			<ul class="operationg-new  operationg-attach" >
				<li id="tr_add"><span class="glyphicon glyphicon-plus"></span>添加</li>
				<li id="tr_detail_del"><span class="glyphicon glyphicon-remove"></span>删除</li>
		    </ul>
	   </div>
	   <div class="table_scroll">
       	<table id="contentTable" class="table table-striped table-bordered table-condensed table-eidt">
			<thead>
				<tr list="detailList">
				    <th class="all-check"  >
						<input type="checkbox" id="all-check">
						<label for="all-check">选择</label>
				    </th>								
					<th type="select" class="input-medium required" id="subprojectId" name="subprojectId">楼栋号</th>
					<th type="text" readonly="readonly" onclick="timeinput()" class="input-medium Wdate" name="startDate" id="startDate">开工日期</th>
					<th type="text" readonly="readonly" onclick="timeinput()" class="input-medium Wdate" name="endDate" id="endDate">竣工日期</th>					
					<th type="text" class=" input-medium required" id="costPrice" name="costPrice">合同价</th>
					<!-- <th type="text" class=" input130" id="remark" name="remark">备注</th> -->
				</tr>
			</thead>
			<tbody id="manufList" copy="false">
				<input type="hidden" name="delId" id="delId" value=""/>
				<c:forEach items="${jiaContract.detailList}" var="detail" varStatus="idx">
 					<tr list="detailList" index="${idx.index }">
						<td class="check">
							<input type="checkbox" id="detailList[${idx.index}].id" name="detailList[${idx.index}].id" value="${detail.id}">
							<input type="hidden"  class="hide" name="detailList[${idx.index}].id" 
								id="detailList[${idx.index}].id" value="${detail.id}"/>
						</td>
						<td>
							<select type="select" class="input-medium" name="detailList[${idx.index}].subprojectId" 
								id="detailList[${idx.index}].subprojectId"  value="${detail.subprojectId}">
								<option value="${detail.subprojectId}">${detail.buildingDisplayName}</option>
								</select></td>
						<td>
							<input type="text" readonly="readonly" onclick="timeinput()" class="input-medium Wdate"
								 name="detailList[${idx.index}].startDate"
								 id="detailList[${idx.index}].startDate" value="${detail.startDate}"/></td>
						<td>
							<input type="text" readonly="readonly" onclick="timeinput()" class="input-medium Wdate"
								 name="detailList[${idx.index}].endDate"
								 id="detailList[${idx.index}].endDate" value="${detail.endDate}"/></td>
						<td>
							<input type="text" class="input-medium" name="detailList[${idx.index}].costPrice" 
								id="detailList[${idx.index}].costPrice"  value="${detail.costPrice}"/></td>
						
					<%-- 	<td>
							<input type="text" class="number required input130" name="detailList[${idx.index}].remark" 
								id="detailList[${idx.index}].remark" value="${detail.remark}"/></td> --%>
					 </tr>
		 		</c:forEach>
			</tbody>
		</table>
		</div>
		</form:form>
	</div>
</div>
</body>
</html>