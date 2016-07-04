<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>劳务结算单管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript" src="${ctxStatic}/modules/finance/scripts/laborSettlement.js?tsf=${jsVersion}"></script>
	<script type="text/javascript" src="${ctxStatic}/common/common_service.js?tsf=${jsVersion}"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			
			/**
			 * 点击添加按钮
			 */
			$("#addNew").on("click",function(){
				 window.location.href=startUp.getRootPath()+"/a/finance/laborSettlement/form";
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
			<ul class="operationg-new" >
				<shiro:hasAnyRoles name="${fns:getWhitelistsList('lwjs')}">
				<li>
				<input id="addNew" class="btn btn-primary" type="button" value="添加">
<!--	 			<input id="deleteContract" class="btn btn-primary" type="button" value="删除"> -->
				</li>
				</shiro:hasAnyRoles>
	    </ul>
	    <ul class="act">
				<li><input type="radio" name="actRadio" value="1" ${(param.actRadio eq '1' or empty param.actRadio)?'checked="checked"':'' }/>待提交</li>
				<li><input type="radio" name="actRadio" value="2" ${param.actRadio eq '2'?'checked="checked"':'' }/>待审批</li>
				<li><input type="radio" name="actRadio" value="3" ${param.actRadio eq '3'?'checked="checked"':'' }/>已完成</li>
				<shiro:hasPermission name="laborcontractAllList">
					<li><input type="radio" name="actRadio" value="4" ${param.actRadio eq '4'?'checked="checked"':'' }/>全部</li>
				</shiro:hasPermission>
			</ul>
			<c:choose>
				<c:when test="${param.actRadio eq '1' or empty param.actRadio }">
					<c:set var="url" value="${ctx}/finance/laborSettlement/findMylaborSettlement"/>
				</c:when>
				<c:when test="${param.actRadio eq '2' }">
					<c:set var="url" value="${ctx}/finance/laborSettlement/findUnAuditLaborSettlement"/>
				</c:when>
				<c:when test="${param.actRadio eq '3' }">
					<c:set var="url" value="${ctx}/finance/laborSettlement/findAuditDoneLaborSettlement"/>
				</c:when>
				<c:when test="${param.actRadio eq '4' }">
					<c:set var="url" value="${ctx}/finance/laborSettlement/allList"/>
				</c:when>
				<c:otherwise>
					<c:set var="url" value="${ctx}/finance/laborSettlement/list"/>
				</c:otherwise>
			</c:choose>
		<form:form id="searchForm" modelAttribute="laborSettlement"
			action="${url}" method="post"
			class="breadcrumb form-search">
			<input id="pageNo" name="pageNo" type="hidden"
				value="${page.pageNo}" />
			<input id="pageSize" name="pageSize" type="hidden"
				value="${page.pageSize}" />
			<input id="actRadio" name="actRadio" type="hidden" value="${param.actRadio}" />
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
				<th>结算单编号</th>
				<th>合同编号</th>
				<th>项目名称</th>
				<th>施工班组</th>
				<th>户型</th>
				<th>楼栋</th>
				<th>合同金额</th>
				<th>结算金额</th>
				<th>价格差异</th>
				<th>申请日期</th>
				<th>审批状态</th>
<!-- 				<th>付款通知单号</th>
				<th>付款方式</th>
				<th>付款日期</th>
				<th>状态</th> -->
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="laborSettlement">
			<tr>
				<td><a href="${ctx}/finance/laborSettlement/form?id=${laborSettlement.id}">
					${laborSettlement.seriesnumber}
				</a></td>
				<td>${laborSettlement.contractNo}</td>
				<td>${laborSettlement.projectName}</td>
				<td>${laborSettlement.partyBName}</td>
				<td>${laborSettlement.houseType}</td>
				<td>${laborSettlement.buildingsDisName}</td>
				<td>${laborSettlement.contractPrice}</td>
				<td>${laborSettlement.price}</td>
				<td>${laborSettlement.priceDifference}</td>
				<td>
					<fmt:formatDate value="${laborSettlement.createDate}" pattern="yyyy-MM-dd"/>
				</td>
<%-- 				<td>${laborSettlement.paymentSeriesnumber}</td>
				<td>${laborSettlement.paymentType}</td>
				<td>${laborSettlement.paymentDate}</td>
				<td>
					<c:choose>
						<c:when test="${laborSettlement.statue eq '1'}">已付款</c:when>
						<c:otherwise>未付款</c:otherwise>
					</c:choose>
				</td> --%>
<%--				<td>${laborSettlement.remarks}</td>
 				<td>
					<a href="${ctx}/finance/laborSettlement/delete?id=${laborSettlement.id}" onclick="return confirmx('确认要删除该生产结算单吗？', this.href)">删除</a>
				</td> --%>
				<td>
					<c:choose>
						<c:when test="${laborSettlement.workflowstatus eq '1'}">
							待审核
						</c:when>
						<c:when test="${laborSettlement.workflowstatus eq '4'}">
							已完成
						</c:when>
						<c:otherwise>待提交</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
		</tbody>
		</table>
	</div>
<div class="pagination">${page}</div>
</body>
</html>