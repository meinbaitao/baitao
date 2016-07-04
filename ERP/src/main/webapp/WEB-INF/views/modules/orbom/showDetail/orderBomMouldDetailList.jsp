<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>造型板下料单明细管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/activitiHeader.jsp"%>
	<script src="${ctxStatic}/modules/orbom/scripts/orderBom.js?tsf=${jsVersion}" type="text/javascript"></script>
	<script type="text/javascript" src="${ctxStatic}/common/common_service.js"></script>
	<script type="text/javascript" src="${ctxStatic}/ajaxfileupload/ajaxfileupload.js" ></script>
	<script src="${ctxStatic}/modules/comm/jquery.jqprint-0.3.js?tsf=${jsVersion}" type="text/javascript"></script>
	<script type="text/javascript">
	//打印
	function print(){
		$("#contentTable").jqprint();
	}
	</script>
	<script type="text/javascript">
	</script>
</head>
<body>
<div class="list-content">
	<div class="nav-operate">
		<div id="importFile" class="hide">
			<form id="importFileForm" action="${ctx}/orbom/orderBomDetail/importStone" method="post" enctype="multipart/form-data"
				style="padding-left:20px;text-align:center;">
			<ul class="modal-body">
				<li>
					<label>
						<input id="multipartFile" name="multipartFile" type="file" style="width:330px"/><br/>
					</label>
				</li>
				<li class="clear"></li>
				<li class="fr">
					<input name="subprojectId" id="subprojectId" type="hidden"/>
					<input name ="orderType" id="orderType" type="hidden" value="2" />
					<input name="orderBomId" id="orderBomId" type="hidden" value="${orderBomBase.id }"/>
					<!-- 变更/补料的原下料单Id -->
					<input name="originalNo" id="originalNo" type="hidden" value="${originalNo }"/>
					<!-- 是否变更/补料的标识 1-补料2-变更 -->
					<input name="isChange" id="isChange" type="hidden" value="${isChange }">
				</li>
			</ul>
			</form>
		</div>
	</div>
	<div class="nav-operate">
		<ul class="operationg-new">
			<li>
				<table>
					<tr>
						<th><!--<form id="returnForm" action="${returnUrl}" method="post" >-->
							<form id="returnForm"  method="post" >
								<input class="btn btn-primary" id="return" type="submit" value="返回">
							</form>
						</th>
						<th>&nbsp;</th>
						<th>
							<form>
								<input type="button" onclick="print()" class="btn btn-primary" value="打印"/>
							</form>
						</th>
					</tr>
				</table>
			</li> 
		</ul>
	</div>		
	<input type="hidden" name="workflowId" id="workflowId" value="${orderBomBase.workflowid }"/>	
	<input type="hidden" name="workflowStatus" id="workflowStatus" value="${orderBomBase.workflowstatus }"/>		
	<form:form id="searchForm" modelAttribute="orderBomDetail" action="${ctx}/orbom/orderBomDetail/list?orderBomId=${orderBomBase.id }" method="post" class="breadcrumb form-search">
	</form:form>
	<div class="form-content">
	<form:form id="inputForm" modelAttribute="orderBomDetail" action="${ctx}/orbom/orderBomDetail/update" method="post" class="form-horizontal magbtm0">
	<%-- <ul>
       	  <li>
             <span class="tab-name">下料单编号：</span>
             <label>
             	 <input type="text" value="${orderBomBase.orderBomNo}" class="input-medium" disabled="disabled"/>
             </label>
          </li>
          <li>
             <span class="tab-name">项目名称：</span>
             <label>
             	 <input type="text" value="${project.name}" class="input-medium" disabled="disabled"/>
             </label>
          </li>
          <li>
             <span class="tab-name">苑区：</span>
             <label>
             	 <input type="text" value="${project.location}" class="input-medium" disabled="disabled"/>
             </label>
          </li>
          <li>
             <span class="tab-name">户型：</span>
             <label>
                  <input type="text" value="${orderBomBase.houseType }" class="input-medium" disabled="disabled"/>
             </label>
          </li>
          <li>
             <span class="tab-name">楼栋号：</span>
             <label>
                  <input type="text" value="${orderBomBase.building }" class="input-medium" disabled="disabled"/>
             </label>
          </li>
          <li>
             <span class="tab-name">饰面处理：</span>
             <label>
                  <input type="text" value="${orderBomBase.facingProcess }" class="input-medium" disabled="disabled"/>
             </label>
          </li>
          <li>
             <span class="tab-name">石材品种：</span>
             <label>
                  <input type="text" value="${orderBomBase.showStoneColorName }" class="input-medium" disabled="disabled"/>
             </label>
          </li>
          <!-- 
          <li>
             <span class="tab-name">立面方向：</span>
             <label>
                  <input type="text" value="${orderBomBase.outsideWallOrientation }" class="input-medium" disabled="disabled"/>
             </label>
          </li>
           -->
    </ul>    --%>
	<sys:messagefororder content="${message}"/>
	<!-- 
	<table id="contentTable" class="table table-striped table-bordered table-condensed resize table-eidt">
	 -->
	<table id="contentTable0" class="table table-striped table-bordered table-condensed resize">
					<tr>
						<th colspan="3"><span class="tab-name">下料单编号：</span></th>
						<th colspan="4"><input type="text" value="${orderBomBase.orderBomNo}" class="input-medium" disabled="disabled"/></th>
						<th colspan="3"><span class="tab-name">项目名称：</span></th>
						<th colspan="4"><input type="text" value="${project.name}" class="input-medium" disabled="disabled"/></th>
						<th colspan="3"><span class="tab-name">苑区：</span></th>
						<th colspan="4"><input type="text" value="${project.location}" class="input-medium" disabled="disabled"/></th>
					</tr>
					<tr>
						<th colspan="3"><span class="tab-name">户型：</span></th>
						<th colspan="4"><input type="text" value="${orderBomBase.houseType }" class="input-medium" disabled="disabled"/></th>
						<th colspan="3"><span class="tab-name">楼栋号：</span></th>
						<th colspan="4"><input type="text" value="${subProject.buildingDisplayName}" class="input-medium" disabled="disabled"/></th>
						<th colspan="3"><span class="tab-name">饰面处理：</span></th>
						<th colspan="4"><input type="text" value="${orderBomBase.facingProcess }" class="input-medium" disabled="disabled"/></th>
					</tr>
					<tr>
						<th colspan="2"><span class="tab-name">石材品种：</span></th>
						<th colspan="19"><input type="text" value="${orderBomBase.showStoneColorName }" class="input-medium" disabled="disabled"/></th>
					</tr>
	</table>
	<div id="scroll-table">
		<div id="scroll-head">
		</div>
		<div id="tbody-scroll" class="tbody-scroll" >
			<table id="contentTable" class="table table-striped table-bordered table-condensed resize">
				<thead >
					<tr>
						<!-- 
						<th class="all-check">
				         <input type="checkbox" id="all-check" >
				         <label for="all-check">全选</label>
			   		    </th>
			   		     -->
			   		    <th rowspan=2>箱号</th>
						<th rowspan=2>板编号</th>
						<th colspan=4>规格（mm）</th>
			   		    <th rowspan=2>数量</th>
						<th rowspan=2>加工图号</th>
						<th rowspan=2>面积（㎡）</th>
						<th rowspan=2>体积 </th>
						<th rowspan=2>倒角边（m）</th>
						<th rowspan=2>饰面面积</th>
						<th rowspan=2>防水面积</th>
						<th rowspan=2>胚料面积</th>
						<th rowspan=2>倒角边数量</th>
						<th rowspan=2>重量</th>
						<th rowspan=2>抛光米数</th>
						<th rowspan=2>备注</th>
						<th colspan=3>胚料尺寸</th>
					</tr>
					<tr>
						<th>内弧半径</th>
						<th>长</th>
						<th>宽</th>
						<th>厚</th>
						<th>长</th>
						<th>宽</th>
						<th>厚</th>
					</tr>
				</thead>
				<tbody>
				
					<c:forEach items="${listTwo}" var="items" varStatus="idx">
		              <tr>
		               <!-- 
		               <td>
		               		<input type="checkbox" name="checkdbox" id="${items.id}" />
		               </td>
		                -->		
		               <input type="hidden" name="list[${idx.index}].id" value="${items.id}" class="hide"/>
		               		<input type="hidden" name="list[${idx.index}].orderBomId" value="${items.orderBomId}" />
		               <td type="tex" class="input-medium" name="list[${idx.index}].boxNo" id="boxNo">${items.boxNo }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].materielNo" id="materielNo">${items.materielNo }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].standardRadius" id="standardRadius">${items.standardRadius }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].standardLong" id="standardLong">${items.standardLong }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].standardWidth" id="standardWidth">${items.standardWidth }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].standardDepth" id="standardDepth">${items.standardDepth }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].count" id="count">${items.count }</td>
		                <td type="text" class="input-medium" name="list[${idx.index}].processChartNo" id="processChartNo">${items.processChartNo }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].area" id="area">${items.area }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].volume" id="volume">${items.volume }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].reversedAngleLong" id="reversedAngleLong">${items.reversedAngleLong }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].facingArea" id="facingArea">${items.facingArea }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].waterproofArea" id="waterproofArea">${items.waterproofArea }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].rohlingArea" id="rohlingArea">${items.rohlingArea }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].reversedAngleCount" id="reversedAngleCount">${items.reversedAngleCount }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].wdight" id="wdight">${items.wdight }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].polish" id="polish">${items.polish }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].remark" id="remark">${items.remark }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].rohlingLong" id="rohlingLong">${items.rohlingLong }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].rohlingWidth" id="rohlingWidth">${items.rohlingWidth }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].rohlingDepth" id="rohlingDepth">${items.rohlingDepth }</td>
		             </tr>
		           </c:forEach>  
		           
				</tbody>
				
			</table>
		</div>
	</div>
	</form:form>
	</div>
</div>
</body>
</html>