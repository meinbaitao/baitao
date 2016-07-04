<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>年度合同管理</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/modules/contract/scripts/yearContract.js?tsf=${jsVersion}" type="text/javascript"></script>
	<script src="${ctxStatic}/modules/contract/scripts/common_contract.js?tsf=${jsVersion}" type="text/javascript"></script>
	<script src="${ctxStatic}/ajaxfileupload/ajaxfileupload.js?tsf=${jsVersion}" type="text/javascript"></script>
	<script src="${ctxStatic}/common/common_service.js?tsf=${jsVersion}" type="text/javascript"></script>
	<script type="text/javascript">
		var ctxPath="${ctx}";
		$(function(){
			form_validate("inputForm");
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
		<!--上传div  -->
		<div id="annexBox" class="hide">
		  <form id="uploadAttachForm" action="${ctx}/contract/conYearContract/upload" method="post" enctype="multipart/form-data" style="padding-left:20px;text-align:center;">
			<br/>
			<input id="uploadContractId" name="uploadContractId" type="hidden" value="${conYearContract.id}"/>　
			<ul>
			<li><input id="file" name="file" type="file" class="input-medium"/></li>　　
			<li><input id="uploadAttachment" class="btn btn-primary" type="button" value="   上传   "/></li>
			</ul>
		</form>
		</div>
		<div class="nav-operate">
			<ul class="operationg-new" >
				<li>
					<input id="btnCancel" class="btn btn-primary" type="button" value="返 回" onclick="history.go(-1)"/>
				</li>
				<li>
					<input type="button" name="editBtn" id="editBtn" class="btn btn-primary" value="保存"/>
				</li>
				<li>
					<input type="button" name="btnUpload" id="btnUpload" class="btn btn-primary" value="附件"/>
				</li>
				<li id="showAttach">
					<c:forEach items="${attachList}" var="obj">
					<div>
						<a id="${obj.id}" href="${ctx}${obj.attachUrl}/download?id=${obj.id}">${obj.name} </a>&nbsp;&nbsp;<span id="deleteAttach" deleteId="${obj.id }"  class="glyphicon glyphicon-remove-circle"></span></div>
					</c:forEach>
				</li>
	   		 </ul>
		</div>
		<div class="form-content">
		<form:form id="inputForm" modelAttribute="conYearContract" 
					action="${ctx}/contract/conYearContract/save" method="post" class="form-horizontal">
			<form:hidden path="id"/>
			<ul>
       	   <li>
             <span class="tab-name">合同编号：</span>
             <label>
             	<input type="text" id="contractNo" name="contractNo"  readonly="readonly"  class="input-medium " 
             		value="${conYearContract.contractNo }" />
             </label>
          </li>
<%--            <li>
             <span class="tab-name">合同类型：</span>
             <label>
                  <form:select  id="conType" path="conType" class="input-medium required">
					<form:option value="" label="请选择"/>
					<form:options items="${fns:getDictList('yearContractType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
             </label>
          </li> --%>
           <li>
				<span class="tab-name">合同类型：</span>
				<label>
					<select name="contractType" class="input-medium required "  id="contractType">
                			<option value="${conYearContract.contractType}">请选择</option>
					</select>
					<span class="help-inline"><font color="red">*</font> </span>
				</label>
			</li>
			<li>
				<span class="tab-name">一级类别：</span>
				<label>
					<select name="fristType" class="input-medium required "  id="fristType">
                			<option value="${conYearContract.fristType}">请选择</option>
					</select>
					<span class="help-inline"><font color="red">*</font> </span>
				</label>
			</li>
			<li>
				<span class="tab-name">二级类别：</span>
				<label>
					<select name="secondType" class="input-medium  "  id="secondType">
                			<option value="${conYearContract.secondType}">请选择</option>
					</select>
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
					<form:options items="${fns:getDictList('year_standard_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			      </form:select>
			 </label>
          </li>
           <li>
             <span class="tab-name">乙方施工班组：</span>
             <label>
                 <select name="name" id="name" class="input-medium required">
                 	<option value="">请选择</option>
                	 <c:forEach items="${executionList}" var="obj">
						<option value="${obj.name}" 
								<c:if test="${obj.name ==conYearContract.name}">selected="selected"</c:if>
						>${obj.name}</option>
					</c:forEach>
                 </select>
				<span class="help-inline"><font color="red">*</font> </span>
             </label>
          </li>
           <li>
             <span class="tab-name">班组简称：</span>
             <label>
                 <input type="text" name="partyBCode" id="partyBCode" maxlength="1000" class="input-medium " 
                 value="${conYearContract.partyBCode }" readonly="readonly"/>
             </label>
          </li>
          <li>
             <span class="tab-name">班组类别：</span>
             <label>
                 <input type="text" name="exeType" id="exeType" maxlength="1000" class="input-medium " value="${fns:getDictLabel(conYearContract.exeType,'executionType','') }" readonly="readonly"/>
             </label>
          </li>
          <li>
             <span class="tab-name">施工班组人数：</span>
             <label>
                 <input type="text" name="exeNumber" id="exeNumber" maxlength="1000" class="input-medium " value="${conYearContract.exeNumber }" readonly="readonly"/>
             </label>
          </li>
          <li>
             <span class="tab-name">乙方代表人：</span>
             <label>
                 <input type="text" name="person" id="person" maxlength="60" class="input-medium" value="${conYearContract.person }" readonly="readonly"/>
             </label>
          </li>
          <li>
             <span class="tab-name">乙方代表人身份证号：</span>
             <label>
                 <input type="text" name="personNum" id="personNum" maxlength="300" class="input-medium" value="${conYearContract.personNum }" readonly="readonly"/>
             </label>
          </li>
          <li>
             <span class="tab-name">乙方代表人联系方式：</span>
             <label>
               <input type="text" name="personTel" id="personTel" maxlength="100" class="input-medium " value="${conYearContract.personTel }" readonly="readonly"/>
             </label>
          </li>
          <li>
             <span class="tab-name">乙方代表人开户银行：</span>
             <label>
              	<input type="text" name="bank" id="bank" maxlength="100" class="input-medium " value="${conYearContract.bank }" readonly="readonly"/>
             </label>
          </li>
          <li>
             <span class="tab-name">乙方代表人银行账户：</span>
             <label>
                 <input type="text" name="bankNum" id="bankNum" maxlength="20" class="input-medium" value="${conYearContract.bankNum }" readonly="readonly"/>
             </label>
          </li>
          <li>
             <span class="tab-name">银行账户名：</span>
             <label>
                 <input type="text" name="bankPerson" id="bankPerson" maxlength="20" class="input-medium " value="${conYearContract.bankPerson }" readonly="readonly"/>
             </label>
          </li>
          <li>
             <span class="tab-name">合作记录：</span>
             <label>
    		   <input type="text" name="exeRecord" id="exeRecord" maxlength="300" class="input-medium " value="${conYearContract.exeRecord }" readonly="readonly"/>
             </label>
          </li>
          <li>
             <span class="tab-name">过往工作质量：</span>
             <label>
                <input type="text" name="exeQuality" id="exeQuality" maxlength="100" class="input-medium " value="${conYearContract.exeQuality }" readonly="readonly"/>
             </label>
          </li>
          <li>
             <span class="tab-name">工程质量要求：</span>
             <label>
                 <form:input path="quality" htmlEscape="false" maxlength="200" class="input-medium "/>
             </label>
          </li>
          <li>
             <span class="tab-name">保证金(元)：</span>
             <label>
                <input type="text" id="ensure" name="ensure" maxlength="18" 
                value="${conYearContract.ensure }" class="input-medium number" />
             </label>
          </li>
          <li>
             <span class="tab-name">承包方式：</span>
             <label>
                 <form:select id="conWay" path="conWay" class="input-medium ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('contractWay')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
             </label>
          </li>
          <li>
             <span class="tab-name">现场材料管理模式：</span>
             <label>
                 <form:select path="manage" class="input-medium required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('manageWay')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>             
             </label>
          </li>
          <li>
             <span class="tab-name">是否发生过劳务纠纷：</span>
             <label>
                 <form:select path="isIssue" class="input-medium required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
             </label>
          </li>
          <li>
             <span class="tab-name">合同期限：</span>
             <label>
                  <form:select  id="limitDate" path="limitDate" class="input-medium required">
					<form:option value="" label="请选择"/>
					<form:options items="${fns:getDictList('contractLimit')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>            
             </label>
          </li>
          <li>
             <span class="tab-name">开始日期：</span>
             <label>
                 <input name="startDate" id="startDate" type="text"  maxlength="20" class="input-medium Wdate "
					value="${conYearContract.startDate }" readonly="readonly"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
             </label>
          </li>
          <li id="enddate">
             <span class="tab-name" >终止日期：</span>
             <label>
                 <input name="endDate" id="endDate" type=text  maxlength="20" class="input-medium Wdate "
					value="${conYearContract.endDate }" readonly="readonly"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
             </label>
          </li>
          <li id="endtime" class="hide">
             <span class="tab-name">终止时间：</span>
             <label>
                 <input name="endTime" id="endTime" type="text"  maxlength="20" class="input-medium Wdate "
					value="${conYearContract.endTime }" readonly="readonly"
					 onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
             </label>
          </li>
          <li>
             <span class="tab-name">备注信息：</span>
             <label>
                 <form:textarea path="remarks" htmlEscape="false" maxlength="255" class="input-xmedium "/>
             </label>
          </li>
       </ul>
	</form:form>
	</div>
</div>
</body>
</html>