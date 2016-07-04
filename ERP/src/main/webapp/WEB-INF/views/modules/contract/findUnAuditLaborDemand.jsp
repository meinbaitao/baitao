<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>劳务需求管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript" src="${ctxStatic}/modules/contract/scripts/common_contract.js "></script>
	<script type="text/javascript" src="${ctxStatic}/common/common_service.js "></script>
	<script>
		var ctxPath="${ctx}";
		$(function(){
			form_validate("inputForm");
			/**
			 * 点击添加合同
			 */
			$("#addContract").on("click",function(){
				 window.location.href=startUp.getRootPath()+"/a/contract/laborDemand/form";
			});
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
			<ul class="act">
				<li><input type="radio" name="actRadio" value="1" attrUrl="${ctx}/contract/laborDemand/findMyLaborDemand" />我发起</li>
				<li><input type="radio" name="actRadio" value="2" attrUrl="${ctx}/contract/laborDemand/findUnAuditLaborDemand" checked="checked"/>我审批</li>
				<li><input type="radio" name="actRadio" value="3" attrUrl="${ctx}/contract/laborDemand/findAuditDoneLaborDemand" />所有</li>
			</ul>
			
		    
			<form:form id="searchForm" modelAttribute="laborDemand"
				action="${ctx}/contract/laborDemand/findUnAuditLaborDemand" method="post"
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
				<th>工程名称</th>
<!-- 				<th>施工合同</th> -->
				<th>班组类别</th>
				<th>班组简称</th>
				<th>工程开工日期</th>
				<th>工程总工期</th>
				<th>审核状态</th>
				<th>备注信息</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="laborDemand">
			<tr>
				<td>
					<a href="${ctx}/contract/laborDemand/form?id=${laborDemand.id}">${laborDemand.proName}</a>
				</td>
<%-- 				<td>
					<a href="${ctx}/contract/laborDemand/form?id=${laborDemand.id}">${laborDemand.laborcontract}</a>
				</td> --%>
				<td>
					${fns:getDictLabel(laborDemand.exetype, 'executionType', '')}
				</td>
				<td>
					${laborDemand.partyBCode}
				</td>
				<td>
					${laborDemand.startdate}
				</td>
				<td>
					${laborDemand.duration}
				</td>
				<td>
					<c:choose>
						<c:when test="${laborDemand.workflowstatus eq '1'}">
							待审核
						</c:when>
						<c:when test="${laborDemand.workflowstatus eq '4'}">
							已完成
						</c:when>
						<c:otherwise>待提交</c:otherwise>
					</c:choose>
				</td>
				<td>
					${laborDemand.remarks}
				</td>
				<td class="table-operate">
					<a href="${ctx}/contract/laborDemand/form?id=${laborDemand.id}">修改</a>
					<a href="${ctx}/contract/laborDemand/delete?id=${laborDemand.id}" onclick="return confirmx('确认要删除该劳务需求吗？', this.href)">删除</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	
	<div class="pagination">${page}</div>
</body>
</html>