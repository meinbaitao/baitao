<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>填写项目人员信息</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/modules/project/scripts/project.js" type="text/javascript"></script>
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
	        <form:form id="searchForm" modelAttribute="project" action="${ctx}/project/projectinfo?type=6" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        <ul class="search">
		            <li>
		               <form:input path="name" htmlEscape="false" maxlength="200" class="input-medium" placeholder="关键字"/>
		            </li>
		            <li>
		            	<input id="searchProject" type="submit" name="查询" value="查询" class="search-btn"/>
		            </li>
		        </ul>
		       <div class="clearfix"></div>
		     </form:form>
		     <div class="clear"></div>
	     </div>
	  <sys:message content="${message}"/>
	  <table id="contentTable" class="table table-striped table-bordered table-condensed resize table-eidt width-75">
			<thead>
			   <tr>
			    	<th class="all-check" >
					    <input type="checkbox" id="all-check">
					    <label for="all-check">选择</label>
					</th>
					<th>项目名称</th>
					<th>业务板块</th>
					<th>苑区</th>
					<th>项目负责人</th>
					<th>运营主管</th>
					<th>区域经理</th>
					<th>运营经理</th>
					<th>运营专员</th>
					<th>材料员</th>
					<th>施工员</th>
					<th>行政专员</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${page.list}" var="project" varStatus="1">
					<tr>
						<td class="check">
							<input type="checkbox" id="${project.id}" name="chkproject">
						</td>
						<td>
							<a href="${ctx}/project/view?id=${project.id}">
								${project.name}
							</a>
						</td>
						<td>${project.businessLine}</td>
						<td>${project.location}</td>
						<td>${project.showProjectManagerBid}</td>
						<td>${project.showCoordinatorLeaderBid}</td>
						<td>${project.showRegionalManagerBid}</td>
						<td>${project.showPcDirectorBid}</td>
						<td>${project.showOperationSpecialistBid}</td>
						<td>${project.showMaterialStaffBid}</td>
						<td>${project.showConstructStaffBid}</td>
						<td>${project.showAdminstaffbid}</td>
					 </tr>
			 	 </c:forEach>
			</tbody>
		</table>
		<shiro:hasAnyRoles name="${fns:getWhitelistsList('txxmryxx')}">
		 <div class="div_right">
	   <form:form id="addprojectForm" modelAttribute="project" action="${ctx}/project/updateProjectPersonnel" method="post" class="form-horizontal">
	       <ul class="ul-addprojectForm">
	            <li>                          
	             <span class="tab-name">项目负责人：</span>
	             <label>
	              <input type="hidden" name="id" id="projectId" value=""/>
	             	<form:select name="projectManagerBid" id="projectManagerBid" path="projectManagerBid" class="input-medium">
	             		<option id="-1"></option>
					 	<c:forEach items="${fns:selByCondition('xmfzr')}" var="obj" varStatus="idxStatus">
							 <option value="${fns:escapeHtml(obj.userID)}" <c:if test="${obj.userID==project.projectManagerBid}">selected="selected"</c:if>>${fns:escapeHtml(obj.userName)}</option>
					 	</c:forEach>
					 </form:select>
	             </label>
	          </li>
	           <li>
	             <span class="tab-name">运营主管：</span>
	             <label>
	             	 <form:select id="coordinatorLeaderBid" path="coordinatorLeaderBid" class="input-medium" tabindex="-1">
	             	 	<option id="-1"></option>
					 	<c:forEach items="${fns:selByCondition('yyzg')}" var="obj" varStatus="idxStatus">
							 <option value="${fns:escapeHtml(obj.userID)}" <c:if test="${obj.userID==project.coordinatorLeaderBid}">selected="selected"</c:if>>${fns:escapeHtml(obj.userName)}</option>
					 	</c:forEach>
					 </form:select>
	             </label>
	          </li>
	           <li>
	             <span class="tab-name">区域经理：</span>
	             <label>
	                  <form:select id="regionalManagerBid" path="regionalManagerBid" class="input-medium" tabindex="-1">
	                  	<option id="-1"></option>
					 	<c:forEach items="${fns:selByCondition('qyjl')}" var="obj" varStatus="idxStatus">
							 <option value="${fns:escapeHtml(obj.userID)}" <c:if test="${obj.userID==project.regionalManagerBid}">selected="selected"</c:if>>${fns:escapeHtml(obj.userName)}</option>
					 	</c:forEach>
					 </form:select>
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">运营经理：</span>
	             <label>
	             	 <form:select id="pcDirectorBid" path="pcDirectorBid" class="input-medium" tabindex="-1">
	             	 	<option id="-1"></option>
					 	<c:forEach items="${fns:selByCondition('yyjl')}" var="obj" varStatus="idxStatus">
							 <option value="${fns:escapeHtml(obj.userID)}" <c:if test="${obj.userID==project.pcDirectorBid}">selected="selected"</c:if>>${fns:escapeHtml(obj.userName)}</option>
					 	</c:forEach>
					 </form:select>
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">运营专员：</span>
	             <label>
	             	 <form:select id="operationSpecialistBid" path="operationSpecialistBid" class="input-medium" tabindex="-1">
	             	 	<option id="-1"></option>
					 	<c:forEach items="${fns:selByCondition('yyzy')}" var="obj" varStatus="idxStatus">
							 <option value="${fns:escapeHtml(obj.userID)}" <c:if test="${obj.userID==project.operationSpecialistBid}">selected="selected"</c:if>>${fns:escapeHtml(obj.userName)}</option>
					 	</c:forEach>
					 </form:select>
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">材料员：</span>
	             <label>
	             	<form:select id="materialStaffBid" path="materialStaffBid" class="input-medium" tabindex="-1">
	             		<option id="-1"></option>
					 	<c:forEach items="${fns:selByCondition('cly')}" var="obj" varStatus="idxStatus">
							 <option value="${fns:escapeHtml(obj.userID)}" <c:if test="${obj.userID==project.materialStaffBid}">selected="selected"</c:if>>${fns:escapeHtml(obj.userName)}</option>
					 	</c:forEach>
					 </form:select>
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">施工员：</span>
	             <label>
	                 <form:select id="constructStaffBid" path="constructStaffBid" class="input-medium" tabindex="-1">
	                 	<option id="-1"></option>
					 	<c:forEach items="${fns:selByCondition('sgy')}" var="obj" varStatus="idxStatus">
							 <option value="${fns:escapeHtml(obj.userID)}" <c:if test="${obj.userID==project.constructStaffBid}">selected="selected"</c:if>>${fns:escapeHtml(obj.userName)}</option>
					 	</c:forEach>
					 </form:select>
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">行政专员：</span>
	             <label>
	             	 <form:select id="adminstaffbid" path="adminstaffbid" class="input-medium" tabindex="-1">
	             	 	<option id="-1"></option>
					 	<c:forEach items="${fns:selByCondition('xzzy')}" var="obj" varStatus="idxStatus">
							 <option value="${fns:escapeHtml(obj.userID)}" <c:if test="${obj.userID==project.adminstaffbid}">selected="selected"</c:if>>${fns:escapeHtml(obj.userName)}</option>
					 	</c:forEach>
					 </form:select>
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">&nbsp;&nbsp;&nbsp;</span>
	             <label>
	                 <input type="button" name="submitProject" id="submitProject" class="btn btn-primary" value="保存"/>
	             </label>
	          </li>
	       </ul>
	       </form:form>
	   </div>
	   </shiro:hasAnyRoles>
	   <div class="clear"></div>
	</div>
<div class="pagination">${page}</div>

</body>
</html>