<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>成本管理</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/modules/project/scripts/project.js?tsf=${jsVersion}" type="text/javascript"></script>
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
	        <form:form id="searchForm" modelAttribute="project" action="${ctx}/project/projectinfo?type=2" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        <ul class="operationg-new">
		        	状态：
		        	<select name="statusFlag" id="statusFlag" class="input80">
					 	<option value="1">全部</option>
					 	<option value="0" <c:if test="${statusFlag eq '0' }"> selected="selected" </c:if>>未填写</option>
					</select>
		        </ul>
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
					<th>成本负责人</th>
					<th>成本组长</th>
					<th>成本主管</th>
					<th>状态</th>
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
						<td>${project.costManagerBid}</td>
						<td>${project.costOfficerBid}</td>
						<td>${project.costLeaderBid}</td>
						<td>${not empty project.costLeaderBid && not empty project.costManagerBid && not empty project.costOfficerBid?'已填写':'未填写'}</td>
					 </tr>
			 	 </c:forEach>
			</tbody>
		</table>
		<shiro:hasAnyRoles name="${fns:getWhitelistsList('txcbxx')}">
		 <div class="div_right">
	   <form:form id="addprojectForm" modelAttribute="project" action="${ctx}/project/addcost" method="post" class="form-horizontal">
	       <ul class="form-horizontal-ul">
           <li>
             <span class="tab-name">成本负责人：</span>
             <label>
             	 <input type="hidden" name="id" id="projectId" value=""/>
                 <select name="costManagerBid" phone="costManagerMobile" id="costManagerBid" class="input-medium" tabindex="-1">
				 	<option value=""></option>
				 	<c:forEach items="${fns:selByCondition('cbxmfzr')}" var="obj" varStatus="idxStatus">
						 <option value="${fns:escapeHtml(obj.userID)},${fns:escapeHtml(obj.phone)}" >${fns:escapeHtml(obj.userName)}</option>
				 	</c:forEach>
				 </select>
             </label>
          </li>
           <li>
             <span class="tab-name">联系方式：</span>
             <label>
                 <input type="text" class="input-medium" value="" id="costManagerMobile" name="costManagerMobile"/>
             </label>
          </li>
           <li>
             <span class="tab-name">成本组长：</span>
             <label>
                 <select name="costOfficerBid" phone="costOfficerMobile" id="costOfficerBid" class="input-medium" tabindex="-1">
				 	<option value=""></option>
				 	<c:forEach items="${fns:selByCondition('cbzz')}" var="obj" varStatus="idxStatus">
						 <option value="${fns:escapeHtml(obj.userID)},${fns:escapeHtml(obj.phone)}" >${fns:escapeHtml(obj.userName)}</option>
				 	</c:forEach>
				 </select>
             </label>
          </li>
           <li>
             <span class="tab-name">联系方式：</span>
             <label>
                 <input type="text" class="input-medium" value="" name="costOfficerMobile" id="costOfficerMobile"/>
             </label>
          </li>
          <li>
             <span class="tab-name">成本主管：</span>
             <label>
             	 <select name="costLeaderBid" id="costLeaderBid" phone="costLeaderMobile" class="input-medium" tabindex="-1">
				 	<option value=""></option>
				 	<c:forEach items="${fns:selByCondition('cbzg')}" var="obj" varStatus="idxStatus">
						 <option value="${fns:escapeHtml(obj.userID)},${fns:escapeHtml(obj.phone)}" >${fns:escapeHtml(obj.userName)}</option>
				 	</c:forEach>
				 </select>
             </label>
          </li>
          <li>
             <span class="tab-name">联系方式：</span>
             <label>
                 <input type="text" class="input-medium" value="" name="costLeaderMobile" id="costLeaderMobile"/>
             </label>
          </li>
          <li>
             <span class="tab-name tab-name-nbsp">&nbsp;&nbsp;&nbsp;</span>
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