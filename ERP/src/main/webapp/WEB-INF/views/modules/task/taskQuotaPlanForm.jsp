<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>指标型计划管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(
			function() {				
				//$("#name").focus();
				/* $("#inputForm").validate(
								{
									submitHandler : function(form) {
										loading('正在提交，请稍等...');
										form.submit();
									},
									errorContainer : "#messageBox",
									errorPlacement : function(error, element) {
										$("#messageBox").text("输入有误，请先更正。");
										if (element.is(":checkbox")
												|| element.is(":radio")
												|| element.parent().is(
														".input-append")) {
											error.appendTo(element.parent()
													.parent());
										} else {
											error.insertAfter(element);
										}
									}
								}); */
				$("#btnSubmit").on("click",function(){
					$("#inputForm").submit();
				});
			});
</script>
</head>
<body>
	<div class="list-content">
		<div class="nav-operate">
			<ul class="operationg-new">
				<li><input id="btnCancel" class="btn btn-primary" type="button"
					value="返 回" onclick="history.go(-1)" /></li>
				<li><input id="btnSubmit" class="btn btn-primary" type="submit"
					value="保 存" /></li>
				<%-- 			<li><a href="${ctx}/task/taskQuotaPlan/">指标型计划列表</a></li>
				<li class="active"><a
					href="${ctx}/task/taskQuotaPlan/form?id=${taskQuotaPlan.id}">指标型计划<shiro:hasPermission
							name="task:taskQuotaPlan:edit">${not empty taskQuotaPlan.id?'修改':'添加'}</shiro:hasPermission>
						<shiro:lacksPermission name="task:taskQuotaPlan:edit">查看</shiro:lacksPermission></a></li> --%>
			</ul>
		</div>
		<div class="form-content">
			<form:form id="inputForm" modelAttribute="taskQuotaPlan"
				action="${ctx}/task/taskQuotaPlan/save" method="post"
				class="form-horizontal">
				<form:hidden path="id" />
				<sys:message content="${message}" />
				<div class="control-group">
					<label class="control-label">上级任务：</label>
					<div class="controls">
					<form:input path="parentId" htmlEscape="false" maxlength="50"
							class="input-xlarge " />
					</div> 
				</div>
				<div class="control-group">
					<label class="control-label">部门：</label>
					<div class="controls">
						<form:input path="deptId" htmlEscape="false" maxlength="50"
							class="input-xlarge " />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">复评部门：</label>
					<div class="controls">
						<form:input path="reviewDeptId" htmlEscape="false" maxlength="50"
							class="input-xlarge " />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">集团关注：</label>
					<div class="controls">
						<form:input path="groupConcern" htmlEscape="false" maxlength="1"
							class="input-xlarge required" />
						<span class="help-inline"><font color="red">*</font> </span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">长期任务：</label>
					<div class="controls">
						<form:input path="longTermTask" htmlEscape="false" maxlength="1"
							class="input-xlarge required" />
						<span class="help-inline"><font color="red">*</font> </span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">讨论建议：</label>
					<div class="controls">
						<form:input path="discussionSuggestion" htmlEscape="false"
							maxlength="1" class="input-xlarge required" />
						<span class="help-inline"><font color="red">*</font> </span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">月份：</label>
					<div class="controls">
					<input name="taskMonth" type="text" readonly="readonly"
							maxlength="20" class="input-medium Wdate "
							value="${taskQuotaPlan.taskMonth}"
							onclick="WdatePicker({dateFmt:'yyyy-MM',isShowClear:false});" />
						<%-- <form:input path="taskMonth" htmlEscape="false" maxlength="50"
							class="input-xlarge " /> --%>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">指标项：</label>
					<div class="controls">
						<form:input path="quotas" htmlEscape="false" maxlength="200"
							class="input-xlarge " />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">权重：</label>
					<div class="controls">
						<form:input path="weight" htmlEscape="false" maxlength="60"
							class="input-xlarge " />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">指标描述：</label>
					<div class="controls">
						<form:input path="quotaDesc" htmlEscape="false" maxlength="500"
							class="input-xlarge required" />
						<span class="help-inline"><font color="red">*</font> </span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">责任人：</label>
					<div class="controls">
						<form:input path="responsiblePerson" htmlEscape="false"
							maxlength="50" class="input-xlarge " />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">实际完成量：</label>
					<div class="controls">
						<form:input path="actualFinishQuantity" htmlEscape="false"
							maxlength="60" class="input-xlarge " />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">得分：</label>
					<div class="controls">
						<form:input path="goal" htmlEscape="false" class="input-xlarge " />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">计划/总结备注：</label>
					<div class="controls">
						<form:input path="summaryRemarks" htmlEscape="false"
							maxlength="200" class="input-xlarge " />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">计划执行状态：</label>
					<div class="controls">
						<form:input path="status" htmlEscape="false" maxlength="1"
							class="input-xlarge required" />
						<span class="help-inline"><font color="red">*</font> </span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">备注信息：</label>
					<div class="controls">
						<form:textarea path="remarks" htmlEscape="false" rows="4"
							maxlength="200" class="input-xxlarge " />
					</div>
				</div>
				<%-- <div class="form-actions">
				<shiro:hasPermission name="task:taskQuotaPlan:edit">
					<input id="btnSubmit" class="btn btn-primary" type="submit"
						value="保 存" />&nbsp;</shiro:hasPermission>
				<input id="btnCancel" class="btn" type="button" value="返 回"
					onclick="history.go(-1)" />
			</div> --%>
			</form:form>
		</div>
	</div>
</body>
</html>