<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>供应商信息管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		var ctxPath="${ctx}";
		$(document).ready(function() {
			$("#addContract").on("click",function(){
				 window.location.href=ctxPath+"/supplier/supplier/form";
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
			<ul class="operationg-new" >
				<li>
					<shiro:hasAnyRoles name="${fns:getWhitelistsList('hzfgl')}">
						<input id="addContract" class="btn btn-primary" type="button" value="添加">
						<!-- <input id="deleteContract" class="btn btn-primary" type="button" value="删除合同"> -->
					</shiro:hasAnyRoles>
				</li>
		    </ul>
			<form:form id="searchForm" modelAttribute="supplier"
				action="${ctx}/supplier/supplier/" method="post"
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
				<th>供应商编号</th>
				<th>供应商名称</th>
				<th>供应商简称</th>
				<th>供应商类别</th>
				<th>供货范围</th>
				<th>备注信息</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="supplier">
			<tr>
				<td>
					${supplier.seriesnumber}
				</td>
				<td><a href="${ctx}/supplier/supplier/form?id=${supplier.id}">
					${supplier.name}
				</a></td>
				<td>
					${supplier.code}
				</td>
				<td>
					${fns:getDictLabel(supplier.supplierType, 'supplierType', '')}
				</td>
				<td>
					${supplier.srange}
				</td>
				<td>
					${supplier.remarks}
				</td>
				<td>
					<shiro:hasAnyRoles name="${fns:getWhitelistsList('hzfgl')}">
						<a href="${ctx}/supplier/supplier/delete?id=${supplier.id}" onclick="return confirmx('确认要删除该供应商信息吗？', this.href)">删除</a>
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