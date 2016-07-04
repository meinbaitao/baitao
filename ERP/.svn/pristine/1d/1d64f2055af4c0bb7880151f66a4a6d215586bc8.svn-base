a<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>合同评审表</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/activitiHeader.jsp"%>
	<%@include file="/WEB-INF/views/include/commonScript.jsp"%>
	<script type="text/javascript" src="${ctxStatic}/modules/contract/scripts/stoneCarriageContract.js "></script>
	<script type="text/javascript" src="${ctxStatic}/modules/contract/scripts/common_contract.js "></script>
	<script>
		var ctxPath="${ctx}";
	</script>
</head>
<body>
	
	<div class="list-content" >
	<jsp:include page="contractBaseForm.jsp" flush="true" >
		<jsp:param name="contractType" value="stoneCarriageContractBase"/>
		<jsp:param name="contractId" value="${stoneCarriageContractBase.id }"/>
		<jsp:param name="detailTemplate" value="${ctx}/contract/stoneCarriageContractBase/import/template"/>
	</jsp:include>
		
	<div class="form-content">
		<div id="hiddenContainer">
			<input type="hidden" id="submitUrl" value="/a/contract/stoneCarriageContractBase/startworkflow" />
			<input type="hidden" id="successUrl" value="/a/contract/stoneCarriageContractBase/list" />
		</div>
		<form:form id="detailsForm" modelAttribute="StoneCarriageContractDetail" method="post" class="form-horizontal">
		<div class="nav-operate" >
			<ul class="operationg-new  operationg-attach" >
				<li id="tr_add"><span class="glyphicon glyphicon-plus"></span>添加</li>
				<li id="tr_detail_del"><span class="glyphicon glyphicon-remove"></span>删除</li>
			</ul>
		</div>
		<div class="table_scroll">
		<table id="contentTable" class="table table-striped table-bordered table-condensed table-eidt">
			<thead>
				<tr>
				    <th class="all-check"  >
						<input type="checkbox" id="all-check">
						<label for="all-check">选择</label> 
				    </th>
					<th type="text" class="required input60" name="seriesnumber">序号</th>
					<th type="text" class="input60" name="startAddr">起运地址</th>
					<th type="text" class="input60" name="province">&nbsp;&nbsp;省份&nbsp;&nbsp;</th>
					<th type="text" class="input60"  name="city">&nbsp;&nbsp;城市&nbsp;&nbsp;</th>
					<th type="text" class="input110" name="pastCity">对应往年城市<br>【空白为往年无价格】</th>
					<th type="text" class="input110" name="companyCity">对应集团<br>报价城市</th>
					<th type="text" class="input60" name="kilometre">公里</th>
					<th type="text" class="input110" name="companyPrice">集团报价<br>【 工程板块报价】</th>
					<th type="text" class="input60" name="pastPrice">往年合同价</th>
					<th type="text" class="input110" name="preTaxFullCarPrice">整车运输中标<br>价格（元/公斤）</th>
					<th type="text" class="input110" name="afterTaxFullCarPrice">整车运输中标不含税<br>价格（元/公斤）</th>
					<th type="text" class="input110" name="preTaxSplitPrice">零担运输中标<br>价格（元/公斤）</th>
					<th type="text" class="input110" name="afterTaxSplitPrice">零担运输中标不含税<br>价格（元/公斤）</th>
					<th type="text" class="input110" name="preTaxLightPrice">零担轻货中标<br>价格（元/方）</th>
					<th type="text" class="input110" name="afterTaxLightPrice">零担轻货中标不含税<br>价格（元/方）</th>
					<th type="text" class="input60" name="duration">运输时间<br>（小时）</th>
				</tr>
			</thead>
			<tbody id="detailList">
				<c:forEach items="${stoneCarriageContractBase.detailList}" var="detail" varStatus="idx">
					<tr>
						<td class="check">
							<input type="checkbox" value="${detail.id}">
						</td>
						<td type="text" class="hide" name="id">${detail.id}</td>
						<td type="text" name="seriesnumber">${detail.seriesnumber}</td>
						<td type="text" name="startAddr">${detail.startAddr}</td>
						<td type="text" name="province">${detail.province}</td>
						<td type="text" name="city">${detail.city}</td>
						<td type="text" name="pastCity">${detail.pastCity}</td>
						<td type="text" name="companyCity">${detail.companyCity}</td>
						<td type="text" name="kilometre">${detail.kilometre}</td>
						<td type="text" name="companyPrice">${detail.companyPrice}</td>
						<td type="text" name="pastPrice">${detail.pastPrice}</td>
						<td type="text" name="preTaxFullCarPrice">${detail.preTaxFullCarPrice}</td>
						<td type="text" name="afterTaxFullCarPrice">${detail.afterTaxFullCarPrice}</td>
						<td type="text" name="preTaxSplitPrice">${detail.preTaxSplitPrice}</td>
						<td type="text" name="afterTaxSplitPrice">${detail.afterTaxSplitPrice}</td>
						<td type="text" name="preTaxLightPrice">${detail.preTaxLightPrice}</td>
						<td type="text" name="afterTaxLightPrice">${detail.afterTaxLightPrice}</td>
						<td type="text" name="duration">${detail.duration}</td>
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