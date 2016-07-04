<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>字典管理(用户)</title>
	<meta name="decorator" content="default"/>
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
<div class="list-content" >
	    <div class="nav-operate" >
	        <ul class="operationg-new" >
	          <li ><a href="${ctx}/sys/userdict/" class="active"><span class="glyphicon glyphicon-list"></span>字典列表</a></li>
	        </ul>
	        <form:form id="searchForm" modelAttribute="dict" action="${ctx}/sys/userdict/" method="post" class="breadcrumb form-search">
	         <ul class="search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<li><label>类型：</label>
					<form:select id="type" path="type" name="type" class="input-medium">
						<form:option value="" label=""/>
						<c:forEach items="${typeList}" var="dict" varStatus="idxStatus">
							 <option <c:if test="${dict.type eq param.type}">selected="selected"</c:if> value="${dict.type}">${dict.description}</option>
					 	</c:forEach>
					</form:select>
				</li>
				<li>
				<label>字典名称：</label><form:input path="label" htmlEscape="false" maxlength="50" class="input-medium"/>
				</li>
				<li>
				<input id="btnSubmit" class="search-btn" type="submit" value="查询"/>
				</li>
			</ul>
		</form:form>
        </div>
        	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr><th>参数类型</th><th>参数值</th><th>排序</th><shiro:hasPermission name="sys:dict:edit"><th>操作</th></shiro:hasPermission></tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="dict">
			<tr>
				<td><a href="javascript:" onclick="$('#type').val('${dict.type}');
				$('#searchForm').submit();return false;">${dict.description}</a></td>
				<!-- <td><a href="javascript:" onclick="$('#type').val('${dict.type}');
				$('#searchForm').submit();return false;">${dict.type}</a></td> -->
				<td>${dict.label}</td>
				<!-- <td>${dict.value}</td> -->
				<td>${dict.sort}</td>
				<shiro:hasPermission name="sys:dict:edit"><td>
    				<a href="${ctx}/sys/userdict/form?id=${dict.id}">修改</a>
					<a href="${ctx}/sys/userdict/delete?id=${dict.id}&type=${dict.type}" onclick="return confirmx('确认要删除该字典吗？', this.href)">删除</a>
    				<a href="${ctx}/sys/userdict/form?id=${dict.id}&operation=new">添加项</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>

	

	<div class="pagination">${page}</div>

</body>
</html>