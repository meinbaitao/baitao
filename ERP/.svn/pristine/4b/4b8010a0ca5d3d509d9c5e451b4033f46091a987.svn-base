<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>编辑周报</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/activitiHeader.jsp"%>
	<script type="text/javascript" src="${ctxStatic }/jquery-plugin/multiselect/js/multiselect.min.js"></script>
	<script type="text/javascript" src="${ctxStatic }/modules/report/weekly/projectWeeklyReport.js?tsf=${jsVersion}" ></script>
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
			</shiro:hasAnyRoles>
		</ul>
		<div class="clear"></div>
	</div>
	<div class="form-content">
		<form:form id="inputForm" modelAttribute="projWeeklyReport" action="${ctx}/report/weekly/mainly/projWeeklyReport/save" method="post" class="form-horizontal magbtm0">
			<span id="hiddenFiledsContainer">
				<form:hidden path="weekSerialNum" />
				<form:hidden path="transferedBuildings" id="transferedBuildings" />
				<form:hidden path="unTransferBuildings" id="unTransferBuildings" />
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


			<div class="table_scroll">
				<table id="contentTable" class="table table-striped table-bordered table-condensed  table-eidt">

					<!-- 表格标题 -->
					<jsp:include page="building-schedule-head.jsp" />

					<tbody id="buildingSchedules"  copy="false">
						<c:forEach items="${buildingSchedules}" var="buildingSchedule" varStatus="idx" >
							<tr list="buildingSchedules" index="${idx.index}" id="buildingSchedules_tr_${fn:replace(buildingSchedule.buildNo, '#', '')}">
								<td  name="buildingSchedules[${idx.index}].jiaContractNo" id="buildingSchedules[${idx.index}].jiaContractNo" >
										<input type="text" class="input45" name="buildingSchedules[${idx.index}].jiaContractNo" id="buildingSchedules[${idx.index}].jiaContractNo" value="${buildingSchedule.jiaContractNo}" readonly="readonly" />
								</td>
								<td name="buildingSchedules[${idx.index}].district" id="buildingSchedules[${idx.index}].district">
									<input type="text" class="input45" name="buildingSchedules[${idx.index}].district" id="buildingSchedules[${idx.index}].district" value="${buildingSchedule.district}" readonly="readonly" />
								</td>
								<td name="buildingSchedules[${idx.index}].buildingDisplayName" id="buildingSchedules[${idx.index}].buildingDisplayName" >
									<input type="text" class="input45" name="buildingSchedules[${idx.index}].buildingDisplayName" id="buildingSchedules[${idx.index}].buildingDisplayName" value="${buildingSchedule.buildingDisplayName}" readonly="readonly" />
								</td>
								<td name="buildingSchedules[${idx.index}].workGroupGj" id="buildingSchedules[${idx.index}].workGroupGj">
									<input type="text" class="input45 required" name="buildingSchedules[${idx.index}].workGroupGj" id="buildingSchedules[${idx.index}].workGroupGj" value="${buildingSchedule.workGroupGj}" />
								</td>
								<td name="buildingSchedules[${idx.index}].workGroupSc" id="buildingSchedules[${idx.index}].workGroupSc">
									<input type="text" class="input45 required" name="buildingSchedules[${idx.index}].workGroupSc" id="buildingSchedules[${idx.index}].workGroupSc" value="${buildingSchedule.workGroupSc}" />
								</td>
								<td name="buildingSchedules[${idx.index}].peopleNumberGj" id="buildingSchedules[${idx.index}].peopleNumberGj">
									<input type="text" class="input45 required number" name="buildingSchedules[${idx.index}].peopleNumberGj" id="buildingSchedules[${idx.index}].peopleNumberGj" value="${buildingSchedule.peopleNumberGj}" />
								</td>
								<td  name="buildingSchedules[${idx.index}].peopleNumberSc" id="buildingSchedules[${idx.index}].peopleNumberSc">
									<input type="text" class="input45 required number" name="buildingSchedules[${idx.index}].peopleNumberSc" id="buildingSchedules[${idx.index}].peopleNumberSc" value="${buildingSchedule.peopleNumberSc}" />
								</td>
								<td name="buildingSchedules[${idx.index}].projectAmount" id="buildingSchedules[${idx.index}].projectAmount" >
									<input type="text" class="input45" name="buildingSchedules[${idx.index}].projectAmount" id="buildingSchedules[${idx.index}].projectAmount" value="${buildingSchedule.projectAmount}" readonly="readonly" />
								</td>
								<td name="buildingSchedules[${idx.index}].transferTimeGj" id="buildingSchedules[${idx.index}].transferTimeGj">
									<input type="text" readonly="readonly" onclick="timeinput()" class="input85 required Wdate"  name="buildingSchedules[${idx.index}].transferTimeGj" id="buildingSchedules[${idx.index}].transferTimeGj" value="<fmt:formatDate value="${buildingSchedule.transferTimeGj}" pattern="yyyy-MM-dd" />"  />
								</td>
								<td name="buildingSchedules[${idx.index}].transferTimeSc" id="buildingSchedules[${idx.index}].transferTimeSc">
									<input type="text" readonly="readonly" onclick="timeinput()" class="input85 required Wdate"  name="buildingSchedules[${idx.index}].transferTimeSc" id="buildingSchedules[${idx.index}].transferTimeSc" value="<fmt:formatDate value="${buildingSchedule.transferTimeSc}" pattern="yyyy-MM-dd" />"  />
								</td>
								<td name="buildingSchedules[${idx.index}].planFinishRateGj" id="buildingSchedules[${idx.index}].planFinishRateGj" >
									<input type="text" class="input45" name="buildingSchedules[${idx.index}].nwFinishRateGj" id="buildingSchedules[${idx.index}].nwFinishRateGj" value="${buildingSchedule.nwFinishRateGj}" readonly="readonly" />
								</td>
								<td name="buildingSchedules[${idx.index}].planFinishRateSc" id="buildingSchedules[${idx.index}].planFinishRateSc" >
									<input type="text" class="input45" name="buildingSchedules[${idx.index}].nwFinishRateSc" id="buildingSchedules[${idx.index}].nwFinishRateSc" value="${buildingSchedule.nwFinishRateSc}" readonly="readonly" />
								</td>
								<td name="buildingSchedules[${idx.index}].factFinishRateGj" id="buildingSchedules[${idx.index}].factFinishRateGj">
									<input type="text" class="input45 required number"  name="buildingSchedules[${idx.index}].factFinishRateGj" id="buildingSchedules[${idx.index}].factFinishRateGj" value="${buildingSchedule.factFinishRateGj}" />
								</td>
								<td name="buildingSchedules[${idx.index}].factFinishRateSc" id="buildingSchedules[${idx.index}].factFinishRateSc">
									<input type="text" class="input45 required number"  name="buildingSchedules[${idx.index}].factFinishRateSc" id="buildingSchedules[${idx.index}].factFinishRateSc" value="${buildingSchedule.factFinishRateSc}" />
								</td>
								<td  name="buildingSchedules[${idx.index}].nwFinishRateGj" id="buildingSchedules[${idx.index}].nwFinishRateGj">
									<input type="text" class="input45 required number"  name="buildingSchedules[${idx.index}].nwFinishRateGj" id="buildingSchedules[${idx.index}].nwFinishRateGj" value="${buildingSchedule.nwFinishRateGj}" />
								</td>
								<td  name="buildingSchedules[${idx.index}].nwFinishRateSc" id="buildingSchedules[${idx.index}].nwFinishRateSc">
									<input type="text" class="input45 required number"  name="buildingSchedules[${idx.index}].nwFinishRateSc" id="buildingSchedules[${idx.index}].nwFinishRateSc" value="${buildingSchedule.nwFinishRateSc}" />
								</td>
								<td  name="buildingSchedules[${idx.index}].productionValue" id="buildingSchedules[${idx.index}].productionValue" >
									<input type="text" class="input45" readonly="readonly" name="buildingSchedules[${idx.index}].productionValue" id="buildingSchedules[${idx.index}].productionValue" value="${buildingSchedule.productionValue}" />
								</td>
								<td name="buildingSchedules[${idx.index}].proValueSchedule" id="buildingSchedules[${idx.index}].proValueSchedule" >
									<input type="text" class="input45" readonly="readonly" name="buildingSchedules[${idx.index}].proValueSchedule" id="buildingSchedules[${idx.index}].proValueSchedule" value="${buildingSchedule.proValueSchedule}" />
								</td>
								<td class="hide"  name="buildingSchedules[${idx.index}].contractNo" id="buildingSchedules[${idx.index}].contractNo" >
									<input type="hidden" class="hide" name="buildingSchedules[${idx.index}].contractNo" id="buildingSchedules[${idx.index}].contractNo" value="${buildingSchedule.contractNo}"  />
								</td>
								<td class="hide"  name="buildingSchedules[${idx.index}].buildNo" id="buildingSchedules[${idx.index}].buildNo" >
									<input type="hidden" class="hide" name="buildingSchedules[${idx.index}].buildNo" id="buildingSchedules[${idx.index}].buildNo" value="${buildingSchedule.buildNo}"  />
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