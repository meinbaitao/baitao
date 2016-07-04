<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>指标型计划信息列表</title>
	<meta name="decorator" content="default"/>
	
	<style type="text/css">
	    html{overflow:hidden;}
	    body{overflow:hidden;}
	    td{
		white-space:nowrap;
		overflow: hidden;
	}
	</style>
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
	<script type="text/javascript" src="${ctxStatic}/modules/task/adminTaskQuotaInfo.js"></script>
</head>
<body>

<div class="list-content">
	<div class="nav-operate">
		<ul class="operationg-new">
			<li><input id="tr_add" class="btn btn-primary saveTaskQuotaPlan" type="button" value="创建计划"></li>
			<li><input id="saveProject" class="btn btn-primary" type="button" value="保存"></li>
			<li><input id="deleteTaskQuotaPlan" class="btn btn-primary" type="button" value="删除"></li>
			<li><input id="submitTaskQuotaPlan" class="btn btn-primary" type="button" value="提交"></li>
		</ul>
		<form:form id="searchForm" modelAttribute="taskQuotaPlan"
			action="${ctx}/task/adminPlan/findByOffice/${officeId}/${taskType}" method="post"
			class="breadcrumb form-search">
			<input id="pageNo" name="pageNo" type="hidden"
				value="${page.pageNo}" />
			<input id="pageSize" name="pageSize" type="hidden"
				value="${page.pageSize}" />
			<ul class="search">
				<li>
					<select id="taskMonth" class="input-medium taskMonthVal" style="width: 100px;" name="taskMonth">
					</select>
				</li>
				<li><form:input path="quotaDesc" htmlEscape="false"
						maxlength="200" value="${searchKey }" class="input-medium" placeholder="关键字" /></li>
				<li class="btns"><input id="btnSubmit" class="search-btn"
					type="submit" value="查询" /></li>
				<li class="clearfix"></li>
			</ul>
		</form:form>
	</div>
	<sys:message content="${message}" />
		<form:form id="inputForm" modelAttribute="taskQuotaPlan" action="" method="post" class="form-horizontal magbtm0">
			<input type="hidden" name="deptId" id="deptId" value="${officeId }">
			<input type="hidden" id="monthToday" name="monthToday" value="${thisMonth}">
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
								<th type="text"  readonly="readonly" class="input-medium required taskMonth" name="taskMonth" id="taskMonth" maxlength="50">月份</th>
								<th type="text"  class="input-medium" name="quotas" id="quotas" maxlength="200">指标项</th>
								<th type="text"  class="input-medium required" name="weight" id="weight" maxlength="60">权重(%)</th>
								<th type="text"  class="input-medium required" name="quotaDesc" id="quotaDesc" maxlength="500">指标说明</th>
								<th type="select" status="1"  class="input-medium required" name="responsiblePerson" id="responsiblePerson" empty="true">责任人</th>
								<th type="select" status="2" class="input-medium required" name="reviewDeptId" id="reviewDeptId" empty="true">复评部门</th>
								<th  name="actualFinishQuantity" id="actualFinishQuantity" maxlength="64">实际完成工作量</th>
								<th  name="goal" id="goal">得分</th>
								<th  name="summaryRemarks" id="summaryRemarks" maxlength="200">备注信息</th>
								<th  name="status" id="status">计划状态</th>
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
								<!-- <input type="hidden" name="delId" id="delId" value=""> -->
								<c:forEach items="${page.list}" var="subProject" varStatus="idx" >
								
										<c:choose>
											<c:when test="${subProject.status=='0'}">
												<tr list="taskQuotaPlanList" index="${idx.index}">
													<td type="hidden" name="taskQuotaPlanList[${idx.index}].id" value="${subProject.id}" class="hide"></td>
													<td type="hidden" name="taskQuotaPlanList[${idx.index}].deptId" value="${subProject.deptId}" class="hide"></td>
													<td class="check">
														<input type="checkbox"  name="chktaskQuotaPlan" id="${subProject.id}" name="taskQuotaPlanList[${idx.index}].id" value="${subProject.id}">
													</td>
													<td class="updateTaskPlan" name="taskQuotaPlanList[${idx.index}].icon" id="icon">
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
													<td type="text" readonly="readonly" class="input-medium updateTaskQuotaPlan required" name="taskQuotaPlanList[${idx.index}].taskMonth" id="taskMonth" maxlength="50">${subProject.taskMonth}</td>
													<td type="text" class="input-medium updateTaskQuotaPlan" name="taskQuotaPlanList[${idx.index}].quotas" id="quotas" maxlength="200">${subProject.quotas}</td>
													<td type="text"  class="input-medium updateTaskQuotaPlan required" name="taskQuotaPlanList[${idx.index}].weight" id="weight" maxlength="60">${subProject.weight}</td>
													<td type="text"  class="input-medium updateTaskQuotaPlan required" name="taskQuotaPlanList[${idx.index}].quotaDesc" id="quotaDesc" maxlength="500">${subProject.quotaDesc}</td>
													<td type="select" status="1"  class="input-medium updateTaskQuotaPlan required" name="taskQuotaPlanList[${idx.index}].responsiblePerson" id="responsiblePerson" value="${subProject.responsiblePerson}">${subProject.showPerson}</td>
													<td type="select" status="2" class="input-medium updateTaskQuotaPlan required" name="taskQuotaPlanList[${idx.index}].reviewDeptId" id="reviewDeptId" value="${subProject.reviewDeptId}">${subProject.showDept}</td>
													<td  name="taskQuotaPlanList[${idx.index}].actualFinishQuantity" id="actualFinishQuantity" maxlength="64">${subProject.actualFinishQuantity}</td>
													<td  name="taskQuotaPlanList[${idx.index}].goal" id="goal">${subProject.goal}</td>
													<td  name="taskQuotaPlanList[${idx.index}].summaryRemarks" id="summaryRemarks" maxlength="200">${subProject.summaryRemarks}</td>
													<td  name="taskQuotaPlanList[${idx.index}].status" id="status">草稿</td>
													<%-- <td class="updateTaskPlan" name="taskList[${idx.index}].icon" id="icon">
														<span class="icon-envelope-alt"  style="cursor: pointer;" title="邮件提醒"></span>
														<span class="icon-comments-alt"  style="padding-left: 10px;cursor: pointer;" title="对话"></span>
													</td> --%>
												 </tr>
											</c:when>
											
											<c:when test="${empty subProject.status}">
												<tr list="taskQuotaPlanList" index="${idx.index}">
													<td type="hidden" name="taskQuotaPlanList[${idx.index}].id" value="${subProject.id}" class="hide"></td>
													<td type="hidden" name="taskQuotaPlanList[${idx.index}].deptId" value="${subProject.deptId}" class="hide"></td>
													<td class="check">
														<input type="checkbox"  name="chktaskQuotaPlan" id="${subProject.id}" name="taskQuotaPlanList[${idx.index}].id" value="${subProject.id}">
													</td>
													<td class="updateTaskPlan" name="taskQuotaPlanList[${idx.index}].icon" id="icon">
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
													<td type="text" readonly="readonly" class="input-medium updateTaskQuotaPlan required" name="taskQuotaPlanList[${idx.index}].taskMonth" id="taskMonth" maxlength="50">${subProject.taskMonth}</td>
													<td type="text" class="input-medium updateTaskQuotaPlan" name="taskQuotaPlanList[${idx.index}].quotas" id="quotas" maxlength="200">${subProject.quotas}</td>
													<td type="text"  class="input-medium updateTaskQuotaPlan required" name="taskQuotaPlanList[${idx.index}].weight" id="weight" maxlength="60">${subProject.weight}</td>
													<td type="text"  class="input-medium updateTaskQuotaPlan required" name="taskQuotaPlanList[${idx.index}].quotaDesc" id="quotaDesc" maxlength="500">${subProject.quotaDesc}</td>
													<td type="select" status="1"  class="input-medium updateTaskQuotaPlan required" name="taskQuotaPlanList[${idx.index}].responsiblePerson" id="responsiblePerson" value="${subProject.responsiblePerson}">${subProject.showPerson}</td>
													<td type="select" status="2" class="input-medium updateTaskQuotaPlan required" name="taskQuotaPlanList[${idx.index}].reviewDeptId" id="reviewDeptId" value="${subProject.reviewDeptId}">${subProject.showDept}</td>
													<td  name="taskQuotaPlanList[${idx.index}].actualFinishQuantity" id="actualFinishQuantity" maxlength="64">${subProject.actualFinishQuantity}</td>
													<td  name="taskQuotaPlanList[${idx.index}].goal" id="goal">${subProject.goal}</td>
													<td  name="taskQuotaPlanList[${idx.index}].summaryRemarks" id="summaryRemarks" maxlength="200">${subProject.summaryRemarks}</td>
													<td  name="taskQuotaPlanList[${idx.index}].status" id="status">草稿</td>
												 </tr>
											</c:when>
											
											
											<c:otherwise>
												<tr>
													<td></td>
													<td >
														<c:choose>
															<c:when test="${subProject.groupConcern==1 }">
																<span class="icon-star"  title="集团关注"></span>
															</c:when>
															<c:otherwise>
																<span class="icon-star-empty"   title="集团关注"></span>
															</c:otherwise>
														</c:choose>
														<c:choose>
															<c:when test="${subProject.longTermTask==1 }">
																<span class="icon-bookmark" style="padding-left: 10px;cursor: pointer;" title="长期任务"></span>
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
													<td >${subProject.taskMonth}</td>
													<td >${subProject.quotas}</td>
													<td >${subProject.weight}</td>
													<td >${subProject.quotaDesc}</td>
													<td >${subProject.showPerson}</td>
													<td >${subProject.showDept}</td>
													<td >${subProject.actualFinishQuantity}</td>
													<td >${subProject.goal}</td>
													<td >${subProject.summaryRemarks}</td>
													<td >
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
						<c:if test="${!empty page.list }">
						<tfoot>
							<tr>
							    <th class="all-check"  >
									<label>汇总</label>
							    </th>
								<th type="text"  class="input-medium" ></th>
								<th type="text"  class="input-medium" ></th>
								<th type="text"  class="input-medium" ></th>
								<th type="text"  class="input-medium">${weightCount }</th>
								<th type="text"  class="input-medium"></th>
								<th type="text"  class="input-medium"></th>
								<th type="text"  class="input-medium"></th>
								<th type="text"  class="input-medium"></th>
								<th type="text"  class="input-medium">${scoreCount }</th>
								<th type="text"  class="input-medium"></th>
								<th type="text"  class="input-medium"></th>
							</tr>
						</tfoot>
						</c:if>
					</table>
				</div>
		</form:form>
	</div>
								
								
</body>
</html>