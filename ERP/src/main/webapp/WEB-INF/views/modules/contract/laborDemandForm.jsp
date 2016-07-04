<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>劳务需求管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/activitiHeader.jsp"%>
	<%@ include file="/WEB-INF/views/include/commonScript.jsp"%>
	<script type="text/javascript" src="${ctxStatic}/modules/contract/scripts/laborDemand.js"></script>
	<script type="text/javascript" src="${ctxStatic}/modules/contract/scripts/common_contract.js"></script>
	<script>
		var ctxPath="${ctx}";
		$(function(){
			form_validate("inputForm");
			changeProjectId();
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

	<!--上传div  -->
<%-- 	<div id="annexBox" class="hide">
		<form id="uploadAttachForm" action="${ctx}/contract/laborDemand/upload" method="post" enctype="multipart/form-data"
			class="form-search" style="padding-left:20px;text-align:center;" ><br/>
				<br/>
				<input id="uploadContractId" name="uploadContractId" type="hidden" value="${laborDemand.id}"/>　
				<ul>
				<li><input id="file" name="file" type="file" class="input-medium"/></li>　　
				<li><input id="uploadAttachment" class="btn btn-primary" type="button" value="   上传   "/></li>
				</ul>
			</form>
	</div>
	 --%>

	<div id="annexBox" class="hide">
<%-- 	<form id="uploadAttachForm" action="${ctx}/contract/laborDemand/upload1" method="post" enctype="multipart/form-data"
		class="form-search" style="padding-left:20px;text-align:center;" ><br/>
			<br/>
			<input id="uploadContractId" name="uploadContractId" type="hidden" value="${laborDemand.id}"/>　
			<ul>
			<li><input id="file" name="file" type="file" class="input-medium"/></li>　　
			<li><input  type="submit" value="提交"/></li>
			</ul>
		</form> --%>
		
	  <form action="${ctx}/contract/laborDemand/upload1" enctype="multipart/form-data" method="post">
	    上传用户：<input type="text" name="username"><br/>
	    上传文件1：<input type="file" name="file1"><br/>
	    上传文件2：<input type="file" name="file2"><br/>
	    <input type="submit" value="提交">
	  </form>
	
	</div>
	
		
<div class="list-content" >
      <div class="nav-operate" >
		<ul class="operationg-new" >
				<li>
					<input id="btnCancel" class="btn btn-primary" type="button" value="返 回" onclick="javascript:window.location.href=startUp.getRootPath()+'/a/contract/laborDemand/list';"/>
				</li>
				<shiro:hasAnyRoles name="${fns:getWhitelistsList('lwxq')}">
					<li>
						<input type="button" name="editBtn" id="editBtn" class="btn btn-primary" value="保存"/>
					</li>
					<li>
						<input type="button" name="btnUpload" id="btnUpload" class="btn btn-primary" value="附件"/>
					</li>
				</shiro:hasAnyRoles>
				<li class="startWorkflow">
					<input type="button" name="startWorkflow" id="startWorkflow" class="btn btn-primary" value="提交"/>
				</li>
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
      
	     <div class="clear"></div>
      </div>
      <div class="form-content">
      <sys:message content="${message}"/>
		<form:form id="inputForm" modelAttribute="laborDemand" 
					action="${ctx}/contract/laborDemand/save" method="post" class="form-horizontal">
			<input type="hidden" id="bindingId" name="id" value="${laborDemand.id }"/>
			<input type="hidden" id="workflowid" name="workflowid" value="${laborDemand.workflowid }"/>
			<input type="hidden" id="workflowstatus" name="workflowstatus" value="${laborDemand.workflowstatus }"/>
			<input type="hidden" name="flag" id="flag" value="${flag}"/>
			<input type="hidden" id="submitUrl" value="/a/contract/laborDemand/startworkflow" />
			<input type="hidden" id="successUrl" value="/a/contract/laborDemand/list" />
			<ul>
			
			<li>
				<span class="tab-name">甲方：</span>
				<label>
					<form:select name="contractJiafang" id="contractJiafang" path="contractJiafang" class="input-medium ">
						<form:option value="" label=""/>
						<form:options items="${fns:getDictList('ht_jiafang')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</label>
			</li>
			
       	    <li>
             <span class="tab-name">项目名称：</span>
             <label>
	             <select id="projectId" name="projectId" class="input-medium" >
	             	<option value="" >请选择</option>
	             	<c:forEach items="${projectList}" var="obj">
						<option value="${obj.id}" <c:if test="${obj.id==laborDemand.projectId}">selected="selected"</c:if>>${obj.name}</option>
					</c:forEach>
	             </select>
             	<span class="help-inline"><font color="red">*</font> </span>
             </label>
         	</li>
         	<li>
				<span class="tab-name">工程名称：</span>
				<label>
					<input type="text" id="proName" name="proName" maxlength="200" class="input-medium "
						value="${laborDemand.proName }"/>
				</label>
			</li>
			<li>
				<span class="tab-name">项目负责人：</span>
				<label>
					<input type="text" name="projectmanagerAid" id="projectmanagerAid" value="${laborDemand.projectmanagerAid }" maxlength="50" class="input-medium " readonly="readonly" />
				</label>
			</li>
			<li>
				<span class="tab-name">项目负责人联系方式：</span>
				<label>
					<input type="text" name="projectmanagerAidtel" id="projectmanagerAidtel" value="${laborDemand.projectmanagerAidtel }" maxlength="50" class="input-medium "/>
				</label>
			</li>
			<%-- <li>
				<span class="tab-name">项目总经理：</span>
				<label>
					<input type="text" name="projectmanagerAid" id="projectmanagerAid" value="${laborDemand.projectmanagerAid }" maxlength="50" class="input-medium " readonly="readonly" />
				</label>
			</li>
			<li>
				<span class="tab-name">项目总经理联系方式：</span>
				<label>
					<input type="text" name="projectmanagerAidtel" id="projectmanagerAidtel" value="${laborDemand.projectmanagerAidtel }" maxlength="50" class="input-medium " readonly="readonly"/>
				</label>
			</li> --%>
			<li>
				<span class="tab-name">项目地址：</span>
				<label>
					<input type="text" id="address" name="address" maxlength="200" class="input-medium "
						value="${laborDemand.address }" readonly="readonly"/>
				</label>
			</li>
			<li>
				<span class="tab-name">承接范围：</span>
				<label>
					<form:select path="contractscopeadjust" class="input-medium ">
						<form:option value="" label=""/>
						<form:options items="${fns:getDictList('executionArea')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</label>
			</li>
			<%-- <li>
				<span class="tab-name">施工合同号：</span>
				<label>
					<select id="laborcontract" name="laborcontract" class="input-medium" >
	             		<option value="" >请选择</option>
	             		<c:forEach items="${jiaContractList}" var="obj">
						<option value="${obj.cid}" <c:if test="${obj.cid==laborDemand.laborcontract}">selected="selected"</c:if>>${obj.cid}</option>
						</c:forEach>
	             	</select>
             </label>
			</li> --%>
			<%-- <li>
				<span class="tab-name">户型：</span>
				<label>
					<select id="house" name="house"  class="input-medium required">
					<c:forEach items="${subProjectList}" var="obj">
						<option value="${obj.houseType}" 
							<c:forEach items="${houseTypeSelected}" var="houseType">
								<c:if test="${obj.houseType ==houseType}">selected="selected"</c:if>
							</c:forEach> 
						>${obj.houseType}</option>
					</c:forEach>
					</select>
					<span class="help-inline"><font color="red">*</font> </span>
				</label>
			</li>
			<li>
				<span class="tab-name">楼栋号：</span>
				<label>
					<select id="buildings" name="buildings" class="input-medium required" >
					<c:forEach items="${subProjectList }" var="obj">
						<option value="${obj.building }" 
						<c:forEach items="${buildingSelected}" var="building">
								<c:if test="${obj.building ==building}">selected="selected"</c:if>
							</c:forEach> 
						>${obj.building }</option>
					</c:forEach>
					</select>
					<span class="help-inline"><font color="red">*</font> </span>
				</label>
			</li> --%>
			<%-- <li>
				<span class="tab-name">需赶工楼栋号：</span>
				<label>
					<select id="hurrybuildings" name="hurrybuildings" class="input-medium" >
					<c:forEach items="${subProjectList }" var="obj">
						<option value="${obj.building }" 
						<c:forEach items="${hurryBuildingSelected}" var="hurryBuilding">
								<c:if test="${obj.building ==hurryBuilding}">selected="selected"</c:if>
							</c:forEach>
						>${obj.building }</option>
					</c:forEach>
					</select>
				</label>
			</li> --%>
			<li>
				<span class="tab-name">是否赶工：</span>
				<label>
					<form:select path="isHurry" class="input-medium required">
						<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>					
             </label>
			</li>
			<li>
				<span class="tab-name">住宿补贴：</span>
				<label>
					<form:select path="subsidy" class="input-medium required">
						<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>					
             </label>
			</li>
			<li>
				<span class="tab-name">合同总工期(天)：</span>
				<label>
					<input type="text" id="duration" name="duration" class="input-medium" readonly="readonly" value="${laborDemand.duration }" />
				</label>
			</li>
			<li>
				<span class="tab-name">工程开工日期：</span>
				<label>
					<input id="startdate" name="startdate" type="text"  maxlength="20" class="input-medium Wdate "
					value="${laborDemand.startdate}" readonly="readonly"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				</label>
			</li>
			<li>
				<span class="tab-name">工程竣工日期：</span>
				<label>
					<input id="enddate" name="enddate" type="text"  maxlength="20" class="input-medium Wdate "
					value="${laborDemand.enddate}" readonly="readonly"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				</label>
			</li>
			<li>
				<span class="tab-name">楼栋号：</span>
				<label>
					<%-- <input type="text" class="input-medium "
						 title="${laborDemand.buildings}" value="${laborDemand.buildings}" readonly="readonly"/> --%>
						 <input type="text" class="input-medium "
						 title="${laborDemand.buildingsName}" value="${laborDemand.buildingsName}" readonly="readonly"/>
				</label>
			</li>
			<li class="tips">乙方信息</li>
            <li>
				<span class="tab-name">施工班组：</span>
             <label>
                 <select  id="ctype" name="ctype" class="input-medium">
                 	<option value="">请选择</option>
                 	<c:forEach items="${cycList}" var="obj">
	                 	<option value="${obj.id}"
	                 	<c:if test="${obj.id ==laborDemand.ctype}">selected="selected"</c:if>
							>${obj.name}</option>
                 	</c:forEach>
                 </select>
				<span class="help-inline"><font color="red">*</font> </span>
             </label>
			</li>
			<li>
				<span class="tab-name">班组简称：</span>
				<label>
					<input type="text" name="partyBCode" id="partyBCode" maxlength="50" value="${laborDemand.partyBCode }" class="input-medium " readonly="readonly"/>
				</label>
			</li>
			<li>
				<span class="tab-name">班组类别：</span>
				<label>
					<input type="text" name="exetype" id="exetype" maxlength="50" value="${laborDemand.exetype }" class="input-medium " readonly="readonly"/>
				</label>
			</li>
   			<li>
				<span class="tab-name">驻地管理人：</span>
				<label>
					<input type="text" name="projectleadBid" id="projectleadBid" maxlength="50" value="${laborDemand.projectleadBid }" class="input-medium " readonly="readonly"/>
				</label>
			</li>
			<li>
				<span class="tab-name">驻地管理人电话：</span>
				<label>
					<input type="text" name="projectleadBidtel" id="projectleadBidtel" maxlength="50" value="${laborDemand.projectleadBidtel }"  class="input-medium " readonly="readonly"/>
				</label>
			</li>
			 <li class="tips"> 相关补充或调整 </li>
          	<li>
				<span class="tab-name">批量浮动比例(%)：</span>
				<label>
					<form:input path="mfloatratio" htmlEscape="false" class="input-medium "/>
             </label>
			</li>
			<%-- <li>
				<span class="tab-name">施工承包范围：</span>
				<label>
					<form:select path="contractscopeadjust" class="input-medium ">
						<form:option value="" label=""/>
						<form:options items="${fns:getDictList('executionArea')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</label>
			</li> --%>
			<li class="autoHeight">
				<span class="tab-name">甲乙方权利责任的补充调整：</span>
				<label>
					<form:textarea path="rightrespadjust" htmlEscape="false" maxlength="200" class="input-medium "/>
				</label>
			</li>
			<li class="autoHeight">
				<span class="tab-name">质量要求的补充调整：</span>
				<label>
					<form:textarea path="qualityreqadjust" htmlEscape="false" maxlength="200" class="input-medium "/>
				</label>
			</li>
			<li class="autoHeight">
				<span class="tab-name">保修要求的补充调整：</span>
				<label>
					<form:textarea path="warrantyadjust" htmlEscape="false" maxlength="200" class="input-medium "/>
				</label>
			</li>
			<li class="autoHeight">
				<span class="tab-name">验收方法、进度请款及结算方式要求的补充调整：</span>
				<label>
					<form:textarea path="settletermadjust" htmlEscape="false" maxlength="200" class="input-medium "/>
				</label>
			</li>
			<li class="autoHeight">
				<span class="tab-name">工程验收请款结算：</span>
				<label>
					<form:textarea path="settleterm" htmlEscape="false" maxlength="200" class="input-medium "/>
				</label>
			</li>
			<%-- <li class="autoHeight">
				<span class="tab-name">劳务价款：</span>
				<label>
					<form:textarea path="laborprice" htmlEscape="false" maxlength="255" class="input-medium "/>
				</label>
			</li> --%>
			<li class="autoHeight">
				<span class="tab-name">备注：</span>
				<label>
					<form:textarea path="remarks" htmlEscape="false" maxlength="255" class="input-medium "/>
				</label>
			</li>
			<li class="tips">户型和楼栋(注：新选中的会覆盖原有的，不会叠加)</li>
			<input type="hidden" name="subList" id="subList" value="${subProjectList }"/>
			<table id="contentTable" class="table table-striped table-bordered table-condensed resize tree_table">
				<thead>
					<tr>
						<th>选择</th>
						<th>户型</th>
						<th>楼栋号</th>
					</tr>
				</thead>
				<tbody id="listSub">
					
				</tbody>
			</table>
       </ul>
	</form:form>
	</div>
</div>
</body>
</html>