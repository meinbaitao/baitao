<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>生产结算单管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript" src="${ctxStatic}/modules/finance/scripts/manufSettlement.js"></script>
	<script type="text/javascript" src="${ctxStatic}/common/common_service.js"></script>	
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
	<div class="list-content">
		<div class="nav-operate">
			<ul class="operationg-new" >
				<li>
<!-- 				<input id="addNew" class="btn btn-primary" type="button" value="添加加工结算"> -->
<!--	 			<input id="deleteContract" class="btn btn-primary" type="button" value="删除合同"> -->
			</li>
	    </ul>
		<form:form id="searchForm" modelAttribute="manufSettlement"
			action="${ctx}/finance/manufSettlement/list" method="post"
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
		</form:form>
	</div>
	
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>结算单编号</th>
				<th>供应商名称</th>
				<th>项目简称</th>
				<th>不含税金额</th>
				<th>付款通知单号</th>
				<th>付款方式</th>
				<th>付款日期</th>
				<th>状态</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="manufSettlement">
			<tr>
				<td><a href="${ctx}/finance/manufSettlement/form?id=${manufSettlement.id}">
					${manufSettlement.seriesnumber}
				</a></td>
				<td>
					${manufSettlement.supplierName}
				</td>
				<td>
					${manufSettlement.projectCode}
				</td>
				<td>
					${manufSettlement.price}
				</td>
				<td>${manufSettlement.paymentSeriesnumber}</td>
				<td>${manufSettlement.paymentType}</td>
				<td>${manufSettlement.paymentDate}</td>
				<td>
					<c:choose>
						<c:when test="${manufSettlement.statue eq '0'}">未付款</c:when>
						<c:otherwise>已付款</c:otherwise>
					</c:choose>
				</td>
<%--				<td>${manufSettlement.remarks}</td>
 				<td>
					<a href="${ctx}/finance/manufSettlement/delete?id=${manufSettlement.id}" onclick="return confirmx('确认要删除该生产结算单吗？', this.href)">删除</a>
				</td> --%>
			</tr>
		</c:forEach>
		</tbody>
		</table>
	</div>
<div class="pagination">${page}</div>
</body>
</html>