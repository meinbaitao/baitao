<%@ page contentType="text/html;charset=UTF-8" %>
<li>
             <span class="tab-name">下料单编号：</span>
             <label>
             	 <input type="text" value="${orderBomBase.orderBomNo}" class="input-medium" disabled="disabled"/>
             </label>
          </li>
          <li>
             <span class="tab-name">项目名称：</span>
             <label>
             	 <input type="text" value="${project.name}" class="input-medium" disabled="disabled"/>
             </label>
          </li>
          <li>
             <span class="tab-name">苑区：</span>
             <label>
             	 <input type="text" value="${project.location}" class="input-medium" disabled="disabled"/>
             </label>
          </li>
          <li>
             <span class="tab-name">户型：</span>
             <label>
                  <input type="text" value="${orderBomBase.houseType }" class="input-medium" disabled="disabled"/>
             </label>
          </li>
          <li>
             <span class="tab-name">楼栋号：</span>
             <label>
                  <c:choose>
					<c:when test="${orderBomBase.workflowstatus eq '4'}">
						<input type="text" value="${subProject.buildingDisplayName }" class="input-medium" disabled="disabled"/>  	
					</c:when>
					<c:otherwise>
						<input type="text" value="${orderBomBase.sub.buildingDisplayName }" class="input-medium" disabled="disabled"/>
					</c:otherwise>
				</c:choose>  
             </label>
          </li>
          <li>
             <span class="tab-name">饰面处理：</span>
             <label>
                  <input type="text" value="${orderBomBase.facingProcess }" class="input-medium" disabled="disabled"/>
             </label>
          </li>
          <li>
             <span class="tab-name">石材品种：</span>
             <label>
                  <input type="text" value="${orderBomBase.showStoneColorName }" class="input-medium" disabled="disabled"/>
             </label>
          </li>
          <li>
             <span class="tab-name">备注：</span>
             <label>
                  <input type="text" value="${orderBomBase.remark }" class="input-medium" disabled="disabled"/>
             </label>
          </li>
          <li>
             <span class="tab-name">批量下单次数：</span>
             <label>
             	  <c:if test="${orderBomBase.workflowstatus!=4}">
             	  <input type="text" value="0${orderBomBase.copyNum}" id="copyNum" name="copyNum" maxlength="3" class="input-medium digits required"/>
             	  </c:if>
                  <c:if test="${orderBomBase.workflowstatus==4}">
             	  <input type="text" value="0" id="copyNum" name="copyNum" maxlength="3" class="input-medium digits required"/>
             	  </c:if>
             </label>
          </li>