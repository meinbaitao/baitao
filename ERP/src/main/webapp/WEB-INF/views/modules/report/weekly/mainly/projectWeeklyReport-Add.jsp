<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>添加周报</title>
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

		  <tbody id="buildingSchedules"  copy="false"></tbody>



		</table>
		</div>
		<div class="hr_60">
		</div> </form:form>

  </div>



</body>
</html>