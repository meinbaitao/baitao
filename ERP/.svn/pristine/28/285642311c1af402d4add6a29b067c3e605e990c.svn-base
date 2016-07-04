<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>生产结算单管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript"  src="${ctxStatic}/common/common_service.js" ></script>
	<script type="text/javascript">
    	var ctxPath="${ctx}";
    	$(function(){
    		form_validate("inputForm");
    		//提交保存
    		$("#editBtn").on("click",function(){
    			document.inputForm.action=ctxPath+"/finance/manufSettlement/save";
    			document.inputForm.submit();
    		});
    		//匹配价格
    		$("#patchContractPrice").on("click",function(){
    			document.inputForm.action=ctxPath+"/finance/manufSettlement/patchContractPrice";
    			document.inputForm.submit();
    		});
    		//判断是否已付款
    		$(document).ready(function() {
    			var statue = $("#statue").val();
    			if(1 == statue){
    				 $("#editBtn").attr("disabled", "disabled");
    			}
    		});
    	});
    	function page(n,s){
    		$("#pageNo").val(n);
    		$("#pageSize").val(s);
    		$("#searchForm").submit();
    		return false;
    	}
    </script>
</head>
<body>
	<div class="list-content">
		<div class="nav-operate">
			<ul class="operationg-new" >
				<li>
					<input id="btnCancel" class="btn btn-primary" type="button" value="返 回" onclick="history.go(-1)"/>
				</li>
				<shiro:hasAnyRoles name="${fns:getWhitelistsList('jgjs')}">
 				<li>
					<input type="button" name="editBtn" id="editBtn" class="btn btn-primary" value="保存"/>
				</li>
				</shiro:hasAnyRoles>
<%--				<li class="startWorkflow">
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
				<li>
					<input  type="button" name="btnUpload" id="btnUpload" class="btn btn-primary" value="附件"/>
				</li>
				<li id="showAttach">
					<c:forEach items="${attachList}" var="obj">
					<div>
						<a id="${obj.id}" href="${ctx}${obj.attachUrl}/download?id=${obj.id}">${obj.name} </a>&nbsp;&nbsp;<span id="deleteAttach" deleteId="${obj.id }"  class="glyphicon glyphicon-remove-circle"></span></div>
					</c:forEach>
				</li> --%>
	   		 </ul>
		</div>
		
		<div class="form-content">
		<sys:message content="${message}"/>
		<form:form id="inputForm" name="inputForm" modelAttribute="manufSettlement" action="${ctx}/finance/manufSettlement/save" method="post" class="form-horizontal">
			<input type="hidden" id="bindingId" name="id" value="${manufSettlement.id }"/>
			<input type="hidden" id="statue" name="statue" value="${manufSettlement.statue }"/>
<%-- 			<input type="hidden" id="workflowid" name="workflowid" value="${jiaContract.workflowid }"/>
			<input type="hidden" id="workflowstatus" name="workflowstatus" value="${jiaContract.workflowstatus }"/>
			<input type="hidden" name="flag" id="flag" value="${flag}"/> --%>
			<ul>

			<li>
				<span class="tab-name">结算单号：</span>
				<label>
					<input type="text" id="seriesnumber" class="input-medium " readonly="readonly"
						 value="${manufSettlement.seriesnumber }">
				</label>
			</li>
			<li>
				<span class="tab-name">供应商名称：</span>
				<label>
					<input type="text" id="supplier" class="input-medium" readonly="readonly" 
						value="${manufSettlement.supplierName }"> 
				</label>
			</li>
			<li>
				<span class="tab-name">项目简称：</span>
				<label>
					<input type="text" id="projectName" class="input-medium" readonly="readonly" 
						value="${manufSettlement.projectCode }"> 
				</label>
			</li>
			<li>
				<span class="tab-name">不含税总金额：</span>
				<label>
					<input type="text" id="price" name="price" class="input-medium" 
						 value="${manufSettlement.price }"/>
				<span class="help-inline"><font color="red">*</font> </span>
				</label>
			</li>
			</ul>
			
		<div class="nav-operate">
			<shiro:hasAnyRoles name="${fns:getWhitelistsList('jgjs')}">
			<ul class="operationg-new" >
				<li><input type="button" id="patchContractPrice" class="btn btn-primary" value="匹配合同价"/>	</li>
			</ul>
			</shiro:hasAnyRoles>
		</div>
		<div class="table_scroll">
			<table class="table table-striped table-bordered table-condensed">
				<thead>
					<th>下料单编号</th>
					<th>户型</th>
					<th>栋号</th>
					<th>石材类别</th>
					<th>加工类别</th>
					<th colspan="6" style="text-align: center">结算信息</th>
				</thead>
				<tbody id="formView">
					<c:forEach items="${manufSettlement.detailList}" var="mapping" varStatus="idx">
					<tr>
						<td >${mapping.orderBomNo }</td>
						<td >${mapping.houseType }</td>
						<td >${mapping.buildingDisplayName }</td>
						<td >${fns:getDictLabel(mapping.stoneColorName, 'stone_variety', '')}</td>
						<td >${mapping.settlementType }</td>
<%-- 						<td rowspan="${fn:length(mapping.detailList)+2 }">${mapping.orderBomNo }</td>
						<td rowspan="${fn:length(mapping.detailList)+2 }">${mapping.houseType }</td>
						<td rowspan="${fn:length(mapping.detailList)+2 }">${mapping.building }</td>
						<td rowspan="${fn:length(mapping.detailList)+2 }">
							${fns:getDictLabel(mapping.stoneColorName, 'stone_variety', '')}</td>
						<td rowspan="${fn:length(mapping.detailList)+2 }">${mapping.settlementType }</td> --%>
						<td>
							<div class="nav-operate" >
								<ul class="operationg-new  operationg-attach" >
									<li class="tr_add" target="contentTable${idx.index}"><span class="glyphicon glyphicon-plus"></span>添加</li>
									<li class="tr_del" target="contentTable${idx.index}"><span class="glyphicon glyphicon-remove"></span>删除</li>
							    </ul>
						   </div>
							<table id="contentTable${idx.index}" class="table table-striped table-bordered table-condensed table-eidt">
								<thead>
									<tr list="detailList[${idx.index}].detailList">
									    <th class="all-check">
											<input type="checkbox" id="all-check">
											<label for="all-check">选择</label>
										</th>
										<th type="text" class="hide" id="isNewRecord" name="isNewRecord" value="true"></th>
										<th type="text" class=" input130 required" id="manufName" name="manufName">结算项</th>
										<th type="text" class=" input60 required" id="number" name="number">数量</th>
										<th type="text" class=" input60" id="unit" name="unit">单位</th>
										<th type="text" class=" input60" id="price" name="price">单价</th>
										<th type="text" class=" input60" id="sum" name="sum">金额</th>
										<th type="text" class=" input60" id="remarks" name="remarks">备注</th>
									</tr>
								</thead>
								<tbody id="manufList" copy="false">
									<input type="hidden" name="delId" id="delId" value=""/>
									<c:forEach items="${mapping.detailList}" var="detail" varStatus="idxx">
					 					<tr list="detailList" index="${idxx.index }">
											<td class="check">
												<input type="checkbox" id="detailList[${idx.index}].detailList[${idxx.index}].id"
													 name="detailList[${idx.index}].detailList[${idxx.index}].id" value="${detail.id }">
												<input type="hidden"  class="hide" name="detailList[${idx.index}].detailList[${idxx.index}].id" 
													id="detailList[${idx.index}].detailList[${idxx.index}].id" value="${detail.id}"/>
												<input type="hidden"  class="hide" name="detailList[${idx.index}].detailList[${idxx.index}].isNewRecord" 
													id="detailList[${idx.index}].detailList[${idxx.index}].isNewRecord" value="${detail.isNewRecord}"/>
											</td>
											<td>
												<input type="text" class="input130 required" name="detailList[${idx.index}].detailList[${idxx.index}].manufName" 
													id="detailList[${idx.index}].detailList[${idxx.index}].manufName"  value="${detail.manufName}"/></td>
											<td>
												<input type="text" class="input60 required" name="detailList[${idx.index}].detailList[${idxx.index}].number" 
													id="detailList[${idx.index}].detailList[${idxx.index}].number"  value="${detail.number}"/></td>
											<td>
												<input type="text" class="input60 " name="detailList[${idx.index}].detailList[${idxx.index}].unit" 
													id="detailList[${idx.index}].detailList[${idxx.index}].unit"  value="${detail.unit}"/></td>
											<td>
												<input type="text" class="input60 " name="detailList[${idx.index}].detailList[${idxx.index}].price" 
													id="detailList[${idx.index}].detailList[${idxx.index}].price"  value="${detail.price}"/></td>
											<td>
												<input type="text" class="input60 " name="detailList[${idx.index}].detailList[${idxx.index}].sum" 
													id="detailList[${idx.index}].detailList[${idxx.index}].sum"  value="${detail.sum}"/></td>
											<td>
												<input type="text" class="input60 " name="detailList[${idx.index}].detailList[${idxx.index}].remarks" 
													id="detailList[${idx.index}].detailList[${idxx.index}].remarks"  value="${detail.remarks}"/></td>
										 </tr>
							 		</c:forEach>
							 		
								</tbody>
								<tfoot>
									<tr>
										<td colspan="2" style="text-align: center">小计</td>
										<td colspan="5" style="text-align: center">
										<input type="text" class="input200" name="detailList[${idx.index}].fcostdetail" 
												id="detailList[${idx.index}].fcostdetail"  value="${mapping.fcostdetail }"/></td>
									</tr>
								</tfoot>
							</table>
						</td>
					</tr>
					</c:forEach>
					
				</tbody>
			</table>
			
			
<%-- 		<table id="contentTable" class="table table-striped table-bordered table-condensed table-eidt">
			<thead>
				<tr>
					<th>下料单编号</th>
					<th>户型</th>
					<th>栋号</th>
					<th>石材类别</th>
					<th>下料单类别</th>
					<th>结算项</th>
					<th>数量</th>
					<th>单位</th>
					<th>单价</th>
					<th>金额</th>
				</tr>
			</thead>
			<tbody id="formView">
				<c:forEach items="${manufSettlement.detailList}" var="mapping" varStatus="idx">
						<tr>
							<td rowspan="${fn:length(mapping.detailList)+2 }">${mapping.orderBomNo }</td>
							<td rowspan="${fn:length(mapping.detailList)+2 }">${mapping.houseType }</td>
							<td rowspan="${fn:length(mapping.detailList)+2 }">${mapping.building }</td>
							<td rowspan="${fn:length(mapping.detailList)+2 }">
								${fns:getDictLabel(mapping.stoneColorName, 'stone_variety', '')}</td>
							<td rowspan="${fn:length(mapping.detailList)+2 }">${mapping.settlementType }</td>
						</tr>
						 <c:forEach items="${mapping.detailList }" var="detail">
							<tr>
								<td>${detail.manufName }</td>
								<td>${detail.number }</td>
								<td>${detail.unit }</td>
								<td>${detail.price }</td>
								<td>${detail.sum }</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="4">小计</td>
							<td>${mapping.fcostdetail }</td>
						</tr>
		 		</c:forEach>
		 		</tbody>
 		</table> --%>
<%-- 		<table id="contentTableSecond" class="table table-striped table-bordered table-condensed table-eidt">
			<thead>
				<tr>
					<th rowspan="2">下料单编号</th>
					<th rowspan="2">户型</th>
					<th rowspan="2">栋号</th>
					<th rowspan="2">石材类别</th>
					<th rowspan="2">下料单类别</th>
					<th rowspan="2">结算项</th>
					<th colspan="3">胚料规格</th>
					<th rowspan="2">数量</th>
					<th rowspan="2">面积</th>
					<th rowspan="2">单位</th>
					<th rowspan="2">单价</th>
					<th rowspan="2">金额</th>
<!-- 					<th colspan="5" style="text-align: center;"> 结算明细</th> -->
				</tr>
				<tr>
					<td>长</td>
					<td>宽</td>
					<td>厚</td>
				</tr>
			</thead>
			<tbody id="formView">
			<c:if test="${mapping.settlementType eq '圆柱' || mapping.settlementType eq '葫芦瓶'
				|| mapping.settlementType eq '花盆'}">
				<tr>
					<td rowspan="${fn:length(mapping.detailList)+2 }">${mapping.orderBomNo }</td>
					<td rowspan="${fn:length(mapping.detailList)+2 }">${mapping.houseType }</td>
					<td rowspan="${fn:length(mapping.detailList)+2 }">${mapping.building }</td>
					<td rowspan="${fn:length(mapping.detailList)+2 }">
						${fns:getDictLabel(mapping.stoneType, 'stone_variety', '')}
					</td>
					<td rowspan="${fn:length(mapping.detailList)+2 }">${mapping.settlementType }</td>
				</tr>
				 <c:forEach items="${mapping.detailList }" var="detail">
					<tr>
						<td>${detail.manufName }</td>
						<td>${detail.length }</td>
						<td>${detail.width }</td>
						<td>${detail.height }</td>
						<td>${detail.amount }</td>
						<td>${detail.number }</td>
						<td>${detail.unit }</td>
						<td>${detail.price }</td>
						<td>${detail.sum }</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="8">小计</td>
					<td>${mapping.fcostdetail }</td>
				</tr>
			</c:if>
			</tbody>
		</table> --%>
					
		</div>
		
		</form:form>
	</div>
	<div class="hr_60"></div>
</div>
</body>

</html>