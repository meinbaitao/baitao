<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>项目添加</title>
<meta name="decorator" content="default" />
<%@include file="/WEB-INF/views/include/activitiHeader.jsp"%>
<script type="text/javascript" src="${ctxStatic}/modules/qualityitem/scripts/qualityitem.js?tsf=${jsVersion}"></script>

<script type="text/javascript">
	/*
		$(document).ready(function() {
			$("#editBtn").click(function(){
				var data=table_eidt_data();
				console.log(data);
			})
		});
	 */
	$(document).ready(function() {
		form_validate("inputForm");
	});
	 
	function validateItem(obj) {
			var val = $(obj).val();
			//请求详情数据
			var d = {"item":val};
			if(val && "update" != $("#flag").val()){
				var url ="/a/qualityitem/getbyitem";
				startUp.postData(url,d,function(data){
					if(data.qualityitem.item == $("#item").val()){
						alert("该条款已经存在，不允许重复添加!");
						 $("#item").focus();
					}
				});
			}
	}
</script>
<style type="text/css">
.td1 {font-size：14;
	
}
</style>
</head>


<body>

	<form:form id="inputForm" modelAttribute="qualityitem"
		action="${ctx}/qualityitem/save" method="post"
		class="form-horizontal magbtm0">
		<table width="824" height="320" border="0" cellspacing="0"
			class="table table-striped table-bordered table-condensed resize table-eidt">
			<tr>
				<td colspan="6" align="center">劳务合同质保金条款新增编辑界面</td>
			</tr>
			<tr>
				<td width="120" align="left"><input id="btnCancel"
					class="btn btn-primary" type="button" value="返 回"
					onclick="history.go(-1)" /></td>
				<td colspan="4"></td>
				<td width="220" align="right"><input type="button"
					name="editBtn" id="editBtn" class="btn btn-primary" value="保存" /></td>
			</tr>
			<tr>
				<td colspan="6">主要信息</td>
			</tr>
			<tr>
				<td class="td1">质保金条款</td>
				<td width="116"><form:input path="item" id="item" onblur = "validateItem(this)"
						htmlEscape="false" maxlength="200" class="input-medium required"
						value="${qualityitem.item}" />
						<span class="help-inline"><font color="red">*</font></span>
						</td>
				<td width="87" class="td1">进度款最高申请比例</td>
				<td width="117"><form:input path="exscheduleRatio"
						id="exscheduleRatio" htmlEscape="false" maxlength="200"
						class="input-medium required"
						value="${qualityitem.exscheduleRatio}" />
						<span class="help-inline"><font color="red">*</font></span>
						</td>
				<td width="120" class="td1">结算款最高申请比例</td>
				<td><form:input path="accountRatio" id="accountRatio"
						htmlEscape="false" maxlength="200" class="input-medium"
						value="${qualityitem.accountRatio}" /></td>
			</tr>
			<tr>
				<td class="td1">质保金比例1【%】</td>
				<td><form:input path="qualityRatioFrist" id="qualityRatioFrist"
						htmlEscape="false" maxlength="200" class="input-medium required"
						value="${qualityitem.qualityRatioFrist}" />
						<span class="help-inline"><font color="red">*</font></span>
						</td>
				<td class="td1">质保金比例2【%】</td>
				<td><form:input path="qualityRatioSecond"
						id="qualityRatioSecond" htmlEscape="false" maxlength="200"
						class="input-medium required"
						value="${qualityitem.qualityRatioSecond}" />
						<span class="help-inline"><font color="red">*</font></span>
						</td>
				<td class="td1">质保金比例1天数</td>
				<td><form:input path="qualityPayDateFrist"
						id="qualityPayDateFrist" htmlEscape="false" maxlength="200"
						class="input-medium"
						value="${qualityitem.qualityPayDateFrist}" /></td>
			</tr>
			<tr>
				<td class="td1">质保金比例2天数</td>
				<td><form:input path="qualityPayDateSecond"
						id="qualityPayDateSecond" htmlEscape="false" maxlength="200"
						class="input-medium"
						value="${qualityitem.qualityPayDateSecond}" /></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="td1">质保金条款说明</td>
				<td colspan="3"><form:textarea cols="16" style="width:600px"
						rows="3" path="itemExplain" id="itemExplain" class="required" /></td>
				<td></td>
				<td></td>
			</tr>

			<form:input type="hidden" path="flag" id="flag"
				value="${qualityitem.flag}" />
			<form:input type="hidden" path="id" id="id" value="${qualityitem.id}" />

		</table>
	</form:form>
</body>
</html>