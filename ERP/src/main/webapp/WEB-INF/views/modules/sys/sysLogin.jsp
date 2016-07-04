<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>${fns:getConfig('productName')} 登录</title>
	<link rel="shortcut icon" href="#" type="image/x-icon"/>
	<meta name="decorator" content="blank"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- CSS -->
    <link rel="stylesheet" href="${ctxStatic}/login/reset.css">
    <link rel="stylesheet" href="${ctxStatic}/login/login_style.css">
     
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
     <style>
      html{overflow-y:hidden;}
     </style> 
	<script type="text/javascript">
		$(document).ready(function() {
			if("${message}"!="")
				$("#messageBox").show();
			$("#loginForm").validate({
				rules: {
					validateCode: {remote: "${pageContext.request.contextPath}/servlet/validateCodeServlet"}
				},
				messages: {
					username: {required: "请填写用户名."},password: {required: "请填写密码."},
					validateCode: {remote: "验证码不正确.", required: "请填写验证码."}
				},
				errorLabelContainer: "#messageBox",
				errorPlacement: function(error, element) {
					error.html($("#loginError").parent());
				} 
			});
			$("body").css("overflow-y","hidden");
		});
		// 如果在框架或在对话框中，则弹出提示并跳转到首页
		if(self.frameElement && self.frameElement.tagName == "IFRAME" || $('#left').length > 0 || $('.jbox').length > 0){
			alert('未登录或登录超时。请重新登录，谢谢！');
			top.location = "${ctx}";
		}
		$(document).keypress(function(event){  
		    var keycode = (event.keyCode ? event.keyCode : event.which);  
		    if(keycode == '13'){  
		    	$("#submit").click();
		    }  
		}); 
	
	</script>
</head>
<body oncontextmenu="return false">
	<div class="page-container">
           <h1> <img src="${ctxStatic}/img/logo_black.png" style="vertical-align:middle;">  ${fns:getConfig('productName')}</h1>
			<form id="loginForm" class="form-signin" action="${ctx}/login" method="post">
				<div id="messageBox" style="display:none;">
					<label style="color:red;" id="loginError" class="error">${message}</label>
				</div>
				<div>																			 <%-- value="${username}" --%>
				    <input type="text" id="username" name="username" class="required username" value="" autocomplete="off">
				</div>
                <div>
                   <input type="password" id="password" name="password" value="" class="required password" oncontextmenu="return false" onpaste="return false">
                </div>
				
				<c:if test="${isValidateCodeLogin}"><div class="validateCode">
					<label style="color:#2fa4e7;" class="input-label mid" for="validateCode">验证码</label>
					<sys:validateCode name="validateCode" inputCssStyle="margin-bottom:0;"/>
				</div>
				</c:if><%--
				<label for="mobile" title="手机登录"><input type="checkbox" id="mobileLogin" name="mobileLogin" ${mobileLogin ? 'checked' : ''}/></label> --%>
				<button  type="submit" id="submit"  >登 录</button>&nbsp;&nbsp;
				<%-- <label for="rememberMe" title="下次不需要再登录"><input type="checkbox" id="rememberMe" name="rememberMe" ${rememberMe ? 'checked' : ''}/> 记住我（公共场所慎用）</label>
				<div id="themeSwitch" class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">${fns:getDictLabel(cookie.theme.value,'theme','默认主题')}<b class="caret"></b></a>
					<ul class="dropdown-menu">
					  <c:forEach items="${fns:getDictList('theme')}" var="dict"><li><a href="#" onclick="location='${pageContext.request.contextPath}/theme/${dict.value}?url='+location.href">${dict.label}</a></li></c:forEach>
					</ul>
					<!--[if lte IE 6]><script type="text/javascript">$('#themeSwitch').hide();</script><![endif]-->
				</div> --%>
			</form>
			<div class="forget-password">
			  <!--  <a href="javascript:;" >忘记密码?</a> -->
			</div>
        </div>
        
	<div class="footer">
		Copyright &copy; 2012-${fns:getConfig('copyrightYear')} <%-- <a href="${pageContext.request.contextPath}${fns:getFrontPath()}">${fns:getConfig('productName')}</a> - --%>
																	<a href="javascript:void(0)">${fns:getConfig('productName')}</a> - 

Powered By <!-- <a href="http://jeesite.com" target="_blank">JeeSite</a> -->
	<a href="javascript:void(0)" target="_blank">广州市柏涛信息技术有限责任公司</a> 
	 ${fns:getConfig('version')} 
	</div>
    <div class="copyright" >
           <p><a href="javascript:void(0)"><img src="${ctxStatic}/img/ClearCom.png" target="_blank" >广州市柏涛信息技术有限责任公司 开发维护</a></p>
    </div>
	
	<script src="${ctxStatic}/flash/zoom.min.js" type="text/javascript"></script>
</body>
</html>
