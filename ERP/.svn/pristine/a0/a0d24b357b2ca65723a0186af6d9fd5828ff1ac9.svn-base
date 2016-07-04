<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>户型管理</title>
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
					<a href="${ctx}/houseType/houseType/form" class="btn btn-primary">添加</a>
				</li>
		    </ul>
	        <form:form id="searchForm" modelAttribute="houseType" action="${ctx}/houseType/houseType/" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        <ul class="search">
		            <li>
		               <form:input path="keyWord" htmlEscape="false" maxlength="200" class="input-medium" placeholder="关键字"/>
		            </li>
		            <li>
		            	<input id="searchProject" type="submit" name="查询" value="查询" class="search-btn"/>
		            </li>
		        </ul>
		       <div class="clearfix"></div>
		     </form:form>
		     <div class="clear"></div>
	     </div>
	  <sys:message content="${message}"/>
	  <table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>户型</th>
				<th>施工面积</th>
				<th>劳务面积</th>
				<th>骨架劳务估值</th>
				<th>石材劳务估值</th>
				<th>骨架+石材劳务估值</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="houseType">
			<tr>
				<td><a href="${ctx}/houseType/houseType/form?id=${houseType.id}">
					${houseType.houseType}</a></td>
				<td><fmt:formatNumber value="${houseType.constructArea}" pattern="####.##"/></td>
				<td><fmt:formatNumber value="${houseType.laborArea}" pattern="####.##"/></td>
				<td><fmt:formatNumber value="${houseType.laborBudgetGj}" pattern="####.##"/></td>
				<td><fmt:formatNumber value="${houseType.laborBudgetSc}" pattern="####.##"/></td>
				<td><fmt:formatNumber value="${houseType.laborBudgetGj+houseType.laborBudgetSc}" pattern="####.##"/></td>
				<td>
    				<a href="${ctx}/houseType/houseType/form?id=${houseType.id}">修改</a>
					<a href="${ctx}/houseType/houseType/delete?id=${houseType.id}" onclick="return confirmx('确认要删除该户型吗？', this.href)">删除</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
<div class="pagination">${page}</div>
</body>
</html>