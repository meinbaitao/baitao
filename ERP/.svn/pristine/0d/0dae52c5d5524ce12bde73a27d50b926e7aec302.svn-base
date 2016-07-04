<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>编辑周报</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/activitiHeader.jsp"%>
	<script type="text/javascript" src="${ctxStatic }/jquery-plugin/multiselect/js/multiselect.min.js"></script>
	<script type="text/javascript" src="${ctxStatic }/modules/report/weekly/projectWeeklyReport.js?tsf=${jsVersion}" ></script>
	<script src="${ctxStatic}/common/activiti/flowCommonController.js?tsf=${jsVersion}" type="text/javascript"></script>
	<style type="text/css">
		#buildingInfoContainer{
			margin-top:20px;}
		#buildingInfoContainer #multiselect{
			float:right;
		}
	</style>
	<script type="text/javascript">
		$(document).ready(function() {
			$(document).ready(function() {form_validate("inputForm"); });
		});
	</script>
</head>

<body>
<div class="list-content" >
	<div class="nav-operate" >
		<ul class="operationg-new" >
			<li>
				<input id="btnCancel" class="btn btn-primary" type="button" value="返 回" onclick="history.go(-1)"/>
			</li>
			<shiro:hasAnyRoles name="${fns:getWhitelistsList('xmzb')}">
			<li class="editBtn">
				<input type="button" name="editBtn" id="editBtn" class="btn btn-primary" value="保存"/>
			</li>
			<li class="startWorkflow">
				<input type="button" name="startWorkflow" id="startWorkflow" class="btn btn-primary" value="提交"/>
			</li>
			</shiro:hasAnyRoles>
			<li class="signWorkflow">
				<input type="button" name="signWorkflow" id="signWorkflow" class="btn btn-primary" value="签收"/>
			</li>
			<li class="okWorkflow">
				<input type="button" name="okWorkflow" id="okWorkflow" class="btn btn-primary" value="通过"/>
			</li>
			<li class="retrunWorkflow">
				<input type="button" name="retrunWorkflow" id="retrunWorkflow" class="btn btn-primary" value="驳回"/>
			</li>
			<li class="showWorkflowImg">
				<input type="button" name="showWorkflowImg" id="showWorkflowImg" class="btn btn-primary" value="流程图"/>
			</li>
			<li class="showWorkflowAuditHistory">
				<input type="button" name="showWorkflowAuditHistory" id="showWorkflowAuditHistory" class="btn btn-primary" value="流程轨迹"/>
			</li>
		</ul>
		<div class="clear"></div>
	</div>
	<div class="form-content">
		<form:form id="inputForm" modelAttribute="projWeeklyReport" action="${ctx}/report/weekly/mainly/projWeeklyReport/edit" method="post" class="form-horizontal magbtm0">
			<span id="hiddenFiledsContainer">
				<form:hidden path="id" id="reportId" />
				<form:hidden path="workflowid" />
				<form:hidden path="workflowstatus" />
				<form:hidden path="weekSerialNum" />
				<form:hidden path="transferedBuildings" id="transferedBuildings" />
				<form:hidden path="unTransferBuildings" id="unTransferBuildings" />
				<input type="hidden" name="flag" id="flag" value="edit" />
				<input type="hidden" id="managementPageUrl" value="${ctx}/report/weekly/mainly/projWeeklyReport/projectList" />
			</span>
			<span id="transferedBuildingsContainer"></span>
			<span id="unTransferBuildingsContainer"></span>
			<span id="buildingScheduleDeletedIdsContainer"></span>

			<!-- 周报主题信息 -->
			<jsp:include page="main-info-subpage.jsp" />


			<!-- 填写未移交楼栋计划移交时间 -->
			<%@ include file="untransferBuildingSubPage.jsp" %>


			<!-- 在建进度土建信息  -->
			<div class="nav-operate" >
				<h5>在建进度信息</h5>
			</div>

			<c:set var="actionFlag" value="edit" scope="request" />
			<div class="table_scroll">
				<table id="contentTable" class="table table-striped table-bordered table-condensed  table-eidt">

					<!-- 表格标题 -->
					<jsp:include page="building-schedule-head.jsp" />

					<tbody id="buildingSchedules"  copy="false">
						<c:forEach items="${buildingSchedules}" var="buildingSchedule" varStatus="idx" >
							<tr list="buildingSchedules" index="${idx.index}" id="buildingSchedules_tr_${fn:replace(buildingSchedule.buildNo, '#', '')}">
								<td type="text" class="input45"  name="buildingSchedules[${idx.index}].jiaContractNo" id="buildingSchedules[${idx.index}].jiaContractNo" readonly="readonly">
										${buildingSchedule.jiaContractNo}
								</td>
								<td type="text" class="input45" name="buildingSchedules[${idx.index}].district" id="buildingSchedules[${idx.index}].district" readonly="readonly">
										${buildingSchedule.district}
								</td>
								<td type="text" class="input45" name="buildingSchedules[${idx.index}].buildingDisplayName" id="buildingSchedules[${idx.index}].buildingDisplayName" readonly="readonly">
										${buildingSchedule.buildingDisplayName}
								</td>
								<td type="text" class="input45 required" name="buildingSchedules[${idx.index}].workGroupGj" id="buildingSchedules[${idx.index}].workGroupGj">
										${buildingSchedule.workGroupGj}
								</td>
								<td type="text" class="input45 required" name="buildingSchedules[${idx.index}].workGroupSc" id="buildingSchedules[${idx.index}].workGroupSc">
										${buildingSchedule.workGroupSc}
								</td>
								<td type="text" class="input45 required number" name="buildingSchedules[${idx.index}].peopleNumberGj" id="buildingSchedules[${idx.index}].peopleNumberGj">
										${buildingSchedule.peopleNumberGj}
								</td>
								<td type="text" class="input45 required number" name="buildingSchedules[${idx.index}].peopleNumberSc" id="buildingSchedules[${idx.index}].peopleNumberSc">
										${buildingSchedule.peopleNumberSc}
								</td>
								<td type="text" class="input45" name="buildingSchedules[${idx.index}].projectAmount" id="buildingSchedules[${idx.index}].projectAmount" readonly="readonly">
										${buildingSchedule.projectAmount}
								</td>
								<td type="text" readonly="readonly" onclick="timeinput()" class="input85 required Wdate" name="buildingSchedules[${idx.index}].transferTimeGj" id="buildingSchedules[${idx.index}].transferTimeGj">
									<fmt:formatDate value="${buildingSchedule.transferTimeGj}" pattern="yyyy-MM-dd" />
								</td>
								<td type="text" readonly="readonly" onclick="timeinput()" class="input85 required Wdate" name="buildingSchedules[${idx.index}].transferTimeSc" id="buildingSchedules[${idx.index}].transferTimeSc">
									<fmt:formatDate value="${buildingSchedule.transferTimeSc}" pattern="yyyy-MM-dd" />
								</td>
								<td type="text" class="input45" name="buildingSchedules[${idx.index}].planFinishRateGj" id="buildingSchedules[${idx.index}].planFinishRateGj" readonly="readonly">
										${buildingSchedule.nwFinishRateGj}
								</td>
								<td type="text" class="input45" name="buildingSchedules[${idx.index}].planFinishRateSc" id="buildingSchedules[${idx.index}].planFinishRateSc" readonly="readonly">
										${buildingSchedule.nwFinishRateSc}
								</td>
								<td type="text" class="input45 required number" name="buildingSchedules[${idx.index}].factFinishRateGj" id="buildingSchedules[${idx.index}].factFinishRateGj">
									${buildingSchedule.factFinishRateGj}
								</td>
								<td type="text" class="input45 required number" name="buildingSchedules[${idx.index}].factFinishRateSc" id="buildingSchedules[${idx.index}].factFinishRateSc">
								    ${buildingSchedule.factFinishRateSc}
								</td>
								<td type="text" class="input45 required number" name="buildingSchedules[${idx.index}].nwFinishRateGj" id="buildingSchedules[${idx.index}].nwFinishRateGj">
									${buildingSchedule.nwFinishRateGj}
								</td>
								<td type="text" class="input45 required number" name="buildingSchedules[${idx.index}].nwFinishRateSc" id="buildingSchedules[${idx.index}].nwFinishRateSc">
								    ${buildingSchedule.nwFinishRateSc}
								</td>
								<td type="text" class="input45" name="buildingSchedules[${idx.index}].productionValue" id="buildingSchedules[${idx.index}].productionValue" readonly="readonly">
								    ${buildingSchedule.productionValue}
								</td>
								<td type="text" class="input45" name="buildingSchedules[${idx.index}].proValueSchedule" id="buildingSchedules[${idx.index}].proValueSchedule" readonly="readonly">
								    ${buildingSchedule.proValueSchedule}
								</td>
								<td>
								<c:choose>
									<c:when test="${empty projWeeklyReport.workflowid and not empty buildingSchedule.id}">
								<shiro:hasAnyRoles name="${fns:getWhitelistsList('xmzb')}">
										<a href="${ctx}/report/weekly/buildingSchedule/initUploadPage/${buildingSchedule.id}">上传进度图</a>
								</shiro:hasAnyRoles>
									</c:when>
									<c:otherwise>
										<a href="${ctx}/report/weekly/buildingSchedule/buildingImagesView/${buildingSchedule.id}">查看进度图</a>
									</c:otherwise>
								</c:choose>
								</td>
								<td class="hide" type="hidden" name="buildingSchedules[${idx.index}].id" id="buildingSchedules[${idx.index}].id" value="${buildingSchedule.id}">${buildingSchedule.id}</td>
								<td class="hide" type="hidden" name="buildingSchedules[${idx.index}].reportId" id="buildingSchedules[${idx.index}].reportId" value="${buildingSchedule.reportId}">${buildingSchedule.reportId}</td>
								<td class="hide" type="hidden" name="buildingSchedules[${idx.index}].contractNo" id="buildingSchedules[${idx.index}].contractNo" value="${buildingSchedule.contractNo}" >
										${buildingSchedule.contractNo}
								</td>
								<td class="hide" type="hidden" name="buildingSchedules[${idx.index}].buildNo" id="buildingSchedules[${idx.index}].buildNo" value="${buildingSchedule.buildNo}" >
										${buildingSchedule.buildNo}
								</td>
								<td class="hide"  name="buildingSchedules[${idx.index}].planTransferDate" id="buildingSchedules[${idx.index}].planTransferDate" >
									<input type="hidden" class="hide" name="buildingSchedules[${idx.index}].planTransferDate" id="buildingSchedules[${idx.index}].planTransferDate" value="${buildingSchedule.planFinishDate}"  />
								</td>
								<td class="hide"  name="buildingSchedules[${idx.index}].planFinishDate" id="buildingSchedules[${idx.index}].planFinishDate" >
									<input type="hidden" class="hide" name="buildingSchedules[${idx.index}].planFinishDate" id="buildingSchedules[${idx.index}].planFinishDate" value="${buildingSchedule.planFinishDate}"  />
								</td>
								<td class="hide"  name="buildingSchedules[${idx.index}].memberCount" id="buildingSchedules[${idx.index}].memberCount" >
									<input type="hidden" class="hide" name="buildingSchedules[${idx.index}].memberCount" id="buildingSchedules[${idx.index}].memberCount" value="${buildingSchedule.memberCount}"  />
								</td>
								<td class="hide"  name="buildingSchedules[${idx.index}].hurry" id="buildingSchedules[${idx.index}].hurry" >
									<input type="hidden" class="hide" name="buildingSchedules[${idx.index}].hurry" id="buildingSchedules[${idx.index}].hurry" value="${buildingSchedule.hurry}"  />
								</td>
								<td class="hide"  name="buildingSchedules[${idx.index}].subsidy" id="buildingSchedules[${idx.index}].subsidy" >
									<input type="hidden" class="hide" name="buildingSchedules[${idx.index}].subsidy" id="buildingSchedules[${idx.index}].subsidy" value="${buildingSchedule.subsidy}"  />
								</td>
							</tr>
						</c:forEach>
					</tbody>


				</table>
			</div>
			<div class="hr_60">
			</div> </form:form>

	</div>



</body>
</html>