<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>劳务台账管理</title>
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
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/contract/laborcontractAccount/">劳务台账列表</a></li>
		<li class="active"><a href="${ctx}/contract/laborcontractAccount/form?id=${laborcontractAccount.id}">劳务台账<shiro:hasPermission name="contract:laborcontractAccount:edit">${not empty laborcontractAccount.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="contract:laborcontractAccount:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="laborcontractAccount" action="${ctx}/contract/laborcontractAccount/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">劳务合同：</label>
			<div class="controls">
				<form:input path="laborcontractId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">竣工日期：</label>
			<div class="controls">
				<form:input path="finishDate" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">劳务结算额：</label>
			<div class="controls">
				<form:input path="settlementPrice" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">累计完工比例：</label>
			<div class="controls">
				<form:input path="finishRatio" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">累计完工款：</label>
			<div class="controls">
				<form:input path="finishPrice" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">应付进度款：</label>
			<div class="controls">
				<form:input path="schedulePayShould" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">应付到期质保金：</label>
			<div class="controls">
				<form:input path="qualityPayShould" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">应付未到期质保金：</label>
			<div class="controls">
				<form:input path="qualityPayNotYet" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">已申请劳务费：</label>
			<div class="controls">
				<form:input path="laborPriceRequired" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">已申请进度款：</label>
			<div class="controls">
				<form:input path="schedulePayRequired" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">已申请质保金：</label>
			<div class="controls">
				<form:input path="qualityPayRequired" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">已申请赶工补偿：</label>
			<div class="controls">
				<form:input path="hurryCompensationRequired" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">已申请住宿补贴：</label>
			<div class="controls">
				<form:input path="settleCompensationRequered" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">已付劳务费：</label>
			<div class="controls">
				<form:input path="laborPrice" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">已付进度款：</label>
			<div class="controls">
				<form:input path="schedulePayAlready" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">已付质保金：</label>
			<div class="controls">
				<form:input path="qualityPayAlready" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">已付赶工补偿：</label>
			<div class="controls">
				<form:input path="hurryCompensationAlready" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">已付住宿补贴：</label>
			<div class="controls">
				<form:input path="settleCompensationAlready" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">待付进度款：</label>
			<div class="controls">
				<form:input path="schedulePayWait" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">已申请待付进度款：</label>
			<div class="controls">
				<form:input path="schedulePayRequiredWait" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">未申请待付进度款：</label>
			<div class="controls">
				<form:input path="schedulePayNotRequired" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">待付质保金：</label>
			<div class="controls">
				<form:input path="qualityPayWait" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">待付已申请质保金：</label>
			<div class="controls">
				<form:input path="qualityPayRequiredWait" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">待付未申请质保金：</label>
			<div class="controls">
				<form:input path="qualityPayNotRequired" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">待付赶工补偿：</label>
			<div class="controls">
				<form:input path="hurryCompensationWait" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">待付住宿补偿：</label>
			<div class="controls">
				<form:input path="settleCompensationWait" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">待付总金额：</label>
			<div class="controls">
				<form:input path="sumPriceWait" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="contract:laborcontractAccount:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>