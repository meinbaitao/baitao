<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>物料信息管理</title>
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
		<li><a href="${ctx}/material/material/proc/?type=${material.type}">石材加工项列表</a></li>
		<li class="active"><a href="${ctx}/material/material/proc/form?id=${material.id}&type=${material.type}">石材加工项信息<shiro:hasPermission name="user">${not empty material.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="materialProc:material:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="material" action="${ctx}/material/material/proc/save?type=${material.type}" method="post" class="form-horizontal">
		<form:hidden path="materialprocId"/>
		<sys:message content="${message}"/>		
		<%-- <div class="control-group">
			<label class="control-label">材料ID：</label>
			<div class="controls">
				<form:input path="materialId" htmlEscape="false" maxlength="11" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div> --%>
		<%-- <div class="control-group">
			<label class="control-label">材料类别：</label>
			<div class="controls">
				<form:input path="type" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div> --%>
		<%-- <form:input path="type" value="${material.type}" type="hidden" htmlEscape="false" class="input-xlarge "/> --%>
			<div class="control-group">
				<label class="control-label">材料编号：</label>
				<div class="controls">
					<form:input path="seriesnumber" htmlEscape="false" maxlength="50" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">材料名称：</label>
				<div class="controls">
					<form:input path="name" htmlEscape="false" maxlength="100" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">材料规格：</label>
				<div class="controls">
					<form:input path="procspec" htmlEscape="false" maxlength="100" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">单位：</label>
				<div class="controls">
					<form:input path="unit" htmlEscape="false" maxlength="50" class="input-xlarge "/>
				</div>
			</div>
			<c:forEach items="${fns:getDictList('jcsj_scjgxbzjk')}" var="area" varStatus="i">
				<div class="control-group">
					<label class="control-label">${area.label}</label>
					<div class="controls">
						<input name="area" id="area${i.index+1}" type="text" value="${fn:split(material.mpp.prices, ',')[i.index]}">
						<%-- <form:input path="" htmlEscape="false" maxlength="100" class="input-xlarge "/> --%>
					</div>
				</div>
			</c:forEach>
			<%-- <div class="control-group">
				<label class="control-label">图片：</label>
				<div class="controls">
					<form:hidden id="nameImage" path="pictureth" htmlEscape="false" maxlength="255" class="input-xlarge"/>
					<sys:ckfinder input="nameImage" type="images" uploadPath="/photo" selectMultiple="false" maxWidth="100" maxHeight="100"/>
				</div>
				
				<div class="contrsols">
					<form:input path="pictureth" htmlEscape="false" maxlength="100" class="input-xlarge "/>
				</div>
			</div> --%>
			<div class="control-group">
				<label class="control-label">税率：</label>
				<div class="controls">
					<form:select name="taxrate" id="taxrate" path="taxrate" class="input-small"><form:option value="" label=""/><form:options items="${fns:getDictList('sl')}" itemValue="value" itemLabel="label" htmlEscape="false"/></form:select>
					<%-- <form:input path="mp.taxrate" htmlEscape="false" class="input-xlarge "/> --%>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">发票类型：</label>
				<div class="controls">
					<form:select name="invoicetype" id="invoicetype" path="invoicetype" class="input-small"><form:option value="" label=""/><form:options items="${fns:getDictList('fplx')}" itemValue="value" itemLabel="label" htmlEscape="false"/></form:select>
					<%-- <form:input path="mp.invoicetype" htmlEscape="false" maxlength="200" class="input-xlarge "/> --%>
				</div>
			</div>
		<%-- <div class="control-group">
			<label class="control-label">材料类别：</label>
			<div class="controls">
				<form:select id="type" path="type" class="input-small"><form:option value="" label=""/><form:options items="${fns:getDictList('jcsj_gfc')}" itemValue="value" itemLabel="label" htmlEscape="false"/></form:select>
			</div>
		</div> --%>
		<%-- <div class="control-group">
			<label class="control-label">长度：</label>
			<div class="controls">
				<form:input path="length" htmlEscape="false" maxlength="11" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">宽度：</label>
			<div class="controls">
				<form:input path="width" htmlEscape="false" maxlength="11" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">高度：</label>
			<div class="controls">
				<form:input path="height" htmlEscape="false" maxlength="11" class="input-xlarge "/>
			</div>
		</div> --%>
		<%-- <div class="control-group">
			<label class="control-label">密度：</label>
			<div class="controls">
				<form:input path="quantity" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div> --%>
		
		<%-- <div class="control-group">
			<label class="control-label">删除标识：</label>
			<div class="controls">
				<form:input path="isdeleted" htmlEscape="false" maxlength="11" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div> --%>
		<%-- <div class="control-group">
			<label class="control-label">版本：</label>
			<div class="controls">
				<form:input path="version" htmlEscape="false" maxlength="11" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div> --%>
		<%-- <div class="control-group">
			<label class="control-label">创建时间：</label>
			<div class="controls">
				<input name="createdts" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${material.createdts}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">更新时间：</label>
			<div class="controls">
				<input name="updatedts" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${material.updatedts}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div> --%>
		<%-- <div class="control-group">
			<label class="control-label">更新人：</label>
			<div class="controls">
				<form:input path="updateby" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div> --%>
		<%-- <div class="control-group">
			<label class="control-label">流程状态：</label>
			<div class="controls">
				<form:input path="status" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">工作流ID：</label>
			<div class="controls">
				<form:input path="fworkid" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">图片：</label>
			<div class="controls">
				<form:input path="pictureth" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">年销售额：</label>
			<div class="controls">
				<form:input path="yearprice" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div> --%>
		
		
		
		<%-- <div class="control-group">
			<label class="control-label">类别：</label>
			<div class="controls">
				<form:input path="ltype" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">类型（1，石材，2，钢辅料信息）：</label>
			<div class="controls">
				<form:input path="gmtype" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div> --%>
		<%-- <div class="control-group">
			<label class="control-label">计算公式：</label>
			<div class="controls">
				<form:input path="calculation" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div> --%>
		<div class="form-actions">
			<shiro:hasPermission name="user"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>