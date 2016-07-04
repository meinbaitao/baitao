<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>选择添加的事故类型</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
	</script>
</head>
<body>
	<div class="list-content">
		<div class="nav-operate">
			<ul class="operationg-new">
				<li>
					<span class="tab-name">请选择事故类型：</span>
				</li>
				<li>
					<form id="returnForm" action="${ctx}/accident/accidentManage/form?type=1" method="post" >
						<input class="btn btn-primary" type="submit" value="添加石材收货事故">
					</form>
				</li>
				<li>
					<form id="returnForm" action="${ctx}/accident/accidentManage/form?type=2" method="post" >
						<input class="btn btn-primary" type="submit" value="添加钢辅材收货事故">
					</form>
				</li>
				<li>
					<form id="returnForm" action="${ctx}/accident/accidentManage/form?type=3" method="post" >
						<input class="btn btn-primary" type="submit" value="添加石材销售事故">
					</form>
				</li>
				<li>
					<form id="returnForm" action="${ctx}/accident/accidentManage/form?type=4" method="post" >
						<input class="btn btn-primary" type="submit" value="添加钢辅材销售事故">
					</form>
				</li>
			</ul>
		</div>	
	</div>
</body>
</html>