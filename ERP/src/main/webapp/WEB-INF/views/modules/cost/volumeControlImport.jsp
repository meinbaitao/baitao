<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>成本控量导入</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/modules/cost/scripts/volumeControl.js?tsf=${jsVersion}" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		
		
		//$("#costId").live("click",function(){
			//alert();
		//	var opso= new ActiveXObject("Scripting.FileSystemObject");
		//	opso.OpenTextFile("${ctx}\\act\\cost.xls", ForReading);
		//});
	</script>
</head>
<body>
	<div class="list-content">
		<div class="nav-operate" >
			<ul>
				<li>
					<span class="tab-name">项目名称：</span>
					<label>
						 <select id="projectNameOne"  class="input-medium required">
							<option value1 = "aa" value="" label="请选择"/>
						</select>
						<span class="help-inline"><font color="red">*</font> </span>
					</label>
				</li>
				<li>
					<span class="tab-name">户型：</span>
					<label>
						 <select id="houseTypeOne"  class="input-medium required">
							<option value="" label="请选择"/>
						</select>
						<span class="help-inline"><font color="red">*</font> </span>
					</label>
				</li>
				<li>
					<span class="tab-name">栋号：</span>
					<label>
						 <select id="buildingOne"class="input-medium required">
							<option value="" label="请选择"/>
						<select>
					</label>
				</li>
			</ul>	
		</div>
	</div>	
	<sys:message content="${message}"/>
	<div id="importBox">
		<form id="importForm" action="${ctx}/cost/volumeControl/volumeControlImport" method="post" enctype="multipart/form-data"
				class="form-search" style="padding-left:20px;text-align:center;" onsubmit="loading('正在导入，请稍等...');">
				<input id="uploadFile" name="file" type="file" style="width:330px"/><br/><br/>　　
				<input id="btnImportSubmit" class="btn btn-primary" type="submit" value="   导    入   "/>
				<a href="${ctxTemplate}/VolumeControlTemplate.xlsx" id="costId">下载模板</a>
		</form>
	</div>
</body>
</html>