<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<ul >
  <li >
    <span class="tab-name">项目名称：</span>
    <label>
      ${project.name}
    </label>
    <form:hidden path="projectId" />
    <input type="hidden" id="district" value="${project.location}" />
  </li>
  <li >
    <span class="tab-name ">项目负责人：</span>
    <label>
      ${projWeeklyReport.projResponsPeopleName}
      <form:hidden path="projReponsPeople"   />
    </label>
  </li>
  <li >
    <span class="tab-name">合同额：</span>
    <label>
      <input type="text" id="contractTotalMoney" name="contractTotalMoney" readonly="readonly"
             class="input115" value="<fmt:formatNumber groupingUsed="false" value="${projWeeklyReport.contractTotalMoney}" />" />
    </label>
  </li>
  <li >
    <span class="tab-name">周报日期：</span>
    <label>
      <fmt:formatDate value="${projWeeklyReport.reportBeginDate}" pattern="yyyy-MM-dd" />
      -
      <fmt:formatDate value="${projWeeklyReport.reportEndDate}" pattern="yyyy-MM-dd" />
    </label>
    <input type="hidden" id="reportBeginDate" name="reportBeginDate" value="<fmt:formatDate value="${projWeeklyReport.reportBeginDate}" pattern="yyyy-MM-dd" />" />
    <input type="hidden" id="reportEndDate" name="reportEndDate" value="<fmt:formatDate value="${projWeeklyReport.reportEndDate}" pattern="yyyy-MM-dd" />" />
  </li>


  <li >
    <span class="tab-name">计划开工时间：</span>
    <label>
      <form:input path="planStartDate" id="planStartDate" readonly="true" class="input115" />
    </label>
  </li>
  <li >
    <span class="tab-name">计划完工时间：</span>
    <label>
      <form:input path="planFinishDate" id="planFinishDate" readonly="true" class="input115" />
    </label>
  </li>
  <li >
    <span class="tab-name">实际开工时间：</span>
    <label>
      <form:input path="factStartDate" id="factStartDate" readonly="true" onclick="timeinput()" cssClass="input115 required Wdate" />
    </label>
  </li>

  <li >
    <span class="tab-name">实际完工日期：</span>
    <label>
      <form:input path="factFinishDate" id="factFinishDate" readonly="true" onclick="timeinput()" cssClass="input115 Wdate" />
    </label>
  </li>
  <li >
    <span class="tab-name ">累计申请进度款（元）：</span>
    <label>
      <form:input path="accuApplyMoney" id="accuApplyMoney" class="input115 number" />
    </label>
  </li>
  <li >
    <span class="tab-name ">累计申请进度款比例(%)：</span>
    <label>
      <form:input path="accuApplyMoneyRate" id="accuApplyMoneyRate" readonly="true" class="input115" />
    </label>
  </li>
  <li >
    <span class="tab-name">累计产值（元）：</span>
    <label>
      <%-- <form:input path="accuOutputValue" id="accuOutputValue" readonly="true" class="input115" /> --%>
      <input type="text" name="accuOutputValue" id="accuOutputValue" readonly="true" class="input115" value="<fmt:formatNumber value='${projWeeklyReport.accuOutputValue}' pattern='####.##'></fmt:formatNumber>" />
    </label>
  </li>
  <li >
    <span class="tab-name">累计签证（份)：</span>
    <label>
      <form:input path="accuSignature" id="accuSignature" class="input115 required" />
    </label>
  </li>


  <li class="all-line autoHeight">
    <!-- 土建信息 -->
    <div id="buildingInfoContainer" >
      <div class="row row-fluid">
        <div class="span3" style="margin-left: 20px;">
          <div><div class="span4"></div>已移交楼栋：</div>
    
          <select name="from[]" id="multiselect" class="form-control no-select2" size="12" multiple="multiple">
            <c:forEach items="${transferedBuildings}" var="build" varStatus="index">
              <option value="${build.buildNo}" district="${build.district}"  
              		buildingDisplayName="${build.extraData.subproject.buildingDisplayName}"
              		building="${build.extraData.subproject.building}"
              		houseType="${build.extraData.subproject.houseType}" 
              		actualStoneArea="${build.extraData.subproject.stoneActualArea}" 
              		data-position="${index}" >${build.district}:${build.extraData.subproject.buildingDisplayName}</option>
            </c:forEach>
          </select>
        </div>

        <div class="span1 button" >
          <button type="button" id="multiselect_rightSelected" class="btn btn-block"><i class="glyphicon glyphicon-chevron-right"></i></button>
          <button type="button" id="multiselect_leftSelected" class="btn btn-block"><i class="glyphicon glyphicon-chevron-left"></i></button>
        </div>

        <div class="span3">
          <div>   未移交楼栋：</div>
          
          <select name="to[]" id="multiselect_to" class="form-control no-select2" size="12" multiple="multiple">
            <c:forEach items="${untransferBuildings}" var="build" varStatus="index">
              <option value="${build.extraData.subproject.building}" district="${build.district}" 
              		buildingDisplayName="${build.extraData.subproject.buildingDisplayName}"
              		building="${build.extraData.subproject.building}"
              		houseType="${build.extraData.subproject.houseType}" 
              		actualStoneArea="${build.actualStoneArea}" 
              		data-position="${index}" >${build.district}:${build.extraData.subproject.buildingDisplayName}</option>
            </c:forEach>
          </select>
        </div>

      </div>
    </div>
  </li>

</ul>
