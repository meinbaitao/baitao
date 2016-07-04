<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>供应商发货列表数据</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript" src="${ctxStatic}/modules/purchase/scripts/purchase.js?tsf=${jsVersion}"></script>
	
	<script type="text/javascript">
		
		//验证下单
		function validateSubmitDemand(){
			var falg = $("input[name='cBox']").is(':checked');
			if(!falg){
				window.alertx("请选择相应的列表数据！");
				return false;
			}
			var checks = $("input[name='cBox']:checked");
			var ids = "";
			var ps = "";
			for(var i=0;i<checks.length;i++){
				var id = $(checks[i]).attr("value");
				var p = $("#price"+id).val();
				ids+=id;
				ps+=p;
				if(i+1<checks.length){
					ids+=",";
					ps+=",";
				}
			}
			$("#sdIDs").val(ids);
			$("#ps").val(ps);
			return true;
		}
		function validateSave(){
			var flag = $("input[name='cBox']").is(':checked');
			if(!flag){
				window.alertx("请选择相应的列表数据！");
				return false;
			}
			var checks = $("input[name='cBox']:checked");
			var ids = "";
			for(var i=0;i<checks.length;i++){
				var id = $(checks[i]).attr("value");
				ids+=id;
				if(i+1<checks.length){
					ids+=",";
				}
			}
			$("#seriesnumbers").val(ids);
			return true;
		}
	</script>
</head>
<body>
	<form:form id="detailForm" style="display:none;" action="${ctx}/purchase/purchase/getGFLGYSSendDetailBySeriesNumber" method="post" class="breadcrumb form-search">
		<input id="detailSN" name="seriesnumber" type="hidden" value=""/>
	</form:form>
	<form:form id="saveForm" style="display:none;" action="${ctx}/purchase/purchase/purchaseGYSSigns" onsubmit="javascript:return validateSave();" method="post" class="breadcrumb form-search">
		<input id="seriesnumbers" name="seriesnumbers" type="hidden" value=""/>
	</form:form>
	<div class="list-content">
	     <div class="nav-operate" >															
           <form:form id="searchForm" modelAttribute="purchase" action="${ctx}/purchase/purchase/purchaseGYSSendList" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        
		        <ul class="operationg-new" >
		        	<!-- <input type="button" name="saveBtn" id="saveBtn" class="btn btn-primary" value="签收"> -->
		        </ul>
		        <ul class="search">
		            <li>
		               <form:input path="seriesnumber" htmlEscape="false" class="input-medium" placeholder="订单编号"/>
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
		 <table id="contentTable" class="table table-striped table-bordered table-condensed resize table-eidt width-75">
		   <thead>
		   	<tr>
			     <th >序号
			     </th>
			     <th>订单编号</th>
			     <th>制单日期</th>
			     <th>制单状态</th>
             </tr>
            </thead>
            <tbody>
            	<c:forEach items="${page.list}" var="obj" varStatus="i">
			<tr>
				<td>
					${i.index+1 }
				</td>
				<td>
					<a name="purchaseDetail" sn="${obj.seriesnumber}" href="javascript:void(0);">
						${obj.seriesnumber}
					</a> 
				</td>
				
				<td><fmt:formatDate value="${obj.createDate}" pattern="yyyy-MM-dd" /></td>
				<td>
					<%-- ${obj.statusLab } --%>
					${obj.extraData.status }
				</td>
			</tr>
		</c:forEach>
            </tbody>  
		 </table>
	</div>
</body>

</html>