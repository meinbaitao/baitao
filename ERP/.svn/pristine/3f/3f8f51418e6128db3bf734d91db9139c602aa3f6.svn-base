<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>发货清单管理</title>
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
					inputForm.attr('action',startUp.getRootPath()+"/a/logistics/logisticsDetail/delete?vCheckd="+vCheckd);
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
	         <li>
				<form id="deleteForm" action="${ctx}/logistics/logisticsDetail/delete" method="post">
					<input id="btnDelete" class="btn btn-primary" type="button" value="删除">
				</form>
			 </li>
	        </ul>
<%-- 	       	<form:form id="searchForm" modelAttribute="logisticsDetail" action="${ctx}/logistics/logisticsDetail/"
	       		 method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<ul class="search">
					<li><span>物料名称：</span>
						<label><form:input path="materialNo" htmlEscape="false" maxlength="20" class="input-medium"/></label>
					</li>
					<li ><input id="btnSubmit" class="search-btn" type="submit" value="查询"/></li>
					<li class="clearfix"></li>
				</ul>
			</form:form> --%>
	     </div>

	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th class="all-check">
		         <input type="checkbox" id="all-check" >
		         <label for="all-check">全选</label>
	   		    </th>
				<th>箱号</th>
				<th>物料编号</th>
				<th>物料类型</th>
				<th>规格W</th>
				<th>规格H</th>
				<th>规格T</th>
				<th>单位</th>
				<th>数量</th>
				<th>入库数</th>
				<th>发货数</th>
				<th>面积</th>
				<th>重量</th>
				<th>左开角</th>
				<th>右开角</th>
				<th>开角<br>米数</th>
				<th>开槽<br>米数</th>
				<th>滴水槽<br>米数</th>
				<th>切角<br>个数</th>
				<th>转角<br>个数</th>
				<th>弧形线条<br>(是/否)</th>
				<th>防水<br>面积</th>
				<th>胚料<br>面积</th>
				<th>饰面<br>面积</th>
				<th>备注</th>
<!-- 				<th>操作</th> -->
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="material">
			<tr>
				<td><input type="checkbox" name="checkdbox" id="${material.id}"></td>
				<td>
					${logisticsDetail.boxNo}
				</td>
				<td>
					${logisticsDetail.materialNo}
				</td>
				<td>
					${logisticsDetail.materialType}
				</td>
				<td>
					${logisticsDetail.standardW}
				</td>
				<td>
					${logisticsDetail.standardH}
				</td>
				<td>
					${logisticsDetail.standardT}
				</td>
				<td>
					${logisticsDetail.unit}
				</td>
				<td>
					${logisticsDetail.amount}
				</td>
				<td>
					${logisticsDetail.wareAmount}
				</td>
				<td>
					${logisticsDetail.logisticsAmount}
				</td>
				<td>
					${logisticsDetail.area}
				</td>
				<td>
					${logisticsDetail.quality}
				</td>
				<td>
					${logisticsDetail.angleLeft}
				</td>
				<td>
					${logisticsDetail.angleRight}
				</td>
				<td>
					${logisticsDetail.angelMeter}
				</td>
				<td>
					${logisticsDetail.carveSlotMeter}
				</td>
				<td>
					${logisticsDetail.waterSlotMeter}
				</td>
				<td>
					${logisticsDetail.cutAngleCount}
				</td>
				<td>
					${logisticsDetail.turnAngleCount}
				</td>
				<td>
					${logisticsDetail.isArcLine}
				</td>
				<td>
					${logisticsDetail.waterProofArea}
				</td>
				<td>
					${logisticsDetail.rawArea}
				</td>
				<td>
					${logisticsDetail.decorateArea}
				</td>
				<td>
					${logisticsDetail.remarks}
				</td>
<%-- 				<td>
    				<a href="${ctx}/logistics/logisticsDetail/form?id=${logisticsDetail.id}">修改</a>
				</td> --%>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
	<div class="pagination">${page}</div>

</body>
</html>