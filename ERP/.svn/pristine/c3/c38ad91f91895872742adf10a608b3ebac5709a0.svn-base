<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>黑材采购单</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<%@include file="/WEB-INF/views/include/activitiHeader.jsp"%>
	<script type="text/javascript" src="${ctxStatic}/modules/purchase/scripts/purchase.js?tsf=${jsVersion}"></script>
	<script type="text/javascript" src="${ctxStatic}/modules/purchase/scripts/validateActBtn.js?tsf=${jsVersion}"></script>
	<script type="text/javascript">
		//验证下单
		function validateSubmitDemand(){
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
			return true;
		}
		function validateSubmit(){
			if($("#gys").val()==""){
				window.alertx("供应商不能为空,请选择供应商并保存再提交");
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
			return true;
		}
		$(document).ready(function() {
			var wfID="${wfID }";
			var wfStatus="${wfStatus }";
			validateBtn(wfID,wfStatus);
		});
	</script>
</head>
<body>
	<!-- 流程提交 -->
	<form:form style="display:none;" id="submitACTForm" action="${ctx}/purchase/purchase/submitACTHC" onsubmit="javascript:return validateSubmit();" method="post" class="breadcrumb form-search">
		<input id="ids" name="sdIDs" type="hidden" value=""/>
	</form:form>
	<!-- 流程通过，进行下一步 -->
	<form:form style="display:none;" id="passACTForm" action="${ctx}/purchase/purchase/passACTHC" onsubmit="javascript:return validateSubmit();" method="post" class="breadcrumb form-search">
		<input name="wfID" value="${wfID }" type="text">
	</form:form>
	<!-- 驳回流程 -->
	<form:form style="display:none;" id="rebutACTForm" action="${ctx}/purchase/purchase/rebutACTHC" method="post" class="breadcrumb form-search">
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
		<a href="${ctx}/purchase/purchase/purchaseHCList" class="btn btn-primary">返回</a>
		<!-- 保存 -->
		<input disabled="disabled" type="button" name="save" id="save" class="btn btn-primary" value="保存">
        <!-- 提交流程 -->
        <input disabled="disabled" type="button" name="submitACT" id="submitACT" class="btn btn-primary" value="提交">
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
			</c:when>
			<c:otherwise>
				<input disabled="disabled" type="button" name="trackACT" id="trackACT" class="btn btn-primary" value="流程图">
			</c:otherwise>
		</c:choose>
		
	</div>
	<div class="list-content">
	     <sys:message content="${message}"/>
		 <table id="contentTable" class="table table-striped table-bordered table-condensed resize table-eidt width-75">
		   <thead>
		   	<tr>
			     <th class="all-check">
			         <input type="checkbox" id="all-check"  />
			         <label for="all-check">选择</label>
			     </th>
			     <th>订单编号</th>
			     <th>材料名称</th>
			     <th>采购数量</th>
			     <!-- <th>库存数量</th> -->
		     	 <!-- <th>采购下单数量</th> -->
			     <th>单价(元/公斤)</th>
			     <!-- <th>状态</th> -->
			     <th>制单日期</th>
             </tr>
            </thead>
            <tbody>
            	<c:forEach items="${page.list}" var="p">
			<tr>
				<td><input type="checkbox" name="cBox" checked="checked" value="${p.id}">
					<%-- <c:choose>
						<c:when test="${p.status eq isStatus}">
							
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="cboxs" disabled="disabled" value="">
						</c:otherwise>
					</c:choose> --%>
				</td>
				<td>
					${p.seriesnumber}
				</td>
				<td>
					${p.mtype}
				</td>
				<%-- <td>
					${p.count}
				</td> --%>
				<td><input style="width:80px;height:11px;" id="count${p.id}" type="text" value="${p.count}"/></td>
				<c:choose>
					<c:when test="${p.status eq isStatus}">
						<%-- <td><input style="width:80px;height:11px;" id="txt${pd.id}" type="text" value=""/></td> --%>
						<td><input style="width:80px;height:11px;" id="price${p.id}" type="text" value="${p.price }"/></td>
					</c:when>
					<c:otherwise>
						<!-- <td>&nbsp;</td> -->
						<td><input style="width:80px;height:11px;" id="price${p.id}" type="text" value="${p.price}"/></td>
					</c:otherwise>
				</c:choose>
				
				<td><fmt:formatDate value="${p.createDate}" pattern="yyyy-MM-dd" /></td>
			</tr>
		</c:forEach>
            </tbody>  
		 </table>
		 <div class="div_right" id="CPDiv">
			 <form id="saveForm" modelAttribute="" action="${ctx}/purchase/purchase/savePurchaseHC" method="post" onsubmit="javascript:return validateSubmitDemand();" class="form-horizontal">
		      		<input id="sdIDs" name="sdIDs" type="hidden" value=""/>
		      		<input id="vs" name="vs" type="hidden" value=""/>
		      		<input id="ps" name="ps" type="hidden" value=""/>
		      		<input id="pseriesnumber" name="seriesnumber" type="hidden" value="${seriesnumber }"/>
		       <h3><i></i></h3>
		        <ul>
		       	   <li>
		             <span class="tab-name">
		             	供应商：
		             </span>
		             <label>
		                  <select id="gys" name="gys" class="input-medium">
			                    <option value="">请选择</option>
			                  	<%-- <c:forEach items="${fns:getSuppByType('supp_gys')}" var="obj">
									<c:choose>
										<c:when test="${fns:escapeHtml(obj.id) eq supp.id}">
											<option selected="selected" contact="${fns:escapeHtml(obj.contact)}" contactphone="${fns:escapeHtml(obj.contactphone)}" value="${fns:escapeHtml(obj.id)}" >${fns:escapeHtml(obj.name)}</option>
										</c:when>
										<c:otherwise>
											<option contact="${fns:escapeHtml(obj.contact)}" contactphone="${fns:escapeHtml(obj.contactphone)}" value="${fns:escapeHtml(obj.id)}" >${fns:escapeHtml(obj.name)}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach> --%>
		               		</select>
		             </label>
		          </li>
		          <li>
		             <span class="tab-name">
		             	联系人：</span>
		             	<label>
		                  <%-- <input id="contact" disabled="disabled" type="text" value="${supp.contact }"/> --%>
		             </label>
		             	
		          </li>
		          <li>
		             <span class="tab-name">
		             	电话：</span>
		             	<label>
		                  <%-- <input id="contactphone" disabled="disabled" type="text" value="${supp.businessTel }"/> --%>
		             </label>
		             	
		          </li>
		          <li>
		             <span class="tab-name">收货镀锌厂：</span>
		             <label>
		                 <!-- <input type="text" value=""/> -->
		                 <select id="commadd" name="saddress" class="input-medium">
			                    <option value="">请选择</option>
			                   <%--  <c:forEach items="${fns:getSuppByType('supp_gys')}" var="obj">
									<c:choose>
										<c:when test="${fns:escapeHtml(obj.id) eq supp2.id}">
											<option selected="selected" contact="${fns:escapeHtml(obj.contact)}" contactphone="${fns:escapeHtml(obj.contactphone)}" value="${fns:escapeHtml(obj.id)}" >${fns:escapeHtml(obj.name)}</option>
										</c:when>
										<c:otherwise>
											<option contact="${fns:escapeHtml(obj.contact)}" contactphone="${fns:escapeHtml(obj.contactphone)}" value="${fns:escapeHtml(obj.id)}" >${fns:escapeHtml(obj.name)}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach> --%>
			                  	<%-- <c:forEach items="${fns:getCommPerson('aa')}" var="obj">
									
									<c:choose>
									<c:when test="${fns:escapeHtml(obj.id) eq cp.id}">
										<option selected="selected" name="${fns:escapeHtml(obj.name)}" phone="${fns:escapeHtml(obj.phone)}" value="${fns:escapeHtml(obj.id)}">${fns:escapeHtml(obj.address)}</option>
									</c:when>
									<c:otherwise>
										<option name="${fns:escapeHtml(obj.name)}" phone="${fns:escapeHtml(obj.phone)}" value="${fns:escapeHtml(obj.id)}">${fns:escapeHtml(obj.address)}</option>
									</c:otherwise>
								</c:choose>
								</c:forEach> --%>
		               		</select>
		             </label>
		          </li>
		          <li>
		             <span class="tab-name">收货联系人：</span>
		             <label>
		                <%--  <input id="cpname" disabled="disabled" type="text" value="${supp2.contact }"/> --%>
		             </label>
		          </li>
		         
		          <li>
		             <span class="tab-name">收货人电话：</span>
		             <label>
		                 <%-- <input id="cpphone" disabled="disabled" type="text" value="${supp2.contactphone }"/> --%>
		             </label>
		          </li>
		          <!-- <li>
		             <span class="tab-name">&nbsp;&nbsp;&nbsp;</span>
		             <label>&nbsp;
		                 <input class="btn btn-primary" type="submit" id="submitPurchase" name="submitPurchase" value="提交"/>
		             </label>
		          </li>  -->
		       </ul>
		       </form>
    	</div>
	</div>
</body>

</html>