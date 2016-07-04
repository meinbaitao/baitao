<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>文章管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		function viewComment(href){
			top.$.jBox.open('iframe:'+href,'查看评论',$(top.document).width()-220,$(top.document).height()-120,{
				buttons:{"关闭":true},
				loaded:function(h){
					$(".jbox-content", top.document).css("overflow-y","hidden");
					$(".nav,.form-actions,[class=btn]", h.find("iframe").contents()).hide();
					$("body", h.find("iframe").contents()).css("margin","10px");
				}
			});
			return false;
		}
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
	          <li ><a href="${ctx}/cms/article/?category.id=${article.category.id}" class="active"><span class="glyphicon glyphicon-list"></span>文章列表</a></li>
	          <shiro:hasPermission name="cms:article:edit"><li><a href="<c:url value='${fns:getAdminPath()}/cms/article/form?id=${article.id}&category.id=${article.category.id}'><c:param name='category.name' value='${article.category.name}'/></c:url>"><span class="glyphicon glyphicon-plus"></span>文章添加</a></li></shiro:hasPermission>
	        </ul>
		    <form:form id="searchForm" modelAttribute="article" action="${ctx}/cms/article/" method="post" class="breadcrumb form-search">
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
		 <form:form id="searchForm" modelAttribute="article" action="${ctx}/cms/article/" method="post" class="breadcrumb form-search">
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
		<thead><tr><th>栏目</th><th>标题</th><th>权重</th><th>点击数</th><th>发布者</th><th>更新时间</th><th>操作</th></tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="article">
			<tr>
				<td><a href="javascript:" onclick="$('#categoryId').val('${article.category.id}');$('#categoryName').val('${article.category.name}');$('#searchForm').submit();return false;">${article.category.name}</a></td>
				<td><a href="${ctx}/cms/article/form?id=${article.id}" title="${article.title}">${fns:abbr(article.title,40)}</a></td>
				<td>${article.weight}</td>
				<td>${article.hits}</td>
				<td>${article.user.name}</td>
				<td><fmt:formatDate value="${article.updateDate}" type="both"/></td>
				<td>
					<a href="${pageContext.request.contextPath}${fns:getFrontPath()}/view-${article.category.id}-${article.id}${fns:getUrlSuffix()}" target="_blank">访问</a>
					<shiro:hasPermission name="cms:article:edit">
						<c:if test="${article.category.allowComment eq '1'}"><shiro:hasPermission name="cms:comment:view">
							<a href="${ctx}/cms/comment/?module=article&contentId=${article.id}&delFlag=2" onclick="return viewComment(this.href);">评论</a>
						</shiro:hasPermission></c:if>
	    				<a href="${ctx}/cms/article/form?id=${article.id}">修改</a>
	    				<shiro:hasPermission name="cms:article:audit">
							<a href="${ctx}/cms/article/delete?id=${article.id}${article.delFlag ne 0?'&isRe=true':''}&categoryId=${article.category.id}" onclick="return confirmx('确认要${article.delFlag ne 0?'发布':'删除'}该文章吗？', this.href)" >${article.delFlag ne 0?'发布':'删除'}</a>
						</shiro:hasPermission>
					</shiro:hasPermission>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
	<div class="pagination">${page}</div>

</body>
</html>