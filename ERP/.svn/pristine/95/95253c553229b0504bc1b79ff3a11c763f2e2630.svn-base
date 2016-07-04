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
				</li>
		    </ul>
			<form:form id="searchForm" modelAttribute="manufContractBase"
				action="${ctx}/contract/contractPrint/list" method="post"
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
					<th>结算方式</th>
					<th>起止日期</th>
					<th>终止日期</th>
					<th>合同操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${page.list}" var="manufContractBase">
				<tr>
					<td>
					<a href="${ctx}/contract/manufContractBase/form?id=${manufContractBase.id}">${manufContractBase.contractNo}</a>
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
					<td class="table-operate">
						<a href="${ctx}/contract/contractPrint/print?id=${manufContractBase.id}">预览打印</a>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="pagination">${page}</div>

	
</body>
</html>