<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>已办任务</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
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
	<div class="list-content" >
		<div class="nav-operate" >
		    <ul class="operationg-new" >
		   
		       <li>
		         <a href="${ctx}/act/task/todo/" ><span class="glyphicon glyphicon-th-list"></span>待办任务 </a>
		       </li>
		       <li >
		         <a href="${ctx}/act/task/historic/" class="active"><span class="glyphicon glyphicon-ok"></span>已办任务 </a>
		       </li>
		       <li>
		         <a href="${ctx}/act/task/process/"><span class="glyphicon glyphicon-plus"></span>新建任务 </a>
		       </li>
		     </ul>
			<form:form id="searchForm" modelAttribute="act" action="${ctx}/act/task/historic/" method="get" class="breadcrumb form-search">
			      <input id="pageNo" name="pageNo" type="hidden"  value="${page.pageNo}" />
				  <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}" />
				 <ul class="search" >
				    <li>
						<label>流程类型：&nbsp;</label>
						<form:select path="procDefKey" class="input-small">
							<form:option value="" label="全部流程"/>
							<form:options items="${fns:getDictList('act_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</li>
					<li>
					<label>完成时间：</label>
					<input id="beginDate"  name="beginDate"  type="text" readonly="readonly" maxlength="20" class="input-small Wdate" style="width:163px;"
						value="<fmt:formatDate value="${act.beginDate}" pattern="yyyy-MM-dd"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
						　--　
					<input id="endDate" name="endDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate" style="width:163px;"
						value="<fmt:formatDate value="${act.endDate}" pattern="yyyy-MM-dd"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
					</li>
					<li><input id="btnSubmit" class="search-btn" type="submit" value="查询"/></li>
				</ul>
				
			</form:form>
		</div>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>标题</th>
				<th>当前环节</th><%--
				<th>任务内容</th> --%>
				<th>流程名称</th>
				<th>流程版本</th>
				<th>完成时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="act">
				<c:set var="task" value="${act.histTask}" />
				<c:set var="vars" value="${act.vars}" />
				<c:set var="procDef" value="${act.procDef}" /><%--
				<c:set var="procExecUrl" value="${act.procExecUrl}" /> --%>
				<c:set var="status" value="${act.status}" />
				<tr>
					<td>
						<a href="${ctx}/act/task/form?taskId=${task.id}&taskName=${fns:urlEncode(task.name)}&taskDefKey=${task.taskDefinitionKey}&procInsId=${task.processInstanceId}&procDefId=${task.processDefinitionId}&status=${status}">${fns:abbr(not empty vars.map.title ? vars.map.title : task.id, 60)}</a>
					</td>
					<td>
						<a target="_blank" href="${pageContext.request.contextPath}/act/rest/diagram-viewer?processDefinitionId=${task.processDefinitionId}&processInstanceId=${task.processInstanceId}">${task.name}</a><%--
						<a target="_blank" href="${ctx}/act/task/trace/photo/${task.processDefinitionId}/${task.executionId}">${task.name}</a>
						<a target="_blank" href="${ctx}/act/task/trace/info/${task.processInstanceId}">${task.name}</a> --%>
					</td><%--
					<td>${task.description}</td> --%>
					<td>${procDef.name}</td>
					<td><b title='流程版本号'>V: ${procDef.version}</b></td>
					<td><fmt:formatDate value="${task.endTime}" type="both"/></td>
					<td>
						<a href="${ctx}/act/task/form?taskId=${task.id}&taskName=${fns:urlEncode(task.name)}&taskDefKey=${task.taskDefinitionKey}&procInsId=${task.processInstanceId}&procDefId=${task.processDefinitionId}&status=${status}">详情</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
	<div class="pagination">${page}</div>
</body>
</html>
