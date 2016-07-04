<%@ page contentType="text/html;charset=UTF-8" %>
<sys:messagefororder content="${message}"/>
		<table id="contentTable" class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th class="all-check">
			         <input type="checkbox" id="all-check" >
			         <label for="all-check">全选</label>
		   		    </th>
		   		    <th>下料单编号</th>
					<th>项目名称</th>
					<th>苑区</th>
					<th>户型</th>
					<th>楼栋号</th>
					<th>石材品种</th>
					<th>饰面处理</th>
					<th>创建人</th>
					<th>创建时间</th>
					<th>状态</th>
					<th>备注</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="items" varStatus="st">
	              <tr>
	               <td><input type="checkbox" name="checkdbox" id="${items.orderBomBase.id}" data_status="${items.orderBomBase.workflowstatus }"></td>
	               <td>${items.orderBomBase.orderBomNo }</td>
	               <td>${items.project.name }</td>
	               <td>${items.project.location }</td>
	               <td>${items.orderBomBase.houseType }</td>		
	               <td>
               	    <c:choose>
						<c:when test="${items.orderBomBase.workflowstatus eq '4'}">
							${items.subProject.buildingDisplayName }
						</c:when>
						<c:otherwise>${items.orderBomBase.sub.buildingDisplayName }</c:otherwise>
					</c:choose>            
              	   </td>
	               <td>${items.orderBomBase.showStoneColorName }</td>
	               <td>${items.orderBomBase.facingProcess }</td>
	               <td>${items.orderBomBase.createUser }</td>
	               <td><fmt:formatDate value="${items.orderBomBase.orderMadeTime }" type="both"/></td>
	               <td>
               	    <c:choose>
						<c:when test="${items.orderBomBase.workflowstatus eq '1'}">
							待审核
						</c:when>
						<c:when test="${items.orderBomBase.workflowstatus eq '4'}">
							已完成
						</c:when>
						<c:otherwise>待提交</c:otherwise>
					</c:choose>            
              	   </td>
              	   <td>${items.orderBomBase.remark }</td>
	               <td><a href="${ctx}/orbom/orderBomDetail/list?orderBomId=${items.orderBomBase.id}&orderType=${items.orderBomBase.orderType}">查看明细</a></td>
	             </tr>
                </c:forEach>  
			</tbody>
		</table>
	</div>
	<div class="pagination" >${page}</div>