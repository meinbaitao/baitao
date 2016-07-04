<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>事故管理管理</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/modules/accident/scripts/accident.js?tsf=${jsVersion}" type="text/javascript"></script>
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
				<li>
					<input id="addAccident" class="btn btn-primary" type="button" value="添加">
					<input id="deleteAccident" class="btn btn-primary" type="button" value="删除">
					<input id="accidentType" value="${accidentManage.type }" type="hidden">
				</li>
		    </ul>
	        <form:form id="searchForm" modelAttribute="accidentManage" action="${ctx}/accident/accidentManage/list" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<form:hidden path="type" />
		        <ul class="search">
		            <li>
		               <form:input path="accientNo" htmlEscape="false" maxlength="200" class="input-medium" placeholder="单据编号"/>
		            </li>
		            <li>
		            	<input id="searchAccident" type="submit" name="查询" value="查询" class="search-btn"/>
		            </li>
		        </ul>
		        <div class="clearfix"></div>
	        </form:form>
		     <div class="clear"></div>
		</div>
	  <sys:message content="${message}"/>
	  <table id="contentTable" class="table table-striped table-bordered table-condensed resize table-eidt">
			<thead>
			   <tr>
			    	<th class="all-check" >
					    <input type="checkbox" id="all-check">
					    <label for="all-check">选择</label>
					</th>
					<th>事故类型</th>
					<th>是否影响施工</th>
					<th>创建人</th>
					<th>创建时间</th>
					<th>备注</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
		    <tbody>
			 <c:forEach items="${page.list}" var="items" varStatus="st">
	              <tr>
		               <td>
		                <input type="checkbox" name="checkdbox" id="${items.id}">
	               	   </td>
		               <td>
		               		<c:choose>
								<c:when test="${items.type eq '1'}">
									石材收货事故
								</c:when>
								<c:when test="${items.type eq '2'}">
									钢辅材收货事故
								</c:when>
								<c:when test="${items.type eq '3'}">
									石材销售事故
								</c:when>
								<c:when test="${items.type eq '4'}">
									钢辅材销售事故
								</c:when>
							</c:choose> 
		               </td>
		               <td>
		               		<c:choose>
								<c:when test="${items.isConstruct eq '0'}">
									否
								</c:when>
								<c:when test="${items.isConstruct eq '1'}">
									是
								</c:when>
							</c:choose> 
		               </td>
		               <td>${items.createUser }</td>
		               <td><fmt:formatDate value="${items.createDate }" type="both"/></td>
		               <td>${items.remarks }</td>
		               <td>
							<c:choose>
								<c:when test="${items.workflowstatus eq '1'}">
									待审核
								</c:when>
								<c:when test="${items.workflowstatus eq '4'}">
									已完成
								</c:when>
								<c:otherwise>待提交</c:otherwise>
							</c:choose> 
					   </td>
					   <td><a href="${ctx}/accident/accidentManage/edit?id=${items.id}">查看明细</a></td>
	             </tr>
            </c:forEach>  
		    </tbody>
	  </table>
	</div>
<div class="pagination">${page}</div>
</body>
</html>