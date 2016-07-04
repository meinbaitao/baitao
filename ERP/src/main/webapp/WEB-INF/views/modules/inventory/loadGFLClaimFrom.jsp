<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>填写领料单（钢、辅材）</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<%@include file="/WEB-INF/views/include/activitiHeader.jsp"%>
	<jsp:useBean id="now" class="java.util.Date" />
	<script type="text/javascript" src="${ctxStatic}/jquery/jquery.json.js?tsf=${jsVersion}"></script>
	<script src="${ctxStatic}/modules/inventory/scripts/inventoryGFL.js?tsf=${jsVersion}" type="text/javascript"></script>
	<script type="text/javascript">
		function validateSave(){
			if($("#laborDemand").val()==""){
				window.alertx("施工班组为必填项");
				loaded();
				return false;
			}
			var flag = $("input[name='cBox']").is(':checked');//$("cBox").prop("checked");
			if(!flag){
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
			var tds = $("input[attrName='checkBox']:checked");
			for(var i=0;i<tds.length;i++){
				var materielNo = $(tds[i]).attr("materielNo");
				var v1 = $("td[icID='ic"+materielNo+"']").html();
				var v2 = $("input[id='outCount"+materielNo+"']").val();
				if(parseInt(v1)<parseInt(v2)){
					window.alertx("出库数量不能比库存数量大");
					$("input[id='outCount"+materielNo+"']").focus();
					loaded();
					return false;
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
               <%-- <a href="${ctx}/inventory/inventory/claimGFLList" class="btn btn-primary">返回</a> --%>
               <shiro:hasAnyRoles name="${fns:getWhitelistsList('lldgfc')}">
     				<input type="button" disabled="disabled" name="saveBtn" id="saveBtn" class="btn btn-primary" value="保存">	
     				<input type="button" name="confirmOutBtn" id="saveBtns" class="btn btn-primary" value="确认出库">	
     			</shiro:hasAnyRoles>
     		 </ul> 
		       <div class="clearfix"></div>
		       <div class="clear"></div>
	      </div>
	    <%--  <sys:message content="${message}"/> --%>
	     <div class="form-content">
	   <form:form id="saveFrom" action="${ctx}/inventory/inventory/gflClaim" onsubmit="javascript:return validateSave();" method="post" class="form-horizontal magbtm0">
	        <input id="json" name="json" type="hidden" value=""/>
	        <input id="ids" name="ids" type="hidden" value=""/>
	        <input id="imt" name="imt" type="hidden" value="${imt }"/>
	        <!--  <div class="nav-operate" id="editRow">
				<ul class="operationg-new" >
					<li id="tr_add"><span class="glyphicon glyphicon-plus"></span>添行</li>
					<li id="tr_del" attr="applyDelRow"><span class="glyphicon glyphicon-remove"></span>删行</li>
			    </ul>
		   	</div> -->
		   	<div>
		 <table id="contentTableTitle" class="table table-striped table-bordered table-condensed resize table-eidt">
			   <thead>
			   		<tr >
			   		<th>&nbsp;</th>
			   		 <th >项目名称</th>
				     <td >
				     	<select id="listPro" name="listPro" class="input-small">
		                  	<option value="">请选择</option>
		                  	<c:forEach items="${map.listOBB}" var="obj">
								<option value="${obj.project.name}" >${obj.project.name}</option>
							</c:forEach>
            			</select>
				     </td>
				     <th >材料类型</th>
				     <td >
				     	<select id="materielType" name="materielType" class="input-small">
                  			<option value=""></option>
		                  	<c:forEach items="${map.materielTypes}" var="obj">
		                  		<option value="${obj.key}" >${obj.value}</option>
	                  			<%-- <c:choose>
	                  				<c:when test="${obj.key eq obbMaterialType}">
	                  					<option selected="selected" value="${obj.key}" >${obj.value}</option>
	                  				</c:when>
	                  				<c:otherwise>
	                  					<option value="${obj.key}" >${obj.value}</option>
	                  				</c:otherwise>
	                  			</c:choose> --%>
							</c:forEach>
               			</select>
				     </td>
				     <th >领料日期</th>
				     <td >
				     	<input id="businessDate" name="businessDate" type="text" class="input-small Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />" />
				     </td>
			   		 <th >领料单号</th>
				     <td style="color:#999;">${map.seriesNumber }
				     		<input style="display:none;" id="seriesnumber" value="${map.seriesNumber }" type="text">
				     </td>
				     <th >施工班组</th>
				     <td colspan="2" id="ldTD">
				     	<select id="laborDemand" name="laborDemand" class="input-small">
            			</select>
				     </td>
	             </tr>
	             <tr >
	             	<th>&nbsp;</th>
				     <th >用到户型</th>
				     <td >
				     	<select id="claimHouseType" name="claimHouseType" class="input-small">
            			</select>
				     </td>
				     <th >用到栋号</th>
				     <td >
				     	<select id="claimBuilding" name="claimBuilding" class="input-small">
            			</select>
				     </td>
				     <th >出库户型</th>
				     <td >
				     	<select id="outHouseType" name="outHouseType" class="input-small">
		                  	<%-- <option value=""></option>
		                  	<c:forEach items="${listInv}" var="inv">
								<option value="${inv.project.name}">${inv.project.name}</option>
							</c:forEach> --%>
            			</select>
				     </td>
				     <th >出库栋号</th>
				     <td >
				     	<select id="outBuilding" name="outBuilding" class="input-small">
		                  	<%-- <option value=""></option>
		                  	<c:forEach items="${listInv}" var="inv">
								<option value="${inv.project.name}" >${inv.project.name}</option>
							</c:forEach> --%>
            			</select>
				     </td>
				     <th >备注</th>
				     <td colspan="2">
				     	<input id="remarks" name="remarks" type="text" class="input-medium" />
				     </td>
	             </tr>
			   </thead>
		   </table>
		   </div>
		   	<div id="scroll-table">
	 	<div id="scroll-head">
		</div>
		<div id="tbody-scroll" class="tbody-scroll">
			 <table id="contentTable" class="tree_table table table-striped table-bordered table-condensed resize table-eidt">
			   <thead>
			   	<%-- <tr >
			   		<th>&nbsp;</th>
			   		 <th >项目名称</th>
				     <td >
				     	<select id="listPro" name="listPro" class="input-small">
		                  	<option value="">请选择</option>
		                  	<c:forEach items="${map.listOBB}" var="obj">
								<option value="${obj.project.name}" >${obj.project.name}</option>
							</c:forEach>
            			</select>
				     </td>
				     <th >材料类型</th>
				     <td >
				     	<select id="materielType" name="materielType" class="input-small">
                  			<option value=""></option>
		                  	<c:forEach items="${map.materielTypes}" var="obj">
		                  		<option value="${obj.key}" >${obj.value}</option>
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
				     </td>
				     <th >领料日期</th>
				     <td >
				     	<input id="businessDate" name="businessDate" type="text" class="input-small Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />" />
				     </td>
			   		 <th >领料单号</th>
				     <td style="color:#999;">${map.seriesNumber }
				     		<input style="display:none;" id="seriesnumber" value="${map.seriesNumber }" type="text">
				     </td>
				     <th >施工班组</th>
				     <td colspan="2" id="ldTD">
				     	<select id="laborDemand" name="laborDemand" class="input-small">
            			</select>
				     </td>
	             </tr>
	             <tr >
	             	<th>&nbsp;</th>
				     <th >用到户型</th>
				     <td >
				     	<select id="claimHouseType" name="claimHouseType" class="input-small">
            			</select>
				     </td>
				     <th >用到栋号</th>
				     <td >
				     	<select id="claimBuilding" name="claimBuilding" class="input-small">
            			</select>
				     </td>
				     <th >出库户型</th>
				     <td >
				     	<select id="outHouseType" name="outHouseType" class="input-small">
		                  	<option value=""></option>
		                  	<c:forEach items="${listInv}" var="inv">
								<option value="${inv.project.name}">${inv.project.name}</option>
							</c:forEach>
            			</select>
				     </td>
				     <th >出库栋号</th>
				     <td >
				     	<select id="outBuilding" name="outBuilding" class="input-small">
		                  	<option value=""></option>
		                  	<c:forEach items="${listInv}" var="inv">
								<option value="${inv.project.name}" >${inv.project.name}</option>
							</c:forEach>
            			</select>
				     </td>
				     <th >备注</th>
				     <td colspan="2">
				     	<input id="remarks" name="remarks" type="text" class="input-medium" />
				     </td>
	             </tr> --%>
	             
	             
			   	<tr >
			   		 <th rowspan="2" type="checkbox" name="delBox" ><input type="checkbox" id="all-check"/></th>
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
	            <tbody id="claimDetail">
	            	
	            </tbody>  
			 </table>
			 </div>
			 </div>
		 </form:form>
		 </div>
	</div>
	
</body>
</html>