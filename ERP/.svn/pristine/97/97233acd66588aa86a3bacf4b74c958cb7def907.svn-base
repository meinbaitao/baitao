<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnExport").click(function(){
				top.$.jBox.confirm("确认要导出用户数据吗？","系统提示",function(v,h,f){
					if(v=="ok"){
						$("#searchForm").attr("action","${ctx}/sys/user/export");
						$("#searchForm").submit();
					}
				},{buttonsFocus:1});
				top.$('.jbox-body .jbox-icon').css('top','55px');
			});
			$("#btnImport").click(function(){
				$.jBox($("#importBox").html(), {title:"导入数据", buttons:{"关闭":true}, 
					bottomText:"导入文件不能超过5M，仅允许导入“xls”或“xlsx”格式文件！"});
			});
		});
		function page(n,s){
			if(n) $("#pageNo").val(n);
			if(s) $("#pageSize").val(s);
			$("#searchForm").attr("action","${ctx}/sys/user/list");
			$("#searchForm").submit();
	    	return false;
	    }
	</script>
</head>
<body>
<section id="userList_section">
    <header>
        <nav class="left">
            <a href="#" data-icon="previous" data-target="back">返回</a>
        </nav>
        <h1 class="title">用户列表</h1>
    </header>
    <article class="active">
       <div class="indented" style="transition: transform 0ms; -webkit-transition: transform 0ms; transform-origin: 0px 0px 0px; transform: translate(0px, 0px) translateZ(0px);">
            <form class="input-group">
                <div class="input-row">
                    <label>姓名</label>
                    <input type="text" placeholder="张三">
                </div>
                 <div class="input-row">
                     <label>归属公司：</label>
                     <input type="">
                 </div>
			
            </form>
			
        </div>
		
		<c:forEach items="${page.list}" var="user">
		   <div class="formBox input-group"> 
		       <p><span class="span1">归属公司:</span><span class="span2">${user.company.name}</span></p>
		       <p><span class="span1">归属部门:</span><span class="span2">${user.office.name}</span></p>
		       <p><span class="span1">登录名:</span><span class="span2"> <a href="${ctx}/sys/user/form?id=${user.id}">${user.loginName}</a></span></p>
		       <p><span class="span1">姓名:</span><span class="span2">${user.name}</span></p>
		       <p><span class="span1">电话:</span><span class="span2">${user.phone}</span></p>
		       <p><span class="span1">手机:</span><span class="span2">${user.mobile}</span></p>
		   </div>
			
		</c:forEach>
	<div class="pagination">${page}</div>	
    </article>
</section>
</body>
</html>