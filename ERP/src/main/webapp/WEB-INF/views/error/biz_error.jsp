<%@page import="com.bt.common.exceptions.BusinessException"%>
<%@page import="org.slf4j.Logger,org.slf4j.LoggerFactory"%>
<%@page import="com.thinkgem.jeesite.common.web.Servlets"%>
<%@page import="com.thinkgem.jeesite.common.utils.Exceptions"%>
<%@page import="com.thinkgem.jeesite.common.utils.StringUtils"%>
<%@page contentType="text/html;charset=UTF-8" isErrorPage="true"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>系统业务异常</title>
	<%@include file="/WEB-INF/views/include/head.jsp" %>
</head>
<body>
	<div class="container-fluid">
		<div class="page-header"><h1></h1></div>
		<div class="errorMessage">
			异常信息：<%=((BusinessException) exception).getMessage()%> <br/> <br/>
			<br/>
			异常编号：<%=StringUtils.toHtml(((BusinessException) exception).getMessageCode())%> <br/> <br/>
			<br/> <br/>
			<a href="javascript:" onclick="history.go(-1);" class="btn">返回上一页</a> &nbsp;
		</div>
	</div>
</body>
</html>