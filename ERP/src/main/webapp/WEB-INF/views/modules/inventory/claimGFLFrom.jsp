<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>填写领料单（钢、辅材）</title>
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
	</script>
</head>
<body>

	<div class="list-content">
	     <div class="nav-operate" >	
	       <ul class="operationg-new" >
               <a href="${ctx}/inventory/inventory/claimGFLList" class="btn btn-primary">返回</a>
     			<input type="button" name="saveBtn" id="saveBtn" class="btn btn-primary" value="保存">	
     		 </ul> 
		       <div class="clearfix"></div>
		       <div class="clear"></div>
	      </div>
	    <%--  <sys:message content="${message}"/> --%>
	     <div class="form-content">
	   <form:form id="saveFrom" action="${ctx}/inventory/inventory/claimGFL" onsubmit="javascript:return validateSave();" method="post" class="form-horizontal magbtm0">
	        <input id="ids" name="ids" type="hidden" value=""/>
	        <input id="imt" name="imt" type="hidden" value="${imt }"/>
	        <!--  <div class="nav-operate" id="editRow">
				<ul class="operationg-new" >
					<li id="tr_add"><span class="glyphicon glyphicon-plus"></span>添行</li>
					<li id="tr_del" attr="applyDelRow"><span class="glyphicon glyphicon-remove"></span>删行</li>
			    </ul>
		   	</div> -->
		   	<div class="table_scroll">
			 <table id="contentTable" class="table table-striped table-bordered table-condensed resize table-eidt">
			   <thead>
			   	<tr >
			   		 <th >领料单号</th>
				     <td>${seriesNumber }
				     		<input style="display:none;" id="seriesnumber" value="${seriesNumber }" type="text">
				     </td>
				     <%-- <th >材料类型</th>
				     <td >
				     	<select id="obbMaterialType" name="obbMaterialType" class="input-medium">
                  			<!-- <option value=""></option> -->
		                  	<c:forEach items="${map}" var="obj">
	                  			<c:choose>
	                  				<c:when test="${obj.key eq obbMaterialType}">
	                  					<option selected="selected" value="${obj.key}" >${obj.value}</option>
	                  				</c:when>
	                  				<c:otherwise>
	                  					<option value="${obj.key}" >${obj.value}</option>
	                  				</c:otherwise>
	                  			</c:choose>
							</c:forEach>
               			</select>
				     </td> --%>
				     <th >制单日期</th>
				     <td colspan="3">
				     	<input id="businessDate" name="businessDate" type="text" class="input-medium Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />" />
				     </td>
	             </tr>
	             <tr >
			   		 <th >项目名称</th>
				     <td >
				     	<select id="listPro" name="listPro" class="input-medium">
		                  	<option value="">请选择</option>
		                  	<c:forEach items="${listInv}" var="inv">
								<option value="${inv.project.name}" >${inv.project.name}</option>
							</c:forEach>
            			</select>
				     </td>
				     <th >出库户型</th>
				     <td >
				     	<select id="housetypeSel" name="housetypeSel" class="input-medium">
		                  	<%-- <option value=""></option>
		                  	<c:forEach items="${listInv}" var="inv">
								<option value="${inv.project.name}">${inv.project.name}</option>
							</c:forEach> --%>
            			</select>
				     </td>
				     <th >出库栋号</th>
				     <td >
				     	<select id="buildingSel" name="buildingSel" class="input-medium">
		                  	<%-- <option value=""></option>
		                  	<c:forEach items="${listInv}" var="inv">
								<option value="${inv.project.name}" >${inv.project.name}</option>
							</c:forEach> --%>
            			</select>
				     </td>
	             </tr>
	             <tr >
				     <th >领料户型</th>
				     <td >
				     	<select id="claimHouseType" name="claimHouseType" class="input-medium">
            			</select>
				     </td>
				     <th >领料栋号</th>
				     <td >
				     	<select id="claimBuilding" name="claimBuilding" class="input-medium">
            			</select>
				     </td>
				     <th >施工班组</th>
				     <td id="ldTD">
				     	<select id="laborDemand" name="laborDemand" class="input-medium">
            			</select>
				     </td>
	             </tr>
	             
			   	<tr list="listInv" class="copy" index="0">
			   		 <th type="checkbox" name="delBox" ><input type="checkbox" id="all-check"/>选择</th>
				     <th >材料编号</th>
				     <th >材料类型</th>
				     <th >材料名称</th>
				     <th >当前库存数量</th>
				     <th >领料数量</th>
	             </tr>
	            </thead>
	            <tbody id="claimDetail" copy="false">
	            	
	            </tbody>  
			 </table>
			 </div>
		 </form:form>
		 </div>
	</div>
	
</body>
</html>