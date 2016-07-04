<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>字典维护</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#value").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>

<div class="list-content" >
	    <div class="nav-operate" >
	        <ul class="operationg-new" >
	          <li ><a href="${ctx}/sys/userdict/" ><span class="glyphicon glyphicon-list"></span>字典列表</a></li>
	        </ul>
	        
        </div>
        <div class="form-content">
	<form:form id="inputForm" modelAttribute="dict" action="${ctx}/sys/userdict/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="opLevel"/>
			<ul class="search">
				<li>
					<shiro:hasPermission name="sys:dict:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
					<a class="btn btn-primary" href="${ctx}/sys/userdict/">返回</a>
				</li>
			</ul>
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">参数类型:</label>
			<div class="controls">
				<form:input path="description" readOnly="readOnly"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">参数值<span class='red'>*</span>:</label>
			<div class="controls">
				<form:input path="label" htmlEscape="false" maxlength="50" class="required"/>
			</div>
		</div>
		<div class="control-group" style="display:none;">
			<label class="control-label">键值:</label>
			<div class="controls">
				<form:input path="value" htmlEscape="false" maxlength="50" class="required"/>
			</div>
		</div>
		<div class="control-group" style="display:none;">
			<label class="control-label">字典类型:</label>
			<div class="controls">
				<form:input path="type" htmlEscape="false" maxlength="50" class="required abc"/>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">排序:</label>
			<div class="controls">
				<form:input path="sort" class="number" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注:</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="200" class="input-xlarge"/>
			</div>
		</div>
		<%-- <div class="form-actions">
			<shiro:hasPermission name="sys:dict:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<!-- <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/> -->
			<a class="btn btn-primary" href="">aaa</a>
		</div> --%>
	</form:form>
	</div>
</div>

</body>
</html>