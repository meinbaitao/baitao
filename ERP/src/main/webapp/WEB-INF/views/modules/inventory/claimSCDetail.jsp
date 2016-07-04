<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>填写领料单（石材）</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<%@include file="/WEB-INF/views/include/activitiHeader.jsp"%>
	<jsp:useBean id="now" class="java.util.Date" />
	<script src="${ctxStatic}/modules/inventory/scripts/inventory.js?tsf=${jsVersion}" type="text/javascript"></script>
	<script src="${ctxStatic}/modules/comm/jquery.jqprint-0.3.js?tsf=${jsVersion}" type="text/javascript"></script>
	<script type="text/javascript">
		/* var flag="${is}";
		var seriesnumber="${seriesnumber}";
		$(document).ready(function() {
			if(flag=="true"){
				apDetail(seriesnumber);
			}
		}); */
		function validateSave(){
			var flag = $("input[name='cBox']").is(':checked');//$("cBox").prop("checked");
			if(!flag){
				window.alertx("请选择相应的列表数据！");
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
			$("#ids").val(ids);
			return true;
		}
		//打印
		function print(){
			$("#contentTable").jqprint();
		}
	</script>
</head>
<body>

	<div class="list-content">
	     <div class="nav-operate" >	
	       <ul class="operationg-new" >
               <a href="${ctx}/inventory/inventory/claimSCList" class="btn btn-primary">返回</a>
     			<input type="button" onclick="print()" class="btn btn-primary" value="打印"/>	
     		 </ul> 
		       <div class="clearfix"></div>
		       <div class="clear"></div>
	      </div>
	    <%--  <sys:message content="${message}"/> --%>
	     <div class="form-content">
	   <form:form id="saveFrom" action="${ctx}/inventory/inventory/claimSC" onsubmit="javascript:return validateSave();" method="post" class="form-horizontal magbtm0">
	        <input id="ids" name="ids" type="hidden" value=""/>
	        <input id="imt" name="imt" type="hidden" value="${imt }"/>
		   	<div class="table_scroll">
			 <table id="contentTable" class="table table-striped table-bordered table-condensed resize table-eidt">
			   <thead>
			   	<tr >
			   		 <th colspan="1">项目名称</th>
				     <td colspan="2">${project.name}</td>
				     <th colspan="1">材料名称</th>
				     <td colspan="2">${standingBookDetail.inventory.orderBomBase.orderTypeVal }</td>
				     <th colspan="1">领料日期</th>
				     <td colspan="2"><fmt:formatDate value="${standingBook.businessDate }" pattern="yyyy-MM-dd" /></td>
			   		 <th colspan="1">领料单号</th>
				     <td colspan="2"style="color:#999;">${seriesnumber }</td>
				     <th colspan="1">施工班组</th>
				     <td colspan="3" id="ldTD">${standingBook.sendee}</td>
	             </tr>
	             <tr >
				     <th colspan="1">用到户型</th>
				     <td colspan="2">${subIn.houseType}</td>
				     <th colspan="1">用到栋号</th>
				     <td colspan="2">${subIn.buildingDisplayName}</td>
				     <th colspan="1">出库户型</th>
				     <td colspan="2">${subOut.houseType}</td>
				     <th colspan="1">出库栋号</th>
				     <td colspan="2">${subOut.buildingDisplayName}</td>
				     <th colspan="1">备注</th>
				     <td colspan="3">${standingBook.remarks}</td>
	             </tr>
	             <tr >
			   		 <th rowspan="2" >序号</th>
				     <th rowspan="2">材料名称</th>
				     <th rowspan="2">箱号</th>
				     <th rowspan="2">材料编号</th>
				     <th colspan="4">规格（mm）</th>
				     <th rowspan="2">加工图号</th>
				     <th rowspan="2">下单总数量</th>
				     <th rowspan="2">已领料数量</th>
				     <th rowspan="2">未领料数量</th>
				     <th rowspan="2">超领料数量</th>
				     <th rowspan="2">库存数量</th>
				     <th rowspan="2">领料数量</th>
				     <th rowspan="2">备注</th>
	             </tr>
	             <tr >
				     <th >半径</th>
				     <th >长（L）</th>
				     <th >宽（W）</th>
				     <th >厚（H）</th>
	             </tr>
			   </thead>
			   <tbody id="claimDetail" copy="false">
	            	<c:forEach items="${listOBDetail}" var="obj" varStatus="i">
		              <tr>
				   		 <td >${i.index+1 }</td>
					     <td >${standingBookDetail.inventory.orderBomBase.orderTypeVal }</td>
					     <td >${obj.boxNo }</td>
					     <td >${obj.materielNo }</td>
					     <td >${obj.standardRadius }</td>
					     <td >${obj.standardLong }</td>
					     <td >${obj.standardWidth }</td>
					     <td >${obj.standardDepth }</td>
					     <td >${obj.processChartNo }</td>
					     <td >${obj.extraData.countOrderBomBase }</td>
					     <td >${obj.extraData.hasClaimCountQuantity }</td>
					     <td >${obj.extraData.notClaimCountQuantity }</td>
					     <td >${obj.extraData.exceedCount }</td>
					     <td >${obj.extraData.invCount }</td>
					     <td >${obj.extraData.claimCount }</td>
					     <td >${obj.remark }</td>
		             </tr>
		            </c:forEach> 
	            </tbody> 
		   </table>
			 </div>
		 </form:form>
		 </div>
	</div>
	
</body>
</html>