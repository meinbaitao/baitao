<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>项目添加</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/modules/whitelist/whitelist.js?tsf=${jsVersion}" type="text/javascript"></script>
	<script type="text/javascript">
	$(document).ready(function() {form_validate("inputForm"); });
	</script>
</head>
<body>
  <div class="list-content" >
      <div class="nav-operate" >
			<ul class="operationg-new" >
				<li>
					<input id="btnCancel" class="btn btn-primary" type="button" value="返 回" onclick="history.go(-1)"/>
				</li>
				<li class="addBtn">
					<input type="button" id="addBtn" class="btn btn-primary" value="保存"/>
				</li>
		    </ul>
		    <div class="clear"></div>
      </div>
     <div class="form-content">
	  <form:form id="inputForm" modelAttribute="whitelists" action="${ctx}/whitelists/save" method="post" class="form-horizontal magbtm0">  
		<ul>
          <div class="control-group">
			<label class="control-label">白名单名称：</label>
			<div class="controls">
				<form:hidden path="id" id="id" htmlEscape="false"/>
				<c:if test="${flag=='update'}">
					<form:input path="name" id="name" htmlEscape="false" maxlength="200" class="input-medium" disabled="true"/>
				</c:if>
				<c:if test="${flag !='update'}">
					<form:input path="name" id="name" htmlEscape="false" maxlength="200" class="input-medium"/>
				</c:if>
				<span class="help-inline">
					<font color="red">*</font>
				</span>
				<div style="color: red;" id="whitelistName">
					
				</div>
			</div>
		  </div>
		  <div class="control-group">
			<label class="control-label">描述：</label>
			<div class="controls">
				<form:input path="description" id="description" htmlEscape="false" maxlength="100" class="input-medium"/>
				<span class="help-inline">
					<font color="red">*</font>
				</span>
				<div style="color: red;" id="whitelistDesc">
					
				</div>
			</div>
		  </div>
		  <div class="control-group control-group-all">
			<label class="control-label">用户角色：</label>
			<div class="controls">
				<form:checkboxes path="roleNameList" items="${allRoles}" itemLabel="name" itemValue="enname" htmlEscape="false"/>
			</div>
		  </div>
		</ul>
	 </form:form>
  </div>
</body>
</html>