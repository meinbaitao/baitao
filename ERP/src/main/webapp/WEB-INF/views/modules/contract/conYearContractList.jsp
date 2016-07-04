<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>年度合同管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript" src="${ctxStatic}/modules/contract/scripts/yearContract.js?tsf=${jsVersion}"></script>
	<script type="text/javascript">
    	var ctxPath="${ctx}";
    </script>
</head>
<body>
	<div class="list-content">
		
		<div class="nav-operate">
			<ul class="operationg-new" >
				<li>
					<input id="addContract" class="btn btn-primary" type="button" value="添加合同">
<!-- 					<input id="deleteContract" class="btn btn-primary" type="button" value="删除合同"> -->
				</li>
		    </ul>
			<form:form id="searchForm" modelAttribute="conYearContract"
				action="${ctx}/contract/conYearContract/list" method="post"
				class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden"
					value="${page.pageNo}" />
				<input id="pageSize" name="pageSize" type="hidden"
					value="${page.pageSize}" />
				<ul class="search">
					<li><select class="input-small">
							<option>合同编号</option>
							<option>合同类别</option>
							<option>班组类别</option>
					</select></li>
					<li class="input">
						<i> <form:input path="contractNo"
								htmlEscape="false" maxlength="50" class="input-small" /></i> 
						<i> <form:input path="conType"
								htmlEscape="false" maxlength="50" class="input-small" /></i> 
						<i> <form:input path="exeType"
								htmlEscape="false" maxlength="50" class="input-small" /></i> 
					<li>
						<button class="search-btn" id="btnSubmit" type="submit">查询</button>
					</li>
				</ul>
			</form:form>
		</div>
		
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>合同编号</th>
				<th>乙方施工班组</th>
				<th>乙方代表人</th>
				<th>合同期限</th>
				<th>终止日期</th>
				<th>审批状态</th>
				<th>合同状态</th>
				<th>备注信息</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="conYearContract">
			<tr>
				<td>
					<a href="${ctx}/contract/conYearContract/form?id=${conYearContract.id}" >${conYearContract.contractNo}</a>	
				</td>
				<td>
					${conYearContract.name}
				</td>
				<td>
					${conYearContract.person}
				</td>
				<td>
					${fns:getDictLabel(conYearContract.limitDate, 'contractLimit', '')}
				</td>
				<td>
					${conYearContract.endDate}
				</td>
				<td>
					<c:choose>
						<c:when test="${conYearContract.workflowstatus eq '1'}">
							待审核
						</c:when>
						<c:when test="${conYearContract.workflowstatus eq '4'}">
							已完成
						</c:when>
						<c:otherwise>待提交</c:otherwise>
					</c:choose>
				</td>
				<td>
					${fns:getDictLabel(conYearContract.conStatus, '', '')}
				</td>
				<td>
					${conYearContract.remarks}
				</td>
			   <td class="table-operate">
					<a href="${ctx}/contract/conYearContract/delete?id=${conYearContract.id}" onclick="return confirmx('确认要删除该年度合同吗？', this.href)">删除</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	<div class="pagination">${page}</div>
	
</body>
</html>