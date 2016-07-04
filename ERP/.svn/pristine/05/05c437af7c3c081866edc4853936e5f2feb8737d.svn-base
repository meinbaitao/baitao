<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>合同评审表</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/activitiHeader.jsp"%>
	<%@ include file="/WEB-INF/views/include/commonScript.jsp"%>
	<script type="text/javascript" src="${ctxStatic}/modules/contract/scripts/accCarriageContract.js"></script>
	<script type="text/javascript" src="${ctxStatic}/modules/contract/scripts/common_contract.js"></script>
	<script>
		var ctxPath="${ctx}";
	</script>
</head>
<body>
	<div class="list-content" >
	<jsp:include page="contractBaseForm.jsp" flush="true" >
		<jsp:param name="contractType" value="accCarriageContractBase"/>
		<jsp:param name="contractId" value="${accCarriageContractBase.id }"/>
		<jsp:param name="detailTemplate" value="${ctx}/contract/accCarriageContractBase/import/template"/>
	</jsp:include>
		
	<div class="form-content">
		<div id="hiddenFieldsContainer">
			<input type="hidden" value="/a/contract/accCarriageContractBase/startworkflow"  id="submitUrl" />
			<input type="hidden" value="/a/contract/accCarriageContractBase/list" id="successUrl" />
		</div>
		<form:form id="detailsForm" modelAttribute="AccCarriageContractDetail" method="post" class="form-horizontal">
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
					<th type="text" class="input60" name="city">&nbsp;&nbsp;城市&nbsp;&nbsp;</th>
					<th type="text" class="input60" name="oneToFive">1000-5000公斤</th>
					<th type="text" class="input60" name="fiveToTen">5100-10000公斤</th>
					<th type="text" class="input60" name="tenToFifty">10100-15000公斤</th>
					<th type="text" class="input60" name="fiftyToTwenty">15100-20000公斤</th>
					<th type="text" class="input60" name="twentyToTwentyfive">20100-25000公斤</th>
					<th type="text" class="input60" name="twentyfiveToThirty">25100-30000公斤</th>
					<th type="text" class="input60" name="thirtyToThirtyfive">30100-35000公斤</th>
					<th type="text" class="input60" name="thirtyfiveAbove">35000公斤以上</th>
					<th type="text" class="input60" name="uploadPrice">送货费</th>
					<th type="text" class="input60" name="fixedPrice">包车</th>
					<th type="text" class="input60" name="duration">运输时间<br>（小时）</th>
				</tr>
			</thead>
			<tbody id="detailList">
				<c:forEach items="${accCarriageContractBase.detailList}" var="detail" varStatus="idx">
					<tr>
						<td class="check">
							<input type="checkbox" value="${detail.id}">
						</td>
						<td type="text" class="hide" name="id">${detail.id}</td>
						<td type="text" name="seriesnumber">${detail.seriesnumber}</td>
						<td type="text" name="startAddr">${detail.startAddr}</td>
						<td type="text" name="province">${detail.province}</td>
						<td type="text" name="city">${detail.city}</td>
						<td type="text" name="oneToFive">${detail.oneToFive}</td>
						<td type="text" name="fiveToTen">${detail.fiveToTen}</td>
						<td type="text" name="tenToFifty">${detail.tenToFifty}</td>
						<td type="text" name="fiftyToTwenty">${detail.fiftyToTwenty}</td>
						<td type="text" name="twentyToTwentyfive">${detail.twentyToTwentyfive}</td>
						<td type="text" name="twentyfiveToThirty">${detail.twentyfiveToThirty}</td>
						<td type="text" name="thirtyToThirtyfive">${detail.thirtyToThirtyfive}</td>
						<td type="text" name="thirtyfiveAbove">${detail.thirtyfiveAbove}</td>
						<td type="text" name="uploadPrice">${detail.uploadPrice}</td>
						<td type="text" name="fixedPrice">${detail.fixedPrice}</td>
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