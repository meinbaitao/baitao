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
	<script type="text/javascript" src="${ctxStatic}/modules/task/personTaskQuotaInfo.js"></script>
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

		<div class="list-content">
			<div class="nav-operate">
				<ul class="operationg-new">
					<li><input id="tr_add" class="btn btn-primary saveTaskQuotaPlan" type="button" value="创建计划"></li>
					<li><input id="saveProject" class="btn btn-primary" type="button" value="保存"></li>
					<li><input id="deleteTaskQuotaPlan" class="btn btn-primary" type="button" value="删除"></li>
				</ul>
				<form:form id="searchForm" modelAttribute="taskQuotaPlan"
					action="${ctx}/task/taskQuotaPlan/findByType" method="post"
					class="breadcrumb form-search">
					
					<ul class="search">
						<li><form:input path="quotaDesc" htmlEscape="false"
								maxlength="200" value="${searchKey }" class="input-medium" placeholder="关键字" /></li>
						<li>
							<select id="taskType" name="taskType">
								<option <c:if test="${taskType!='2'}"> selected=selected</c:if> value="1">任务型</option>
								<option <c:if test="${taskType=='2'}"> selected=selected</c:if> value="2">指标型</option>
							</select>
						</li>
						<li class="btns"><input id="btnSubmit" class="search-btn"
							type="submit" value="查询" /></li>
						<li class="clearfix"></li>
					</ul>
				</form:form>
			</div>
			<sys:message content="${message}" />
				<form:form id="inputForm" modelAttribute="taskQuotaPlan" action="" method="post" class="form-horizontal magbtm0">
				<input type="hidden" name="taskType" value="${taskType }">
					<div class="table_scroll">
						  <table id="contentTable" class="table table-striped table-bordered table-condensed  table-eidt">
								<thead>
								   <tr list="taskQuotaPlanList">
									    <th class="all-check"  >
											<input type="checkbox" id="all-check">
									    </th>
									    <th name="icon" id="icon" copy="th-copy">
											<span class="icon-star-empty" style="cursor: pointer;" title="集团关注"></span>
											<span class="icon-bookmark-empty" style="padding-left: 10px;cursor: pointer;" title="长期任务"></span>
											<span class="icon-comment-alt" style="padding-left: 10px;cursor: pointer;" title="讨论建议"></span>
										</th>
										<th type="text"  class="input-medium" name="taskMonth" id="taskMonth">月份</th>
										<th type="text"  class="input-medium" name="quotas" id="quotas">指标项</th>
										<th type="text"  class="input-medium" name="weight" id="weight">权重</th>
										<th type="text"  class="input-medium" name="quotaDesc" id="quotaDesc">指标说明</th>
										<th type="text"  class="input-medium" name="responsiblePerson" id="responsiblePerson">责任人</th>
										<th type="text" class="input-medium" name="reviewDeptId" id="reviewDeptId">复评部门</th>
										<th type="text" class="input-medium" name="actualFinishQuantity" id="actualFinishQuantity">实际完成工作量</th>
										<th type="text"  class="input-medium" name="goal" id="goal">得分</th>
										<th type="text"  class="input-medium" name="summaryRemarks" id="summaryRemarks">备注信息</th>
										<!-- <th name="icon" id="icon" copy="th-copy">
											<span class="icon-envelope-alt" style="cursor: pointer;" title="邮件提醒"></span>
											<span class=" icon-comments-alt" style="padding-left: 10px;cursor: pointer;" title="对话"></span>
										</th> -->
									</tr>
								</thead>
								<c:if test="${flag eq 'add'}">
									<tbody id="subProjectList"  copy="false">
									</tbody>
								</c:if>
								 <c:if test="${flag eq 'view'}">
									<tbody id="subProjectList"  copy="false">
										<c:forEach items="${page.list}" var="subProject" varStatus="idx" >
											<tr list="taskQuotaPlanList" index="${idx.index}">
												<td type="hidden" name="taskQuotaPlanList[${idx.index}].id" value="${subProject.id}" class="hide"></td>
												<td type="hidden" name="taskQuotaPlanList[${idx.index}].deptId" value="${subProject.deptId}" class="hide"></td>
												<td class="check">
													<input type="checkbox"  name="chktaskQuotaPlan" id="${subProject.id}" name="taskQuotaPlanList[${idx.index}].id" value="${subProject.id}">
												</td>
												<td name="taskQuotaPlanList[${idx.index}].icon" id="icon">
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
												<td type="text"  class="input-medium updateTaskQuotaPlan" name="taskQuotaPlanList[${idx.index}].taskMonth" id="taskMonth">${subProject.taskMonth}</td>
												<td type="text"  class="input-medium updateTaskQuotaPlan" name="taskQuotaPlanList[${idx.index}].quotas" id="quotas">${subProject.quotas}</td>
												<td type="text"  class="input-medium updateTaskQuotaPlan" name="taskQuotaPlanList[${idx.index}].weight" id="weight">${subProject.weight}</td>
												<td type="text"  class="input-medium updateTaskQuotaPlan" name="taskQuotaPlanList[${idx.index}].quotaDesc" id="quotaDesc">${subProject.quotaDesc}</td>
												<td type="text"  class="input-medium updateTaskQuotaPlan" name="taskQuotaPlanList[${idx.index}].responsiblePerson" id="responsiblePerson">${subProject.responsiblePerson}</td>
												<td type="text"  class="input-medium updateTaskQuotaPlan" name="taskQuotaPlanList[${idx.index}].reviewDeptId" id="reviewDeptId">${subProject.reviewDeptId}</td>
												<td type="text"  class="input-medium updateTaskQuotaPlan" name="taskQuotaPlanList[${idx.index}].actualFinishQuantity" id="actualFinishQuantity">${subProject.actualFinishQuantity}</td>
												<td type="text"  class="input-medium updateTaskQuotaPlan" name="taskQuotaPlanList[${idx.index}].goal" id="goal">${subProject.goal}</td>
												<td type="text"  class="input-medium updateTaskQuotaPlan" name="taskQuotaPlanList[${idx.index}].summaryRemarks" id="summaryRemarks">${subProject.summaryRemarks}</td>
												<%-- <td class="updateTaskPlan" name="taskList[${idx.index}].icon" id="icon">
													<span class="icon-envelope-alt"  style="cursor: pointer;" title="邮件提醒"></span>
													<span class="icon-comments-alt"  style="padding-left: 10px;cursor: pointer;" title="对话"></span>
												</td> --%>
											 </tr>
								 		</c:forEach>
									</tbody>
								</c:if>
								<c:if test="${!empty page.list }">
								<tfoot>
									<tr list="taskQuotaPlanList">
									    <th class="all-check"  >
											<label for="all-check">汇总</label>
									    </th>
										<th type="text"></th>
										<th type="text"></th>
										<th type="text"></th>
										<th type="text">${weightCount }</th>
										<th type="text"></th>
										<th type="text"></th>
										<th type="text"></th>
										<th type="text"></th>
										<th type="text">${scoreCount }</th>
										<th type="text"></th>
									</tr>
								</tfoot>
								</c:if>
							</table>
						</div>
				</form:form>
			</div>
</body>
</html>