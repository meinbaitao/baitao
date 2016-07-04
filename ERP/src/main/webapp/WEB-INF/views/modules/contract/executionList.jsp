<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>施工班组管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript" src="${ctxStatic}/modules/contract/scripts/execution.js?tsf=${jsVersion}"></script>
	<script type="text/javascript">
		var ctxPath="${ctx}";
		$(function(){
			form_validate("inputForm");
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
	<div class="list-content">
		<div class="nav-operate">
			<ul class="operationg-new" >
				<shiro:hasAnyRoles name="${fns:getWhitelistsList('sgbzgl')}">
				<li>
					<input id="addContract" class="btn btn-primary" type="button" value="添加">
					<!-- <input id="deleteContract" class="btn btn-primary" type="button" value="删除合同"> -->
				</li>
				</shiro:hasAnyRoles>
		    </ul>
			<form:form id="searchForm" modelAttribute="execution"
				action="${ctx}/contract/execution/list" method="post"
				class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden"
					value="${page.pageNo}" />
				<input id="pageSize" name="pageSize" type="hidden"
					value="${page.pageSize}" />
				<ul class="search">
					<li>
						<form:input path="search" htmlEscape="false" class="input-medium" placeholder="关键字"/></li>
					<li>
						<button class="search-btn" id="btnSubmit" type="submit">查询</button></li>
				</ul>
				<div class="clearfix"></div>
			</form:form>
		</div>
		
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>施工班组编号</th>
				<th>施工班组名称</th>
				<th>班组施工区域</th>
				<th>承接范围</th>
				<th>班组人数</th>
				<th>30天可施工面积</th>
				<th>代表人</th>
				<th>代表人联系方式</th>
				<th>班组等级</th>
				<th>备注信息</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="execution">
			<tr>
				<td>
					${execution.exeNo}
				</td>
				<td>
					<a href="${ctx}/contract/execution/form?id=${execution.id}" >${execution.name}</a>
				</td>
				<td>
					${execution.exeErea}
				</td>
				<td>
					${fns:getDictLabel(execution.exeType, 'executionType', '')}
				</td>
				<td>
					${execution.exeNumber}
				</td>
				<td>
					${execution.thirtyDayArea}
				</td>
				<td>
					${execution.name}
				</td>
				<td>
					${execution.delegateTel}
				</td>
				<td>
					${execution.exeLevel}
				</td>
				<td>
					${execution.remarks}
				</td>
				<td class="table-operate">
					<shiro:hasAnyRoles name="${fns:getWhitelistsList('sgbzgl')}">
						<a href="${ctx}/contract/execution/delete?id=${execution.id}" onclick="return confirmx('确认要删除该施工班组吗？', this.href)">删除</a>
					</shiro:hasAnyRoles>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>

	<div class="pagination">${page}</div>
</body>
</html>