<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>通知发货（石材）</title>
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
		//验证生成发货通知单
		function validateGS(){
			var flag = $("input[name='cBox']").is(':checked');//$("cBox").prop("checked");
			var obbFlag = $("input[name='parentBox']").is(':checked');
			if(!obbFlag&&!flag){
				window.alertx("请选择相应的列表数据！");
				loaded();
				return false;
			}
			$("#planSendDateStr").val($("#planSendDate").val());
			return true;
		}
	</script>
</head>
<body>
	<form:form style="display:none;" id="saveForm" modelAttribute="logisticsSend" action="${ctx}/logistics/productionLogistics/sendNotice" onsubmit="javascript:return validateGS();" method="post" class="form-horizontal">
       	<input id="ids" name="ids" type="hidden" value=""/>
       	<input id="pJson" name="pJson" type="hidden" value=""/>
       	<input id="planSendDateStr" name="planSendDateStr" type="hidden" value=""/>
       	<input id="isStatus" name="isStatus" type="hidden" value="${isStatus}"/>
    </form:form>
	<div class="list-content">
	     <div class="nav-operate" >
           <form:form id="searchForm" modelAttribute="production" action="" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		       <shiro:hasAnyRoles name="${fns:getWhitelistsList('fhtz')}">
			       <ul class="operationg-new" >
			       	 	<li>
		            	   <input attrID="noticeSend" type="button" class="btn btn-primary" value="通知发货">
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
					<th colspan="2">计划发货时间</th>
					<td colspan="3">
						<input id="planSendDate" name="planSendDate" type="text" class="input-medium Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" value="${planSendDate }" />
					</td>
					<th colspan="2">本次发货总箱数</th>
					<td colspan="2" id="countBoxTD"></td>
					<th colspan="2">本次发货总量</th>
					<td colspan="2" id="sumWeightTD"></td>
					<th colspan="4"></th>
				</tr>
				<tr>
					<th >省份</th>
					<th >项目名称</th>
					<th >楼栋号</th>
					<th >石材品种</th>
					<th >加工厂</th>
					<th >下单总箱数</th>
					<th >未入库箱数</th>
					<th >已入库数量</th>
					<th style="color:red;">待发货箱数</th>
					<th >待派车箱数</th>
					<th >已派车未发货箱数</th>
					<th >在途箱数</th>
					<th >要求发货时间</th>
					<th >要求到货时间</th>
					<th >发货地址</th>
					<th >收货地址</th>
					<th >申请发货箱数</th>
				</tr>
			</thead>
            <tbody id="sendNoticeList">
            	<c:forEach items="${page.list}" var="production">
            		<tr id="parent${production.sub.id}${production.orderBomBase.orderType}${production.supp.id }" subID="${production.sub.id }" 
														orderType="${production.orderBomBase.orderType }" suppID="${production.supp.id }" >
	            		<td >${production.project.province }</td>
						<td >${production.project.name }</td>
						<td >${production.sub.buildingDisplayName }</td>
						<td >${production.orderBomBase.orderTypeVal }</td>
						<td >${production.supp.name }</td>
						<td >${production.extraData.countOrderBase }</td>
						<td >${production.extraData.waitIntakeCount }</td>
						<td >${production.extraData.hasIntakeCount }</td>
						<td >
							<a href="javascript:void(0)" attrID="waitSendCount" >
								${production.extraData.waitSendCount }
							</a>
						</td>
						<td >${production.extraData.waitCarCount }</td>
						<td >${production.extraData.hasCarWaitSendCount }</td>
						<td >${production.extraData.sendCount }</td>
						<td >${production.planSendDateLab }</td>
						<td >${production.sub.stoneExpectDate }</td>
						<td >${production.supp.businessAddress }</td>
						<td >${production.project.address }</td>
						<td ><input attrID="cBox" type="checkbox" name="parentBox" value=""></td>
					</tr>
				</c:forEach>
            </tbody>  
		 </table>
	</div>
</body>
</html>