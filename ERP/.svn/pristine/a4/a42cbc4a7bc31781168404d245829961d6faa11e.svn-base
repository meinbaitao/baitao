<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>待办任务</title>
	<meta name="decorator" content="default"/>
	<%@ include file="/WEB-INF/views/include/activitiHeader.jsp"%>
	<script src="${ctxStatic }/common/activiti/workflow.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function() {
			// 跟踪
			$('.trace').click(graphTrace);
		});

		/**
		 * 签收任务
		 */
		function claim(taskId) {
			$.get('${ctx}/act/task/claim' ,{taskId: taskId}, function(data) {
				if (data == 'true'){
		        	top.$.jBox.tip('签收完成');
		            location = '${ctx}/act/task/todo/';
				}else{
		        	top.$.jBox.tip('签收失败');
				}
		    });
		}
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
		         <a href="${ctx}/act/task/todo/" class="active"><span class="glyphicon glyphicon-th-list"></span>待办任务 </a>
		       </li>
		       <li >
		         <a href="${ctx}/act/task/historic/"><span class="glyphicon glyphicon-ok"></span>已办任务 </a>
		       </li>
		       <li>
		         <a href="${ctx}/act/task/process/"><span class="glyphicon glyphicon-plus"></span>新建任务 </a>
		       </li>
		     </ul>
         	<form:form id="searchForm" modelAttribute="act" action="${ctx}/act/task/todo/" method="get" class="breadcrumb form-search">
				 <ul class="search">
					<li>
					   <label>流程类型：&nbsp;</label>
					   <form:select path="procDefKey" class="input-small">
						   <form:option value="" label="全部流程"/>
						   <form:options items="${fns:getDictList('act_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				    	</form:select>
				    </li>
				    <li>
					<label>创建时间：</label>
						<input id="beginDate"  name="beginDate"  type="text" readonly="readonly" maxlength="20" class="input-small Wdate" 
							value="<fmt:formatDate value="${act.beginDate}" pattern="yyyy-MM-dd"/>"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
							　--　
						<input id="endDate" name="endDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate" 
							value="<fmt:formatDate value="${act.endDate}" pattern="yyyy-MM-dd"/>"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
					</li>
					<li><input id="btnSubmit" class="search-btn" type="submit" value="查询"/></li>
				</ul>
			</form:form> 
		   
	       
		     <div class="clear"></div>
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
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="act">
				<c:set var="task" value="${act.task}" />
				<c:set var="vars" value="${act.vars}" />
				<c:set var="procDef" value="${act.procDef}" /><%--
				<c:set var="procExecUrl" value="${act.procExecUrl}" /> --%>
				<c:set var="status" value="${act.status}" />
				<tr>
					<td>
						<c:if test="${empty task.assignee}">
							<a href="javascript:claim('${task.id}');" title="签收任务">${fns:abbr(not empty act.vars.map.title ? act.vars.map.title : task.id, 60)}</a>
						</c:if>
						<c:if test="${not empty task.assignee}">
							<a href="${ctx}/act/task/form?taskId=${task.id}&taskName=${fns:urlEncode(task.name)}&taskDefKey=${task.taskDefinitionKey}&procInsId=${task.processInstanceId}&procDefId=${task.processDefinitionId}&status=${status}">${fns:abbr(not empty vars.map.title ? vars.map.title : task.id, 60)}</a>
						</c:if>
					</td>
					<td>
						<a target="_blank" href="${pageContext.request.contextPath}/act/rest/diagram-viewer?processDefinitionId=${task.processDefinitionId}&processInstanceId=${task.processInstanceId}">${task.name}</a>
					</td><%--
					<td>${task.description}</td> --%>
					<td>${procDef.name}</td>
					<td><b title='流程版本号'>V: ${procDef.version}</b></td>
					<td><fmt:formatDate value="${task.createTime}" type="both"/></td>
					<td>
						<c:if test="${empty task.assignee}">
							<a href="javascript:claim('${task.id}');">签收任务</a>
						</c:if>
						<c:if test="${not empty task.assignee}"><%--
							<a href="${ctx}${procExecUrl}/exec/${task.taskDefinitionKey}?procInsId=${task.processInstanceId}&act.taskId=${task.id}">办理</a> --%>
							<a href="${ctx}/act/task/form?taskId=${task.id}&taskName=${fns:urlEncode(task.name)}&taskDefKey=${task.taskDefinitionKey}&procInsId=${task.processInstanceId}&procDefId=${task.processDefinitionId}&status=${status}">任务办理</a>
						</c:if>
						<shiro:hasPermission name="act:process:edit">
							<c:if test="${empty task.executionId}">
								<a href="${ctx}/act/task/deleteTask?taskId=${task.id}&reason=" onclick="return promptx('删除任务','删除原因',this.href);">删除任务</a>
							</c:if>
						</shiro:hasPermission>
						<a target="_blank" class="trace" href="${ctx}/act/task/trace/photo/${task.executionId}">跟踪流程</a>
						<!-- -->
						<a class="trace" href='#' pid="${task.executionId }" pdid="${task.processDefinitionId}" title="点击查看流程图">${act.taskName}</a>

					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
   </div>
   	<div class="pagination">${page}</div>
</body>
</html>
