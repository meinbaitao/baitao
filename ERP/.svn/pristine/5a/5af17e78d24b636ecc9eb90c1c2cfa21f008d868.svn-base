<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>工地收货 列表数据</title>
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
	<form:form id="detailForm" style="display:none;" action="${ctx}/purchase/purchase/getGFLGYSReceiveDetailBySeriesNumber" method="post" class="breadcrumb form-search">
		<input id="detailSN" name="seriesnumber" type="hidden" value=""/>
	</form:form>
	<form:form id="saveForm" style="display:none;" action="${ctx}/purchase/purchase/purchaseGYSSigns" onsubmit="javascript:return validateSave();" method="post" class="breadcrumb form-search">
		<input id="seriesnumbers" name="seriesnumbers" type="hidden" value=""/>
	</form:form>
	<div class="list-content">
	     <div class="nav-operate" >															
           <form:form id="searchForm" modelAttribute="purchase" action="${ctx}/purchase/purchase/purchaseGDReceiveList" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        
		        <ul class="operationg-new" >
		        	<!-- <input type="button" name="saveBtn" id="saveBtn" class="btn btn-primary" value="签收"> -->
		        </ul>
		        <ul class="search">
		            <li>
		               <!-- <input type="text" class="input-medium" placeholder="关键字"> -->
		               <form:input path="seriesnumber" htmlEscape="false" class="input-medium" placeholder="订单编号"/>
		            </li>
		            <li>
		            	<input class="search-btn" type="submit" value="查询"/>
		            	<!-- <button class="search-btn" id="table-set"  type="button">查询</button> -->
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
			     <th>序号
			         <!-- <input type="checkbox" id="all-check"  />
			         <label for="all-check">选择</label> -->
			     </th>
			     <th>订单编号</th>
			     <!-- <th>材料名称</th>
			     <th>采购数量</th>
			     <th>库存数量</th>
		     	 <th>采购下单数量</th>
			     <th>单价(元/公斤)</th> -->
			     <!-- <th>状态</th> -->
			     <th>制单日期</th>
			     <th>状态</th>
			     <!-- <th>采购员</th> -->
			     <th>操作</th>
             </tr>
            </thead>
            <tbody>
            	<c:forEach items="${page.list}" var="p" varStatus="i">
			<tr>
				<td>
					<%-- <c:choose>
						<c:when test="${p.status ne isStatus}">
							<input style="display:none;" type="checkbox" name="cboxs" disabled="disabled" value="">
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="cBox" value="${p.seriesnumber}">
						</c:otherwise>
					</c:choose> --%>
					${i.index+1 }
				</td>
				<td>
					<a name="purchaseDetail" sn="${p.seriesnumber}" href="javascript:void(0);">
						${p.seriesnumber}
					</a> 
				</td>
				
				<td><fmt:formatDate value="${p.createDate}" pattern="yyyy-MM-dd" /></td>
				<td>
					<c:if test="${p.status eq isStatus}">
						<a href="${ctx}/accident/accidentManage/startupGFCReceiveAccident/${p.seriesnumber}">发起收货事故</a>
					</c:if>
				</td>
				<td>${p.extraData.status}</td>
				<%-- <td>&nbsp;
					<c:choose>
						<c:when test="${p.workflowstatus eq '2' or p.workflowstatus eq '1'}">
							待审核
						</c:when>
						<c:when test="${p.workflowstatus eq '4'}">
							已完成
						</c:when>
						<c:otherwise>待提交</c:otherwise>
					</c:choose>
				</td> --%>
			</tr>
		</c:forEach>
            </tbody>  
		 </table>
	</div>
</body>

</html>