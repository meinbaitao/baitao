<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>加工厂人员管理</title>
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
		$(function(){
			//删除
			$("#btnDelete").click(function(){
				var orderType = $("#orderType").val();
				var vCheckd =[]; 
				$('input[name="checkdbox"]:checked').each(function(){ 
					vCheckd.push($(this).attr("id")); 
				}); 
				if(vCheckd.length==0){
					//alert("请先勾选删除项！"); 
					window.alertx("请先勾选删除项！"); 
					return;
				}
				window.confirmx("确定要删除？",function(){
					var inputForm = $('#deleteForm');
					inputForm.attr('action',startUp.getRootPath()+"/a/factory/manufPerson/delete?vCheckd="+vCheckd);
					inputForm.submit();				
				});
			});
		});
	</script>
</head>
<body>
<div class="list-content" >
	    <div class="nav-operate" >
	        <ul class="operationg-new" >
	         <li><a href="${ctx}/factory/manufPerson/form">
	         		<input class="btn btn-primary" type="button" value="添加"></a></li>
	         <li>
				<form id="deleteForm" action="${ctx}/factory/manufPerson/delete" method="post">
					<input id="btnDelete" class="btn btn-primary" type="button" value="删除">
				</form>
			 </li>
	        </ul>
	       	<form:form id="searchForm" modelAttribute="manufPerson" action="${ctx}/factory/manufPerson/" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<ul class="search">
					<li><select class="input-small">
							<option>加工厂</option>
							<option>区域</option>
							<option>生产经理</option>
							<option>跟单员</option>
					</select></li>
					<li class="input">
						<i> <form:input path="factory"
								htmlEscape="false" maxlength="50" class="input-small" /></i> 
						<i> <form:input path="area"
								htmlEscape="false" maxlength="50" class="input-small" /></i> 
						<i> <form:input path="manager"
								htmlEscape="false" maxlength="50" class="input-small" /></i> 
						<i> <form:input path="tracer"
								htmlEscape="false" maxlength="50" class="input-small" /></i> 
					<li>
						<button class="search-btn" id="btnSubmit" type="submit">查询</button>
					</li>
				</ul>
			</form:form>
	     </div>

	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th class="all-check">
		         <input type="checkbox" id="all-check" >
		         <label for="all-check">全选</label>
	   		    </th>
				<th>加工厂</th>
				<th>区域</th>
				<th>经理</th>
				<th>负责人</th>
				<th>负责人联系方式</th>
				<th>跟单员</th>
				<th>跟单员联系方式</th>
				<th>备注信息</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="manufPerson">
			<tr>
				<td><input type="checkbox" name="checkdbox" id="${manufPerson.id}"></td>
				<td><a href="${ctx}/factory/manufPerson/form?id=${manufPerson.id}">
					${manufPerson.factory}
				</a></td>
				<td>
					${manufPerson.area}
				</td>
				<td>
					${manufPerson.manager}
				</td>
				<td>
					${manufPerson.principal}
				</td>
				<td>
					${manufPerson.principalTel}
				</td>
				<td>
					${manufPerson.tracer}
				</td>
				<td>
					${manufPerson.tracerTel}
				</td>
				<td>
					${manufPerson.remarks}
				</td>
				<td>
    				<a href="${ctx}/factory/manufPerson/form?id=${manufPerson.id}">修改</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
	<div class="pagination">${page}</div>

</body>
</html>