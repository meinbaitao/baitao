<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>采购单（钢、辅料）</title>
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
	</script>
</head>
<body>
	<form:form id="detailForm" style="display:none;" action="${ctx}/purchase/purchase/getGFLDetailBySeriesNumber" method="post" class="breadcrumb form-search">
		<input id="detailSN" name="seriesnumber" type="hidden" value=""/>
	</form:form>
	<div class="list-content">
	     <div class="nav-operate" >	
           <form:form id="searchForm" modelAttribute="purchase" action="${ctx}/purchase/purchase/purchaseGFLList" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        
		        <ul class="operationg-new" >
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
		 <table id="contentTable" class="table table-striped table-bordered table-condensed resize table-eidt">
		   <thead>
		   	<tr>
			     <th>订单编号</th>
			     <th>项目名称</th>
			     <th>供应商名称</th>
			     <th>合同编号</th>
			     <th>发货日期</th>
			     <!-- <th>材料名称</th>
			     <th>采购数量</th>
			     <th>库存数量</th>
		     	 <th>采购下单数量</th>
			     <th>单价(元/公斤)</th> -->
			     <!-- <th>状态</th> -->
			     <th>制单日期</th>
			     <th>状态</th>
			     <!-- <th>采购员</th> -->
			     <!-- <th>操作</th> -->
             </tr>
            </thead>
            <tbody>
            	<c:forEach items="${page.list}" var="obj">
					<tr>
						<td>
							<a name="purchaseDetail" sn="${obj.seriesnumber}" href="javascript:void(0);">
								${obj.seriesnumber}
							</a> 
						</td>
						<td>${obj.purchaseDemand.project.name}</td>
						<td>${obj.supp.name}</td>
						<td>${obj.purchasingContractBase.contractNo}</td>
						<td><fmt:formatDate value="${obj.purchaseSFDetail.createDate}" pattern="yyyy-MM-dd" /></td>
						<td ><fmt:formatDate value="${obj.createDate}" pattern="yyyy-MM-dd" /></td>
						<td>&nbsp;
							<c:choose>
								<c:when test="${obj.workflowstatus eq '2' or obj.workflowstatus eq '1'}">
									待审核
								</c:when>
								<c:when test="${obj.workflowstatus eq '4'}">
									<!-- 已完成 -->
									${obj.statusLab}
								</c:when>
								<c:otherwise>待提交</c:otherwise>
							</c:choose>
						</td>
					</tr>
		</c:forEach>
            </tbody>  
		 </table>
	</div>
</body>

</html>