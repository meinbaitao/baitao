<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>上传在建进度图片</title>
	<meta name="decorator" content="default"/>

</head>
<body>
	<div class="list-content" >

		<div class="nav-operate" >
			<ul class="operationg-new" >
				<li>
					<input id="btnCancel" class="btn btn-primary" type="button" value="返 回" onclick="history.go(-1)"/>
				</li>
			</ul>
			<div class="clear"></div>
		</div>

		<jsp:include page="buildingImagesHead.jsp" />

	</div>
	<input type="hidden" value="${buildingSchedule.id}"
					name="buildingScheduleId" id="buildingScheduleId" />
	<script src="${ctxStatic}/modules/report/weekly/buildingSchedule.js"
		type="text/javascript"></script>
</body>
</html>