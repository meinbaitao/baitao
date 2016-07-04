<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>链接管理</title>
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
	          <li ><a href="${ctx}/cms/link/?category.id=${link.category.id}" class="active"><span class="glyphicon glyphicon-list"></span>链接列表</a></li>
	          <shiro:hasPermission name="cms:link:edit"><li><a href="<c:url value='${fns:getAdminPath()}/cms/link/form?id=${link.id}&category.id=${link.category.id}'><c:param name='category.name' value='${link.category.name}'/></c:url>"><span class="glyphicon glyphicon-plus"></span>链接添加</a></li></shiro:hasPermission>
	        </ul>
		  	<form:form id="searchForm" modelAttribute="link" action="${ctx}/cms/link/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
	        <ul class="search">
	            <li>
	               <label>根据：</label>
	               <select class="input-small">
					  <option>栏目</option>
					  <option>标题</option>
					  <option>状态</option>
					</select>
	            </li>
	            <li class="input">
		              <i ><sys:treeselect id="category" name="category.id" value="${article.category.id}" labelName="category.name" labelValue="${article.category.name}"
					title="栏目" url="/cms/category/treeData" module="article" notAllowSelectRoot="false" cssClass="input-small"/></i>
		              <i><form:input path="title" htmlEscape="false" maxlength="50" class="input-small"/></i>
		               <i> <form:radiobuttons onclick="$('#searchForm').submit();" path="delFlag" items="${fns:getDictList('cms_del_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/></i>

		        </li>
	            <li>
	              <button class="search-btn" id="btnSubmit"  type="submit"  onclick="return page();">筛选</button>
	            </li>
	            <li>
	              <button class="search-btn icon" id="advanced-search-btn"  type="button"  >高级筛选<i></i></button>
	            </li>
	            <li>
	              <button class="search-btn" id="table-set"  type="button"  >表格显示</button>
	            </li>
	            
	        </ul>
	    <li class="clearfix"></li>
	    </form:form>
	 <div class="clear"></div>
	    <div class="advanced-search-form">
			<form:form id="searchForm" modelAttribute="link" action="${ctx}/cms/link/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		     <ul class="modal-body">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<li><span>栏目：</span>
					<label>
					<sys:treeselect id="category" name="category.id" value="${article.category.id}" labelName="category.name" labelValue="${article.category.name}"
								title="栏目" url="/cms/category/treeData" module="article" notAllowSelectRoot="false" cssClass="input-small"/></label>
		           </li>
					<li><span>标题：</span><form:input path="title" htmlEscape="false" maxlength="50" class="input-small"/>&nbsp;</label>
		           </li>
					<li>
					   <span>状态：</span>
					   <label>
					   <form:radiobuttons onclick="$('#searchForm').submit();" path="delFlag" items="${fns:getDictList('cms_del_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
		           </label>
		           </li>
		           <li class="fr">
		               <button class="btn btn-primary" id="btnSubmit"  type="submit"  onclick="return page();">提交筛选</button>
		           </li>          
			      </ul>
			      <div class="modal-footer">
			       
			      </div>
	       </form:form>
	     </div>
	     <div class="clear"></div>
	     <ul class="table-set-container">
	        <li class="tit">选中隐藏:</li> 
	     </ul>
	    </div>
	
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr><th>栏目</th><th>名称</th><th>权重</th><th>发布者</th><th>更新时间</th><shiro:hasPermission name="cms:link:edit"><th>操作</th></shiro:hasPermission></tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="link">
			<tr>
				<td><a href="javascript:" onclick="$('#categoryId').val('${link.category.id}');$('#categoryName').val('${link.category.name}');$('#searchForm').submit();return false;">${link.category.name}</a></td>
				<td><a href="${ctx}/cms/link/form?id=${link.id}" title="${link.title}">${fns:abbr(link.title,40)}</a></td>
				<td>${link.weight}</td>
				<td>${link.user.name}</td>
				<td><fmt:formatDate value="${link.updateDate}" type="both"/></td>
				<shiro:hasPermission name="cms:link:edit"><td>
    				<a href="${ctx}/cms/link/form?id=${link.id}">修改</a>
					<a href="${ctx}/cms/link/delete?id=${link.id}${link.delFlag ne 0?'&isRe=true':''}&categoryId=${link.category.id}" onclick="return confirmx('确认要${link.delFlag ne 0?'发布':'删除'}该链接吗？', this.href)" >${link.delFlag ne 0?'发布':'删除'}</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
	<div class="pagination">${page}</div>

</body>
</html>