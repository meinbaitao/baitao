<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>常用联系人表管理</title>
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
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/person/commonPerson/">常用联系人表列表</a></li>
		<shiro:hasPermission name="person:commonPerson:edit"><li><a href="${ctx}/person/commonPerson/form">常用联系人表添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="commonPerson" action="${ctx}/person/commonPerson/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>联系人姓名（取用户表）：</label>
				<form:input path="name" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>联系人姓名（取用户表）</th>
				<shiro:hasPermission name="person:commonPerson:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="commonPerson">
			<tr>
				<td><a href="${ctx}/person/commonPerson/form?id=${commonPerson.id}">
					${commonPerson.name}
				</a></td>
				<shiro:hasPermission name="person:commonPerson:edit"><td>
    				<a href="${ctx}/person/commonPerson/form?id=${commonPerson.id}">修改</a>
					<a href="${ctx}/person/commonPerson/delete?id=${commonPerson.id}" onclick="return confirmx('确认要删除该常用联系人表吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>