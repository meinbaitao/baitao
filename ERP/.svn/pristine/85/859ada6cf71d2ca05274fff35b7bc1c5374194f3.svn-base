<%@ page contentType="text/html;charset=UTF-8" %>
<li>
             <span class="tab-name">立面方向：</span>
             <label>
                  <select id="outsideWallOrientation" name="outsideWallOrientation" title="detail" class="input-small">
					<option value="">全部</option>
					<c:forEach items="${outsideWallOrientationList}" var="outside" varStatus="idx">
					<option value="${outsideWallOrientationList[idx.index] }" 
					<c:if test="${outsideWallOrientation eq outsideWallOrientationList[idx.index]}">selected="selected"</c:if>>${outsideWallOrientationList[idx.index] }</option>
					</c:forEach>
					<!--<option value="东面" <c:if test="${outsideWallOrientation == '东面'}">selected="selected"</c:if>>东面</option>
					<option value="南面" <c:if test="${outsideWallOrientation == '南面'}">selected="selected"</c:if>>南面</option>
					<option value="西面" <c:if test="${outsideWallOrientation == '西面'}">selected="selected"</c:if>>西面</option>
					<option value="北面" <c:if test="${outsideWallOrientation == '北面'}">selected="selected"</c:if>>北面</option>-->
				 </select>
             </label>
          </li>