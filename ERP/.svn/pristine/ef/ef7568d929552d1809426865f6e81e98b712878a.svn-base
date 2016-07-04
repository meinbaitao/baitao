<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>采购单详情（钢辅料）</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<%@include file="/WEB-INF/views/include/activitiHeader.jsp"%>
	<jsp:useBean id="now" class="java.util.Date" />
	<script type="text/javascript" src="${ctxStatic}/modules/purchase/scripts/purchase.js?tsf=${jsVersion}"></script>
	<script type="text/javascript" src="${ctxStatic}/modules/purchase/scripts/validateActBtn.js?tsf=${jsVersion}"></script>
	<script src="${ctxStatic}/modules/comm/jquery.jqprint-0.3.js?tsf=${jsVersion}" type="text/javascript"></script>
	<script type="text/javascript">
		//验证下单
		function validateSubmitDemand(){
			if($("#gys").val()==""){
				window.alertx("供应商不能为空");
				loaded();
				return false;
			}
			var checks = $("input[name='cBox']");
			var ids = "";
			var ps = "";
			var vs = "";
			for(var i=0;i<checks.length;i++){
				var id = $(checks[i]).attr("value");
				var p = $("#price"+id).val();
				var v = $("#count"+id).val();
				ids+=id;
				ps+=p;
				vs+=v;
				if(i+1<checks.length){
					ids+=",";
					ps+=",";
					vs+=",";
				}
			}
			$("#sdIDs").val(ids);
			$("#ps").val(ps);
			$("#vs").val(vs);
			$("#sIsprovince").val($("input[name='isprovince']:checked").val());
			return true;
		}
		function validateSubmit(){
			if($("#gys").val()==""){
				window.alertx("供应商不能为空,请选择供应商并保存再提交");
				loaded();
				return false;
			}
			var checks = $("input[name='cBox']");
			var ids = "";
			for(var i=0;i<checks.length;i++){
				var id = $(checks[i]).attr("value");
				ids+=id;
				if(i+1<checks.length){
					ids+=",";
				}
			}
			$("#ids").val(ids);
			$("#mIsprovince").val($("input[name='isprovince']:checked").val());
			return true;
		}
		/* $(document).ready(function() {
			var wfID="${wfID }";
			var wfStatus="${wfStatus }";
			validateBtn(wfID,wfStatus);
		}); */
		//打印
		function print(){
			$("#requireDateTD").html($("requireDate").val());
			$("#contentTable").jqprint();
		}
	</script>
</head>
<body>
	<!-- 流程提交 -->
	<form:form style="display:none;" id="submitACTForm" action="${ctx}/purchase/purchase/submitACTGFL" onsubmit="javascript:return validateSubmit();" method="post" class="breadcrumb form-search">
		<input id="ids" name="sdIDs" type="hidden" value=""/>
		<input id="mIsprovince" name="isprovince" type="hidden" value=""/>
	</form:form>
	<!-- 流程通过，进行下一步 -->
	<form:form style="display:none;" id="passACTForm" action="${ctx}/purchase/purchase/passACTGFL" onsubmit="javascript:return validateSubmit();" method="post" class="breadcrumb form-search">
		<input name="wfID" value="${wfID }" type="text">
	</form:form>
	<!-- 驳回流程 -->
	<form:form style="display:none;" id="rebutACTForm" action="${ctx}/purchase/purchase/rebutACTGFL" method="post" class="breadcrumb form-search">
		<input name="seriesnumber" value="${seriesnumber }" type="text">
		<input name="message" id="rebutMessage" value="" type="text">
		<input name="wfID" id="rebutWFID" value="" type="text">
	</form:form>
	<div style="display:none;">
		<input name="wfID" id="wfID" value="${wfID }" type="hidden">
		<input name="wfStatus" id="wfStatus" value="${wfStatus }" type="hidden">
	</div>
	<div class="form-actions">
		<!-- 返回 -->
		<%-- <a href="${ctx}/purchase/purchase/purchaseGFLList" class="btn btn-primary">返回</a> --%>
		<input onclick="history.go(-1);" type="button" name="returnBtn" id="returnBtn" class="btn btn-primary" value="返回">
		<shiro:hasAnyRoles name="${fns:getWhitelistsList('dcggfl')}">
		<!-- 保存 -->
		<input disabled="disabled" type="button" name="save" id="save" class="btn btn-primary" value="保存">
		<!-- 提交流程 -->
        <input disabled="disabled" type="button" name="submitACT" id="submitACT" class="btn btn-primary" value="提交">
		</shiro:hasAnyRoles>
        
		<!-- 通过，流程进入下一步 -->
		<input style="display:none;" type="button" name="passACT" id="passACT" class="btn btn-primary" value="提交">
		<!-- 签收 -->
		<input disabled="disabled" type="button" name="signACT" id="signACT" class="btn btn-primary" value="签收">
		<!-- 驳回 -->
		<input disabled="disabled" type="button" name="rebutACT" id="rebutACT" class="btn btn-primary" value="驳回">
		<!-- 流程图 -->
		<c:choose>
			<c:when test="${wfStatus gt 0 }">
				<input type="button" wfID="${wfID }" wfStatus="${wfStatus }" name="trackACT" id="trackACT" class="btn btn-primary" value="流程图">
				<input type="button" name="showWorkflowAuditHistory" id="showWorkflowAuditHistory" class="btn btn-primary" value="流程轨迹"/>
			</c:when>
			<c:otherwise>
				<input disabled="disabled" type="button" name="trackACT" id="trackACT" class="btn btn-primary" value="流程图">
				<input disabled="disabled" type="button" name="showWorkflowAuditHistory" id="showWorkflowAuditHistory" class="btn btn-primary" value="流程轨迹"/>
			</c:otherwise>
		</c:choose>

   		<input type="button" onclick="print()" class="btn btn-primary" value="打印"/>
	</div>
	<div class="list-content">
	     <%-- <sys:message content="${message}"/> --%>
	   <form id="saveForm" modelAttribute="purchase" action="${ctx}/purchase/purchase/savePurchaseGFL" method="post" onsubmit="javascript:return validateSubmitDemand();" class="form-horizontal">
		      		<input id="sdIDs" name="sdIDs" type="hidden" value=""/>
		      		<input id="vs" name="vs" type="hidden" value=""/>
		      		<input id="ps" name="ps" type="hidden" value=""/>
		      		<input id="sIsprovince" name="isprovince" type="hidden" value=""/>
		      		<input name="seriesnumber" value="${seriesnumber }" type="hidden">
		 <table id="contentTable" class="table table-striped table-bordered table-condensed resize table-eidt">
		   <thead>
		   	<tr>
			     <th>项目名称</th>
			     <td >${project.name }</td>
			     <th>订单编号</th>
			     <td>${seriesnumber}</td>
			     <th>制单日期</th>
			     <td width="75"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></td>
			     <th>价格类型<!-- <br>（如：省内/外） --></th>
			     <td colspan="2">
			     	<c:forEach items="${fns:getDictList('price_type')}"  var="obj">
			     		 <label><input <c:if test="${(purchase.isProvince eq fns:escapeHtml(obj.value)) or (fns:escapeHtml(obj.value) eq '1')}">checked='checked'</c:if> type="radio" name="isprovince" value="${fns:escapeHtml(obj.value)}" >${fns:escapeHtml(obj.label)}</label>
			     	</c:forEach><span class='red'>*</span>
			     	 </td>
             </tr>
             <tr>
			     <th>供应商</th>
			     <td>
			     	<select id="gys" name="gys" class="input-medium">
	                    <option value="">请选择</option>
	                  	<c:forEach items="${listPCB}" var="obj">
							<c:choose>
								<c:when test="${fns:escapeHtml(obj.supp.id) eq supp.id}">
									<option selected="selected" contact="${fns:escapeHtml(obj.partyBEntrustedAgent)}" contactphone="${fns:escapeHtml(obj.partyBTel)}" attrName="${fns:escapeHtml(obj.partyBName)}" value="${fns:escapeHtml(obj.supp.id)}" >${fns:escapeHtml(obj.supp.name)}</option>
								</c:when>
								<c:otherwise>
									<option contact="${fns:escapeHtml(obj.partyBEntrustedAgent)}" contactphone="${fns:escapeHtml(obj.partyBTel)}" attrName="${fns:escapeHtml(obj.partyBName)}" value="${fns:escapeHtml(obj.supp.id)}" >${fns:escapeHtml(obj.supp.name)}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
               		</select>
			     </td>
			     <%-- <th>合同编号</th>
			     <td>
			     	<select id="htbh" name="htbh" class="input-medium">
	                    <option value="">请选择</option>
	                    <c:if test="${not empty purchasingContractBase}">
	                    	<option selected="selected" value="${purchasingContractBase.id}" >${purchasingContractBase.contractNo}</option>
	                    </c:if>
               		</select>
			     </td> --%>
			     <th>联系人</th>
			     <td id="businessPreson">${supp.businessPreson }&nbsp;</td>
			     <th>联系电话</th>
			     <td colspan="5" id="businessTel">${supp.businessTel }&nbsp;</td>
             </tr>
             <tr>
			     <th>要求到货时间</th>
			     <td id="requireDateTD">
			     	<input id="requireDate" name="requireDate" type="text" class="input-medium Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" value="<fmt:formatDate value="${requireDate }" pattern="yyyy-MM-dd" />" /></td>
			     <th>交货地点</th>
			     <td>${supp2.businessAddress}</td>
			     <th>收货人</th>
			     <td>${supp2.businessPreson}</td>
			     <th>联系电话</th>
			     <td colspan="2">${supp2.businessTel}</td>
             </tr>
		   
		   	<tr>	
		   		 <th>设计下料单编号</th>
		   		 <th>栋号</th>
		   		 <th>材料名称</th>
			     <th>材料规格</th>
			     <!-- <th>材质</th> 因下料单中没有 -->
			     <th>单位</th>
			     <th>订单数量</th>
			     <th>单价</th>
			     <th>金额</th>
			     <th>备注</th>
             </tr>
            </thead>
            <tbody>
            	<c:forEach items="${list}" var="p">
				<input style="display:none;" type="checkbox" name="cBox" checked="checked" value="${p.id}">
			<tr>
				<td>${p.purchaseDemand.orderBomBase.orderBomNo}</td>
				<td>${p.purchaseDemand.sub.buildingDisplayName}</td>
				<td>${p.purchaseDemand.orderBomDetail.materielName}</td>
				<td>${p.purchaseDemand.orderBomDetail.size}</td>
				<td>${p.purchaseDemand.orderBomDetail.unit}</td>
				<td id="countTD${p.purchaseDemand.orderBomDetail.materielNo}">${p.count}</td>
				<td id="priceTD${p.purchaseDemand.orderBomDetail.materielNo}" attrId="priceTD${p.purchaseDemand.orderBomDetail.materielNo}" attrNo="${p.purchaseDemand.orderBomDetail.materielNo}" name="priceTD">&nbsp;</td>
				<td id="sumPriceTD${p.purchaseDemand.orderBomDetail.materielNo}" attrId="sumPriceTD${p.purchaseDemand.orderBomDetail.materielNo}" attrNo="${p.purchaseDemand.orderBomDetail.materielNo}" name="sumPriceTD">&nbsp;</td>
				<td><input name="remarks${p.id}" id="remarks${p.id}" value="${p.remarks}" type="text" class="input-medium"></td>
			</tr>
		</c:forEach>
            </tbody>
            
            <tfoot>
            	<tr>
					<td >总计：</td>
					<td colspan="4"></td>
					<td id="sumCountTD"></td>
					<td ></td>
					<td id="sumPriceTD"></td>
					<td ></td>
				</tr>
            	<tr>
					<td colspan="9">备注：</td>
				</tr>
				<tr>
					<td colspan="9">&nbsp;&nbsp;&nbsp;
						1.发货前请务必提前与工地联系人确认送货时间及地点，若收货人要求延迟交货或待通知发货，请当天联系采购中心处理。</td>
				</tr>
				<tr>
					<td colspan="9">&nbsp;&nbsp;&nbsp;
						2.发货后、到货前及时将发货单、物流单、质量检验合格证书等资料扫描或拍照上传附件</td>
				</tr>
				<tr>
					<td colspan="9">质量要求：</td>
				</tr>
				<tr>
					<td colspan="9">&nbsp;&nbsp;&nbsp;
						1、产品需符合国家产品标准。</td>
				</tr>
				<tr>
					<td colspan="9">&nbsp;&nbsp;&nbsp;
						2、送货时，发货单、合格证及质量检验证书务必随货到达工地，否则不收货。</td>
				</tr>
            </tfoot>
		 </table>
	  </form>
	</div>
<script type="text/javascript">
	$(document).ready(function() {
		/* changeHtbh(); */
		changeGYS();
	});
</script>
</body>

</html>