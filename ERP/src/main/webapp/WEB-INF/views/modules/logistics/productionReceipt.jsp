<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>确认收货</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/modules/logistics/scripts/productionLogistics.js?tsf=${jsVersion}" type="text/javascript"></script>
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
<body><!-- onsubmit="javascript:return validateAssign();"  -->
	<div class="list-content">
	     <div class="nav-operate" >
	           <form:form id="searchForm" modelAttribute="logisticsSend" action="${ctx}/logistics/productionLogistics/receipt" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        <ul class="search">
		            <li>
		               <input value="${param.seriesnumber }" id="seriesnumber" name="seriesnumber" type="text" class="input-medium" placeholder="关键字">
		               <%-- <form:input path="logisticssendCode" htmlEscape="false" class="input-medium" placeholder="关键字"/> --%>
		            </li>
		            <li>
		            	<!-- <button class="search-btn" id="table-set"  type="button"  >查询</button> -->
		            	<input class="search-btn" type="submit" id="searchBtn" name="searchBtn" value="查询"/>
		            </li>
		        </ul>
		       <div class="clearfix"></div>
		       </form:form>
		       <div class="clear"></div>
			   
	      </div>
	     <sys:message content="${message}"/>
		 <table id="contentTable" class="table table-striped table-bordered table-condensed resize">
		   <input id="isStatus" name="isStatus" type="hidden" value="${isStatus}"/>
		   <thead>
			   <tr>
			     <th>发货通知单号</th>
	             <th>项目</th> 
	             <th>装车工厂</th>
	             <!-- <th>发货工厂</th>  -->
	             <!-- <th>发货数量(箱)</th>   -->
	             <!-- <th>承运方名称</th>   -->
			     <!-- <th>计划发货日期</th>
			     <th>实际发货日期</th>
			     <th>制单人</th>
			     <th>发货人</th> -->
	             <!-- <th>创建时间</th> -->
			     <th>单据状态</th>
			     <th>操作</th>
			     </tr>
            </thead>
            <tbody>
	            <c:forEach items="${page.list}" var="items" varStatus="i">
	              <tr>
	               <td>${items.seriesnumber}</td>
	               <td>${items.proLable}</td>
	               <td>${items.suppLable}</td>
	               <%-- <td>${items.sendFactory }</td> --%>
	               <%-- <td>${items.quantity }</td> --%>
	               <%-- <td>${items.suppliersId }</td>
	               <td>${items.planSendDate }</td>
	               <td>${items.factSendDate }</td>
	               <td>${items.makeUser }</td>
	               <td>${items.sendUser }</td> --%>
	               <%-- <td>${items.createDate }</td> --%>
	               <td>
	               		${items.statusLable}
	               	  <%--  <c:if test="${items.status == 1 }">
	               	   		待发货
	               	   </c:if>
	               	   <c:if test="${items.status == 2 }">
	               	   		部分发货
	               	   </c:if>
	               	   <c:if test="${items.status == 3 }">
	               	   		完全发货
	               	   </c:if> 
	               	   <c:if test="${items.status == 5 }">
	               	   		完全收货
	               	   </c:if>    --%>            
	               </td>
	               <td>
	               	   <c:choose>
	               			<c:when test="${items.status == isStatus}">
	               				<a href="${ctx}/logistics/productionLogistics/receiptDetail?lID=${items.id}">确认收货</a>
								<a href="${ctx}/accident/accidentManage/startupSCReceiveAccident/${items.id}" >发起收货事故</a>
	               			</c:when>
	               			<c:otherwise>
	               				<%-- <a href="javascript:void()" name="receiptA" attr="${items.id}">查看详情</a> --%>
	               				<a href="${ctx}/logistics/productionLogistics/getDetailByID?lID=${items.seriesnumber}&reUrl=${ctx}/logistics/productionLogistics/receipt">查看详情</a>
	               			</c:otherwise>
	               		</c:choose>
	               </td>
	              </tr>
	            </c:forEach>  
            </tbody>  
		 </table>
	</div>
    <div class="pagination">${page}</div>
</body>
</html>