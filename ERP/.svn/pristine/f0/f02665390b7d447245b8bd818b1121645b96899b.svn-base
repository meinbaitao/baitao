<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>项目管理</title>
	<meta name="decorator" content="default"/>
<%-- 	<script src="${ctxStatic}/modules/project/scripts/project.js" type="text/javascript"></script> --%>
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
			<ul class="operationg-new" >
				<li>
<!-- 					<input id="addProject" class="btn btn-primary" type="button" value="添加项目"> -->
<!-- 					<input id="deleteProject" class="btn btn-primary" type="button" value="删除项目"> -->
				</li>
		    </ul>
	        <form:form id="searchForm" modelAttribute="viewContractProgress" action="${ctx}/viewcontractprogress/viewContractProgress/list" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        <ul class="search">
		            <li>
		               <form:input path="pname" htmlEscape="false" maxlength="200" class="input-medium" placeholder="关键字"/>
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
<!-- 			    	<th class="all-check" > -->
<!-- 					    <input type="checkbox" id="all-check"> -->
<!-- 					    <label for="all-check">选择</label> -->
<!-- 					</th> -->
					<th>项目名称</th>
					<th>项目简称</th>
<!-- 					<th>苑区</th> -->
<!-- 					<th>业务板块</th> -->
<!-- 					<th>省份</th> -->
<!-- 					<th>城市</th> -->
<!-- 					<th>县区</th> -->
<!-- 					<th>计划开工时间</th> -->
<!-- 					<th>计划完工时间</th> -->
					<th>状态</th>
				</tr>
			</thead>
		<tbody>
			<c:forEach items="${page.list}" var="project" varStatus="1">
				<tr pid="0" id="project${project.id}" class="0 first-level" haschild="true" previd="" islastone="true" depth="1">
<%-- 					<td class="check"><input type="checkbox" id="${project.id}" name="chkproject">  </td> --%>
					<td>
						<!-- ${ctx}/oa/oaNotify/${requestScope.oaNotify.self?'view':'form'}?id=${oaNotify.id} -->
						<a href="${ctx}/viewcontractprogress/viewContractProgress/view?id=${project.id}">
							${project.name}
						</a>
					</td>
					<td>${project.code}</td>
<%-- 					<td>${project.location}</td> --%>
<%-- 					<td>${project.businessLine}</td> --%>
<%-- 					<td>${project.province}</td> --%>
<%-- 					<td>${project.city}</td> --%>
<%-- 					<td>${project.town}</td> --%>
<%-- 					<td>${project.startTime}</td> --%>
<%-- 					<td>${project.endTime}</td> --%>
					<c:if test="${empty project.workflowstatus}">
						<td>待提交</td>
					</c:if>
					<c:if test="${project.workflowstatus eq '1'}">
						<td>待审核</td>
					</c:if>
					<c:if test="${project.workflowstatus eq '4'}">
						<td>已完成</td>
					</c:if>
				 </tr>
			 </c:forEach>
			</tbody>
		</table>
	</div>
<div class="pagination">${page}</div>

</body>
</html>