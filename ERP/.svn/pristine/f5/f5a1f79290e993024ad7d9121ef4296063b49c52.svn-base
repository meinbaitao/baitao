<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>发货通知单列表</title>
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
	           <form:form id="searchForm" modelAttribute="logisticsSend" action="${ctx}/logisticsSend/logisticsSendList?logo=1" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        <%-- <ul class="search">
		            <li>
		               <input value="${param.seriesnumber }" id="seriesnumber" name="seriesnumber" type="text" class="input-medium" placeholder="关键字">
		               <form:input path="logisticssendCode" htmlEscape="false" class="input-medium" placeholder="关键字"/>
		            </li>
		            <li>
		            	<!-- <button class="search-btn" id="table-set"  type="button"  >查询</button> -->
		            	<input class="search-btn" type="submit" id="searchBtn" name="searchBtn" value="查询"/>
		            </li>
		        </ul> --%>
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
			     <th>单据状态</th>
			     <th width="80">操作</th>
			     </tr>
            </thead>
            <tbody>
	            <c:forEach items="${page.list}" var="items" varStatus="i">
	              <tr>
	               <td>${items.seriesnumber}</td>
	               <td>${items.proLable}</td>
	               <td>${items.suppLable}</td>
	               <td>
	               		${items.statusLable}
	               </td>
	               <td>
	               		<c:choose>
	               			<c:when test="${items.status == isStatus }">
	               				<a href="${ctx}/logistics/productionLogistics/csDetail?lID=${items.id}">确认发货</a>
	               			</c:when>
	               			<c:otherwise>
	               				<a href="${ctx}/logistics/productionLogistics/getDetailByID?lID=${items.seriesnumber}&reUrl=${ctx}/logistics/productionLogistics/confirmSend">查看详情</a>
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