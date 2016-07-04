<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>生产需求管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript" src="${ctxStatic}/modules/process/scripts/process.js?tsf=${jsVersion}"></script>
	
	<script type="text/javascript">
		
		//验证入库
		/* function validateIntoWarehouse(){
			var falg = $("input[name='cBox']").is(':checked');
			if(!falg){
				alert("请选择相应的列表数据！");
				return false;
			}
			var checks = $("input[name='cBox']:checked");
			if(checks.length>1){
				alert("一次只能对一条加工单进行入库操作！");
				return false;
			}
			var pID = $(checks[0]).attr("value");
			var pNumber = $(checks[0]).attr("attrNumber");
			$("#pNumber").val(pNumber);
			$("#pID").val(pID);
			return true;
		} */
	</script>
</head>
<body>
	<form:form style="display:none;" id="answer" modelAttribute="answer" action="${ctx}/process/process/answer" method="post" class="breadcrumb form-search">
		<input id="answerIDs" name="answerIDs" type="hidden" value=""/>
		<input name="pstatus" type="hidden" value=""/>
	</form:form>
	 
	<div class="list-content">
	     <div class="nav-operate" >
	     																<%-- ${ctx}/process/process/submitDemand  ${ctx}/process/processDemand/assign --%>
           <form:form id="searchForm" modelAttribute="process" action="${ctx}/process/process/list" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        
		        <ul class="operationg-new" >
		        	<li><label>订单状态：</label>
						<select id="pstatus" name="pstatus" class="input-small" >
							<option value="0">请选择</option>
							<c:forEach items="${fns:getDictList('process_status')}" var="ps">
								<c:choose>
									<c:when test="${param.pstatus eq ps.value}">
										<option value="${ps.value}" selected="selected">${ps.label}</option>
									</c:when>
									<c:otherwise><!-- or ps.value eq 4 -->
										<c:if test="${ps.value eq 2 or ps.value eq 3 }">
											<option value="${ps.value}">${ps.label}</option>
										</c:if>
									</c:otherwise>
								</c:choose>
								
							</c:forEach>
						</select>
					</li>
					<c:if test="${param.pstatus eq 2}">
		            	<shiro:hasRole name="跟单员">
		            	<li >
		            		 <a href="javascript:void(0)" id="answerBtn"  ><span class="glyphicon glyphicon-list-alt"></span>接单</a>
		               </li>
		               </shiro:hasRole>
	               </c:if>
	               <c:if test="${param.pstatus eq 3}">
	               <shiro:hasRole name="仓库负责人">
	            	<li id="intoli" style="display:none;" class="operation-project" showWidth="500px" thisTagert="appoint-saider1" ></li>
            		<li >
	            		 <a href="javascript:void(0)" id="intoWarehouse"  ><span class="glyphicon glyphicon glyphicon-log-in"></span>入库</a>
	               </li>
	               </shiro:hasRole>
	               </c:if>
		        </ul>
		        <ul class="search">
		            <li>
		               <!-- <input type="text" class="input-medium" placeholder="关键字"> -->
		               <form:input path="seriesnumber" htmlEscape="false" class="input-medium" placeholder="关键字"/>
		            </li>
		            <li>
		            	<input class="search-btn" type="submit" id="searchBtn" name="searchBtn" value="查询"/>
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
			     <th>生产订单号</th>
			     <th>订单箱数</th>
			     <th>状态</th>
			     <th>跟单员</th>
             </tr>
            </thead>
            <tbody>
            	<c:forEach items="${page.list}" var="pd">
			<tr>
				<td><input type="checkbox" name="cBox" attrNumber="${pd.seriesnumber}" value="${pd.id}"></td>
				<td>
					<a name="processNumber" id="${pd.seriesnumber}" href="javascript:void(0);">
					<span class="operation-project" showWidth="600px" thisTagert="appoint-saider3" >
						${pd.seriesnumber}
					</span>
					</a>
				</td>
				<td>
					${pd.total}
				</td>
				<td>
					<c:set var="status" value="${pd.status}"/>
					${fns:getDictLabel(status, 'process_status', '')}
				</td>
				<%-- <td>
					<a name="processNumber" id="${pd.seriesnumber}" href="javascript:void(0);">
					<span class="operation-project" showWidth="600px" thisTagert="appoint-saider4" >
						${pd.count}
					</span>
					</a>
				</td> --%>
				<td>${pd.documentaryby.name}</td>
				<!-- <td>&nbsp;</td>
				<td>&nbsp;</td> -->
				
			</tr>
		</c:forEach>
            </tbody>  
		 </table>
	</div>
	<div class="appoint-saider" id="appoint-saider1">
	 <form:form id="intoWarehouseForm" modelAttribute="inputForm1" action="${ctx}/process/process/intoWarehouse" method="post" class="form-horizontal">
       <input id="pNumber" name="pNumber" type="hidden" value=""/>
       <input id="pID" name="pID" type="hidden" value=""/>
       <input name="pstatus" type="hidden" value=""/>
       <h3><i></i>入库详情</h3>
        <table id="contentTable" class="table table-striped table-bordered table-condensed resize">
		   <thead>
		   	<tr>
			     <th>箱号</th>
			     <th>状态</th>
			     <!-- <th>查看</th> -->
             </tr>
            </thead>
            <tbody id="boxDetail">
			
            </tbody>  
		 </table>
		 <input id="intoBtn" type="submit" class="input-medium btn btn-primary" value="确定">
       </form:form>
    </div>
    <div class="appoint-saider" id="appoint-saider3">
	 <form:form id="inputForm3" modelAttribute="inputForm3" action="${ctx}/process/process/submitDemand" method="post"  onsubmit="javascript:return validateSubmitDemand();" class="form-horizontal">
       <h3><i></i>需求详情</h3>
       	   <table id="contentTable" class="table table-striped table-bordered table-condensed resize">
		   <thead>
		   	<tr>
			     <th>需求单编号</th>
			     <th>下单数量</th>
             </tr>
            </thead>
            <tbody id="ProToDetail">
			
            </tbody>  
		 </table>
       </form:form>
    </div>
    <div class="appoint-saider" id="appoint-saider4">
	 <form:form id="inputForm4" modelAttribute="inputForm4" action="${ctx}/process/process/submitDemand" method="post"  onsubmit="javascript:return validateSubmitDemand();" class="form-horizontal">
       <h3><i></i>详情</h3>
       	   <table id="contentTable" class="table table-striped table-bordered table-condensed resize">
		   <thead>
		   	<tr>
			     <th>采购单编号</th>
			     <th>采购类别</th>
			     <th>下单数量</th>
			     <th>状态</th>
			     
             </tr>
            </thead>
            <tbody id="">
			
            </tbody>  
		 </table>
       </form:form>
    </div>
    <div class="clearfix"></div>
</body>
</html>