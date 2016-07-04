<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>项目管理</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/modules/project/scripts/project.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$.each($("input[name*='dataType']"),function(index, obj){
				$(obj).on("click", function(e){
					if(e.target.value==1){
						window.location.href= startUp.getRootPath() + '/a/project/list';
					}else if(e.target.value==3){
						window.location.href=startUp.getRootPath() + '/a/project/findAuditDoneProjects';
					}
				});
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
			<ul class="act" >
				<li><input type="radio" name="dataType"  value="1" />我发起</li>
				<li><input type="radio" name="dataType" checked="checked" value="2" />我审批</li>
				<li><input type="radio" name="dataType" value="3" />所有</li>
			</ul>

	        <form:form id="searchForm" modelAttribute="project" action="${ctx}/project/findUnAuditProjects" method="post" class="breadcrumb form-search">
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
			    	<th class="all-check" >
					    <input type="checkbox" id="all-check">
					    <label for="all-check">选择</label>
					</th>
					<th>省份</th>
					<th>城市</th>
					<th>县区</th>
					<th>项目名称</th>
					<th>项目简称</th>
					<th>苑区</th>
					<th>业务板块</th>
					<th>计划开工时间</th>
					<th>计划完工时间</th>
					<th>状态</th>
				</tr>
			</thead>
		<tbody>
			<c:forEach items="${page.list}" var="project" varStatus="1">
				<tr pid="0" id="project${project.id}" class="0 first-level" haschild="true" previd="" islastone="true" depth="1">
					<td class="check"><input type="checkbox" id="${project.id}" name="chkproject">  </td>
					<td>${project.province}</td>
					<td>${project.city}</td>
					<td>${project.town}</td>
					<td>
						<!-- ${ctx}/oa/oaNotify/${requestScope.oaNotify.self?'view':'form'}?id=${oaNotify.id} -->
						<a href="${ctx}/project/view?id=${project.id}">
							${project.name}
						</a>
					</td>
					<td>${project.code}</td>
					<td>${project.location}</td>
					<td>${project.businessLine}</td>
					<td>${project.startTime}</td>
					<td>${project.endTime}</td>
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