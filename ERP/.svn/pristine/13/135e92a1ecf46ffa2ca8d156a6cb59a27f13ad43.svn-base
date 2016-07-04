<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>合同台账管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript" src="${ctxStatic}/modules/contract/scripts/contractAccount.js?tsf=${jsVersion}"></script>
	<script type="text/javascript" src="${ctxStatic}/modules/contract/scripts/common_contract.js?tsf=${jsVersion}"></script>
	<script type="text/javascript" src="${ctxStatic}/common/common_service.js?tsf=${jsVersion}"></script>
	<script type="text/javascript">
		var ctxPath="${ctx}";
	</script>
</head>
<body>
	
  <div class="list-content" >
      <div class="nav-operate" >
	   		<ul class="operationg-new" >
				<li>
					<input id="btnCancel" class="btn btn-primary" type="button" value="返 回" onclick="history.go(-1)"/>
				</li>
				<li>
					<input type="button" name="editBtn" id="editBtn" class="btn btn-primary" value="保存"/>
				</li>
			    </ul>
		     <div class="clear"></div>
	   </div>
	      <div class="form-content">
	      <sys:message content="${message}"/>
			<form:form id="inputForm" modelAttribute="contractAccount" method="post" class="form-horizontal"
			action="${ctx}/contract/contractAccount/save" >
				<input type="hidden" id="contractId" name="id" value="${contractAccount.id }"/>
				<input type="hidden" id="workflowId" name="workflowid" value="${contractAccount.workflowid }"/>
				<input type="hidden" id="workflowStatus" name="workflowstatus" value="${contractAccount.workflowstatus }"/>
				<ul>
          		<li>
					<span class="tab-name">执行部门：</span>
					<label>
						<select name="department" class="input-medium required "  id="department">
                 			<option value="${contractAccount.department}">请选择</option>
						</select>
						<span class="help-inline"><font color="red">*</font> </span>
					</label>
				</li>
				<li>
					<span class="tab-name">一级类别：</span>
					<label>
						<select name="fristType" class="input-medium required "  id="fristType">
                 			<option value="${contractAccount.fristType}">请选择</option>
						</select>
						<span class="help-inline"><font color="red">*</font> </span>
					</label>
				</li>
				<li>
					<span class="tab-name">二级类别：</span>
					<label>
						<select name="secondType" class="input-medium  "  id="secondType">
                 			<option value="${contractAccount.secondType}">请选择</option>
						</select>
					</label>
				</li>
				<li>
					<span class="tab-name">公司定价:</span>
					<label>
						<form:radiobuttons path="isCompanyPrice" items="${fns:getDictList('yes_no')}" 
							itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
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
					<span class="tab-name">是否继续合作：</span>
					<label>
						<form:radiobuttons path="isContinue" items="${fns:getDictList('yes_no')}" 
							itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
					</label>
				</li>
				<li>
					<span class="tab-name">是否招标:</span>
					<label>
						<form:radiobuttons id="isInvitation" path="isInvitation" items="${fns:getDictList('yes_no')}" 
							itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
					</label>
				</li>
				<li>
					<span class="tab-name">谈价/议标:</span>
					<label>
						<form:radiobuttons path="isBargain" items="${fns:getDictList('yes_no')}"
							 itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
					</label>
				</li>
<%-- 				<li>
					<span class="tab-name">有效期内:</span>
					<label>
						<form:radiobuttons path="isValid" items="${fns:getDictList('yes_no')}"
							 itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
					</label>
				</li> --%>
				<li>
					<span class="tab-name">招标时间：</span>
					<label>
						<input id="invitationDate" name="invitationDate" type="text"  class="input-medium Wdate"
							value="${contractAccount.invitationDate}" readonly="readonly"/>
					</label>
				</li>
				<li>
					<span class="tab-name">供应商名称：</span>
					<label>
						<input type="text" id="supplierName" name="supplierName" maxlength="64" 
						class="input-medium " readonly="readonly" value="${contractAccount.supplierName }"/>
					</label>
				</li>
				<li>
					<span class="tab-name">合同编号：</span>
					<label>
						<input type="text" id="newSeriesnumber" name="newSeriesnumber" maxlength="64" 
						class="input-medium " readonly="readonly" value="${contractAccount.newSeriesnumber }"/>
					</label>
				</li>
				<li>
					<span class="tab-name">合同签订时间：</span>
					<label>
						<input name="signDate" type="text" readonly="readonly" class="input-medium "
							value="${contractAccount.signDate}"/>
					</label>
				</li>
				<li>
					<span class="tab-name">合同到期时间：</span>
					<label>
						<input id="endDate" name="endDate" type="text" readonly="readonly" class="input-medium  "
							 value="${contractAccount.endDate}" />
					</label>
				</li>
				<li>
					<span class="tab-name">有效期内:</span>
					<label>
						<input type="text" id="isValid" name="isValid"class="input-medium " readonly="readonly"
						value="${contractAccount.isValid }"/>
					</label>
				</li>
	          <li>
				<span class="tab-name">备注信息：</span>
				<label>
					<form:textarea path="remarks" htmlEscape="false" maxlength="255" class="input-xmedium "/>
				</label>
			  </li>
			</ul>
			<div class="hr_60"></div>
		</form:form>
		</div>
    </div>
</body>
</html>