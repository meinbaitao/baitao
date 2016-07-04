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
			var falg = $("input[name='cBox']").is(':checked');//$("cBox").prop("checked");
			if(!falg){
				window.alertx("请选择相应的列表数据！");
				return false;
			}
			if($("#scjl").val()==""){
				window.alertx("请选择相应的生产经理！");
				return false;
			}
			if($("#jgc").val()==""){
				window.alertx("请选择相应的加工厂！");
				return false;
			}
			var checks = $("input[name='cBox']:checked");
			var ids = "";
			for(var i=0;i<checks.length;i++){
				ids+=$(checks[i]).attr("value");
				if(i+1<checks.length)
					ids+=",";
			}
			$("#assignIDs").val(ids);
			return true;
		}
		
	</script>
</head>
<body>
	<%-- <form:form id="assignForm" style="display:none;" action="${ctx}/production/production/assignSCJL" method="post" onsubmit="javascript:return validateAssign();" class="breadcrumb form-search">
		<input id="assignIDs" name="assignIDs" type="hidden" value=""/>
		<input id="scjlID" name="scjlID" type="hidden" value=""/>
	</form:form> --%>
	<div class="list-content">
	     <div class="nav-operate" >
	     																<%-- ${ctx}/purchase/purchase/submitDemand  ${ctx}/production//assign --%>
           <form:form id="searchForm" modelAttribute="production" action="${ctx}/production/production/operateAssign" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        <ul class="operationg-new" >
		        	<%-- <li>生产经理:
		           		<select id="scjl" name="scjl" class="input-mini">
		           			<c:forEach items="${fns:selByCondition('scjl')}" var="obj">
								<option value="${fns:escapeHtml(obj.userID)}" >${fns:escapeHtml(obj.userName)}</option>
							</c:forEach>
                 		</select>
                 	</li> --%>
                 	<!-- <li>
	            	    <input id="assignBtn" id="assignBtn" type="button" class="btn btn-primary" value="指派">
	            	</li> -->
		            <%-- <li>
		               <a href="${ctx}/production//list"><span class="glyphicon glyphicon-refresh"></span>刷新</a>
		            </li> --%>
		            <!-- <li id="assignli" style="display:none;" class="operation-project" showWidth="500px" thisTagert="appoint-saider1" ></li>
	            	<li>
	            	   <input type="button" class="input-medium" value="指派">
	            	    <a href="javascript:void(0)" id="assign"  ><span class="glyphicon glyphicon-paste"></span>指派</a>
	            	</li> -->
		        </ul>
		        <ul class="search">
		            <li>
		               <form:input path="seriesnumber" htmlEscape="false" class="input-medium" placeholder="关键字"/>
		               <!-- <input name="no" type="text" class="input-medium" placeholder="关键字"> -->
		            </li>
		            <li>
		            	<input class="search-btn" type="submit" id="searchBtn" name="searchBtn" value="查询"/>
		            	<!-- <input class="search-btn" id="table-set"  type="submit" value="查询" /> -->
		            </li>
		        </ul>
		       <div class="clearfix"></div>
	       </form:form>
		       <div class="clear"></div>
			   
	      </div>
	     <sys:message content="${message}"/>
		 <table id="contentTable" class="table table-striped table-bordered table-condensed resize width-75 tree_table">
		   	<input id="isStatus" name="isStatus" type="hidden" value="${isStatus}"/>
		   <thead>
		   	<tr>
			     <th style="width:80px;">下料单单号/类型/石材品种</th>
			     <th>箱号</th>
			     <th>物料编号</th>
			     <th>生产经理</th>
			     <th>加工厂</th>
			     <th>工厂人员</th>
			     <th>联系电话</th>
			     <th style="width:120px;">状态</th>
			     <!-- <th>入库数量</th>
			     <th>发货数量</th>
			     <th>收货数量</th>
			     <th>跟单员</th> -->
             </tr>
            </thead>
            <tbody>
            	
               <c:forEach items="${page.list}" var="pd">
				<tr id="obb${pd.orderBomBase.id}" pid="0" class="0 first-level hide-childen" haschild="true" previd="" islastone="true" depth="1">
					<td colspan="4">
						<div class="tit">
						<input type="checkbox">  
					        	<i thisTagertId="${pd.orderBomBase.id}" attrStatus="${isStatus }" attrID="operateAssign" class="glyphicon glyphicon-triangle-right"></i> 
						        <label class="operation-project">
						        	<a href="${ctx}/orbom/orderBomDetail/list?orderBomId=${pd.orderBomBase.id}&orderType=${pd.orderBomBase.orderType}">
						        		${pd.orderBomBase.orderBomNo}&nbsp;&nbsp;【${pd.orderBomBase.orderTypeVal}】&nbsp;&nbsp;【${pd.orderBomBase.stoneColorName}】
						        	</a>
						        </label>
						<%-- <c:choose>
							<c:when test="${pd.status eq isStatus}">
					        	<input type="checkbox">  
					        	<i thisTagertId="${pd.orderBomBase.id}" attrStatus="${isStatus }" attrID="operateAssign" class="glyphicon glyphicon-triangle-right"></i> 
						        <label class="operation-project">
						        	<a href="${ctx}/orbom/orderBomDetail/list?orderBomId=${pd.orderBomBase.id}&orderType=${pd.orderBomBase.orderType}">
						        		${pd.orderBomBase.orderBomNo}&nbsp;&nbsp;【${pd.orderBomBase.orderTypeVal}】&nbsp;&nbsp;【${pd.orderBomBase.stoneColorName}】
						        	</a>
						        </label>
					        </c:when>
							<c:otherwise>
								<input disabled="disabled" type="checkbox">  
					        	<i thisTagertId="${pd.orderBomBase.id}" attrStatus="${isStatus }" attrID="operateAssign" class="glyphicon glyphicon-triangle-right"></i> 
						        <label class="operation-project">
						        	<a href="${ctx}/orbom/orderBomDetail/list?orderBomId=${pd.orderBomBase.id}&orderType=${pd.orderBomBase.orderType}">
						        		${pd.orderBomBase.orderBomNo}&nbsp;&nbsp;【${pd.orderBomBase.orderTypeVal}】&nbsp;&nbsp;【${pd.orderBomBase.stoneColorName}】
						        	</a>
						        </label>
							</c:otherwise>
						</c:choose> --%>
					     </div>	
						<%-- <c:choose>
							<c:when test="${pd.status eq isStatus}">
								<input type="checkbox" name="cBox" value="${pd.id}">
							</c:when>
							<c:otherwise>
								<input type="checkbox" name="" disabled="disabled">
							</c:otherwise>
						</c:choose> --%>
					</td>
					<%-- <td>
						${pd.orderBomBase.orderBomNo}
					</td>
					<td>
						${pd.assignto.name}
					</td>
					<td>
						<c:choose>
							<c:when test="${pd.status eq '1'}">
								待指派
							</c:when>
							<c:when test="${pd.status eq '2'}">
								待生产经理指派
							</c:when>
							<c:when test="${pd.status eq '4'}">
								待入库
							</c:when>
							<c:when test="${pd.status eq '3'}">
								待生产
							</c:when>
							<c:otherwise>
								
							</c:otherwise>
						</c:choose>
					</td> --%>
					<%-- <td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>${pd.assignto.name}</td> --%>
				</tr>
			</c:forEach>
            </tbody>  
		 </table>
		 <div class="div_right" id="productionDiv">
	 <form:form id="productionForm" modelAttribute="inputForm1" action="${ctx}/production/production/assignSCJL" method="post"  onsubmit="javascript:return validateAssign();" class="form-horizontal">
       	<input id="assignIDs" name="assignIDs" type="hidden" value=""/>
       <h3><i></i>指派生产经理</h3>
        <ul>
          <%-- <li>
             <span class="tab-name">
             	跟单员：
             </span>
             <label>
                  <select id="gdy" name="gdy" class="input-medium">
                  	<option value=""></option>
                  	<c:forEach items="${fns:selByCondition('gdy')}" var="obj">
						<option value="${fns:escapeHtml(obj.userID)}" >${fns:escapeHtml(obj.userName)}</option>
					</c:forEach>
              		</select>
             </label>
          </li>
          <li>
             <span class="tab-name">
             	结算员：
             </span>
             <label>
                  <select id="jsy" name="jsy" class="input-medium">
                  	<option value=""></option>
                  	<c:forEach items="${fns:selByCondition('jsy')}" var="obj">
						<option value="${fns:escapeHtml(obj.userID)}" >${fns:escapeHtml(obj.userName)}</option>
					</c:forEach>
               		</select>
             </label>
          </li> --%>
          <li>
             <span class="tab-name">
             	生产经理:
             </span>
             <label>
                  <select id="scjl" name="scjl" class="input-medium">
                  	<option value=""></option>
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
	                  	<%-- <option value=""></option>
	                  	<c:forEach items="${fns:getSuppByType('supp_jgc')}" var="obj">
							<option title="${fns:escapeHtml(obj.name)}" contact="${fns:escapeHtml(obj.contact)}" contactphone="${fns:escapeHtml(obj.contactphone)}" value="${fns:escapeHtml(obj.id)}" >${fns:escapeHtml(obj.name)}</option>
						</c:forEach> --%>
            		</select>
             </label>
          </li>
          <li>
             <span class="tab-name">
             	工厂人员：</span>
             	<label>
                  <input disabled="disabled" type="text" id="contact" name="contact" value=""/>
             </label>
          </li>
          <li>
             <span class="tab-name">
             	联系方式：</span>
             	<label>
                  <input disabled="disabled" type="text" id="contactphone" name="contactphone" value=""/>
             </label>
          </li>
          <li>
             <span class="tab-name">
             	备注：</span>
             	<label>
                  <input type="text" id="remarks" name="remarks" value=""/>
             </label>
          </li>
           
 		  
          <li class="all-line">
             <span class="tab-name">&nbsp;&nbsp;&nbsp;</span>
             <label>
                 <!-- <input type="submit" id="saveAssign" name="saveAssign" value="保存" class="btn btn-primary"/> -->
                 <input id="assignBtn" id="assignBtn" type="submit" class="btn btn-primary" value="指派">
             </label>
          </li> 
       </ul>
       </form:form>
    </div>
	</div>
    <div class="pagination">${page}</div>
</body>
</html>