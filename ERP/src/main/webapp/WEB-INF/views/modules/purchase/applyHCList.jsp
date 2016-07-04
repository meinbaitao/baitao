<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>黑材申购计划</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript" src="${ctxStatic}/modules/purchase/scripts/applyPurchase.js?tsf=${jsVersion}"></script>
	
	<script type="text/javascript">
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
	    	return false;
	    }
	</script>
</head>
<body>
	<form:form style="display:none;" id="apDetailFrom" action="${ctx}/purchase/applyPurchase/apDetail" method="post" class="breadcrumb form-search">
		<input id="seriesnumber" name="seriesnumber" type="hidden" value=""/>
	</form:form>
	<div class="pagination">${page}</div>
	<%-- <div class="form-actions">
		<a class="btn btn-primary" href="${ctx}/purchase/applyPurchase/applyPurchase">添加</a>
	</div> --%>
	<div class="list-content">
	     <div class="nav-operate" >															<%-- ${ctx}/purchase/purchase/submitDemand  ${ctx}/purchase/applyPurchase/assign --%>
           <form:form id="searchForm" modelAttribute="purchaseDemand" action="${ctx}/purchase/applyPurchase/applyHCList" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        
		        <ul class="operationg-new" >
		        	<%-- <li><label>采购员：</label>
						<form:select id="assignto" path="assignto" class="input-small">
							<form:options items="${fns:getDictList('jcsj_gfc')}" itemValue="value" itemLabel="label" htmlEscape="false"/></form:select>
					</li> --%>
					<%-- <shiro:hasRole name="采购经理">
		            <li>
	            	  <!--  <input type="button" class="input-medium" value="指派"> -->
	            	    <a  id="assignBtn" href="javascript:void(0)" id="assignBtn"  ><span class="glyphicon glyphicon-paste"></span>指派</a>
	            	</li>
	            	</shiro:hasRole> --%>
	            	
		           <!-- <li><label>项目：</label>
						<select id="pdType" name="pdType" class="input-small" >
							<option value="">请选择</option>
							<option value="">123</option>
						</select>
					</li> -->
		            <li>
		            	<%-- <a href="${ctx}/purchase/applyPurchase/applyPurchase"><input id="add" type="button" class="btn btn-primary" value="添加"></a> --%>
		            	<a href="${ctx}/purchase/applyPurchase/applyPurchase" class="btn btn-primary">添加</a>
		            </li>
		            <%-- <li>
		               <a href="${ctx}/purchase/applyPurchase/editApplyPurchase">编辑</a>
		            </li> --%>
		            <%-- <li>
		               <a href="${ctx}/purchase/applyPurchase/listBySelf">采购员</a>
		            </li> --%>
		           <%--  <shiro:hasRole name="采购员">
	            	<li style="display:none;" id="cPurchase" class="operation-project" showWidth="450px" thisTagert="appoint-saider2" >
	            	</li>
	            	<li >
	            		<input id="submitDemand" type="button" class="btn btn-primary" value="生成采购单"></li>
	            		</shiro:hasRole> --%>
		        </ul>
		        <ul class="search">
		            <li>
		               <input name="seriesnumber" type="text" value="${param.seriesnumber }" class="input-medium" placeholder="关键字">
		               <%-- <form:input path="seriesnumber" htmlEscape="false" class="input-medium" placeholder="关键字"/> --%>
		            </li>
		            <li>
		            	<input class="search-btn" type="submit" value="查询"/>
		            	<!-- <button class="search-btn" id="table-set"  type="button">查询</button> -->
		            </li>
		        </ul>
		       <div class="clearfix"></div>
	       </form:form>
		       <div class="clear"></div>
			   
	      </div>
	     <sys:message content="${message}"/>
	   <form:form id="bFrom" action="" method="post" class="breadcrumb form-search">
		 <table id="contentTable" class="table table-striped table-bordered table-condensed resize">
		   <thead>
		   	<tr>
		   		 <th>&nbsp;</th>
			     <th>申购单编号</th>
			     <th>制单日期</th>
			     <th>创建人</th>
			     <th>状态</th>
             </tr>
            </thead>
            <tbody>
            <c:forEach items="${page.list}" var="pd">
	            <tr>
	            	<td>
	            		<input type="checkbox" name="cBox" value="${pd.id}">
	            	</td>
					<td>
						<a name="apDetail" sn="${pd.seriesnumber}" href="javascript:void(0);">
							${pd.seriesnumber}
						</a> 
					</td>
					<td>
						<fmt:formatDate value="${pd.createDate}" pattern="yyyy-MM-dd" />
						<!-- <input id="name" name="name" type="text"> -->
					</td>
					<td>
						${pd.createBy.name}
					</td>
					<td>&nbsp;
						<c:choose>
							<c:when test="${pd.workflowstatus eq '2' or pd.workflowstatus eq '1'}">
								待审核
							</c:when>
							<c:when test="${pd.workflowstatus eq '4'}">
								已完成
							</c:when>
							<c:otherwise>待提交</c:otherwise>
						</c:choose>
						<!-- <input id="ac" name="ac" type="text"> -->
					</td>
				</tr>
            </c:forEach>
            
            	<%-- <c:forEach items="${page.list}" var="pd">
			<tr>
				<td>
					<c:choose>
						<c:when test="${pd.status eq '2' and !falg}">
							<input type="checkbox" name="cboxs" disabled="disabled" value="">
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="cBox" value="${pd.id}">
						</c:otherwise>
					</c:choose>
					
				</td>
				<c:if test="${param.pdType ne null and param.pdType ne '' and param.pdType ne '黑材'}">
					<td>${pd.obb.orderBomNo}</td>
				</c:if>
				<td>
						${pd.seriesnumber}
				</td>
				<td>
					${pd.type}
					<c:set var="pdt" value="${pd.type}"/>
					${fns:getDictLabel(pdt,'pd_hc_type','')}
				</td>
				<td>
					${pd.count}
				</td>
				<td>&nbsp;</td>
				<!-- <td>&nbsp;</td> -->
				<c:if test="${falg}">
					<td>
						<input style="width:80px;height:11px;" id="txt${pd.id}" type="text" value=""/>
					</td>
				</c:if>
				<td>
					<a name="PDID" id="${pd.id}" href="javascript:void(0);">
					<span class="operation-project" showWidth="600px" thisTagert="appoint-saider4" >
						${pd.count}
					</span>
					</a>
				</td>
				<td>
					<c:set var="sta" value="${pd.status}"/>
					${fns:getDictLabel(sta,'purchase_status','')}
				</td>
				<td>${pd.assignto.name}</td>
				<td>
					<c:choose>
						<c:when test="${param.pdType eq '黑材'}">
								需求详情
						</c:when>
						<c:otherwise>
							需求详情
						</c:otherwise>
					</c:choose>
					
				</td>
				<shiro:hasPermission name="user"><td>
    				<a href="${ctx}/material/material/form?id=${material.materialId}">修改</a>
					<a href="${ctx}/material/material/delete?id=${material.materialId}" onclick="return confirmx('确认要删除该物料信息吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach> --%>
            </tbody>  
		 </table>
		 </form:form>
	</div>
	<!-- 生成采购单关联的数据界面 -->
	<div class="appoint-saider" id="appoint-saider2">
	 <form:form id="inputForm2" modelAttribute="inputForm2" action="${ctx}/purchase/purchase/submitDemand" method="post"  onsubmit="javascript:return validateSubmitDemand();" class="form-horizontal">
      		<input id="sdIDs" name="sdIDs" type="hidden" value=""/>
      		<input id="vs" name="vs" type="hidden" value=""/>
       <h3><i></i>采购单</h3>
        <ul>
       	   <li>
             <span class="tab-name">
             	供应商：
             </span>
             <label>
                  <%-- <select id="gys" name="gys" class="input-medium">
	                    <option value=""></option>
	                  	<c:forEach items="${fns:getSuppByType('supp_gys')}" var="obj">
							<option value="${fns:escapeHtml(obj.id)}" >${fns:escapeHtml(obj.name)}</option>
						</c:forEach>
               		</select> --%>
             </label>
          </li>
          <li>
             <span class="tab-name">
             	电话：</span>
             	<label>
                  <input id="contactphone" disabled="disabled" type="text" value=""/>
             </label>
             	
          </li>
           <!-- <li>
             <span class="tab-name">公司名称：</span>
             <label>
                  <input type="text" value="广东万方工程有限公司"/>
             </label>
          </li> -->
       		
          <li>
             <span class="tab-name">存放地点：</span>
             <label>
                 <!-- <input type="text" value=""/> -->
                 <select id="commadd" class="input-medium">
	                    <option value=""></option>
	                    <%-- <c:forEach items="${fns:getSuppByType('supp_gys')}" var="obj">
							<option value="${fns:escapeHtml(obj.id)}" >${fns:escapeHtml(obj.name)}</option>
						</c:forEach> --%>
	                  	<c:forEach items="${fns:getCommPerson('aa')}" var="obj">
							<option value="${fns:escapeHtml(obj.id)}">${fns:escapeHtml(obj.address)}</option>
						</c:forEach>
               		</select>
             </label>
          </li>
          <li>
             <span class="tab-name">收货联系人：</span>
             <label>
                 <input id="cpname" disabled="disabled" type="text" value=""/>
             </label>
          </li>
         
          <li>
             <span class="tab-name">收货人电话：</span>
             <label>
                 <input id="cpphone" disabled="disabled" type="text" value=""/>
             </label>
          </li>
 		  
          <li>
             <span class="tab-name">&nbsp;&nbsp;&nbsp;</span>
             <label>
                 <input type="submit" id="submitDemand" name="submitDemand" value="下单"/>
             </label>
          </li> 
       </ul>
       </form:form>
    </div>
    <!-- 根据采购需求ID查看相关的项目信息 -->
    <div class="appoint-saider" id="prosub">
	 <form:form id="inputForm3" modelAttribute="inputForm3" action="" method="post"  class="form-horizontal">
       <h3><i></i>详情</h3>
       	   <table id="contentTable" class="table table-striped table-bordered table-condensed resize">
		   <thead>
		   	<tr>
			     <th>项目名称+苑区</th>
			     <th>户型</th>
			     <th>栋号</th>
			     <th>类别</th>
			     <th>挂石面积（m²）</th>
             </tr>
            </thead>
            <tbody id="pdDetail">
			
            </tbody>  
		 </table>
       </form:form>
    </div>
    <div class="appoint-saider" id="appoint-saider4">
	 <form:form id="inputForm3" modelAttribute="inputForm3" method="post" class="form-horizontal">
       <h3><i></i>采购需求详情</h3>
       	   <table id="contentTable" class="table table-striped table-bordered table-condensed resize">
		   <thead>
		   	<tr>
			     <!-- <th class="all-check">
			         <input type="checkbox" id="all-check"  />
			         <label for="all-check">选择</label>
			     </th> -->
			     <th>采购需求编号</th>
			     <th>下单数量</th>
			     <th>状态</th>
			     
             </tr>
            </thead>
            <tbody id="PDIDtoDetail">
			
            </tbody>  
		 </table>
       </form:form>
    </div>
</body>

</html>