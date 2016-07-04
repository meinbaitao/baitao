<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>已采购(钢辅料)</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript" src="${ctxStatic}/modules/purchase/scripts/purchase.js?tsf=${jsVersion}"></script>
	
	<script type="text/javascript">
		
		//生成采购订单
		function validateGP(){
			var checks = $("input[name='cBox']:checked");
			var ids = "";
			var vs = "";
			for(var i=0;i<checks.length;i++){
				var id = $(checks[i]).attr("value");
				var v = $("#xd"+id).val();//下单数量
				var yx = $("#yx"+id).text();//已下单
				var yy = $("#yy"+id).text();//运营
				if(parseInt(yy)<parseInt(yx)+parseInt(v)){
					window.alertx("下单数据不能大于需求数量！");
					return false;
				}
				ids+=id;
				vs+=v;
				if(i+1<checks.length){
					ids+=",";
					vs+=",";
				}
			}
			$("#ids").val(ids);
			$("#vs").val(vs);
			return true;
		}
	</script>
</head>
<body>
	<div class="list-content">
	     <div class="nav-operate" >															<%-- ${ctx}/purchase/purchase/submitDemand  ${ctx}/purchase/purchaseDemand/assign --%>
           <form:form id="searchForm" modelAttribute="purchaseDemand" action="${ctx}/purchase/purchaseDemand/list" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        <input id="returnUrl" name="returnUrl" type="hidden" value="${ctx}/purchase/purchaseDemand/hasPurchaseGFLList"/>
		       <div class="clearfix"></div>
	       </form:form>
		       <div class="clear"></div>
			   
	      </div>
	     <sys:message content="${message}"/>
	   <form:form id="generateForm" modelAttribute="purchaseDemand" action="${ctx}/purchase/purchase/createPurchaseGFL" onsubmit="javascript:return validateGP();" method="post" class="breadcrumb form-search">
			<input id="ids" name="ids" type="hidden" value=""/>
			<input id="vs" name="vs" type="hidden" value=""/>
			<input id="cgyID" name="cgyID" type="hidden" value=""/>
		 <table id="contentTable" class="table table-striped table-bordered table-condensed resize tree_table">
		   	<input id="isStatus" name="isStatus" type="hidden" value="${isStatus}"/>
		   <thead>
		   	<tr>
			     <th style="width:100px;">项目名称</th>
			     <th>下料单编号/类型</th>
			     <th style="width:100px;">材料编号</th>
			     <th style="width:100px;">材质</th>
			     <th style="width:100px;">材料规格</th>
			     <th style="width:200px;">材料名称</th>
			     <th style="width:100px;">设计数量</th>
			     <th style="width:100px;">运营下单数量</th>
			     <!-- <th style="width:100px;">运营下单时间</th> -->
			     <th style="width:100px;">采购已下单数量</th>
             </tr>
            </thead>
            <tbody>
               <c:forEach items="${listPD}" var="obj">
				<tr id="pro${obj.project.id}" class="0 first-level hide-childen" haschild="true" previd="" islastone="true" depth="1">
					<td colspan="9">
						<div class="tit">
			        	<i thisTagertId="${obj.project.id}" attrStatus="${isStatus }" attrID="listPro" attrVal="hasPurchase" class="glyphicon glyphicon-triangle-right"></i> 
				        <label class="operation-project">
				        	${obj.project.name}
				        </label>
					     </div>	
					</td>
				</tr>
			</c:forEach>
            </tbody>  
		 </table>
		 </form:form>
	</div>

</body>

</html>