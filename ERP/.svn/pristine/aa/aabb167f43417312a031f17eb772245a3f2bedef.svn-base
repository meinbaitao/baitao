<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>项目管理</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/modules/datatrack/scripts/datatrack.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#dataHandle").on("click",function(){
				 window.location.href=startUp.getRootPath()+"/a/sys/dataHandle";
			});
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
	        <form:form id="searchForm" modelAttribute="project" action="${ctx}/datatrack/list" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        <ul class="search">
		            <li>
		               <form:input path="name" htmlEscape="false" maxlength="200" class="input-medium" placeholder="关键字"/>
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
	  <table id="contentTable" class="table table-striped table-bordered table-condensed resize table-eidt">
			<thead>
			   <tr>
					<th>项目名称</th>
					<th>省份</th>
					<th>城市</th>
					<th>县区</th>
					<th>项目简称</th>
					<th>苑区</th>
					<th>业务板块</th>
				</tr>
			</thead>
		<tbody>
			<c:forEach items="${page.list}" var="project" varStatus="1">
				<tr pid="0" id="project${project.id}" class="0 first-level" haschild="true" previd="" islastone="true" depth="1">
					<td>
						<!-- ${ctx}/oa/oaNotify/${requestScope.oaNotify.self?'view':'form'}?id=${oaNotify.id} -->
						<a href="${ctx}/datatrack/view?id=${project.id}">
							${project.name}
						</a>
					</td>
					<td>${project.province}</td>
					<td>${project.city}</td>
					<td>${project.town}</td>
					<td>${project.code}</td>
					<td>${project.location}</td>
					<td>${project.businessLine}</td>
					
				 </tr>
			 </c:forEach>
			</tbody>
		</table>
	</div>
<div class="pagination">${page}</div>

</body>
</html>