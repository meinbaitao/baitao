<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>项目管理</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/modules/project2area/scripts/project2area.js?tsf=${jsVersion}" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		function deleteData(object){
			window.confirmx('确认要删除？',function(){
				url = "/a/project2area/delete?id="+object.name;
				startUp.getAsyncData(url,function(data){
					 window.location.href=startUp.getRootPath()+"/a/project2area/list";
				});
			});
		}
		
	</script>
</head>
<body>
	<div class="list-content" >
		<div class="nav-operate" >
			<ul class="operationg-new" >
				<li>
					<input id="addProject2area" class="btn btn-primary" type="button" value="添加">
				</li>
		    </ul>
	        <form:form id="searchForm" modelAttribute="project2area" action="${ctx}/project2area/list" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        <ul class="search">
		            <li>
		               <form:input path="proCode" htmlEscape="false" maxlength="200" class="input-medium" placeholder="关键字"/>
		            </li>
		            <li>
		            	<input id="searchProject2area" type="submit" name="查询" value="查询" class="search-btn"/>
		            </li>
		        </ul>
		       <div class="clearfix"></div>
		     </form:form>
		     <div class="clear"></div>
	     </div>
	 <%--  <sys:message content="${message}"/> --%>
	  <table id="contentTable" class="table table-striped table-bordered table-condensed resize table-eidt">
			<thead>
			   <tr>
					<th width="30%">项目简称</th>
					<th width="30%">区域编号</th>
					<th width="30%">区域名称</th>
					<th width="10%">操作</th>
				</tr>
			</thead>
		<tbody>
			<c:forEach items="${page.list}" var="project2area" varStatus="1">
				<tr pid="0" id="${project2area.id}" class="0 first-level" haschild="true" previd="" islastone="true" depth="1">
					<td>${project2area.proCode}</td>
					<td>${project2area.areaNo}</td>
					<td>${project2area.areaName}</td>
					<td>
					<a href="${ctx}/project2area/update?id=${project2area.id}">修改</a>
					<a href="#" name="${project2area.id}" onclick="deleteData(this)">删除</a>
					</td>
				 </tr>
			 </c:forEach>
			</tbody>
		</table>
	</div>
<div class="pagination">${page}</div>

</body>
</html>