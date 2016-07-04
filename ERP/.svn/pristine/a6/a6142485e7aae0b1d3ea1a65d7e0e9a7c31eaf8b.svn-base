<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>供应商发货（黑材）</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript" src="${ctxStatic}/modules/purchase/scripts/purchase.js?tsf=${jsVersion}"></script>
	<script type="text/javascript">
	function fromValidate(){
    	var falg = $("input[name='cBox']").is(':checked');//$("cBox").prop("checked");
		if(!falg){
			alert("请选择相应的列表数据！");
			return false;
		}
		var checks = $("input[name='cBox']:checked");
		var ids = "";
		if(checks.length>1){
			alert("一次只能发一笔单");
			return false;
		}
		var id = $(checks[0]).attr("value");
		$("#receiptID").val(id);
		return true;
    }
	</script>
	
    <script type="text/javascript">
    </script>
    <style type="text/css">
    .w160{width:160px;}
    </style>
</head>
<body>
	<form:form id="pNumberForm" style="display:none;" modelAttribute="oaNotify" action="${ctx}/purchase/purchase/purchaseDetail" method="post" class="breadcrumb form-search">
        <input id="pNumber" name="pNumber" type="hidden" value=""/>
     </form:form>
	<div class="list-content">
	     <div class="nav-operate" >
	     																<%-- ${ctx}/purchase/purchase/submitDemand  ${ctx}/purchase/purchaseDemand/assign --%>
	           <form:form id="searchForm" modelAttribute="" action="${ctx}/purchase/purchase/list" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        <input id="ids" name="ids" type="hidden" value=""/>
		        <%-- <ul class="operationg-new" >
		        	<li><label>采购员：</label>
						<form:select id="assignto" path="assignto" class="input-small">
							<form:options items="${fns:getDictList('jcsj_gfc')}" itemValue="value" itemLabel="label" htmlEscape="false"/></form:select>
					</li>
					 <li><label>采购类别：</label>
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
					<li id="sendli" style="display:none;" class="operation-project" showWidth="450px" thisTagert="sendDiv" ></li>
	            	<li><input id="send" type="button" class="btn btn-primary" value="发货"></li>
		           <shiro:hasRole name="采购员">
			           <li id="receiptli" style="display:none;" class="operation-project" showWidth="800px" thisTagert="sfDetailDiv" ></li>
		            	<li><input id="receipt" type="button" class="btn btn-primary" value="收货"></li>
	            	</shiro:hasRole>
					<li>
	            	    <a href="${ctx}/purchase/purchase/list"><span class="glyphicon glyphicon-refresh"></span>刷新</a>
		            </li>
		          
					<li  class="operation-project" showWidth="450px" thisTagert="appoint-saider1" >
	            		<a href="javascript:void(0)"><span class="glyphicon glyphicon-log-out"></span>供应商发货</a>
	            	</li>
		           <li  class="operation-project" showWidth="800px" thisTagert="appoint-saider2" >
	            		<a href="javascript:void(0)"><span  class="glyphicon glyphicon-log-in" ></span>供应商收货</a>
	               </li>
	            	
		        </ul> --%>
		        <%-- <ul class="search">
		            <li>
		            	<form:input path="seriesnumber" htmlEscape="false" class="input-medium" placeholder="关键字"/>
		               <!-- <input type="text" class="input-medium" placeholder="关键字"> -->
		            </li>
		            <li>
		            	<input class="search-btn" type="submit" value="查询"/>
		            	<!-- <button class="search-btn" id="table-set" type="button">查询</button> -->
		            </li>
		        </ul>
		       <div class="clearfix"></div> --%>
		       </form:form>
		       <div class="clear"></div>
			   
	      </div>
	     <sys:message content="${message}"/>
		 <table id="contentTable" class="table table-striped table-bordered table-condensed resize table-eidt width-75">
		   <thead>
		   	<tr>
			     <th class="all-check">
			         <input type="checkbox" id="all-check"  />
			         <label for="all-check">选择</label>
			     </th>
			     <th>采购单编号</th>
			     <th>材料名称</th>
			     <th>下单数量</th>
			     <th>发货数量</th>
			     <!-- <th>状态</th>
			     <th>操作</th> -->
             </tr>
            </thead>
            <!-- 列表数据 -->
            <tbody>
            	<c:forEach items="${page.list}" var="sfDetail">
			<tr>
				<td><input type="checkbox" name="cBox" value="${sfDetail.id}"></td>
				<td>
					<%-- <a name="pNumber" id="${p.seriesnumber}" href="javascript:void(0);"><span class="operation-project" showWidth="600px" thisTagert="appoint-saider3" > --%>
						${sfDetail.p.seriesnumber}
					<!-- </span></a> -->
				</td>
				<td>
					${sfDetail.p.mtype}
					<%-- <c:set var="pdt" value="${p.type}"/>
					${fns:getDictLabel(pdt,'pd_hc_type','')} --%>
				</td>
				<td>
					${sfDetail.p.count}
				</td>
				<td>
					${sfDetail.fcount}
				</td>
			</tr>
		</c:forEach>
            </tbody>  
		 </table>
		 <!-- 收货界面 -->
	<div class="div_right" id="sendDiv">
	 <form:form id="inputForm1" modelAttribute="inputForm1" action="${ctx}/logistics/purchaseLogistics/receiptHCPurchase" method="post"  onsubmit="javascript:return fromValidate();" class="form-horizontal">
      		<input id="receiptID" name="receiptID" type="hidden" value=""/>
       <h3><i></i>收货单</h3>
        <ul class="all-line-lis">
       	   <li>
             <span class="tab-name">
             	镀锌厂收货数量：
             </span>
             <label>
                  <input class="w160" id="fcount" name="scount" type="text" value=""/>
             </label>
          </li>
          <li>
             <span class="tab-name">
             	镀锌厂过磅重量：</span>
             	<label>
                  <input class="w160" id="fweight" name="sweight" type="text" value=""/>
             </label>
             	
          </li>
          <!-- <li>
             <span class="tab-name">收货地点：</span>
             <label>
                 <input type="text" value=""/>
               <select id="commadd" class="input-medium">
	                    
               		</select>
             </label>
          </li>
          <li>
             <span class="tab-name">收货联系人：</span>
             <label>
                 <input id="cpname" class="w160" type="text" value=""/>
             </label>
          </li>
         
          <li>
             <span class="tab-name">收货人电话：</span>
             <label>
                 <input id="cpphone" class="w160" type="text" value=""/>
             </label>
          </li>
          <li>
             <span class="tab-name">运输公司：</span>
             <label>
                 <input type="text" value=""/>
                  <select id="gys" name="gys" class="input-medium">
	                    
               		</select>
             </label>
          </li>
          <li>
             <span class="tab-name">联系电话：</span>
             <label>
                 <input id="contactphone" class="w160" type="text" value=""/>
             </label>
          </li> -->
 		  
          <li>
             <span class="tab-name">&nbsp;&nbsp;&nbsp;</span>
             <label>
                 <input type="submit" id="saveSend" name="saveSend" value="确认收货" class="btn btn-primary"/>
             </label>
          </li> 
       </ul>
       </form:form>
    </div>
	</div>
	
    <!-- 收货界面 -->
    <div class="appoint-saider" id="sfDetailDiv">
	 <form:form id="inputForm2" modelAttribute="inputForm2" action="" method="post"  onsubmit="" class="form-horizontal">
       <h3><i></i>收货单</h3>
       	   <table id="contentTable" class="table table-striped table-bordered table-condensed resize">
		   <thead>
		   	<tr>
			     <th>发货单编号</th>
			     <th>钢材厂发货数量</th>
			     <th>钢材厂过磅重量</th>
			     <th>镀锌厂收货数量</th>
			     <th>镀锌厂过磅重量</th>
			     <th>操作</th>
             </tr>
            </thead>
            <tbody id="sfDetail">
				
            </tbody>  
		 </table>
       </form:form>
    </div>
    <!-- 采购订单数据来源，即采购需求 -->
    <div class="appoint-saider" id="appoint-saider3">
	 <form:form id="inputForm3" modelAttribute="inputForm3" action="${ctx}/purchase/purchase/submitDemand" method="post"  class="form-horizontal">
       <h3><i></i>采购需求详情</h3>
       	   <table id="contentTable" class="table table-striped table-bordered table-condensed resize">
		   <thead>
		   	<tr>
			     <th>需求单编号</th>
			     <th>需求数量</th>
			     <th>状态</th>
			     
             </tr>
            </thead>
            <tbody id="pdDetail">
			
            </tbody>  
		 </table>
       </form:form>
    </div>
    <!-- 发货详情 -->
    <div class="appoint-saider" id="sendDetail">
	 <form:form id="sendDetailForm" modelAttribute="inputForm3" action="${ctx}/purchase/purchase/submitDemand" method="post" class="form-horizontal">
       <h3><i></i>发货详情</h3>
       	   <table id="contentTable" class="table table-striped table-bordered table-condensed resize">
		   <thead>
		   	<tr>
			     <th>发货单编号</th>
			     <th>钢材厂发货数量</th>
			     <th>钢材厂过磅重量</th>
             </tr>
            </thead>
            <tbody id="ghxq">
			
            </tbody>  
		 </table>
       </form:form>
    </div>
</body>
</html>