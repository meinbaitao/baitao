<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>腰线下料单明细管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/activitiHeader.jsp"%>
	<script src="${ctxStatic}/modules/orbom/scripts/orderBom.js?tsf=${jsVersion}" type="text/javascript"></script>
	<script type="text/javascript" src="${ctxStatic}/common/common_service.js"></script>
	<script type="text/javascript" src="${ctxStatic}/ajaxfileupload/ajaxfileupload.js" ></script>
	<script type="text/javascript">
/* 	$(function(){
		$(document).ready(function() {form_validate("inputForm"); });
		//按立面方向查询
		$("#outsideWallOrientation").unbind("change").bind("change",function(){
			var outsideWallOrientation = $(this).val();//立面方向
			var orderBomId = $("#orderBomId");
			var inputForm = $('#importFileForm');
			inputForm.attr('action',startUp.getRootPath()+"/a/orbom/orderBomDetail/list?orderType=2&orderBomId="+orderBomId+"&outsideWallOrientation="+outsideWallOrientation);
			inputForm.submit();				
		});
	}); */
	</script>
</head>
<body>
<div class="list-content">
	<%@ include file="/WEB-INF/views/modules/orbom/detailButtonOrder.jsp"%>		
	<div class="form-content">
	<form:form id="inputForm" modelAttribute="orderBomDetail" action="${ctx}/orbom/orderBomDetail/update" method="post" class="form-horizontal magbtm0">
	<ul>
       	  <%@ include file="/WEB-INF/views/modules/orbom/detailItemOrder.jsp"%>
          <%@ include file="/WEB-INF/views/modules/orbom/detailoutsideWallOrientationOrder.jsp"%>
    </ul>   
	<sys:messagefororder content="${message}"/>
	<!-- 
	<table id="contentTable" class="table table-striped table-bordered table-condensed resize table-eidt">
	 -->
	
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
						<th rowspan=2>石材编号</th>
						<th colspan=4>规格（mm）</th>
			   		    <th rowspan=2>数量</th>
			   		    <th colspan=2>切角/转头</th>
						<th rowspan=2>组装图</th>
						<th rowspan=2>面积（㎡）</th>
						<th rowspan=2>体积 </th>
						<th rowspan=2>重量 </th>
						<th rowspan=2>切角个数</th>
						<th rowspan=2>转头个数</th>
						<th rowspan=2>备注</th>
						<th rowspan=2>滴水槽（m）</th>
						<th rowspan=2>线密度（kg/m）</th>
						<th rowspan=2>饰面面积</th>
						<th rowspan=2>防水面积</th>
						<th rowspan=2>胚料面积</th>
						<th colspan=3>胚料尺寸</th>
						<th rowspan=2>立面方向</th>
						<th rowspan=2>是否为弧形线条</th>
						<th rowspan=2>背切数量</th>
					</tr>
					<tr>
						<th>半径</th>
						<th>长</th>
						<th>宽</th>
						<th>厚</th>
						<th>左</th>
						<th>右</th>
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
		               <td type="text" class="input-medium" name="list[${idx.index}].cutTurnLeft" id="cutTurnLeft">${items.cutTurnLeft }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].cutTurnRight" id="cutTurnRight">${items.cutTurnRight }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].assemblyDiagramNo" id="assemblyDiagramNo">${items.assemblyDiagramNo }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].area" id="area">${items.area }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].volume" id="volume">${items.volume }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].wdight" id="wdight">${items.wdight }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].cutAngleCount" id="cutAngleCount">${items.cutAngleCount }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].turnAngleCount" id="turnAngleCount">${items.turnAngleCount }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].remark" id="remark">${items.remark }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].waterSlotM" id="waterSlotM">${items.waterSlotM }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].lineDensity" id="lineDensity">${items.lineDensity }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].facingArea" id="facingArea">${items.facingArea }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].waterproofArea" id="waterproofArea">${items.waterproofArea }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].rohlingArea" id="rohlingArea">${items.rohlingArea }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].rohlingLong" id="rohlingLong">${items.rohlingLong }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].rohlingWidth" id="rohlingWidth">${items.rohlingWidth }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].rohlingDepth" id="rohlingDepth">${items.rohlingDepth }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].outsideWallOrientation" id="outsideWallOrientation">${items.outsideWallOrientation }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].isFamilyLine" id="isFamilyLine">${items.isFamilyLine }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].backCutCount" id="backCutCount">${items.backCutCount }</td>
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