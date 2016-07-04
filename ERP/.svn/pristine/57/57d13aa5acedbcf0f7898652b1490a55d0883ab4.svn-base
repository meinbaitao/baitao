<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>石材进度跟进-项目</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript" src="${ctxStatic}/jquery/jquery.json.js?tsf=${jsVersion}"></script>
	<script type="text/javascript" src="${ctxStatic}/modules/logistics/scripts/productionLogistics.js?tsf=${jsVersion}"></script>
	
	<script type="text/javascript">
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
	     <div class="nav-operate" >
           <form:form id="searchForm" modelAttribute="production" action="" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<input id="projectName" name="projectName" type="hidden" value="${projectName}"/>
		       <ul class="operationg-new" >
		            <li>
		            	<a href="${ctx}/stoneSchedule/stoneSchedule/getListForProject" class="btn btn-primary">返回</a>
		            </li>
		        </ul>
		       <ul class="search">
		            <li>
		               <input name="building" type="text" value="${building }" class="input-medium" placeholder="楼栋号">
		            </li>
		            <li>
		            	<input class="search-btn" type="submit" id="searchBtn" name="searchBtn" value="查询"/>
		            </li>
		        </ul>
		       <div class="clearfix"></div>
	       </form:form>
	      </div>
		<table id="contentTable" class="table table-striped table-bordered table-condensed resize tree_table">
			<thead>
				<tr>
					<th >楼栋号</th>
					<th >石材品种</th>
					<th >加工厂</th>
					<th >下单总箱数</th>
					<th >未入库箱数</th>
					<th >已入库数量</th>
					<th >待发货箱数</th>
					<th >待派车箱数</th>
					<th >已派车未发货箱数</th>
					<th >在途箱数</th>
					<th >已收货箱数</th>
					<th >发货地址</th>
				</tr>
			</thead>
            <tbody id="stoneScheduleList">
            	<c:forEach items="${map.listProduction}" var="obj">
            		<tr>
						<td >${obj.sub.buildingDisplayName }</td>
						<td >${obj.orderBomBase.orderTypeVal }</td>
						<td >${obj.supp.name }</td>
						<td >${obj.extraData.countOrderBase }</td>
						<td >${obj.extraData.waitIntakeCount }</td>
						<td >${obj.extraData.hasIntakeCount }</td>
						<td >${obj.extraData.waitSendCount }</td>
						<td >${obj.extraData.waitCarCount }</td>
						<td >${obj.extraData.hasCarWaitSendCount }</td>
						<td >${obj.extraData.sendCount }</td>
						<td >${obj.extraData.receiveCount }</td>
						<td >${obj.supp.businessAddress }</td>
					</tr>
				</c:forEach>
            </tbody>  
		 </table>
	</div>
</body>
</html>