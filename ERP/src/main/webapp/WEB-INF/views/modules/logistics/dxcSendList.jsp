<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>镀锌厂发货</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript" src="${ctxStatic}/modules/logistics/scripts/purchaseLogistics.js?tsf=${jsVersion}"></script>
	<script type="text/javascript">
		
	</script>
	
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
		$("#sendID").val(id);
		return true;
    }
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
		        <!-- <ul class="operationg-new" >
					<li id="sendli" style="display:none;" class="operation-project" showWidth="450px" thisTagert="sendDiv" ></li>
	            	<li><input id="send" type="button" class="btn btn-primary" value="发货"></li>
	            	
		        </ul> -->
		        <%-- <ul class="search">
		            <li>
		            	<form:input path="seriesnumber" htmlEscape="false" class="input-medium" placeholder="关键字"/>
		               <!-- <input type="text" class="input-medium" placeholder="关键字"> -->
		            </li>
		            <li>
		            	<input class="search-btn" type="submit" value="查询"/>
		            	<!-- <button class="search-btn" id="table-set" type="button">查询</button> -->
		            </li>
		        </ul> --%>
		       <div class="clearfix"></div>
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
			     <!-- <th>状态</th>
			     <th>操作</th> -->
             </tr>
            </thead>
            <!-- 列表数据 -->
            <tbody>
            	<c:forEach items="${page.list}" var="p">
			<tr>
				<td><input type="checkbox" name="cBox" value="${p.id}"></td>
				<td>
					<a name="pNumber" id="${p.seriesnumber}" href="javascript:void(0);"><span class="operation-project" showWidth="600px" thisTagert="appoint-saider3" >
						${p.seriesnumber}
					</span></a>
				</td>
				<td>
					${p.mtype}
					<%-- <c:set var="pdt" value="${p.type}"/>
					${fns:getDictLabel(pdt,'pd_hc_type','')} --%>
				</td>
				<td>
					${p.count}
				</td>
			</tr>
		</c:forEach>
            </tbody>  
		 </table>
		 <!-- 发货界面 -->
	<div class="div_right" id="sendDiv">
	 <form:form id="inputForm1" modelAttribute="inputForm1" action="${ctx}/logistics/purchaseLogistics/dxcSend" method="post" onsubmit="javascript:return fromValidate();" class="form-horizontal">
      		<input id="sendID" name="sendID" type="hidden" value=""/>
       <h3><i></i>发货单</h3>
        <ul class="all-line-lis">
       	   <li>
             <span class="tab-name">
             	镀锌厂发货数量：
             </span>
             <label>
                  <input class="w160" id="fcount" name="fcount" type="text" value=""/>
             </label>
          </li>
          <li>
             <span class="tab-name">
             	镀锌厂过磅重量：</span>
             	<label>
                  <input class="w160" id="fweight" name="fweight" type="text" value=""/>
             </label>
             	
          </li>
          <%-- <li>
             <span class="tab-name">收货地点：</span>
             <label>
               <select id="commPer" class="input-medium">
               		<option value="">请选择</option>
                    <c:forEach items="${listC}" var="c">
						<option name="${c.name}" phone="${c.phone}" value="${c.id}">${c.address}</option>
					</c:forEach>
               	</select>
             </label>
          </li>
          <li>
             <span class="tab-name">收货联系人：</span>
             <label>
                 <input readOnly="readOnly" id="cname" class="w160" type="text" value=""/>
             </label>
          </li>
         
          <li>
             <span class="tab-name">收货人电话：</span>
             <label>
                 <input readOnly="readOnly" id="cphone" class="w160" type="text" value=""/>
             </label>
          </li> --%>
          <li>
             <span class="tab-name">承运方：</span>
             <label>
                 <!-- <input type="text" value=""/> -->
                  <select id="cyf" name="cyf" class="input-medium">
                  		<option value="">请选择</option>
	                    <c:forEach items="${listSupp}" var="supp">
							<option contactphone="${supp.businessTel}" value="${supp.id}">${supp.name}</option>
						</c:forEach>
               		</select>
             </label>
          </li>
          <li>
             <span class="tab-name">联系电话：</span>
             <label>
                 <input readOnly="readOnly" id="contactphone" class="w160" type="text" value=""/>
             </label>
          </li>
 		  
          <li>
             <span class="tab-name">&nbsp;&nbsp;&nbsp;</span>
             <label>
                 <input type="submit" id="saveSend" name="saveSend" value="确认发货" class="btn btn-primary"/>
             </label>
          </li> 
       </ul>
       </form:form>
    </div>
	</div>
	
</body>
</html>