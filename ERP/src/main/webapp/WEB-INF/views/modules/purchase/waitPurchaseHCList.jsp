<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>黑材待采购</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript" src="${ctxStatic}/modules/purchase/scripts/purchase.js?tsf=${jsVersion}"></script>
	
	<script type="text/javascript">
		
		//生成采购订单
		function validateGP(){
			var checks = $("input[name='cBox']:checked");
			var ids = "";
			var vs = "";
			for(var i=0;i<checks.length;i++){
				var id = $(checks[i]).attr("value");
				var v = $("#txt"+id).val();
				var sc = $("#sc"+id).text();
				var c = $("#c"+id).text();
				if(parseInt(c)<parseInt(sc)+parseInt(v)){
					window.alertx("下单数据不能大于需求数量！");
					return false;
				}
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
	<div class="list-content">
	     <div class="nav-operate" >															<%-- ${ctx}/purchase/purchase/submitDemand  ${ctx}/purchase/purchaseDemand/assign --%>
           <form:form id="searchForm" modelAttribute="purchaseDemand" action="${ctx}/purchase/purchaseDemand/list" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        
		        <ul class="operationg-new" >
		           <%-- <li><label>需求材料类型：</label>
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
	            	</c:choose>--%>
	            	<%-- <c:choose>
	            		<c:when test="${iscgy }">
	            			<li><input id="generatePurchase" type="button" class="btn btn-primary" value="生成采购单"></li></li>
	            		</c:when>
	            		<c:otherwise>
	            			<!-- <li><input disabled="disabled" id="generatePurchases" type="button" class="btn btn-primary" value="生成采购单"></li></li> -->
	            		</c:otherwise>
	            	</c:choose> --%>
	            	
		            <%-- <shiro:hasRole name="采购员">
	            	<li style="display:none;" id="cPurchase" class="operation-project" showWidth="450px" thisTagert="appoint-saider2" >
	            	</li>
	            	<li >
	            		<input id="submitDemand" type="button" class="btn btn-primary" value="生成采购单"></li>
	            	</shiro:hasRole> --%>
	            	<c:if test="${iscgy }">
	            		<li><input id="generatePurchase" type="button" class="btn btn-primary" value="生成采购单"></li></li>
	            	</c:if>
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
	   <form:form id="generateForm" modelAttribute="purchaseDemand" action="${ctx}/purchase/purchase/generatePurchase" onsubmit="javascript:return validateGP();" method="post" class="breadcrumb form-search">
		 	<input id="sdIDs" name="sdIDs" type="hidden" value=""/>
      		<input id="vs" name="vs" type="hidden" value=""/>
		 <table id="contentTable" class="table table-striped table-bordered table-condensed resize">
		   <thead>
		   	<tr>
			     <th class="all-check">
			         <input type="checkbox" id="all-check"  />
			         <label for="all-check">选择</label>
			     </th>
			     <th>申购单编号</th>
			     <th>材料名称</th>
			     <th>采购需求数量</th>
			     <th>采购已下单数量</th>
			     <!-- <th>库存数量</th> -->
		     	 <th>采购下单数量</th>
			     <!-- <th>单价(元/公斤)</th> -->
			     <!-- <th>状态</th> -->
			     <th>采购员</th>
			     <th>制单日期</th>
             </tr>
            </thead>
            <tbody>
            	<c:forEach items="${page.list}" var="pd">
			<tr>
				<td>
					<c:choose>
						<c:when test="${pd.status ne isStatus or pd.count<=pd.sumCount}">
							<input type="checkbox" name="cboxs" disabled="disabled" value="">
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="cBox" value="${pd.id}">
						</c:otherwise>
					</c:choose>
					
				</td>
				<td>
						${pd.seriesnumber}
				</td>
				
				<td>
					${pd.mtype}
					<%-- <c:set var="pdt" value="${pd.type}"/>
					${fns:getDictLabel(pdt,'pd_hc_type','')} --%>
				</td>
				<td id="c${pd.id}">
					${pd.count}
				</td>
				<td id="sc${pd.id}">${pd.sumCount}</td>
				<!-- <td>&nbsp;</td> -->
				
					<c:choose>
						<c:when test="${ pd.count>pd.sumCount}">
							<td><input style="width:80px;height:11px;" id="txt${pd.id}" type="text" value="${pd.count - pd.sumCount}"/></td>
							<%-- <td><input style="width:80px;height:11px;" id="price${pd.id}" type="text" value=""/></td> --%>
						</c:when>
						<c:otherwise>
							<td>&nbsp;</td>
							<!-- <td>&nbsp;</td> -->
						</c:otherwise>
					</c:choose>
				
				<td>${pd.assignto.name}</td>
				<td><fmt:formatDate value="${pd.createDate}" pattern="yyyy-MM-dd" /></td>
			</tr>
		</c:forEach>
            </tbody>  
		 </table>
		 </form:form>
	</div>

</body>

</html>