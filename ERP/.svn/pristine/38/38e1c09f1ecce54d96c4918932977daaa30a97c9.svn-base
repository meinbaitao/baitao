<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>计划信息管理</title>
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
	<%-- <ul class="nav nav-tabs">
		<li><a href="${ctx}/task/taskPlan/">计划信息列表</a></li>
		<li class="active"><a href="${ctx}/task/taskPlan/form?id=${taskPlan.id}">计划信息<shiro:hasPermission name="task:taskPlan:edit">${not empty taskPlan.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="task:taskPlan:edit">查看</shiro:lacksPermission></a></li>
	</ul> --%>
	<ul class="operationg-new">
	<%-- 	<li><a href="${ctx}/task/taskPlan/" class="btn btn-primary" ><span
				class="glyphicon glyphicon-th-list">计划信息列表</span></a></li>
		<li><a href="${ctx}/task/taskPlan/form" class="btn btn-primary"><span
				class="glyphicon glyphicon-plus" >计划信息添加</span></a></li> --%>
					<li><input id="btnCancel" class="btn btn-primary" type="button"
					value="返 回" onclick="history.go(-1)" /></li>
				<li><input id="btnSubmit" class="btn btn-primary" type="submit"
					value="保 存" /></li>
	</ul>
	</div>
	<br/>
	<div class="form-content">
	<form:form id="inputForm" modelAttribute="taskPlan" action="${ctx}/task/taskPlan/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="deptId"/>
		<sys:message content="${message}"/>	
		<ul>	
		<div class="control-group">
			<label class="control-label">上级任务：</label>
			<div class="controls">
				<form:input path="parentId" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">经办部门：</label>
			<div class="controls">			  
				<form:input path="deptName" htmlEscape="false" maxlength="50" class="input-xlarge " readonly="true" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">复评部门：</label>
			<div class="controls">
				 	<%-- <sys:treeselect id="office" name="office.id" value="${user.office.id}" labelName="office.name" labelValue="${user.office.name}"
					title="部门" url="/sys/office/treeData?type=2" cssClass="required" notAllowSelectParent="true"/>	 --%>
				<form:input path="reviewDeptId"  htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">集团关注：</label>
			<div class="controls">
				<form:input path="groupConcern" htmlEscape="false" maxlength="1" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">长期任务：</label>
			<div class="controls">
				<form:input path="longTermTask" htmlEscape="false" maxlength="1" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">讨论建议：</label>
			<div class="controls">
				<form:input path="discussionSuggestion" htmlEscape="false" maxlength="1" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">责任人：</label>
			<div class="controls">
				<form:input path="responsiblePerson" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">一级计划：</label>
			<div class="controls">
				<form:input path="oneLevelPlan" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">二级计划：</label>
			<div class="controls">
				<form:input path="twoLevelPlan" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">任务描述：</label>
			<div class="controls">
				<form:input path="taskDesc" htmlEscape="false" maxlength="300" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">计划完成时间：</label>
			<div class="controls">
				<input name="planFinishTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${taskPlan.planFinishTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">实际完成时间：</label>
			<div class="controls">
				<input name="actualFinishTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${taskPlan.actualFinishTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">完成时间调整1：</label>
			<div class="controls">
				<input name="finishTimeAdjust1" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${taskPlan.finishTimeAdjust1}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">完成时间调整2：</label>
			<div class="controls">
				<input name="finishTimeAdjust2" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${taskPlan.finishTimeAdjust2}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">完成情况复评：</label>
			<div class="controls">
				<form:input path="finishReview" htmlEscape="false" maxlength="300" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">计划/总结备注：</label>
			<div class="controls">
				<form:input path="summaryRemarks" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">预警：</label>
			<div class="controls">
				<form:input path="earlyWarning" htmlEscape="false" maxlength="1" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">计划执行状态：</label>
			<div class="controls">
				<form:input path="status" htmlEscape="false" maxlength="1" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<span>
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="200" class="input-xxlarge "/>
			</span>
		</div>
		</ul>
		<div class="form-actions">
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			<input id="btnSubmit" type="submit" name="btnSubmit" class="btn btn-primary" value="提交"/>
			<%-- <shiro:hasPermission name="task:taskPlan:edit">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="submit" value="提交"/> --%>
		</div>
	</form:form>
	</div>
	</div>
</body>
</html>