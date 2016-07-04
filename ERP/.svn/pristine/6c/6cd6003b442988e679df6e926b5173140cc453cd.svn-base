<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>填写进度</title>
	<link href="${ctxStatic}/treeTable/themes/vsStyle/treeTable.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/ajaxfileupload/ajaxfileupload.js" type="text/javascript"></script>
	<script src="${ctxStatic}/modules/construction/scripts/schedule.js" type="text/javascript"></script>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			form_validate("addScheduleForm");
		});
	</script>
</head>
<body>
	<div class="list-content">
	     <div class="nav-operate" >
	           <form:form id="searchForm" modelAttribute="oaNotify" action="${ctx}/oa/oaNotify/xxxxxx" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		      	<ul class="search">
		            <li>
		               <input name="name" type="text" maxlength="200" class="input-medium"/>
		            </li>
		            <li>
		            	<input id="searchProject" type="submit" name="搜索" value="搜索" class="search-btn"/>
		            </li>
		        </ul>
		       <div class="clearfix"></div>
		       </form:form>
	      </div>
	     <sys:message content="${message}"/>
	     <table class="table table-striped table-bordered table-condensed hide tree_table" id="treeTable" style="display: table;">
			<thead>
			   <tr>
				<th width="180px">项目信息</th>
				<th>户型</th>
				<th>楼栋</th>
				<th>状态</th>
				<th>骨架完成比例</th>
				<th>石材完成比例</th>
				<th>现场照片</th>
				<th>填写进度</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="obj">
					<tr pid="0" id="project${obj.pid}" class="0 first-level" haschild="true" previd="" islastone="true" depth="1">
						<td>
				            <div class="tit">
						        <input type="checkbox">  
						        <i thisTagertId="${obj.pid}" id="queryScheduleList" class="glyphicon glyphicon-triangle-right"></i> 
						        <label>
						        	${obj.name}
						        </label>
						        <label for="chk1" style="margin-left:30px;">
						        	事故问题：<a thisTagertId="${obj.pid}" class="operation-project" showWidth="800px" thisTagert="appoint-saider6" id="accidentDetail">查看</a>
						        </label>
						     </div>					    
					   	</td>
					 </tr>
				 </c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="appoint-saider" id="appoint-saider">
	 <form:form id="addScheduleForm" modelAttribute="Scheduledetail" action="${ctx}/schedule/addschedule" method="post" class="form-horizontal">
       <h3><i reset="true"></i>填写进度</h3>
        <ul>
          <li class="line">
             <span class="tab-name">楼栋号：</span>
             <label>
             	 <input type="hidden" name="scheduleId" id="scheduleId" value="">
                 <input  type="text" class="input-medium" name="building" value="" id="building" readonly="readonly"/>
             </label>
          </li>
          <li>
             <span class="tab-name">楼栋状态：</span>
             <label>
                 <input  type="hidden" name="projectId" id="projectId" class="input-medium" value=""/>
                 <input  type="hidden" name="subProjectId" id="subProjectId" class="input-medium" value=""/>
                 <select name="subProjectStatus" class="input-medium" tabindex="-1" id="subProjectStatus">
					<option value="在建" >在建</option>
					<option value="待建" >待建</option>
					<option value="完成" >完成</option>
				 </select>
             </label>
          </li>
          <li>
             <span class="tab-name">签证份数</span>
             <label>
                <input  type="hidden" name="revenue" id="revenue" class="input-medium" value="0"/>
                <form:input path="visaCount" htmlEscape="false" maxlength="200" class="input-medium" value=""/>
             </label>
          </li>
          <li>
             <span class="tab-name">骨架计划完成比例(%)</span>
             <label>
                <form:input path="skelentonplanratio" htmlEscape="false" maxlength="200" class="input-medium" value=""/>
             </label>
          </li>
          <li>
             <span class="tab-name">骨架实际完成比例(%)</span>
             <label>
                <form:input path="skeletoncompratio" htmlEscape="false" maxlength="200" class="input-medium" value=""/>
             </label>
          </li>
          <li>
             <span class="tab-name">石材计划完成比例(%)</span>
             <label>
                <form:input path="stoneplanratio" htmlEscape="false" maxlength="200" class="input-medium" value=""/>
             </label>
          </li>
          <li>
             <span class="tab-name">石材实际完成比例(%)</span>
             <label>
                <form:input path="stonecompratio" htmlEscape="false" maxlength="200" class="input-medium" value=""/>
             </label>
          </li>
          <li class="line">
             <span class="tab-name">上传附件</span>
             <input type="button" id="uploadAttach" value="上传"  class="operation-project"   thistagert="appoint-saider3" showwidth="400px" small="true">
          	 <span id="showAttach">
               	
             </span>
          </li>
          <li class="line">
             <span class="tab-name">上传图片</span>
             <input type="button" id="uploadImg" value="上传" class="operation-project"   thistagert="appoint-saider4" showwidth="400px" small="true">
             <span id="showImg">
               	
             </span>
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
    <div class="appoint-saider" id="appoint-saider2">
       <h3><i></i>项目进度明细</h3>
     <table id="contentTable" class="table table-striped table-bordered table-condensed resize check">
		   <thead>
		     <th>楼栋号</th>
		     <th>骨架完成比例(%)</th>
		     <th>骨架计划完成比例(%)</th>
		     <th>石材完成比例(%)</th>
		     <th>石材计划完成比例(%)</th>
		     <th>产值</th>
		     <th>签证份数</th>
            </thead>
            <tbody id="scheduleDetailList">
             	
            </tbody>  
		 </table>
    </div>
    
    <div class="appoint-saider" id="appoint-saider3">
    	<h3><i reset="true"></i>上传附件</h3>
        <form id="uploadAttachForm" enctype="multipart/form-data" action="${ctx}/schedule/upload" method="post">
             <label>
                <input  type="file" name="file" id="file" class="input-medium"/>
             </label>
             <label>
                <input  attrTxt="file" type="button" id="uploadAttachment" class="input-medium" value="上传"/>
             </label>
         </form>
    </div>
    <div class="appoint-saider" id="appoint-saider4">
    	<h3><i reset="true"></i>上传照片</h3>
          <form id="uploadImagesForm" enctype="multipart/form-data" action="${ctx}/schedule/upload" method="post">
             <label>
                <input  type="file" name="iconImg" id="iconImg" class="input-medium"/>
             </label>
             <label>
                <input  attrTxt="file" type="button" id="uploadImages" class="input-medium" value="上传"/>
             </label>
         </form>
    </div>
    <div class="appoint-saider" id="appoint-saider5">
    	<h3><i></i>现场照片</h3>
        <ul id="showDetailImages">
        	
        </ul> 
    </div>
    <div class="appoint-saider" id="appoint-saider6">
       <h3><i></i>问题明细</h3>
     <table id="contentTable" class="table table-striped table-bordered table-condensed resize check">
		  	<thead>
			   <tr>
				<th>事故描述</th>
				<th>事故类型</th>
				<th>罚款金额</th>
				<th>补料金额</th>
				<th>事故提交时间</th>
				<th>状态</th>
				</tr>
			</thead>
            <tbody id="accidentDetailList">
             	
            </tbody>  
		 </table>
    </div>
</body>
</html>