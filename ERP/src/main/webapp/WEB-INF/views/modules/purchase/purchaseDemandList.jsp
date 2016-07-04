<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>采购需求管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript" src="${ctxStatic}/modules/purchase/scripts/purchase.js?tsf=${jsVersion}"></script>
	
	<script type="text/javascript">
		//验证指派
		function validateAssign(){
			var falg = $("input[name='cBox']").is(':checked');//$("cBox").prop("checked");
			if(!falg){
				alert("请选择相应的列表数据！");
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
			$("#cgyID").val($("#cgy").val());
			return true;
		}
		
		//验证下单
		function validateSubmitDemand(){
			/* var falg = $("input[name='cBox']").is(':checked');
			if(!falg){
				alert("请选择相应的列表数据！");
				return false;
			} */
			var checks = $("input[name='cBox']:checked");
			var ids = "";
			var vs = "";
			for(var i=0;i<checks.length;i++){
				var id = $(checks[i]).attr("value");
				var v = $("#txt"+id).val();
				ids+=id;
				vs+=v;
				if(i+1<checks.length){
					ids+=",";
					vs+=",";
				}
			}
			$("#sdIDs").val(ids);
			$("#vs").val(vs);
			return true;
		}
	</script>
</head>
<body>
	<form:form id="assignForm" style="display:none;" modelAttribute="oaNotify" action="${ctx}/purchase/purchaseDemand/assign" method="post" onsubmit="javascript:return validateAssign();" class="breadcrumb form-search">
		<input id="assignIDs" name="assignIDs" type="hidden" value=""/>
		<input id="cgyID" name="cgyID" type="hidden" value=""/>
	</form:form>
	<div class="list-content">
	     <div class="nav-operate" >															<%-- ${ctx}/purchase/purchase/submitDemand  ${ctx}/purchase/purchaseDemand/assign --%>
           <form:form id="searchForm" modelAttribute="purchaseDemand" action="${ctx}/purchase/purchaseDemand/list" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        <input id="returnUrl" name="returnUrl" type="hidden" value="${ctx}/purchase/purchaseDemand/purchaseDemandList"/>
		        <ul class="operationg-new" >
		           <li><label>需求材料类型：</label>
						<select id="pdType" name="pdType" class="input-small" >
							<option value="">请选择</option>
							<c:forEach items="${fns:groupByType()}" var="pt">
								<c:choose>
									<c:when test="${param.pdType eq pt.type}">
										<option value="${pt.type}" selected="selected">${pt.type}</option>
									</c:when>
									<c:otherwise>
										<option value="${pt.type}">${pt.type}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</li>
					<c:choose>
	            		<c:when test="${iscgzg }">
	            			<li>采购员:
				           		<select id="cgy" name="cgy" class="input-mini">
				           			<c:forEach items="${fns:selByCondition('采购员')}" var="obj">
										<option value="${fns:escapeHtml(obj.userID)}" >${fns:escapeHtml(obj.userName)}</option>
									</c:forEach>
		                 		</select>
		                 	</li>
							<li>
			            	    <input id="assignBtn" id="assignBtn" type="button" class="btn btn-primary" value="指派">
			            	    <!-- <a  id="assignBtn" href="javascript:void(0)" id="assignBtn"  ><span class="glyphicon glyphicon-paste"></span>指派</a> -->
			            	</li>
	            		</c:when>
	            		<c:otherwise>
	            			<li>采购员:
				           		<select disabled="disabled" id="cgy" name="cgy" class="input-mini">
				           			<c:forEach items="${fns:selByCondition('采购员')}" var="obj">
										<option value="${fns:escapeHtml(obj.userID)}" >${fns:escapeHtml(obj.userName)}</option>
									</c:forEach>
		                 		</select>
		                 	</li>
							<li>
			            	    <input disabled="disabled" id="assignBtn" id="assignBtn" type="button" class="btn btn-primary" value="指派">
			            	    <!-- <a  id="assignBtn" href="javascript:void(0)" id="assignBtn"  ><span class="glyphicon glyphicon-paste"></span>指派</a> -->
			            	</li>
	            		</c:otherwise>
	            	</c:choose>
					<li style="display:none;" id="cPurchase" class="operation-project" showWidth="500px" thisTagert="CPDiv" >
	            	</li>
	            	<c:choose>
	            		<c:when test="${isBuyer }">
	            			<li><input id="submitDemand" type="button" class="btn btn-primary" value="生成采购单"></li></li>
	            		</c:when>
	            		<c:otherwise>
	            			<li><input disabled="disabled" id="submitDemand" type="button" class="btn btn-primary" value="生成采购单"></li></li>
	            		</c:otherwise>
	            	</c:choose>
	            	
		            <%-- <shiro:hasRole name="采购员">
	            	<li style="display:none;" id="cPurchase" class="operation-project" showWidth="450px" thisTagert="appoint-saider2" >
	            	</li>
	            	<li >
	            		<input id="submitDemand" type="button" class="btn btn-primary" value="生成采购单"></li>
	            	</shiro:hasRole> --%>
		        </ul>
		        <ul class="search">
		            <li>
		               <!-- <input type="text" class="input-medium" placeholder="关键字"> -->
		               <form:input path="seriesnumber" htmlEscape="false" class="input-medium" placeholder="关键字"/>
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
		 <table id="contentTable" class="table table-striped table-bordered table-condensed resize">
		   <thead>
		   	<tr>
			     <th class="all-check">
			         <input type="checkbox" id="all-check"  />
			         <label for="all-check">选择</label>
			     </th>
			     <c:if test="${param.pdType ne null and param.pdType ne '' and param.pdType ne '黑材'}">
			     	<th>下料单编号</th>
			     </c:if>
			     <th>申购单编号</th>
			     <th>材料名称</th>
			     <th>采购需求数量</th>
			     <th>采购已下单数量</th>
			     <!-- <th>库存数量</th> -->
			     <c:if test="${isBuyer }">
			     	<th>采购下单数量</th>
			     </c:if>
			     <!-- <th>镀锌钢材可用库存（*）</th> -->
			     <!-- <th>状态</th> -->
			     <th>采购员</th>
			     <th>制单日期</th>
			     <th>操作</th>
             </tr>
            </thead>
            <tbody>
            	<c:forEach items="${page.list}" var="pd">
			<tr>
				<td>
					<c:choose>
						<c:when test="${pd.status eq '2' and !isBuyer}">
							<input type="checkbox" name="cboxs" disabled="disabled" value="">
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="cBox" value="${pd.id}">
						</c:otherwise>
					</c:choose>
					
				</td>
				<c:if test="${param.pdType ne null and param.pdType ne '' and param.pdType ne '黑材'}">
					<td>${pd.orderBomBase.orderBomNo}</td>
				</c:if>
				<td>
						${pd.seriesnumber}
				</td>
				
				<td>
					${pd.mtype}
					<%-- <c:set var="pdt" value="${pd.type}"/>
					${fns:getDictLabel(pdt,'pd_hc_type','')} --%>
				</td>
				<td>
					${pd.count}
				</td>
				<td>${pd.sumCount}</td>
				<!-- <td>&nbsp;</td> -->
				<c:if test="${ isBuyer}"><td>
					<c:choose>
						<c:when test="${ pd.count>pd.sumCount}">
							<input style="width:80px;height:11px;" id="txt${pd.id}" type="text" value=""/>
						</c:when>
						<c:otherwise>
							&nbsp;
						</c:otherwise>
					</c:choose></td>
				</c:if>
				<td>${pd.assignto.name}</td>
				<td><fmt:formatDate value="${pd.createDate}" pattern="yyyy-MM-dd" /></td>
				<td>
					&nbsp;
				</td>
			</tr>
		</c:forEach>
            </tbody>  
		 </table>
	</div>
	<!-- 生成采购单关联的数据界面 -->
	<div class="appoint-saider" id="CPDiv">
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
                  <select id="gys" name="gys" class="input-medium">
	                    <option value="">请选择</option>
	                  	<c:forEach items="${fns:getSuppByType('supp_gys')}" var="obj">
							<option value="${fns:escapeHtml(obj.id)}" >${fns:escapeHtml(obj.name)}</option>
						</c:forEach>
               		</select>
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
	                    <option value="">请选择</option>
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
             <label>&nbsp;
                 <input class="btn btn-primary" type="submit" id="submitDemand" name="submitDemand" value="确定"/>
             </label>
          </li> 
       </ul>
       </form:form>
    </div>
    <!-- 根据采购需求ID查看相关的项目信息 -->
   <%--  <div class="appoint-saider" id="prosub">
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
    </div> --%>
</body>

</html>