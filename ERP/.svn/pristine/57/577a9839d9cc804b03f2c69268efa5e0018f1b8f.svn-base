<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>填写调拨（钢、辅材）</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<%@include file="/WEB-INF/views/include/activitiHeader.jsp"%>
	<jsp:useBean id="now" class="java.util.Date" />
	<script src="${ctxStatic}/modules/inventory/scripts/inventory.js?tsf=${jsVersion}" type="text/javascript"></script>
	<script type="text/javascript">
		/* var flag="${is}";
		var seriesnumber="${seriesnumber}";
		$(document).ready(function() {
			if(flag=="true"){
				apDetail(seriesnumber);
			}
		}); */
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
	     <div class="nav-operate" >	
	       <ul class="operationg-new" >
               <a href="${ctx}/inventory/standingBook/transferGFLList" class="btn btn-primary">返回</a>
     			<input type="button" name="saveFromBtn" id="saveFromBtn" class="btn btn-primary" value="保存">	
     		 </ul> 
		       <div class="clearfix"></div>
     											
           <%-- <form:form id="searchForm" modelAttribute="purchaseDemand" action="${ctx}/purchase/applyPurchase/list" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		         
       <ul class="operationg-new" >
            <li>
               <a href="${ctx}/inventory/standingBook/claimGFLList" class="btn btn-primary">返回</a>
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
	       </form:form> --%>
		       <div class="clear"></div>
			   
	      </div>
	     <sys:message content="${message}"/>
	     <div class="form-content">
	   <form:form id="saveFrom" action="${ctx}/inventory/standingBook/transferGFL" method="post" class="form-horizontal magbtm0">
	         <input style="display:none;" id="materialType" value="gfl" type="text">
	         <div class="nav-operate" id="editRow">
				<ul class="operationg-new" >
					<li id="tr_add"><span class="glyphicon glyphicon-plus"></span>添行</li>
					<li id="tr_del" attr="applyDelRow"><span class="glyphicon glyphicon-remove"></span>删行</li>
			    </ul>
		   	</div>
		   	<div class="table_scroll">
			 <table id="contentTable" class="table table-striped table-bordered table-condensed resize table-eidt">
			   <thead>
			   	<tr >
			   		 <th ></th>
			   		 <th >调拨单号</th>
				     <td colspan="9">${seriesNumber }
				     		<input style="display:none;" id="seriesnumber" value="${seriesNumber }" type="text">
				     </td>
				     <%-- <th >材料类型</th>
				     <th >制单日期</th>
				     <td ><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></td> --%>
	             </tr>
	             <tr>
			   		 <th ></th>
			   		 <th colspan="2">调出项目</th>
			   		 <th colspan="2">调入项目</th>
				     <td colspan="6"></td>
				     <!-- <th >栋号</th>
				     <td >&nbsp;</td> -->
	             </tr>
	             <tr list="listInv" class="copy" index="0">
			   		 <th style="width:30px;" type="checkbox" name="delBox" >选择</th>
			   		 <th type="select" attr="outProSel" id="outPro" name="outPro" class="input-medium">项目名称</th>
			   		 <th >栋号</th>
			   		 <th type="select" attr="inProSel" id="inPro" name="inPro" class="input-medium">项目名称</th>
			   		 <th >栋号</th>
			   		 <th type="select" attr="outMaterial" id="id" name="id" class="input-medium">材料名称</th>
			   		 <th >材料规格</th>
			   		 <th >单位</th>
			   		 <th >可调数量</th>
			   		 <th type="text" class="required input-medium" id="quantity" name="quantity">调拨数量</th>
			   		 <th type="text" class="input-medium Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" id="quantity" name="quantity" value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />">调拨日期</th>
	             </tr>
			   	<!-- <tr list="listInv" class="copy" index="0">
			   		 <th type="checkbox" name="delBox" >选择</th>
				     <th type="select" materialType="gfl" id="materialNo" name="materialNo" class="input-medium">材料名称</th>
				     <th >材料规格</th>
				     <th >单位</th>
				     <th >材料规格</th>
				     <th >单位</th>
				     <th >材料规格</th>
				     <th >单位</th>
				     <th >当前库存数量</th>
				     <th type="text" class="required input-medium" id="quantity" name="quantity" >领料数量</th>
	             </tr> -->
	            </thead>
	            <tbody id="transferDetail" copy="false">
	            	
	            </tbody>  
	            <!-- <tfoot>
	              <tr>
			   		 <td colspan="5">合计</td>
				     <td id="gsmj">0</td>
				     <td ><input id="cg10" class="ap" type="text" style="width:80px;display:none;"></td>
				     <td ><input id="cg8" class="ap" type="text" style="width:80px;display:none;"></td>
				     <td ><input id="cg6d3" class="ap" type="text" style="width:80px;display:none;"></td>
				     <td ><input id="jg554" class="ap" type="text" style="width:80px;display:none;"></td>
				     <td ><input id="jg555" class="ap" type="text" style="width:80px;display:none;"></td>
	              </tr>
	            </tfoot> -->
			 </table>
			 </div>
		 </form:form>
		 </div>
	</div>
	
</body>
</html>