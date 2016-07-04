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
		
		
		$("#repeatTeak").live("click",function(){
			var falg = $("input[name='chktaskQuotaPlan']").is(':checked');
			var allChecked = $("input[name='chktaskQuotaPlan']");
			var ids ="";
			if(falg){
				window.confirmx('确认要申请该计划吗？',function(){
					var lists =$("input[name='chktaskQuotaPlan']:checked");
					$.each(lists, function(idx,item){
						$(this).parents("tr").find("input.work").addClass("required");
						ids =ids+item.id+",";
					});
					if(ids){
						ids=ids.substring(0,ids.lastIndexOf(","));
						$("#inputForm").attr("action",startUp.getRootPath()+"/a/task/repeatTeak/setTaskQuotaPlanDelay?ids="+ids);
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

<div class="list-content">
	<div class="nav-operate">
		<ul class="operationg-new">
			<li><input id="repeatTeak" class="btn btn-primary" type="button" value="提交复评"></li>
		</ul>
		<form:form id="searchForm" modelAttribute="taskQuotaPlan" action="${ctx}/task/repeatTeak/findByType" method="post" class="breadcrumb form-search">
			<ul class="search">
				<li><form:input path="quotaDesc" htmlEscape="false"
						maxlength="200" value="${searchKey }" class="input-medium" placeholder="关键字" /></li>
				<li>
			            <select id="taskType" name="taskType">
							<option <c:if test="${taskType!='1'}"> selected=selected</c:if> value="1">任务型</option>
							<option <c:if test="${taskType=='2'}"> selected=selected</c:if> value="2">指标型</option>
						</select>
		        </li>
				<li class="btns"><input id="btnSubmit" class="search-btn" type="submit" value="查询" /></li>
			</ul>
		</form:form>
	</div>
	<sys:message content="${message}" />
		<form:form id="inputForm" modelAttribute="taskQuotaPlan" action="" method="post" class="form-horizontal magbtm0">
			<input type="hidden" name="deptId" id="deptId" value="${officeId }">
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
								<th >月份</th>
								<th >指标项</th>
								<th >权重(%)</th>
								<th >指标说明</th>
								<th >责任人</th>
								<th >复评部门</th>
								<th >实际完成工作量</th>
								<th >得分</th>
								<th >备注信息</th>
								<th >计划状态</th>
							</tr>
						</thead>
							<tbody id="subProjectList"  copy="false">
								<!-- <input type="hidden" name="delId" id="delId" value=""> -->
								<c:forEach items="${page.list}" var="subProject" varStatus="idx" >
									<tr list="taskQuotaPlanList" index="${idx.index}">
										<input type="hidden" name="taskQuotaPlanList[${idx.index}].id" value="${subProject.id}"/>
										<td class="check">
											<input type="checkbox"  name="chktaskQuotaPlan" id="${subProject.id}" value="${subProject.id}">
										</td>
										<td class="updateTaskPlan" name="taskQuotaPlanList[${idx.index}].icon" id="icon">
											<c:choose>
												<c:when test="${subProject.groupConcern==1 }">
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
													<span class="icon-comment"  style="padding-left: 10px;cursor: pointer;" title="讨论建议"></span>
												</c:when>
												<c:otherwise>
													<span class="icon-comment-alt"  style="padding-left: 10px;cursor: pointer;" title="讨论建议"></span>
												</c:otherwise>
											</c:choose>
										</td>
										<td >${subProject.taskMonth}</td>
										<td >${subProject.quotas}</td>
										<td >${subProject.weight}</td>
										<td >${subProject.quotaDesc}</td>
										<td>${subProject.showPerson}</td>
										<td>${subProject.showDept}</td>
										<%-- <td >${subProject.responsiblePerson}</td>
										<td >${subProject.reviewDeptId}</td> --%>
										<c:choose>
											<c:when test="${!empty subProject.actualFinishQuantity}">
												<td >${subProject.actualFinishQuantity}</td>
												<td >${subProject.goal}</td>
												<td >${subProject.summaryRemarks}</td>
											</c:when>
											<c:otherwise>
												<td><input type="text"  class="input-medium work" name="taskQuotaPlanList[${idx.index}].actualFinishQuantity" maxlength="64" id="actualFinishQuantity${idx.index}" ></td>
												<td>${subProject.goal}</td>
												<td><input type="text"  class="input-medium" name="taskQuotaPlanList[${idx.index}].summaryRemarks" id="summaryRemarks" maxlength="200"></td>
											</c:otherwise>
										</c:choose>
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