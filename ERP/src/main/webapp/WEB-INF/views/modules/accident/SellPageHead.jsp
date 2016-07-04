<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<li class="cols4">
  <span class="tab-name">项目名称：</span>
  <label>
    <form:select path="projectId" cssClass="input110"
                 items="${projects}" itemValue="id" itemLabel="name" />
  </label>
</li>
<li class="cols4">
  <span class="tab-name">户型：</span>
  <label>
     <span id="houseTypeOne">
       <c:choose>
        <c:when test="${flag eq 'edit'}">
          <form:input path="roomModel" id="roomModelSelect" readonly="true" cssClass="input110" />
        </c:when>
        <c:otherwise>
            <select id="roomModelSelect" class="input110" name="roomModel">
              <option value=""/>请选择</option>
            </select>
          </c:otherwise>
        </c:choose>

     </span>
  </label>
</li>
<li class="cols4">
  <span class="tab-name">栋号：</span>
  <label id="buildingOne">
    <c:choose>
      <c:when test="${flag eq 'edit'}">
          <form:hidden path="subProjId"  />
        <form:input path="buildingDisplayName" readonly="true" id="buildingNOSelect" cssClass="input110" />
      </c:when>
      <c:otherwise>
      <select id="buildingNOSelect" class="input100" name="subProjId"><select>
      </c:otherwise>
    </c:choose>

  </label>
</li>


<li class="cols4">
  <span class="tab-name">下料单：</span>
  <label id="materialsFormContaner">
    <c:choose>
      <c:when test="${flag eq 'edit'}">
        <input type="text" class="input110" readonly="readonly" value="${order.orderBomNo}" />
        <form:hidden path="orderId" id="materialsFormSelect" />
      </c:when>
      <c:otherwise>
        <form:select path="orderId" id="materialsFormSelect" cssClass="input110" />
      </c:otherwise>
    </c:choose>

  </label>
</li>