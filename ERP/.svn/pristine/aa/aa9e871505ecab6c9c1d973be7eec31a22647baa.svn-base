<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>项目周报管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript" src="${ctxStatic }/jquery-plugin/multiselect/js/multiselect.min.js"></script>
	<script type="text/javascript" src="${ctxStatic }/modules/report/weekly/projectWeeklyReport.js?tsf=${jsVersion}" ></script>
	<script type="text/javascript">
		$(document).ready(function() {
			/* $.each($("input[name*='dataType']"),function(index, obj){
				$(obj).on("click", function(e){
					if(e.target.value==1){
						window.location.href=startUp.getRootPath() + '/a/report/weekly/mainly/projWeeklyReport/findMyWeekReport';
					}else if(e.target.value==2){
						window.location.href=startUp.getRootPath() + '/a/report/weekly/mainly/projWeeklyReport/findUnAuditWeekReport';
					}else if(e.target.value==3){
						window.location.href=startUp.getRootPath() + '/a/report/weekly/mainly/projWeeklyReport/findAuditDoneWeekReport';
					}
				});
			}); */
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
			<ul class="act">
				<li><input type="radio" name="actRadio" value="1" checked="checked"/>我发起</li>
				<li><input type="radio" name="actRadio" value="2" />待审批</li>
				<li><input type="radio" name="actRadio" value="3" />所有</li>
			</ul>
	        <form:form id="searchForm" modelAttribute="projWeeklyReport" action="${ctx}/report/weekly/mainly/projWeeklyReport/findMyWeekReport" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        <ul class="search">
		            <li>
		               <form:input id="projectname" path="project.name" htmlEscape="false" maxlength="200" class="input-medium" placeholder="关键字"/>
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
					<th>项目简称</th>
					<th>苑区</th>
					<th>状态</th>
				    <th>操作</th>
				</tr>
			</thead>
		<tbody>
			<c:forEach items="${page.list}" var="obj" varStatus="1">
				<tr pid="0" id="project${obj.projectId}" class="0 first-level" haschild="true" previd="" islastone="true" depth="1">
					<td>
						${obj.projectName}
					</td>
					<td>${obj.project.code}</td>
					<td>${obj.project.location}</td>
					<c:if test="${empty obj.project.workflowstatus}">
						<td>待提交</td>
					</c:if>
					<c:if test="${obj.project.workflowstatus eq '1'}">
						<td>待审核</td>
					</c:if>
					<c:if test="${obj.project.workflowstatus eq '4'}">
						<td>已完成</td>
					</c:if>
					<td>
						<shiro:hasAnyRoles name="${fns:getWhitelistsList('xmzb')}">
						<a href="${ctx}/report/weekly/mainly/projWeeklyReport/gateway/projectId/${obj.project.id}">填写周报</a>/
						</shiro:hasAnyRoles>
						<a href="${ctx}/report/weekly/mainly/projWeeklyReport/reportListFirstTime/${obj.project.id}">周报历史记录</a>
					</td>
				 </tr>
			 </c:forEach>
			</tbody>
		</table>
	</div>
<div class="pagination">${page}</div>

</body>
</html>