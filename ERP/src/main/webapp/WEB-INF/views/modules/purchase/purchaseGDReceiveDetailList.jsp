<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>工地收货 查看详情（钢辅料）</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<%@include file="/WEB-INF/views/include/activitiHeader.jsp"%>
	<script type="text/javascript" src="${ctxStatic}/modules/purchase/scripts/purchase.js?tsf=${jsVersion}"></script>
	<jsp:useBean id="now" class="java.util.Date" />
	<script src="${ctxStatic}/modules/comm/jquery.jqprint-0.3.js?tsf=${jsVersion}" type="text/javascript"></script>
	<script type="text/javascript">
		//验证下单
		function validateSubmitDemand(){
			/* if($("#gys").val()==""){
				window.alertx("供应商不能为空");
				return false;
			} */
			var checks = $("input[name='cBox']:checked");
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
			return true;
		}
		function validateSubmit(){
			/* if($("#gys").val()==""){
				window.alertx("供应商不能为空,请选择供应商并保存再提交");
				return false;
			} */
			var checks = $("input[name='cBox']:checked");
			var ids = "";
			for(var i=0;i<checks.length;i++){
				var id = $(checks[i]).attr("value");
				ids+=id;
				if(i+1<checks.length){
					ids+=",";
				}
			}
			$("#ids").val(ids);
			return true;
		}
		//打印
		function print(){
			$("#contentTable").jqprint();
		}
	</script>
</head>
<body>
	<div class="form-actions">
		<!-- 返回 -->
		<a href="${ctx}/purchase/purchase/purchaseGDReceiveList" class="btn btn-primary">返回</a>&nbsp;
		<%-- <a href="${ctx}/purchase/purchase/purchaseGYSSend?seriesnumber=${seriesnumber}" class="btn btn-primary">确认发货</a> --%>
		<shiro:hasAnyRoles name="${fns:getWhitelistsList('gdsh')}">
		<input type="button" name="saveBtn" id="saveBtn" class="btn btn-primary" value="确认收货">
		</shiro:hasAnyRoles>
		<input type="button" onclick="print()" class="btn btn-primary" value="打印"/>
	</div>
	<div class="list-content">
	     <%-- <sys:message content="${message}"/> --%>
		 <form id="saveForm" modelAttribute="" action="${ctx}/purchase/purchase/purchaseGYSReceive" method="post" onsubmit="javascript:return validateSubmitDemand();" class="form-horizontal">
		      		<input id="sdIDs" name="sdIDs" type="hidden" value=""/>
		      		<input id="vs" name="vs" type="hidden" value=""/>
		      		<input id="ps" name="ps" type="hidden" value=""/>
		      		<input name="seriesnumber" value="${seriesnumber }" type="hidden">
		 <table id="contentTable" class="table table-striped table-bordered table-condensed resize table-eidt">
		   <thead>
		   	<tr>
			     <th style="text-align:center;font-size:20px;" colspan="10">${supp.name }送货单</th>
             </tr>
		   	<tr>
			     <th>项目名称</th>
			     <td>${project.name }</td>
			     <th>订单编号</th>
			     <td>${seriesnumber}</td>
			     <th>制单日期</th>
			     <td colspan="5"><fmt:formatDate value="${createDate}" pattern="yyyy-MM-dd" /></td>
             </tr>
             <tr>
			     <th>供应商</th>
			     <td>${supp.name}
			     	<select style="display:none;" disabled="disabled" id="gys" name="gys" class="input-medium">
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
			     	<select disabled="disabled" id="htbh" name="htbh" class="input-medium">
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
			     <td><fmt:formatDate value="${purchase.requireDate }" pattern="yyyy-MM-dd" /></td>
			     <th>交货地点</th>
			     <td>${supp2.businessAddress}</td>
			     <th>收货人</th>
			     <td>${supp2.businessPreson}</td>
			     <th>联系电话</th>
			     <td colspan="3">${supp2.businessTel}</td>
             </tr>
		   
		   	<tr>
		   		 <th class="all-check">
			         <input checked="checked" type="checkbox" id="all-check"  />
			         <label for="all-check">选择</label>
			     </th>	
		   		 <th>设计下料单编号</th>
		   		 <th>栋号</th>
		   		 <th>材料名称</th>
			     <th>材料规格</th>
			     <!-- <th>材质</th> 因下料单中没有 -->
			     <th>单位</th>
			     <th>订单数量</th>
			     <th>已发数量</th>
			     <th>已收数量</th>
			     <th>收货数量</th>
			     <!-- <th>备注</th> -->
             </tr>
            </thead>
            <tbody>
            	<c:forEach items="${list}" var="p">
			<tr>
				<td>
					<c:choose>
						<c:when test="${p.purchaseSFDetail.fcount-p.purchaseSFDetail.scount gt 0}">
							<input type="checkbox" name="cBox" checked="checked" value="${p.id}">
						</c:when>
						<c:otherwise>
							<%-- <input type="checkbox" disabled="disabled" name="cBox" value="${p.id}"> --%>
						</c:otherwise>
					</c:choose>
				</td>
				<td>${p.purchaseDemand.orderBomBase.orderBomNo}</td>
				<td>${p.purchaseDemand.sub.buildingDisplayName}</td>
				<td>${p.purchaseDemand.orderBomDetail.materielName}</td>
				<td>${p.purchaseDemand.orderBomDetail.size}</td>
				<td>${p.purchaseDemand.orderBomDetail.unit}</td>
				<td>${p.count}</td>
				<td>${p.purchaseSFDetail.fcount}</td>
				<td>${p.purchaseSFDetail.scount}</td>
				<!-- sc -> sendCount -->
				<td><input class="input-min number" type="text" id="sc${p.id}" name="sc${p.id}" value="${p.purchaseSFDetail.fcount-p.purchaseSFDetail.scount}"></td>
				<%-- <td>${p.remarks}</td> --%>
			</tr>
		</c:forEach>
            </tbody>
            
            <tfoot>
            	<c:set var="colspanVal" value="10" />
            	<tr>
					<td colspan="${colspanVal }">备注：</td>
				</tr>
				<tr>
					<td colspan="${colspanVal }">&nbsp;&nbsp;&nbsp;
						1.发货前请务必提前与工地联系人确认送货时间及地点，若收货人要求延迟交货或待通知发货，请当天联系采购中心处理。</td>
				</tr>
				<tr>
					<td colspan="${colspanVal }">&nbsp;&nbsp;&nbsp;
						2.发货后、到货前及时将发货单、物流单、质量检验合格证书等资料扫描或拍照上传附件</td>
				</tr>
				<tr>
					<td colspan="${colspanVal }">质量要求：</td>
				</tr>
				<tr>
					<td colspan="${colspanVal }">&nbsp;&nbsp;&nbsp;
						1、产品需符合国家产品标准。</td>
				</tr>
				<tr>
					<td colspan="${colspanVal }">&nbsp;&nbsp;&nbsp;
						2、送货时，发货单、合格证及质量检验证书务必随货到达工地，否则不收货。</td>
				</tr>
            </tfoot>
		 </table>
		 </form>
	</div>
</body>

</html>