<%@page import="com.thinkgem.jeesite.common.utils.StringUtils"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<% 
	String contractType = request.getParameter("contractType"); 
	String fristType = request.getParameter("fristType"); 
	String secondType = request.getParameter("secondType"); 
	String detailTemplate = request.getParameter("detailTemplate"); 
	boolean thirdTypeView = false;
	if(contractType.equals("purchasingContractBase")){
		thirdTypeView = true;
	}
	boolean isLabor = false;
	if(StringUtils.isNotBlank(secondType) && secondType.equals("37")){
		isLabor = true;
	}
	boolean otherContractHide = true;
	if(StringUtils.isNotBlank(fristType)){
		if(fristType.equals("10") || fristType.equals("11") || fristType.equals("12")){
			otherContractHide = false;
		}
	}
		
%>


	<!--上传div  -->
	<div id="annexBox" class="hide">
		<form id="uploadAttachForm" method="post" enctype="multipart/form-data"
			class="form-search" style="padding-left:20px;text-align:center;"><br/>
			<ul>
			<li><input id="file" name="file" type="file" /></li>　　
			<li><input id="uploadAttachment" class="btn btn-primary" type="button" value="   上传   "/></li>
			</ul>
		</form>
	</div>
			
	<!-- 导入div -->
	<div id="importBox" class="hide">
		<form id="importForm" method="post" enctype="multipart/form-data"
			class="form-search" style="padding-left:20px;text-align:center;" ><br/>
			<ul>
			<li><input id="importFile" name="importFile" type="file" style="width:330px"/></li>　　
			<li><input id="btnImportSubmit" class="btn btn-primary" type="button" value="   导    入   "/></li>
			</ul>
		</form>
	</div>
		
		
	<div class="nav-operate" >
		<ul class="operationg-new" >
			<li>
				<input id="btnCancel" class="btn btn-primary" type="button" value="返 回" onclick="history.go(-1)"/>
			</li>
			<shiro:hasAnyRoles name="${fns:getWhitelistsList('scysht')}">
				<li><a class="btn btn-primary" href="<%=detailTemplate%>">下载明细模板</a>
				</li>
				<li>
					<input type="button" name="btnImport" id="btnImport" class="btn btn-primary" value="导入合同明细"/>
				</li>
				<li>
					<input type="button" name="editBtn" id="editBtn" class="btn btn-primary" value="保存"/>
				</li>
				<li>
					<input  type="button" name="btnUpload" id="btnUpload" class="btn btn-primary" value="附件"/>
				</li>
				<li class="startWorkflow">
					<input type="button" name="startWorkflow" id="startWorkflow" class="btn btn-primary" value="提交"/>
				</li>
			</shiro:hasAnyRoles>
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
			<li id="showAttach">
				<c:forEach items="${attachList}" var="obj">
				<div>
					<a id="${obj.id}" href="${ctx}${obj.attachUrl}/download?id=${obj.id}">${obj.name} </a>&nbsp;&nbsp;
					<span id="deleteAttach" deleteId="${obj.id }"  class="glyphicon glyphicon-remove-circle"></span></div>
				</c:forEach>
			</li>
		</ul>
	</div>
	<div class="form-content">
		<sys:message content="${message}"/>
		<form:form id="baseForm" modelAttribute="<%=contractType %>" method="post" class="form-horizontal" >
			<form:hidden id="bindingId" path="id" htmlEscape="false"/>
			<form:hidden id="workflowid" path="workflowid" htmlEscape="false"/>
			<form:hidden id="workflowstatus" path="workflowstatus" htmlEscape="false"/>
<%-- 			<input type="hidden" name="flag" id="flag" value="${flag}"/> --%>
			<form:hidden path="contractType" id="contractType" htmlEscape="false"/>
			<form:hidden path="fristType" id="fristType" htmlEscape="false"/>
			<form:hidden path="secondType" id="secondType" htmlEscape="false"/>
			<form:hidden path="delIds" id="delIds" htmlEscape="false"/>
			<c:if test="<%=!otherContractHide %>">
				<form:hidden path="delIdsX" id="delIdsX" htmlEscape="false"/>
			</c:if>
			<ul>
			
			<li>
				<span class="tab-name">甲方：</span>
				<label>
					<form:select name="contractJiafang" id="contractJiafang" path="contractJiafang" class="input-medium ">
						<form:option value="" label="请选择"/>
						<form:options items="${fns:getDictList('ht_jiafang')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</label>
			</li>
			
			<li>
				<span class="tab-name">合同编号：</span>
				<label>
					<form:input id="contractNo" path="contractNo" htmlEscape="false" 
						readonly="true" class=" input-medium" />
				</label>
			</li>
			<li>
				<c:if test="<%=thirdTypeView %>">
				<span class="tab-name">三级类别：</span>
				<label>
					<form:input path="thirdType" id="thirdType" htmlEscape="false"
						class="input-medium select2-offscreen"/>
				</label>
				</c:if>
			</li>
<%-- 			<li>
				<span class="tab-name">合同类型：</span>
				<label>
					<form:select path="contractType" class="input-medium">
						<form:option value="" label="请选择"/>
						<form:options itemLabel="value" itemValue="value" htmlEscape="false"/>
					</form:select>
				</label>
			</li>
			<li>
				<span class="tab-name">一级类别：</span>
				<label>
					<input type="text" id="fristType" class="input-medium" readonly="readonly"/>
					<!-- <form:select id="fristType" path="fristType" class="input-medium">
						<form:option value="" label="请选择"/>
						<form:options itemLabel="value" itemValue="value" htmlEscape="false"/>
					</form:select>
					<span class="help-inline"><font color="red">*</font> </span> -->
				</label>
			</li>
			<li>
				<span class="tab-name">二级类别：</span>
				<label>
					<form:select id="secondType" path="secondType" class="input-medium">
						<form:option value="" label="请选择"/>
						<%-- <form:options itemLabel="value" itemValue="value" htmlEscape="false"/>
					</form:select>
				</label>
			</li>
 			<li>
				<span class="tab-name">标准合同:</span>
				<label>
					<form:radiobuttons path="isStandardContract" items="${fns:getDictList('yes_no')}" 
							itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
				</label>
			</li>
			<li>
				<span class="tab-name">标准合同类型：</span>
				<label>
					<form:select path="standardType" class="input-medium">
						<form:option value="" label="请选择"/>
						<form:options items="${fns:getDictList('transportation_standard_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</label>
			</li> --%>
			<c:choose>
				<c:when test="<%=isLabor %>">
					<li>
						<span class="tab-name">班组全称：</span>
						<label>
							<form:select id="execution" path="partyBName" class="required input-medium ">
								<form:option value="" label="请选择"/>
								<form:options items="${executionList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
							</form:select>
							<span class="help-inline"><font color="red">*</font> </span>
						</label>
					</li>
					<li>
						<span class="tab-name">班组简称：</span>
						<label>
							<form:input id="partyBCode" path="partyBCode" htmlEscape="false" 
								readonly="true" class=" input-medium"/>
						</label>
					</li>
				</c:when>
				<c:otherwise>
					<li>
						<span class="tab-name">供应商名称：</span>
						<label>
							<form:select id="supplier" path="partyBName" class="required input-medium ">
								<form:option value="" label="请选择"/>
								<form:options items="${supplierList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
							</form:select>
							<span class="help-inline"><font color="red">*</font> </span>
						</label>
					</li>
					<li>
						<span class="tab-name">供应商简称：</span>
						<label>
							<form:input id="partyBCode" path="partyBCode" htmlEscape="false" 
								readonly="true" class=" input-medium"/>
						</label>
					</li>
				</c:otherwise>
			</c:choose>
			<li>
				<span class="tab-name">合同总价：</span>
				<label>
					<form:input path="contractPrice" id="contractPrice" htmlEscape="false"
						class="required input-medium"/>
					<span class="help-inline"><font color="red">*</font> </span>	
				</label>
			</li>
  	      <%-- <li>
             <span class="tab-name">   乙方法人：</span>
             <label>
               <input type="text" name="partyBLegalPerson" id="partyBLegalPerson" maxlength="100" class="input-medium " 
               value="${stoneCarriageContractBase.partyBLegalPerson }" readonly="readonly"/>
             </label>
          </li>
          <li>
             <span class="tab-name">  乙方业务人：</span>
             <label>
              	<input type="text" name="partyBEntrustedAgent" id="partyBEntrustedAgent" maxlength="100" class="input-medium " 
              	value="${stoneCarriageContractBase.partyBEntrustedAgent }" readonly="readonly"/>
             </label>
          </li>
          <li>
             <span class="tab-name">乙方电话：</span>
             <label>
                 <input type="text" name="partyBPhone" id="partyBPhone" maxlength="20" class="input-medium" 
                 value="${stoneCarriageContractBase.partyBPhone }" readonly="readonly"/>
             </label>
          </li>
          <li>
             <span class="tab-name">乙方手机：</span>
             <label>
                 <input type="text" name="partyBTel" id="partyBTel" maxlength="20" class="input-medium" 
                 value="${stoneCarriageContractBase.partyBTel }" readonly="readonly"/>
             </label>
          </li>
          <li>
             <span class="tab-name">乙方传真：</span>
             <label>
                 <input type="text" name="partyBFax" id="partyBFax" maxlength="20" class="input-medium" 
                 value="${stoneCarriageContractBase.partyBFax }" readonly="readonly"/>
             </label>
          </li>
          <li>
             <span class="tab-name">乙方邮箱：</span>
             <label>
                 <input type="text" name="partyBEmail" id="partyBEmail" maxlength="64" class="input-medium" 
                 value="${stoneCarriageContractBase.partyBEmail }" readonly="readonly"/>
             </label>
          </li>
          <li>
             <span class="tab-name">乙方地址：</span>
             <label>
    		   <input type="text" name="partyBAddress" id="partyBAddress" maxlength="300" class="input-medium "
    		   value="${stoneCarriageContractBase.partyBAddress }" readonly="readonly"/>
             </label>
          </li>
          <li>
             <span class="tab-name">乙方银行账户名称：</span>
             <label>
                <input type="text" name="partyBAccountName" id="partyBAccountName" maxlength="100" class="input-medium "
                value="${stoneCarriageContractBase.partyBAccountName }" readonly="readonly"/>
             </label>
          </li>
          <li>
             <span class="tab-name">乙方开户行：</span>
             <label>
                 <input type="text" name="partyBAccountBank" id="partyBAccountBank" maxlength="200" class="input-medium "
                 value="${stoneCarriageContractBase.partyBAccountBank }" readonly="readonly"/>
             </label>
          </li>
          <li>
             <span class="tab-name">乙方银行账户：</span>
             <label>
                 <input type="text" name="partyBAccountNo" id="partyBAccountNo" maxlength="100" class="input-medium "
                 value="${stoneCarriageContractBase.partyBAccountNo }" readonly="readonly"/>
             </label>
          </li> --%>
			<li>
				<span class="tab-name">合同生效日期：</span>
				<label>
					<form:input id="startTime" path="startTime" htmlEscape="false" readonly="true" 
						class="required input-medium Wdate "
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
					<span class="help-inline"><font color="red">*</font></span>
				</label>
			</li>
			<li>
				<span class="tab-name">合同到期日期：</span>	
				<label>
					<form:input id="endTime" path="endTime" htmlEscape="false" readonly="true" 
						class="required input-medium Wdate "
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
					<span class="help-inline"><font color="red">*</font></span>
				</label>
			</li>
			<li>
				<span class="tab-name">结算方式：</span>
				<label>
					<form:input path="settlementType" id="settlementType" htmlEscape="false" 
						class="required input-medium select2-offscreen"/>
					<%-- <form:select path="settlementType" class="required input-medium ">
						<form:option value="" label="请选择"/>
						<form:options itemLabel="label" itemValue="value" htmlEscape="false"
						 items="${fns:getDictList('settlementType')}" />
					</form:select> --%>
					<span class="help-inline"><font color="red">*</font> </span>
				</label>
			</li>
			<li>
				<span class="tab-name">支付方式：</span>
				<label>
					<form:input path="paymentType" id="paymentType" htmlEscape="false"
						class="required input-medium select2-offscreen"/>
					<%-- <form:select path="paymentType" class="required input-medium ">
						<form:option value="" label="请选择"/>
						<form:options itemLabel="label" itemValue="value" htmlEscape="false"
							items="${fns:getDictList('paymentType')}" />
					</form:select> --%>
					<span class="help-inline"><font color="red">*</font> </span>
				</label>
			</li>
			<li class="autoHeight">
				<span class="tab-name">发票类型：</span>
				<label>
					<form:input path="invoiceType" id="invoiceType" htmlEscape="false"
						class="required input-medium select2-offscreen"/>
					<%-- <form:select path="invoiceType" class="input-medium required">
						<form:option value="" label="请选择"/>
						<form:options itemLabel="label" itemValue="value" htmlEscape="false"
							items="${fns:getDictList('invoiceType')}" />
					</form:select> --%>
					<span class="help-inline"><font color="red">*</font> </span>
				</label>
			</li>
			<li>
				<span class="tab-name">税率：</span>
				<label>
					<form:input path="taxRate" id="taxRate" htmlEscape="false"
						class="required input-medium select2-offscreen"/>
					<%-- <form:select path="taxRate" class="input-medium required">
						<form:option value="" label="请选择"/>
						<form:options itemLabel="label" itemValue="value" htmlEscape="false"
							items="${fns:getDictList('taxRate')}"/>
					</form:select> --%>
					<span class="help-inline"><font color="red">*</font> </span>
				</label>
			</li>
			<li>
				<span class="tab-name">是否包含运费:</span>
				<label>
					<form:radiobuttons id="isIncludeCarriage" path="isIncludeCarriage" items="${fns:getDictList('yes_no')}" 
						itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
				</label>
			</li>
			<c:if test="<%=otherContractHide %>">
				<li>
					<span class="tab-name">是否收取质保金:</span>
					<label>
						<form:radiobuttons id="isIncludeQuality" path="isIncludeQuality" items="${fns:getDictList('yes_no')}" 
							itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
					</label>
				</li>
				<li>
					<span class="tab-name">是否收取履约金:</span>
					<label>
						<form:radiobuttons id="isIncludeExecute" path="isIncludeExecute" items="${fns:getDictList('yes_no')}" 
							itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
					</label>
				</li>
				<li>
					<span class="tab-name">质保金金额：</span>
					<label>
						<form:input path="qualityGuaranteePrice" id="qualityGuaranteePrice" maxlength="18" 
							htmlEscape="false" class="input-medium number" />
					</label><!-- 许俊雄 20160322 暂时去掉质保金额的必输限制 -->
				</li>
				<li>
					<span class="tab-name">质保金收取模式：</span>
					<label>
						<form:input path="qualityGuaranteeWay" id="qualityGuaranteeWay" 
							htmlEscape="false" class="input-medium" />
					</label>
				</li>
				<li>
					<span class="tab-name">质保金返还模式：</span>
					<label>
						<form:input path="qualityReturnWay" id="qualityReturnWay" 
							htmlEscape="false" class="input-medium" />
					</label>
				</li>
				<li>
					<span class="tab-name">履约金金额：</span>
					<label>
						<form:input path="executeGuaranteePrice" id="executeGuaranteePrice" maxlength="18" 
							htmlEscape="false" class="input-medium required number" />
							<!-- 许俊雄 20160322 暂时去掉履约金金额：的必输限制 -->
					</label>
				</li>
				<li>
					<span class="tab-name">履约金收取模式：</span>
					<label>
						<form:input path="executeGuaranteeWay" id="executeGuaranteeWay" 
							htmlEscape="false" class="input-medium" />
					</label>
				</li>
				<li>
					<span class="tab-name">履约金返还模式：</span>
					<label>
						<form:input path="executeReturnWay" id="executeReturnWay" 
							htmlEscape="false" class="input-medium" />
					</label>
				</li>
			</c:if>
			
		</ul>
		</form:form>
	</div>