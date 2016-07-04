<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>项目添加</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/activitiHeader.jsp"%>
	<script type="text/javascript" src="${ctxStatic}/common/common_service.js"></script>
	<script src="${ctxStatic}/modules/datatrack/scripts/trackpurchase.js?tsf=${jsVersion}" type="text/javascript"></script>
	<script type="text/javascript">
	$(document).ready(
			function() {form_validate("inputForm"); }
	);
	
	function back() {
		history.back();
		return false;
	}
	</script>
</head>
<body>
  <div class="list-content" >
     <div class="form-content" >
     <div id="print_div" >
		<input name="iback" type="button" style="margin-left:20px" id="iback" onclick="back()" value=" 返回 " />
	</div>
	  <form:form id="inputForm" modelAttribute="project" action="${ctx}/project/${flag eq 'add'?'save':'update'}" method="post" class="form-horizontal magbtm0">  
		

	  <table id="contentTable" class="table table-striped table-bordered table-condensed  table-eidt table-tab">
			<thead>
			   <tr list="subList">
				    <th type="text" class="input100" name="name" id="id" style="width:48%">下料单号</th>
				    <th type="text" class="input100" name="name" id="id" style="width:52%">单据详情</th>
				 <!--    <th type="text" class="input100" name="name" id="id">待运营指派</th>
				    <th type="text" class="input100" name="name" id="id">待采购指派</th>
				    <th type="text" class="input100" name="name" id="id">待下单</th>
				    <th type="text" class="input100" name="name" id="id">已下单</th>
				    <th type="text" class="input100" name="name" id="id">供应商签收</th>
				    <th type="text" class="input100" name="name" id="id">待发货</th>
				    <th type="text" class="input100" name="name" id="id">待收货</th>
				    <th type="text" class="input100" name="name" id="id">已收货</th> -->
				</tr>
			</thead>
			<tbody id="subProjectList"  copy="false">
			
			<c:forEach var="c" items="${list}">
				<tr id="baseBomId">
				<td >${c.orderBomBase.orderBomNo}</td>
				<td ><a href="javascript:void(0)" class="purchaseDetail">查看</a></td>
				<%-- <c:choose>
					   <c:when test="${c.status== '30'}">  
					        <td><a href="javascript:void(0)" class="purchaseDetail"></a></td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
					   </c:when>
					    <c:when test="${c.status== '40'}">  
					        <td><a href="javascript:void(0)" class="purchaseDetail">进行中</a></td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
					   </c:when>
					  
					   <c:when test="${c.status== '60'}">  
					        <td >结束</td>
							<td><a href="javascript:void(0)" class="purchaseDetail">进行中</a></td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
					   </c:when>
					    <c:when test="${c.status== '70'}">  
					        <td >结束</td>
							<td>结束</td>
							<td><a href="javascript:void(0)" class="purchaseDetail">进行中</a></td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
					   </c:when>
					   <c:when test="${c.status== '80'}">  
					        <td >结束</td>
							<td>结束</td>
							<td>结束</td>
							<td><a href="javascript:void(0)" class="purchaseDetail">进行中</a></td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
					   </c:when>
					   <c:when test="${c.status== '90'}">  
					        <td >结束</td>
							<td>结束</td>
							<td>结束</td>
							<td>结束</td>
							<td><a href="javascript:void(0)" class="purchaseDetail">进行中</a></td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
					   </c:when>
					   <c:when test="${c.status== '100'}">  
					        <td >结束</td>
							<td>结束</td>
							<td>结束</td>
							<td>结束</td>
							<td>结束</td>
							<td><a href="javascript:void(0)" class="purchaseDetail">进行中</a></td>
							<td>未开始</td>
							<td>未开始</td>
					   </c:when>
					   <c:when test="${c.status== '110'}">  
					        <td>结束</td>
							<td>结束</td>
							<td>结束</td>
							<td>结束</td>
							<td>结束</td>
							<td>结束</td>
							<td><a href="javascript:void(0)" class="purchaseDetail">进行中</a></td>
							<td>未开始</td>
					   </c:when>
					    <c:when test="${c.status== '120'}">  
					        <td >结束</td>
							<td>结束</td>
							<td>结束</td>
							<td>结束</td>
							<td>结束</td>
							<td>结束</td>
							<td>结束</td>
							<td>结束</td>
					   </c:when>
					   <c:otherwise> 
					   		<td>&nbsp;</td>
					   		<td>&nbsp;</td>
					   		<td>&nbsp;</td>
					   		<td>&nbsp;</td>
					   		<td>&nbsp;</td>
					   		<td>&nbsp;</td>
					   		<td>&nbsp;</td>
					   		<td>&nbsp;</td>
					   </c:otherwise>
					</c:choose> --%>
				
				<input type = "hidden" id="orderBomId" value="${c.orderBomBase.id}"/>
				<input type = "hidden" id="status" value="${c.status}"/>
				</tr>
			</c:forEach>
				
			</tbody>
		</table>
		<div id = 'baseBomdiv'></div>
		</div>
		</div>
		<div class="hr_60">
		</div>
	 </form:form>
  </div>
</body>
</html>