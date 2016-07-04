<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>白名单管理管理</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/modules/whitelist/whitelist.js?tsf=${jsVersion}" type="text/javascript"></script>
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
	          	<li>
					<input id="addWhitelists" class="btn btn-primary" type="button" value="添加白名单">
				</li>
	        </ul>
	        <form:form id="searchForm" modelAttribute="whitelists" action="${ctx}/whitelists/list" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        <ul class="search">
		            <li>
		               <form:input path="name" htmlEscape="false" maxlength="200" class="input-medium" placeholder="白名单名称查找"/>
		            </li>
		            <li>
		            	<input type="submit" name="查询" value="查询" class="search-btn"/>
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
					<th>白名单名称</th>
					<th>角色英文名</th>
					<th>描述</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${page.list}" var="obj">
				<tr>
					<td>${obj.name}</td>
					<td style="word-break:break-all; word-wrap:break-word;">${obj.roleEnName}</td>
					<td>${obj.description}</td>
					<td>${obj.status==1?'启用':'关闭'}</td>
					<td>
						<a href="${ctx}/whitelists/form?id=${obj.id}">修改</a>
						<c:choose>
   							<c:when test="${obj.status==1}">
   								<a href="${ctx}/whitelists/setting?id=${obj.id}&status=0" onclick="return confirmx('关闭白名单将所有人都能看到对应信息，确认要关闭该白名单吗？', this.href)">关闭</a>
   							</c:when>   
   							<c:otherwise>
   								  <a href="${ctx}/whitelists/setting?id=${obj.id}&status=1">启用</a>
   							</c:otherwise>  
						</c:choose>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="pagination">${page}</div>

</body>
</html>