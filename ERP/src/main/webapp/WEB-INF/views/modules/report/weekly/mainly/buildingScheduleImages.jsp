<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>上传在建进度图片</title>
<meta name="decorator" content="default" />
</head>
<body>
	<div class="list-content">

		<div class="nav-operate">
			<ul class="operationg-new">
				<li><input id="btnCancel" class="btn btn-primary" type="button"
					value="返 回" onclick="history.go(-1)" /></li>
			</ul>
			<div class="clear"></div>
		</div>

		<jsp:include page="buildingImagesHead.jsp" />

		<div class="form-content">
			<form action="${ctx}/report/weekly/buildingSchedule/upload"
				method="post" modelAttribute="uploadForm"
				enctype="multipart/form-data">
				<input type="hidden" value="${buildingSchedule.id}"
					name="buildingScheduleId" id="buildingScheduleId" />
				<ul>
					<li><span class="tab-name">上传南立面:</span> <input
						name="files[0]" type="file" /></li>
					<li><span class="tab-name">上传北立面:</span> <input
						name="files[1]" type="file" /></li>
					<li><span class="tab-name">上传东立面:</span> <input
						name="files[2]" type="file" /></li>
					<li><span class="tab-name">上传西立面:</span> <input
						name="files[3]" type="file" /></li>
				</ul>
				<input type="submit" value="上传" />
			</form>
		</div>

	</div>
	<script src="${ctxStatic}/modules/report/weekly/buildingSchedule.js"
		type="text/javascript"></script>
</body>
</html>