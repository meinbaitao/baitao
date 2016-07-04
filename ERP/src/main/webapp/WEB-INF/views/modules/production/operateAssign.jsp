<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>运营指派</title>
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
		
		//验证指派
		function validateAssign(){
			loading();
			var flag = $("input[name='cBox']").is(':checked');//$("cBox").prop("checked");
			var obbFlag = $("input[name='obbaseBox']").is(':checked');
			if(!obbFlag&&!flag){
				window.alertx("请选择相应的列表数据！");
				loaded();
				return false;
			}
			if($("#scjl").val()==""){
				window.alertx("请选择相应的生产经理！");
				loaded();
				return false;
			}
			if($("#jgc").val()==""){
				window.alertx("请选择相应的加工厂！");
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
			var obbChecks = $("input[name='obbaseBox']:checked");
			var obbIDs = "";
			for(var i=0;i<obbChecks.length;i++){
				obbIDs+=$(obbChecks[i]).attr("value");
				if(i+1<obbChecks.length)
					obbIDs+=",";
			}
			$("#assignIDs").val(ids);
			$("#obbIDs").val(obbIDs);
			return true;
		}
		//驳回数据
		function validateRebut(){
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
			$("#assignIDs").val(ids);
			$("#rebutObbIDs").val(obbIDs);
			$("#rebutIDs").val(ids);
			$("#rebutSuggestion").val($("#amaldarremarks").val());
			return true;
		}
		
		function clean(){
			$("#jgc").empty();
			$("#jgc").select2();
			var contact = $("#contact").val("");
			var contactphone = $("#contactphone").val("");
		}
		
	</script>
</head>
<body>
	<!-- 运营经理驳回 -->
	<form:form id="rebutForm" style="display:none;" action="${ctx}/production/production/directorRebutSugg" method="post" onsubmit="javascript:return validateRebut();" class="breadcrumb form-search">
		<input id="rebutIDs" name="rebutIDs" type="hidden" value=""/>
		<input id="rebutObbIDs" name="rebutObbIDs" type="hidden" value=""/>
		<input id="rebutSuggestion" name="rebutSuggestion" type="hidden" value=""/>
		<input id="isStatus1" name="isStatus" type="hidden" value="${isStatus}"/>
	</form:form>
	<div class="list-content">
	     <div class="nav-operate" >
	     																<%-- ${ctx}/purchase/purchase/submitDemand  ${ctx}/production//assign --%>
           <form:form id="searchForm" modelAttribute="production" action="${ctx}/production/production/operateAssign" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<input id="sisStatus" name="isStatus" type="hidden" value="${isStatus}"/>
				<input id="returnUrl" name="returnUrl" type="hidden" value="${ctx}/production/production/operateAssign"/>
		        <ul class="operationg-new" >
		        	状态:<select id="searchStatus" name="searchStatus" class="input-small">
	                 	<option value="" >全部</option>
		                  	<option ${param.searchStatus eq '待指派'?'selected="selected"':'' } value="待指派">待指派</option>
		                  	<option ${param.searchStatus eq '指派完成'?'selected="selected"':'' } value="指派完成">指派完成</option>
	       			</select>
		        	<input id="searchBtn" id="searchBtn" type="submit" class="btn btn-primary" value="查询">
		        </ul>
		        <%-- <ul class="search">
		            <li>
		               <form:input path="seriesnumber" htmlEscape="false" class="input-medium" placeholder="关键字"/>
		            </li>
		            <li>
		            	<input class="search-btn" type="submit" id="searchBtn" name="searchBtn" value="查询"/>
		            </li>
		        </ul> --%>
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
			     <th>下料单单号/类型/石材品种/要求到货时间/总面积</th>
			     <th>箱号</th>
			     <th>物料编号</th>
			     <th>生产经理</th>
			     <th>加工厂</th>
			     <th>工厂人员</th>
			     <th>联系电话</th>
			     <th style="width:120px;">状态</th>
             </tr>
            </thead>
            <tbody>
            	<c:forEach items="${page.list}" var="production">
				<tr id="pro${production.project.id}" class="0 first-level hide-childen" haschild="true" previd="" islastone="true" depth="1">
					<td colspan="9">
						<div class="tit">
						<input style="display:none;" type="checkbox">    
			        	<i thisTagertId="${production.project.id}" attrStatus="${isStatus }" attrID="getObbByProID" attrVal="operateAssign" class="glyphicon glyphicon-triangle-right"></i> 
				        <label class="operation-project">
				        	${production.project.name}
				        </label>
					     </div>	
					</td>
				</tr>
			</c:forEach>
            </tbody>  
		 </table>
		 
		 <div class="div_right" id="productionDiv">
		 <shiro:hasPermission name="yyzp:edit">
	 <form:form id="productionForm" modelAttribute="inputForm1" action="${ctx}/production/production/assignSCJL" method="post"  onsubmit="javascript:return validateAssign();" class="form-horizontal">
       	<input id="assignIDs" name="assignIDs" type="hidden" value=""/>
       	<input id="obbIDs" name="obbIDs" type="hidden" value=""/>
       	<input id="obboxStatus" name="obboxStatus" type="hidden" value="${isStatus}"/>
       <h3><i></i>指派生产经理</h3>
        <ul>
          <li>
             <span class="tab-name">
             	生产经理:
             </span>
             <label>
                  <select id="scjl" name="scjl" onchange="javascript:return clean();" class="input-medium">
                  	<option value="请选择"></option>
                  	<c:forEach items="${fns:selByCondition('scjl')}" var="obj">
						<option value="${fns:escapeHtml(obj.userID)}" >${fns:escapeHtml(obj.userName)}</option>
					</c:forEach>
               		</select>
             </label>
          </li>
          <li>
             <span class="tab-name">
             	加工厂：
             </span>
             <label>
                  <select id="jgc" name="jgc" class="input-medium">
            		</select>
             </label>
          </li>
          <li>
             <span class="tab-name">
             	工厂人员：</span>
             	<label>
                  <input class="input-medium" disabled="disabled" type="text" id="contact" name="contact" value=""/>
             </label>
          </li>
          <li>
             <span class="tab-name">
             	联系方式：</span>
             	<label>
                  <input class="input-medium" disabled="disabled" type="text" id="contactphone" name="contactphone" value=""/>
             </label>
          </li>
          <li>
             <span class="tab-name">
             	审批意见：</span>
             	<label>
                  <input class="input-medium" type="text" id="amaldarremarks" name="amaldarremarks" value=""/>
             </label>
          </li>
           
 		  
          <li class="all-line">
             <span class="tab-name">&nbsp;&nbsp;&nbsp;</span>
             <shiro:hasAnyRoles name="${fns:getWhitelistsList('yyzp')}">
             <label>
                 <input id="assignBtn" id="assignBtn" type="submit" class="btn btn-primary" value="指派">&nbsp;
             </label>
             <label>
             	<input id="rebutBtn" id="rebutBtn" type="button" class="btn btn-primary" value="驳回">
             </label>
             </shiro:hasAnyRoles>
          </li> 
       </ul>
       </form:form>
       </shiro:hasPermission>
    </div>
	</div>
    <div class="pagination">${page}</div>
</body>
</html>