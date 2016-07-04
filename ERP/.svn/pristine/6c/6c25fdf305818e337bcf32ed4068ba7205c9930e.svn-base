<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>任务管理</title>
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
			
			$("#btnSubmit").on("click",function(){
				$("#inputForm").submit();
			});
		});
	</script>
</head>
<body>
<div class="list-content" >
		<div class="nav-operate" >
	<ul class="operationg-new">
	   	<li><input id="btnCancel" class="btn btn-primary" type="button"
					value="返 回" onclick="history.go(-1)" /></li>
				<li><input id="btnSubmit" class="btn btn-primary" type="submit"
					value="保 存" /></li>
		<%-- <li><a href="${ctx}/task/taskPersonalPlan/">任务列表</a></li>
		<li class="active"><a href="${ctx}/task/taskPersonalPlan/form?id=${taskPersonalPlan.id}">任务<shiro:hasPermission name="task:taskPersonalPlan:edit">${not empty taskPersonalPlan.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="task:taskPersonalPlan:edit">查看</shiro:lacksPermission></a></li> --%>
	</ul><br/>
	</div>
	<form:form id="inputForm" modelAttribute="taskPersonalPlan" action="${ctx}/task/taskPersonalPlan/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">阶段：</label>
			<div class="controls">
				<form:input path="stage" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">分部：</label>
			<div class="controls">
				<form:input path="subsection" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">细项：</label>
			<div class="controls">
				<form:input path="fine" htmlEscape="false" maxlength="500" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">上级计划：</label>
			<div class="controls">
				<form:input path="parentId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">重点描述：</label>
			<div class="controls">
				<form:input path="keyDesc" htmlEscape="false" maxlength="1000" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">里程碑：</label>
			<div class="controls">
				<form:input path="milepost" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">前置任务：</label>
			<div class="controls">
				<form:input path="frontTask" htmlEscape="false" maxlength="60" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标准天数：</label>
			<div class="controls">
				<form:input path="standardDay" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">完成时间：</label>
			<div class="controls">
				<input name="finishTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${taskPersonalPlan.finishTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否完成：</label>
			<div class="controls">
			  <form:select path="isFinish" class="input-medium required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<%-- <form:input path="isFinish" htmlEscape="false" maxlength="1" class="input-xlarge required"/> --%>
				<!-- <span class="help-inline"><font color="red">*</font> </span> -->
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">确认完成：</label>
			<div class="controls">
			 <form:select path="confirmOmpletion" class="input-medium required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<%-- <form:input path="confirmOmpletion" htmlEscape="false" maxlength="1" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span> --%>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">责任人：</label>
			<div class="controls">
				<form:input path="responsiblePerson" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">状态：</label>
			<div class="controls">
				<form:input path="status" htmlEscape="false" maxlength="1" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">计划/总结备注：</label>
			<div class="controls">
				<form:input path="summaryRemarks" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="200" class="input-xxlarge "/>
			</div>
		</div>
		<%-- <div class="form-actions">
			<shiro:hasPermission name="task:taskPersonalPlan:edit">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
			</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div> --%>
	</form:form>
	</div>
</body>
</html>