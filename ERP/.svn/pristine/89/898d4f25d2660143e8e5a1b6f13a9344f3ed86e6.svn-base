<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>领料单（钢、辅材）详情</title>
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
               <a href="${ctx}/inventory/inventory/claimGFLList" class="btn btn-primary">返回</a>
     			<input type="button" onclick="print()" class="btn btn-primary" value="打印"/>	
     		 </ul> 
		       <div class="clearfix"></div>
		       <div class="clear"></div>
	      </div>
	    <%--  <sys:message content="${message}"/> --%>
	     <div class="form-content">
	   <form:form id="saveFrom" action="" method="post" class="form-horizontal magbtm0">
	        <input id="ids" name="ids" type="hidden" value=""/>
	        <input id="imt" name="imt" type="hidden" value="${imt }"/>
		   	<div class="table_scroll">
			 <table id="contentTable" class="table table-striped table-bordered table-condensed resize table-eidt">
			   <thead>
			   		<tr >
			   		 <th >项目名称</th>
				     <td >${project.name}</td>
				     <th >材料类型</th>
				     <td >${standingBookDetail.inventory.materialType}</td>
				     <th >领料日期</th>
				     <td ><fmt:formatDate value="${standingBook.businessDate}" pattern="yyyy-MM-dd" /></td>
			   		 <th >领料单号</th>
				     <td >${seriesnumber }</td>
				     <th >施工班组</th>
				     <td colspan="3">${standingBook.sendee}</td>
	             </tr>
	             <tr >
				     <th >用到户型</th>
				     <td >${subIn.houseType}</td>
				     <th >用到栋号</th>
				     <td >${subIn.buildingDisplayName}</td>
				     <th >出库户型</th>
				     <td >${subOut.houseType}</td>
				     <th >出库栋号</th>
				     <td >${subOut.buildingDisplayName}</td>
				     <th >备注</th>
				     <td colspan="3">${standingBook.remarks}</td>
	             </tr>
			   	<tr >
			   		 <th rowspan="2" >序号</th>
				     <th rowspan="2">物料编号</th>
				     <th rowspan="2">物料名称</th>
				     <th rowspan="2">规格尺寸</th>
				     <th colspan="2">下单总数量</th>
				     <th rowspan="2">已领料数量</th>
				     <th rowspan="2">未领料数量</th>
				     <th rowspan="2">超领料数量</th>
				     <th rowspan="2">库存数量</th>
				     <th rowspan="2">领料数量</th>
				     <th rowspan="2">备注</th>
	             </tr>
	             <tr >
				     <th >一</th>
				     <th >单位</th>
	             </tr>
	            </thead>
	            <tbody id="claimDetail" copy="false">
	            	<c:forEach items="${listOBDetail}" var="obj" varStatus="i">
		              <tr>
				   		 <td >${i.index+1 }</td>
					     <td >${obj.materielNo }</td>
					     <td >${obj.materielName }</td>
					     <td >${obj.standardDesc }</td>
						 <td >${obj.count }</td>
						 <td >${obj.unit }</td>
						 <td >${obj.extraData.hasClaimCountQuantity }</td>
						 <td >${obj.extraData.notClaimCountQuantity }</td>
						 <td >${obj.extraData.exceedCount }</td>
						 <td >${obj.extraData.invCount }</td>
						 <td >${obj.extraData.claimCount }</td>
						 <td >${obj.remark}</td>
		             </tr>
		            </c:forEach> 
		            <!-- var tr="<tr pid='gflCheck'>\
	            		<td ><input attrID='cBox' attrName='checkBox' type='checkbox' name='cBox' materielNo='"+obj.materielNo+"' value='"+obj.materielNo+"'></td>\
	            		<td >"+obj.materielNo+"</td>\
						<td >"+obj.materielName+"</td>\
						<td >"+obj.standardDesc+"</td>\
						<td >"+obj.count+"</td>\
						<td >"+obj.unit+"</td>\
						<td >"+obj.extraData.hasClaimCountQuantity+"</td>\
						<td >"+obj.extraData.notClaimCountQuantity+"</td>\
						<td >"+obj.extraData.exceedCount+"</td>\
						<td icID='ic"+obj.materielNo+"'>0</td>\
						<td ><input id='outCount"+obj.materielNo+"' name='outCount"+obj.materielNo+"' value='0' type='text' class='input-mini' /></td>\
						<td >"+obj.remark+"</td>\
					</tr>";
			html+=tr; -->
	            </tbody>  
			 </table>
			 </div>
		 </form:form>
		 </div>
	</div>
	
</body>
</html>