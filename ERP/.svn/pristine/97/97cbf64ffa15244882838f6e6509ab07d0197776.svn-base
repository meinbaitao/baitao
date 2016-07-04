<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>发货通知单列表</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/modules/logistics/scripts/logistics.js?tsf=${jsVersion}" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<div class="list-content">
	     <div class="nav-operate" >
	           <form:form id="searchForm" modelAttribute="logisticsSend" action="${ctx}/logisticsSend/logisticsSendList?logo=1" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        <ul class="search">
		            <li>
		               <input value="${param.lsCode }" id="lsCode" name="lsCode" type="text" class="input-medium" placeholder="关键字">
		               <%-- <form:input path="logisticssendCode" htmlEscape="false" class="input-medium" placeholder="关键字"/> --%>
		            </li>
		            <li>
		            	<!-- <button class="search-btn" id="table-set"  type="button"  >查询</button> -->
		            	<input class="search-btn" type="submit" id="searchBtn" name="searchBtn" value="查询"/>
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
		   	 <th>序号</th>	
		     <th>发货通知单号</th>
             <!-- <th>发货工厂</th>  -->
             <th>发货数量(箱)</th>  
             <!-- <th>承运方名称</th>   -->
		     <!-- <th>计划发货日期</th>
		     <th>实际发货日期</th>
		     <th>制单人</th>
		     <th>发货人</th> -->
             <th>创建时间</th>
		     <th>单据状态</th>
		     <th>操作</th>
		     </tr>
            </thead>
            <tbody>
            <c:forEach items="${page.list}" var="items" varStatus="i">
              <tr>
               <td>${i.index + 1}</td>
               <td>${items.logisticssendCode}</td>
               <%-- <td>${items.sendFactory }</td> --%>
               <td>${items.quantity }</td>
               <%-- <td>${items.suppliersId }</td>
               <td>${items.planSendDate }</td>
               <td>${items.factSendDate }</td>
               <td>${items.makeUser }</td>
               <td>${items.sendUser }</td> --%>
               <td>${items.crDate }</td>
               <td>
               	   <c:if test="${items.status == 0 }">
               	   		待发货
               	   </c:if>
               	   <c:if test="${items.status == 1 }">
               	   		部分发货
               	   </c:if>
               	   <c:if test="${items.status == 2 }">
               	   		完全发货
               	   </c:if>               
               </td>
               <td>
               	   <%-- <shiro:hasAnyRoles name="发货员,采购员"> --%>
	               	   <c:if test="${items.status == 0 }">
	               	   		<div class="operation-project" showWidth="800px" thisTagert="appoint-saider" id="confirmSend" thisTagertId="${items.logisticssendid}">
				        		<a>确认发货</a>
			        		</div>
	               	   </c:if>
               	   <%-- </shiro:hasAnyRoles> --%>
               	   <c:if test="${items.status == 1 || items.status == 2}">
               	   		<div class="operation-project" showWidth="800px" thisTagert="appoint-saider2" id="viewDetail" thisTagertId="${items.logisticssendid}">
			        		<a>查看详情</a>
		        		</div>
               	   </c:if>
               </td>
              </tr>
            </c:forEach>  
            </tbody>  
		 </table>
	</div>
	<div class="appoint-saider" id="appoint-saider">
	<form:form id="inputForm" modelAttribute="logisticsSend" action="${ctx}/logisticsSend/confirmSend" method="post" class="form-horizontal">
	<h3><i></i>确认发货</h3>	
	     
		 <ul>
		    <li class="tips">
                                             显示项
          </li>
	       	  <li>
	             <span class="tab-name">发货通知单号：</span>
	             <label>
	                 <form:input path="logisticssendCode" htmlEscape="false" maxlength="200" readonly="true" type="text" />
	                 <form:hidden path="logisticssendid"/>
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">发货工厂：</span>
	             <label>
	                 <form:input path="sendFactory" htmlEscape="false" maxlength="200" readonly="true" type="text" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">承运方名称：</span>
	             <label>
	             	<form:input path="suppliersId" htmlEscape="false" maxlength="200" readonly="true" type="text" />
	             </label>   
	          </li>
	          <li>
	             <span class="tab-name">运输合同：</span>
	             <label>
	                 <form:input path="carriageContractId" htmlEscape="false" maxlength="200" readonly="true" type="text" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">车辆长度要求：</span>
	             <label>
	                 <form:input path="vehicleLength" htmlEscape="false" maxlength="200" readonly="true" type="text" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">车辆吨位要求：</span>
	             <label>
	                 <form:input path="requireWeight" htmlEscape="false" maxlength="200" readonly="true" type="text" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">计划发货时间：</span>
	             <label>
	            	 
	                 <form:input path="planSendDate" htmlEscape="false" maxlength="200" readonly="true" type="text" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">要求到货时间：</span>
	             <label>
	                 <form:input path="requireDate" htmlEscape="false" maxlength="200" readonly="true" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">送货地址：</span>
	             <label>
	                 <form:input path="receiverAddress" htmlEscape="false" maxlength="200" readonly="true" type="text" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">收货联系人：</span>
	             <label>
	                 <form:input path="receiverUser" htmlEscape="false" maxlength="200" readonly="true" type="text" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">收货联系人电话：</span>
	             <label>
	                 <form:input path="receiverPhone" htmlEscape="false" maxlength="200" readonly="true" type="text" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">备注：</span>
	             <label>
	                 <form:input path="remark" htmlEscape="false" maxlength="200" readonly="true" type="text" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">总箱数：</span>
	             <label>
	             	<form:input readonly="true" path="quantity" htmlEscape="false" maxlength="200"/>
	                 <!-- <input id="viewquantity" readonly="readonly" type="text" /> -->
	             </label>
	          </li>
	         <li class="tips">
                                             填写项
             </li>
	          <li>
	             <span class="tab-name">司机姓名：</span>
	             <label>
	                 <form:input path="driveName" htmlEscape="false" maxlength="200" class="input-medium"/>
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">司机电话：</span>
	             <label>
	                 <form:input path="drivePhone" htmlEscape="false" maxlength="200"/>
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">驾驶证号：</span>
	             <label>
	                 <form:input path="credentials" htmlEscape="false" maxlength="200"/>
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">车牌号码：</span>
	             <label>
	                 <form:input path="vehicleNumber" htmlEscape="false" maxlength="200" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">发车重量：</span>
	             <label>
	                 <form:input path="weight" htmlEscape="false" maxlength="200"/>
	             </label>
	          </li>
	          <li class="tips">
                                             勾选项
             </li>
             <div class="hr_ hr_20"></div>
            <table id="contentTable" class="table table-striped table-bordered table-condensed resize">
		   <thead>
		   <tr>
		   	 <th class="all-check">
		         <input type="checkbox" id="all-check" >
		         <label for="all-check">全选</label>
		     </th>
		     <th>箱号</th>
		     <th>下料单号</th>
             <th>状态</th>
             </tr> 
            </thead>
            <tbody id="boxList">
            </tbody>  
		 </table>
	     </ul>
	     
		 <ul>
		 	<li class="line">
	             <p align="center">
	                 <input type="button" class="btn btn-primary"  value="提交" onclick="submitData();"/>
	             </p>
             </li>
	     </ul>
	</form:form>
	</div>
	
	<div class="appoint-saider" id="appoint-saider2">
	<h3><i></i>查看详情</h3>	
		 <ul>
	       	  <li>
	             <span class="tab-name">发货通知单号：</span>
	             <label>
	                 <input id="viewlogisticssendCode" readonly="true" type="text" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">发货工厂：</span>
	             <label>
	                 <input id="viewsendFactory" readonly="true" type="text" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">承运方名称：</span>
	             <label>
	                 <input id="viewsuppliersId" readonly="true" type="text" />
	             </label>   
	          </li>
	          <li>
	             <span class="tab-name">运输合同：</span>
	             <label>
	                 <input id="viewcarriageContractId" readonly="true" type="text" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">车辆长度要求：</span>
	             <label>
	                 <input id="viewvehicleLength" readonly="true" type="text" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">车辆吨位要求：</span>
	             <label>
	                 <input id="viewrequireWeight" readonly="true" type="text" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">计划发货时间：</span>
	             <label>
	            	 
	                 <input id="viewplanSendDate" readonly="true" type="text" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">要求到货时间：</span>
	             <label>
	                 <input id="viewrequireDate" readonly="true" type="text" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">收货地址：</span>
	             <label>
	                 <input id="viewreceiverAddress" readonly="true" type="text" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">收货联系人：</span>
	             <label>
	                 <input id="viewreceiverUser" readonly="true" type="text" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">收货联系人电话：</span>
	             <label>
	                 <input id="viewreceiverPhone" readonly="readonly" type="text" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">备注：</span>
	             <label>
	                 <input id="viewremark" readonly="readonly" type="text" />
	             </label>
	          </li>
	          <li class="hr"></li>
	          <li>
	             <span class="tab-name">司机姓名：</span>
	             <label>
	                 <input id="viewdriveName" readonly="readonly" type="text" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">司机电话：</span>
	             <label>
	                 <input id="viewdrivePhone" readonly="readonly" type="text" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">驾驶证号：</span>
	             <label>
	                 <input id="viewcredentials" readonly="readonly" type="text" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">车牌号码：</span>
	             <label>
	                 <input id="viewvehicleNumber" readonly="readonly" type="text" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">发车重量：</span>
	             <label>
	                 <input id="viewweight" readonly="readonly" type="text" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">总箱数：</span>
	             <label>
	                 <input id="viewquantity" readonly="readonly" type="text" />
	             </label>
	          </li>
	          <div class="hr_ hr_20"></div>
	          <table id="viewcontentTable" class="table table-striped table-bordered table-condensed resize">
			   <thead>
			    <tr>
			     <th>箱号</th>
			     <th>下料单号</th>
	             <th>状态</th> 
	             </tr>
	            </thead>
	            
	            <tbody id="viewboxList">
	            </tbody>  
			 </table>
	     </ul>
	     
	</div>	
    <div class="pagination">${page}</div>
</body>
</html>