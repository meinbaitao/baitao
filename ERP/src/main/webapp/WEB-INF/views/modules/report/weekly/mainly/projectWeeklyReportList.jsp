<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>项目周报列表</title>
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
				<li>
					<input id="btnCancel" class="btn btn-primary" type="button" value="返 回" onclick="history.go(-1)"/>
				</li>
		    </ul>
	        <form:form id="searchForm" modelAttribute="projWeeklyReport" action="${ctx}/report/weekly/mainly/projWeeklyReport/reportList" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<form:hidden path="projectId" />
		       <div class="clearfix"></div>
		     </form:form>
		     <div class="clear"></div>
	     </div>
	  <sys:message content="${message}"/>
	  <table id="contentTable" class="table table-striped table-bordered table-condensed resize table-eidt">
			<thead>
			   <tr>
					<th>项目名称</th>
					<th>项目负责人</th>
				   <th>周报起始日期</th>
				   <th>周报截止日期</th>
				    <th>周序号</th>
				    <th>流程状态</th>
				    <th>操作</th>
				</tr>
			</thead>
		<tbody>
			<c:forEach items="${page.list}" var="report" varStatus="1">
				<tr pid="0"  class="0 first-level" haschild="true" previd="" islastone="true" depth="1">
					<td>
						${report.projectName}
					</td>
					<td>${report.projResponsPeopleName}</td>
					<td><fmt:formatDate value="${report.reportBeginDate}" pattern="yyyy-MM-dd" /></td>
					<td><fmt:formatDate value="${report.reportEndDate}" pattern="yyyy-MM-dd" /></td>
					<td>${report.weekSerialNum}</td>
					<td>
						<c:choose>
							<c:when test="${report.workflowstatus eq '1'}" >新建流程</c:when>
							<c:when test="${report.workflowstatus eq '2'}" >流程进行中</c:when>
							<c:when test="${report.workflowstatus eq '3'}" >流程被驳回结束</c:when>
							<c:when test="${report.workflowstatus eq '4'}" >流程结束</c:when>
							<c:otherwise>流程未启动</c:otherwise>
						</c:choose>
					</td>
					<td>
						<a href="${ctx}/report/weekly/mainly/projWeeklyReport/initializeEditView/${report.id}" >查看周报</a>
					</td>
				 </tr>
			 </c:forEach>
			</tbody>
		</table>
	</div>
<div class="pagination">${page}</div>

</body>
</html>