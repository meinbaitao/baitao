<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>骨架下料单明细管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/activitiHeader.jsp"%>
	<script src="${ctxStatic}/modules/orbom/scripts/orderBom.js?tsf=${jsVersion}" type="text/javascript"></script>
	<script type="text/javascript" src="${ctxStatic}/common/common_service.js"></script>
	<script type="text/javascript" src="${ctxStatic}/ajaxfileupload/ajaxfileupload.js" ></script>
	<script type="text/javascript">
	</script>
</head>
<body>
	<div class="list-content">
	<div class="nav-operate">
		<div id="importFile" class="hide">
			<form id="importFileForm" action="${ctx}/orbom/orderBomDetail/importPurchase" method="post" enctype="multipart/form-data"
				style="padding-left:20px;text-align:center;">
			<ul class="modal-body">
				<li>
					<span class="tab-name">文件：</span>
					<label>
						<input id="multipartFile" name="multipartFile" type="file" style="width:330px"/><br/>
					</label>
				</li>
				<li class="clear"></li>
				<li class="fr">
					<input id="btnImportFile" class="btn btn-primary" type="button" value="导    入"/>
					<input name="subprojectId" id="subprojectId" type="hidden"/>
					<input name="uniformMaterielType" id="uniformMaterielType" value="2" type="hidden"/>
					<input name="orderBomId" id="orderBomId" type="hidden" value="${orderBomBase.id }"/>
					<!-- 变更/补料的原下料单Id -->
					<input name="originalNo" id="originalNo" type="hidden" value="${originalNo }"/>
					<!-- 是否变更/补料的标识 1-补料2-变更 -->
					<input name="isChange" id="isChange" type="hidden" value="${isChange }">
				</li>
			</ul>
			</form>
		</div>
	</div>
	<div id="uploadFile" class="hide">
		<form id="uploadFileForm" action="${ctx}/orbom/orderBomBase/upload" method="post" enctype="multipart/form-data" style="padding-left:20px;text-align:center;">
			<input id="uploadOrderId" name="uploadOrderId" type="hidden" value="${orderBomBase.id}"/>　
			<ul>
			<li><input id="file" name="file" type="file" class="input-medium"/></li>　　
			<li><input id="uploadAttachment" class="btn btn-primary" type="button" value="上传   "/></li>
			</ul>
		</form>
	</div>
	<div class="nav-operate">
		<ul class="operationg-new">
			<li>
				<form id="returnForm" action="${ctx}/orbom/orderBomBase/list?orderType=1&uniformMaterielType=2" title="detail" method="post" >
					<input class="btn btn-primary" id="return" type="submit" value="返回">
				</form>
			</li> 
			<!-- 
			<li>
				<form id="deleteDetailForm" action="${ctx}/cost/volumeControl/list" method="post">
					<input id="btnDeleteDetail" class="btn btn-primary" type="button" value="删除">
				</form>
			</li>
			 -->
			<shiro:hasAnyRoles name="${fns:getWhitelistsList('sjgl')}">
			<li> 
               <!-- 上传附件 -->
               <input disabled="disabled" type="button" name="uploadOrder" id="uploadOrder" class="btn btn-primary" value="上传附件">
            </li>
			<li> 
               <!-- 导入数据 -->
               <input disabled="disabled" type="button" name="importOrder" id="importOrder" class="btn btn-primary" value="${isChange eq '2'?'保存':'导入'}">
            </li>
			<li> 
               <!-- 提交流程 -->
               <input disabled="disabled" type="button" name="submitOrder" id="submitOrder" class="btn btn-primary" value="提交">
            </li>
            </shiro:hasAnyRoles>
            <li> 
               <!-- 通过，流程进入下一步 -->
               <input style="display:none;" disabled="disabled" type="button" name="passOrder" id="passOrder" class="btn btn-primary" value="提交">
            </li>
            <li>
               <!--签收 -->
               <input disabled="disabled" type="button" name="signOrder" id="signOrder" class="btn btn-primary" value="签收">
            </li>
            <li>
               <!--驳回 -->
               <input disabled="disabled" type="button" name="rebutOrder" id="rebutOrder" class="btn btn-primary" value="驳回">
            </li>
            <li>
               <!--流程图 -->
               <input disabled="disabled" type="button" name="trackOrder" id="trackOrder" class="btn btn-primary" value="流程图">
            </li>
			<li class="showWorkflowAuditHistory">
				<input disabled="disabled" type="button" name="showWorkflowAuditHistory" id="showWorkflowAuditHistory" class="btn btn-primary" value="流程轨迹"/>
			</li>
            <li id="showAttach">
					<c:forEach items="${attachList}" var="obj">
					<div>
						<a id="${obj.id}" href="${ctx}/orbom/orderBomBase/download?id=${obj.id}">${obj.name} </a>&nbsp;&nbsp;
						<span style="display:none;" id="deleteAttach" deleteId="${obj.id }"  class="glyphicon glyphicon-remove-circle"></span>
					</div>
					</c:forEach>
			</li>
		</ul>
	</div>		
	<input type="hidden" name="workflowId" id="workflowId" value="${orderBomBase.workflowid }"/>	
	<input type="hidden" name="workflowStatus" id="workflowStatus" value="${orderBomBase.workflowstatus }"/>
	<form:form id="searchForm" modelAttribute="orderBomDetail" action="${ctx}/orbom/orderBomDetail/list?orderBomId=${orderBomBase.id }" method="post" class="breadcrumb form-search">
	</form:form>
	<div class="form-content">
	<form:form modelAttribute="orderBomDetail" action="${ctx}/orbom/orderBomDetail/update" method="post" class="form-horizontal magbtm0">
	<ul>
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
             <span class="tab-name">备注：</span>
             <label>
                  <input type="text" value="${orderBomBase.remark }" class="input-medium" disabled="disabled"/>
             </label>
          </li>
    </ul>   
	<sys:messagefororder content="${message}"/>
	<!-- 
	<table id="contentTable" class="table table-striped table-bordered table-condensed resize table-eidt">
	 -->
	 <div id="scroll-table">
		<div id="scroll-head">
		</div>
		<div id="tbody-scroll" class="tbody-scroll">
			<table id="contentTable" class="table table-striped table-bordered table-condensed resize">
				<thead>
					<tr>
						<!-- 
						<th class="all-check">
				         <input type="checkbox" id="all-check" >
				         <label for="all-check">全选</label>
			   		    </th>
			   		     -->
						<th>材料编号</th>
						<th>材料名称</th>
						<th>材料类别</th>
						<th>材质</th>
						<th>材料规格</th>
						<th>数量</th>
						<th>单位</th>
						<th>单位重量（kg）</th>
						<th>总重量（kg）</th>
						<th>备注</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listOne}" var="items" varStatus="idx">
		              <tr>
		               <!-- 
		               <td>
		               		<input type="checkbox" name="checkdbox" id="${items.id}" />
		               </td>
		                -->		
		               <input type="hidden" name="list[${idx.index}].id" value="${items.id}" class="hide"/>
		               		<input type="hidden" name="list[${idx.index}].orderBomId" value="${items.orderBomId}" />
		               <td type="text" class="input-medium" name="list[${idx.index}].materielNo" id="materielNo">${items.materielNo }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].materielName" id="materielName">${items.materielName }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].materielType" id="materielType">${items.materielType }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].materials" id="materials">${items.materials }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].standardDesc" id="standardDesc">${items.standardDesc }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].count" id="count">${items.count }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].unit" id="unit">${items.unit }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].unitWeight" id="unitWeight">${items.unitWeight }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].wdight" id="wdight">${items.wdight }</td>
		               <td type="text" class="input-medium" name="list[${idx.index}].remark" id="remark">${items.remark }</td>
		             </tr>
		           </c:forEach>  
				</tbody>
			</table>
		</div>
	</div>
	<div class="hr_60"></div>
	</form:form>
	</div>
	</div>
</body>
</html>