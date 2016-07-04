<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>供应商信息管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		var ctxPath="${ctx}";
		$(function(){
			form_validate("inputForm");
			
			$("#saveBtn").unbind("click").bind("click",function(){
				$("#inputForm").submit();
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
				<shiro:hasAnyRoles name="${fns:getWhitelistsList('hzfgl')}">
					<li>
						<input type="button" name="saveBtn" id="saveBtn" class="btn btn-primary" value="保存"/>
					</li>
				</shiro:hasAnyRoles>
	   		 </ul>
		</div>
		<sys:message content="${message}"/>
		<div class="form-content">
			<form:form id="inputForm" modelAttribute="supplier" action="${ctx}/supplier/supplier/save" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<ul class="supplier-ul">
				<li>
					 <span class="tab-name">供应商编号：</span>
					<label>
						<form:input path="seriesnumber" htmlEscape="false" maxlength="50" class="input-medium "/>
					</label>
				</li>
				<li>
					 <span class="tab-name">供应商名称：</span>
					<label>
						<form:input path="name" htmlEscape="false" maxlength="64" class="input-medium "/>
					</label>
				</li>
				<li>
					 <span class="tab-name">供应商简称：</span>
					<label>
						<form:input path="code" htmlEscape="false" maxlength="64" class="input-medium "/>
					</label>
				</li>
				<li>
					 <span class="tab-name">供应商类别：</span>
					<label>
						<form:select id="supplierType" path="supplierType" class="input-medium required">
							<form:option value="">===请选择===</form:option>
							<form:options items="${fns:getDictList('supplierType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</label>
				</li>
				<li>
					 <span class="tab-name">供货范围：</span>
					<label>
						<form:input path="srange" htmlEscape="false" maxlength="200" class="input-medium "/>
					</label>
				</li>
				<li>
					 <span class="tab-name">传真：</span>
					<label>
						<form:input path="fax" htmlEscape="false" maxlength="64" class="input-medium "/>
					</label>
				</li>
				<li>
					 <span class="tab-name">业务人：</span>
					<label>
						<%-- <form:input path="businessPreson" htmlEscape="false" maxlength="64" class="input-medium "/> --%>
						<form:select path="businessPreson" class="input-medium">
					<c:choose>
						<c:when test="${supplier.supplierType eq 'supp_gys' }">
							<form:option value="" label="请选择"/>
							<c:forEach items="${fns:selByCondition('gyslxr')}" var="obj">
								<c:choose>
									<c:when test="${fns:escapeHtml(obj.userID) eq businessPreson }">
										<form:option selected="selected" value="${fns:escapeHtml(obj.userID)}" label="${fns:escapeHtml(obj.userName)}"/>
									</c:when>
									<c:otherwise>
										<form:option value="${fns:escapeHtml(obj.userID)}" label="${fns:escapeHtml(obj.userName)}"/>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:when>
						<c:when test="${supplier.supplierType eq 'supp_jgc' }">
							<form:option value="" label="请选择"/>
							<c:forEach items="${fns:selByCondition('scjgry')}" var="obj">
								<c:choose>
									<c:when test="${fns:escapeHtml(obj.userID) eq businessPreson }">
										<form:option selected="selected" value="${fns:escapeHtml(obj.userID)}" label="${fns:escapeHtml(obj.userName)}"/>
									</c:when>
									<c:otherwise>
										<form:option value="${fns:escapeHtml(obj.userID)}" label="${fns:escapeHtml(obj.userName)}"/>
									</c:otherwise>
								</c:choose>
								<%-- <form:option value="${fns:escapeHtml(obj.userID)}" label="${fns:escapeHtml(obj.userName)}"/> --%>
							</c:forEach>
						</c:when>
						<c:when test="${supplier.supplierType eq 'supp_dxc' }">
							<form:option value="" label="请选择"/>
							<c:forEach items="${fns:selByCondition('dxcry')}" var="obj">
								<c:choose>
									<c:when test="${fns:escapeHtml(obj.userID) eq businessPreson }">
										<form:option selected="selected" value="${fns:escapeHtml(obj.userID)}" label="${fns:escapeHtml(obj.userName)}"/>
									</c:when>
									<c:otherwise>
										<form:option value="${fns:escapeHtml(obj.userID)}" label="${fns:escapeHtml(obj.userName)}"/>
									</c:otherwise>
								</c:choose>
								<%-- <form:option value="${fns:escapeHtml(obj.userID)}" label="${fns:escapeHtml(obj.userName)}"/> --%>
							</c:forEach>
						</c:when>
						<c:when test="${supplier.supplierType eq 'supp_wl' }">
							<form:option value="" label="请选择"/>
							<c:forEach items="${fns:selByCondition('wlry')}" var="obj">
								<c:choose>
									<c:when test="${fns:escapeHtml(obj.userID) eq businessPreson }">
										<form:option selected="selected" value="${fns:escapeHtml(obj.userID)}" label="${fns:escapeHtml(obj.userName)}"/>
									</c:when>
									<c:otherwise>
										<form:option value="${fns:escapeHtml(obj.userID)}" label="${fns:escapeHtml(obj.userName)}"/>
									</c:otherwise>
								</c:choose>
								<%-- <form:option value="${fns:escapeHtml(obj.userID)}" label="${fns:escapeHtml(obj.userName)}"/> --%>
							</c:forEach>
						</c:when>
						<c:otherwise>
							
						</c:otherwise>
					</c:choose>
				</form:select>
					</label>
				</li>
				<li>
					 <span class="tab-name">业务手机：</span>
					<label>
						<form:input path="businessTel" htmlEscape="false" maxlength="32" class="input-medium "/>
					</label>
				</li>
				<li>
					 <span class="tab-name">业务电话：</span>
					<label>
						<form:input path="businessPhone" htmlEscape="false" maxlength="32" class="input-medium "/>
					</label>
				</li>
				<li>
					 <span class="tab-name">业务邮箱：</span>
					<label>
						<form:input path="businessEmail" htmlEscape="false" maxlength="64" class="input-medium "/>
					</label>
				</li>

				<li>
					 <span class="tab-name">场地面积：</span>
					<label>
						<form:input path="area" htmlEscape="false" maxlength="32" class="input-medium "/>
					</label>
				</li>
				<li>
					 <span class="tab-name">经营地址：</span>
					<label>
						<form:input path="businessAddress" htmlEscape="false" maxlength="200" class="input-medium "/>
					</label>
				</li>			
								
							 <li class="tips"> 公司信息 </li>
				<li>
					 <span class="tab-name">注册地址：</span>
					<label>
						<form:input path="registerAddress" htmlEscape="false" maxlength="200" class="input-medium "/>
					</label>
				</li>
				<li>
					 <span class="tab-name">注册资金：</span>
					<label>
						<form:input path="registerFund" htmlEscape="false" maxlength="18" class="input-medium "/>
					</label>
				</li>
				<li>
					 <span class="tab-name">资金币种：</span>
					<label>
						<form:input path="fundType" htmlEscape="false" maxlength="32" class="input-medium "/>
					</label>
				</li>
				<li>
					 <span class="tab-name">管理证书：</span>
					<label>
						<form:input path="certificate" htmlEscape="false" maxlength="64" class="input-medium "/>
					</label>
				</li>
				<li>
					 <span class="tab-name">税务证号：</span>
					<label>
						<form:input path="taxNumber" htmlEscape="false" maxlength="32" class="input-medium "/>
					</label>
				</li>
				<li>
					 <span class="tab-name">营业执照：</span>
					<label>
						<form:input path="permit" htmlEscape="false" maxlength="64" class="input-medium "/>
					</label>
				</li>
				<li>
					 <span class="tab-name">成立时间：</span>
					<label>
						<form:input path="foundData" htmlEscape="false" maxlength="32" class="input-medium "/>
					</label>
				</li>
				<li>
					<span class="tab-name">业务类别：</span>
					<label>
						<input type="radio" id="businessType" name="provinceType" value="1" 
						<c:if test="${supplier.businessType eq '1' }"> checked="checked"</c:if>	/>生产&nbsp;&nbsp;
						<input type="radio" id="businessType" name="provinceType" value="0"
						<c:if test="${supplier.businessType eq '0' }"> checked="checked"</c:if>	 />贸易
					</label>
				</li>
				<li>
					 <span class="tab-name">性质：</span>
					<label>
						<form:select id="natureType" path="natureType" class="input-medium ">
							<form:option value="">请选择</form:option>
							<form:options items="${fns:getDictList('natureType')}" itemLabel="label" itemValue="label" htmlEscape="false"/>
						</form:select>
					</label>
				</li>	
				<li>
					 <span class="tab-name">法人：</span>
					<label>
						<form:input path="legalPreson" htmlEscape="false" maxlength="64" class="input-medium "/>
					</label>
				</li>
				<li>
					 <span class="tab-name">法人手机：</span>
					<label>
						<form:input path="legalTel" htmlEscape="false" maxlength="32" class="input-medium "/>
					</label>
				</li>
				<li>
					 <span class="tab-name">法人电话：</span>
					<label>
						<form:input path="legalPhone" htmlEscape="false" maxlength="32" class="input-medium "/>
					</label>
				</li>
				<li>
					 <span class="tab-name">法人邮箱：</span>
					<label>
						<form:input path="legalEmail" htmlEscape="false" maxlength="64" class="input-medium "/>
					</label>
				</li>
				<li>
					 <span class="tab-name">人员总数：</span>
					<label>
						<form:input path="peopleNumber" htmlEscape="false" maxlength="18" class="input-medium "/>
					</label>
				</li>
				<li>
					 <span class="tab-name">管理人员数：</span>
					<label>
						<form:input path="manageNumber" htmlEscape="false" maxlength="18" class="input-medium "/>
					</label>
				</li>
				<li>
					 <span class="tab-name">其他人员数：</span>
					<label>
						<form:input path="otherNumber" htmlEscape="false" maxlength="18" class="input-medium "/>
					</label>
				</li>
				
							 <li class="tips"> 结算信息 </li>
				<li>
					 <span class="tab-name">结算方式：</span>
					<label>
						<form:select id="settlementType" path="settlementType" class="input-medium required">
							<form:option value="-1">===请选择===</form:option>
							<form:options items="${fns:getDictList('settlementType')}" itemLabel="label" itemValue="label" htmlEscape="false"/>
						</form:select>
					</label>
				</li>

				<li>
					 <span class="tab-name">开户银行：</span>
					<label>
						<form:input path="accountBank" htmlEscape="false" maxlength="64" class="input-medium "/>
					</label>
				</li>
				<li>
					 <span class="tab-name">账户名：</span>
					<label>
						<form:input path="accountName" htmlEscape="false" maxlength="64" class="input-medium "/>
					</label>
				</li>
				<li>
					 <span class="tab-name">银行账户：</span>
					<label>
						<form:input path="account" htmlEscape="false" maxlength="64" class="input-medium "/>
					</label>
				</li>
							 <li class="tips"> 其他信息 </li>
				<li>
					 <span class="tab-name"> 备注：</span>
					<label>
						<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xmedium "/>
					</label>
				</li>
			</ul>
			</form:form>
		</div>
	</div>

</body>
</html>