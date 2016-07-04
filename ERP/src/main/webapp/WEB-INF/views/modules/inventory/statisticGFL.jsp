﻿<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>库存统计（钢、辅材）</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<%@include file="/WEB-INF/views/include/activitiHeader.jsp"%>
	<jsp:useBean id="now" class="java.util.Date" />
	<script src="${ctxStatic}/modules/inventory/scripts/statistic.js?tsf=${jsVersion}" type="text/javascript"></script>
	<script type="text/javascript">
	</script>
</head>
<body>

	<div class="list-content">
	     <div class="form-content">
	   <form:form id="searchFrom" action="${ctx}/inventory/inventory/searchGFL" method="post" class="form-horizontal magbtm0">
	        <input id="ids" name="ids" type="hidden" value=""/>
	        <input id="imt" name="imt" type="hidden" value="${imt }"/>
		   	<ul class="operationg-new" >
	       	 	<li>
	           	   <input name="searchBtn" id="searchBtn" type="submit" class="btn btn-primary" value="搜索">
	           	</li>
	        </ul>
	        <div>
		 <table id="contentTableTitle" class="table table-striped table-bordered table-condensed resize table-eidt">
			   <thead>
			   		<tr >
			   		 <th colspan="2">项目名称</th>
				     <td colspan="2">
				     	<select id="projectName" name="projectName" class="input-medium">
		                  	<c:forEach items="${map.listProject}" var="obj" varStatus="i">
								<%-- <option value="${obj.name}" >${obj.name}</option> --%>
								<c:choose>
									<c:when test="${param.projectName eq obj.name or (empty param.projectName and projectName eq obj.name) }">
										<option selected="selected" value="${obj.name}" >${obj.name}</option>
									</c:when>
									<c:otherwise>
										<option value="${obj.name}" >${obj.name}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
            			</select>
				     </td>
				     <th colspan="2">户型</th>
				     <td colspan="2">
				     	<input id="defaultHouseType" name="defaultHouseType" type="hidden" value="${param.houseType }"/>
				     	<select id="houseType" name="houseType" class="input-small">
		                  	<option value="" > </option>
		                  	<c:forEach items="${map.listHouseType}" var="obj" varStatus="i">
								<%-- <option value="${obj.houseType}" >${obj.houseType}</option> --%>
								<c:choose>
									<c:when test="${param.houseType eq obj.houseType }">
										<option selected="selected" value="${obj.houseType}" >${obj.houseType}</option>
									</c:when>
									<c:otherwise>
										<option value="${obj.houseType}" >${obj.houseType}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
            			</select>
				     </td>
				     <th colspan="2">楼栋</th>
				     <td >
				     	<input id="defaultBuilding" name="defaultBuilding" type="hidden" value="${param.building }"/>
				     	<select id="building" name="building" class="input-small">
		                  	<option value="" > </option>
		                  	<c:forEach items="${map.listBuilding}" var="obj" varStatus="i">
								<%-- <option value="${obj.building}" >${obj.building}</option> --%>
								<c:choose>
									<c:when test="${param.building eq obj.building }">
										<option selected="selected" value="${obj.building}" >${obj.buildingDisplayName}</option>
									</c:when>
									<c:otherwise>
										<option value="${obj.building}" >${obj.buildingDisplayName}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
            			</select>
				     </td>
				     <th colspan="2">材料名称</th>
				     <td colspan="2">
				     	<input id="defaultMaterialName" name="defaultMaterialName" type="hidden" value="${param.materialName }"/>
				     	<select id="materialName" name="materialName" class="input-small">
		                  	<option value="" > </option>
		                  	<c:forEach items="${listMaterialNames}" var="obj" varStatus="i">
								<c:choose>
									<c:when test="${materialName eq obj.materialName }">
										<option selected="selected" value="${obj.materialName}" >${obj.materialName}</option>
									</c:when>
									<c:otherwise>
										<option value="${obj.materialName}" >${obj.materialName}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
            			</select>
				     </td>
	             </tr>
			   </thead>
		   </table>
		   </div>
   	<div id="scroll-table">
	 	<div id="scroll-head">
		</div>
		<div id="tbody-scroll" class="tbody-scroll">
			 <table id="contentTable" class="table table-striped table-bordered table-condensed resize table-eidt">
			   <thead>
	             
			   	<tr >
			   		 <th rowspan="2">序号</th>
			   		 <th rowspan="2">项目名称</th>
			   		 <th rowspan="2">户型</th>
			   		 <th rowspan="2">楼栋号</th>
			   		 <th rowspan="2">物料编号</th>
				     <th rowspan="2">材料名称</th>
				     <th rowspan="2">规格尺寸</th>
				     <th colspan="2">下单总数量</th>
				     <th rowspan="2">补单数量</th>
				     <th rowspan="2">入库总量</th>
				     <th rowspan="2">未到货数量</th>
				     <th rowspan="2">领料总量</th>
				     <th rowspan="2">仓库存量</th>
				     <th rowspan="2">实际盘点量</th>
				     <th rowspan="2">盘点差额</th>
	             </tr>
	             <tr >
				     <th >一</th>
				     <th >单位</th>
	             </tr>
	            </thead>
	            <tbody id="statisticDetail">
	            	<c:forEach items="${listInv}" var="obj" varStatus="i">
	            		<tr >
					   		<td >${i.index+1 }</td>
					   		<td >${obj.project.name }</td>
					   		<td >${obj.sub.houseType }</td>
					   		<td >${obj.sub.buildingDisplayName }</td>
					   		<td >${obj.materialNo }</td>
						   	<td >${obj.materialName }<!-- 材料名称 --></td>
					     	<td >${obj.orderBomDetail.size }<!-- 材料规格 --></td>
					     	<td >${obj.orderBomDetail.count }<!-- 设计下单量 --></td>
					     	<td >${obj.orderBomDetail.unit }<!-- 材料单位 --></td>
					     	<td >0<!-- 补单数量 --></td>
					     	<td >${obj.quantity+obj.outQuantity }<!-- 入库总量 --></td>
					     	<td >${obj.orderBomDetail.count-(obj.quantity+obj.outQuantity)}<!-- 未到货数量 --></td>
					     	<td >${obj.outQuantity}<!-- 领料总量 --></td>
					     	<td >${obj.quantity }<!-- 仓库存量 --></td>
					     	<td >0<!-- 实际盘点量 --></td>
					     	<td >0<!-- 盘点差额 --></td>
			            </tr>
            		</c:forEach>  
	            </tbody>  
			 </table>
			 </div>
			 </div>
		 </form:form>
		 </div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			changeProjectName();
		});
	</script>
</body>
</html>