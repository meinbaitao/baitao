<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>物料信息管理</title>
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
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/material/material/proc/list?type=${materialProc.type}">石材加工项列表</a></li>
		<shiro:hasPermission name="user"><li><a href="${ctx}/material/material/proc/form?type=${materialProc.type}">石材加工项添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="materialProc" action="${ctx}/material/material/proc/?type=${materialProc.type}" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<%-- <li><label>材料类别：</label>
				<form:select id="type" path="type" class="input-small"><form:option value="" label=""/><form:options items="${fns:getDictList('jcsj_gfc')}" itemValue="value" itemLabel="label" htmlEscape="false"/></form:select>
			</li> --%>
			<!-- <li>
				<input type="file" name="fileName"><input type="submit" value="上传">
			</li> -->
			<li><label>名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th><input type="checkbox" id="all_cBox"></th>
				<th>名称及编号</th>
				<th>规格</th>
				<th>单位</th>
				<c:forEach items="${fns:getDictList('jcsj_scjgxbzjk')}" var="area">
					<th width="80">${area.label}</th>
				</c:forEach>
				<th>税率</th>
				<th>发票类型</th>
				<shiro:hasPermission name="user"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="materialProc">
			<tr>
				<td>
					<input type="checkbox" name="cBox">
				</td>
				<td>
					${materialProc.seriesnumber}、${materialProc.name}
				</td>
				<td>
					${materialProc.procspec}
				</td>
				<td>
					${materialProc.unit}
				</td>
				
				<c:forEach items="${fns:getDictList('jcsj_scjgxbzjk')}" var="area" varStatus="i">
					<td>
						${fn:split(materialProc.mpp.prices, ',')[i.index]}
					</td>
				</c:forEach>
				
				<td>
					${materialProc.taxrate}
				</td>
				<td>
					${materialProc.invoicetype}
				</td>
				
				<shiro:hasPermission name="user"><td>
    				<a href="${ctx}/material/material/proc/form?id=${materialProc.materialprocId}">修改</a>
					<a href="${ctx}/material/material/proc/delete?id=${materialProc.materialprocId}&type=${materialProc.type}" onclick="return confirmx('确认要删除该加工项信息吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>