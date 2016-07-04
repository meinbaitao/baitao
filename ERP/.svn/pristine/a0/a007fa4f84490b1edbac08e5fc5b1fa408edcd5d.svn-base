<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>项目添加</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/activitiHeader.jsp"%>
	<script type="text/javascript" src="${ctxStatic}/common/common_service.js"></script>
	<script src="${ctxStatic}/modules/datatrack/scripts/datatrack.js?tsf=${jsVersion}" type="text/javascript"></script>
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
				    <th type="text" class="input100" name="name" id="id">单号</th>
				    <th type="text" class="input100" name="name" id="id">专员运营指派</th>
				    <th type="text" class="input100" name="name" id="id">主管运营指派</th>
				    <th type="text" class="input100" name="name" id="id">经理运营指派</th>
				    <th type="text" class="input100" name="name" id="id">生产指派</th>
				    <th type="text" class="input100" name="name" id="id">待签收</th>
				    <th type="text" class="input100" name="name" id="id">生产中</th>
				    <th type="text" class="input100" name="name" id="id">生产入库</th>
				    <th type="text" class="input100" name="name" id="id">发货通知</th>
				    <th type="text" class="input100" name="name" id="id">派车通知</th>
				    <th type="text" class="input100" name="name" id="id">确认发货</th>
				    <th type="text" class="input100" name="name" id="id">已发待收</th>
				    <th type="text" class="input100" name="name" id="id">确认收货</th>
				</tr>
			</thead>
			<tbody id="subProjectList"  copy="false">
			
			<c:forEach var="c" items="${list}" varStatus="i">
				<tr id="baseBomId">
				<td style="width:300px">${c.orderBomBase.orderBomNo}</td>
				<c:choose>
					   <c:when test="${c.status== '10'}">  
					        <td><a href="javascript:void(0)" class="bomBoxDetail">进行中</a></td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
					   </c:when>
					   <c:when test="${c.status== '20'}">  
					        <td >结束</td>
							<td><a href="javascript:void(0)" class="bomBoxDetail">进行中</a></td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
					   </c:when>
					   <c:when test="${c.status== '30'}">  
					        <td >结束</td>
							<td>结束</td>
							<td><a href="javascript:void(0)" class="bomBoxDetail">进行中</a></td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
					   </c:when>
					   <c:when test="${c.status== '40'}">  
					        <td >结束</td>
							<td>结束</td>
							<td>结束</td>
							<td><a href="javascript:void(0)" class="bomBoxDetail">进行中</a></td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
					   </c:when>
					   <c:when test="${c.status== '50'}">  
					        <td >结束</td>
							<td>结束</td>
							<td>结束</td>
							<td>结束</td>
							<td><a href="javascript:void(0)" class="bomBoxDetail">进行中</a></td>
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
							<td>结束</td>
							<td>结束</td>
							<td>结束</td>
							<td>结束</td>
							<td><a href="javascript:void(0)" class="bomBoxDetail">进行中</a></td>
							<td>未开始</td>
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
							<td>结束</td>
							<td>结束</td>
							<td>结束</td>
							<td><a href="javascript:void(0)" class="bomBoxDetail">进行中</a></td>
							<td>未开始</td>
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
							<td>结束</td>
							<td>结束</td>
							<td>结束</td>
							<td><a href="javascript:void(0)" class="bomBoxDetail">进行中</a></td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
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
							<td><a href="javascript:void(0)" class="bomBoxDetail">进行中</a></td>
							<td>未开始</td>
							<td>未开始</td>
							<td>未开始</td>
					   </c:when>
					   <c:when test="${c.status== '130'}">  
					        <td>结束</td>
							<td>结束</td>
							<td>结束</td>
							<td>结束</td>
							<td>结束</td>
							<td>结束</td>
							<td>结束</td>
							<td>结束</td>
							<td>结束</td>
							<td><a href="javascript:void(0)" class="bomBoxDetail">进行中</a></td>
							<td>未开始</td>
							<td>未开始</td>
					   </c:when>
					    <c:when test="${c.status== '140'}">  
					        <td >结束</td>
							<td>结束</td>
							<td>结束</td>
							<td>结束</td>
							<td>结束</td>
							<td>结束</td>
							<td>结束</td>
							<td>结束</td>
							<td>结束</td>
							<td>结束</td>
							<td><a href="javascript:void(0)" class="bomBoxDetail">进行中</a></td>
							<td>未开始</td>
					   </c:when>
					     <c:when test="${c.status== '150'}">  
					        <td >结束</td>
							<td>结束</td>
							<td>结束</td>
							<td>结束</td>
							<td>结束</td>
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
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
					   </c:otherwise>
					</c:choose>
				
				<input type = "hidden" class="orderBomId" value="${c.orderBomBase.id}"/>
				<input type = "hidden" class="status"  value="${c.status}"/>
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