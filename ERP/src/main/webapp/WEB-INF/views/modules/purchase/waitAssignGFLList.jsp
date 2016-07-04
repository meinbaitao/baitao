<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>待指派(钢、辅料)-采购主管</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<jsp:useBean id="now" class="java.util.Date" />
	<%-- <script type="text/javascript" src="${ctxStatic}/modules/production/scripts/production.js?tsf=${jsVersion}"></script> --%>
	<script type="text/javascript" src="${ctxStatic}/modules/purchase/scripts/purchase.js?tsf=${jsVersion}"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			var message="${message}";
			if(message!=""){
				window.alertx(message);
				loaded();
			}
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
	    	return false;
	    }
		//验证指派
		function validateAssign(){
			var flag = $("input[name='cBox']").is(':checked');//$("cBox").prop("checked");
			var obbFlag = $("input[name='obbaseBox']").is(':checked');
			if(!obbFlag&&!flag){
				window.alertx("请选择相应的列表数据！");
				loaded();
				return false;
			}
			var checks = $("input[name='cBox']:checked");
			var ids = "";
			for(var i=0;i<checks.length;i++){
				ids+=$(checks[i]).attr("value");
				if(i+1<checks.length)
					ids+=",";
			}
			var obbChecks = $("input[name='obbaseBox']:checked");
			var obbIDs = "";
			for(var i=0;i<obbChecks.length;i++){
				obbIDs+=$(obbChecks[i]).attr("value");
				if(i+1<obbChecks.length)
					obbIDs+=",";
			}
			$("#assignIDs").val(ids);
			$("#obbIDs").val(obbIDs);
			$("#cgyID").val($("#cgy").val());
			return true;
		}
		
	</script>
</head>
<body>
	
	<div class="list-content">
	     <div class="nav-operate" >
           <form:form id="searchForm" modelAttribute="production" action="" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        <input id="returnUrl" name="returnUrl" type="hidden" value="${ctx}/purchase/purchaseDemand/waitAssignGFLList"/>
		        <shiro:hasAnyRoles name="${fns:getWhitelistsList('dzpgfl')}">
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
		        </shiro:hasAnyRoles>
		       <div class="clearfix"></div>
	       </form:form>
		       <div class="clear"></div>
			   
	      </div>
	     <sys:message content="${message}"/>
		<form:form id="assignForm" action="${ctx}/purchase/purchaseDemand/assignGFL" method="post" onsubmit="javascript:return validateAssign();" class="breadcrumb form-search">
			<input id="assignIDs" name="assignIDs" type="hidden" value=""/>
			<input id="cgyID" name="cgyID" type="hidden" value=""/>
			<input id="obbIDs" name="obbIDs" type="hidden" value=""/>
		 <table id="contentTable" class="table table-striped table-bordered table-condensed resize tree_table">
		   	<input id="isStatus" name="isStatus" type="hidden" value="${isStatus}"/>
		   <thead>
		   	<tr>
			     <th style="width:100px;">项目名称</th>
			     <th>下料单编号/类型</th>
			     <th style="width:100px;">材料编号</th>
			     <th style="width:200px;">材料名称</th>
			     <th style="width:100px;">设计数量</th>
			     <th style="width:100px;">运营下单数量</th>
			     <!-- <th style="width:100px;">运营下单时间</th> -->
			     <th style="width:100px;">采购已下单数量</th>
			     <th style="width:100px;">采购员</th>
			     <!-- <th style="width:100px;">采购下单数量</th> -->
             </tr>
            </thead>
            <tbody>
               <c:forEach items="${page.list}" var="production">
				<tr id="pro${production.project.id}" class="0 first-level hide-childen" haschild="true" previd="" islastone="true" depth="1">
					<td colspan="9">
						<div class="tit">
						<!-- <input type="checkbox">   -->
			        	<i thisTagertId="${production.project.id}" attrStatus="${isStatus }" attrID="listPro" attrVal="waitAssign" class="glyphicon glyphicon-triangle-right"></i> 
				        <label class="operation-project">
				        	${production.project.name}
				        </label>
					     </div>	
					</td>
				</tr>
			</c:forEach>
            </tbody>  
		 </table>
		 </form:form>
	</div>
    <div class="pagination">${page}</div>
</body>
</html>