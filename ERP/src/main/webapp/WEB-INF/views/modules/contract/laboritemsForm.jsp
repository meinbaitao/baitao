<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>劳务清单</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script src="${ctxStatic}/modules/contract/scripts/laboritems.js?tsf=${jsVersion} " type="text/javascript"></script>
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
	<div class="list-content">
	     <%-- <div class="nav-operate" >															
           <form:form id="searchForm" modelAttribute="laboritems" action="" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        
		        <ul class="operationg-new" >
		            <li>
		            	<span class="tab-name">劳务清单类型：</span>
						<label>
							<select name="laboritemsType" class="input-medium required " id="laboritemsType">
		                			<option value="">请选择</option>
							</select>
						</label>
		            </li>
		            <li>
		            	<span class="tab-name">户型：</span>
		            </li>
		            <li>
		            	<span class="tab-name">楼栋：</span>
		            </li>
		        </ul>
		       <div class="clearfix"></div>
	       </form:form>
		       <div class="clear"></div>
	      </div> --%>
     <form:form id="inputFrom" action="${ctx}/contract/laboritems/save" method="post" class="breadcrumb form-search">
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 <a class="btn btn-primary" href="${ctx}/contract/laborcontract/formVerify?id=${param.laborcontractId}">返回</a>
		 <input class="btn btn-primary" type="submit" name="submit" value="保存" /></th>
		 <input id="subId" name="subId" type="hidden" value="${param.subId}"/>
		 <input name="laborcontractId" type="hidden" value="${param.laborcontractId}"/>
		 <table id="contentTables" class="table table-striped table-bordered table-condensed resize">
		   <thead>
		   	<tr>
	   		 	<th colspan="2">劳务清单类型</th>
				<th colspan="4">
				 <!-- onchange="javascript:inputSubmit()" -->
					<select id="laboritemsType" name="laboritemsType" class="input-medium required ">
               			<option value="">请选择</option>
               			<c:forEach items="${fns:getDictList('laboritemsprice_type')}" var="obj" varStatus="i">
               				<c:choose>
               					<c:when test="${param.laboritemsType eq obj.value}">
               						<option selected="selected" value="${obj.value }">${obj.label }</option>
               					</c:when>
               					<c:otherwise>
               						<option value="${obj.value }">${obj.label }</option>
               					</c:otherwise>
               				</c:choose>
               				
               			</c:forEach>
					</select>
				</th>
				<th colspan="1">户型：</th>
				<th colspan="3">${sub.houseType }</th>
				<th colspan="3">楼栋：</th>
				<th colspan="4">${sub.building }</th>
             </tr>
            </thead>
          </table>
		 <div id="scroll-table">
			<div id="scroll-head">
			</div>
			<div id="tbody-scroll" class="tbody-scroll" >
		 <table id="contentTable" class="table table-striped table-bordered table-condensed resize">
		   <thead>
		   	<tr>
		   		 <th rowspan="2">序号</th>
			     <th rowspan="2">名称</th>
			     <th rowspan="2">图样</th>
			     <th colspan="3">规格</th>
			     <th rowspan="2">成本预算量</th>
			     <th rowspan="2">浮动比例</th>
			     <th rowspan="2">合同量</th>
			     <th rowspan="2">单位</th>
			     <th colspan="3">综合单价（标准价）</th>
			     <th rowspan="2">浮动比例</th>
			     <th colspan="3">合同价</th>
			     <th rowspan="2">标准价合计（元）</th>
			     <th rowspan="2">合同价合计（元）</th>
			     <th rowspan="2">成本预算合计</th>
             </tr>
             <tr>
		   		 <th>长</th>
		   		 <th>宽</th>
		   		 <th>厚</th>
		   		 <th>综合单价</th>
		   		 <th>骨架</th>
		   		 <th>石材</th>
		   		 <th>综合单价</th>
		   		 <th>骨架</th>
		   		 <th>石材</th>
             </tr>
            </thead>
            <tbody id="listLaborItems">
            	
            </tbody>  
		 </table>
		 </div>
		 </div>
	 </form:form>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){ 
			loadData();
		}); 
	</script>
</body>
</html>