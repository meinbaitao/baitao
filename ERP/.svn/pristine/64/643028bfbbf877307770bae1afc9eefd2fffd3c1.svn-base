<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>填写申购计划</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<%@include file="/WEB-INF/views/include/activitiHeader.jsp"%>
	<jsp:useBean id="now" class="java.util.Date" />
	<script type="text/javascript" src="${ctxStatic}/modules/purchase/scripts/applyPurchase.js?tsf=${jsVersion}"></script>
	<script type="text/javascript" src="${ctxStatic}/jquery/jquery.json.js?tsf=${jsVersion}"></script>
	
	<script type="text/javascript">
		var flag="${is}";
		var seriesnumber="${seriesnumber}";
		$(document).ready(function() {
			if(flag=="true"){
				apDetail(seriesnumber);
			}
		});
	</script>
</head>
<body>
	<!-- 流程提交 -->
	<form:form style="display:none;" id="submitAPForm" action="${ctx}/purchase/applyPurchase/applyHCList" method="post" class="breadcrumb form-search">
		<input id="submitSN" name="seriesnumber" value="${seriesnumber }" type="text">
	</form:form>
	<!-- 流程通过，进行下一步 -->
	<form:form style="display:none;" id="passAPForm" action="${ctx}/purchase/applyPurchase/passAP" method="post" class="breadcrumb form-search">
		<input name="seriesnumber" value="${seriesnumber }" type="text">
	</form:form>
	<!-- 驳回流程 -->
	<form:form style="display:none;" id="rebutAPForm" action="${ctx}/purchase/applyPurchase/rebutAP" method="post" class="breadcrumb form-search">
		<input name="seriesnumber" value="${seriesnumber }" type="text">
		<input name="message" id="rebutMessage" value="" type="text">
		<input name="processInstanceId" id="rebutPID" value="" type="text">
	</form:form>
		

	<div class="list-content">
	     <div class="nav-operate" >															<%-- ${ctx}/purchase/purchase/submitDemand  ${ctx}/purchase/applyPurchase/assign --%>
           <form:form id="searchForm" modelAttribute="purchaseDemand" action="${ctx}/purchase/applyPurchase/list" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		         
       <ul class="operationg-new" >
            <li>
               <a href="${ctx}/purchase/applyPurchase/applyHCList" class="btn btn-primary">返回</a>
               <input disabled="disabled" type="button" name="saveAP" id="saveAP" class="btn btn-primary" value="保存">
           </li>
            <li>
               <input disabled="disabled" type="button" name="submitAP" id="submitAP" class="btn btn-primary" value="提交">
           </li>
            <li>
               <input style="display:none;" type="button" name="passAP" id="passAP" class="btn btn-primary" value="提交">
           </li>
            <li> 
               <input disabled="disabled" type="button" name="signAP" id="signAP" class="btn btn-primary" value="签收">
             </li>
            <li> 
               <input disabled="disabled" type="button" name="rebutAP" id="rebutAP" class="btn btn-primary" value="驳回">
             </li>
            <li> 
               <input disabled="disabled" type="button" name="trackAP" id="trackAP" class="btn btn-primary" value="流程图">
             </li>
        </ul> 
		       <div class="clearfix"></div>
	       </form:form>
		       <div class="clear"></div>
			   
	      </div>
	     <sys:message content="${message}"/>
	     <div class="form-content">
	   <form:form id="saveFrom" action="${ctx}/purchase/applyPurchase/saveFrom" method="post" class="form-horizontal magbtm0">
		<%-- &nbsp;&nbsp;&nbsp;&nbsp; 
		 申购单编号<input id="seriesnumber" name="seriesnumber" value="${seriesnumber }" readOnly="readOnly" type="text">	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 制单日期	<input name="createDate" id="createDate" type="text" readonly="readonly"
						maxlength="20" class="input-medium Wdate " value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" /> 
		 <input id="createDate" name="createDate" type="text" value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />"> 
		 <br>
		 <li>
           
		 </li> --%>
		 <!-- <table id="contentMenu" class="table table-striped table-bordered table-condensed resize">
		   	<tr >
		     <td>&nbsp;<a id="applyAddRow" href="javascript:void(0);">添行</a>
		     	&nbsp;<a id="applyDelRow" href="javascript:void(0);">删行</a>
		     </td>
             </tr>
         </table> -->
         <c:if test="${isyyzg }">
	         <div class="nav-operate" id="editRow">
				<ul class="operationg-new" >
					<li id="tr_add"><span class="glyphicon glyphicon-plus"></span>添行</li>
					<li id="tr_del" attr="applyDelRow"><span class="glyphicon glyphicon-remove"></span>删行</li>
			    </ul>
		   	</div>
	   	</c:if>
	   	<div class="table_scroll">
		 <table id="contentTable" class="table table-striped table-bordered table-condensed resize table-eidt">
		   <thead>
		   	<tr >
		   		 <th ><input style="display:none;" id="processInstanceId" value="${processInstanceId }" type="text"></th>
		   		 <th >申购单编号</th>
			     <th colspan="3">${seriesnumber }
			     		<input style="display:none;" id="seriesnumber" value="${seriesnumber }" type="text">
			     </th>
			     <th >制单日期</th>
			     <th colspan="2"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></th>
             </tr>
		   	<tr class="copy" >
		   		 <th type="checkbox" name="delBox" style="width:30px;">选择</th>
			     <th type="select" name="proSel" class="input-medium">项目名称</th>
			     <th >户型</th>
			     <th >楼栋号</th>
			     <th >类别</th>
			     <th >挂石面积<br>(平)</th>
			     <th>10#槽钢</th>
			     <th>8#槽钢</th>
			     <th>6.3#槽钢</th>
			     <th>50*50*4角钢</th>
			     <th>50*50*5角钢</th>
             </tr>
            </thead>
            <tbody id="apDetail" copy="false">
            	
            </tbody>  
            <tfoot>
              <tr>
		   		 <td colspan="5">合计</td>
			     <td id="gsmj">0</td>
			     <td ><input id="cg10" class="ap" type="text" style="width:80px;display:none;"></td>
			     <td ><input id="cg8" class="ap" type="text" style="width:80px;display:none;"></td>
			     <td ><input id="cg6d3" class="ap" type="text" style="width:80px;display:none;"></td>
			     <td ><input id="jg554" class="ap" type="text" style="width:80px;display:none;"></td>
			     <td ><input id="jg555" class="ap" type="text" style="width:80px;display:none;"></td>
              </tr>
            </tfoot>
		 </table>
		 </div>
		 </form:form>
		 </div>
	</div>
	
</body>
</html>