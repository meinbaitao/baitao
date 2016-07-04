<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>事故比例管理</title>
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
					inputForm.attr('action',startUp.getRootPath()+"/a/accident/accidentRatio/delete?vCheckd="+vCheckd);
					inputForm.submit();				
				});
			});
		});
	</script>
</head>
<body>
	<div class="list-content">
	 <div class="nav-operate" >
	        <ul class="operationg-new" >
	         <li><a href="${ctx}/accident/accidentRatio/form"><input class="btn btn-primary" type="button" value="添加"></a></li>
	         <li>
				<form id="deleteForm" action="${ctx}/material/material/delete" method="post">
					<input id="btnDelete" class="btn btn-primary" type="button" value="删除">
				</form>
			 </li>
	        </ul>
	       	<form:form id="searchForm" modelAttribute="accidentRatio" action="${ctx}/accident/accidentRatio/list" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<!-- 
				<ul class="search">
					<li><span>部门名称：</span>
						<label><form:input path="name" htmlEscape="false" maxlength="100" class="input-medium"/></label>
					</li>
					<li ><input id="btnSubmit" class="search-btn" type="submit" value="查询"/></li>
					<li class="clearfix"></li>
				</ul>
				 -->
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
				<th>事故类型</th>
				<th>部门名称</th>
				<th>比例</th>
				<th>所属事故</th>
				<th>审核流程</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="accratio">
			<tr>
				<td><input type="checkbox" name="checkdbox" id="${accratio.id}"></td>
				<td>
					${accratio.showtype}
				</td>
				<td>
					${accratio.name }
				</td>
				<td>
					${accratio.ratio}
				</td>
				<td>
					<c:choose>
						<c:when test="${accratio.accidentType eq '0'}">
							收货事故
						</c:when>
						<c:when test="${accratio.accidentType eq '1'}">
							销售事故
						</c:when>
					</c:choose>  
				</td>	
				<td>
					<c:choose>
						<c:when test="${accratio.reserved eq '0'}">
							设计审核流程
						</c:when>
						<c:when test="${accratio.reserved eq '1'}">
							供应商审核流程
						</c:when>
					</c:choose>  
				</td>	
				<td>
    				<a href="${ctx}/accident/accidentRatio/form?id=${accratio.id}">修改</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	<div class="pagination">${page}</div>
</body>
</html>