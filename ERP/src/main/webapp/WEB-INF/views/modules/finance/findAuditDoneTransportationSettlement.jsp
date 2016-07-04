<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>运费结算管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript" src="${ctxStatic}/modules/finance/scripts/transportationSettlement.js"></script>
	<script type="text/javascript" src="${ctxStatic}/modules/contract/scripts/workFlowControl.js"></script>
	<script type="text/javascript" src="${ctxStatic}/common/common_service.js"></script>
	<script type="text/javascript">
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
				<li><input type="radio" name="actRadio" value="2" attrUrl="${ctx}/finance/transportationSettlement/findMyTransportationSettlement" />列表</li>
				<li><input type="radio" name="actRadio" value="2" attrUrl="${ctx}/finance/transportationSettlement/findUnAuditTransportationSettlement" />我审批</li>
				<li><input type="radio" name="actRadio" value="3" attrUrl="${ctx}/finance/transportationSettlement/findAuditDoneTransportationSettlement" checked="checked"/>所有</li>
			</ul>
	    </ul>
		<form:form id="searchForm" modelAttribute="transportationSettlement"
			action="${ctx}/finance/transportationSettlement/findAuditDoneTransportationSettlement" method="post"
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
		<div class="table_scroll" style="margin-bottom:200px;">
			<sys:message content="${message}"/>
			<table id="contentTable" class="table table-striped table-bordered table-condensed table_scroll">
				<thead>
					<tr>
						<th>发货通知单号</th>
						<th> 物流单号</th>
						<th>承运方</th>
						<th>业务版块</th>
						<th>发货日期</th>
						<th>发货工厂</th>
						<th>起始地址</th>
						<th>收货人</th>
						<th>收货地址</th>
						<th>总箱数</th>
						<th>面积</th>
						<th>过磅重量</th>
						<th>理论重量</th>
						<th>结算重量</th>
						<th>长度</th>
						<th> 运输方式</th>
						<th>计价方式</th>
						<th>司机</th>
						<th>司机电话</th>
						<th>装货费</th>
						<th>卸货次数</th>
						<th>卸货单价</th>
						<th>卸货总价</th>
						<th>结算重量</th>
						<th>合同单价</th>
						<th>总金额</th>
						<th>跟单员</th>
						<th>物流文员</th>
						<th>付款状态</th>
						<th>付款通知单</th>
						<th>付款方式</th>
						<th>付款日期</th>
						<th>备注</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${page.list}" var="transportationSettlement">
					<tr>
						<td>
							<a href="${ctx}/finance/transportationSettlement/form?id=${transportationSettlement.id}">${transportationSettlement.logisticSendSeries}</a>
						</td>
						<td>${transportationSettlement.seriesnumber}</td>	
						<td>${transportationSettlement.supplierName}</td>	
						<td>${transportationSettlement.businessType}</td>	
						<td>${transportationSettlement.sendDate}</td>	
						<td>${transportationSettlement.factoryName}</td>	
						<td>${transportationSettlement.startArea}</td>	
						<td>${transportationSettlement.receiver}</td>	
						<td>${transportationSettlement.receivePlace}</td>	
						<td>${transportationSettlement.boxNumber}</td>	
						<td>${transportationSettlement.area}</td>		
						<td>${transportationSettlement.weigh}</td>	
						<td>${transportationSettlement.theoryWeight}</td>	
						<td>${transportationSettlement.settleWeight}</td>	
						<td>${transportationSettlement.length}</td>	
						<td>${transportationSettlement.transportationWay}</td>
						<td>${transportationSettlement.settlementWay}</td>	
						<td>${transportationSettlement.driver}</td>
						<td>${transportationSettlement.driverTel}</td>
						<td>${transportationSettlement.loadPrice}</td>
						<td>${transportationSettlement.unloadTimes}</td>
						<td>${transportationSettlement.unloadPrice}</td>
						<td>${transportationSettlement.unloadTotalPrice}</td>
						<td>${transportationSettlement.settleWeight}</td>	
						<td>${transportationSettlement.contractPrice}</td>
						<td>${transportationSettlement.sumPrice}</td>
						<td>${transportationSettlement.tracer}</td>
						<td>${transportationSettlement.clerk}</td>
						<td>
							<c:choose>
								<c:when test="${transportationSettlement.statue eq '0'}">未付款</c:when>
								<c:otherwise>已付款</c:otherwise>
							</c:choose>
						</td>	
						<td>${transportationSettlement.paymentSeriesnumber}</td>
						<td>${transportationSettlement.paymentType}</td>
						<td>${transportationSettlement.paymentDate}</td>
						<td>${transportationSettlement.remarks}</td>
						<td>
							<a href="${ctx}/finance/transportationSettlement/delete?id=${transportationSettlement.id}" onclick="return confirmx('确认要删除该运费结算吗？', this.href)">删除</a>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
<div class="pagination">${page}</div>
</body>
</html>
