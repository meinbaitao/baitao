<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>个人任务配合信息列表</title>
	<meta name="decorator" content="default"/>
	<style type="text/css">
	    html{overflow:hidden;}
	    body{overflow:hidden;}
	</style>
	<%-- <script type="text/javascript" src="${ctxStatic}/modules/task/taskInfo.js"></script> --%>
	<script type="text/javascript"> 
		var leftWidth = "230"; // 左侧窗口大小
		function wSize(){
			var strs=getWindowSize().toString().split(",");
			$("#officeMenuFrame, #officeMainFrame, #openClose").height(strs[0]-5);
			$("#right").width($("body").width()-$("#left").width()-$("#openClose").width()-20);
		}
		// 鼠标移动到边界自动弹出左侧菜单
		$("#openClose").mouseover(function(){
			if($(this).hasClass("open")){
				$(this).click();
			}
		});
	</script>
	<script src="${ctxStatic}/common/wsize.min.js" type="text/javascript"></script>
</head>
<body>
<div class="list-content" >
			<div class="nav-operate">
					<!-- <ul class="operationg-new" >
						<li><input id="tr_add" class="btn btn-primary saveTaskPlan" type="button" value="创建计划"></li>
						<li><input id="saveProject" class="btn btn-primary" type="button" value="保存"></li>
						<li><input id="deleteTaskPlan" class="btn btn-primary" type="button" value="删除"></li>		
					</ul> -->
			<form:form id="searchForm" modelAttribute="taskPersonalPlan" action="${ctx}/task/taskPersonalPlan/findCoordination" method="post" class="form-search">
				<ul class="search">
					<li>
		               <input type="text" name="keyDesc" placeholder="关键字">
		            </li>
					<li><input id="btnSubmit" class="search-btn" type="submit" value="查询" /></li>
				</ul>
			</form:form>
			</div>	
		<sys:message content="${message}"/>
		<form:form id="inputForm" modelAttribute="taskPlan" action="" method="post" class="form-horizontal magbtm0">
			<div class="table_scroll">
				  <table id="contentTable" class="table table-striped table-bordered table-condensed  table-eidt">
						<thead>
						   <tr list="taskList">
							    <th class="all-check"  >
									<input type="checkbox" id="all-check">
									<label for="all-check">选择</label>
							    </th>
								<th >阶段</th>
								<th >分部</th>
								<th >细项</th>
								<th >重点描述</th>
								<th >里程碑</th>
								<th >前置任务</th>
								<th >标准工期</th>
								<th >完成时间</th>
								<th >确认完成</th>
								<th >是否完成</th>
								<th >责任人</th>
								<th >状态</th>
								<th >备注信息</th>
							</tr>
						</thead>
						<tbody id="subProjectList"  copy="false">
								<c:forEach items="${page.list}" var="subProject" varStatus="idx" >
									<tr list="taskPersonalPlan" index="${idx.index}">
										<td type="hidden" name="taskPersonalPlan[${idx.index}].id" value="${subProject.id}" class="hide"></td>
										<td class="check">
											<input type="checkbox" name="chktaskPlan" id="${subProject.id}" name="taskPersonalPlan[${idx.index}].id" value="${subProject.id}">
										</td>
										<td >${subProject.stage}</td>
										<td >${subProject.subsection}</td>
										<td >${subProject.fine}</td>
										<td >${subProject.keyDesc}</td>
										<td >${subProject.milepost}</td>
										<td >${subProject.frontTask}</td>
										<td >${subProject.standardDay}</td>
										<td >${subProject.finishTime}</td>
										<td >${subProject.confirmOmpletion}</td>
										<td >${subProject.isFinish}</td>
										<td >${subProject.responsiblePerson}</td>
										<td >${subProject.status}</td>
										<td >${subProject.summaryRemarks}</td>
									 </tr>
						 		</c:forEach>
							</tbody>
					</table>
				</div>
		</form:form>

</div>

</body>
</html>