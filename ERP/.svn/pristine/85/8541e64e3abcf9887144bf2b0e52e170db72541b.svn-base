<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>调拨单（石材）</title>
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
	           <form:form id="searchForm" modelAttribute="inventory" action="${ctx}/inventory/standingBook/claimGFLList" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        
				 <ul class="operationg-new" >
	            	<li>
		            	<a href="${ctx}/inventory/standingBook/transferSCFrom" class="btn btn-primary">添加</a>
		            </li>
		        </ul>
		        <ul class="search">
		            <li>
		               <input type="text" class="input-medium" placeholder="关键字">
		            </li>
		            <li>
		            	<input class="search-btn" type="submit" value="查询"/>
		            </li>
		        </ul>
		        
		       <div class="clearfix"></div>
		       </form:form>
		       <div class="clear"></div>
	      </div>
	     <sys:message content="${message}"/>
		 <table id="contentTable" class="table table-striped table-bordered table-condensed resize">
		    <thead>
		     <tr align="center">
			   	 <th >序号</th>
			   	 <th>单据编号（流水号）</th>	
			   	 <!-- <th>业务类型</th>	
			     <th>物料类型</th>
			     <th>物料名称</th>
	             <th>入库仓库</th> 
	             <th>出库仓库</th>  
			     <th>备注</th> -->
			     <th>业务日期</th>
		     </tr>
            </thead>
            <tbody>
             <c:forEach items="${page.list}" var="items" varStatus="st">
              <tr>
               <td>${st.index+1}</td>
               <td>${items.seriesnumber }</td>
               <%-- <td>${items.tranTypeLab}</td>
               <td>${items.materialType }</td>
               <td>${items.materialName }</td>
               <td>${items.depotIn.name }</td>
               <td>${items.depotOut.name }</td>
               <td>${items.remarks }</td> --%>
               <td><fmt:formatDate value="${items.businessDate }" type="both"/></td>
             </tr>
            </c:forEach>  
            </tbody>  
		 </table>
	</div>
	
	<div class="appoint-saider" id="appoint-saider">
	<form:form id="inputForm" modelAttribute="logisticsSend" action="${ctx}/inventory/standingBook/list" method="post" class="form-horizontal">
	<h3><i></i>台帐明细</h3>	
		 <ul>
           <table id="contentTable" class="table table-striped table-bordered table-condensed resize">
			<thead>
		     <tr align="center">
			   	 <th rowspan=2 >序号</th>	
			   	 <th rowspan=2 >箱号</th>	
			     <th rowspan=2 >材料编码</th>
	             <th rowspan=2 >材料类型</th>  
	             <th rowspan=2 >材料名称</th> 
			     <th colspan=4 >规格</th>
			     <th rowspan=2 >数量</th>
		     </tr>
		     <tr>
			     <th>长度</th>
			     <th>宽度</th>
			     <th>厚度</th>
			     <th>材料规格</th>
		     </tr>
            </thead>
            <tbody id="detailList">
            </tbody>  
		 </table>
	    </ul>
	</form:form>
	</div>
	<div class="pagination">${page}</div>
</body>

</html>