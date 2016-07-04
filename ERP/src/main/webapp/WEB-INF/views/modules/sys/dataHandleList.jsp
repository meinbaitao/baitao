<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>数据操作记录管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(function() {

	});
	function page(n, s) {
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
		return false;
	}
</script>
</head>
<body>

	<div class="list-content">
		<div class="nav-operate">

			<form:form id="searchForm" action="${ctx}/sys/dataHandle/"
				method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden"
					value="${page.pageNo}" />
				<input id="pageSize" name="pageSize" type="hidden"
					value="${page.pageSize}" />
				<ul class="search">
					<li><label>操作菜单：</label><input id="menu" name="menu"
						type="text" maxlength="50" class="input-mini"
						value="${dataHandle.menu}" /></li>
					<li><label>用户名：</label><input id="userName" name="userName"
						type="text" maxlength="50" class="input-mini"
						value="${dataHandle.createBy.name}" /></li>
					<li><label>操作：</label><input id="method" name="method"
						type="text" maxlength="50" class="input-mini"
						value="${dataHandle.method}" /></li>
					<li><label>日期范围：&nbsp;</label><input id="beginDate"
						name="beginDate" type="text" readonly="readonly" maxlength="20"
						class="input-mini Wdate"
						value="<fmt:formatDate value="${dataHandle.beginDate}" pattern="yyyy-MM-dd"/>"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" /></li>
					<li><label>&nbsp;--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input
						id="endDate" name="endDate" type="text" readonly="readonly"
						maxlength="20" class="input-mini Wdate"
						value="<fmt:formatDate value="${dataHandle.endDate}" pattern="yyyy-MM-dd"/>"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />&nbsp;&nbsp;</li>
					<li><label for="exception"><input id="exception"
							name="exception" type="checkbox"
							${dataHandle.exception eq '1'?' checked':''} value="1" />只查询异常信息</label></li>
					<li><input id="btnSubmit" class="search-btn" type="submit"
						value="查询" /></li>
				</ul>
			</form:form>
		</div>
		<sys:message content="${message}" />
		<table id="contentTable"
			class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th>操作菜单</th>
					<th>操作用户</th>
					<th>所在公司</th>
					<th>所在部门</th>
					<th>操作</th>
					<th>操作数据</th>
					<th>操作者IP</th>
					<th>操作时间</th>
			</thead>
			<tbody>
				<%
					request.setAttribute("strEnter", "\n");
					request.setAttribute("strTab", "\t");
				%>
				<c:forEach items="${page.list}" var="dataHandle">
					<tr>
						<td>${dataHandle.menu}</td>
						<td>${dataHandle.createBy.name}</td>
						<td>${dataHandle.createBy.company.name}</td>
						<td>${dataHandle.createBy.office.name}</td>
						<td>${dataHandle.method}</td>
						<td>${dataHandle.params}</td>
						<td>${dataHandle.remoteAddr}</td>
						<td><fmt:formatDate value="${dataHandle.createDate}"
								type="both" /></td>
					</tr>
					<c:if test="${not empty dataHandle.exception}">
						<tr>
							<td colspan="8"
								style="word-wrap: break-word; word-break: break-all;">
								<%-- 					用户代理: ${dataHandle.userAgent}<br/> --%> <%-- 					提交参数: ${fns:escapeHtml(dataHandle.params)} <br/> --%>
								异常信息: <br />
								${fn:replace(fn:replace(fns:escapeHtml(dataHandle.exception), strEnter, '<br/>'), strTab, '&nbsp; &nbsp; ')}
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="pagination">${page}</div>
</body>
</html>