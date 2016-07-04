<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>石材运输合同管理</title>
	<meta name="decorator" content="default"/>
	<script>
	$(function(){
		var ctxPath="${ctx}";
		//点击添加合同
		$("#addContract").on("click",function(){
			 window.location.href=ctxPath+"/contract/stoneCarriageContractBase/form";
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
			<ul class="operationg-new" >
				<li>
<!--					<input id="addContract" class="btn btn-primary" type="button" value="添加合同">
 					<input id="deleteContract" class="btn btn-primary" type="button" value="删除合同"> -->
				</li>
		    </ul>
			<form:form id="searchForm" modelAttribute="stoneCarriageContractBase"
				action="${ctx}/contract/stoneCarriageContractBase/list" method="post"
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
		<sys:message content="${message}"/>
		<table id="contentTable" class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
<!-- 					<th>合同类型</th> -->
					<th>合同编号</th>
					<th>供应商名称</th>
					<th>结算方式</th>
					<th>合同开始时间</th>
					<th>合同结束时间</th>
<!-- 					<th>同合状态</th> -->
					<th>审批状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${page.list}" var="stoneCarriageContractBase">
				<tr>
<%-- 					<td>
						${fns:getDictLabel(stoneCarriageContractBase.contractType, 'stoneCarriageContractType', '')}
					</td> --%>
					<td>
						<a href="${ctx}/contract/stoneCarriageContractBase/form?id=${stoneCarriageContractBase.id}" >${stoneCarriageContractBase.contractNo}</a>
					</td>
					<td>
						${stoneCarriageContractBase.supp.name}
					</td>
					<td>
						${stoneCarriageContractBase.settlementType}
					</td>
					<td>
						${stoneCarriageContractBase.startTime}
					</td>
					<td>
						${stoneCarriageContractBase.endTime}
					</td>
<%-- 					<td>
						${fns:getDictLabel(stoneCarriageContractBase.statue, 'contractStatue', '')}
					</td> --%>
					<td>
					<c:choose>
						<c:when test="${stoneCarriageContractBase.workflowstatus eq '1'}">
							待审核
						</c:when>
						<c:when test="${stoneCarriageContractBase.workflowstatus eq '4'}">
							已完成
						</c:when>
						<c:otherwise>待提交</c:otherwise>
					</c:choose>
				</td>
				<td class="table-operate">
					<shiro:hasAnyRoles name="${fns:getWhitelistsList('scysht')}">
						<a href="${ctx}/contract/stoneCarriageContractBase/delete?id=${stoneCarriageContractBase.id}" onclick="return confirmx('确认要删除该生产合同吗？', this.href)">删除</a>
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