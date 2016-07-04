<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>任务管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#deleteTaskQuotaPlan").live("click",function(){
				var falg = $("input[name='chktaskQuotaPlan']").is(':checked');
				var ids ="";
				if(falg){
					window.confirmx('确认要删除该任务吗？',function(){
						var lists =$("input[name='chktaskQuotaPlan']:checked");
						
						$.each(lists, function(idx,item){
							ids =ids+item.id+",";
						});
						if(ids){
							ids=ids.substring(0,ids.lastIndexOf(","));						
							var url="${ctx}/task/taskPersonalPlan/delete";
							window.location.href=url+"?id="+ids;
						}
					});
				}else{
					window.alertx("请选择需要删除的计划!");
				}
			});
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
	<div class="list-content">
		<div class="nav-operate">
			<ul class="operationg-new">
				<li><a href="${ctx}/task/taskPersonalPlan/form"><input
						id="addTaskQuotaPlan" class="btn btn-primary" type="button"
						value="创建任务"></a></li>
				<li><input id="deleteTaskQuotaPlan" class="btn btn-primary"
					type="button" value="删除"></li>
				<%-- 	<li class="active"><a href="${ctx}/task/taskPersonalPlan/">任务列表</a></li>
				<shiro:hasPermission name="task:taskPersonalPlan:edit">
					<li><a href="${ctx}/task/taskPersonalPlan/form">任务添加</a></li>
				</shiro:hasPermission> --%>
			</ul>
			<form:form id="searchForm" modelAttribute="taskPersonalPlan"
				action="${ctx}/task/taskPersonalPlan/" method="post"
				class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden"
					value="${page.pageNo}" />
				<input id="pageSize" name="pageSize" type="hidden"
					value="${page.pageSize}" />
				<ul class="search">
					<li><form:input path="keyDesc" htmlEscape="false"
							maxlength="200" class="input-medium" placeholder="关键字" /></li>
					<li class="btns"><input id="btnSubmit" class="search-btn"
						type="submit" value="查询" /></li>
					<li class="clearfix"></li>
				</ul>
			</form:form>
		</div>
		<sys:message content="${message}" />
		<table id="contentTable"
			class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th class="all-check"><input type="checkbox" id="all-check">
						<label for="all-check"></label></th>
					<th>阶段</th>
					<th>分部</th>
					<th>细项</th>
					<th>重点描述</th>
					<th>里程碑</th>
					<th>前置任务</th>
					<th>标准工期(天)</th>
					<th>是否完成</th>
					<th>确认完成</th>
					<th>完成时间</th>
					<th>责任人</th>
					<th>状态</th>
					<th>备注信息</th>
					<th>操作</th>
					<%-- <shiro:hasPermission name="task:taskPersonalPlan:edit"> --%>
					<!-- 	<th>操作</th> -->
					<%-- </shiro:hasPermission> --%>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${page.list}" var="taskPersonalPlan">
					<tr>
					<td class="check"><input type="checkbox" id="${taskPersonalPlan.id}" name="chktaskQuotaPlan"></td>
						<%-- <td><a
							href="${ctx}/task/taskPersonalPlan/form?id=${taskPersonalPlan.id}">
								<fmt:formatDate value="${taskPersonalPlan.updateDate}"
									pattern="yyyy-MM-dd HH:mm:ss" />
						</a></td> --%>
						<td>${taskPersonalPlan.stage}</td>
						<td>${taskPersonalPlan.subsection}</td>
						<td>${taskPersonalPlan.fine}</td>
						<td>${taskPersonalPlan.keyDesc}</td>
						<td>${taskPersonalPlan.milepost}</td>
						<td>${taskPersonalPlan.frontTask}</td>
						<td>${taskPersonalPlan.standardDay}</td>
						<td>${taskPersonalPlan.isFinish}</td>
						<td>${taskPersonalPlan.confirmOmpletion}</td>
						<td><fmt:formatDate value="${taskPersonalPlan.finishTime}" pattern="yyyy-MM-dd"/></td>
						<td>${taskPersonalPlan.responsiblePerson}</td>
						<td>${taskPersonalPlan.status}</td>
						<td>${taskPersonalPlan.remarks}</td>
						<%-- <shiro:hasPermission name="task:taskPersonalPlan:edit"> --%>
							<td><a
								href="${ctx}/task/taskPersonalPlan/form?id=${taskPersonalPlan.id}">修改</a>
							<%-- 	<a
								href="${ctx}/task/taskPersonalPlan/delete?id=${taskPersonalPlan.id}"
								onclick="return confirmx('确认要删除该任务吗？', this.href)">删除</a> --%>
								</td>
						<%-- </shiro:hasPermission> --%>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="pagination">${page}</div>
</body>
</html>