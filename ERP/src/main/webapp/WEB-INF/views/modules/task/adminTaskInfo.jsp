<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>任务型计划信息列表</title>
	<meta name="decorator" content="default"/>
	<style type="text/css">
	    html{overflow:hidden;}
	    body{overflow:hidden;}
	    td{
		white-space:nowrap;
		overflow: hidden;
	}
	</style>
	<script type="text/javascript" src="${ctxStatic}/modules/task/adminTaskInfo.js"></script>
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
		//表单验证
		$(document).ready(function() {form_validate("inputForm"); });
	</script>
	<script src="${ctxStatic}/common/wsize.min.js" type="text/javascript"></script>
</head>
<body>
<div class="list-content" >
			<div class="nav-operate">
					<ul class="operationg-new" >
						<li><input id="tr_add" class="btn btn-primary saveTaskPlan" type="button" value="创建计划"></li>
						<li><input id="saveProject" class="btn btn-primary" type="button" value="保存"></li>
						<li><input id="deleteTaskPlan" class="btn btn-primary" type="button" value="删除"></li>		
						<li><input id="submitTaskPlan" class="btn btn-primary" type="button" value="提交"></li>		
					</ul>
			<form:form id="searchForm" modelAttribute="taskPlan" action="${ctx}/task/adminPlan/findByOffice/${officeId}/${taskType}" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}" />
				<ul class="search">
					<li>
		               <form:input path="taskDesc" value="${searchKey }" htmlEscape="false" maxlength="200" class="input-medium" placeholder="关键字"/>
		            </li>
					<li><input id="btnSubmit" class="search-btn" type="submit" value="查询" /></li>
				</ul>
			</form:form>
			</div>	
				
		<sys:message content="${message}"/>
		<form:form id="inputForm" modelAttribute="taskPlan" action="" method="post" class="form-horizontal magbtm0">
		<input type="hidden" name="deptId" id="deptId" value="${officeId }">
		<div class="table_scroll">
			  <table id="contentTable" class="table table-striped table-bordered table-condensed  table-eidt">
					<thead>
					   <tr list="taskList">
						    <th class="all-check"  >
								<input type="checkbox" id="all-check">
						    </th>
							<th name="icon" id="icon" copy="th-copy">
								<span class="icon-star-empty" style="cursor: pointer;" title="集团关注"></span>
								<span class="icon-bookmark-empty" style="padding-left: 10px;cursor: pointer;" title="长期任务"></span>
								<span class="icon-comment-alt" style="padding-left: 10px;cursor: pointer;" title="讨论建议"></span>
							</th>
							<th type="text"  class="input-medium" name="oneLevelPlan" id="oneLevelPlan" maxlength="200">一级计划</th>
							<th type="text"   class="input-medium" name="twoLevelPlan" id="twoLevelPlan" maxlength="200">二级计划</th>
							<th type="text"   class="input-medium required" name="taskDesc" id="taskDesc" maxlength="300">任务</th>
							<th type="select" status="1"  class="input-medium required" name="responsiblePerson" id="responsiblePerson" empty="true">责任人</th>
							<th type="select" status="2" class="input-medium required" name="reviewDeptId" id="reviewDeptId" empty="true">复评部门</th>
							<th type="text"  readonly="readonly" onclick="timeinput()" class="input-medium Wdate required" name="planFinishTime" id="planFinishTime">计划完成时间</th>
							<th   name="finishTimeAdjust1" id="finishTimeAdjust1">完成时间调整1</th>
							<th   name="finishTimeAdjust2" id="finishTimeAdjust2">完成时间调整2</th>
							<th   name="actualFinishTime" id="actualFinishTime">实际完成时间</th>
							<th   name="finishReview" id="finishReview">完成情况复评</th>
							<th   name="summaryRemarks" id="summaryRemarks" maxlength="200">计划总结备注</th>
							<th   name="status" id="status">计划状态</th>
							<!-- <th type="text"    class="input-medium" name="earlyWarning" id="earlyWarning">预警</th>
							<th name="icon" id="icon" copy="th-copy">
								<span class="icon-envelope-alt" style="cursor: pointer;" title="邮件提醒"></span>
								<span class=" icon-comments-alt" style="padding-left: 10px;cursor: pointer;" title="对话"></span>
								<span class="icon-bell" style="padding-left: 10px;cursor: pointer;" title="预警提醒"></span>
							</th> -->
						</tr>
					</thead>
					<c:if test="${flag eq 'add'}">
						<tbody id="subProjectList"  copy="false">
						</tbody>
					</c:if>
					<c:if test="${flag eq 'view'}"> 
						<tbody id="subProjectList"  copy="false">
							<!-- <input type="hidden" name="delId" id="delId" value=""> -->
							<c:forEach items="${page.list}" var="subProject" varStatus="idx" >
								
								<c:choose>
									<c:when test="${subProject.status=='0'}">
										<tr list="taskList" index="${idx.index}">
											<td type="hidden" name="taskList[${idx.index}].id" value="${subProject.id}" class="hide"></td>
											<td type="hidden" name="taskList[${idx.index}].deptId" value="${subProject.deptId}" class="hide"></td>
											<td class="check">
												<input type="checkbox" name="chktaskPlan" id="${subProject.id}" name="taskList[${idx.index}].id" value="${subProject.id}">
											</td>
											<td class="updateTaskPlan" name="taskList[${idx.index}].icon" id="icon">
											<c:choose>
												<c:when test="${subProject.groupConcern==1 }">
													<span class="icon-star"  name="group" id="${subProject.id}" deptId="${subProject.deptId }"  status="${subProject.groupConcern}" style="cursor: pointer;" title="集团关注"></span>
												</c:when>
												<c:otherwise>
													<span class="icon-star-empty" name="group" id="${subProject.id}" deptId="${subProject.deptId }"  status="${subProject.groupConcern}" style="cursor: pointer;" title="集团关注"></span>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${subProject.longTermTask==1 }">
													<span class="icon-bookmark" name="termTask" id="${subProject.id}" deptId="${subProject.deptId }"  status="${subProject.longTermTask}" style="padding-left: 10px;cursor: pointer;" title="长期任务"></span>
												</c:when>
												<c:otherwise>
													<span class="icon-bookmark-empty" name="termTask" id="${subProject.id}" deptId="${subProject.deptId }"  status="${subProject.longTermTask}"  style="padding-left: 10px;cursor: pointer;" title="长期任务"></span>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${subProject.discussionSuggestion==1 }">
													<span class="icon-comment" name="discu" id="${subProject.id}" deptId="${subProject.deptId }"  status="${subProject.discussionSuggestion}" style="padding-left: 10px;cursor: pointer;" title="讨论建议"></span>
												</c:when>
												<c:otherwise>
													<span class="icon-comment-alt" name="discu" id="${subProject.id}" deptId="${subProject.deptId }"  status="${subProject.discussionSuggestion}" style="padding-left: 10px;cursor: pointer;" title="讨论建议"></span>
												</c:otherwise>
											</c:choose>
												
											</td>
											<td type="text" class="input-medium updateTaskPlan" name="taskList[${idx.index}].oneLevelPlan" id="oneLevelPlan" maxlength="200">${subProject.oneLevelPlan}</td>
											<td type="text"  class="input-medium updateTaskPlan" name="taskList[${idx.index}].twoLevelPlan" id="twoLevelPlan" maxlength="200">${subProject.twoLevelPlan}</td>
											<td type="text"  class="input-medium updateTaskPlan required" name="taskList[${idx.index}].taskDesc" id="taskDesc" maxlength="300">${subProject.taskDesc}</td>
											<td type="select" status="1" class="input-medium updateTaskPlan required" name="taskList[${idx.index}].responsiblePerson" value="${subProject.responsiblePerson}" id="responsiblePerson">${subProject.showPerson}</td>
											<td type="select" status="2" class="input-medium updateTaskPlan required" name="taskList[${idx.index}].reviewDeptId" value="${subProject.reviewDeptId}" id="reviewDeptId">${subProject.showDept}</td>
											<td type="text" readonly="readonly"  onclick="timeinput()" class="input-medium Wdate updateTaskPlan required" name="taskList[${idx.index}].planFinishTime" id="planFinishTime">${subProject.planFinishTime}</td>
											<td  name="taskList[${idx.index}].finishTimeAdjust1" id="finishTimeAdjust1">${subProject.finishTimeAdjust1}</td>
											<td  name="taskList[${idx.index}].finishTimeAdjust2" id="finishTimeAdjust2">${subProject.finishTimeAdjust2}</td>
											<td  name="taskList[${idx.index}].actualFinishTime" id="actualFinishTime">${subProject.actualFinishTime}</td>
											<td  name="taskList[${idx.index}].finishReview" id="finishReview">${subProject.finishReview}</td>
											<td  name="taskList[${idx.index}].summaryRemarks" id="summaryRemarks" maxlength="200">${subProject.summaryRemarks}</td>
											<td  name="taskList[${idx.index}].status" id="status">
												草稿
											</td>
										</tr>
									</c:when>
									
									<c:when test="${empty subProject.status}">
										<tr list="taskList" index="${idx.index}">
											<td type="hidden" name="taskList[${idx.index}].id" value="${subProject.id}" class="hide"></td>
											<td type="hidden" name="taskList[${idx.index}].deptId" value="${subProject.deptId}" class="hide"></td>
											<td class="check">
												<input type="checkbox" name="chktaskPlan" id="${subProject.id}" name="taskList[${idx.index}].id" value="${subProject.id}">
											</td>
											<td class="updateTaskPlan" name="taskList[${idx.index}].icon" id="icon">
											<c:choose>
												<c:when test="${subProject.groupConcern==1 }">
													<span class="icon-star" name="group" id="${subProject.id}" deptId="${subProject.deptId }"  status="${subProject.groupConcern}" style="cursor: pointer;" title="集团关注"></span>
												</c:when>
												<c:otherwise>
													<span class="icon-star-empty" name="group" id="${subProject.id}" deptId="${subProject.deptId }"  status="${subProject.groupConcern}" style="cursor: pointer;" title="集团关注"></span>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${subProject.longTermTask==1 }">
													<span class="icon-bookmark" name="termTask" id="${subProject.id}" deptId="${subProject.deptId }"  status="${subProject.longTermTask}" style="padding-left: 10px;cursor: pointer;" title="长期任务"></span>
												</c:when>
												<c:otherwise>
													<span class="icon-bookmark-empty" name="termTask" id="${subProject.id}" deptId="${subProject.deptId }"  status="${subProject.longTermTask}"  style="padding-left: 10px;cursor: pointer;" title="长期任务"></span>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${subProject.discussionSuggestion==1 }">
													<span class="icon-comment" name="discu" id="${subProject.id}" deptId="${subProject.deptId }"  status="${subProject.discussionSuggestion}" style="padding-left: 10px;cursor: pointer;" title="讨论建议"></span>
												</c:when>
												<c:otherwise>
													<span class="icon-comment-alt" name="discu" id="${subProject.id}" deptId="${subProject.deptId }"  status="${subProject.discussionSuggestion}" style="padding-left: 10px;cursor: pointer;" title="讨论建议"></span>
												</c:otherwise>
											</c:choose>
												
											</td>
											<td type="text" class="input-medium updateTaskPlan" name="taskList[${idx.index}].oneLevelPlan" id="oneLevelPlan" maxlength="200">${subProject.oneLevelPlan}</td>
											<td type="text"  class="input-medium updateTaskPlan" name="taskList[${idx.index}].twoLevelPlan" id="twoLevelPlan" maxlength="200">${subProject.twoLevelPlan}</td>
											<td type="text"  class="input-medium updateTaskPlan required" name="taskList[${idx.index}].taskDesc" id="taskDesc" maxlength="300">${subProject.taskDesc}</td>
											<td type="select" status="1"  class="input-medium updateTaskPlan required" name="taskList[${idx.index}].responsiblePerson" value="${subProject.responsiblePerson}" id="responsiblePerson">${subProject.showPerson}</td>
											<td type="select" status="2" class="input-medium updateTaskPlan required" name="taskList[${idx.index}].reviewDeptId" value="${subProject.reviewDeptId}" id="reviewDeptId">${subProject.showDept}</td>
											<td type="text" readonly="readonly"  onclick="timeinput()" class="input-medium Wdate updateTaskPlan required" name="taskList[${idx.index}].planFinishTime" id="planFinishTime">${subProject.planFinishTime}</td>
											<td  name="taskList[${idx.index}].finishTimeAdjust1" id="finishTimeAdjust1">${subProject.finishTimeAdjust1}</td>
											<td  name="taskList[${idx.index}].finishTimeAdjust2" id="finishTimeAdjust2">${subProject.finishTimeAdjust2}</td>
											<td  name="taskList[${idx.index}].actualFinishTime" id="actualFinishTime">${subProject.actualFinishTime}</td>
											<td  name="taskList[${idx.index}].finishReview" id="finishReview">${subProject.finishReview}</td>
											<td  name="taskList[${idx.index}].summaryRemarks" id="summaryRemarks" maxlength="200">${subProject.summaryRemarks}</td>
											<td  name="taskList[${idx.index}].status" id="status">
												草稿
											</td>
										</tr>
									</c:when>
									
									<c:otherwise>
										<tr>
											<td></td>
											<td>
											<c:choose>
												<c:when test="${subProject.groupConcern==1 }">
													<span class="icon-star" title="集团关注"></span>
												</c:when>
												<c:otherwise>
													<span class="icon-star-empty"  title="集团关注"></span>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${subProject.longTermTask==1 }">
													<span class="icon-bookmark" style="padding-left: 10px;cursor: pointer;"  title="长期任务"></span>
												</c:when>
												<c:otherwise>
													<span class="icon-bookmark-empty" style="padding-left: 10px;cursor: pointer;" title="长期任务"></span>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${subProject.discussionSuggestion==1 }">
													<span class="icon-comment" style="padding-left: 10px;cursor: pointer;" title="讨论建议"></span>
												</c:when>
												<c:otherwise>
													<span class="icon-comment-alt" style="padding-left: 10px;cursor: pointer;" title="讨论建议"></span>
												</c:otherwise>
											</c:choose>
												
											</td>
											<td>${subProject.oneLevelPlan}</td>
											<td>${subProject.twoLevelPlan}</td>
											<td>${subProject.taskDesc}</td>
											<td>${subProject.showPerson}</td>
											<td>${subProject.showDept}</td>
											<td>${subProject.planFinishTime}</td>
											<td>${subProject.finishTimeAdjust1}</td>
											<td>${subProject.finishTimeAdjust2}</td>
											<td>${subProject.actualFinishTime}</td>
											<td>${subProject.finishReview}</td>
											<td>${subProject.summaryRemarks}</td>
											<td>
												<c:choose>
													<c:when test="${subProject.status=='1'}">
													待审批
													</c:when>
													<c:when test="${subProject.status=='2'}">
													执行中
													</c:when>
													<c:when test="${subProject.status=='3'}">
													延期申请中
													</c:when>
													<c:when test="${subProject.status=='4'}">
													复评申请中
													</c:when>
													<c:when test="${subProject.status=='5'}">
													已完成
													</c:when>
												</c:choose>
											</td>
										 </tr>
									</c:otherwise>
									
								</c:choose>
								
							
					 		</c:forEach>
						</tbody>
					 </c:if>
				</table>
			</div>
	</form:form>
</div>

</body>
</html>