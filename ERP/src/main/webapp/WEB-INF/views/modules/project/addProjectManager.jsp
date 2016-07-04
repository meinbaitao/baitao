<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>项目管理</title>
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
	<div class="list-content"  >
		<div class="nav-operate" >

	        <form:form id="searchForm" modelAttribute="project" action="${ctx}/project/projectinfo?type=1" method="post" class="breadcrumb form-search">
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
					<th>公司名称</th>
					<th>甲方项目总经理</th>
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
						<td>${project.compy}</td>
						<td>${project.generalManagerAid}</td>
						<td>${not empty project.generalManagerAid?'已填写':'未填写'}</td>
					 </tr>
			 	 </c:forEach>
			</tbody>
		</table>
		<shiro:hasAnyRoles name="${fns:getWhitelistsList('txxmxx')}">
	   <div class="div_right">
	   <form:form id="addprojectForm" modelAttribute="project" action="${ctx}/project/addproject" method="post" class="form-horizontal">
	       <ul class="ul-tab-name">
	       <li>
             <span class="tab-name">项目公司名称：</span>
             <label class="li-label">
             	 <input type="hidden" name="id" id="projectId" value=""/>
                 <form:input name="compy" path="compy" htmlEscape="false" maxlength="50" class="input-medium" value=""/>
             </label>
          </li>
          <li>
             <span class="tab-name">甲方项目总经理：</span>
             <label class="li-label">
				 <form:input path="generalManagerAid" htmlEscape="false" maxlength="50" class="input-medium" value=""/>
             </label>
          </li>
           <li>
             <span class="tab-name">联系方式：</span>
             <label class="li-label">
                 <form:input path="generalManagerMobile" htmlEscape="false" maxlength="50" class="input-medium" value=""/>
             </label>
          </li>
           <li>
             <span class="tab-name">甲方项目区域总经理：</span>
             <label class="li-label">
				 <form:input path="regionalManagerAid" htmlEscape="false" maxlength="50" class="input-medium" value=""/>
             </label>
          </li>
           <li>
             <span class="tab-name">联系方式：</span>
             <label class="li-label">
                 <form:input path="regionalManagerMobile" htmlEscape="false" maxlength="50" class="input-medium" value=""/>
             </label>
          </li>
           <li>
             <span class="tab-name">甲方现场跟进人：</span>
             <label class="li-label">
				 <form:input path="localManagerAid" htmlEscape="false" maxlength="50" class="input-medium" value=""/>
             </label>
          </li>
           <li>
             <span class="tab-name">联系方式：</span>
             <label class="li-label">
                 <form:input path="localManagerMobile" htmlEscape="false" maxlength="50" class="input-medium" value=""/>
             </label>
          </li>
          <li >
             <span class="tab-name">是否需挂靠：</span>
             <label>
                 <input type="radio" name="isAttachUnit" id="yesAttachUnit" checked="checked" value="1"/>
                  <label for="yes">是</label>&nbsp;&nbsp;&nbsp;
                 <input type="radio" name="isAttachUnit" id="nonAttachUnit" value="0"/>
                 <label for="non">否</label>
             </label>
          </li>
          <li>
             <span class="tab-name">是否需报建：</span>
             <label>
                 <input type="radio" name="report" id="yesReport" checked="checked" value="1"/>
                  <label for="yes">是</label>&nbsp;&nbsp;&nbsp;
                 <input type="radio" name="report"   id="nonReport" value="0"/>
                 <label for="non">否</label>
             </label>
          </li>
           <li>
             <span class="tab-name">是否已报建：</span>
             <label>
                 <input type="radio" name="isReport" id="yesisReport" checked="checked" value="1"/>
                  <label for="yes">是</label>&nbsp;&nbsp;&nbsp;
                 <input type="radio" name="isReport"   id="nonisReport" value="0"/>
                 <label for="non">否</label>
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