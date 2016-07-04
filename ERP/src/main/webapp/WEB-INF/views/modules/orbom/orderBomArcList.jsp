<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>弧形板下料单列表</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/modules/orbom/scripts/orderBom.js?tsf=${jsVersion}" type="text/javascript"></script>
	<script type="text/javascript" src="${ctxStatic}/common/common_service.js"></script>
	<script>
	$(document).ready(function() {
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
		<%@ include file="/WEB-INF/views/modules/orbom/importStoneItemOrder.jsp"%>		
		<div class="nav-operate">
			<ul class="operationg-new">
				<shiro:hasAnyRoles name="${fns:getWhitelistsList('sjgl')}">
				<li>
					<a href="${ctxTemplate}/弧形板下料单.xls" id="costId" class="btn btn-primary">
						下载模板
					</a>
				</li>
				<%@ include file="/WEB-INF/views/modules/orbom/buttonOrder.jsp"%>
				</shiro:hasAnyRoles>
			</ul>
			<form:form id="searchForm" modelAttribute="orderBomBase" action="${ctx}/orbom/orderBomBase/list?orderType=${orderBomBase.orderType}" method="post"
				class="breadcrumb form-search">	
				<%@ include file="/WEB-INF/views/modules/orbom/inputQueryOrder.jsp"%>
			</form:form>
			<div class="clear"></div>
		</div>
		<%@ include file="/WEB-INF/views/modules/orbom/bodyOrder.jsp"%>
</body>
</html>