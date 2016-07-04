<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>部门总控计划信息</title>
	<meta name="decorator" content="default"/>
	<style type="text/css">
	    html{overflow:hidden;}
	    body{overflow:hidden;}
	</style>
</head>
<body>

<div id="content" class="row-fluid">
		<div id="left">
			<iframe id="officeMenuFrame" name="officeMenuFrame" src="${ctx}/task/adminPlan/tree" style="overflow:visible;"
				scrolling="yes" frameborder="no" width="100%"></iframe>
		</div>
		<div id="openClose" class="close">&nbsp;</div>
		<div id="right">
		<iframe id="officeMainFrame" name="officeMainFrame" src="${ctx}/task/adminPlan/main"  style="overflow:visible;"
				scrolling="yes" frameborder="no" width="100%"></iframe>
			
		</div>
	</div>
	<script type="text/javascript"> 
		var leftWidth = "230"; // 左侧窗口大小
		function wSize(){
			var strs=getWindowSize().toString().split(",");
			$("#officeMenuFrame, #officeMainFrame, #openClose").height(strs[0]-5);
			$("#right").width($("body").width()-$("#left").width()-$("#openClose").width()-20);
		}
		// 鼠标移动到边界自动弹出左侧菜单
		/* $("#openClose").mouseover(function(){
			if($(this).hasClass("open")){
				$(this).click();
			}
		}); */
	</script>
	<script src="${ctxStatic}/common/wsize.min.js" type="text/javascript"></script>




<%--  --%>

</body>
</html>