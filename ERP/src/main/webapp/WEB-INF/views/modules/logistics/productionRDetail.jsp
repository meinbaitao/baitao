<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>石材确认收货详情界面</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/modules/logistics/scripts/productionLogistics.js?tsf=${jsVersion}" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		function vids(){
			var falg = $("input[name='cBox']").is(':checked');//$("cBox").prop("checked");
			if(!falg){
				window.alertx("请选择相应的列表数据！");
				loaded();
				return false;
			}
			var checks = $("input[name='cBox']:checked");
			var ids = "";
			for(var i=0;i<checks.length;i++){
				ids+=$(checks[i]).attr("value");
				if(i+1<checks.length)
					ids+=",";
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
            <li>
               <a href="${ctx}/logistics/productionLogistics/receipt" class="btn btn-primary">返回</a>
           </li>
        </ul> 
	      </div>
	      
	     <sys:message content="${message}"/>
			<table id="contentTable" class="table table-striped table-bordered table-condensed resize width-75 tree_table">
			  <input id="isStatus" name="isStatus" type="hidden" value="${isStatus}"/>
			   <thead>
		   			<tr>
						<th style="width:80px;">下料单单号</th>
					     <th>箱号</th>
					     <th>物料编号</th>
					     <th style="width:120px;">状态</th> 
					</tr>
	            </thead>
            <tbody>
               <c:forEach items="${page.list}" var="plsm" varStatus="i">
				<tr id="obb${plsm.pro.orderBomBase.id}" pid="0" class="0 first-level hide-childen" haschild="true" previd="" islastone="true" depth="1">
					<td colspan="4">
						<div class="tit">
					        <input type="checkbox">  
					        <i thisTagertId="${plsm.pro.orderBomBase.id }" attrID="productionRDetail" class="glyphicon glyphicon-triangle-right"></i> 
					        <label class="operation-project">
					        	${plsm.pro.orderBomBase.orderBomNo }
					        </label>
					     </div>	
					</td>
				</tr>
			</c:forEach>
            </tbody>  
		 </table>
		 <div class="div_right" id="csDetailDiv">
			 <form:form id="inputForm" modelAttribute="logisticsSend" action="${ctx}/logistics/productionLogistics/receiptProduction" onsubmit="javascript:return vids();" method="post" class="form-horizontal">
		       	<!-- <input id="sendIDs" name="sendIDs" type="hidden" value=""/> -->
		       	<input id="ids" name="ids" type="hidden" value=""/>
				<input id="lID" name="lID" type="hidden" value="${param.lID }"/>
		       <h3><i></i>收货</h3>
		        <ul>
			          <li>
			             <span class="tab-name">备注：</span>
			             <label>
			                 <form:input path="receiptremark" htmlEscape="false" maxlength="200"/>
			             </label>
			          </li>
			          <li>
			             <span class="tab-name">&nbsp;</span>
			             <label>
			                 <input type="submit" class="btn btn-primary" value="确认收货">
			             </label>
			          </li>
			          
				 </ul>
			    </form:form>
		    </div>
	</div>
    <div class="pagination">${page}</div>
</body>
</html>