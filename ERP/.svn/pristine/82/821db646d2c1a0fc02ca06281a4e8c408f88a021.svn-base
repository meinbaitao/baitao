<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>合同台账管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript" src="${ctxStatic}/modules/contract/scripts/common_contract.js"></script>
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
			<form:form id="searchForm" modelAttribute="contractAccount"
				action="${ctx}/contract/contractAccount/list" method="post"
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
			
			<div class="clear"></div>
			
		</div>
		<div class="table_scroll" style="margin-bottom:200px;">
			<sys:message content="${message}"/>
			<table id="contentTable" class="table table-striped table-bordered table-condensed table_scroll">
				<thead>
					<tr>
						<th>一级类别</th>
						<th>二级类别</th>
						<th>三级类别</th>
						<th>供应商</th>
						<th>供应商简称</th>
						<th>合同生效时间</th>
						<th>合同到期时间</th>
						<th>有效期内 </th>
						<th>合同审批状态</th>
						<th>合同编码</th>
						<th>合同总价</th>
						<th>发票类型</th>
						<th>税率</th>
						<th>含运费(是/否)</th>
						<th>结算方式</th>
						<th>支付方式</th>
						<th>付款进度</th>
						<th>质保金</th>
						<th>履约保证金</th>
						<th>发起人</th>
					</tr>
				</thead>
				<tbody>
			<c:forEach items="${page.list}" var="contractAccount">
				<tr>
					<td>
						${contractAccount.contractType}
					</td>
					<td>
						${contractAccount.fristType}
					</td>
					<td>
						${contractAccount.secondType}
					</td>
					<td>
						${contractAccount.partyBName}
					</td>
					<td>
						${contractAccount.partyBCode}
					</td>
					<td>
						${contractAccount.startTime}
					</td>
					<td>
						${contractAccount.endTime}
					</td>
					<td>
						${contractAccount.isValid}
					</td>
					<td>
						<c:choose>
							<c:when test="${contractAccount.workflowstatus eq '1'}">
								待审核
							</c:when>
							<c:when test="${contractAccount.workflowstatus eq '4'}">
								已审批
							</c:when>
							<c:otherwise>待提交</c:otherwise>			
						</c:choose>
					</td>
					<td>
						${contractAccount.contractNo}
					</td>
					<td>
						${contractAccount.contractPrice}
					</td>
					<td>
						${contractAccount.invoiceType}
					</td>
					<td>
						${contractAccount.taxRate}
					</td>
					<td>
						${fns:getDictLabel(contractAccount.isIncludeCarriage, 'yes_no', '')}
					</td>
					<td>
						${contractAccount.settlementType}
					</td>
					<td>
						${contractAccount.paymentType}
					</td>
					<td>
						${contractAccount.paymentProgress}
					</td>
					<td>
						${contractAccount.qualityGuaranteePrice}
					</td>
					<td>
						${contractAccount.executeGuaranteePrice}
					</td>
					<td>
						${contractAccount.lanuchPerson}
					</td>
				</tr>
			</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="pagination">${page}</div>
</body>
</html>