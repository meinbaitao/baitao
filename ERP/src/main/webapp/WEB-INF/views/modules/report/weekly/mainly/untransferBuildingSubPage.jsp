<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>


<div class="nav-operate" >
  <h5>填写未移交楼栋计划移交时间</h5>
</div>
<div class="table_scroll">
  <table class="table table-striped table-bordered table-condensed">
    <tr>
      <th>苑区</th>
      <th>户型</th>
      <th>楼栋号</th>
      <th>施工面积</th>
      <!-- <th>计划移交时间</th> -->
      <th>计划进场时间</th>
      <th>计划完工时间</th>
      <th>人数</th>
      <th>是否赶工</th>
      <th>住宿补贴</th>
    </tr>
    <tbody id="planTransferDateContainer">
    <c:forEach items="${untransferBuildings}" var="build" varStatus="index">
      <%-- <c:set var="escapedBuildNO" value="${fn:replace(build.buildNo, '#', '')}" /> --%>
      <c:set var="escapedBuildNO" value="${fn:replace(build.extraData.subproject.building, '#', '')}" />
      <tr id="untransfer_tr_${escapedBuildNO}">
        <td>
          <input class="input-mini" type="text" readonly="readonly" value="${build.district}"  />
        </td>
        <td>
          <input class="input-mini" type="text" readonly="readonly" value="${build.extraData.subproject.houseType}" />
        </td>
        <td>
          <input type="hidden"  value="${build.extraData.subproject.building}"  />
          <input class="input-mini" type="text" readonly="readonly" value="${build.extraData.subproject.buildingDisplayName}" />
        </td>
        <td>
          <input id="untransfer_${escapedBuildNO}_actualStoneArea" class="input-mini" type="text" value="${build.actualStoneArea}" />
        </td>
        <td>
          <input type="text" readonly="readonly" onclick="timeinput()" id="untransfer_${escapedBuildNO}_planTransferDate"
              value="<fmt:formatDate value="${build.planTransferDate}" pattern="yyyy-MM-dd" />"   class="input115 Wdate"  />
        </td>
        <td>
          <input type="text" readonly="readonly" onclick="timeinput()" id="untransfer_${escapedBuildNO}_planFinishDate"
              value="<fmt:formatDate value="${build.planFinishDate}" pattern="yyyy-MM-dd" />"   class="input115 Wdate"  />
        </td>
        <td>
          <input id="untransfer_${escapedBuildNO}_memberCount" class="input-mini number" type="text" value="${build.memberCount}" />
        </td>
        <td>
          	<c:forEach items="${fns:getDictList('yes_no')}" var="obj" varStatus="index">
              	<input ${(build.hurry eq obj.value or (obj.value eq '1' and empty build.hurry))?'checked="checked"':'' } 
              		name="untransfer_${escapedBuildNO}_hurry" type="radio" value="${obj.value }" >${obj.label }
            </c:forEach>
        </td>
        <td>
          	<c:forEach items="${fns:getDictList('yes_no')}" var="obj" varStatus="index">
              	<input ${(build.subsidy eq obj.value or (obj.value eq '1' and empty build.subsidy))?'checked="checked"':'' } 
              		name="untransfer_${escapedBuildNO}_subsidy" type="radio" value="${obj.value }" >${obj.label }
            </c:forEach>
        </td>
      </tr>
    </c:forEach>
    </tbody>
    <tr><td colspan="9"><b>合计</b>: <span id="amountOfUnTransferBuildings">
    <%
      List untransferBuildings = (List)request.getAttribute("untransferBuildings");
     out.print(untransferBuildings.size());
    %>
    </span></td></tr>
  </table>
</div>


