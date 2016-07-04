<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>生产合同管理</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/common/common_service.js" type="text/javascript"></script>
	<script>
		var ctxPath="${ctx}";
	</script>
</head>
<body>

	<div class="list-content">
			
		<div class="nav-operate">
			<ul class="operationg-new" >
				<li>
<!-- 					<input id="addContract" class="btn btn-primary" type="button" value="添加合同">
					<input id="deleteContract" class="btn btn-primary" type="button" value="删除合同"> -->
				</li>
		    </ul>
			<form:form id="searchForm" modelAttribute="manufContractBase"
				action="${ctx}/contract/manufContractBase/list" method="post"
				class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden"
					value="${page.pageNo}" />
				<input id="pageSize" name="pageSize" type="hidden"
					value="${page.pageSize}" />
				<ul class="search">
					<li>
						<form:input path="search" htmlEscape="false" class="input-medium" placeholder="关键字"/></li>
					<li>
						<button class="search-btn" id="btnSubmit" type="submit">查询</button></li>
				</ul>
				<div class="clearfix"></div>
			</form:form>
		</div>
	
		<sys:message content="${message}" />
		<table id="contentTable" class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th>合同编号</th>
<!-- 					<th>合同类型</th> -->
					<th>供应商名称</th>
					<th>结算方式</th>
					<th>起止日期</th>
					<th>终止日期</th>
					<th>合同状态</th> 
					<th>审批状态</th> 
					<th>合同操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${page.list}" var="manufContractBase">
				<tr>
					<td>
					<a href="${ctx}/contract/manufContractBase/form?id=${manufContractBase.id}">${manufContractBase.contractNo}</a>
					</td>
<%-- 					<td>
						${fns:getDictLabel(manufContractBase.contractType, 'manufContractType', '')}
					</td> --%>
					<td>
						${manufContractBase.supp.name}
					</td>
					<td>
						${manufContractBase.settlementType}
					</td>
					<td>
						${manufContractBase.startTime}
					</td>
					<td>
						${manufContractBase.endTime}
					</td>
					<td>
						${fns:getDictLabel(manufContractBase.statue, 'contractStatue', '')}
					</td>
					<td>
					<c:choose>
						<c:when test="${manufContractBase.workflowstatus eq '1'}">
							待审核
						</c:when>
						<c:when test="${manufContractBase.workflowstatus eq '4'}">
							已完成
						</c:when>	
						<c:otherwise>待提交</c:otherwise>
					</c:choose>
					</td>
					<td class="table-operate">
						<shiro:hasAnyRoles name="${fns:getWhitelistsList('scysht')}">
							<a href="${ctx}/contract/manufContractBase/delete?id=${manufContractBase.id}" onclick="return confirmx('确认要删除该生产合同吗？', this.href)">删除</a>
						</shiro:hasAnyRoles>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="pagination">${page}</div>

	
</body>
</html>