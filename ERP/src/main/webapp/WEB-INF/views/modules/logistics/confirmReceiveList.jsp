<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>确认收货（石材）</title>
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
<body><%--  onsubmit="javascript:return validateGS();" --%>
	<form:form style="display:none;" id="confirmReceiveForm" modelAttribute="logisticsSend" action="${ctx}/logistics/productionLogistics/confirmReceive" method="post" class="form-horizontal">
       	<input id="confirmReceiveids" name="ids" type="hidden" value=""/>
       	<input id="confirmReceivepJson" name="pJson" type="hidden" value=""/>
    </form:form>
	<div class="list-content">
	     <div class="nav-operate" >
           <form:form id="searchForm" modelAttribute="logisticsSend" action="${ctx}/logistics/productionLogistics/confirmReceive" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        <shiro:hasAnyRoles name="${fns:getWhitelistsList('qrsh')}">
			        <ul class="operationg-new" >
			       	 	<li>
		            	   <input attrID="confirmReceiveBtn" type="button" class="btn btn-primary" value="确认收货">
		            	</li>
			        </ul>
		        </shiro:hasAnyRoles>
		       <div class="clearfix"></div> 
	       </form:form>
	      </div>
			<table id="contentTable" class="table table-striped table-bordered table-condensed resize tree_table">
				<input id="isStatus" name="isStatus" type="hidden" value="${isStatus}"/>
				<thead>
					<tr>
						<th>省份</th>
						<th>项目名称</th>
						<th>楼栋号</th>
						<th>石材品种</th>
						<th>加工厂</th>
						<th>在途箱数</th>
						<th>确认收货箱数</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${page.list}" var="obj"  varStatus="i">
						<tr id="lid${obj.id }${obj.project.id }" lid="${obj.id }">
							<td colspan="5">${obj.seriesnumber }</td>
							<td>
								<a href="javascript:void(0)" lid="${obj.id }" projectName="${obj.project.name }" projectId="${obj.project.id }" attrID="confirmReceiveSendCount" >
									${obj.extraData.sendCount } 
								</a>
							</td>
							<td>&nbsp;<!-- <input attrID="cBox" type="checkbox" name="parentBox" value=""> --></td>
						</tr>
						<%-- <tr>
							<td>${list.project.name }</td>
							<td>${list.seriesnumber }</td>
							<td>${list.quantity }</td>
							<td>${list.extraData.countBox }</td>
							<td>${list.chargeType }</td>
							<td>${list.supp.name }</td>
							<td>${list.vehicleLength }</td>
							<td>${list.driveName }</td>
							<td>${list.drivePhone }</td>
							<td>${list.statusLable }</td>
						</tr> --%>
					</c:forEach>
				</tbody>  
			</table>
	</div>
    <div class="pagination">${page}</div>
</body>
</html>