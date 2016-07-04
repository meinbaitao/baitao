<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html style="overflow:hidden;" >
<head>
	<title>${fns:getConfig('productName')}</title>
	<link rel="shortcut icon" href="#" type="image/x-icon"/>
	<link rel="Bookmark" href="#">
	<meta name="decorator" content="blank"/><c:set var="tabmode" value="${empty cookie.tabmode.value ? '1' : cookie.tabmode.value}"/>
    <c:if test="${tabmode eq '1'}"><link rel="Stylesheet" href="${ctxStatic}/jerichotab/css/jquery.jerichotab.css" />
    <script type="text/javascript" src="${ctxStatic}/jerichotab/js/jquery.jerichotab.js"></script></c:if>
    <link rel="Stylesheet" href="${ctxStatic}/index.css"  />
	<script type="text/javascript">
		window.changeNum=-1;//全局变量值初始化
    	var ctxPath="${ctx}";
    </script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("body").attr("class","index_body");
			// <c:if test="${tabmode eq '1'}"> 初始化页签
			$.fn.initJerichoTab({
                renderTo: '#right', uniqueId: 'jerichotab',
                contentCss: { 'height': $('#right').height()},
                tabs: [], loadOnce: true, titleHeight: tabTitleHeight
            });//</c:if>
			// 绑定菜单单击事件
			
			$("#menu a.menu").click(function(){
				$(".list-li-a:first-child").attr("href","");
				// 一级菜单焦点
				$("#left").find("a").removeClass("active");
				$(this).addClass("active");
				// 左侧区域隐藏
				if ($(this).attr("target") == "mainFrame"){
					$("#left,#openClose").hide();
					wSizeWidth();
					// <c:if test="${tabmode eq '1'}"> 隐藏页签
					$(".jericho_tab").hide();
					$("#mainFrame").show();//</c:if>
					return true;
				}
				// 左侧区域显示
				$("#left,#openClose").show();
				if(!$("#openClose").hasClass("close")){
					$("#openClose").click();
				}
				// 显示二级菜单
				var menuId = "#menu-" + $(this).attr("data-id");
				if ($(menuId).length > 0){
					$("#left .accordion").hide();
					$(menuId).show();
					// 初始化点击第一个二级菜单
					if (!$(menuId + " .accordion-body:first").hasClass('in')){
						$(menuId + " .accordion-heading:first a").click();
					}
					if (!$(menuId + " .accordion-body li:first ul:first").is(":visible")){
						$(menuId + " .accordion-body a:first i").click();
					}
					// 初始化点击第一个三级菜单
					$(menuId + " .accordion-body li:first li:first a:first i").click();
				}else{
					// 获取二级菜单数据
					$.get($(this).attr("data-href")+"&r="+new Date().getTime(), function(data){
						if (data.indexOf("id=\"loginForm\"") != -1){
							alert('未登录或登录超时。请重新登录，谢谢！');
							top.location = "${ctx}";
							return false;
						}
						$("#left .accordion").hide();
						$("#left").append(data.replace(/icon/g,"glyphicon glyphicon"));
						// 链接去掉虚框
						$(menuId + " a").bind("focus",function() {
							if(this.blur) {this.blur()};
						});
						// 二级标题
						$(menuId + " .accordion-heading a").click(function(){
							$(menuId + " .accordion-toggle i").removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-right');
							if(!$($(this).attr('data-href')).hasClass('in')){
								$(this).children("i").removeClass('glyphicon-chevron-right').addClass('glyphicon-chevron-down');
								$("#left").find("a").removeClass("active");
								$(this).addClass("active");
							}
						    move_scroll($(this));
						});
						// 二级内容
						$(menuId + " .accordion-body a").click(function(){
							$("#left").find("a").removeClass("active");
							$(this).addClass("active");
						});
						// 展现三级
						$(menuId + " .accordion-inner a").click(function(){
							var href = $(this).attr("data-href");
							if($(href).length > 0){
							
								$(href).toggle().parent().toggle();
								$(this).parent().find("ul").hide();
								conssss($(this).parent());
								return false;
							}
							// <c:if test="${tabmode eq '1'}"> 打开显示页签

							return addTab($(this)); // </c:if>
							
						});
						function conssss(obj){
							if(obj.find("ul").is(":visible")==false){//
								
								obj.children("ul").slideDown(200);
								obj.siblings().filter(".active").children("ul").slideUp(200);
								obj.siblings().filter(".active").find("span").last().removeClass("open");
								obj.find("span[class=arrow]").addClass("open");
								obj.addClass("active").siblings().removeClass("active");
								 
								 }else{
									 
									 obj.children("ul").slideUp(200);
									 obj.find("span").last().removeClass("open");
									  
									 }
							move_scroll(obj);
							
						}
						function move_scroll(obj){
							var o = (obj.offset());
					        diff = 200 - o.top;				        
					        if(diff>0)
					            $("#left").scrollTo("-="+Math.abs(diff),500);
					        else
					            $("#left").scrollTo("+="+Math.abs(diff),500);
					        $("#left").resize();
					        $("#left").getNiceScroll().resize();
					        
						}
					});
				}
				// 大小宽度调整
				wSizeWidth();
				
				return false;
			});
			// 初始化点击第一个一级菜单
			$("#menu a.menu:first span").click();
			// <c:if test="${tabmode eq '1'}"> 下拉菜单以选项卡方式打开			
			$("#header .navbar-inner .nav-collapse").remove();

			$("#myAudit").on("click", function(){
				return addTab($(this), true);
			});

			$("#userInfo .dropdown-menu a").mouseup(function(){
				return addTab($(this), true);
			});// </c:if>
			// 鼠标移动到边界自动弹出左侧菜单
			$("#openClose").mouseover(function(){
				if($(this).hasClass("open")){
					$(this).click();
                  }
				
			});
			$(".tooltips").toggle(function(){//菜单显示和影藏
		    	$("#openClose").click();
		    	$(this).removeClass("icon-indent-left").addClass("icon-indent-right");
		    },
		    function(){
		    	$("#openClose").click();
		    	$(this).removeClass("icon-indent-right").addClass("icon-indent-left");
		    })
			// 获取通知数目  <c:set var="oaNotifyRemindInterval" value="${fns:getConfig('oa.notify.remind.interval')}"/>
			/*function getNotifyNum(){
				$.get("${ctx}/oa/oaNotify/self/count?updateSession=0&t="+new Date().getTime(),function(data){
					var num = parseFloat(data);
					if (num > 0){
						$("#notifyNum,#notifyNum2").show().html("("+num+")");
					}else{
						$("#notifyNum,#notifyNum2").hide()
					}
				});
			}
			getNotifyNum();*/ //<c:if test="${oaNotifyRemindInterval ne '' && oaNotifyRemindInterval ne '0'}">
			//setInterval(getNotifyNum, ${oaNotifyRemindInterval}); //</c:if>
		});
		// <c:if test="${tabmode eq '1'}"> 添加一个页签
	   function addTab($this, refresh){
			$(".jericho_tab").show();
			$("#mainFrame").hide();
			$.fn.jerichoTab.addTab({
                tabFirer: $this,
                title: $this.text(),
                closeable: true,
                data: {
                    dataType: 'iframe',
                    dataLink: $this.attr('href')
                }
            }).loadData(refresh);
			return false;
		} // </c:if>
		
		
		 
	</script>
</head>
<body class="index_body">
	<div id="main">
		<div id="header" class="navbar navbar-fixed-top">
			<div class="navbar-inner">
				<div  class="tooltips icon-indent-left" data-placement="right" data-original-title="Toggle Navigation"></div>
				<ul id="userControl" class="nav pull-right">
					<li class="hide"><a href="${pageContext.request.contextPath}${fns:getFrontPath()}/index-${fnc:getCurrentSiteId()}.html" target="_blank" title="访问网站主页"><i class="icon-home"></i></a></li>
					<li id="themeSwitch" class="dropdown">
					<!-- 	<a class="dropdown-toggle" data-toggle="dropdown" href="#" title="主题切换"><i class="icon-th-large"></i></a> -->
						<ul class="dropdown-menu">
							<c:forEach items="${fns:getDictList('theme')}" var="dict"><li><a href="#" onclick="location='${pageContext.request.contextPath}/theme/${dict.value}?url='+location.href">${dict.label}</a></li></c:forEach>
							<li><a href="javascript:cookie('tabmode','${tabmode eq '1' ? '0' : '1'}');location=location.href">${tabmode eq '1' ? '关闭' : '开启'}页签模式</a></li>
						</ul>
						<!--[if lte IE 6]><script type="text/javascript">$('#themeSwitch').hide();</script><![endif]-->
					</li>
					<li id="userInfo" class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#" title="个人信息">您好, ${fns:getUser().name}&nbsp;<span id="notifyNum" class="label label-info hide"></span></a>
						<ul class="dropdown-menu">
							<li><a href="${ctx}/sys/user/info" target="mainFrame"><i class="icon-user"></i>&nbsp; 个人信息</a></li>
							<li><a href="${ctx}/sys/user/modifyPwd" target="mainFrame"><i class="icon-lock"></i>&nbsp;  修改密码</a></li>
							<li class="hide"><a href="${ctx}/oa/oaNotify/self" target="mainFrame"><i class="icon-bell"></i>&nbsp;  我的通知 <span id="notifyNum2" class="label label-info hide"></span></a></li>
						</ul>
					</li>
					<!-- 
					<li><a href="http://wfmg.yioryi.com/introduce/" target="_blank" title="跳转到民工工资保障法律服务系统">民工工资保障法律服务系统</a></li>
					 -->
					<li><a href="${ctx}/todo/task/todoTasks" id="myAudit" target="mainFrame">我的审批</a></li>
					<li><a href="${sessionScope.neizhuangUrl}" target="_blank"  title="跳转到内装ERP">内装ERP</a></li>
					<li><a href="${sessionScope.bbsUrl}" target="_blank"  title="跳转到BBS论坛">BBS论坛</a></li>
					<li><a href="${ctx}/logout" title="退出登录">退出</a></li>
					<li>&nbsp;</li>
				</ul>
				<%-- <c:if test="${cookie.theme.value eq 'cerulean'}">
					<div id="user" style="position:absolute;top:0;right:0;"></div>
					<div id="logo" style="background:url(${ctxStatic}/images/logo_bg.jpg) right repeat-x;width:100%;">
						<div style="background:url(${ctxStatic}/images/logo.jpg) left no-repeat;width:100%;height:70px;"></div>
					</div>
					<script type="text/javascript">
						$("#productName").hide();$("#user").html($("#userControl"));$("#header").prepend($("#user, #logo"));
					</script>
				</c:if> --%>
				<div class="nav-collapse">
					<ul id="menu" class="nav" style="*white-space:nowrap;float:none;">
						<c:set var="firstMenu" value="true"/>
						  <c:forEach items="${fns:getMenuList()}" var="menu" varStatus="idxStatus">
							<c:if test="${menu.parent.id eq '1'&&menu.isShow eq '1'}">
								<li class="menu ${not empty firstMenu && firstMenu ? ' active' : ''}">
									<c:if test="${empty menu.href}">
										<a class="menu" href="javascript:" data-href="${ctx}/sys/menu/tree?parentId=${menu.id}" data-id="${menu.id}"><span>${menu.name}</span></a>
									</c:if>
									<c:if test="${not empty menu.href}">
										<a class="menu" href="${fn:indexOf(menu.href, '://') eq -1 ? ctx : ''}${menu.href}" data-id="${menu.id}" target="mainFrame"><span>${menu.name}</span></a>
									</c:if>
								</li>
								<c:if test="${firstMenu}">
									<c:set var="firstMenuId" value="${menu.id}"/>
								</c:if>
								<c:set var="firstMenu" value="false"/>
							</c:if>
						</c:forEach>
						<%--
						<shiro:hasPermission name="cms:site:select">
						<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#">${fnc:getSite(fnc:getCurrentSiteId()).name}<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<c:forEach items="${fnc:getSiteList()}" var="site"><li><a href="${ctx}/cms/site/select?id=${site.id}&flag=1">${site.name}</a></li></c:forEach>
							</ul>
						</li>
						</shiro:hasPermission> --%>
					</ul>
				</div><!--/.nav-collapse -->
			</div>
	    </div>
	    
	    <div class="container-fluid">
			<div id="content" class="row-fluid">
			   <div class="brand">
				      <a id="productName" href="#">
				         <img src="${ctxStatic}/img/logo_white.png" >
				          ${fns:getConfig('productName')}
				      </a>
			   </div>
				<div id="left">
				   <div class="brand">
				      <a id="productName" href="#">
				         <img src="${ctxStatic}/img/logo_white.png" >
				          ${fns:getConfig('productName')}
				      </a>
				   </div>
				<%-- 
					<iframe id="menuFrame" name="menuFrame" src="" style="overflow:visible;" scrolling="yes" frameborder="no" width="100%" height="650"></iframe> --%>
				</div>
				<div class="clearfix"></div>
				 <div id="openClose" class="close">&nbsp;</div> 
				<div id="right">
					<iframe id="mainFrame" name="mainFrame" src="${ctx}/todo/task/todoTasks" style="overflow:visible;" scrolling="yes" frameborder="no" width="100%" height="650"></iframe>
				</div>
			</div>
		    <%-- <div id="footer" class="row-fluid">
	            Copyright &copy; 2012-${fns:getConfig('copyrightYear')} ${fns:getConfig('productName')} - Powered By <a href="http://jeesite.com" target="_blank">JeeSite</a> ${fns:getConfig('version')}
			</div> --%>
		</div>
	</div>
	<script type="text/javascript"> 
		var leftWidth = 180; // 左侧窗口大小
		var tabTitleHeight = 33; // 页签的高度
		var htmlObj = $("html"), mainObj = $("#main");
		var headerObj = $("#header"), footerObj = $("#footer");
		var frameObj = $("#left, #right, #right iframe,#content");
		var change_frameObj=$("#left, #openClose");
		function wSize(){
			var minHeight = 500, minWidth = 980;
			var strs = getWindowSize().toString().split(",");
			
			htmlObj.css({"overflow-x":strs[1] < minWidth ? "auto" : "hidden", "overflow-y":strs[0] < minHeight ? "auto" : "hidden"});
			mainObj.css("width",strs[1] < minWidth ? minWidth - 10 : "auto");
			frameObj.height((strs[0] < minHeight ? minHeight : strs[0]) - headerObj.height());
			change_frameObj.height((strs[0]<minHeight?minHeight: strs[0]) - footerObj.height())
			$("#openClose").height($("#openClose").height() - 5);// <c:if test="${tabmode eq '1'}"> 
			 // </c:if>
			
		    $("#right").css("margin-left",leftWidth+"px");
			wSizeWidth();
			$("#left").niceScroll({styler:"fb",cursorcolor:"#A2D4ED", cursorwidth: '5', cursorborderradius: '3px',  cursorborder: '' , railpadding: { top: 0, right: 2, left: 0, bottom: 0 }});
			
			
        		}
		function wSizeWidth(){
			$("#jerichotab").height($("#right").height()-10);
			$("#jerichotab tab_content,#jerichotab_contentholder").height($("#right").height()-10-$("#jerichotab .tab_pages").height()-10);
			$("#right iframe").height($("#right").height()-20);
			if (!$("#openClose").is(":hidden")){
				var leftWidth = ($("#left").width() < 0 ? 0 : $("#left").width());
				$("#right,#jerichotab,#jerichotab .tabs,#jerichotab .tabs ul").width($("#content").width()- leftWidth );
				
			}else{
				$("#right").width("100%");
			}
		}// <c:if test="${tabmode eq '1'}"> 
		function openCloseClickCallBack(b){
			$.fn.jerichoTab.resize();
		} // </c:if>
		$(function(){$(".nav.pull-right #myAudit").click()
    		$(window).load(function() {
    			$(".list-li-a").children(":first").find("a").off('click');
			});
			$(document).on('click',".list-li-a li:first-child a",function(){
				$(".nav.pull-right #myAudit").click()
				$("#left").find("a").removeClass("active");
				$(this).addClass("active");
			});
		})
		</script>
        <script src="${ctxStatic}/common/wsize.js" type="text/javascript"></script>
</body>

</html>
