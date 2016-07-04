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
<div class="list-content" >
	    <div class="nav-operate" >
	    <form:form id="searchForm" modelAttribute="user" action="${ctx}/sys/user/list" method="post" class="form-search ">
		    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		    <form:input id="userofficeid" path="office.id" name="office.id" type="hidden" value="${user.office.id}"/>
		    <sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
	        <ul class="operationg-new" >
	          <li ><a href="${ctx}/sys/user/list" class="active"><span class="glyphicon glyphicon-list"></span>用户列表</a></li>
	           <li class="add_user">
	              <a href="${ctx}/sys/user/form"><span class="glyphicon glyphicon-plus"></span>用户添加</a>
	           </li>
	        </ul>
	        <ul class="search">
	            <li>
	               <label>根据：</label>
	               <select class="input-small">
					  <option>登录名&nbsp;&nbsp;</option>
					  <option>姓&nbsp;&nbsp;名</option>
					  <option>归属公司</option>
					  <option>归属部门</option>
					</select>
	            </li>
	            <li class="input">
		              <i > <form:input path="loginName" htmlEscape="false" maxlength="50" class="input-small"/></i>
		              <i>  <form:input path="name" htmlEscape="false" maxlength="50" class="input-small"/></i>
		               <i> <sys:treeselect id="company" name="company.id" value="${user.company.id}" labelName="company.name" labelValue="${user.company.name}" 
				title="公司" url="/sys/office/treeData?type=1" cssClass="input-small" allowClear="true"/></i>
		               <i> <sys:treeselect id="office" name="office.id" value="${user.office.id}" labelName="office.name" labelValue="${user.office.name}" 
				title="部门" url="/sys/office/treeData?type=2" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/></i>
		        </li>
	            <li>
	              <button class="search-btn" id="btnSubmit"  type="submit"  onclick="return page();">筛选</button>
	            </li>
	            <li>
	              <button class="search-btn icon" id="advanced-search-btn"  type="button"  >高级筛选<i></i></button>
	            </li>
	            <li>
	              <button class="search-btn" id="table-set"  type="button"  >表格显示</button>
	            </li>
	            
	        </ul>
	    <li class="clearfix"></li>
	    </form:form>
	    
	    <div class="clear"></div>
	    <div class="advanced-search-form">
		     <form:form id="searchForm" modelAttribute="user" action="${ctx}/sys/user/list" method="post" class="form-search ">
			    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
			    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		    	<form:input id="userofficeid" path="office.id" name="office.id" type="hidden" value="${user.office.id}"/>
		
		        <ul class="modal-body">
		           <li>
		               <span>登录名：</span>
		               <label> <form:input path="loginName" htmlEscape="false" maxlength="50" class="input-medium"/></label>
		           </li>
		           <li>
		               <span>姓&nbsp;&nbsp;名：</span>
		               <label><form:input path="name" htmlEscape="false" maxlength="50" class="input-medium"/></label>
		           </li>
		           <li>
		               <span>归属公司：</span>
		               <label><sys:treeselect id="company" name="company.id" value="${user.company.id}" labelName="company.name" labelValue="${user.company.name}" 
						title="公司" url="/sys/office/treeData?type=1" cssClass="input-medium" allowClear="true"/></label>
		           </li>
		           <li>
		               <span>归属部门：</span>
		               <label><sys:treeselect id="office" name="office.id" value="${user.office.id}" labelName="office.name" labelValue="${user.office.name}" 
						title="部门" url="/sys/office/treeData?type=2" cssClass="input-medium" allowClear="true" notAllowSelectParent="true"/></label>
		           </li>    
		           <li class="clear clearfix"></li>
		           <li class="fr">
		               <button class="btn btn-primary" id="btnSubmit"  type="submit"  onclick="return page();">提交筛选</button>
		           </li>          
			      </ul>
			      <div class="modal-footer">
			       
			      </div>
	          </form:form>
	     </div>
	     <div class="clear"></div>
	     <ul class="table-set-container">
	        <li class="tit">选中隐藏:</li> 
	     </ul>
	    </div>
	    
	    <sys:message content="${message}"/>
		<table id="contentTable" class="table table-striped table-bordered table-condensed resize">
			<thead>
			   <tr>
			      <th>归属公司</th>
			      <th>归属部门</th>
			      <th class="sort-column login_name">登录名</th>
			      <th class="sort-column name">姓名</th>
			      <th class="sort-column phone" width:100px;">电话</th>
			      <th width="100px;">手机</th>
			      <%--<th>角色</th> --%>
			      <shiro:hasPermission name="sys:user:edit"><th >操作</th></shiro:hasPermission>
			   </tr>
			</thead>
			<tbody>
			<c:forEach items="${page.list}" var="user">
				<tr>
					<td>${user.company.name}</td>
					<td>${user.office.name}</td>
					<td><a href="${ctx}/sys/user/form?id=${user.id}">${user.loginName}</a></td>
					<td>${user.name}</td>
					<td>${user.phone}</td>
					<td>${user.mobile}</td><%--
					<td>${user.roleNames}</td> --%>
					<shiro:hasPermission name="sys:user:edit"><td>
		   				<a href="${ctx}/sys/user/form?id=${user.id}">修改</a>
						<a href="${ctx}/sys/user/delete?id=${user.id}" onclick="return confirmx('确认要删除该用户吗？', this.href)">删除</a>
					</td></shiro:hasPermission>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
   

	<div class="pagination">${page}</div>

</body>

</html>