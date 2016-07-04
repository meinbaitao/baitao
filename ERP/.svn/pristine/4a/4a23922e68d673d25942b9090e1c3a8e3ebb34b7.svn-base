<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>采购合同管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript" src="${ctxStatic}/modules/contract/scripts/common_contract.js "></script>
	<script src="${ctxStatic}/common/common_service.js" type="text/javascript"></script>
	<script>
		$(function(){
			var ctxPath="${ctx}";
			//点击添加合同
			$("#addContract").on("click",function(){
				 window.location.href=ctxPath+"/contract/purchasingContractBase/form";
			});
		});
		//分页
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
			<ul class="act">
				<li><input type="radio" name="actRadio" value="1" attrUrl="${ctx}/contract/purchasingContractBase/findMyPurchasingContractBase" checked="checked"/>我发起</li>
				<li><input type="radio" name="actRadio" value="2" attrUrl="${ctx}/contract/purchasingContractBase/findUnAuditPurchasingContractBase" />我审批</li>
				<li><input type="radio" name="actRadio" value="3" attrUrl="${ctx}/contract/purchasingContractBase/findAuditDonePurchasingContractBase" />所有</li>
			</ul>
			<form:form id="searchForm" modelAttribute="purchasingContractBase"
				action="${ctx}/contract/purchasingContractBase/findMyPurchasingContractBase" method="post"
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
		</div>
		
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
			    
<!-- 				<th>合同类型</th> -->
				<th>合同编号</th>
				<th>结算方式</th>
				<th>合同开始时间</th>
				<th>合同结束时间</th>
				<th>合同状态</th>
				<th>审批状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="purchasingContractBase">
			<tr>
<%-- 				<td>
					${fns:getDictLabel(purchasingContractBase.contractType, 'purchasingContractType', '')}
				</td> --%>
				<td>
					<a href="${ctx }/contract/purchasingContractBase/form?id=${purchasingContractBase.id}">${purchasingContractBase.contractNo}</a>
				</td>
				<td>
					${purchasingContractBase.settlementType}
				</td>
				<td>
					${purchasingContractBase.startTime}
				</td>
				<td>
					${purchasingContractBase.endTime}
				</td>
				<td>
					${fns:getDictLabel(purchasingContractBase.statue, 'contractStatue', '')}
				</td>
				<td>
				<c:choose>
					<c:when test="${purchasingContractBase.workflowstatus eq '1'}">
						待审核
					</c:when>
					<c:when test="${purchasingContractBase.workflowstatus eq '4'}">
						已完成
					</c:when>
					<c:otherwise>待提交</c:otherwise>
				</c:choose>
				</td>
				<td class="table-operate">
					<a href="${ctx}/contract/purchasingContractBase/delete?id=${purchasingContractBase.id}" onclick="return confirmx('确认要删除该采购合同吗？', this.href)">删除</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	
	<div class="appoint-saider" id="appoint-saider3">
	</div>
	
	<div class="pagination">${page}</div>
</body>
</html>