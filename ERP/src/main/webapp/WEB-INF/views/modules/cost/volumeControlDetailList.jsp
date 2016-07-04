<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>成本控量明细管理</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/modules/cost/scripts/volumeControl.js?tsf=${jsVersion}" type="text/javascript"></script>
	<script type="text/javascript" src="${ctxStatic}/common/common_service.js"></script>
	<script type="text/javascript">
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
		<ul class="operationg-new">
			<li>
				<a href="${ctx}/cost/volumeControl/list" id="costId">
					<input class="btn btn-primary" type="button" value="返回">
				</a>
			</li> 
			<!-- 
			<li>
				<form id="deleteDetailForm" action="${ctx}/cost/volumeControl/list" method="post">
					<input id="btnDeleteDetail" class="btn btn-primary" type="button" value="删除">
				</form>
			</li>
			 -->
		</ul>
	</div>			
	<form:form id="searchForm" modelAttribute="volumeControlDetail" action="${ctx}/cost/volumeControlDetail/list?volumeControlId=${volumeControl.id }" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<!-- 
		<div class="nav-operate">
			<ul class="operationg-new">
				<li>
					<form id="deleteDetailForm" action="${ctx}/cost/volumeControl/list" method="post">
						<input id="btnDeleteDetail" class="btn btn-primary" type="button" value="删除">
					</form>
				</li>
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
					<input name="subprojectId" id="subprojectId" type="text"/>
					<input id="btnquery" class="btn btn-primary" type="button" value="查询">
				</li>
			</ul>
		</div>	
	    -->	
	</form:form>
	<div class="form-content">
	<form:form modelAttribute="volumeControlDetail" action="${ctx}/cost/volumeControlDetail/update" method="post" class="form-horizontal magbtm0">
	<ul>
       	  <li>
             <span class="tab-name">项目名称+苑区：</span>
             <label>
             	 <input type="text" value="${project.name}+${project.location}" class="input-medium" disabled="disabled"/>
             </label>
          </li>
          <li>
             <span class="tab-name">户型：</span>
             <label>
                  <input type="text" value="${volumeControl.houseType }" class="input-medium" disabled="disabled"/>
             </label>
          </li>
          <li>
             <span class="tab-name">楼栋号：</span>
             <label>
                  <input type="text" value="${volumeControl.building }" class="input-medium" disabled="disabled"/>
               	  <input type="hidden" name="volumeControlId" value="${volumeControl.id}" />
             </label>
          </li>
    </ul>   
	<sys:message content="${message}"/>
	<!-- 
	<div class="form-actions">
		<input type="submit" class="btn btn-primary" value="提交"/>
		<a href="${ctx}/cost/volumeControl/list" id="costId">
			<input class="btn" type="button" value="返回">
		</a>
	</div>
	 -->
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
				<th>材料规格</th>
				<th>损耗率</th>
				<th>数量（不含损耗）</th>
				<th>损耗量</th>
				<th>数量（含损耗）</th>
				<th>单位</th>
				<th>备注</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="items" varStatus="idx">
              <tr>
              <!-- 
               <td>
               		<input type="checkbox" name="checkdbox" id="${items.id}" />
               </td>
                -->
               <input type="hidden" name="list[${idx.index}].id" value="${items.id}" />
               		<input type="hidden" name="list[${idx.index}].volumeControlId" value="${items.volumeControlId}" />
               <td type="text" class="input-medium" name="list[${idx.index}].seriesNumber" id="seriesNumber">${items.seriesNumber }</td>
               <td type="text" class="input-medium" name="list[${idx.index}].name" id="name">${items.name }</td>
               <td type="text" class="input-medium" name="list[${idx.index}].model" id="model">${items.model }</td>
               <td type="text" class="input-medium" name="list[${idx.index}].lossRate" id="lossRate">${items.lossRate }</td>
               <td type="text" class="input-medium" name="list[${idx.index}].quantityOne" id="quantityOne">${items.quantityOne }</td>
               <td type="text" class="input-medium" name="list[${idx.index}].lossAmount" id="lossAmount">${items.lossAmount }</td>
               <td type="text" class="input-medium" name="list[${idx.index}].quantityTwo" id="quantityTwo">${items.quantityTwo}</td>
               <td type="text" class="input-medium" name="list[${idx.index}].unit" id="unit">${items.unit }</td>
               <td type="text" class="input-medium" name="list[${idx.index}].comment" id="comment">${items.comment }</td>
             </tr>
           </c:forEach>  
		</tbody>
	</table>
	<div class="hr_60"></div>
	</form:form>
	</div>
	</div>
	<div class="pagination">${page}</div>
</body>
</html>