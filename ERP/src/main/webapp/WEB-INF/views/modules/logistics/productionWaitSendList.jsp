<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>生成发货通知单（石材）</title>
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
			var falg = $("input[name='cBox']").is(':checked');//$("cBox").prop("checked");
			if(!falg){
				window.alertx("请选择相应的列表数据！");
				loaded();
				return false;
			}
			if($("#cyf").val()==""){
				window.alertx("请选择承运方");
				loaded();
				return false;
			}
			if($("#sccb").val()==""){
				window.alertx("请选择运输合同");
				loaded();
				return false;
			}
			if($("#vehicleLength").val()==""){
				window.alertx("长度要求不能为空");
				loaded();
				return false;
			}
			if($("#requireWeight").val()==""){
				window.alertx("吨位要求不能为空");
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
			$("#sendIDs").val(ids);
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
		        <%-- <ul class="search">
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
	     <%-- <sys:message content="${message}"/> --%>
		 <table id="contentTable" class="table table-striped table-bordered table-condensed resize width-75 tree_table">
		    <%-- <input id="isStatus" name="isStatus" type="hidden" value="${isStatus}"/> --%>
		   <thead>
		   	<tr>
			     <th>选择</th>
			     <th>通知单号</th>
			     <th>计划发货时间</th>
			     <!-- <th>物料编号</th>
			     <th>计划发货时间</th>
			     <th style="width:120px;">状态</th> -->
             </tr>
            </thead>
            <tbody>
            	<c:forEach items="${page.list}" var="list"  varStatus="i">
					<tr>
					     <td><input type="checkbox" attrID="waitSendBox" name="cBox" value="${list.id }"></td>
					     <td>${list.seriesnumber }</td>
					     <td>${list.planSendDate }</td>
            		</tr>
				</c:forEach>
            </tbody>  
		 </table>
		 <div class="div_right" id="waitSendDiv">
	 <form:form id="inputForm" modelAttribute="logisticsSend" action="${ctx}/logistics/productionLogistics/createSendNotify" onsubmit="javascript:return validateGS();" method="post" class="form-horizontal">
       	<input id="id" name="id" type="hidden" value=""/>
       <h3><i></i>生成发货通知单</h3>
        <ul>
	          <li>
	             <span class="tab-name">发货车次：</span>
	             <label>
	                 <form:input readOnly="readOnly" id="number" path="number" class="input-medium" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">发货箱数：</span>
	             <label>
	                 <form:input readOnly="readOnly" id="quantity" path="quantity" class="input-medium" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">理论重量：</span>
	             <label>
	                 <form:input readOnly="readOnly" id="theoryWeight" path="theoryWeight" class="input-medium" />
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">长度要求：</span>
	             <label>
	                 <form:input readOnly="readOnly" id="vehicleLength" path="vehicleLength" htmlEscape="false" maxlength="200" />
	                 <%-- <form:select id="vehicleLength" path="vehicleLength" class="input-medium" tabindex="-1">
						<option value="">请选择</option>
						<form:options items="${fns:getDictList('changduyaoqiu')}" itemValue="label" itemLabel="label" htmlEscape="false"/>
					 </form:select> --%>
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">吨位要求：</span>
	             <label>
	                 <form:input id="requireWeight" readOnly="readOnly" path="requireWeight" htmlEscape="false" maxlength="200" />
	             </label>
	          </li>
	          <li>
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
	          </li>
	          <li>
	             <span class="tab-name">发货类型：</span>
	             <label>
	                 <%-- <form:input id="vehicleLength" path="vehicleLength" htmlEscape="false" maxlength="200" /> --%>
	                 <form:select id="chargeType" path="chargeType" class="input-medium" tabindex="-1">
						<option value="">请选择</option>
						<form:options items="${fns:getDictList('send_type')}" itemValue="label" itemLabel="label" htmlEscape="false"/>
					 </form:select>
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">是否保底：</span>
	             <label>
	                 <form:select id="isassure" path="isassure" class="input-medium" tabindex="-1">
						<form:options items="${fns:getDictList('yes_no')}" itemValue="value" itemLabel="label" htmlEscape="false"/>
					 </form:select>
	             </label>
	          </li>
	          <li>
	             <span class="tab-name">备注：</span>
	             <label>
	                 <form:textarea path="remark" htmlEscape="false" maxlength="200"/>
	             </label>
	          </li>
	          <li class="all-line">
	             	<span class="tab-name"></span>
	             	<label>
	                 <input type="submit"  value="生成发货通知单" class="btn btn-primary"/>
	             	</label>
          		</li>
		 </ul>
	     </form:form>
    </div>
	</div>
   <%--  <div class="pagination">${page}</div> --%>
</body>
</html>