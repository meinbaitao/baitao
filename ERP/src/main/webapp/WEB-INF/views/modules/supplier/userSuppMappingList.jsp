<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>供应商管理</title>
	<meta name="decorator" content="default"/>
	<%-- <script type="text/javascript" src="${ctxStatic}/modules/supplier/scripts/supplier.js?tsf=${jsVersion}"></script> --%>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		function validateIDs(){
			var falg = $("input[name='cBox']").is(':checked');//$("cBox").prop("checked");
			if(!falg){
				window.alertx("请选择相应的列表数据！");
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
			$("#ids").val(ids);
			$("#uid").val($("#scjl").val());
			return true;
		}
	</script>
</head>
<body>

<div class="list-content" >
		<form:form style="display:none;" id="saveForm" action="${ctx}/supplier/userSuppMapping/saveUSM" method="post" onsubmit="javascript:return validateIDs();" class="form-horizontal">
	       	<input id="ids" name="ids" type="hidden" value=""/>
	       	<input id="uid" name="uid" type="hidden" value=""/>
     	</form:form>
	    <div class="nav-operate" >
	        <form:form id="searchForm" action="${ctx}/supplier/userSuppMapping/userSuppMappingList" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<ul class="operationg-new" >
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
	            	   <input name="saveBtn" id="saveBtn" type="button" class="btn btn-primary" value="保存">
	            	</li>
	        	</ul>
				<ul class="search">
					<%-- <li><span>供应商类型：</span>
					   <label>
						<form:input path="type" htmlEscape="false" maxlength="20" class="input-medium"/>
						</label>
					</li> --%>
					<li>
					   <label>
						<input id="name" name="name" htmlEscape="false" maxlength="20" placeholder="供应商名称" class="input-medium"/>
						</label>
					</li>
					<li ><input id="btnSubmit" class="search-btn" type="submit" value="查询"/></li>
					<li class="clearfix"></li>
				</ul>
			</form:form>
	     </div>
	
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>选择</th>
				<th>供应商编号</th>
				<th>供应商名称</th>
				<th>生产经理</th>
				<!-- <th>供应商简称</th>
				<th>供应商优势</th> -->
				<th>备注</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="usm">
			<tr>
				<td><input value="${usm.supp.id }" name="cBox" type="checkbox"> </td>
				<td>
					${usm.supp.seriesnumber}
				</td>
				<td>
					${usm.supp.name}
				</td>
				<td>
					${usm.user.name}
				</td>
				<%-- <td>
					${usm.supp.abbreviation}
				</td>
				<td>
					${usm.supp.goodness}
				</td> --%>
				<td>
					${usm.supp.remarks}
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
	<div class="pagination">${page}</div>
	<script type="text/javascript">
		$("#saveBtn").unbind("click").bind("click",function(){
			$("#saveForm").submit();
		});
	</script>
</body>

</html>