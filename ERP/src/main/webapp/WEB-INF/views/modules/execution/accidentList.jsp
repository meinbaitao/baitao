<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>事故单管理</title>
	<link href="${ctxStatic}/treeTable/themes/vsStyle/treeTable.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/ajaxfileupload/ajaxfileupload.js" type="text/javascript"></script>
	<script src="${ctxStatic}/modules/construction/scripts/accident.js" type="text/javascript"></script>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			form_validate("addAccidentForm");
		});
	</script>
</head>
<body>
	<div class="list-content">
	     <div class="nav-operate" >
	     	<ul class="operationg-new" >
		        <li class="operation-project" showWidth="800px" thisTagert="appoint-saider" id="addAccident"><span class="glyphicon glyphicon-plus-sign"></span>发起事故问题 </li>
		    </ul>
	     </div>
	     <sys:message content="${message}"/>
	     <table class="table table-striped table-bordered table-condensed hide tree_table treeTable" id="treeTable" style="display: table;">
			<thead>
			   <tr>
				<th width="180px">项目信息</th>
				<th>事故描述</th>
				<th>事故类型</th>
				<th>罚款金额</th>
				<th>补料金额</th>
				<th>事故提交时间</th>
				<th>状态</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="obj">
					<tr pid="0" id="project${obj.projectId}" class="0 first-level" haschild="true" previd="" islastone="true" depth="1">
						<td>
				            <div class="tit">
						        <input type="checkbox">  
						        <i thisTagertId="${obj.projectId}" id="queryAccidentList" class="glyphicon glyphicon-triangle-right"></i> 
						        <label class="operation-project">
						        	${obj.name}
						        </label>
						     </div>					    
					   	</td>
					 </tr>
				 </c:forEach>
			</tbody>
		</table>
	</div>
	<div class="appoint-saider" id="appoint-saider">
	<form:form id="addAccidentForm" modelAttribute="accident" action="${ctx}/accident/addaccident" method="post" class="form-horizontal">
       <h3><i reset="true"></i>事故填写单</h3>
       <ul>
          <li>
             <span class="tab-name">项目名称：</span>
             <label>
                 <select name="projectId" class="input-medium" tabindex="-1" id="projectId">
					<c:forEach items="${projectList}" var="project">
						<option value="${fns:escapeHtml(project.id)}" >${fns:escapeHtml(project.name)}</option>
					</c:forEach>
				 </select>
             </label>
          </li>
          <li>
             <span class="tab-name">事故类型：</span>
             <label>
             	<input type="hidden" name="accidentId" id="accidentId" value="">
				<form:select name="problemType" id="problemType" path="problemType" class="input-medium" tabindex="-1">
					<form:options items="${fns:getDictList('accident_type')}" itemValue="label" itemLabel="label" htmlEscape="false"/>
				</form:select>
             </label>
          </li>
          <li class="line">
             <span class="tab-name">事故描述：</span>
             <label>
                <textarea name="problemComment" id="problemComment" rows="6" cols="18" style="width: 550px; height: 121px;"></textarea> 
             </label>
          </li>
          <li>
             <span class="tab-name">是否影响施工：</span>
             <label>
                 <input type="radio" name="isInfluenct" value="1"/>
                  <label for="yes">是</label>&nbsp;&nbsp;&nbsp;
                 <input type="radio" name="isInfluenct" value="0"/>
                 <label for="non">否</label>
             </label>
          </li>
          <li>
             <span class="tab-name">解决方案：</span>
             <label>
                 <input type="checkbox" name="isSupply"/>
                  <label for="yes">补料</label>&nbsp;&nbsp;&nbsp;
                 <input checked="checked" type="checkbox" name="isPunish"/>
                 <label for="non">罚款</label>
             </label>
          </li>
          <li>
             <span class="tab-name">罚款金额：</span>
             <label>
                <input name="punishPrice" id="punishPrice" type="text" class="input-medium required number" value="0"/>
             </label>
          </li>
          <li>
             <span class="tab-name">补料金额：</span>
             <label>
                <input name="supplyPrice" id="supplyPrice" type="text" class="input-medium required number" value="0"/>
             </label>
          </li>
          <li>
             <span class="tab-name">所属成员：</span>
             <label>
                 <input type="radio" name="companyType" id="yes" value="1"/>
                  <label for="yes">内部</label>&nbsp;&nbsp;&nbsp;
                 <input  type="radio" name="companyType" value="0" id="non"/>
                 <label for="non">供应商</label>
             </label>
          </li>
          <li>
             <span class="tab-name">处罚人：</span>
             <label>
                <input name="punishManagerBid" id="punishManagerBid"  type="text" class="input-medium" value=""/>
             </label>
          </li>
          <li>
             <span class="tab-name">是否生效：</span>
             <label>
                 <input  type="radio" name="status" id="yes" value="1"/>
                  <label for="yes">已处理</label>&nbsp;&nbsp;&nbsp;
                 <input checked="checked" type="radio" name="status" value="0" id="non"/>
                 <label for="non">待处理</label>
             </label>
          </li>
          <li>
             <span class="tab-name">&nbsp;&nbsp;&nbsp;</span>
             <label>
                 <input type="submit" name="baojian" class="btn btn-primary"/>
             </label>
          </li>
       </ul>
       </form:form>
    </div>
</body>
</html>