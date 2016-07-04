<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>项目劳务待调配总览表（报表）</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }

	</script>
</head>
<body>
	<div class="list-content" >
		<div class="nav-operate" >
			<ul class="operationg-new" >
		    </ul>
	        <form:form id="searchForm" modelAttribute="laborReport" action="${ctx}/report/labor/list" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        <ul class="search">
		            <%-- <li>
		               <input type="text" name="project.code" value="${laborReport.project.code }" maxlength="200" class="input-mini" placeholder="项目简称"/>
		               <input type="text" name="subproject.buildingDisplayName" value="${laborReport.subproject.buildingDisplayName }" maxlength="200" class="input-mini" placeholder="楼栋"/>
		               <input type="text" name="subproject.planStartDate" value="${laborReport.subproject.planStartDate }" class="input-mini Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" placeholder="项目进场时间" />
		               <input type="text" name="subproject.planEndDate" value="${laborReport.subproject.planEndDate }" class="input-mini Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" placeholder="项目完工时间" />
		               &nbsp;&nbsp;
		               	是否赶工：<c:forEach items="${fns:getDictList('yes_no')}" var="obj" varStatus="index">
		               		<!-- or (obj.value eq '1' and empty laborReport.buildingSchedule.hurry) -->
			              	<input ${(laborReport.buildingSchedule.hurry eq obj.value )?'checked="checked"':'' } 
			              		name="buildingSchedule.hurry" type="radio" value="${obj.value }" >${obj.label }
			            </c:forEach>
			          	&nbsp;&nbsp;
			          	 住宿补贴：<c:forEach items="${fns:getDictList('yes_no')}" var="obj" varStatus="index">
			          	 	<!-- or (obj.value eq '1' and empty laborReport.buildingSchedule.subsidy) -->
			              	<input ${(laborReport.buildingSchedule.subsidy eq obj.value )?'checked="checked"':'' } 
			              		name="buildingSchedule.subsidy" type="radio" value="${obj.value }" >${obj.label }
			            </c:forEach>
		            </li> --%>
		            <li>
		               <input type="text" name="keyWord" value="${laborReport.keyWord }" maxlength="200" class="input-medium" placeholder="关键字"/>
		            </li>
		            <li>
		            	<input id="searchProject" type="submit" name="查询" value="查询" class="search-btn"/>
		            </li>
		        </ul>
		       <div class="clearfix"></div>
		     </form:form>
		     <div class="clear"></div>
	     </div>
	     <div id="scroll-table"  >
	 	<div id="scroll-head">
		</div>
		<div id="tbody-scroll" class="tbody-scroll">
		  <table id="contentTable" class="table table-striped table-bordered table-condensed resize tree_table">
				<!-- <thead>
				   <tr>
						<th>项目名称</th>
						<th>项目简称</th>
						<th>栋号</th>
						<th>户型</th>
						<th>骨架劳务施工面积</th>
						<th>骨架已分配面积</th>
						<th>骨架未分配面积</th>
						<th>石材劳务施工面积</th>
						<th>石材已分配面积</th>
						<th>石材未分配面积</th>
						<th>其它施工面积</th>
						<th>项目计划进场时间</th>
						<th>项目计划完工时间</th>
						<th>周报计划进场时间</th>
						<th>周报计划完工时间</th>
						<th>预计工期</th>
						<th>是否已移交</th>
						<th>骨架总进度</th>
						<th>石材总进度</th>
						<th>人数</th>
						<th>赶工</th>
						<th>住宿补贴</th>
					</tr>
				</thead> -->
				<thead>
				   <tr>
						<td>项目名称</td>
						<td>项目简称</td>
						<td>栋号</td>
						<td>户型</td>
						<td>劳务施工面积</td>
						<td>骨架已分配面积</td>
						<td>骨架未分配面积</td>
						<td>石材已分配面积</td>
						<td>石材未分配面积</td>
						<td>其它施工面积</td>
						<td>项目计划进场时间</td>
						<td>项目计划完工时间</td>
						<td>周报计划进场时间</td>
						<td>周报计划完工时间</td>
						<td>预计工期</td>
						<td>是否已移交</td>
						<td>骨架总进度(%)</td>
						<td>石材总进度(%)</td>
						<td>人数</td>
						<td>赶工</td>
						<td>住宿补贴</td>
					</tr>
				</thead>
			<tbody>
				<c:forEach items="${page.list}" var="obj" varStatus="1">
					<tr >
						<td>${obj.project.name}</td>
						<td>${obj.project.code}</td>
						<td>${obj.subproject.buildingDisplayName}</td>
						<td>${obj.subproject.houseType}</td>
						<td>${obj.houseType.laborArea}</td>
						<td>${obj.laborcontract.boneArea}</td>
						<td>${obj.houseType.laborArea-obj.laborcontract.boneArea}</td>
						<td>${obj.laborcontract.stoneArea}</td>
						<td>${obj.houseType.laborArea-obj.laborcontract.stoneArea}</td>
						<td>${obj.laborcontract.otherArea}</td>
						<td>${obj.subproject.planStartDate}</td>
						<td>${obj.subproject.planEndDate}</td>
						<td><fmt:formatDate value="${obj.buildingSchedule.planTransferDate}" pattern="yyyy-MM-dd"/></td>
						<td><fmt:formatDate value="${obj.buildingSchedule.planFinishDate}" pattern="yyyy-MM-dd"/></td>
						<td>${obj.extraData.expectDay}</td>
						<td>${not empty obj.buildingSchedule.id?'是':'否'}</td><!-- 没有在建进度信息则视为未移交 -->
						<td>${obj.buildingSchedule.factFinishRateGj}</td>
						<td>${obj.buildingSchedule.factFinishRateSc}</td>
						<td>${obj.buildingSchedule.memberCount}</td>
						<td>${empty obj.buildingSchedule.id?'':obj.buildingSchedule.hurry==1?'是':'否'}</td>
						<td>${empty obj.buildingSchedule.id?'':obj.buildingSchedule.subsidy==1?'是':'否'}</td>
					 </tr>
				 </c:forEach>
				</tbody>
			</table>
	</div>
	</div>
	</div>
<div class="pagination">${page}</div>

</body>
</html>