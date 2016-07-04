<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>库存管理</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/modules/inventory/scripts/inventory.js?tsf=${jsVersion}" type="text/javascript"></script>
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
	     <div class="nav-operate" >
	       <form:form id="searchForm" modelAttribute="inventory" action="${ctx}/inventory/list" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<ul class="search">
					<%-- <ul class="operationg-new" >
		            	<li >仓库名称：
		            		<select id="depotList" name="depotList" class="input-small">
								<option value="">全部</option>
								<c:forEach items="${depotList }" var="dl">
									<option value="${dl.id}" <c:if test="${dl.id == depotId}">selected="selected"</c:if>>${dl.depotName}</option>
								</c:forEach>
							</select>
		            	</li>
			        </ul> --%>
					<li>
					   <label><input name="depotName" value="${param.depotName }" type="text" class="input-medium" placeholder="关键字">
						</label>
					</li>
					<li ><input id="btnSubmit" class="search-btn" type="submit" value="查询"/></li>
					<li class="clearfix"></li>
				</ul>
			</form:form>
		       <div class="clear"></div>
	      </div>
	     <sys:message content="${message}"/>
		 <table id="contentTable" class="table table-striped table-bordered table-condensed resize">
		    <thead>
		     <tr align="center">
			   	 <th rowspan=2 >序号</th>
			   	 <th rowspan=2 >仓库名称</th>
			   	 <th rowspan=2 >材料编号</th>  
			   	 <th rowspan=2 >材料类型</th>  
	             <th rowspan=2 >材料名称</th>
	             <th rowspan=2 >库存余量</th> 	
			   	 <!-- <th rowspan=2 >箱号</th>	
			     <th rowspan=2 >材料编码</th> -->
	             
			     <!-- <th colspan=4 >规格</th> -->
			     
			    <!--  <th rowspan=2 >入库日期</th> -->
		     </tr>
		     <!-- <tr>
			     <th>长度</th>
			     <th>宽度</th>
			     <th>厚度</th>
			     <th>材料规格</th>
		     </tr> -->
            </thead>
            <tbody>
             <c:forEach items="${page.list}" var="items" varStatus="st">
	              <tr>
		               <td>${st.index+1}</td>
		               <%-- <td>${items.orderBomBox.boxNo }</td>
		               <td>${items.material.seriesNumber }</td> --%>
		               <td>${items.depot.depotName }</td>
		               <td>${items.materialNo }</td>
		               <td>${items.materialType }</td>
		               <td>${items.materialName }</td>
		               <%-- <td>${items.material.length }</td>
		               <td>${items.material.width }</td>
		               <td>${items.material.height }</td>
		               <td>${items.material.model }</td> --%>
		               <td>${items.quantity }</td>
		               <%-- <td><fmt:formatDate value="${items.inventory.createDate }" type="both"/></td> --%>
	             </tr>
            </c:forEach>  
            </tbody>  
		 </table>
	</div>
	<div class="pagination">${page}</div>
</body>
<script>
</script>
</html>