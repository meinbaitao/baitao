<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>人员汇总</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/modules/project/scripts/project.js?tsf=${jsVersion}" type="text/javascript"></script>
	<script type="text/javascript"  src="${ctxStatic}/common/common_service.js" ></script>
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
	        <form:form id="searchForm" modelAttribute="project" action="${ctx}/project/projectinfo?type=4" method="post" class="breadcrumb form-search">
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
	  <table id="contentTable" class="table table-striped table-bordered table-condensed resize table-eidt width-75">
			<thead>
			   <tr>
					<th>项目名称</th>
					<th>项目简称</th>
					<th>业务板块</th>
					<th>苑区</th>
				</tr>
			</thead>
			<tbody id="projectList">
				<c:forEach items="${page.list}" var="project" varStatus="1">
					<tr>
						<td style="cursor:pointer"><a style="display:block;" flag="projectName" value="${project.id }">
							${project.name}</a>
						</td>
						<td>${project.code}</td>
						<td>${project.businessLine}</td>
						<td>${project.location}</td>
					 </tr>
			 	 </c:forEach>
			</tbody>
		</table>
		<div class="div_right">
		 <table >
		 	<thead>
		 		<tr>
		 			<th style="width:20px;">人员类型</th>
		 			<th style="width:80px;">人员姓名-联系方式</th>
		 		</tr>
		 	</thead>
		 	<tbody id="personList"></tbody>
		 </table>
	   </div>
	   <div class="clear"></div>
	</div>
<div class="pagination">${page}</div>

</body>
</html>