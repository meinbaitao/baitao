<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>生产指派(生产经理)</title>
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
		//验证加工厂
		function validateAssign(){
			var flower = $('#gdys').val();
			if(!flower){
				window.alertx("请选择跟单员！");
				loaded();
				return false;
			}
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
			$("#assignIDs").val(ids);
			$("#obbIDs").val(obbIDs);
			$("#remarks").val($("#productionRemarks").val());
			$("#gdy").val($("#gdys").val());
			return true;
		}
		
	</script>
</head>
<body>
	<form:form style="display:none;" id="saveForm" action="${ctx}/production/production/assignProduction" method="post"  onsubmit="javascript:return validateAssign();" class="form-horizontal">
       	<input type="hidden" id="remarks" name="remarks" value=""/>
       	<input type="hidden" id="gdy" name="gdy" value=""/>
       	<input id="assignIDs" name="assignIDs" type="hidden" value=""/>
       	<input id="obbIDs" name="obbIDs" type="hidden" value=""/>
       	<input id="obboxStatus" name="isStatus" type="hidden" value="${isStatus}"/>
     </form:form>
	<div class="list-content">
	     <div class="nav-operate" >
	     																<%-- ${ctx}/purchase/purchase/submitDemand  ${ctx}/production/production/assign --%>
           <form:form id="searchForm" modelAttribute="production" action="${ctx}/production/production/waitAssign" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<input id="sisStatus" name="isStatus" type="hidden" value="${isStatus}"/>
				<input id="returnUrl" name="returnUrl" type="hidden" value="${ctx}/production/production/waitAssign"/>
		        <ul class="operationg-new" >
		        	<shiro:hasAnyRoles name="${fns:getWhitelistsList('sczp')}">
			        	<span class="tab-name">跟单员：</span>
		             	<label>
		                  <select id="gdys" name="gdys" class="input-medium">
		                  	<option value=""></option>
		                  	<c:forEach items="${fns:selByCondition('gdy')}" var="obj">
								<option value="${fns:escapeHtml(obj.userID)}" >${fns:escapeHtml(obj.userName)}</option>
							</c:forEach>
		              		</select>
		             	</label>
		             	<span class="tab-name">备注：</span>
		                 <input type="text" id="productionRemarks" name="productionRemarks" value=""/>
		             	<input type="button" id="saveBtn" name="saveBtn" value="指派" class="btn btn-primary"/>
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
	  <div id="scroll-table">
	 	<div id="scroll-head">
		</div>
		<div id="tbody-scroll" class="tbody-scroll">
		 <table id="contentTable" class="table table-striped table-bordered table-condensed resize tree_table">
		 	<input id="isStatus" name="isStatus" type="hidden" value="${isStatus}"/>
		   <thead>
		   	<tr>
		   		<th style="width:100px;">项目名称</th>
			     <th style="width:80px;">下料单单号/类型/石材品种/要求到货时间/总面积</th>
			     <th>箱号</th>
			     <th>物料编号</th>
			     <th>跟单员</th>
			     <th>加工厂</th>
			     <th>工厂人员</th>
			     <th>联系电话</th>
			     <th>运营经理备注</th>
			     <th style="width:120px;">状态</th>
             </tr>
            </thead>
            <tbody>
            	<c:forEach items="${page.list}" var="production">
				<tr id="pro${production.project.id}" class="0 first-level hide-childen" haschild="true" previd="" islastone="true" depth="1">
					<td colspan="9">
						<div class="tit">
						<input style="display:none;" type="checkbox">    
			        	<i thisTagertId="${production.project.id}" attrStatus="${isStatus }" attrID="getObbByProID" attrVal="waitAssign" class="glyphicon glyphicon-triangle-right"></i> 
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
    <div class="pagination">${page}</div>
</body>
</html>