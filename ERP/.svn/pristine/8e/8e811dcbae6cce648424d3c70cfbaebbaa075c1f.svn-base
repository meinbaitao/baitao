<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>黑材采购单</title>
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
			var falg = $("input[name='cBox']").is(':checked');
			if(!falg){
				window.alertx("请选择相应的列表数据！");
				return false;
			}
			var checks = $("input[name='cBox']:checked");
			var ids = "";
			var ps = "";
			for(var i=0;i<checks.length;i++){
				var id = $(checks[i]).attr("value");
				var p = $("#price"+id).val();
				ids+=id;
				ps+=p;
				if(i+1<checks.length){
					ids+=",";
					ps+=",";
				}
			}
			$("#sdIDs").val(ids);
			$("#ps").val(ps);
			return true;
		}
	</script>
</head>
<body>
	<form:form id="assignForm" style="display:none;" action="${ctx}/purchase/purchaseDemand/assign" method="post" onsubmit="javascript:return validateAssign();" class="breadcrumb form-search">
		<input id="assignIDs" name="assignIDs" type="hidden" value=""/>
		<input id="cgyID" name="cgyID" type="hidden" value=""/>
	</form:form>
	<form:form id="detailForm" style="display:none;" action="${ctx}/purchase/purchase/getHCDetailBySeriesNumber" method="post" class="breadcrumb form-search">
		<input id="detailSN" name="seriesnumber" type="hidden" value=""/>
	</form:form>
	<div class="list-content">
	     <div class="nav-operate" >															
           <form:form id="searchForm" modelAttribute="purchase" action="${ctx}/purchase/purchase/purchaseHCList" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        
		        <ul class="operationg-new" >
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
		 <table id="contentTable" class="table table-striped table-bordered table-condensed resize table-eidt width-75">
		   <thead>
		   	<tr>
			     <!-- <th class="all-check">
			         <input type="checkbox" id="all-check"  />
			         <label for="all-check">选择</label>
			     </th> -->
			     <th>订单编号</th>
			     <!-- <th>材料名称</th>
			     <th>采购数量</th>
			     <th>库存数量</th>
		     	 <th>采购下单数量</th>
			     <th>单价(元/公斤)</th> -->
			     <!-- <th>状态</th> -->
			     <th>制单日期</th>
			     <th>状态</th>
			     <th>采购员</th>
             </tr>
            </thead>
            <tbody>
            	<c:forEach items="${page.list}" var="p">
			<tr>
				<td>
					<a name="purchaseDetail" sn="${p.seriesnumber}" href="javascript:void(0);">
						${p.seriesnumber}
					</a> 
				</td>
				
				<td><fmt:formatDate value="${p.createDate}" pattern="yyyy-MM-dd" /></td>
				<td>&nbsp;
					<c:choose>
						<c:when test="${p.workflowstatus eq '2' or p.workflowstatus eq '1'}">
							待审核
						</c:when>
						<c:when test="${p.workflowstatus eq '4'}">
							已完成
						</c:when>
						<c:otherwise>待提交</c:otherwise>
					</c:choose>
				</td>
				<td>${p.createBy.name}
				</td>
			</tr>
		</c:forEach>
            </tbody>  
		 </table>
		 <%-- <div class="div_right" id="CPDiv">
			 <form id="cpForm" modelAttribute="" action="${ctx}/purchase/purchase/submitDemand" method="post" onsubmit="javascript:return validateSubmitDemand();" class="form-horizontal">
		      		<input id="sdIDs" name="sdIDs" type="hidden" value=""/>
		      		<input id="vs" name="vs" type="hidden" value=""/>
		      		<input id="ps" name="ps" type="hidden" value=""/>
		       <h3><i></i></h3>
		        <ul>
		       	   <li>
		             <span class="tab-name">
		             	供应商：
		             </span>
		             <label>
		                  <select id="gys" name="gys" class="input-medium">
			                    <option value="">请选择</option>
			                  	<c:forEach items="${fns:getSuppByType('supp_gys')}" var="obj">
									<option contactphone="${fns:escapeHtml(obj.contactphone)}" value="${fns:escapeHtml(obj.id)}" >${fns:escapeHtml(obj.name)}</option>
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
			                    <c:forEach items="${fns:getSuppByType('supp_gys')}" var="obj">
									<option value="${fns:escapeHtml(obj.id)}" >${fns:escapeHtml(obj.name)}</option>
								</c:forEach>
			                  	<c:forEach items="${fns:getCommPerson('aa')}" var="obj">
									<option name="${fns:escapeHtml(obj.name)}" phone="${fns:escapeHtml(obj.phone)}" value="${fns:escapeHtml(obj.id)}">${fns:escapeHtml(obj.address)}</option>
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
		                 <input class="btn btn-primary" type="submit" id="submitDemands" name="submitDemands" value="确定"/>
		             </label>
		          </li> 
		       </ul>
		       </form>
    	</div> --%>
	</div>
	<!-- 生成采购单关联的数据界面 -->
	
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