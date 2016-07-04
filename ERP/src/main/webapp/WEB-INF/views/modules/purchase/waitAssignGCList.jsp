<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>待指派（钢材）</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<%@include file="/WEB-INF/views/include/activitiHeader.jsp"%>
	<jsp:useBean id="now" class="java.util.Date" />
	<script type="text/javascript" src="${ctxStatic}/modules/purchase/scripts/purchase.js?tsf=${jsVersion}"></script>
	
	<script type="text/javascript">
	//验证指派
	function validateAssign(){
		var falg = $("input[name='cBox']").is(':checked');//$("cBox").prop("checked");
		if(!falg){
			alert("请选择相应的列表数据！");
			return false;
		}
		var checks = $("input[name='cBox']:checked");
		var ids = "";
		for(var i=0;i<checks.length;i++){
			ids+=$(checks[i]).attr("value");
			if(i+1<checks.length)
				ids+=",";
		}
		$("#assignIDs").val(ids);
		$("#cgyID").val($("#cgy").val());
		return true;
	}
	</script>
</head>
<body>
	<form:form id="assignForm" style="display:none;" modelAttribute="oaNotify" action="${ctx}/purchase/purchaseDemand/assignGC" method="post" onsubmit="javascript:return validateAssign();" class="breadcrumb form-search">
		<input id="assignIDs" name="assignIDs" type="hidden" value=""/>
		<input id="cgyID" name="cgyID" type="hidden" value=""/>
	</form:form>
	<div class="list-content">
		<div class="nav-operate" >															
           <form:form id="searchForm" modelAttribute="purchaseDemand" action="${ctx}/purchase/purchaseDemand/waitAssignHCList" method="post" class="breadcrumb form-search">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
			        <ul class="operationg-new" >
						<li>采购员:
			           		<select id="cgy" name="cgy" class="input-mini">
			           			<c:forEach items="${fns:selByCondition('cgy')}" var="obj">
									<option value="${fns:escapeHtml(obj.userID)}" >${fns:escapeHtml(obj.userName)}</option>
								</c:forEach>
	                 		</select>
	                 	</li>
						<li>
		            	    <input id="assignBtn" id="assignBtn" type="button" class="btn btn-primary" value="指派">
		            	</li>
			        </ul>
			        <ul class="search">
			            <li>
			               <form:input path="seriesnumber" htmlEscape="false" class="input-medium" placeholder="关键字"/>
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
	   <form:form id="saveFrom" action="${ctx}/purchase/applyPurchase/saveFrom" method="post" class="breadcrumb form-search">
		 <table id="contentTable" class="table table-striped table-bordered table-condensed resize table-eidt">
		   <thead >
		   	<tr class="copy" >
		   		 <th >选择</th>
			     <th >下料单编号</th>
			     <th >工程名称</th>
			     <th >栋号</th>
			     <th >材料名称</th>
			     <th >材料规格</th>
			     <!-- <th>材质</th> -->
			     <th>单位</th>
			     <th>订单数量</th>
			     <th>采购已下单数</th>
			     <th>采购员</th>
			     <!-- <th>采购下单数量</th> -->
			     <!-- <th>镀锌厂发货数量</th>
			     <th>50*50*5角钢</th> -->
             </tr>
            </thead>
            <tbody id="obbDetail" copy="false">
            	<c:forEach items="${page.list}" var="pd">
            		<tr >
            			 <td >
	            			 <c:choose>
								<c:when test="${pd.status ne isStatus }">
									<input type="checkbox" name="cboxs" disabled="disabled" value="">
								</c:when>
								<c:otherwise>
									<input value="${pd.id}" name="cBox" type="checkbox">
								</c:otherwise>
							 </c:choose>
            			 </td>
					     <td >${pd.obb.orderBomNo}</td>
					     <td >${pd.pro.name}</td>
					     <td >${pd.obb.building}</td>
					     <td >${pd.obd.materielName}</td>
					     <td >${pd.obd.standardDesc}</td>
					     <%-- <td>${obb.orderBomNo}材质</td> --%>
					     <td>${pd.obd.unit}</td>
					     <td>${pd.obd.count}</td>
					     <td>&nbsp;</td>
					     <td>${pd.assignto.name}</td>
					     <%-- <td><input name="count" id="count${obd.id}" type="text"></td> --%>
					     <!-- <th>镀锌厂发货数量</th>
					     <th>50*50*5角钢</th> -->
		             </tr>
				</c:forEach>
            </tbody>  
            <!-- <tfoot>
              <tr>
		   		 <td colspan="5">合计</td>
			     <td id="gsmj">0</td>
			     <td ><input id="cg10" class="ap" type="text" style="width:80px;display:none;"></td>
			     <td ><input id="cg8" class="ap" type="text" style="width:80px;display:none;"></td>
			     <td ><input id="cg6d3" class="ap" type="text" style="width:80px;display:none;"></td>
			     <td ><input id="jg554" class="ap" type="text" style="width:80px;display:none;"></td>
			     <td ><input id="jg555" class="ap" type="text" style="width:80px;display:none;"></td>
              </tr>
            </tfoot> -->
		 </table>
		 </form:form>
	</div>
	
</body>
</html>