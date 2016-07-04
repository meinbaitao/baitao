<%@ page pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>个人总控计划信息</title>
	<meta name="decorator" content="default"/>
	<style type="text/css">
	    html{overflow:hidden;}
	    body{overflow:hidden;}
	    td{
			white-space:nowrap;
			overflow: hidden;
		}
	</style>
	<script type="text/javascript" src="${ctxStatic}/modules/task/personTaskInfo.js"></script>
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
					<ul class="operationg-new" >
						<li><input id="tr_add" class="btn btn-primary saveTaskPlan" type="button" value="创建计划"></li>
						<li><input id="saveProject" class="btn btn-primary" type="button" value="保存"></li>
						<li><input id="deleteTaskPlan" class="btn btn-primary" type="button" value="删除"></li>		
					</ul>
			<form:form id="searchForm" modelAttribute="taskPlan" action="${ctx}/task/taskQuotaPlan/findByType" method="post" class="breadcrumb form-search">
				<ul class="search">
					<li>
		               <form:input path="taskDesc" value="${searchKey }" htmlEscape="false" maxlength="200" class="input-medium" placeholder="关键字"/>
		            </li>
		            <li>
			            <select id="taskType" name="taskType">
							<option <c:if test="${taskType!='2'}"> selected=selected</c:if> value="1">任务型</option>
							<option <c:if test="${taskType=='2'}"> selected=selected</c:if> value="2">指标型</option>
						</select>
		            </li>
					<li><input id="btnSubmit" class="search-btn" type="submit" value="查询" /></li>
				</ul>
			</form:form>
			</div>	
				
			<sys:message content="${message}"/>
			<form:form id="inputForm" modelAttribute="taskPlan" action="" method="post" class="form-horizontal magbtm0">
			<input type="hidden" name="taskType" value="${taskType }">
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
								<th type="text"  class="input-medium" name="oneLevelPlan" id="oneLevelPlan">一级计划</th>
								<th type="text"   class="input-medium" name="twoLevelPlan" id="twoLevelPlan">二级计划</th>
								<th type="text"   class="input-medium" name="taskDesc" id="taskDesc">任务</th>
								<th type="text"   class="input-medium" name="responsiblePerson" id="responsiblePerson">责任人</th>
								<th type="text"   class="input-medium" name="reviewDeptId" id="reviewDeptId">复评部门</th>
								<th type="text"  readonly="readonly" onclick="timeinput()" class="input-medium Wdate" name="planFinishTime" id="planFinishTime">计划完成时间</th>
								<th type="text"  readonly="readonly" onclick="timeinput()" class="input-medium Wdate" name="finishTimeAdjust1" id="finishTimeAdjust1">完成时间调整1</th>
								<th type="text"  readonly="readonly" onclick="timeinput()" class="input-medium Wdate" name="finishTimeAdjust2" id="finishTimeAdjust2">完成时间调整2</th>
								<th type="text"  readonly="readonly" onclick="timeinput()" class="input-medium Wdate" name="actualFinishTime" id="actualFinishTime">实际完成时间</th>
								<th type="text"    class="input-medium" name="finishReview" id="finishReview">完成情况复评</th>
								<th type="text"    class="input-medium" name="summaryRemarks" id="summaryRemarks">计划总结备注</th>
								<th type="text"    class="input-medium" name="earlyWarning" id="earlyWarning">预警</th>
								<th name="icon" id="icon" copy="th-copy">
									<!-- <span class="icon-envelope-alt" style="cursor: pointer;" title="邮件提醒"></span>
									<span class=" icon-comments-alt" style="padding-left: 10px;cursor: pointer;" title="对话"></span> -->
									<span class="icon-plus" style="padding-left: 10px;cursor: pointer;" title="创建个人管控任务"></span>
									<span class="icon-bell" style="padding-left: 10px;cursor: pointer;" title="预警提醒"></span>
								</th>
							</tr>
						</thead>
						<c:if test="${flag eq 'add'}">
							<tbody id="subProjectList"  copy="false">
							</tbody>
						</c:if>
						<c:if test="${flag eq 'view'}"> 
							<tbody id="subProjectList"  copy="false">
								<c:forEach items="${page.list}" var="subProject" varStatus="idx" >
									<tr list="taskList" index="${idx.index}">
										<td type="hidden" name="taskList[${idx.index}].id" value="${subProject.id}" class="hide"></td>
										<td type="hidden" name="taskList[${idx.index}].deptId" value="${subProject.deptId}" class="hide"></td>
										<td class="check">
											<input type="checkbox" name="chktaskPlan" id="${subProject.id}" name="taskList[${idx.index}].id" value="${subProject.id}">
										</td>
										<td class="updateTaskPlan" name="taskList[${idx.index}].icon" id="icon">
										<c:choose>
											<c:when test="${subProject.groupConcern eq '1' }">
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
										<td type="text" class="input-medium updateTaskPlan" name="taskList[${idx.index}].oneLevelPlan" id="oneLevelPlan">${subProject.oneLevelPlan}</td>
										<td type="text"  class="input-medium updateTaskPlan" name="taskList[${idx.index}].twoLevelPlan" id="twoLevelPlan">${subProject.twoLevelPlan}</td>
										<td type="text"  class="input-medium updateTaskPlan" name="taskList[${idx.index}].taskDesc" id="taskDesc">${subProject.taskDesc}</td>
										<td type="text"  class="input-medium updateTaskPlan" name="taskList[${idx.index}].responsiblePerson" id="responsiblePerson">${subProject.responsiblePerson}</td>
										<td type="text"  class="input-medium updateTaskPlan" name="taskList[${idx.index}].reviewDeptId" id="reviewDeptId">${subProject.reviewDeptId}</td>
										<td type="text" readonly="readonly"  onclick="timeinput()" class="input-medium Wdate updateTaskPlan" name="taskList[${idx.index}].planFinishTime" id="planFinishTime">${subProject.planFinishTime}</td>
										<td type="text" readonly="readonly"  onclick="timeinput()" class="input-medium Wdate updateTaskPlan" name="taskList[${idx.index}].finishTimeAdjust1" id="finishTimeAdjust1">${subProject.finishTimeAdjust1}</td>
										<td type="text" readonly="readonly"  onclick="timeinput()" class="input-medium Wdate updateTaskPlan" name="taskList[${idx.index}].finishTimeAdjust2" id="finishTimeAdjust2">${subProject.finishTimeAdjust2}</td>
										<td type="text" readonly="readonly"  onclick="timeinput()" class="input-medium Wdate updateTaskPlan" name="taskList[${idx.index}].actualFinishTime" id="actualFinishTime">${subProject.actualFinishTime}</td>
										<td type="text"  class="input-medium updateTaskPlan" name="taskList[${idx.index}].finishReview" id="finishReview">${subProject.finishReview}</td>
										<td type="text"  class="input-medium updateTaskPlan" name="taskList[${idx.index}].summaryRemarks" id="summaryRemarks">${subProject.summaryRemarks}</td>
										<td type="text"  class="input-medium updateTaskPlan" name="taskList[${idx.index}].earlyWarning" id="earlyWarning">${subProject.earlyWarning}</td>
										<td class="updateTaskPlan" name="taskList[${idx.index}].icon" id="icon">
											<!-- <span class="icon-envelope-alt"  style="cursor: pointer;" title="邮件提醒"></span>
											<span class="icon-comments-alt"  style="padding-left: 10px;cursor: pointer;" title="对话"></span> -->
											<c:choose>
												<c:when test="${subProject.subTask=='1' }">
													<span class="icon-plus-sign-alt" style="padding-left: 10px;cursor: pointer;" name="setSubTask" id="${subProject.id}"  status="${subProject.subTask}" title="查看个人管控任务"></span>
												</c:when>
												<c:otherwise>
													<span class="icon-plus" style="padding-left: 10px;cursor: pointer;" name="setSubTask" id="${subProject.id}"  status="${subProject.subTask}" title="创建个人管控任务"></span>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${subProject.earlyWarning=='1' }">
													<span class="icon-bell-alt" name="setWarm" id="${subProject.id}"  status="${subProject.earlyWarning}" style="padding-left: 10px;cursor: pointer;" title="预警提示"></span>
												</c:when>
												<c:otherwise>
													<span class="icon-bell" name="setWarm" id="${subProject.id}"  status="${subProject.earlyWarning}" style="padding-left: 10px;cursor: pointer;" title="预警提示"></span>
												</c:otherwise>
											</c:choose>
										</td>
									 </tr>
						 		</c:forEach>
							</tbody>
						 </c:if>
					</table>
				</div>
			</form:form>
		</div>


</body>
</html>