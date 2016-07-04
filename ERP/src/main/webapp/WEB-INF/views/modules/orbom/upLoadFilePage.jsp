<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>下料单文件上传测试</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<form  id="importForm" action="${ctx}/orbom/orderBomBase/UpLoadTest" method="post" enctype="multipart/form-data"
		class="form-search" style="padding-left:20px;text-align:center;" onsubmit="loading('正在导入，请稍等...');">
		<input id="uploadFile" name="file" type="file">
		<input type="submit" value="upload me">
	</form>
</body>
</html>