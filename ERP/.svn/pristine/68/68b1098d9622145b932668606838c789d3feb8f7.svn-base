<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>项目添加</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/activitiHeader.jsp"%>
	<script src="${ctxStatic}/modules/project/scripts/project.js?tsf=${jsVersion}" type="text/javascript"></script>
	<script type="text/javascript">
	/*
		$(document).ready(function() {
			$("#editBtn").click(function(){
				var data=table_eidt_data();
				console.log(data);
			})
		});
	*/
	$(document).ready(function() {form_validate("inputForm"); });
	</script>
</head>
<body>
  <div class="list-content" >
      <div class="nav-operate" >
		<ul class="operationg-new" >
			<li>
				<input id="btnCancel" class="btn btn-primary" type="button" value="返 回" onclick="history.go(-1)"/>
			</li>
			<li class="editBtn">
				<input type="button" name="editBtn" id="editBtn" class="btn btn-primary" value="保存"/>
			</li>
	    </ul>
	     <div class="clear"></div>
      </div>
     <div class="form-content">
	  <form:form id="inputForm" modelAttribute="project" action="${ctx}/project/updateby" method="post" class="form-horizontal magbtm0"> 
		<ul>
       	  <li>
             <span class="tab-name">项目名称：</span>
             <label>
             	 <input type="hidden" name="id" id="projectId" value="${project.id}"/>	
                 <form:input path="name" id="projectName" htmlEscape="false" maxlength="200" class="input-medium required" value="" disabled="true"/>
             </label>
          </li>
          <li>
             <span class="tab-name">项目简称：</span>
             <label>
                  <form:input path="code" id="code" htmlEscape="false" maxlength="200" class="input-medium required" value="" disabled="true"/>
             </label>
          </li>
          <li>
             <span class="tab-name">苑区：</span>
             <label>
                 <form:input path="location" id="location" htmlEscape="false" maxlength="50" class="input-medium required" value="" disabled="true"/>
             </label>
          </li>
          
          <li>
             <span class="tab-name">省：</span>
             <label>
                 <select name="province" class="input-medium required "  id="province" disabled="true">
                 	<option value="${project.province}">===请选择===</option>
                 	
				 </select>
             </label>
          </li>
		  <li>
             <span class="tab-name">市：</span>
             <label>
                 <select name="city" id="city" class="input-medium required  " id="city" disabled="true">
                     <option value="${project.city}">===请选择===</option>
                 </select>
             </label>
          </li>
          <li>
             <span class="tab-name">县区：</span>
             <label>
                 <select name="town" id="town" class="input-medium" disabled="true">
                    <option value="${project.town}">===请选择===</option>
                 </select>
             </label>
          </li>
          
           <li>
             <span class="tab-name">业务板块：</span>
             <label>
                 <form:select id="businessLine" path="businessLine" class="input-medium" tabindex="-1" disabled="true">
					<form:options items="${fns:getDictList('business_plate_type')}" itemValue="value" itemLabel="label" htmlEscape="false"/>
				</form:select>
             </label>
          </li>
           <li>
             <span class="tab-name">计划开工时间：</span>
             <label>
             	  <input name="startTime" id="startTime" value="${project.startTime}" type="text" readonly="readonly"  maxlength="20" class="input-medium Wdate " onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" disabled="true"/>
             </label>
          </li>
           <li>
             <span class="tab-name">计划完工时间：</span>
             <label>
             	<input name="endTime" id="endTime" value="${project.endTime}" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate " onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" disabled="true"/>
             </label>
          </li>
            <li>                          
             <span class="tab-name">项目负责人：</span>
             <label>
             	<form:select disabled="true" name="projectManagerBid" id="projectManagerBid" path="projectManagerBid" class="input-medium required">
             		<option id="-1"></option>
				 	<c:forEach items="${fns:selByCondition('xmfzr')}" var="obj" varStatus="idxStatus">
						 <option value="${fns:escapeHtml(obj.userID)}" <c:if test="${obj.userID==project.projectManagerBid}">selected="selected"</c:if>>${fns:escapeHtml(obj.userName)}</option>
				 	</c:forEach>
				 </form:select>
             </label>
          </li>
           <li>
             <span class="tab-name">运营主管：</span>
             <label>
             	 <form:select disabled="true" id="coordinatorLeaderBid" path="coordinatorLeaderBid" class="input-medium" tabindex="-1">
             	 	<option id="-1"></option>
				 	<c:forEach items="${fns:selByCondition('yyzg')}" var="obj" varStatus="idxStatus">
						 <option value="${fns:escapeHtml(obj.userID)}" <c:if test="${obj.userID==project.coordinatorLeaderBid}">selected="selected"</c:if>>${fns:escapeHtml(obj.userName)}</option>
				 	</c:forEach>
				 </form:select>
             </label>
          </li>
           <li>
             <span class="tab-name">区域经理：</span>
             <label>
                  <form:select disabled="true" id="regionalManagerBid" path="regionalManagerBid" class="input-medium required" tabindex="-1">
                  	<option id="-1"></option>
				 	<c:forEach items="${fns:selByCondition('qyjl')}" var="obj" varStatus="idxStatus">
						 <option value="${fns:escapeHtml(obj.userID)}" <c:if test="${obj.userID==project.regionalManagerBid}">selected="selected"</c:if>>${fns:escapeHtml(obj.userName)}</option>
				 	</c:forEach>
				 </form:select>
             </label>
          </li>
          <li>
             <span class="tab-name">运营经理：</span>
             <label>
             	 <form:select disabled="true" id="pcDirectorBid" path="pcDirectorBid" class="input-medium" tabindex="-1">
             	 	<option id="-1"></option>
				 	<c:forEach items="${fns:selByCondition('yyjl')}" var="obj" varStatus="idxStatus">
						 <option value="${fns:escapeHtml(obj.userID)}" <c:if test="${obj.userID==project.pcDirectorBid}">selected="selected"</c:if>>${fns:escapeHtml(obj.userName)}</option>
				 	</c:forEach>
				 </form:select>
             </label>
          </li>
          <li>
             <span class="tab-name">运营专员：</span>
             <label>
             	 <form:select  disabled="true" id="operationSpecialistBid" path="operationSpecialistBid" class="input-medium" tabindex="-1">
             	 	<option id="-1"></option>
				 	<c:forEach items="${fns:selByCondition('yyzy')}" var="obj" varStatus="idxStatus">
						 <option value="${fns:escapeHtml(obj.userID)}" <c:if test="${obj.userID==project.operationSpecialistBid}">selected="selected"</c:if>>${fns:escapeHtml(obj.userName)}</option>
				 	</c:forEach>
				 </form:select>
             </label>
          </li>
          <li>
             <span class="tab-name">材料员：</span>
             <label>
             	<form:select disabled="true" id="materialStaffBid" path="materialStaffBid" class="input-medium required" tabindex="-1">
             		<option id="-1"></option>
				 	<c:forEach items="${fns:selByCondition('cly')}" var="obj" varStatus="idxStatus">
						 <option value="${fns:escapeHtml(obj.userID)}" <c:if test="${obj.userID==project.materialStaffBid}">selected="selected"</c:if>>${fns:escapeHtml(obj.userName)}</option>
				 	</c:forEach>
				 </form:select>
             </label>
          </li>
          <li>
             <span class="tab-name">施工员：</span>
             <label>
                 <form:select disabled="true" id="constructStaffBid" path="constructStaffBid" class="input-medium" tabindex="-1">
                 	<option id="-1"></option>
				 	<c:forEach items="${fns:selByCondition('sgy')}" var="obj" varStatus="idxStatus">
						 <option value="${fns:escapeHtml(obj.userID)}" <c:if test="${obj.userID==project.constructStaffBid}">selected="selected"</c:if>>${fns:escapeHtml(obj.userName)}</option>
				 	</c:forEach>
				 </form:select>
             </label>
          </li>
          <li>
             <span class="tab-name">行政专员：</span>
             <label>
             	 <form:select disabled="true" id="adminstaffbid" path="adminstaffbid" class="input-medium" tabindex="-1">
             	 	<option id="-1"></option>
				 	<c:forEach items="${fns:selByCondition('xzzy')}" var="obj" varStatus="idxStatus">
						 <option value="${fns:escapeHtml(obj.userID)}" <c:if test="${obj.userID==project.adminstaffbid}">selected="selected"</c:if>>${fns:escapeHtml(obj.userName)}</option>
				 	</c:forEach>
				 </form:select>
             </label>
          </li>
          <li>
             <span class="tab-name">项目地址：</span>
             <label>
                  <form:input disabled="true" path="address" id="address" htmlEscape="false" maxlength="200" class="input-medium required" value=""/>
             </label>
          </li>
		</ul>	
		
	   <div class="nav-operate" >
		<ul class="operationg-new" >
			<li id="tr_add"><span class="glyphicon glyphicon-plus"></span>添行</li>
			<li id="tr_project_del"><span class="glyphicon glyphicon-remove"></span>删行</li>
	    </ul>
	   </div>

	 <div id="scroll-table">
		<div id="scroll-head">
		</div>
		<div id="tbody-scroll"  class="tbody-scroll">
	    <table id="contentTable" class="table table-striped table-bordered table-condensed  table-eidt table-tab">
			<thead>
			   <tr list="subList">
				    <th class="all-check"  >
						<input type="checkbox" id="all-check">
						<label for="all-check">选择</label>
				    </th>
				    <th type="text" class="input100" name="jiaContractNum" id="jiaContractNum">甲方合同号</th>
					<th type="text" class="required input80" name="houseType" id="houseType">户型<font color="red">*</font></th>
					<th type="text" class="required input80" name="building" id="building">楼栋<font color="red">*</font></th>
					<th type="text" class="required input60 number" name="areaofStone" id="areaofStone" value="0">预估挂石面积<font color="red">*</font></th>
					<th type="text" class="required input60 number" name="stoneActualArea" id="stoneActualArea" value="0">实际挂石面积<font color="red">*</font></th>
					<th type="select" class="required input100" name="materialId" id="materialId" tag="stone_variety">石材品种<font color="red">*</font></th>
					<th type="text" class="required input60 number" name="estimateRevenue" id="estimateRevenue" value="0">各栋预计产值<font color="red">*</font></th>
					<th type="text" readonly="readonly" onclick="timeinput()" class="input95 Wdate" name="planStartDate" id="planStartDate">计划开始时间</th>
					<th type="text" readonly="readonly" onclick="timeinput()" class="input95 Wdate" name="planEndDate" id="planEndDate">计划完成时间</th>
					<th type="text" readonly="readonly" onclick="timeinput()" class="input95 Wdate" name="designStartDate" id="designStartDate">设计图纸</th>
					<th type="text" readonly="readonly" onclick="timeinput()" class="input95 Wdate" name="stoneOrderDate" id="stoneOrderDate">石材下单</th>
					<th type="text" readonly="readonly" onclick="timeinput()" class="input95 Wdate" name="skeletonOrderDate" id="skeletonOrderDate">骨架类材料下单</th>
					<th type="text" readonly="readonly" onclick="timeinput()" class="input95 Wdate" name="pendantOrderDate" id="pendantOrderDate">挂件类材料下单</th>
					<th type="text" readonly="readonly" onclick="timeinput()" class="input95 Wdate" name="stoneExpectDate" id="stoneExpectDate">石材要求到货</th>
					<th type="text" readonly="readonly" onclick="timeinput()" class="input95 Wdate" name="skeletonExpectDate" id="skeletonExpectDate">骨架类材料要求到货</th>
					<th type="text" readonly="readonly" onclick="timeinput()" class="input95 Wdate" name="pendantExpectDate" id="pendantExpectDate">挂件类材料要求到货</th>
					<th type="select" class="required input100" name="type" id="type" tag="building_type">类别<font color="red">*</font></th>
					<th type="select" class="required input120" name="status" id="status" tag="subproject_type">状态<font color="red">*</font></th>
				</tr>
			</thead>
				<tbody id="subProjectList"  copy="false">
					<input type="hidden" name="delId" id="delId" value="">
					<c:forEach items="${project.subList}" var="subProject" varStatus="idx" >
						<tr list="subList" index="${idx.index}">
							<td type="hidden" name="subList[${idx.index}].id" value="${subProject.id}" class="hide"></td>
							<td class="check">
								<input type="checkbox" id="${subProject.id}" name="subList[${idx.index}].id" value="${subProject.id}">
							</td>
							<td type="text" class="input100" name="subList[${idx.index}].jiaContractNum" id="subList[${idx.index}].jiaContractNum">${subProject.jiaContractNum}</td>
							<td type="text" class="required input80" name="subList[${idx.index}].houseType" id="subList[${idx.index}].houseType">
								${subProject.houseType}
							</td>
							<td type="text" class="required input80" name="subList[${idx.index}].building" id="subList[${idx.index}].building">
								${subProject.building}
							</td>
							<td type="text" class="required input60 number" name="subList[${idx.index}].areaofStone" id="subList[${idx.index}].areaofStone">${subProject.areaofStone}</td>
							<td type="text" class="required input60 number" name="subList[${idx.index}].stoneActualArea" id="subList[${idx.index}].stoneActualArea">${subProject.stoneActualArea}</td>
							<td type="select" class="required input100"  name="subList[${idx.index}].materialId" value="${subProject.materialId}" tag="stone_variety">${subProject.showMaterial}</td>
							<td type="text" class="required input60 number" name="subList[${idx.index}].estimateRevenue" id="estimateRevenue">${subProject.estimateRevenue}</td>
							<td type="text" readonly="readonly" onclick="timeinput()" class="input95 Wdate" name="subList[${idx.index}].planStartDate" id="planStartDate">${subProject.planStartDate}</td>
							<td type="text" readonly="readonly" onclick="timeinput()" class="input95 Wdate" name="subList[${idx.index}].planEndDate" id="planEndDate">${subProject.planEndDate}</td>
							<td type="text" readonly="readonly" onclick="timeinput()" class="input95 Wdate" name="subList[${idx.index}].designStartDate" id="designStartDate">${subProject.designStartDate}</td>
							<td type="text" readonly="readonly" onclick="timeinput()" class="input95 Wdate" name="subList[${idx.index}].stoneOrderDate" id="stoneOrderDate">${subProject.stoneOrderDate}</td>
							<td type="text" readonly="readonly" onclick="timeinput()" class="input95 Wdate" name="subList[${idx.index}].skeletonOrderDate" id="skeletonOrderDate">${subProject.skeletonOrderDate}</td>
							<td type="text" readonly="readonly" onclick="timeinput()" class="input95 Wdate" name="subList[${idx.index}].pendantOrderDate" id="pendantOrderDate">${subProject.pendantOrderDate}</td>
							<td type="text" readonly="readonly" onclick="timeinput()" class="input95 Wdate" name="subList[${idx.index}].stoneExpectDate" id="stoneExpectDate">${subProject.stoneExpectDate}</td>
							<td type="text" readonly="readonly" onclick="timeinput()" class="input95 Wdate" name="subList[${idx.index}].skeletonExpectDate" id="skeletonExpectDate">${subProject.skeletonExpectDate}</td>
							<td type="text" readonly="readonly" onclick="timeinput()" class="input95 Wdate" name="subList[${idx.index}].pendantExpectDate" id="pendantExpectDate">${subProject.pendantExpectDate}</td>
							<td type="select" class="required input100"  name="subList[${idx.index}].type" value="${subProject.type}" tag="building_type">${subProject.showType}</td>
							<td type="select" class="required input120" name="subList[${idx.index}].status" value="${subProject.status}" tag="subproject_type">${subProject.showStatus}</td>
						 </tr>
			 		</c:forEach>
				</tbody>
		</table>
		</div>
		</div>
		<div class="hr_60">
		</div>
	 </form:form>
  </div>
</body>
</html>