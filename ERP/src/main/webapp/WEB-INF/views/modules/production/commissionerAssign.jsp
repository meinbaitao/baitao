<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>运营专员指派</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<jsp:useBean id="now" class="java.util.Date" />
	<script type="text/javascript" src="${ctxStatic}/modules/production/scripts/production.js?tsf=${jsVersion}"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			var message="${xMessage}";
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
		//验证指派
		function validateSave(){
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
			$("#saveIDs").val(ids);
			$("#rebutIDs").val(ids);
			$("#submitIDs").val(ids);
			$("#stoneExpectDateStr").val($("#stoneExpectDate").val());
			$("#submitSuggestion").val($("#suggestion").val());
			$("#rebutSuggestion").val($("#suggestion").val());
			return true;
		}
		
	</script>
</head>
<body>
	<form:form id="saveForm" style="display:none;" action="${ctx}/production/production/saveStoneExpectDate" method="post" onsubmit="javascript:return validateSave();" class="breadcrumb form-search">
		<input id="saveIDs" name="saveIDs" type="hidden" value=""/>
		<input id="stoneExpectDateStr" name="stoneExpectDateStr" type="hidden" value=""/>
		<input id="isStatus1" name="isStatus" type="hidden" value="${isStatus}"/>
	</form:form>
	<form:form id="submitForm" style="display:none;" action="${ctx}/production/production/submitSugg" method="post" onsubmit="javascript:return validateSave();" class="breadcrumb form-search">
		<input id="submitIDs" name="submitIDs" type="hidden" value=""/>
		<input id="submitSuggestion" name="submitSuggestion" type="hidden" value=""/>
		<input id="isStatus2" name="isStatus" type="hidden" value="${isStatus}"/>
	</form:form>
	<form:form id="rebutForm" style="display:none;" action="${ctx}/production/production/rebutSugg" method="post" onsubmit="javascript:return validateSave();" class="breadcrumb form-search">
		<input id="rebutIDs" name="rebutIDs" type="hidden" value=""/>
		<input id="rebutSuggestion" name="rebutSuggestion" type="hidden" value=""/>
		<input id="isStatus3" name="isStatus" type="hidden" value="${isStatus}"/>
	</form:form>
	<div class="list-content">
	     <div class="nav-operate" >
	     																<%-- ${ctx}/purchase/purchase/submitDemand  ${ctx}/production//assign --%>
           <form:form id="searchForm" modelAttribute="production" action="${ctx}/production/production/commissionerAssign" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<input id="sisStatus" name="isStatus" type="hidden" value="${isStatus}"/>
				<input id="returnUrl" name="returnUrl" type="hidden" value="${ctx}/production/production/commissionerAssign"/>
				<input id="hasPermission" name="hasPermission" type="hidden" value="yyzy:edit"/>
		        <ul class="operationg-new" >
		        	<!-- 要求到货时间 -->
		        	<shiro:hasAnyRoles name="${fns:getWhitelistsList('yyxscgl')}">
			        	要求到货时间:<input id="stoneExpectDate" name="stoneExpectDate" type="text" class="input-medium Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" value="" />
			        	<input id="saveBtn" id="saveBtn" type="button" class="btn btn-primary" value="提交">
		        	</shiro:hasAnyRoles>
		        	<%-- <shiro:hasRole name="yyzg">
			        	意见:<input id="suggestion" name="suggestion" type="text" class="input-medium" value="" />
			        	<input id="submitBtn" id="submitBtn" type="button" class="btn btn-primary" value="提交">
			        	<input id="rebutBtn" id="rebutBtn" type="button" class="btn btn-primary" value="驳回">
		        	</shiro:hasRole> --%>
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
	      
	 <div id="scroll-table"  >
	 	<div id="scroll-head">
		</div>
		<div id="tbody-scroll" class="tbody-scroll">
		 <table id="contentTable" class="table table-striped table-bordered table-condensed resize tree_table">
		   	<input id="isStatus" name="isStatus" type="hidden" value="${isStatus}"/>
		   <thead>
		   	<tr>
			     <th style="width:100px;">项目名称</th>
			     <th>下料单编号</th>
			     <th style="width:100px;">下料单类型</th>
			     <th style="width:100px;">石材品种</th>
			     <th style="width:100px;">总面积(m²)</th>
			     <th style="width:100px;">要求到货时间</th>
			     <th style="width:100px;">运营主管审核意见</th>
			     <th style="width:100px;">运营经理意见</th>
             </tr>
            </thead>
            <tbody>
            	
               <c:forEach items="${page.list}" var="production">
				<tr id="pro${production.project.id}" attrRole="yyzy" class="0 first-level hide-childen" haschild="true" previd="" islastone="true" depth="1">
					<td colspan="4">
						<div class="tit">
						<input style="display:none;" type="checkbox">    
			        	<i thisTagertId="${production.project.id}" attrStatus="${isStatus }" attrVal="commissionerAssign" attrID="getObbByProID" class="glyphicon glyphicon-triangle-right"></i> 
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
		</div>
	</div>
    <div class="pagination">${page}</div>
</body>
</html>