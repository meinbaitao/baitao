<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>钢辅材收货事故</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/activitiHeader.jsp"%>
	<script src="${ctxStatic}/modules/accident/scripts/accidentForGFCCollect.js?tsf=${jsVersion}" type="text/javascript"></script>
	<script src="${ctxStatic}/modules/accident/scripts/flowCommonController.js?tsf=${jsVersion}" type="text/javascript"></script>
	<script src="${ctxStatic}/jquery-plugin/jquery-dateFormat.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {form_validate("inputForm"); });
		
	</script>
</head>
<body>
  <div class="list-content" >
      <div class="nav-operate" >
		<ul class="operationg-new" >
			<li>
				<form id="returnForm" action="${ctx}/accident/accidentManage/list?type=2" method="post" >
					<input class="btn btn-primary" type="submit" value="返回">
				</form>
			</li> 
			<li class="editBtn">
				<input type="button" name="editBtn" id="editBtn" class="btn btn-primary" value="保存"/>
			</li>
			<li class="startWorkflow">
				<input type="button" name="startWorkflow" id="startWorkflow" class="btn btn-primary" value="提交"/>
			</li>
			<li class="signWorkflow">
				<input type="button" name="signWorkflow" id="signWorkflow" class="btn btn-primary" value="签收"/>
			</li>
			<li class="okWorkflow">
				<input type="button" name="okWorkflow" id="okWorkflow" class="btn btn-primary" value="通过"/>
			</li>
			<li class="retrunWorkflow">
				<input type="button" name="retrunWorkflow" id="retrunWorkflow" class="btn btn-primary" value="驳回"/>
			</li>
			<li class="showWorkflowImg">
				<input type="button" name="showWorkflowImg" id="showWorkflowImg" class="btn btn-primary" value="流程图"/>
			</li>
			<li class="showWorkflowAuditHistory">
				<input type="button" name="showWorkflowAuditHistory" id="showWorkflowAuditHistory" class="btn btn-primary" value="流程轨迹"/>
			</li>
	    </ul>
	     <div class="clear"></div>
      </div>
     <div class="form-content">
	  <form:form id="inputForm" modelAttribute="accidentManage" action="${ctx}/accident/accidentManage/${flag eq 'add'?'save':'update'}" method="post" class="form-horizontal magbtm0"> 

		  <span id="hiddenFieldsContainer">
			  <input type="hidden" name="id" id="accidentId" value="${accidentManage.id}"/>
			 <input type="hidden" name="type" id="accidentType" value="2"/>
			 <input type="hidden" id="theAccident" value="0"/>
			 <input type="hidden" name="workflowid" id="workflowid" value="${accidentManage.workflowid}"/>
			 <input type="hidden" name="workflowstatus" id="workflowstatus" value="${accidentManage.workflowstatus}"/>
			 <input type="hidden" name="flag" id="flag" value="${flag}"/>
			 <input type="hidden" name="accientNo" id="accientNo" value="${accidentManage.accientNo}"/>
		  </span>

		  <ul>
       	  <li class="cols4">
             <span class="tab-name">采购单编号：</span>
             <label>
				 <select id="purchaseOrderSelect" name="orderId" class="input118">
					 <option value="">--请选择采购单--</option>
					 <c:forEach items="${purchaseSeries}" var="obj" varStatus="idxStatus">
						 <option  value="${obj}"
								 <c:if test="${obj eq accidentManage.orderId}">
									   selected="selected"
						      	</c:if> >${obj}
						 </option>
					 </c:forEach>
				 </select>

             </label>
          </li>
          <li class="cols4">
             <span class="tab-name">要求到货日期：</span>
             <label>
				 <form:input path="requireArriveDate" readonly="true" cssClass="input115" />
             </label>
          </li>
          <li class="cols4">
             <span class="tab-name">实际到货时间：</span>
             <label>
                 <input type="text" name="factArriveDate" id="factArriveDate" value="${accidentManage.factArriveDate}" readonly="readonly" onclick="timeinput()"  class="input115 required Wdate" />
             </label>
          </li>
			  <li class="cols4">
				  <span class="tab-name">是否影响施工：</span>
				  <label>
					  <select name="isConstruct" id="isConstruct" class="input60 required">
						  <option value="0" <c:if test="${'0'==accidentManage.isConstruct}">selected="selected"</c:if>>否</option>
						  <option value="1" <c:if test="${'1'==accidentManage.isConstruct}">selected="selected"</c:if>>是</option>
					  </select>
				  </label>
			  </li>
          <c:forEach items="${accidentManage.asmList}" var="asm" varStatus="idx" >
          <li class="cols4">
             <span>${asm.department}：</span>
             <label>
             	 <input type="hidden" name="asmList[${idx.index}].id" id="departmentId" value="${asm.id}"/>
             	 <input type="hidden" name="asmList[${idx.index}].department" id="asmList[${idx.index}].department" value="${asm.department}"/>
             	 <input type="hidden" name="asmList[${idx.index}].accidentManageId" id="asmList[${idx.index}].accidentManageId" value="${asm.accidentManageId}"/>
                 <input type="text" name="asmList[${idx.index}].name" id="asmList${idx.index}name" value="${asm.name}" class="input115 required"/>
             </label>
          </li>
		  <li class="cols4">
             <span>质量事故金额：</span>
             <label>
                 <input type="text" readonly="readonly" id="asmList[${idx.index}].accidentPrice" name="asmList[${idx.index}].accidentPrice" value="${asm.accidentPrice}" class="input70 number required"/>
             </label>
          </li>
          <li class="cols4">
             <span class="tab-name">罚款金额：</span>
             <label>
                <input type="text" onchange="updateTotal();" id="asmList[${idx.index}].forfeitPrice" name="asmList[${idx.index}].forfeitPrice" value="${asm.forfeitPrice}" class="input70 number required"/>
             </label>
          </li>
          <li class="cols4">
             <span class="tab-name">合计：</span>
             <label>
                 <input type="text" readonly="readonly"  id="asmList[${idx.index}].totalPrice" name="asmList[${idx.index}].totalPrice" value="${asm.totalPrice}" class="input70 number required"/>
             </label>
          </li>
          </c:forEach>

		  <li class="cols4">
			  <span class="tab-name">审核流程：</span>
			  <label>
				  <select id="auditProcess" name="auditProcess" class="input118">
					  <option value="0" <c:if test="${'0'==accidentManage.auditProcess}">selected="selected"</c:if>>设计审核流程</option>
					  <option value="1" <c:if test="${'1'==accidentManage.auditProcess}">selected="selected"</c:if>>供应商审核流程</option>
				  </select>
			  </label>
		  </li>
          <li class="cols4">
             <span class="tab-name">备注：</span>
             <label>
                <form:input path="remarks" id="remarks" htmlEscape="false" maxlength="200" class="input115" value=""/>
             </label>
          </li>
		</ul>	
		
	   <div class="nav-operate" >
		<ul class="operationg-new" >
			<li id="tr_add"><span class="glyphicon glyphicon-plus"></span>添行</li>
			<li id="tr_accident_del"><span class="glyphicon glyphicon-remove"></span>删行</li>
	    </ul>
	   </div>

	 <div class="table_scroll">
	  <table id="contentTable" class="table table-striped table-bordered table-condensed  table-eidt">
			<thead>
			   <tr list="amdList" index="0">
			   		<th class="all-check"  >
						<input type="checkbox" id="all-check">
						<label for="all-check">选择</label>
				    </th>
					<th type="select" class="required input100" name="materielName" id="materielName" tag="materielName">材料名称</th>
					<th type="text" readonly="readonly" class="required input100" name="standardDesc" id="standardDesc" tag="standardDesc">材料规格</th>
					<th type="text" class="number required input60" name="count" id="count">数量</th>
					<th type="text" class="number required input80" name="unitPrice" id="unitPrice">单价</th>
					<th type="text"  readonly="readonly" class="number required input80" name="price" id="price">金额</th>
					<th type="select" class="required input-medium" name="accidentTypeId" id="accidentTypeId" tag="sglx">事故类型</th>
			   		<th type="text"  readonly="readonly" class="input60" id="xmb" name="xmb">项目部</th>
				   <th type="text"  readonly="readonly" class="input60" id="gys" name="gys">供应商</th>
					<th type="text"  readonly="readonly" class="input60" id="wl" name="wl">物流</th>
					<th type="text" class="input-medium" name="problemComment" id="problemComment">问题描述</th>
					<th type="select" class="input80 required" name="solvePlan" id="solvePlan">解决方案</th>
					<th type="text" class="input-medium" name="attchUrl" id="attchUrl">须附资料</th>
					<th type="text" readonly="readonly" onclick="timeinput()" class="input-medium Wdate" name="dataSubmit" id="dataSubmit">资料提交时间</th>
				    <th class="hide" type="hidden"name="orderBomBaseId" id="orderBomBaseId" ></th>
				    <th class="hide" type="hidden"name="purchaseId" id="purchaseId" ></th>
				   	<th class="hide" type="hidden"name="materielNo" id="materielNo" ></th>
			   </tr>	
			</thead>
			<c:if test="${flag eq 'add'}">
				<tbody id="accidentList"  copy="false">
				</tbody>
			</c:if>
			<c:if test="${flag eq 'edit'}">
				<tbody id="accidentList"  copy="false">
				<input type="hidden" name="delId" id="delId" value="">
				<c:forEach items="${accidentManage.amdList}" var="item" varStatus="idx" >
					<tr list="amdList" index="${idx.index}">
						<td type="hidden" name="amdList[${idx.index}].id" value="${item.id}" class="hide"></td>
						<td class="check">
							<input type="checkbox" id="${item.id}" name="subList[${idx.index}].id" value="${item.id}">
						</td>
						<td type="select" class="required input100" name="amdList[${idx.index}].materielName" id="amdList[${idx.index}].materielName" value="${item.materielName }" tag="materielName">${item.materielName }</td>
						<td type="text" class="required input100" name="amdList[${idx.index}].standardDesc" id="amdList[${idx.index}].standardDesc" value="${item.standardDesc }" tag="standardDesc">${item.standardDesc }</td>
						<td type="text" class="number required input60" name="amdList[${idx.index}].count" id="amdList[${idx.index}].count" value="${item.count }">${item.count }</td>
						<td type="text" class="number required input80" name="amdList[${idx.index}].unitPrice" id="amdList[${idx.index}].unitPrice" value="${item.unitPrice }">${item.unitPrice }</td>
						<td name="amdList[${idx.index}].price" id="amdList[${idx.index}].price">
							<input type="text" readonly="true" class="number required input80" name="amdList[${idx.index}].price" id="amdList[${idx.index}].price" value="${item.price }">
						</td>
						<td type="select" class="required input-medium" name="amdList[${idx.index}].accidentTypeId" id="amdList[${idx.index}].accidentTypeId" value="${item.accidentTypeId }" tag="sglx">${item.showtype }</td>
						<td name="amdList[${idx.index}].xmb" id="amdList[${idx.index}].xmb">
							<input type="text" readonly="true" class="input60" name="amdList[${idx.index}].xmb" id="amdList[${idx.index}].xmb" value="${item.xmb }">
						</td>
						<td name="amdList[${idx.index}].jgc" id="amdList[${idx.index}].jgc">
							<input type="text" readonly="true" class="input60" name="amdList[${idx.index}].jgc" id="amdList[${idx.index}].jgc" value="${item.gys }">
						</td>
						<td name="amdList[${idx.index}].wl" id="amdList[${idx.index}].wl">
							<input type="text" readonly="true" class="input60" name="amdList[${idx.index}].wl" id="amdList[${idx.index}].wl" value="${item.wl }">
						</td>

						<td type="text" class="input-medium required" name="amdList[${idx.index}].problemComment" id="amdList[${idx.index}].problemComment" value="${item.problemComment }">${item.problemComment }</td>
						<td>
							<select class="input80 required" name="amdList[${idx.index}].solvePlan" id="amdList[${idx.index}].solvePlan">
				                     <option value="0" <c:if test="${ flag eq 'add' or '0'==item.solvePlan}">selected="selected"</c:if>>补料</option>
									 <option value="1" <c:if test="${'1'==item.solvePlan}">selected="selected"</c:if>>罚款</option>
				            </select>
						</td>
						<td type="text" class="input-medium" name="amdList[${idx.index}].attchUrl" id="amdList[${idx.index}].attchUrl" value="${item.attchUrl }">${item.attchUrl }</td>
						<td type="text" readonly="readonly" onclick="timeinput()" class="input-medium Wdate" name="amdList[${idx.index}].dataSubmit" id="amdList[${idx.index}].dataSubmit" value="${item.dataSubmit }">${item.dataSubmit }</td>
						<td class="hide" type="hidden" name="amdList[${idx.index}].orderBomBaseId" id="amdList[${idx.index}].orderBomBaseId" value="${item.orderBomBaseId}">${item.orderBomBaseId}</td>
						<td class="hide" type="hidden" name="amdList[${idx.index}].purchaseId" id="amdList[${idx.index}].purchaseId" value="${item.purchaseId}">${item.purchaseId}</td>
						<td class="hide" type="hidden" name="amdList[${idx.index}].materielNo" id="amdList[${idx.index}].materielNo" value="${item.materielNo}">${item.materielNo}</td>
					</tr>
		 		</c:forEach>
				</tbody>
			</c:if>
		</table>
		</div>
		<div class="hr_60">
		</div>
	 </form:form>
  </div>
</body>
</html>