<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>挂石下料单列表</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/modules/orbom/scripts/orderBom.js?tsf=${jsVersion}" type="text/javascript"></script>
	<script type="text/javascript" src="${ctxStatic}/common/common_service.js"></script>
	<script>
	$(document).ready(function() {
		
	});
	function page(n,s){
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
    	return false;
    }
	</script>
</head>
<body>
	<div class="list-content">
		<div class="nav-operate">
		<div id="importBox" class="hide">
			<form id="importForm" action="${ctx}/orbom/orderBomBase/importPurchase" method="post" enctype="multipart/form-data"
				style="padding-left:20px;text-align:center;">
			<ul class="modal-body importForm-ul">
				<li>
					<span class="tab-name">项目名称：</span>
					<label>
						 <select id="projectNameOne" class="input-medium required">
							<option value=""/>请选择</option>
							<c:forEach items="${listMap}" var="obj">
								<option  value="${obj.proID}">${obj.proName}</option>
							</c:forEach>
						</select>
						<span class="help-inline"><font color="red">*</font> </span>
					</label>
				</li>
				<li>
					<span class="tab-name">户型：</span>
					<label>
					   <span id="houseTypeOne">
						 <select class="input-medium required">
							<option value=""/>请选择</option>
						 </select>
					   </span>
					   <span class="help-inline"><font color="red">*</font></span>
					</label>
				</li>
				<li class="autoHeight">
					<span class="tab-name">栋号：</span>
					<label id="buildingOne">
						 <select class="input-medium required" multiple="mutiple">
						 <select>
					</label>
				</li>
				<li>
					<span class="tab-name">文件：</span>
					<label>
						<span>
							<input id="multipartFile" name="multipartFile" type="file" style="width:330px"/><br/>
						</span>
					</label>
				</li>
				<li>
					<span class="tab-name">备注：</span>
					<label>
						<input id="remark" name="remark" type="text" class="input-medium"/><br/>
					</label>
				</li>
				<li class="clear"></li>
				<li class="fr">
					<input id="btnImportSubmit" class="btn btn-primary" type="button" value="导    入"/>
					<input name="subProjId" id="subprojectId" type="hidden"/>
					<input name="uniformMaterielType" id="uniformMaterielType" value="1" type="hidden"/>
				</li>
			</ul>
			</form>
		</div>
		</div>	
		<div class="nav-operate">
			<ul class="operationg-new">
				<shiro:hasAnyRoles name="${fns:getWhitelistsList('sjgl')}">
				<li>
					<a href="${ctxTemplate}/挂石下料单.xls" id="costId" class="btn btn-primary">
						下载模板
					</a>
				</li>
				<li>
					<input id="btnImport" class="btn btn-primary" type="button" value="导入下料单">
				</li>
				<li>
					<form id="deleteForm" action="${ctx}/orbom/orderBomBase/detele" method="post">
						<input id="btnDelete" class="btn btn-primary" type="button" value="删除">
						<input id="orderType" name="orderType"type="hidden" value="${orderType}" />
					</form>
				</li>
				<li>
					<input id="btnRepair" class="btn btn-primary" type="button" value="新增补料单">
				</li>
				<li>
					<input id="btnChange" class="btn btn-primary" type="button" value="新增变更单">
				</li>
				</shiro:hasAnyRoles>
			</ul>
			<form:form id="searchForm" modelAttribute="orderBomBase" action="${ctx}/orbom/orderBomBase/list?orderType=1&uniformMaterielType=1" method="post"
				class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden"
					value="${page.pageNo}" />
				<input id="pageSize" name="pageSize" type="hidden"
					value="${page.pageSize}" />
				<ul class="search">
		            <li>
		               <form:input path="orderBomNo" htmlEscape="false" maxlength="200" class="input-medium" placeholder="下料单编号"/>
		            </li>
		            <li>
		            	<input id="searchProject" type="submit" name="查询" value="查询" class="search-btn"/>
		            </li>
		        </ul>
				<div class="clearfix"></div>
			</form:form>
			<div class="clear"></div>
		</div>
		<sys:messagefororder content="${message}"/>
		<table id="contentTable" class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th class="all-check">
			         <input type="checkbox" id="all-check" >
			         <label for="all-check">全选</label>
		   		    </th>
		   		    <th>下料单类型</th>
		   		    <th>下料单编号</th>
					<th>项目名称</th>
					<th>苑区</th>
					<th>户型</th>
					<th>楼栋号</th>
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
	                <td>
               	    <c:choose>
						<c:when test="${items.orderBomBase.uniformMaterielType eq '1'}">
							挂石材料
						</c:when>
						<c:when test="${items.orderBomBase.uniformMaterielType eq '2'}">
							骨架材料
						</c:when>
					</c:choose>            
              	   </td>
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
	               <td><a href="${ctx}/orbom/orderBomDetail/list?orderBomId=${items.orderBomBase.id}&orderType=1&uniformMaterielType=1">查看明细</a></td>
	             </tr>
                </c:forEach>  
			</tbody>
		</table>
	</div>
	<div class="pagination" >${page}</div>
	
</body>
</html>