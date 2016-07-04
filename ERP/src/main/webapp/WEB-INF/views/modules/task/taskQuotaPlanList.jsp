<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>指标型计划管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(function() {
		$("#deleteTaskQuotaPlan").live("click",function(){
			var falg = $("input[name='chktaskQuotaPlan']").is(':checked');
			var ids ="";
			if(falg){
				window.confirmx('确认要删除该计划吗？',function(){
					var lists =$("input[name='chktaskQuotaPlan']:checked");
					
					$.each(lists, function(idx,item){
						ids =ids+item.id+",";
					});
					if(ids){
						ids=ids.substring(0,ids.lastIndexOf(","));						
						var url="${ctx}/task/taskQuotaPlan/delete";
						window.location.href=url+"?id="+ids;
					}
				});
			}else{
				window.alertx("请选择需要删除的计划!");
			}
		});
		
		$("#assignTaskQuotaPlan").live("click",function(){
			window.alertx($("#responsiblePerson").val());
			var falg = $("input[name='chktaskQuotaPlan']").is(':checked');
			var ids ="";
			if(falg){
				var lists =$("input[name='chktaskQuotaPlan']:checked");				
				$.each(lists, function(idx,item){
					ids =ids+item.id+",";
				});
				if(ids){
					ids=ids.substring(0,ids.lastIndexOf(","));
					$("#assignIDs").val(ids);
					$("#assignForm").submit();
				}
			}else{
				window.alertx("请选择需要删除的计划!");
			}
		});
		
	});
	function page(n, s) {
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
				<li><a href="${ctx}/task/taskQuotaPlan/form"><input
						id="addTaskQuotaPlan" class="btn btn-primary" type="button"
						value="创建计划"></a></li>
				<li><input id="deleteTaskQuotaPlan" class="btn btn-primary"
					type="button" value="删除"></li>
				<li>
				<form:form id="assignForm"  modelAttribute="taskQuotaPlan" action="${ctx}/task/taskQuotaPlan/assign" method="post" class="breadcrumb form-search">
					<input id="assignIDs" name="assignIDs" type="hidden" value=""/>
					<select id="responsiblePerson"  class="input-mini" name="responsiblePerson" path="responsiblePerson">
						<option id="-1"></option>
						<c:forEach items="${fns:selByCondition('')}" var="obj"
							varStatus="idxStatus">
							<option value="${fns:escapeHtml(obj.userID)}">${fns:escapeHtml(obj.userName)}</option>
						</c:forEach>
					</select>
					</form:form>
					</li>
				<li><input id="assignTaskQuotaPlan" class="btn btn-primary"
					type="button" value="指派"></li>
			</ul>
			<form:form id="searchForm" modelAttribute="taskQuotaPlan"
				action="${ctx}/task/taskQuotaPlan/" method="post"
				class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden"
					value="${page.pageNo}" />
				<input id="pageSize" name="pageSize" type="hidden"
					value="${page.pageSize}" />
				<ul class="search">
					<li><form:input path="quotaDesc" htmlEscape="false"
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
						<label for="all-check">选择</label></th>
					<th>月份</th>
					<th>指标项</th>
					<th>权重</th>
					<th>指标说明</th>
					<th>责任人</th>
					<th>复评部门</th>
					<th>实际完成工作量</th>
					<th>得分</th>
					<th>备注信息</th>
					<%-- <shiro:hasPermission name="task:taskQuotaPlan:edit"> --%>
					<th>操作</th>
					<%-- </shiro:hasPermission> --%>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${page.list}" var="taskQuotaPlan">
					<tr>
						<td class="check"><input type="checkbox" id="${taskQuotaPlan.id}" name="chktaskQuotaPlan"></td>
						<%-- <td><a href="${ctx}/task/taskQuotaPlan/form?id=${taskQuotaPlan.id}">
					<fmt:formatDate value="${taskQuotaPlan.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</a></td> --%>
						<td>${taskQuotaPlan.taskMonth}</td>
						<td>${taskQuotaPlan.quotas}</td>
						<td>${taskQuotaPlan.weight}</td>
						<td>${taskQuotaPlan.quotaDesc}</td>
						<td>${taskQuotaPlan.responsiblePerson}</td>
						<td>${taskQuotaPlan.reviewDeptId}</td>
						<td>${taskQuotaPlan.actualFinishQuantity}</td>
						<td>${taskQuotaPlan.goal}</td>
						<td>${taskQuotaPlan.remarks}</td>
						<%-- <shiro:hasPermission name="task:taskQuotaPlan:edit"> --%>
						<td><a
							href="${ctx}/task/taskQuotaPlan/form?id=${taskQuotaPlan.id}">修改</a>
							<%--<a href="${ctx}/task/taskQuotaPlan/delete?id=${taskQuotaPlan.id}"
							onclick="return confirmx('确认要删除该指标型计划吗？', this.href)">删除</a></td>
						 </shiro:hasPermission> --%>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="pagination">${page}</div>
</body>
</html>