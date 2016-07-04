<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>项目添加</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/activitiHeader.jsp"%>
	<script src="${ctxStatic}/modules/datatrack/scripts/datatrack.js?tsf=${jsVersion}" type="text/javascript"></script>
	<script type="text/javascript">
	$(document).ready(function() {form_validate("inputForm"); });
	</script>
</head>
<body>
  <div class="list-content" >
     <div class="form-content">
	  <form:form id="inputForm" modelAttribute="project" action="${ctx}/project/${flag eq 'add'?'save':'update'}" method="post" class="form-horizontal magbtm0">  
		<ul>
       	  <li>
             <span class="tab-name">项目名称：</span>
             <label>
             	 <input type="hidden" name="id" id="projectId" value="${project.id}"/>
             	 <input type="hidden" name="workflowid" id="workflowid" value="${project.workflowid}"/>
             	 <input type="hidden" name="workflowstatus" id="workflowstatus" value="${project.workflowstatus}"/>
             	 <input type="hidden" name="flag" id="flag" value="${flag}"/>
                 <form:input path="name" id="projectName" htmlEscape="false" maxlength="200" disabled="true" class="input-medium required"/>
             </label>
             
          </li>
          <li>
             <span class="tab-name">项目简称：</span>
             <label>
                  <form:input path="code" id="code" htmlEscape="false" maxlength="200" disabled="true" class="input-medium required" value=""/>
             </label>
             
          </li>
          <li>
             <span class="tab-name">苑区：</span>
             <label>
                 <form:input path="location" id="location" htmlEscape="false" maxlength="50" disabled="true" class="input-medium required" value=""/>
             </label>
             
          </li>
          
          <li>
             <span class="tab-name">省：</span>
             <label>
                 <select name="province" disabled="true" class="input-medium required"  id="province">
                 	<option value="${project.province}">===请选择===</option>
				 </select>
             </label>
             
          </li>
		  <li>
             <span class="tab-name">市：</span>
             <label>
                 <select name="city" id="city" disabled="true" class="input-medium required" id="city">
                     <option value="${project.city}">===请选择===</option>
                 </select>
             </label>
             
          </li>
          <li>
             <span class="tab-name">县区：</span>
             <label>
                 <select name="town" id="town" disabled="true" class="input-medium">
                    <option value="${project.town}">===请选择===</option>
                 </select>
             </label>
          </li>
          
           <li>
             <span class="tab-name">业务板块：</span>
             <label>
                 <form:select id="businessLine" path="businessLine" disabled="true" class="input-medium" tabindex="-1">
					<form:options items="${fns:getDictList('business_plate_type')}" itemValue="value" itemLabel="label" htmlEscape="false"/>
				</form:select>
             </label>
          </li>
           <li>
             <span class="tab-name">计划开工时间：</span>
             <label>
             	  <input name="startTime" id="startTime" value="${project.startTime}" type="text" readonly="readonly"   disabled="true"  maxlength="20" class="input-medium Wdate " onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
             </label>
          </li>
           <li>
             <span class="tab-name">计划完工时间：</span>
             <label>
             	<input name="endTime" id="endTime" value="${project.endTime}" type="text" readonly="readonly"  disabled="true"  maxlength="20" class="input-medium Wdate " onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
             </label>
          </li>
            <li>                          
             <span class="tab-name">项目负责人：</span>
             <label>
             	<form:select name="projectManagerBid" id="projectManagerBid" path="projectManagerBid" disabled="true" class="input-medium required">
             		<option id="-1"></option>
				 	<c:forEach items="${fns:selByCondition('xmfzr')}" var="obj" varStatus="idxStatus">
						 <option value="${fns:escapeHtml(obj.userID)}" <c:if test="${obj.userID==project.projectManagerBid}">selected="selected"</c:if>>${fns:escapeHtml(obj.userName)}</option>
				 	</c:forEach>
				 </form:select>
             </label>
             
          </li>
           <li>
             <span class="tab-name">运营主管：</span>
             <label>
             	 <form:select id="coordinatorLeaderBid" path="coordinatorLeaderBid" disabled="true" class="input-medium" tabindex="-1">
             	 	<option id="-1"></option>
				 	<c:forEach items="${fns:selByCondition('yyzg')}" var="obj" varStatus="idxStatus">
						 <option value="${fns:escapeHtml(obj.userID)}" <c:if test="${obj.userID==project.coordinatorLeaderBid}">selected="selected"</c:if>>${fns:escapeHtml(obj.userName)}</option>
				 	</c:forEach>
				 </form:select>
             </label>
          </li>
           <li>
             <span class="tab-name">区域经理：</span>
             <label>
                  <form:select id="regionalManagerBid" path="regionalManagerBid" disabled="true" class="input-medium required" tabindex="-1">
                  	<option id="-1"></option>
				 	<c:forEach items="${fns:selByCondition('qyjl')}" var="obj" varStatus="idxStatus">
						 <option value="${fns:escapeHtml(obj.userID)}" <c:if test="${obj.userID==project.regionalManagerBid}">selected="selected"</c:if>>${fns:escapeHtml(obj.userName)}</option>
				 	</c:forEach>
				 </form:select>
             </label>
             
          </li>
          <li>
             <span class="tab-name">运营经理：</span>
             <label>
             	 <form:select id="pcDirectorBid" path="pcDirectorBid" disabled="true" class="input-medium" tabindex="-1">
             	 	<option id="-1"></option>
				 	<c:forEach items="${fns:selByCondition('yyjl')}" var="obj" varStatus="idxStatus">
						 <option value="${fns:escapeHtml(obj.userID)}" <c:if test="${obj.userID==project.pcDirectorBid}">selected="selected"</c:if>>${fns:escapeHtml(obj.userName)}</option>
				 	</c:forEach>
				 </form:select>
             </label>
          </li>
          <li>
             <span class="tab-name">运营专员：</span>
             <label>
             	 <form:select id="operationSpecialistBid" path="operationSpecialistBid" disabled="true" class="input-medium" tabindex="-1">
             	 	<option id="-1"></option>
				 	<c:forEach items="${fns:selByCondition('yyzy')}" var="obj" varStatus="idxStatus">
						 <option value="${fns:escapeHtml(obj.userID)}" <c:if test="${obj.userID==project.operationSpecialistBid}">selected="selected"</c:if>>${fns:escapeHtml(obj.userName)}</option>
				 	</c:forEach>
				 </form:select>
             </label>
          </li>
          <li>
             <span class="tab-name">材料员：</span>
             <label>
             	<form:select id="materialStaffBid" path="materialStaffBid" disabled="true" class="input-medium required" tabindex="-1">
             		<option id="-1"></option>
				 	<c:forEach items="${fns:selByCondition('cly')}" var="obj" varStatus="idxStatus">
						 <option value="${fns:escapeHtml(obj.userID)}" <c:if test="${obj.userID==project.materialStaffBid}">selected="selected"</c:if>>${fns:escapeHtml(obj.userName)}</option>
				 	</c:forEach>
				 </form:select>
             </label>
             
          </li>
          <li>
             <span class="tab-name">施工员：</span>
             <label>
                 <form:select id="constructStaffBid" path="constructStaffBid" disabled="true" class="input-medium" tabindex="-1">
                 	<option id="-1"></option>
				 	<c:forEach items="${fns:selByCondition('sgy')}" var="obj" varStatus="idxStatus">
						 <option value="${fns:escapeHtml(obj.userID)}" <c:if test="${obj.userID==project.constructStaffBid}">selected="selected"</c:if>>${fns:escapeHtml(obj.userName)}</option>
				 	</c:forEach>
				 </form:select>
             </label>
          </li>
          <li>
             <span class="tab-name">行政专员：</span>
             <label>
             	 <form:select id="adminstaffbid" path="adminstaffbid" disabled="true" class="input-medium" tabindex="-1">
             	 	<option id="-1"></option>
				 	<c:forEach items="${fns:selByCondition('xzzy')}" var="obj" varStatus="idxStatus">
						 <option value="${fns:escapeHtml(obj.userID)}" <c:if test="${obj.userID==project.adminstaffbid}">selected="selected"</c:if>>${fns:escapeHtml(obj.userName)}</option>
				 	</c:forEach>
				 </form:select>
             </label>
          </li>
          <li>
             <span class="tab-name">项目地址：</span>
             <label>
                  <form:input path="address" id="address" htmlEscape="false" maxlength="200" disabled="true" class="input-medium required" value=""/>
             </label>
             
          </li>
		</ul>	
		

	 <div id="scroll-table">
		<div id="scroll-head">
		</div>
	  <div id="tbody-scroll"  class="tbody-scroll">
	  <sys:message content="${message}"/>
	  <table id="contentTable" class="table table-striped table-bordered table-condensed  table-eidt table-tab">
			<thead>
			   <tr list="subList">
					<th type="text" name="houseType" id="houseType">户型</th>
					<th type="text"  name="building" id="building">楼栋</th>
					<th type="select" name="type" id="type" tag="building_type">类别</th>
					<th type="select" name="status" id="status" tag="subproject_type">状态</th>
				    <th type="text" name="jiaContractNum" id="jiaContractNum">甲方合同号</th>
					<th type="select" name="track" id="track" tag="subproject_type">跟踪</th>
				</tr>
			</thead>
			<c:if test="${flag eq 'view'}">
				<tbody id="subProjectList"  copy="false">
					<c:forEach items="${project.subList}" var="subProject" varStatus="idx" >
						<tr list="subList" index="${idx.index}">
							<td type="hidden" name="subList[${idx.index}].id" value="${subProject.id}" class="hide"></td>
							<td   name="subList[${idx.index}].houseType" id="subList[${idx.index}].houseType">
								${subProject.houseType}
							</td>
							<td  name="subList[${idx.index}].building" id="subList[${idx.index}].building">
								${subProject.buildingDisplayName}
							</td>
							<td   name="subList[${idx.index}].type" value="${subProject.type}" tag="building_type">${subProject.showType}</td>
							<td   name="subList[${idx.index}].status" value="${subProject.status}" tag="subproject_type">${subProject.showStatus}</td>
						 	
						 	<td  name="subList[${idx.index}].jiaContractNum" id="subList[${idx.index}].jiaContractNum">
								<a href="${ctx}/datatrack/trackJiaContract?id=${subProject.id}">${subProject.jiaContractNum}</a>
							</td>
						 	
						 	<td  name="subList[${idx.index}].building" id="subList[${idx.index}].building">
								<a href="${ctx}/datatrack/trackProduct?subid=${subProject.id}">加工运输 </a>
								<%-- &nbsp;&nbsp;
								<a href="${ctx}/datatrack/trackbuilding?name=${subProject.building}">施工进度 </a> --%>
								&nbsp;&nbsp;
								<a href="${ctx}/datatrack/trackPurchase?subid=${subProject.id}">钢辅材采购</a>
							</td>
							
						 
						 </tr>
			 		</c:forEach>
				</tbody>
			</c:if>
		</table>
		</div>
		</div>
		<div class="hr_60">
		</div>
	 </form:form>
  </div>
</body>
</html>