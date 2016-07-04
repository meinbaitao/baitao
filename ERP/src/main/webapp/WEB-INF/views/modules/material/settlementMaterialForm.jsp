<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>添加修改物料加工项</title>
<meta name="decorator" content="default" />
<%@include file="/WEB-INF/views/include/activitiHeader.jsp"%>
<script type="text/javascript"
	src="${ctxStatic}/modules/finance/scripts/manufSettlementMaterial.js?tsf=${jsVersion}">
	
</script>
<script type="text/javascript">
	function typeChange() {
		var url = "/a/material/settlementMaterial/typeChange";		
		var type = $("#settlementType").val();
		var d = {type : type};
		var flag = false;
		
		startUp.postData(url,d,function(data) {
			var html = "";
			 for (i = 0; i < data.length; i++) {
					html += "<input type='checkbox' name='checkdbox' "
					  +" id='"+data[i].settlementItem+"'>"
						+ data[i].itemName;
			}
				$("#jgxxz").html(html);
				defaultItem(data);
			});
		
	}
		 
	function defaultItem(){
		var vurl = "/a/material/settlementMaterial/defaultItem";
		var id = $("#id").val();
		var c = {id : id};
		startUp.postAsyncData(vurl,c,function(vdata) {
			for(i=0;i<vdata.length;i++){
				$("#"+vdata[i].settlementItem).attr("checked","checked");
			}
		});
	}
	
	function validateItem() {
		var materialNo = $("#materialNo").val();
		var d = {materialNo : materialNo};
		if (materialNo && "update" != $("#flag").val()) {
			var url = "/a/material/settlementMaterial/validateMaterialNo";
			startUp.postData(url,d,function(data){
				if(!data.materialNo){
					var tips="<span id='houseTypeDuplicate' class='help-inline red'>物料编号【"+materialNo+"】已存在</span>";
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
<style type="text/css">
.td1 {font-size：14;
	
}
</style>
</head>

<body>

	<form:form id="inputForm" modelAttribute="settlementMaterial"
		action="${ctx}/material/settlementMaterial/save" method="post"
		class="form-horizontal magbtm0">
		<table width="824" height="320" border="0" cellspacing="0"
			class="table table-striped table-bordered table-condensed resize table-eidt">
			<tr>
				<td colspan="6" align="center">物料选择加工项界面</td>
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
				<td class="td1">物料规格编号</td>
				<td width="116">
				<div id="houseTypeDiv">
				<form:input path="materialNo" id="materialNo"
						onblur="javascript:validateItem();" onfocus="javascript:removeTips();" htmlEscape="false" maxlength="200"
						class="input-medium required" 
						value="${settlementMaterial.materialNo}" />
							<span class="help-inline"><font color="red">*</font></span>
			</div>
			</td>	
				<td width="87" class="td1">物料规格名称</td>
				<td width="117"><form:input path="materialName"
						id="materialName" htmlEscape="false" maxlength="200"
						class="input-medium required"
						value="${settlementMaterial.materialName}" />
						<span class="help-inline"><font color="red">*</font></span>
						</td>
				<td width="120" class="td1">加工类别</td>
				<td><select onchange="javascript:typeChange();"
					id="settlementType" name="settlementType" class="input-small">
						<option value="${settlementMaterial.settlementType }">
							${settlementMaterial.settlementType }</option>
						<c:forEach items="${settlementTypeList}" var="outside"
							varStatus="idx">
							<option value="${settlementTypeList[idx.index] }"
								<c:if test="${settlementType eq settlementTypeList[idx.index]}">selected="selected"</c:if>>${settlementTypeList[idx.index] }</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td class="td1">已含加工项</td>
				<td colspan="3"><c:forEach
						items="${settlementMaterialMappingList}" var="settlementItem"
						varStatus="idx">
						${settlementMaterialMappingList[idx.index].itemName }
					</c:forEach></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="td1">加工项选择</td>
				<td colspan="3" id="jgxxz"></td>
				<td></td>
				<td></td>
			</tr>
			<form:input type="hidden" path="flag" id="flag"
				value="${settlementMaterial.flag}" />
			<form:input type="hidden" path="id" id="id"
				value="${settlementMaterial.id}" />

		</table>
	</form:form>
</body>
</html>