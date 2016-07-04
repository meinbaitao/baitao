<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>合同评审表</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/activitiHeader.jsp"%>
	<%@ include file="/WEB-INF/views/include/commonScript.jsp"%>
	<script src="${ctxStatic}/modules/contract/scripts/manufContract.js?tsf=${jsVersion} " type="text/javascript"></script>
	<script src="${ctxStatic}/modules/contract/scripts/common_contract.js?tsf=${jsVersion} " type="text/javascript"></script>
	<script>
		var ctxPath="${ctx}";
	</script>
</head>
<body>

	<div class="list-content" >
	<jsp:include page="contractBaseForm.jsp" flush="true" >
		<jsp:param name="contractType" value="manufContractBase"/>
		<jsp:param name="contractId" value="${manufContractBase.id }"/>
		<jsp:param name="secondType" value="${manufContractBase.secondType }"/>
		<jsp:param name="detailTemplate" value="${ctx}/contract/manufContractBase/import/template"/>
	</jsp:include>
	
	<div class="form-content">	
		<form:form id="detailsForm" modelAttribute="ManufContractDetail" method="post" class="form-horizontal">
        <div class="nav-operate" >
			<ul class="operationg-new  operationg-attach" >
				<li id="tr_add"><span class="glyphicon glyphicon-plus"></span>添加</li>
				<li id="tr_detail_del"><span class="glyphicon glyphicon-remove"></span>删除</li>
		    </ul>
	   </div>
	   <div class="table_scroll">
       	<table id="contentTable" class="table table-striped table-bordered table-condensed table-eidt">
			<thead>
				<tr list="detailList">
				    <th class="all-check"  >
						<input type="checkbox" id="all-check">
						<label for="all-check">选择</label>
				    </th>
					<th type="text" class="input60" name="province">省份</th>
					<th type="text" class="required input130" name="manufName">加工项/产品名</th>
					<th type="text" class=" input130" name="stoneType">石材品种</th>
					<th type="text" class=" input130" name="standardName" >集团对应名称</th>
					<th type="text" class=" input130" name="size">规格</th>
					<th type="text" class=" input130" name="manufDetail" >加工内容/工序</th>
					<th type="text" class=" input130" name="unit" >单位</th>
					<th type="text" class=" input130" name="standardPrice">标准价</th>
					<th type="text" class=" input130" name="contractPrice">合同价</th>
<!-- 					<th type="text" class=" input130" name="priceWithTax">合同价(含税)</th> -->
					<th type="text" class=" input130" name="priceDifference">价格差</th>
					<th type="text" class=" input130" name="remark">备注</th>
				</tr>
			</thead>
			<tbody id="detailList">
				<c:forEach items="${manufContractBase.detailList}" var="detail" varStatus="idx">
 					<tr>
						<td class="check">
							<input type="checkbox"value="${detail.id}">
						</td>
						<td type="text" class="hide" name="id">${detail.id}</td>
						<td type="text" name="province">${detail.province}</td>
						<td type="text" name="manufName">${detail.manufName}</td>
						<td type="text" name="stoneType">${detail.stoneType}</td>
						<td type="text" name="standardName">${detail.standardName}</td>
						<td type="text" name="size">${detail.size}</td>
						<td type="text" name="manufDetail">${detail.manufDetail}</td>
						<td type="text" name="unit">${detail.unit}</td>
						<td type="text" name="standardPrice">${detail.standardPrice}</td>
						<td type="text" name="contractPrice">${detail.contractPrice}</td>
<%-- 						<td type="text" name="standardName">${detail.priceWithTax}</td> --%>
						<td type="text" name="priceDifference">${detail.priceDifference}</td>
						<td type="text" name="remark">${detail.remark}</td>
					 </tr>
		 		</c:forEach>
			</tbody>
		</table>
		</div>
	</form:form>
	</div>
</div>
</body>
</html>