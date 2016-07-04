<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>单表管理</title>
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
<div class="list-content" >
	    <div class="nav-operate" >
	        <ul class="operationg-new" >
	          <li ><a href="${ctx}/test/testData/" class="active"><span class="glyphicon glyphicon-list"></span>单表列表</a></li>
	          <shiro:hasPermission name="test:testData:edit"><li><a href="${ctx}/test/testData/form"><span class="glyphicon glyphicon-plus"></span>单表添加</a></li></shiro:hasPermission>
	        </ul>
	       
	        <form:form id="searchForm" modelAttribute="testData" action="${ctx}/test/testData/" method="post" class="breadcrumb form-search">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
				 <ul class="search">
		            <li>
		               <label>根据：</label>
		               <select class="input-small">
						  <option>归属用户&nbsp;&nbsp;</option>
						  <option>归属部门</option>
						  <option>归属区域</option>
						  <option>名称&nbsp;&nbsp;</option>
						  <option>名称</option>
						  <option>加入日期</option>
						</select>
		            </li>
		            <li class="input">
			               <i class="input-show"><sys:treeselect id="user" name="user.id" value="${testData.user.id}" labelName="user.name" labelValue="${testData.user.name}"
								title="用户" url="/sys/office/treeData?type=3" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/></i>
			               <i><sys:treeselect id="office" name="office.id" value="${testData.office.id}" labelName="office.name" labelValue="${testData.office.name}"
								title="部门" url="/sys/office/treeData?type=2" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/></i>
							<i><sys:treeselect id="area" name="area.id" value="${testData.area.id}" labelName="area.name" labelValue="${testData.area.name}"
								title="区域" url="/sys/area/treeData" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/></i>
			               <i><form:input path="name" htmlEscape="false" maxlength="100" class="input-medium"/></i>
							<i><form:radiobuttons path="sex" items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false"/></i>
							<i>	<input name="beginInDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
								value="<fmt:formatDate value="${testData.beginInDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
							<input name="endInDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
								value="<fmt:formatDate value="${testData.endInDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/></i>
			        </li>
		            <li><button class="search-btn" id="btnSubmit"  type="submit"  onclick="return page();">筛选</button></li>
		            <li><button class="search-btn icon" id="advanced-search-btn"  type="button"  >高级筛选<i></i></button></li>
		            <li><button class="search-btn" id="table-set"  type="button"  >表格显示</button></li>
		          </ul>
		          <div class="clearfix"></div>
			</form:form>
			<div class="clear"></div>
			   <div class="advanced-search-form">
			      <form:form id="searchForm" modelAttribute="testData" action="${ctx}/test/testData/" method="post" class="breadcrumb form-search">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<ul class="modal-body">
						<li><span>归属用户：</span><label>
							<sys:treeselect id="user" name="user.id" value="${testData.user.id}" labelName="user.name" labelValue="${testData.user.name}"
								title="用户" url="/sys/office/treeData?type=3" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
						</label>
						</li>
						<li><span>归属部门：</span><label>
							<sys:treeselect id="office" name="office.id" value="${testData.office.id}" labelName="office.name" labelValue="${testData.office.name}"
								title="部门" url="/sys/office/treeData?type=2" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
						    </label>
						</li>
						<li><span>归属区域：</span><label>
							<sys:treeselect id="area" name="area.id" value="${testData.area.id}" labelName="area.name" labelValue="${testData.area.name}"
								title="区域" url="/sys/area/treeData" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
						    </label>
						</li>
						<li><span>名称：</span><label>
							<form:input path="name" htmlEscape="false" maxlength="100" class="input-medium"/></label>
						</li>
						<li><span>性别：</span><label>
							<form:radiobuttons path="sex" items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						   </label>
						</li>
						<li><span>加入日期：</span><label>
							<input name="beginInDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
								value="<fmt:formatDate value="${testData.beginInDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
							<input name="endInDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
								value="<fmt:formatDate value="${testData.endInDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
								</label>
						</li>
						<li class="clear clearfix"></li>
						<li class="fr"><input id="btnSubmit" class="btn btn-primary" type="submit" value="提交删选"/></li>
						<li class="clearfix"></li>
					</ul>
					<div class="modal-footer" style="display: block;"></div>
				</form:form>
				 
			    </div>
			    <div class="clear"></div>
			     <ul class="table-set-container">
			        <li class="tit">选中隐藏:</li> 
			     </ul>
        </div>

	
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>归属用户</th>
				<th>归属部门</th>
				<th>归属区域</th>
				<th>名称</th>
				<th>性别</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="test:testData:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="testData">
			<tr>
				<td><a href="${ctx}/test/testData/form?id=${testData.id}">
					${testData.user.name}
				</a></td>
				<td>
					${testData.office.name}
				</td>
				<td>
					${testData.area.name}
				</td>
				<td>
					${testData.name}
				</td>
				<td>
					${fns:getDictLabel(testData.sex, 'sex', '')}
				</td>
				<td>
					<fmt:formatDate value="${testData.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${testData.remarks}
				</td>
				<shiro:hasPermission name="test:testData:edit"><td>
    				<a href="${ctx}/test/testData/form?id=${testData.id}">修改</a>
					<a href="${ctx}/test/testData/delete?id=${testData.id}" onclick="return confirmx('确认要删除该单表吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
	<div class="pagination">${page}</div>

</body>
</html>