<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>运费申请付款管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript" src="${ctxStatic}/modules/finance/scripts/transportationPayment.js"></script>
	<script type="text/javascript" src="${ctxStatic}/common/common_service.js"></script>
	<script type="text/javascript">
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
				<input id="addContract" class="btn btn-primary" type="button" value="添加">
<!-- 	 			<input id="deleteContract" class="btn btn-primary" type="button" value="删除合同"> -->
			</li>
	    </ul>
		<form:form id="searchForm" modelAttribute="transportationPayment"
			action="${ctx}/finance/transportationPayment/list" method="post"
			class="breadcrumb form-search">
			<input id="pageNo" name="pageNo" type="hidden"
				value="${page.pageNo}" />
			<input id="pageSize" name="pageSize" type="hidden"
				value="${page.pageSize}" />
			<ul class="search">
				<li>
	               <form:input path="paymentNumber" htmlEscape="false" maxlength="200" class="input-medium" placSeholder="关键字"/>
	            </li>
	            <li>
	            	<input id="searchProject" type="submit" name="查询" value="查询" class="search-btn"/>
	            </li>
			</ul>
		</form:form>
	</div>
	
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>付款单号</th>
				<th>申请部门</th>
				<th>申请日期</th>
				<th>收款单位</th>
				<th>申请金额</th>
				<th>付款金额</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="transportationPayment">
			<tr>
				<td><a href="${ctx}/finance/transportationPayment/form?id=${transportationPayment.id}">
					${transportationPayment.paymentNumber}
				</a></td>
				<td>
					${transportationPayment.requiredPart}
				</td>
				<td>
					${transportationPayment.requiredDate}
				</td>
				<td>
					${transportationPayment.paymentObject}
				</td>
				<td>
					${transportationPayment.requiredPrice}
				</td>
				<td>
					${transportationPayment.paymentPrice}
				</td>
				<td>
					<fmt:formatDate value="${transportationPayment.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${transportationPayment.remarks}
				</td>
				<td>
					<a href="${ctx}/finance/transportationPayment/delete?id=${transportationPayment.id}" onclick="return confirmx('确认要删除该运费申请付款吗？', this.href)">删除</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	<div class="pagination">${page}</div>
</body>
</html>