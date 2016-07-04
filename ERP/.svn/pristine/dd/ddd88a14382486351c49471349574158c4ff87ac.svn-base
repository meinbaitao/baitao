<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>运营主管指派(采购)</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<jsp:useBean id="now" class="java.util.Date" />
	<script type="text/javascript" src="${ctxStatic}/modules/purchase/scripts/purchase.js?tsf=${jsVersion}"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			var message="${message}";
			if(message!=""){
				window.alertx(message);
			}
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
	    	return false;
	    }
		//验证操作数据
		function validateEdit(){
			var flag = $("input[name='cBox']").is(':checked');//$("cBox").prop("checked");
			var obbFlag = $("input[name='obbaseBox']").is(':checked');
			if(!obbFlag&&!flag){
				window.alertx("请选择相应的列表数据！");
				return false;
			}
			var checks = $("input[name='cBox']:checked");
			var ids = "";
			for(var i=0;i<checks.length;i++){
				ids+=$(checks[i]).attr("value");
				if(i+1<checks.length)
					ids+=",";
			}
			var obbChecks = $("input[name='obbaseBox']:checked");
			var obbIDs = "";
			for(var i=0;i<obbChecks.length;i++){
				obbIDs+=$(obbChecks[i]).attr("value");
				if(i+1<obbChecks.length)
					obbIDs+=",";
			}
			$("#ids").val(ids);
			$("#obbIDs").val(obbIDs);
			$("#rebutIDs").val(ids);
			$("#submitIDs").val(ids);
			$("#stoneExpectDateStr").val($("#stoneExpectDate").val());
			$("#submitSuggestion").val($("#suggestion").val());
			$("#rebutSuggestion").val($("#suggestion").val());
			$("#submitobbIDs").val(obbIDs);
			$("#rebutobbIDs").val(obbIDs);
			return true;
		}
	</script>
</head>
<body>
	<form:form id="submitForm" style="display:none;" action="${ctx}/purchase/purchaseDemand/submitSugg" method="post" onsubmit="javascript:return validateEdit();" class="breadcrumb form-search">
		<input id="submitIDs" name="submitIDs" type="hidden" value=""/>
		<input id="submitSuggestion" name="suggestion" type="hidden" value=""/>
		<input id="isStatus2" name="isStatus" type="hidden" value="${isStatus}"/>
		<input id="submitobbIDs" name="obbIDs" type="hidden" value=""/>
	</form:form>
	<form:form id="rebutForm" style="display:none;" action="${ctx}/purchase/purchaseDemand/rebutSugg" method="post" onsubmit="javascript:return validateEdit();" class="breadcrumb form-search">
		<input id="rebutIDs" name="rebutIDs" type="hidden" value=""/>
		<input id="rebutSuggestion" name="suggestion" type="hidden" value=""/>
		<input id="isStatus3" name="isStatus" type="hidden" value="${isStatus}"/>
		<input id="rebutobbIDs" name="obbIDs" type="hidden" value=""/>
	</form:form>
	<div class="list-content">
	     <div class="nav-operate" >
	     																<%-- ${ctx}/purchase/purchase/submitDemand  ${ctx}/production//assign --%>
           <form:form id="searchForm" modelAttribute="purchaseDemand" action="${ctx}/purchase/purchaseDemand/directorAssign" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        <input id="returnUrl" name="returnUrl" type="hidden" value="${ctx}/purchase/purchaseDemand/directorAssign"/>
		        <input id="purchaseDemandIsStatus" name="isStatus" type="hidden" value="${isStatus}"/>
		        <ul class="operationg-new" >
		        	<shiro:hasAnyRoles name="${fns:getWhitelistsList('yygflglzg')}">
			        	意见:<input id="suggestion" name="suggestion" type="text" class="input-medium" value="" />
			        	<input id="submitBtn" id="submitBtn" type="button" class="btn btn-primary" value="提交">
			        	<input id="rebutBtn" id="rebutBtn" type="button" class="btn btn-primary" value="驳回">
		        	</shiro:hasAnyRoles>
		        	状态:<select id="searchStatus" name="searchStatus" class="input-small">
		                  	<option value="" >全部</option>
		                  	<option ${param.searchStatus eq '待指派'?'selected="selected"':'' } value="待指派">待指派</option>
		                  	<option ${param.searchStatus eq '指派完成'?'selected="selected"':'' } value="指派完成">指派完成</option>
            			</select>
			        	<input id="searchBtn" id="searchBtn" type="submit" class="btn btn-primary" value="查询">
		        </ul>
		       <div class="clearfix"></div>
	       </form:form>
		       <div class="clear"></div>
			   
	      </div>
	     <%-- <sys:message content="${message}"/> --%>
		 <form:form id="editForm" action="" method="post" onsubmit="javascript:return validateEdit();" class="breadcrumb form-search">
			 <table id="contentTable" class="table table-striped table-bordered table-condensed resize tree_table">
			   	<input id="isStatus" name="isStatus" type="hidden" value="${isStatus}"/>
			   	<input id="ids" name="ids" type="hidden" value=""/>
			   	<input id="stoneExpectDateStr" name="stoneExpectDateStr" type="hidden" value=""/>
			   	<input id="obbIDs" name="obbIDs" type="hidden" value=""/>
			   <thead>
			   	<tr>
				     <th style="width:100px;">项目名称</th>
				     <th >下料单编号/类型</th>
				     <th style="width:100px;">材料类型</th>
				     <th style="width:200px;">材料名称</th>
				     <th style="width:100px;">要求到货时间</th>
				     <th style="width:100px;">设计数量</th>
				     <th style="width:100px;">运营已下单数量</th>
				     <th style="width:100px;">可驳回数量</th>
				     <th style="width:220px;">指派记录</th>
				     <!-- <th style="width:100px;">运营下单数量</th> -->
	             </tr>
	            </thead>
	            <tbody>
	               <c:forEach items="${page.list}" var="obj">
					<tr id="pro${obj.project.id}" class="0 first-level hide-childen" haschild="true" previd="" islastone="true" depth="1">
						<td colspan="9">
							<div class="tit">
				        	<i thisTagertId="${obj.project.id}" attrStatus="${isStatus }" attrID="listPro" attrVal="commissionerAssign" class="glyphicon glyphicon-triangle-right"></i> 
					        <label class="operation-project">
					        	${obj.project.name}
					        </label>
						     </div>	
						</td>
					</tr>
				</c:forEach>
	            </tbody>  
			 </table>
		 </form:form>
	</div>
    <div class="pagination">${page}</div>
</body>
</html>