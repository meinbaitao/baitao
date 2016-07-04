<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
	<title>流程审批</title>
	<meta name="decorator" content="default"/>
	<script>
		var ctxPath="${ctx}";

		function hiddenReason(){

			var approval = $("#auditApproval  option:selected").text();
			if(approval==1){
				$("#auditApproval").css("display","table-row");
			}else{
				$("#auditApproval").css("display","display");
			}
		}
	</script>
</head>
<body>
<form action="${ctx}/act/task/complete" method="post">
	<form:hidden path="act.taskId"/>
	<form:hidden path="act.taskName"/>
	<form:hidden path="act.taskDefKey"/>
	<form:hidden path="act.procInsId"/>
	<form:hidden path="act.procDefId"/>
	<form:hidden id="flag" path="act.flag"/>
	<fieldset>
	<table border="1">
		<tr>
			<td>是否审核通过：</td>
			<td>
				<select id="auditApproval" name="vars.map['auditApproval']" onselect="hiddenReason()">
					<option value="1">同意</option>
					<option value="0">驳回</option>
				</select>
			</td>
		</tr>

		<tr style="display:none" id="rejectBackReasonTr">
			<td >驳回理由：</td>
			<td>
				<textarea id="rejectBackReason" name="vars.map['rejectBackReason']"></textarea>
			</td>
		</tr>
		<tr><td colspan="2"><input type="submit" value="提交" /></td></tr>
	</table>
	</fieldset>
</form>
</body>
</html>