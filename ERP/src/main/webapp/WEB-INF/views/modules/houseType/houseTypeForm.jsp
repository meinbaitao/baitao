<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>户型管理</title>
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
		//统计 骨架+石材劳务估值
		function sum(){
			var laborBudgetGj = $("#laborBudgetGj").val();
			var laborBudgetSc = $("#laborBudgetSc").val();
			if(!laborBudgetGj)
				laborBudgetGj=0;
			if(!laborBudgetSc)
				laborBudgetSc=0;
			$("#sumLaborBudget").val(parseFloat(parseFloat(laborBudgetGj)+parseFloat(laborBudgetSc)).toFixed(2));
		}
		//验证户型是否存在
		function validateHouseType(){
			var houseType = $("#houseType").val();
			var houseTypeVal = $("#houseType").attr("attrVal");
			if(houseType&&houseTypeVal!=houseType){
				var d={houseType:houseType};
				var url="/a/houseType/houseType/validateHouseType";
				startUp.postData(url,d,function(data){
					if(!data.houseType.isNewRecord){
						var tips="<span id='houseTypeDuplicate' class='help-inline red'>户型【"+data.houseType.houseType+"】已存在</span>";
						$("#houseTypeDiv").append(tips);
					}
				});
			}
		}
		//删除楼栋验证提示
		function removeTips(){
			$("#houseTypeDuplicate").remove();
		}
	</script>
</head>
<body>
	<form:form id="inputForm" modelAttribute="houseType" action="${ctx}/houseType/houseType/save" method="post" class="form-horizontal">
	<div class="list-content">
	     <div class="nav-operate" >	
	       <ul class="operationg-new" >
               <a href="${ctx}/houseType/houseType/" class="btn btn-primary">返回</a>
               <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
     		 </ul> 
	      </div>
	     <div class="form-content">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">户型：</label>
			<div id="houseTypeDiv" class="controls">
				<form:input onblur="javascript:validateHouseType();" onfocus="javascript:removeTips();" attrVal="${houseType.houseType }"
					id="houseType" path="houseType" htmlEscape="false" maxlength="100" class="input-mini required"/>
				<span class="help-inline"><font color="red">*</font></span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">施工面积：</label>
			<div class="controls">
				<form:input path="constructArea" htmlEscape="false" class="input-mini required number"/>
				<span class="help-inline"><font color="red">*</font></span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">劳务面积：</label>
			<div class="controls">
				<form:input path="laborArea" htmlEscape="false" class="input-mini required number"/>
				<span class="help-inline"><font color="red">*</font></span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">骨架劳务估值：</label>
			<div class="controls">
				<form:input id="laborBudgetGj" onkeyup="javascript:sum();" path="laborBudgetGj" htmlEscape="false" class="input-mini required number"/>
				<span class="help-inline"><font color="red">*</font></span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">石材劳务估值：</label>
			<div class="controls">
				<form:input id="laborBudgetSc" onkeyup="javascript:sum();" path="laborBudgetSc" htmlEscape="false" class="input-mini required number"/>
				<span class="help-inline"><font color="red">*</font></span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">骨架+石材劳务估值：</label>
			<div class="controls">
				<input type="text" id="sumLaborBudget" name="sumLaborBudget" disabled="disabled" value="<fmt:formatNumber value="${houseType.laborBudgetGj+houseType.laborBudgetSc}" pattern="####.##"/>"/>
			</div>
		</div>
		<!-- <div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div> -->
	</div>
	</div>
	</form:form>
</body>
</html>