<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>窗侧下料单明细管理</title>
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
	/* $(function(){
		//按立面方向查询
		$("#outsideWallOrientation").unbind("change").bind("change",function(){
			var outsideWallOrientation = $(this).val();//立面方向
			var orderBomId = $("#orderBomId");
			var inputForm = $('#importFileForm');
			inputForm.attr('action',startUp.getRootPath()+"/a/orbom/orderBomDetail/list?orderType=10&orderBomId="+orderBomId+"&outsideWallOrientation="+outsideWallOrientation);
			inputForm.submit();				
		});
	}); */
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
           <li>
             <span class="tab-name">立面方向：</span>
             <label>
                  <select id="outsideWallOrientation" name="outsideWallOrientation" class="input-small">
					<option value="">全部</option>
					<option value="东面" <c:if test="${outsideWallOrientation == '东面'}">selected="selected"</c:if>>东面</option>
					<option value="南面" <c:if test="${outsideWallOrientation == '南面'}">selected="selected"</c:if>>南面</option>
					<option value="西面" <c:if test="${outsideWallOrientation == '西面'}">selected="selected"</c:if>>西面</option>
					<option value="北面" <c:if test="${outsideWallOrientation == '北面'}">selected="selected"</c:if>>北面</option>
				 </select>
             </label>
          </li>
    </ul>    --%>
	<sys:messagefororder content="${message}"/>
	<!-- 
	<table id="contentTable" class="table table-striped table-bordered table-condensed resize table-eidt">
	 -->
	<table id="contentTable0" class="table table-striped table-bordered table-condensed resize">
					<tr>
						<th colspan="2"><span class="tab-name">下料单编号：</span></th>
						<th colspan="3"><input type="text" value="${orderBomBase.orderBomNo}" class="input-medium" disabled="disabled"/></th>
						<th colspan="2"><span class="tab-name">项目名称：</span></th>
						<th colspan="3"><input type="text" value="${project.name}" class="input-medium" disabled="disabled"/></th>
						<th colspan="2"><span class="tab-name">苑区：</span></th>
						<th colspan="3"><input type="text" value="${project.location}" class="input-medium" disabled="disabled"/></th>
					</tr>
					<tr>
						<th colspan="2"><span class="tab-name">户型：</span></th>
						<th colspan="3"><input type="text" value="${orderBomBase.houseType }" class="input-medium" disabled="disabled"/></th>
						<th colspan="2"><span class="tab-name">楼栋号：</span></th>
						<th colspan="3"><input type="text" value="${subProject.buildingDisplayName }" class="input-medium" disabled="disabled"/></th>
						<th colspan="2"><span class="tab-name">饰面处理：</span></th>
						<th colspan="3"><input type="text" value="${orderBomBase.facingProcess }" class="input-medium" disabled="disabled"/></th>
					</tr>
					<tr>
						<th colspan="2"><span class="tab-name">石材品种：</span></th>
						<th colspan="3"><input type="text" value="${orderBomBase.showStoneColorName }" class="input-medium" disabled="disabled"/></th>
						<th colspan="2"><span class="tab-name">立面方向：</span></th>
						<input type="hidden" name="orderBomId" id="orderBomId" value="${orderBomBase.id }"/>	
						<th colspan="3">
							<select id="outsideWallOrientation" name="outsideWallOrientation" title="showdetail" class="input-small">
								<option value="">全部</option>
								<c:forEach items="${outsideWallOrientationList}" var="outside" varStatus="idx">
								<option value="${outsideWallOrientationList[idx.index] }" 
								<c:if test="${outsideWallOrientation eq outsideWallOrientationList[idx.index]}">selected="selected"</c:if>>${outsideWallOrientationList[idx.index] }</option>
								</c:forEach>
				 			</select>
				 		</th>
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