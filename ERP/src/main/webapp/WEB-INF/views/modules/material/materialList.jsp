<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>物料信息管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		$(function(){
			//删除
			$("#btnDelete").click(function(){
				var orderType = $("#orderType").val();
				var vCheckd =[]; 
				$('input[name="checkdbox"]:checked').each(function(){ 
					vCheckd.push($(this).attr("id")); 
				}); 
				if(vCheckd.length==0){
					//alert("请先勾选删除项！"); 
					window.alertx("请先勾选删除项！"); 
					return;
				}
				window.confirmx("确定要删除？",function(){
					var inputForm = $('#deleteForm');
					inputForm.attr('action',startUp.getRootPath()+"/a/material/material/delete?vCheckd="+vCheckd);
					inputForm.submit();				
				});
			});
		});
	</script>
</head>
<body>
<div class="list-content" >
	    <div class="nav-operate" >
	        <ul class="operationg-new" >
	         <li><a href="${ctx}/material/material/form"><input class="btn btn-primary" type="button" value="添加物料信息"></a></li>
	         <li>
				<form id="deleteForm" action="${ctx}/material/material/delete" method="post">
					<input id="btnDelete" class="btn btn-primary" type="button" value="删除">
				</form>
			 </li>
	        </ul>
	       	<form:form id="searchForm" modelAttribute="material" action="${ctx}/material/material/" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<ul class="search">
					<li><span>物料名称：</span>
						<label><form:input path="name" htmlEscape="false" maxlength="100" class="input-medium"/></label>
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
				<th class="all-check">
		         <input type="checkbox" id="all-check" >
		         <label for="all-check">全选</label>
	   		    </th>
				<th>物料编号</th>
				<th>物料名称</th>
				<th>物料类型</th>
				<th>物料规格</th>
				<th>长</th>
				<th>宽</th>
				<th>高</th>
				<th>密度</th>
				<th>单位</th>
				<th>材质</th>
				<th>损耗率</th>
				<th>单位重量</th>
				<!-- 
				<th>更新时间</th>
				 -->
				<th>备注信息</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="material">
			<tr>
				<td><input type="checkbox" name="checkdbox" id="${material.id}"></td>
				<td>
					${material.seriesNumber}
				</td>
				<td>
					${material.name }
				</td>
				<td>
					${material.type}
				</td>
				<td>
					${material.model }
				</td>
				<td>
					${material.length}
				</td>
				<td>
					${material.width }
				</td>
				<td>
					${material.height}
				</td>
				<td>
					${material.quantity }
				</td>
				<td>
					${material.unit}
				</td>
				<td>
					${material.materia }
				</td>
				<td>
					${material.lossRate}
				</td>
				<td>
					${material.uweight }
				</td>
				<!-- 
				<td>
					<fmt:formatDate value="${material.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				 -->
				<td>
					${material.remarks}
				</td>
				<td>
    				<a href="${ctx}/material/material/form?id=${material.id}">修改</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
	<div class="pagination">${page}</div>

</body>

</html>