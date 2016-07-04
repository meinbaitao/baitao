<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>留言管理</title>
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
	
		<form:form id="searchForm" modelAttribute="guestbook" action="${ctx}/cms/guestbook/" method="post" class="breadcrumb form-search">
		   <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		   <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		   <ul class="search">
			<li>
			  <span>分类：</span>
			  <label>
			      <form:select id="type" path="type" class="input-small"><form:option value="" label=""/><form:options items="${fns:getDictList('cms_guestbook')}" itemValue="value" itemLabel="label" htmlEscape="false"/></form:select>
			  </label>
		   </li>
			
			<li><span>内容：</span>
			  <label><form:input path="content" htmlEscape="false" maxlength="50" class="input-small"/>
			  </label>
			 </li>
			 <li><span>状态：</span>
			  <label>
			     <form:radiobuttons onclick="$('#searchForm').submit();" path="delFlag" items="${fns:getDictList('cms_del_flag')}" itemLabel="label" itemValue="value" htmlEscape="false" />

			  </label>
			 </li>
			 
		   <li><input id="btnSubmit" class="search-btn" type="submit" value="查询"/>&nbsp;&nbsp;</li>
		   </ul>
		</form:form>
   </div>

	
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr><th>留言分类</th><th>留言内容</th><th>留言人</th><th>留言时间</th><th>回复人</th><th>回复内容</th><th>回复时间</th><shiro:hasPermission name="cms:guestbook:edit"><th>操作</th></shiro:hasPermission></tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="guestbook">
			<tr>
				<td>${fns:getDictLabel(guestbook.type, 'cms_guestbook', '无分类')}</td>
				<td><a href="${ctx}/cms/guestbook/form?id=${guestbook.id}">${fns:abbr(guestbook.content,40)}</a></td>
				<td>${guestbook.name}</td>
				<td><fmt:formatDate value="${guestbook.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${guestbook.reUser.name}</td>
				<td>${fns:abbr(guestbook.reContent,40)}</td>
				<td><fmt:formatDate value="${guestbook.reDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<shiro:hasPermission name="cms:guestbook:edit"><td>
					<c:if test="${guestbook.delFlag ne '2'}"><a href="${ctx}/cms/guestbook/delete?id=${guestbook.id}${guestbook.delFlag ne 0?'&isRe=true':''}" 
						onclick="return confirmx('确认要${guestbook.delFlag ne 0?'恢复审核':'删除'}该留言吗？', this.href)">${guestbook.delFlag ne 0?'恢复审核':'删除'}</a></c:if>
					<c:if test="${guestbook.delFlag eq '2'}"><a href="${ctx}/cms/guestbook/form?id=${guestbook.id}">审核</a></c:if>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>