<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>填写设计师</title>
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
		
		function mosaicData(){
			var vCheckd =[]; 
			$('input[name="checkdbox"]:checked').each(function(){ 
				vCheckd.push($(this).attr("id")); 
			}); 
			if(vCheckd.length==0){
				window.alertx("请先选择楼栋信息！"); 
				return false;
			}
			if($("#designer").val()==""){
				window.alertx("请选择相应的设计师！");
				return false;
			}
			$("#checkedIds").val(vCheckd);
			return true;
		}
	</script>
</head>
<body>
	<div class="list-content" >
		<div class="nav-operate" >
	        <form:form id="searchForm" modelAttribute="project" action="${ctx}/project/projectinfo?type=5" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        <!-- 
		        <ul class="operationg-new">
		        	状态：
		        	<select name="statusFlag" id="statusFlag" class="input80">
					 	<option value="1">全部</option>
					 	<option value="0" <c:if test="${statusFlag eq '0' }"> selected="selected" </c:if>>未填写</option>
					</select>
		        </ul>
		         -->
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
	   <table id="contentTable" class="table table-striped table-bordered table-condensed resize width-75 tree_table">
			<thead>
			   <tr>
				<th>一级项目信息</th>
				<th>户型</th>
				<th>楼栋</th>
				<th>状态</th>
				<th>设计主管</th>
				<th>设计师</th>
				<th>设计师联系电话</th>
				</tr>
			</thead>
		<tbody>
			<c:forEach items="${page.list}" var="project" varStatus="1">
				<tr pid="0" id="project${project.id}" class="0 first-level hide-childen" haschild="true" previd="" islastone="true" depth="1">
					<td>
			            <div class="tit">
					        <i thisTagertId="${project.id}" id="querySubProjectList" class="glyphicon glyphicon-triangle-right"></i> 
					        <label class="operation-project" showWidth="800px" thisTagert="appoint-saider" id="projectDetail" thisTagertId="${project.id}">
					        	${project.name}
					        </label>
					     </div>					    
				   	</td>
				 </tr>
			 </c:forEach>
			</tbody>
		</table>
		<shiro:hasAnyRoles name="${fns:getWhitelistsList('txsjs')}">
	   <div class="div_right">
	   <form:form id="addprojectForm" modelAttribute="subproject" action="${ctx}/project/addDesigner" onsubmit="javascript:return mosaicData();" method="post" class="form-horizontal">
	     <input id="checkedIds" name="checkedIds" type="hidden" value=""/>
	       <ul class="checkedids-ul">
	          <li>
	             <span class="tab-name">设计师：</span>
	             <label>
	             	 <select name="designer" id="designer" phone="designerMobile" class="input-medium" tabindex="-1">
					 	<option value=""></option>
					 	<c:forEach items="${fns:selByCondition('sjs')}" var="obj" varStatus="idxStatus">
							 <option value="${fns:escapeHtml(obj.userID)},${fns:escapeHtml(obj.phone)}" >${fns:escapeHtml(obj.userName)}</option>
					 	</c:forEach>
					 </select>
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">联系方式：</span>
	             <label>
	                 <input type="text" class="input-medium" value="" name="designerMobile" id="designerMobile"/>
	             </label>
	          </li>
	          <li>
	             <span class="tab-name tab-name-nbsp">&nbsp;&nbsp;&nbsp;</span>
	             <label>
	                 <input type="submit"  class="btn btn-primary" value="保存"/>
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