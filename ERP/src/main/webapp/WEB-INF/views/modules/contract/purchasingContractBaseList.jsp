<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>采购合同管理</title>
	<meta name="decorator" content="default"/>
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
		
		function chooseContract(thiobj){
			var dirPath = thiobj.previousSibling.previousSibling.value;
			var selVal = thiobj.previousSibling.previousSibling.previousSibling.previousSibling.value;
			var url = dirPath+"&type="+selVal;
			window.location=url;
		}
	</script>
</head>
<body>
	<div class="list-content">
		<div class="nav-operate">
			<ul class="operationg-new" >
				<li>
<!--					<input id="addContract" class="btn btn-primary" type="button" value="添加合同">
 					<input id="deleteContract" class="btn btn-primary" type="button" value="删除合同"> -->
				</li>
		    </ul>
			<form:form id="searchForm" modelAttribute="purchasingContractBase"
				action="${ctx}/contract/purchasingContractBase/list" method="post"
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
				<th style="width: 20%">合同编号</th>
				<th style="width: 20%">供应商名称</th>
				<th style="width: 10%">结算方式</th>
				<th style="width: 10%">合同开始时间</th>
				<th style="width: 10%">合同结束时间</th>
				<th style="width: 10%">合同状态</th>
				<th style="width: 5%">审批状态</th>
				<th style="width: 35%">操作</th>
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
					${purchasingContractBase.supp.name}
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
					<shiro:hasAnyRoles name="${fns:getWhitelistsList('scysht')}">
						<a href="${ctx}/contract/purchasingContractBase/delete?id=${purchasingContractBase.id}" onclick="return confirmx('确认要删除该采购合同吗？', this.href)">删除</a>
						&nbsp;&nbsp;
					</shiro:hasAnyRoles>
					<span>合同选择</span>
						<select style="width:230px;" class="contractChoose">
						  <option value ="0" selected = "selected"></option>
						  <option value ="1">采购基本合同（工程辅料类）</option>
						  <option value ="2">采购基本合同（其他类）</option>
						  <option value ="3">采购基本合同（生产辅料木材类）</option>
						  <option value ="4">石材承揽基本合同（石材成品）</option>
						  <option value ="5">石材类承揽基本合同（加工类）</option>
						</select>
						<input type="hidden" class="dirPath" value="${ctx}/contract/contractPrint/purchasecontract?id=${purchasingContractBase.id}">
						<input type="button" onclick="chooseContract(this)" value="打印">
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