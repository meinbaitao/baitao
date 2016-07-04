<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>发货信息汇总（石材）</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
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
           <form:form id="searchForm" modelAttribute="logisticsSend" action="" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        <ul class="search">
		            <li>
		               <%-- <form:input path="seriesnumber" htmlEscape="false" class="input-medium" placeholder="项目名称"/> --%>
		               <input name="projectName" value="${param.projectName}" type="text" class="input-medium" placeholder="项目名称">
		            </li>
		            <li>
		            	<input class="search-btn" type="submit" id="searchBtn" name="searchBtn" value="查询"/>
		            	<!-- <input class="search-btn" id="table-set"  type="submit" value="查询" /> -->
		            </li>
		        </ul>
		       <div class="clearfix"></div>
	       </form:form>
	      </div>
	      <div id="scroll-table">
	 	<div id="scroll-head">
		</div>
		<div id="tbody-scroll" class="tbody-scroll"> 
			<table id="contentTable" class="table table-striped table-bordered table-condensed resize tree_table">
				<thead>
					<tr>
						<th>项目名称</th>
						<th>发货单号</th>
						<th>计划发货箱数</th>
						<th>实际发货箱数</th>
						<th>发货类型</th>
						<th>承运方</th>
						<th>车辆长度</th>
						<th>司机姓名</th>
						<th>司机电话</th>
						<th>状态</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${page.list}" var="list"  varStatus="i">
						<tr>
							<td>${list.project.name }</td>
							<td>${list.seriesnumber }</td>
							<td>${list.extraData.countBox }</td>
							<td>${list.extraData.actualSendCount }</td>
							<td>${list.chargeType }</td>
							<td>${list.supp.name }</td>
							<td>${list.vehicleLength }</td>
							<td>${list.driveName }</td>
							<td>${list.drivePhone }</td>
							<td>${list.statusLable }</td>
						</tr>
					</c:forEach>
				</tbody>  
			</table>
			</div>
	</div>
	</div>
    <div class="pagination">${page}</div>
</body>
</html>