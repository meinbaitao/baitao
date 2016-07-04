<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>甲方合同管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript" src="${ctxStatic}/modules/contract/scripts/jiaContract.js"></script>
	<script type="text/javascript" src="${ctxStatic}/modules/contract/scripts/common_contract.js"></script>
	<script type="text/javascript"  src="${ctxStatic}/common/common_service.js" ></script>
	<script type="text/javascript">
    	var ctxPath="${ctx}";
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
				<li><input type="radio" name="actRadio" value="1" attrUrl="${ctx}/contract/jiaContract/findMyJiaContract" checked="checked"/>我发起</li>
				<li><input type="radio" name="actRadio" value="2" attrUrl="${ctx}/contract/jiaContract/findUnAuditJiaContract" />我审批</li>
				<li><input type="radio" name="actRadio" value="3" attrUrl="${ctx}/contract/jiaContract/findAuditDoneJiaContract" />所有</li>
			</ul>
			<form:form id="searchForm" modelAttribute="jiaContract"
				action="${ctx}/contract/jiaContract/findMyJiaContract" method="post"
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
					<th>合同编号</th>
					<th>合同名称</th>
					<th>合同造价</th>
					<th>石材总面积</th>
					<th>估算造价</th>
					<th>签约对方</th>
					<th>挂靠单位</th>
					<th>备注信息</th>
					<th>审批状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${page.list}" var="jiaContract">
				<tr>
					<td>
						<a href="${ctx}/contract/jiaContract/form?id=${jiaContract.id}">${jiaContract.cid}</a>
					</td>
					<td>
						${jiaContract.name}
					</td>
					<td>
						${jiaContract.cost}
					</td>
					<td>
						${jiaContract.areaofstone}
					</td>
					<td>
						${jiaContract.estimatedcost}
					</td>
					<td>
						${jiaContract.signedcounterparty}
					</td>
					<td>
						${jiaContract.attachunit}
					</td>
					<td>
						${jiaContract.remarks}
					</td>
					<td>
					<c:choose>
						<c:when test="${jiaContract.workflowstatus eq '1'}">
							待审核
						</c:when>
						<c:when test="${jiaContract.workflowstatus eq '4'}">
							已完成
						</c:when>
						<c:otherwise>待提交</c:otherwise>
					</c:choose>
					</td>
					
					<td>
						<a href="${ctx}/contract/jiaContract/delete?id=${jiaContract.id}" onclick="return confirmx('确认要删除该甲方合同吗？', this.href)">删除</a>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="pagination">${page}</div>
</body>
</html>