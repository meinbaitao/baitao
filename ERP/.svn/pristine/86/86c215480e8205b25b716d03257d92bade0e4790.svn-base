<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>通知发货（石材）</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
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
		function validateGS(){
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
				var id = $(checks[i]).attr("value");
				ids+=id;
				if(i+1<checks.length){
					ids+=",";
				}
			}
			var obbChecks = $("input[name='obbaseBox']:checked");
			var obbIDs = "";
			for(var i=0;i<obbChecks.length;i++){
				obbIDs+=$(obbChecks[i]).attr("value");
				if(i+1<obbChecks.length)
					obbIDs+=",";
			}
			$("#obbIDs").val(obbIDs);
			$("#sendIDs").val(ids);
			/* $("#planSendDate").val($("#planSendDateStr").val()); */
			return true;
		}
	</script>
</head>
<body>
	<%-- <form:form style="display:none;" id="saveForm" modelAttribute="logisticsSend" action="${ctx}/logistics/productionLogistics/noticeSend" onsubmit="javascript:return validateGS();" method="post" class="form-horizontal">
       	<input id="sendIDs" name="sendIDs" type="hidden" value=""/>
       	<input id="obbIDs" name="obbIDs" type="hidden" value=""/>
       	<input id="planSendDate" name="planSendDate" type="hidden" value=""/>
       	<input id="obboxStatus" name="obboxStatus" type="hidden" value="${isStatus}"/>
    </form:form> --%>
	<div class="list-content">
	     <div class="nav-operate" >
           <form:form id="searchForm" modelAttribute="production" action="${ctx}/logistics/productionLogistics/noticeSendList" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        <!-- <ul class="operationg-new" >
		        	 
		        	 <input id="saveBtn" id="saveBtn" type="button" class="btn btn-primary" value="通知发货">
		        </ul> -->
		       <%--  <ul class="search">
		            <li>
		               <form:input path="seriesnumber" htmlEscape="false" class="input-medium" placeholder="关键字"/>
		               <!-- <input name="no" type="text" class="input-medium" placeholder="关键字"> -->
		            </li>
		            <li>
		            	<input class="search-btn" type="submit" id="searchBtn" name="searchBtn" value="查询"/>
		            	<!-- <input class="search-btn" id="table-set"  type="submit" value="查询" /> -->
		            </li>
		        </ul> --%>
		       <div class="clearfix"></div>
	       </form:form>
		       <div class="clear"></div>
			   
	      </div>
	     <sys:message content="${message}"/>
		 <table id="contentTable" class="table table-striped table-bordered table-condensed resize tree_table width-75">
		    <input id="isStatus" name="isStatus" type="hidden" value="${isStatus}"/>
		   <thead>
		   	<tr>
		   		<th style="width:100px;">项目名称</th>
			     <th style="width:80px;">下料单单号/类型</th>
			     <th>箱号</th>
			     <th>物料编号</th>
			     <th>备注</th>
			     <th style="width:120px;">状态</th>
             </tr>
            </thead>
            <tbody id="noticeSendDetail">
            	<c:forEach items="${page.list}" var="production">
					<tr id="pro${production.project.id}" class="0 first-level hide-childen" haschild="true" previd="" islastone="true" depth="1">
						<td colspan="6">
							<div class="tit">
							<input style="display:none;" type="checkbox">  
				        	<i thisTagertId="${production.project.id}" attrStatus="${isStatus }" attrID="noticeSendPro" class="glyphicon glyphicon-triangle-right"></i> 
					        <label class="operation-project">
					        	${production.project.name}
					        </label>
						     </div>	
						</td>
					</tr>
				</c:forEach>
            </tbody>  
		 </table>
		 <div class="div_right" id="waitSendDiv">
	 <form:form id="inputForm" modelAttribute="logisticsSend" action="${ctx}/logistics/productionLogistics/noticeSend" onsubmit="javascript:return validateGS();" method="post" class="form-horizontal">
       	<input id="sendIDs" name="sendIDs" type="hidden" value=""/>
       	<input id="obbIDs" name="obbIDs" type="hidden" value=""/>
       	<!-- <input id="planSendDate" name="planSendDate" type="hidden" value=""/> -->
       	<input id="obboxStatus" name="obboxStatus" type="hidden" value="${isStatus}"/>
       <h3><i></i>生成发货通知单</h3>
        <ul>
	          <li>
	             <span class="tab-name">发货车次：</span>
	             <label>
	                 <form:input id="number" path="number" class="input-medium" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">计划发货时间：</span>
	             <label>
	                 <form:input id="planSendDate" path="planSendDate" name="planSendDate" type="text" class="input-medium Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" value="${logisticsSend.planSendDate }" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">发货箱数：</span>
	             <label>
	                 <form:input id="quantity" path="quantity" class="input-medium" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">理论重量：</span>
	             <label>
	                 <form:input id="theoryWeight" path="theoryWeight" class="input-medium" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">发货地点：</span>
	             <label>
	                 <%-- <form:input id="sendAddress" path="sendAddress" class="input-medium" /> --%>
	                 <form:select id="sendAddress" path="sendAddress" class="input-medium" tabindex="-1">
						<option value="">请选择</option>
						<form:options items="${fns:getDictList('send_address')}" itemValue="label" itemLabel="label" htmlEscape="false"/>
					 </form:select>
	             </label>
	          </li>
	          <%-- <li>
	             <span class="tab-name">承运方名称：</span>
	             <label>
	             	<select id="cyf" name="cyf" class="input-medium" >
	             		<option value="">请选择</option>
	                    <c:forEach items="${listSCCB}" var="sccb">
							<option settlementType="${sccb.settlementType }" partyBName="${sccb.partyBName}" value="${sccb.id}">${sccb.partyBName}</option>
						</c:forEach>
					</select>
	             </label>   
	          </li>
	          <li>
	             <span class="tab-name">合同编号：</span>
	             <label>
	             	<select id="sccb" name="sccb" class="input-medium" >
	             	
					</select>
	             </label>   
	          </li>
	          <li>
	             <span class="tab-name">结算方式：</span>
	             <label>
	                 <form:input readOnly="readOnly" id="settlement" path="settlement" htmlEscape="false" maxlength="200" />
	             </label>
	          </li> --%>
	          <li>
	             <span class="tab-name">长度要求：</span>
	             <label>
	                 <%-- <form:input id="vehicleLength" path="vehicleLength" htmlEscape="false" maxlength="200" /> --%>
	                 <form:select id="vehicleLength" path="vehicleLength" class="input-medium" tabindex="-1">
						<option value="">请选择</option>
						<form:options items="${fns:getDictList('changduyaoqiu')}" itemValue="label" itemLabel="label" htmlEscape="false"/>
					 </form:select>
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">吨位要求：</span>
	             <label>
	                 <form:input path="requireWeight" htmlEscape="false" maxlength="200" />
	             </label>
	          </li>
	          <%-- <li>
	             <span class="tab-name">是否保底：</span>
	             <label>
	                 <form:select id="isassure" path="isassure" class="input-medium" tabindex="-1">
						<form:options items="${fns:getDictList('yes_no')}" itemValue="value" itemLabel="label" htmlEscape="false"/>
					 </form:select>
	             </label>
	          </li> --%>
	          <li>
	             <span class="tab-name">备注：</span>
	             <label>
	                 <form:textarea path="remark" htmlEscape="false" maxlength="200"/>
	             </label>
	          </li>
	          <li class="all-line">
	             	<span class="tab-name"></span>
	             	<label>
	                 <input type="submit"  value="通知发货" class="btn btn-primary"/>
	             	</label>
          		</li>
		 </ul>
	     </form:form>
    	</div>
	</div>
   <%--  <div class="pagination">${page}</div> --%>
</body>
</html>