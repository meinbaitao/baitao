<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>业务表管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			if(n) $("#pageNo").val(n);
			if(s) $("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
<div class="list-content" >
	    <div class="nav-operate" >
	        <ul class="operationg-new" >
	          <li ><a href="${ctx}/gen/genTable/" class="active"><span class="glyphicon glyphicon-list"></span>业务表列表</a></li>
	          <shiro:hasPermission name="gen:genTable:edit"><li><a href="${ctx}/gen/genTable/form"><span class="glyphicon glyphicon-plus"></span>业务表添加</a></li></shiro:hasPermission>
	        </ul>
	        <form:form id="searchForm" modelAttribute="genTable" action="${ctx}/gen/genTable/" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
				 <ul class="search">
		            <li>
		               <label>根据：</label>
		               <select class="input-small">
						  <option>表名&nbsp;&nbsp;</option>
						  <option>说明</option>
						  <option>父表表名</option>
						</select>
		            </li>
		            <li class="input">
			               <i class="input-show"><form:input path="nameLike" htmlEscape="false" maxlength="50" class="input-small"/></i>
			               <i><form:input path="comments" htmlEscape="false" maxlength="50" class="input-small"/></i>
							<i><form:input path="parentTable" htmlEscape="false" maxlength="50" class="input-small"/></i>
							
			        </li>
		            <li><button class="search-btn" id="btnSubmit"  type="submit"  onclick="return page();">筛选</button></li>
		            <li><button class="search-btn icon" id="advanced-search-btn"  type="button"  >高级筛选<i></i></button></li>
		            <li><button class="search-btn" id="table-set"  type="button"  >表格显示</button></li>
		          </ul>
		          <div class="clearfix"></div>
			</form:form>
			<div class="clear"></div>
			   <div class="advanced-search-form">
				  <form:form id="searchForm" modelAttribute="genTable" action="${ctx}/gen/genTable/" method="post" class="breadcrumb form-search">
				        <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				        <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				        <ul class="modal-body">
				           <li>
				               <span>表名：</span>
				               <label><form:input path="nameLike" htmlEscape="false" maxlength="50" class="input-small"/></label>
				           </li>
				           <li>
				               <span>说明：</span>
				               <label> 
				               <form:input path="comments" htmlEscape="false" maxlength="50" class="input-small"/>
							  </label>
				           </li>
				           <li>
				               <span>父表表名：</span>
				               <label>
									<form:input path="parentTable" htmlEscape="false" maxlength="50" class="input-small"/>
							</label>
				           </li>
				           
				           <li class="clear clearfix"></li>
				           <li class="fr"><button class="btn btn-primary" id="btnSubmit"  type="submit"  onclick="return page();">提交筛选</button></li>          
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
		<thead><tr><th class="sort-column name">表名</th><th>说明</th><th class="sort-column class_name">类名</th><th class="sort-column parent_table">父表</th><shiro:hasPermission name="gen:genTable:edit"><th>操作</th></shiro:hasPermission></tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="genTable">
			<tr>
				<td><a href="${ctx}/gen/genTable/form?id=${genTable.id}">${genTable.name}</a></td>
				<td>${genTable.comments}</td>
				<td>${genTable.className}</td>
				<td title="点击查询子表"><a href="javascript:" onclick="$('#parentTable').val('${genTable.parentTable}');$('#searchForm').submit();">${genTable.parentTable}</a></td>
				<shiro:hasPermission name="gen:genTable:edit"><td>
    				<a href="${ctx}/gen/genTable/form?id=${genTable.id}">修改</a>
					<a href="${ctx}/gen/genTable/delete?id=${genTable.id}" onclick="return confirmx('确认要删除该业务表吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
	<div class="pagination">${page}</div>

</body>
</html>
