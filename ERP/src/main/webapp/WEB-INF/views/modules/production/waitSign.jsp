﻿<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>待签收</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript" src="${ctxStatic}/modules/production/scripts/production.js?tsf=${jsVersion}"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
	    	return false;
	    }
		//验证签收
		function validateSign(){
			var flag = $("input[name='cBox']").is(':checked');//$("cBox").prop("checked");
			var obbFlag = $("input[name='obbaseBox']").is(':checked');
			if(!obbFlag&&!flag){
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
			var obbChecks = $("input[name='obbaseBox']:checked");
			var obbIDs = "";
			for(var i=0;i<obbChecks.length;i++){
				obbIDs+=$(obbChecks[i]).attr("value");
				if(i+1<obbChecks.length)
					obbIDs+=",";
			}
			$("#obbIDs").val(obbIDs);
			$("#signIDs").val(ids);
			return true;
		}
		
	</script>
</head>
<body>
	<form:form id="signForm" style="display:none;" action="${ctx}/production/production/signProduction" method="post" onsubmit="javascript:return validateSign();" class="breadcrumb form-search">
		<input id="signIDs" name="signIDs" type="hidden" value=""/>
		<input id="obbIDs" name="obbIDs" type="hidden" value=""/>
		<input id="obboxStatus" name="obboxStatus" type="hidden" value="${isStatus}"/>
	</form:form>
	<div class="list-content">
	     <div class="nav-operate" >
           <form:form id="searchForm" modelAttribute="production" action="${ctx}/production/production/waitSign" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<input id="returnUrl" name="returnUrl" type="hidden" value="${ctx}/production/production/waitSign"/>
		        <shiro:hasAnyRoles name="${fns:getWhitelistsList('dqs')}">
			        <ul class="operationg-new" >
			       	 	<li>
		            	   <input name="signBtn" id="signBtn" type="button" class="btn btn-primary" value="签收">
		            	</li>
			        </ul>
		        </shiro:hasAnyRoles>
		       <div class="clearfix"></div>
	       </form:form>
		       <div class="clear"></div>
			   
	      </div>
	     <sys:message content="${message}"/>
		 <table id="contentTable" class="table table-striped table-bordered table-condensed resize width-75 tree_table">
		   <input id="isStatus" name="isStatus" type="hidden" value="${isStatus}"/>
		   <thead>
		   	<tr>
		   		<th style="width:100px;">项目名称</th>
			     <th style="width:80px;">下料单单号/类型/石材品种/要求到货时间/总面积</th>
			     <th>箱号</th>
			     <th>物料编号</th>
			     <th>预计完成时间</th>
			     <th>生产备注</th>
			     <th style="width:120px;">状态</th>
             </tr>
            </thead>
            <tbody>
	            <c:forEach items="${page.list}" var="production">
					<tr id="pro${production.project.id}" class="0 first-level hide-childen" haschild="true" previd="" islastone="true" depth="1">
						<td colspan="6">
							<div class="tit">
							<input style="display:none;" type="checkbox">    
				        	<i thisTagertId="${production.project.id}" attrStatus="${isStatus }" attrID="getObbByProID" attrVal="waitSign" class="glyphicon glyphicon-triangle-right"></i> 
					        <label class="operation-project">
					        	${production.project.name}
					        </label>
						     </div>	
						</td>
					</tr>
				</c:forEach>
            </tbody>  
		 </table>
	</div>
    <div class="pagination">${page}</div>
</body>
</html>