<%@ page pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>申请延期</title>
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
		$("#delayTask").live("click",function(){
			var falg = $("input[name='chktaskPlan']").is(':checked');
			var ids ="";
			if(falg){
				window.confirmx('确认要申请该计划吗？',function(){
					var lists =$("input[name='chktaskPlan']:checked");
					$.each(lists, function(idx,item){
					    $(this).parents("tr").find("input.Wdate").addClass("required");
						ids =ids+item.id+",";
					});
					if(ids){
						ids=ids.substring(0,ids.lastIndexOf(","));
						$("#inputForm").attr("action",startUp.getRootPath()+"/a/task/delayTask/setDelay?ids="+ids);
						$("#inputForm").submit();
					}
				});
			}else{
				window.alertx("请选择需要申请的计划!");
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
						<li><input id="delayTask" class="btn btn-primary" type="button" value="提交延期"></li>
					</ul>
			<form:form id="searchForm" modelAttribute="taskPlan" action="${ctx}/task/delayTask/list" method="post" class="breadcrumb form-search">
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
								<th>一级计划</th>
								<th>二级计划</th>
								<th>任务</th>
								<th>责任人</th>
								<th>复评部门</th>
								<th>计划完成时间</th>
								<th>完成时间调整1</th>
								<th>完成时间调整2</th>
								<th>实际完成时间</th>
								<th>完成情况复评</th>
								<th>计划总结备注</th>
								<th>计划状态</th>
							</tr>
						</thead>
					
							<tbody >
								<c:forEach items="${page.list}" var="subProject" varStatus="idx" >
									<input type="hidden" id="${subProject.id}" name="taskList[${idx.index}].id" value="${subProject.id}">
									<tr list="taskList" index="${idx.index}">
										<td class="check">
											<input type="checkbox" name="chktaskPlan" id="${subProject.id}" name="taskList[${idx.index}].id" value="${subProject.id}">
										</td>
										<td class="updateTaskPlan" id="icon">
										<c:choose>
											<c:when test="${subProject.groupConcern eq '1' }">
												<span class="icon-star"  style="cursor: pointer;" title="集团关注"></span>
											</c:when>
											<c:otherwise>
												<span class="icon-star-empty"  style="cursor: pointer;" title="集团关注"></span>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${subProject.longTermTask==1 }">
												<span class="icon-bookmark"  style="padding-left: 10px;cursor: pointer;" title="长期任务"></span>
											</c:when>
											<c:otherwise>
												<span class="icon-bookmark-empty"  style="padding-left: 10px;cursor: pointer;" title="长期任务"></span>
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
										<%-- <td>${subProject.responsiblePerson}</td>
										<td>${subProject.reviewDeptId}</td> --%>
										<td>${subProject.planFinishTime}</td>
											<c:choose>
												<c:when test="${empty subProject.finishTimeAdjust1}">
													<td><input type="text"  id="finishTimeAdjust1${idx.index}" name="taskList[${idx.index}].finishTimeAdjust1"  readonly="readonly"  onclick="timeinput()"  class="input-medium Wdate updateTaskPlan"></td>
													<td>${subProject.finishTimeAdjust2}</td>
												</c:when>
												<c:otherwise>
													<td>${subProject.finishTimeAdjust1}</td>
													<td><input type="text"  id="finishTimeAdjust2${idx.index}" name="taskList[${idx.index}].finishTimeAdjust2"  readonly="readonly"  onclick="timeinput()"  class="input-medium Wdate updateTaskPlan"></td>
												</c:otherwise>
											</c:choose>
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
						 		</c:forEach>
							</tbody>
					</table>
				</div>
			</form:form>
		</div>


</body>
</html>