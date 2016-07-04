<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>可配置加工项物料信息管理</title>
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
	         <li><a href="${ctx}/material/settlementMaterial/form"><input class="btn btn-primary" type="button" value="添加物料信息"></a></li>
	        </ul>
	       	<form:form id="searchForm" modelAttribute="settlementMaterial" action="${ctx}/material/settlementMaterial/list" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<ul class="search">
					<li><span>物料名称：</span>
						<label><form:input path="materialNo" htmlEscape="false" maxlength="100" class="input-medium"/></label>
					</li>
					<li ><input id="btnSubmit" class="search-btn" type="submit" value="查询"/></li>
					<li class="clearfix"></li>
				</ul>
			</form:form>
	     </div>

	<sys:message content="${message}"/>
	<form:form id="form" action="${ctx}/material/settlementMaterial/list" method="post" class="breadcrumb form-search">
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>物料规格编号</th>
				<th>物料规格名称</th>
				<th>物料加工类别</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="material">
			<tr>
				<td>
					${material.materialNo}
				</td>
				<td>
					${material.materialName }
				</td>
				<td>
					${material.settlementType}
				</td>
				<td>
    				<a href="${ctx}/material/settlementMaterial/update?id=${material.id}">修改</a>
					<a href="${ctx}/material/settlementMaterial/delete?id=${material.id}">删除</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</form:form>
</div>
	<div class="pagination">${page}</div>

</body>
</html>