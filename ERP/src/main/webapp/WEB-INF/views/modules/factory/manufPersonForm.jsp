<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>加工厂人员管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
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
		
		$(function(){
			$("#btnSave").click(function(){
				var inputForm = $('#inputForm');
				inputForm.submit();				
			});
		});
	</script>
</head>
<body>
<div class="list-content" >
    <div class="nav-operate" >
	 <ul class="operationg-new" >
        <li><a href="${ctx}/factory/manufPerson/list"><input class="btn btn-primary" type="button" value="返回"></a></li>
        <li>
			<input id="btnSave" class="btn btn-primary" type="button" value="保存">
	 </li>
    </ul>
   </div> 
	<sys:message content="${message}"/>	
	<form:form id="inputForm" modelAttribute="manufPerson" action="${ctx}/factory/manufPerson/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>	
		<div class="control-group">
			<label class="control-label">加工厂：</label>
			<div class="controls">
				<form:input path="factory" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">区域：</label>
			<div class="controls">
				<form:input path="area" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">经理：</label>
			<div class="controls">
				<form:input path="manager" htmlEscape="false" maxlength="63" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">负责人：</label>
			<div class="controls">
				<form:input path="principal" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">负责人联系方式：</label>
			<div class="controls">
				<form:input path="principalTel" htmlEscape="false" maxlength="32" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">跟单员：</label>
			<div class="controls">
				<form:input path="tracer" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">跟单员联系方式：</label>
			<div class="controls">
				<form:input path="tracerTel" htmlEscape="false" maxlength="32" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="200" class="input-xxlarge "/>
			</div>
		</div>
	</form:form>
</div>	
</body>
</html>