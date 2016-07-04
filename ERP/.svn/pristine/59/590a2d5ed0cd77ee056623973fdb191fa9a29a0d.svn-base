<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>生产需求管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript" src="${ctxStatic}/modules/process/scripts/process.js?tsf=${jsVersion}"></script>
	
	<script type="text/javascript">
		/* //验证指派
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
			return true;
		} */
		
	</script>
</head>
<body>
	
	<div class="list-content">
	     <div class="nav-operate" >
		       <%-- ${ctx}/process/process/submitDemand  ${ctx}/process/processDemand/assign --%>
	           <form:form id="searchForm" modelAttribute="oaNotify" action="${ctx}/process/processDemand/assign" method="post" onsubmit="javascript:return validateAssign();" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        <shiro:hasRole name="物流文员">
		        <ul class="operationg-new" >
	            	<li >生产订单号：
	            		<select id="orderList" name="orderList" class="input-small" >
							<option value="">请选择</option>
							<c:forEach items="${obbList }" var="obb">
								<option value="${obb.seriesNumber}">${obb.seriesNumber}</option>
							</c:forEach>
						</select>
	            		</li>
	            	<!-- <li  class="operation-project" showWidth="500px" thisTagert="appoint-saider1" >
	            		<input id="intoWarehouse" type="button" class="input-medium" value="入库"></li>-->
            		<li id="createSend" style="display:none;" class="operation-project" showWidth="800px" thisTagert="cSendDetail" ></li> 
	            	<li><input id="createSendBtn" type="button" class="btn btn-primary" value="生成发货通知单" ></li> 
		        </ul>
		        </shiro:hasRole>
		        <ul class="search">
		            <li>
		               <input type="text" class="input-medium" placeholder="关键字">
		            </li>
		            <li>
		            	<button class="search-btn" id="table-set"  type="button">查询</button>
		            </li>
		        </ul>
		       <div class="clearfix"></div>
		       </form:form>
		       <div class="clear"></div>
			   
	      </div>
	     <sys:message content="${message}"/>
		 <table id="contentTable" class="table table-striped table-bordered table-condensed resize">
		   <thead>
		   	<tr>
			     <th class="all-check">
			         <input type="checkbox" id="all-check"  />
			         <label for="all-check">选择</label>
			     </th>
			     <th>箱号</th>
			     <!-- <th>下料单号</th>
			     <th>数量</th>
			     <th>入库数</th>
			     <th>发货数</th>
			     <th>备注</th> -->
             </tr>
            </thead>
            <tbody id="sendList">
            	<%-- <c:forEach items="${page.list}" var="p">
			<tr>
				<td><input type="checkbox" name="cBox" attrNumber="${p.seriesnumber}" value="${p.id}"></td>
				<td>
					${p.boxNo}
				</td>
				<td>
					<a name="processNumber" id="${pd.seriesnumber}" href="javascript:void(0);">
					<span class="operation-project" showWidth="600px" thisTagert="appoint-saider3" >
						${pd.seriesnumber}
					</span>
					</a>
				</td>
				<td>
					${pd.count}
				</td>
				<td>
					<a name="processNumber" id="${pd.seriesnumber}" href="javascript:void(0);">
					<span class="operation-project" showWidth="600px" thisTagert="appoint-saider4" >
						${pd.count}
					</span>
					</a>
				</td>
				<td>${pd.documentaryby.id}</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>
					<c:set var="status" value="${pd.status}"/>
					${fns:getDictLabel(status, 'process_status', '')}
				</td>
			</tr>
		</c:forEach> --%>
            </tbody>  
		 </table>
	</div>
	<div class="appoint-saider" id="cSendDetail">
	<form:form id="inputForm" modelAttribute="logisticsSend" action="${ctx}/logisticsSend/confirmSend" method="post" class="form-horizontal">
       <h3><i></i>生成发货通知单</h3>
        <ul>
	          <li>
	             <span class="tab-name">承运方名称：</span>
	             <label>
	             	<select id="sccb" name="sccb" class="input-small" >
	             		<option value=""></option>
                  		<c:forEach items="${fns:selByCondition('jsy')}" var="obj">
								<option value="${fns:escapeHtml(obj.userID)}" >${fns:escapeHtml(obj.userName)}</option>
						</c:forEach>
					</select>
	             	<%-- <form:input path="suppliersId" htmlEscape="false" maxlength="200" /> --%>
	             </label>   
	          </li>
	          <li>
	             <span class="tab-name">运输合同：</span>
	             <label>
	                 <%-- <form:input path="carriageContractId" htmlEscape="false" maxlength="200" /> --%>
	                 <select id="ysht" name="ysht" class="input-small" >
					</select>
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">车辆长度要求：</span>
	             <label>
	                 <form:input id="vehicleLength" path="vehicleLength" htmlEscape="false" maxlength="200" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">车辆吨位要求：</span>
	             <label>
	                 <form:input path="requireWeight" htmlEscape="false" maxlength="200" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">计划发货时间：</span>
	             <label>
	            	 <!-- <input name="endTime" id="endTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate " onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/> -->
	                 <form:input id="planSendDate" path="planSendDate" htmlEscape="false" maxlength="200" class="input-medium Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">要求到货时间：</span>
	             <label>
	                 <form:input id="requireDate" path="requireDate" htmlEscape="false" maxlength="200" class="input-medium Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">送货地址：</span>
	             <label>
	             	<form:select id="receiverAddress" name="receiverAddress" path="receiverAddress" class="input-medium ">
					</form:select>
	                 <%-- <form:input path="receiverAddress" htmlEscape="false" maxlength="200" /> --%>
	                 <!-- <select class="input-small" >
					</select> -->
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">收货员：</span>
	             <label>
	                 <form:input id="receiverUser" readOnly="readOnly" path="receiverUser" htmlEscape="false" maxlength="200" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">收货员电话：</span>
	             <label>
	                 <form:input id="receiverPhone" readOnly="readOnly" path="receiverPhone" htmlEscape="false" maxlength="200" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">备注：</span>
	             <label>
	                 <form:textarea path="remark" htmlEscape="false" maxlength="200"/>
	             </label>
	          </li>
	          <li class="all-line">
             <span class="tab-name">&nbsp;&nbsp;&nbsp;</span>
             <label>
                 <input type="button" onclick="submitData();"  value="提交" class="btn btn-primary"/>
             </label>
          </li>
		 </ul>
	     </form:form>
    </div>
</body>
</html>