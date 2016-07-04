<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>辅料运输合同管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript" src="${ctxStatic}/modules/contract/scripts/common_contract.js"></script>
	<script type="text/javascript" src="${ctxStatic}/common/common_service.js"></script>
	<script>
		var ctxPath="${ctx}";
	</script>
</head>
<body>
	<div class="list-content">
		<div class="nav-operate">
			<ul class="act">
				<li><input type="radio" name="actRadio" value="1" attrUrl="${ctx}/contract/accCarriageContractBase/findMyAccCarriageContractBase" />我发起</li>
				<li><input type="radio" name="actRadio" value="2" attrUrl="${ctx}/contract/accCarriageContractBase/findUnAuditAccCarriageContractBase" />我审批</li>
				<li><input type="radio" name="actRadio" value="3" attrUrl="${ctx}/contract/accCarriageContractBase/findAuditDoneAccCarriageContractBase" checked="checked"/>所有</li>
			</ul>
			<form:form id="searchForm" modelAttribute="accCarriageContractBase"
				action="${ctx}/contract/accCarriageContractBase/findAuditDoneAccCarriageContractBase" method="post"
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
			</form:form>
			
			<div class="clear"></div>
			
		</div>
		<sys:message content="${message}"/>
		<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
<!-- 				<th>合同类型</th> -->
				<th>合同编号</th>
				<th>结算方式</th>
				<th>支付方式</th>
				<th>合同开始时间</th>
				<th>合同结束时间</th>
<!-- 				<th>合同状态</th> -->
				<th>审批状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="accCarriageContractBase">
			<tr>
<%-- 				<td>
					${fns:getDictLabel(accCarriageContractBase.contractType, 'accCarriageContractType', '')}
				</td> --%>
				<td>
					<a href="${ctx}/contract/accCarriageContractBase/form?id=${accCarriageContractBase.id}" >${accCarriageContractBase.contractNo}</a>
				</td>
				<td>
					${fns:getDictLabel(accCarriageContractBase.settlementType, 'settlementType', '')}
				</td>
				<td>
					${fns:getDictLabel(accCarriageContractBase.paymentType, 'paymentType', '')}
				</td>
				<td>
					${accCarriageContractBase.startTime}
				</td>
				<td>
					${accCarriageContractBase.endTime}
				</td>
<%-- 				<td>
					${fns:getDictLabel(accCarriageContractBase.statue, 'contractStatue', '')}
				</td> --%>
				<td>
				<c:choose>
					<c:when test="${accCarriageContractBase.workflowstatus eq '1'}">
						待审核
					</c:when>
					<c:when test="${accCarriageContractBase.workflowstatus eq '4'}">
						已完成
					</c:when>
					<c:otherwise>待提交</c:otherwise>			
				</c:choose>		
				</td>
				<td>
					<a href="${ctx}/contract/accCarriageContractBase/delete?id=${accCarriageContractBase.id}" onclick="return confirmx('确认要删除该生产合同吗？', this.href)">删除</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	<div class="pagination" >${page}</div>
	
</body>
</html>