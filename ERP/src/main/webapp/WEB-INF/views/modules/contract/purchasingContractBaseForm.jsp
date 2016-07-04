]<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>合同评审表</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/activitiHeader.jsp"%>
	<%@ include file="/WEB-INF/views/include/commonScript.jsp"%>
	<script src="${ctxStatic}/modules/contract/scripts/purchasingContract.js?tsf=${jsVersion} " type="text/javascript"></script>
	<script src="${ctxStatic}/modules/contract/scripts/common_contract.js?tsf=${jsVersion} " type="text/javascript"></script>
	<script>
		var ctxPath="${ctx}";
	</script>
</head>
<body>

<div class="list-content">
	<jsp:include page="contractBaseForm.jsp" flush="true" >
		<jsp:param name="contractType" value="purchasingContractBase"/>
		<jsp:param name="fristType" value="${purchasingContractBase.fristType }"/>
		<jsp:param name="secondType" value="${purchasingContractBase.secondType }"/>
		<jsp:param name="detailTemplate" value="${ctx}/contract/purchasingContractBase/import/template"/>
	</jsp:include>
	<div class="form-content">
		<div id="hiddenContainer">
			<input type="hidden" id="submitUrl" value="/a/contract/purchasingContractBase/startworkflow" />
			<input type="hidden" id="successUrl" value="/a/contract/purchasingContractBase/list" />
		</div>
	<c:if test="${purchasingContractBase.fristType eq '10' || purchasingContractBase.fristType eq '11'
			|| purchasingContractBase.fristType eq '12'}">
	<form:form id="detailsFormX" modelAttribute="otherContractDetail" method="post" class="form-horizontal">
	<div class="nav-operate" >
		<ul class="operationg-new  operationg-attach" >
			<li class="tr_add" target="contentTableX"><span class="glyphicon glyphicon-plus"></span>添加</li>
			<li id="tr_detail_delX"><span class="glyphicon glyphicon-remove"></span>删除</li>
	    </ul>
   </div>
   <div class="table_scroll">
	<table id="contentTableX" class="table table-striped table-bordered table-condensed table-eidt">
		<thead>
			<tr>
			   <th class="all-check" width="20px">
					<input type="checkbox" id="all-check" >
					<label for="all-check">选择</label>
			    </th>
				<th type="text" class="input200" name="payStage"> 付款阶段</th>
				<th type="select" class="input-medium" name="payClause" tag="payClause">付款条款</th>
				<th type="text" class="input200 number" name="payRatio">付款比例(%)</th>
				<th type="text" class="input200" name="price">付款金额</th>
				<th type="text" class="input200" name="remark">备注</th>
			</tr>
		</thead>
		<tbody id="detailList_2">
			<c:forEach items="${purchasingContractBase.detailListX}" var="detail" varStatus="idx">
				<tr>
					<td class="check">
						<input type="checkbox"value="${detail.id }">
					</td>
					<td type="text" class="hide" name="id">${detail.id}</td>
					<td type="text" name="payStage">${detail.payStage}</td>
					<td type="select" name="payClause" tag="payClause">${detail.payClause}</td>
					<td type="text" name="payRatio">${detail.payRatio}</td>
					<td type="text" name="price">${detail.price}</td>
					<td type="text" name="remark" >${detail.remark}</td>
				 </tr>
	 		</c:forEach>
		</tbody>
	</table>
	</div>
	</form:form>
	</c:if>
	
	<form:form id="detailsForm" modelAttribute="purchasingContractDetail" method="post" class="form-horizontal">
	<div class="nav-operate" >
		<ul class="operationg-new  operationg-attach" >
			<li class="tr_add" target="contentTable"><span class="glyphicon glyphicon-plus"></span>添加</li>
			<li id="tr_detail_del"><span class="glyphicon glyphicon-remove"></span>删除</li>
	    </ul>
   </div>
   <div class="table_scroll">
	<table id="contentTable" class="table table-striped table-bordered table-condensed table-eidt">
		<thead>
			<tr>
			   <th class="all-check">
					<input type="checkbox" id="all-check">
					<label for="all-check">选择</label>
			    </th>
				<th type="text" class="required input110" name="materielNo">编号</th>
				<th type="text" class=" input110"   name="materielName">名称</th>
				<th type="text" class=" input60"   name="materielType">类别</th>
				<th type="text" class=" input60"   name="brand">品牌</th>
				<th type="text" class=" input60"   name="stoneType">石材品种</th>
				<th type="text" class=" input110"   name="materielSize">规格型号</th>
				<th type="text" class=" input60"   name="length">长</th>
				<th type="text" class=" input60"   name="width">宽</th>
				<th type="text" class=" input60"   name="height">高</th>
				<th type="text" class=" input60"   name="unit">单位</th>
				<th type="select" class=" input100" name="isInProvince" tag="price_type" >价格类型</th>
				<th type="text" class=" input110"   name="price">标准价</th>
				<th type="text" class=" input110"   name="contractPrice">合同价</th>
<!-- 				<th type="text" class=" input110"   name="contractPrice">合同价(含税)</th> -->
				<th type="text" class=" input110"   name="priceDifference">价格差</th>
				<th type="text" class=" input110"   name="remark">备注</th>
			</tr>
		</thead>
		<tbody id="detailList">
			<c:forEach items="${purchasingContractBase.detailList}" var="detail" varStatus="idx">
				<tr>
					<td class="check">
						<input type="checkbox"value="${detail.id }">
					</td>
					<td type="text" class="input60" style="display: none;" name="id">${detail.id}</td>
					<td type="text" class="input60" name="materielNo" >${detail.materielNo}</td>
					<td type="text" class="input60" name="materielName" >${detail.materielName}</td>
					<td type="text" class="input60" name="materielType" >${detail.materielType}</td>
					<td type="text" class="input60" name="brand" >${detail.brand}</td>
					<td type="text" class="input60" name="stoneType" >${detail.stoneType}</td>
					<td type="text" class="input60" name="materielSize" >${detail.materielSize}</td>
					<td type="text" class="input60" name="length" >${detail.length}</td>
					<td type="text" class="input60" name="width" >${detail.width}</td>
					<td type="text" class="input60" name="height" >${detail.height}</td>
					<td type="text" class="input60" name="unit" >${detail.unit}</td>
					<td type="select" class="input110" name="isInProvince" tag="price_type">${detail.isInProvinceDpName}</td>
					<td type="text" class="input60" name="price" >${detail.price}</td>
					<td type="text" class="input60" name="contractPrice" >${detail.contractPrice}</td>
<%-- 					<td type="text" name="priceWithTax" >${detail.priceWithTax}</td> --%>
					<td type="text" class="input60" name="priceDifference" >${detail.priceDifference}</td>
					<td type="text" class="input110" name="remark" >${detail.remark}</td>
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