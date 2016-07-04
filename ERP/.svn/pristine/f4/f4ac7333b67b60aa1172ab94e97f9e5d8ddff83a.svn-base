<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>任务型计划信息列表</title>
	<meta name="decorator" content="default"/>
	<style type="text/css">
	    html{overflow:hidden;}
	    body{overflow:hidden;}
	</style>
	<script type="text/javascript" src="${ctxStatic}/modules/task/showTaskSon.js"></script>
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
					<c:choose>
						<c:when test="${all eq 'all'}"></c:when>
						<c:otherwise>
							<ul class="operationg-new" >
							<li><input id="tr_add" class="btn btn-primary savetaskPersonalPlanList" type="button" value="创建计划"></li>
							<li><input id="saveProject" class="btn btn-primary" type="button" value="保存"></li>
							<li><input id="deletetaskPersonalPlanList" class="btn btn-primary" type="button" value="删除"></li>		
						</ul>
						</c:otherwise>
					</c:choose>
			<form:form id="searchForm" modelAttribute="taskPersonalPlan" action="${ctx}/task/taskPersonalPlan/findSonTask?taskId=${taskId}" method="post" class="breadcrumb form-search">
				<ul class="search">
					<li>
		               <input type="text" name="keyDesc" value="${keyDesc}" placeholder="关键字">
		            </li>
					<li><input id="btnSubmit" class="search-btn" type="submit" value="查询" /></li>
				</ul>
			</form:form>
			</div>	
		<sys:message content="${message}"/>
		<c:if test="${flag eq 'view'}"> 
		<form:form id="inputForm" modelAttribute="taskPersonalPlan" action="" method="post" class="form-horizontal magbtm0">
			<input type="hidden" name="taskId" id="taskId" value="${taskId }">
			<div class="table_scroll">
				  <table id="contentTable" class="table table-striped table-bordered table-condensed  table-eidt">
						<thead>
						   <tr list="taskPersonalPlanList">
							    <th class="all-check"  >
									<input type="checkbox" id="all-check">
									<label for="all-check">选择</label>
							    </th>
								<th type="text"   class="input-medium" name="stage" id="stage">阶段</th>
								<th type="text"   class="input-medium" name="subsection" id="subsection">分部</th>
								<th type="text"   class="input-medium" name="fine" id="fine">细项</th>
								<th type="text"   class="input-medium" name="keyDesc" id="keyDesc">重点描述</th>
								<th type="text"   class="input-medium" name="milepost" id="milepost">里程碑</th>
								<th type="text"   class="input-medium " name="frontTask" id="frontTask">前置任务</th>
								<th type="text"   class="input-medium" name="standardDay" id="standardDay">标准工期</th>
								<th type="text"   readonly="readonly" onclick="timeinput()" class="input-medium Wdate" name="finishTime" id="finishTime">完成时间</th>
								<th type="text"   class="input-medium Wdate" name="confirmOmpletion" id="confirmOmpletion">确认完成</th>
								<th type="text"    class="input-medium" name="isFinish" id="isFinish">是否完成</th>
								<th type="text"    class="input-medium" name="responsiblePerson" id="responsiblePerson">责任人</th>
								<th type="text"    class="input-medium" name="status" id="status">状态</th>
								<th type="text"    class="input-medium" name="summaryRemarks" id="summaryRemarks">备注信息</th>
							</tr>
						</thead>
						<tbody id="subProjectList"  copy="false">
								<c:forEach items="${page.list}" var="subProject" varStatus="idx" >
									<tr list="taskPersonalPlanList" index="${idx.index}">
										<td type="hidden" name="taskPersonalPlanList[${idx.index}].id" value="${subProject.id}" class="hide"></td>
										<td class="check">
											<input type="checkbox" name="chktaskPlan" id="${subProject.id}" name="taskPersonalPlanList[${idx.index}].id" value="${subProject.id}">
										</td>
										<td type="text" class="input-medium updatetaskPersonalPlanList" name="taskPersonalPlanList[${idx.index}].stage" id="stage">${subProject.stage}</td>
										<td type="text"  class="input-medium updatetaskPersonalPlanList" name="taskPersonalPlanList[${idx.index}].subsection" id="subsection">${subProject.subsection}</td>
										<td type="text"  class="input-medium updatetaskPersonalPlanList" name="taskPersonalPlanList[${idx.index}].fine" id="fine">${subProject.fine}</td>
										<td type="text"  class="input-medium updatetaskPersonalPlanList" name="taskPersonalPlanList[${idx.index}].keyDesc" id="keyDesc">${subProject.keyDesc}</td>
										<td type="text"  class="input-medium updatetaskPersonalPlanList" name="taskPersonalPlanList[${idx.index}].milepost" id="milepost">${subProject.milepost}</td>
										<td type="text"  class="input-medium updatetaskPersonalPlanList" name="taskPersonalPlanList[${idx.index}].frontTask" id="frontTask">${subProject.frontTask}</td>
										<td type="text"  class="input-medium updatetaskPersonalPlanList" name="taskPersonalPlanList[${idx.index}].standardDay" id="standardDay">${subProject.standardDay}</td>
										<td type="text"  readonly="readonly"  onclick="timeinput()" class="input-medium Wdate updatetaskPersonalPlanList" name="taskPersonalPlanList[${idx.index}].finishTime" id="finishTime">${subProject.finishTime}</td>
										<td type="text"  class="input-medium updatetaskPersonalPlanList" name="taskPersonalPlanList[${idx.index}].confirmOmpletion" id="confirmOmpletion">${subProject.confirmOmpletion}</td>
										<td type="text"  class="input-medium updatetaskPersonalPlanList" name="taskPersonalPlanList[${idx.index}].isFinish" id="isFinish">${subProject.isFinish}</td>
										<td type="text"  class="input-medium updatetaskPersonalPlanList" name="taskPersonalPlanList[${idx.index}].responsiblePerson" id="responsiblePerson">${subProject.responsiblePerson}</td>
										<td type="text"  class="input-medium updatetaskPersonalPlanList" name="taskPersonalPlanList[${idx.index}].status" id="status">${subProject.status}</td>
										<td type="text"  class="input-medium updatetaskPersonalPlanList" name="taskPersonalPlanList[${idx.index}].summaryRemarks" id="summaryRemarks">${subProject.summaryRemarks}</td>
									 </tr>
						 		</c:forEach>
							</tbody>
					</table>
				</div>
		</form:form>
	</c:if>
</div>

</body>
</html>