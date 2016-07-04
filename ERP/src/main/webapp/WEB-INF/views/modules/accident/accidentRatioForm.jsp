<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>事故比例管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
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
        <li><a href="${ctx}/accident/accidentRatio/list"><input class="btn btn-primary" type="button" value="返回"></a></li>
        <li>
			<input id="btnSave" class="btn btn-primary" type="button" value="保存">
	 </li>
    </ul>
   </div> 
	<sys:message content="${message}"/>	
	<form:form id="inputForm" modelAttribute="accidentRatio" action="${ctx}/accident/accidentRatio/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>	
		<div class="control-group">
			<label class="control-label">事故类型：</label>
			<div class="controls">
				<form:select id="type" path="type" tabindex="-1" class="input-xlarge ">
					<form:options items="${fns:getDictList('accident_type')}" title="label" itemValue="value" itemLabel="label" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">比例：</label>
			<div class="controls">
				<form:input path="ratio" htmlEscape="false" maxlength="30" class="input-xlarge "/>
				<label>%</label>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">审核流程：</label>
			<div class="controls">
				<form:select path="reserved" class="input-xlarge ">
					<c:choose>
						<c:when test="${accidentRatio.reserved eq '1' }">
							<form:option value="0" label="设计审核流程"/>
							<form:option selected="selected" value="1" label="供应商审核流程"/>
						</c:when>
						<c:otherwise>
							<form:option selected="selected" value="0" label="设计审核流程"/>
							<form:option value="1" label="供应商审核流程"/>
						</c:otherwise>
					</c:choose>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属事故：</label>
			<div class="controls">
				<form:select path="accidentType" class="input-xlarge ">
					<c:choose>
						<c:when test="${accidentRatio.accidentType eq '1' }">
							<form:option selected="selected" value="1" label="销售事故"/>
							<form:option value="0" label="收货事故"/>
						</c:when>
						<c:otherwise>
							<form:option selected="selected" value="0" label="收货事故"/>
							<form:option value="1" label="销售事故"/>
						</c:otherwise>
					</c:choose>
				</form:select>
			</div>
		</div>
	</form:form>
</div>	
</body>
</html>