<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<thead>
<tr list="buildingSchedules">
  <th rowspan="2" class="input-medium" valign="center">合同号</th>
  <th rowspan="2" class="input-medium" >苑区</th>
  <th rowspan="2" class="input-medium"  >楼栋号</th>
  <th colspan="2" class="input-medium"  >劳务班组</th>
  <th colspan="2" class="input-medium"  >现有施工人数</th>
  <th rowspan="2"  class="input-medium">工程量</th>
  <th colspan="2" class="input-medium">工作面移交</th>
  <th colspan="2" class="input-medium">本周计划比例</th>
  <th colspan="2" class="input-medium">截止到本周实际累计完成比例</th>
  <th colspan="2" class="input-medium">截止到下周计划累计完成比例</th>
  <th rowspan="2"  class="input-medium">产值</th>
  <th rowspan="2"  class="input-medium">产值进度(%)</th>
  <%-- <shiro:hasAnyRoles name="${fns:getWhitelistsList('xmzb')}"> --%>
  <c:if test="${ actionFlag eq 'edit'}" >
    <th rowspan="2" type="" class="input60" >操作</th>
  </c:if>
 <%--  </shiro:hasAnyRoles> --%>
</tr>

<tr>
  <th type="text" class="input-medium">骨架</th>
  <th type="text" class="input-medium">石材</th>
  <th type="text" class="input-medium">骨架</th>
  <th type="text" class="input-medium">石材</th>
  <th type="text"  class="input-medium">骨架</th>
  <th type="text"  class="input-medium">石材</th>
  <th type="text"  class="input-medium">骨架(%)</th>
  <th type="text"  class="input-medium">石材(%)</th>
  <th type="text"  class="input-medium">骨架(%)</th>
  <th type="text"  class="input-medium">石材(%)</th>
  <th type="text"  class="input-medium">骨架(%)</th>
  <th type="text"  class="input-medium">石材(%)</th>
</tr>

<tr list="buildingSchedules" class="hide copy">
  <th type="text" class="input45" name="jiaContractNo" id="jiaContractNo" readonly="readonly">合同号</th>
  <th type="text" class="input45" name="district" id="district" readonly="readonly">苑区</th>
  <th type="text" class="input45" name="buildingDisplayName" id="buildingDisplayName" readonly="readonly" >楼栋号</th>
  <th type="text" class="input45 required" name="workGroupGj" id="workGroupGj">骨架(劳务班组)</th>
  <th type="text" class="input45 required" name="workGroupSc" id="workGroupSc">石材(劳务班组)</th>
  <th type="text" class="input45 required number" name="peopleNumberGj" id="peopleNumberGj">骨架(现有施工人数)</th>
  <th type="text" class="input45 required number" name="peopleNumberSc" id="peopleNumberSc">石材(现有施工人数)</th>
  <th type="text"  class="input45" name="projectAmount" id="projectAmount" readonly="readonly">工程量</th>
  <th type="text"  readonly="readonly" onclick="timeinput()" class="input85 required Wdate" name="transferTimeGj" id="transferTimeGj">骨架(工作面移交)</th>
  <th type="text"  readonly="readonly" onclick="timeinput()" class="input85 required Wdate" name="transferTimeSc" id="transferTimeSc">石材(工作面移交)</th>
  <th type="text"  class="input45" name="planFinishRateGj" id="planFinishRateGj" readonly="readonly">骨架(本周计划比例)</th>
  <th type="text"  class="input45" name="planFinishRateSc" id="planFinishRateSc" readonly="readonly">石材(本周计划比例)</th>
  <th type="text"  class="input45 required number" name="factFinishRateGj" id="factFinishRateGj">骨架(本周实际完成比例)</th>
  <th type="text"  class="input45 required number" name="factFinishRateSc" id="factFinishRateSc">石材(本周实际完成比例)</th>
  <th type="text"  class="input45 required number" name="nwFinishRateGj" id="nwFinishRateGj">骨架(下周计划完成比例)</th>
  <th type="text"  class="input45 required number" name="nwFinishRateSc" id="nwFinishRateSc">石材(下周计划完成比例)</th>
  <th type="text"  class="input45" name="productionValue" id="productionValue" readonly="readonly">产值</th>
  <th type="text"  class="input45" name="proValueSchedule" id="proValueSchedule" readonly="readonly">产值进度</th>
  <c:if test="${actionFlag eq 'edit'}" >
    <th type="" class="input85" >操作</th>
    <th class="hide" type="hidden" name="id" id="id" ></th>
    <th class="hide" type="hidden" name="reportId" id="reportId" ></th>
  </c:if>
  <th class="hide" type="hidden" name="contractNo" id="contractNo">劳务合同号</th>
  <th class="hide" type="hidden" name="buildNo" id="buildNo">楼栋号</th>
  <th class="hide" type="hidden" name="planTransferDate" id="planTransferDate">计划移交时间</th>
  <th class="hide" type="hidden" name="planFinishDate" id="planFinishDate">计划完成时间</th>
  <th class="hide" type="hidden" name="memberCount" id="memberCount">人数</th>
  <th class="hide" type="hidden" name="hurry" id="hurry">是否赶工</th>
  <th class="hide" type="hidden" name="subsidy" id="subsidy">住宿补贴</th>
</tr>
</thead>