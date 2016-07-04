<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>确认发货（石材）</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript" src="${ctxStatic}/jquery/jquery.json.js?tsf=${jsVersion}"></script>
	<script type="text/javascript" src="${ctxStatic}/modules/logistics/scripts/productionLogistics.js?tsf=${jsVersion}"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
	    	return false;
	    }
		
		//验证生成发货通知单
		function validateSave(){
			var flag = $("input[name='cBox']").is(':checked');//$("cBox").prop("checked");
			var obbFlag = $("input[name='parentBox']").is(':checked');
			if(!obbFlag&&!flag){
				window.alertx("请选择相应的列表数据！");
				loaded();
				return false;
			}
			
			return true;
		}
	</script>
</head>
<body><%--  onsubmit="javascript:return validateGS();" --%>
	<form:form style="display:none;" id="confirmSendForm" modelAttribute="logisticsSend" onsubmit="javascript:return validateSave();" action="${ctx}/logistics/productionLogistics/confirmConsignment" method="post" class="form-horizontal">
       	<input id="confirmSendids" name="ids" type="hidden" value=""/>
       	<input id="confirmSendpJson" name="pJson" type="hidden" value=""/>
    </form:form>
    <form:form style="display:none;" id="returnSendForm" modelAttribute="logisticsSend" onsubmit="javascript:return validateSave();" action="${ctx}/logistics/productionLogistics/returnSend" method="post" class="form-horizontal">
       	<input id="returnSendids" name="ids" type="hidden" value=""/>
       	<input id="returnSendpJson" name="pJson" type="hidden" value=""/>
    </form:form>
	<div class="list-content">
	     <div class="nav-operate" >
           <form:form id="searchForm" modelAttribute="logisticsSend" action="${ctx}/logistics/productionLogistics/confirmSendList" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<shiro:hasAnyRoles name="${fns:getWhitelistsList('qrfh')}">
			        <ul class="operationg-new" >
			       	 	<li>
		            	   <input attrID="confirmSendBtn" type="button" class="btn btn-primary" value="确认发货">
		            	</li>
		            	<li>
		            	   <input attrID="returnSendBtn" type="button" class="btn btn-primary" value="退回发货">
		            	</li>
		            	<li>
		            	   <input attrID="createSendBtn" type="button" class="btn btn-primary" value="新增发货">
		            	</li>
			        </ul>
		       </shiro:hasAnyRoles>
		       <div class="clearfix"></div>
	       </form:form>
	      </div>
			<table id="contentTable" class="table table-striped table-bordered table-condensed resize tree_table">
				<input id="isStatus" name="isStatus" type="hidden" value="${isStatus}"/>
				<thead>
					<tr>
						<th>省份</th>
						<th>项目名称</th>
						<th>楼栋号</th>
						<th>石材品种</th>
						<th>加工厂</th>
						<th>已派车未发货箱数</th>
						<th>要求到货时间</th>
						<th>收货地址</th>
						<th>确认发货箱数<span class="red">*</span></th>
						<th>状态</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${page.list}" var="obj"  varStatus="i">
						<tr id="lid${obj.id }${obj.project.id }" lid="${obj.id }">
							<%-- <td ><input attrID="sendLSID" type="checkbox" name="lsID" value="${obj.id }"></td> --%>
							<td colspan="5">${obj.seriesnumber }</td>
							<td>
								<a href="javascript:void(0)" ln="${obj.seriesnumber }" lid="${obj.id }" projectName="${obj.project.name }" projectId="${obj.project.id }" attrID="hasCarWaitSendCount" >
									${obj.extraData.hasCarWaitSendCount }
								</a>
							</td>
							<td>${obj.production.planSendDateLab }</td>
							<td>${obj.project.address }</td>
							<td><!--<input attrID="cBox" type="checkbox" name="parentBox" value="">--></td>
							<td>&nbsp;</td>
						</tr>
						<%-- <tr>
							<td>${list.project.name }</td>
							<td>${list.seriesnumber }</td>
							<td>${list.quantity }</td>
							<td>${list.extraData.countBox }</td>
							<td>${list.chargeType }</td>
							<td>${list.supp.name }</td>
							<td>${list.vehicleLength }</td>
							<td>${list.driveName }</td>
							<td>${list.drivePhone }</td>
							<td>${list.statusLable }</td>
						</tr> --%>
					</c:forEach>
				</tbody>  
			</table>
	</div>
    <div class="pagination">${page}</div>
</body>
</html>