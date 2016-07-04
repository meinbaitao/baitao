<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>屋檐板下料单明细管理</title>
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
			inputForm.attr('action',startUp.getRootPath()+"/a/orbom/orderBomDetail/list?orderType=9&orderBomId="+orderBomId+"&outsideWallOrientation="+outsideWallOrientation);
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
						<th colspan=3>规格（mm）</th>
			   		    <th rowspan=2>数量</th>
						<th rowspan=2>左开角</th>
						<th rowspan=2>右开角</th>
						<th rowspan=2>面积（㎡）</th>
						<th colspan=2>开角米数（m）</th>
						<th rowspan=2>开槽米数（m）</th>
						<th rowspan=2>重量（kg）</th>
						<th rowspan=2>立面方向</th>
						<th rowspan=2>抛光米数</th>
						<th rowspan=2>备注</th>
					</tr>
					<tr>
						<th>长</th>
						<th>宽</th>
						<th>厚</th>
						<th>A/B</th>
						<th>C/D</th>
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
		               <td type="text" class="input-medium" name="list[${idx.index}].standardLong" id="standardLong">${items.standardLong }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].standardWidth" id="standardWidth">${items.standardWidth }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].standardDepth" id="standardDepth">${items.standardDepth }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].count" id="count">${items.count }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].leftOpenAngle" id="leftOpenAngle">${items.leftOpenAngle }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].rightOpenAngle" id="rightOpenAngle">${items.rightOpenAngle }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].area" id="area">${items.area }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].openAngleMOne" id="openAngleMOne">${items.openAngleMOne }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].openAngleMTwo" id="openAngleMTwo">${items.openAngleMTwo }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].openSlotM" id="openSlotM">${items.openSlotM }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].wdight" id="wdight">${items.wdight }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].outsideWallOrientation" id="outsideWallOrientation">${items.outsideWallOrientation }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].polish" id="polish">${items.polish }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].remark" id="remark">${items.remark }</td>
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