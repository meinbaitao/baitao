<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>显示二级项目报表管理</title>
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
		<li><a href="${ctx}/viewsubprojectprogress/viewSubprojectProgress/">显示二级项目报表列表</a></li>
		<li class="active"><a href="${ctx}/viewsubprojectprogress/viewSubprojectProgress/form?id=${viewSubprojectProgress.id}">显示二级项目报表<shiro:hasPermission name="viewsubprojectprogress:viewSubprojectProgress:edit">${not empty viewSubprojectProgress.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="viewsubprojectprogress:viewSubprojectProgress:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="viewSubprojectProgress" action="${ctx}/viewsubprojectprogress/viewSubprojectProgress/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">二级项目：</label>
			<div class="controls">
				<form:input path="subid" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">项目主键：</label>
			<div class="controls">
				<form:input path="projectid" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">户型：</label>
			<div class="controls">
				<form:input path="subhousetype" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">楼栋号：</label>
			<div class="controls">
				<form:input path="subbuilding" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">预估挂石面积：</label>
			<div class="controls">
				<form:input path="subastone" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标签名：</label>
			<div class="controls">
				<form:input path="showtype" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标签名：</label>
			<div class="controls">
				<form:input path="materialtype" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">计划开始时间：</label>
			<div class="controls">
				<form:input path="planstartdate" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">计划完成时间：</label>
			<div class="controls">
				<form:input path="planenddate" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">设计图纸计划完成时间：</label>
			<div class="controls">
				<form:input path="designstartdate" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">石材下单计划完成时间：</label>
			<div class="controls">
				<form:input path="stoneorderdate" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">骨架类材料下单计划完成时间：</label>
			<div class="controls">
				<form:input path="skeletonorderdate" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">挂件类材料下单计划完成时间：</label>
			<div class="controls">
				<form:input path="pendantorderdate" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">石材要求到货时间：</label>
			<div class="controls">
				<form:input path="stoneedate" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">骨架类材料要求到货时间：</label>
			<div class="controls">
				<form:input path="skeletonedate" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">挂件类材料要求到货时间：</label>
			<div class="controls">
				<form:input path="pendantedate" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">设计图纸实际完成时间：</label>
			<div class="controls">
				<form:input path="designCompleteDate" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">石材下单实际完成时间：</label>
			<div class="controls">
				<form:input path="stoneCompleteDate" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">骨架类材料下单实际完成时间：</label>
			<div class="controls">
				<form:input path="skeletonCompleteDate" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">挂件类材料下单实际完成时间：</label>
			<div class="controls">
				<form:input path="pendantCompleteDate" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">姓名：</label>
			<div class="controls">
				<form:input path="showdesigner" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">设计师联系方式：</label>
			<div class="controls">
				<form:input path="designerMobile" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">实际挂石面积：</label>
			<div class="controls">
				<form:input path="stoneActualArea" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">workclass：</label>
			<div class="controls">
				<form:input path="workclass" htmlEscape="false" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">larbomoney：</label>
			<div class="controls">
				<form:input path="larbomoney" htmlEscape="false" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">石材实际到货时间：</label>
			<div class="controls">
				<form:input path="stoneActualDate" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">骨架类材料实际到货时间：</label>
			<div class="controls">
				<form:input path="skeletonActualDate" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">挂件类材料实际到货之间：</label>
			<div class="controls">
				<form:input path="pendantActualDate" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">workshiftdate：</label>
			<div class="controls">
				<form:input path="workshiftdate" htmlEscape="false" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">completedate：</label>
			<div class="controls">
				<form:input path="completedate" htmlEscape="false" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">各栋预估总产值：</label>
			<div class="controls">
				<form:input path="estimateRevenue" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="viewsubprojectprogress:viewSubprojectProgress:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>