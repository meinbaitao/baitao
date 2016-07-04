<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>骨架下料单明细管理</title>
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
</head>
<body>
	<div class="list-content">
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
	<form:form modelAttribute="orderBomDetail" action="${ctx}/orbom/orderBomDetail/update" method="post" class="form-horizontal magbtm0">
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
    </ul>   
	<sys:messagefororder content="${message}"/> --%>
	<!-- 
	<table id="contentTable" class="table table-striped table-bordered table-condensed resize table-eidt">
	 -->
	 <table id="contentTable0" class="table table-striped table-bordered table-condensed resize">
	 				<tr>
						<th colspan="1"><span class="tab-name">下料单编号：</span></th>
						<th colspan="3"><input type="text" value="${orderBomBase.orderBomNo}" class="input-medium" disabled="disabled"/></th>
						<th colspan="2"><span class="tab-name">项目名称：</span></th>
						<th colspan="1"><input type="text" value="${project.name}" class="input-medium" disabled="disabled"/></th>
						<th colspan="2"><span class="tab-name">苑区：</span></th>
						<th colspan="1"><input type="text" value="${project.location}" class="input-medium" disabled="disabled"/></th>
					</tr>
					<tr>
						<th colspan="1"><span class="tab-name">户型：</span></th>
						<th colspan="3"><input type="text" value="${orderBomBase.houseType }" class="input-medium" disabled="disabled"/></th>
						<th colspan="2"><span class="tab-name">楼栋号：</span></th>
						<th colspan="4"><input type="text" value="${subProject.buildingDisplayName }" class="input-medium" disabled="disabled"/></th>
					</tr>
	 </table>
	 <div id="scroll-table">
		<div id="scroll-head">
		</div>
		<div id="tbody-scroll" class="tbody-scroll">
			<table id="contentTable" class="table table-striped table-bordered table-condensed resize">
				<thead>
					<tr>
						<!-- 
						<th class="all-check">
				         <input type="checkbox" id="all-check" >
				         <label for="all-check">全选</label>
			   		    </th>
			   		     -->
						<th>材料编号</th>
						<th>材料名称</th>
						<th>材料类别</th>
						<th>材质</th>
						<th>材料规格</th>
						<th>数量</th>
						<th>单位</th>
						<th>单位重量（kg）</th>
						<th>总重量（kg）</th>
						<th>备注</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listOne}" var="items" varStatus="idx">
		              <tr>
		               <!-- 
		               <td>
		               		<input type="checkbox" name="checkdbox" id="${items.id}" />
		               </td>
		                -->		
		               <input type="hidden" name="list[${idx.index}].id" value="${items.id}" class="hide"/>
		               		<input type="hidden" name="list[${idx.index}].orderBomId" value="${items.orderBomId}" />
		               <td type="text" class="input-medium" name="list[${idx.index}].materielNo" id="materielNo">${items.materielNo }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].materielName" id="materielName">${items.materielName }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].materielType" id="materielType">${items.materielType }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].materials" id="materials">${items.materials }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].standardDesc" id="standardDesc">${items.standardDesc }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].count" id="count">${items.count }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].unit" id="unit">${items.unit }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].unitWeight" id="unitWeight">${items.unitWeight }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].wdight" id="wdight">${items.wdight }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].remark" id="remark">${items.remark }</td>
		             </tr>
		           </c:forEach>  
				</tbody>
			</table>
		</div>
	</div>
	<div class="hr_60"></div>
	</form:form>
	</div>
	</div>
</body>
</html>