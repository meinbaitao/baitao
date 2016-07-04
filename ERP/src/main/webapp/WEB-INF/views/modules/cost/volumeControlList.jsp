<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>成本控量列表</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/modules/cost/scripts/volumeControl.js?tsf=${jsVersion}" type="text/javascript"></script>
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
			<form id="importForm" action="${ctx}/cost/volumeControl/volumeControlImport" method="post" enctype="multipart/form-data"
				style="text-align:center;">
			
			<ul class="modal-body">
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
					   <span class="help-inline"><font color="red">*</font> </span>
					</label>
				</li>
				<li>
					<span class="tab-name">栋号：</span>
					<label id="buildingOne">
						 <select class="input-medium">
							<option value=""/>请选择</option>
						 <select>
					</label>
				</li>
				<li>
				    <span class="tab-name">文件：</span>
				    <label>
					   <input id="uploadFile" name="multipartFile" type="file" style="width:330px"/><br/>
					</label>
				</li>
				<li class="clear"></li>
				<li class="fr">
				    <input id="btnImportSubmit" class="btn btn-primary" type="button" value="导    入"/>
			        <input name="subprojectId" id="subprojectId" type="hidden"/>
				</li>
			</ul>
			</form>
		   </div>
		</div>	
		<div class="nav-operate">
			<ul class="operationg-new">
				<li>
					<a href="${ctx}/cost/volumeControl/templateImport" id="costId" class="btn btn-primary">
						下载模板
					</a>
				</li>
				<li>
					<input id="btnImport" class="btn btn-primary" type="button" value="导入控量表">
				</li>
				<li>
					<form id="deleteForm" action="${ctx}/cost/volumeControl/list" method="post">
						<input id="btnDelete" class="btn btn-primary" type="button" value="删除">
					</form>
				</li>
			</ul>
			<form id="searchForm" action="${ctx}/cost/volumeControl/list" method="post"
				class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden"
					value="${page.pageNo}" />
				<input id="pageSize" name="pageSize" type="hidden"
					value="${page.pageSize}" />
				<div class="clearfix"></div>
			</form>
			<div class="clear"></div>
		</div>
		<sys:message content="${message}"/>
		<table id="contentTable" class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th class="all-check">
			         <input type="checkbox" id="all-check" >
			         <label for="all-check">全选</label>
		   		    </th>
					<th>项目名称</th>
					<th>苑区</th>
					<th>户型</th>
					<th>楼栋号</th>
					<th>创建人</th>
					<th>创建时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="items" varStatus="st">
	              <tr>
	               <td><input type="checkbox" name="checkdbox" id="${items.volumeControl.id}"></td>
	               <td>${items.project.name }</td>
	               <td>${items.project.location }</td>
	               <td>${items.volumeControl.houseType }</td>
	               <td>${items.volumeControl.building }</td>
	               <td>${items.volumeControl.createUser }</td>
	               <td><fmt:formatDate value="${items.volumeControl.createDate }" type="both"/></td>
	               <td><a href="${ctx}/cost/volumeControlDetail/list?volumeControlId=${items.volumeControl.id}">查看明细</a></td>
	             </tr>
                </c:forEach>  
			</tbody>
		</table>
	</div>
	<div class="pagination" >${page}</div>
	
</body>
</html>