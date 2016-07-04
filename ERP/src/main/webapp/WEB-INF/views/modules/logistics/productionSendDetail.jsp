<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>发货详情(石材发货记录单)</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/modules/logistics/scripts/productionLogistics.js?tsf=${jsVersion}" type="text/javascript"></script>
	<jsp:useBean id="now" class="java.util.Date" />
	<script src="${ctxStatic}/modules/comm/jquery.jqprint-0.3.js?tsf=${jsVersion}" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			form_validate("inputForm");
			$("#requireDateTD").click(function(){
				$("#requireDateTD").html("<input id='requireDate' name='requireDate' type='text' class='input-medium Wdate' onclick='WdatePicker({dateFmt:\"yyyy-MM-dd\",isShowClear:false});' value='' />"); 
			});
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		function vids(){
			var falg = $("input[name='cBox']").is(':checked');//$("cBox").prop("checked");
			if(!falg){
				window.alertx("请选择相应的列表数据！");
				loaded();
				return false;
			}
			var checks = $("input[name='cBox']:checked");
			var ids = "";
			for(var i=0;i<checks.length;i++){
				ids+=$(checks[i]).attr("value");
				if(i+1<checks.length)
					ids+=",";
			}
			$("#ids").val(ids);
			return true;
		}
		//打印
		function print(){
			$("#requireDateTD").html($("#requireDate").val());
			$("#contentTable").jqprint();
		}
		
	</script>
</head>
<body>
	<div class="list-content">
	     <div class="nav-operate" >
			   <ul class="operationg-new" >
            <li>
               <a href="${reUrl}" class="btn btn-primary">返回</a>
           </li>
           <li>
           		<input type="button" onclick="print()" class="btn btn-primary" value="打印"/>
           </li>
        </ul> 
	      </div>
	      
	     <sys:message content="${message}"/>
			<table id="contentTable" class="table table-striped table-bordered table-condensed resize tree_table">
			   <input id="isStatus" name="isStatus" type="hidden" value="${isStatus}"/>
			   <thead>
			   			<c:set var="c1" value="1"/><c:set var="c2" value="4"/>
			   			<c:set var="c3" value="1"/><c:set var="c4" value="3"/>
			   			
			   		<tr>
						<th>发货日期</th>
						<th colspan="${c2 }">发货地点</th> 
						<th>总箱数</th>  
						<th colspan="${c4 }">重量(公斤)</th>
						<th>车牌号</th>
				    </tr>
				    <tr>
						<td><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></td>
						<td colspan="${c2 }">${logisticsSend.supp.businessAddress}</td> 
						<td>${logisticsSend.quantity}</td>  
						<td colspan="${c4 }">${logisticsSend.weight}</td>
						<td>${logisticsSend.vehicleNumber}</td>
				    </tr>
				    <tr>
						<th>应到货日期</th>
						<th colspan="${c2 }">收货地点</th> 
						<th>收货人</th>  
						<th colspan="${c4 }">联系电话</th>
						<th>司机电话</th>
				    </tr>
				    <tr>
						<td id="requireDateTD"><input id="requireDate" name="requireDate" type="text" class="input-medium Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" value="" /></td>
						<td colspan="${c2 }">${logisticsSend.project.address}</td> 
						<td>${logisticsSend.materialStaffB.name}</td>  
						<td colspan="${c4 }">${logisticsSend.materialStaffB.phone}</td>
						<td>${logisticsSend.drivePhone}</td>
				    </tr>
		   			<tr>
						<th style="width:80px;">序号</th>
					     <th>加工厂名称</th>
					     <th>项目名称</th>
					     <th>楼栋号</th> 
					     <th>户型</th>
					     <th>石材种类</th>
					     <th>总箱数</th>
					     <th>发货面积</th>
					     <th colspan="2">箱号</th>
					</tr>
	            </thead>
            <tbody>
               <c:forEach items="${list}" var="ls" varStatus="i">
					<tr>
						 <td>${i.index+1 }</td>
					     <td>${ls.supp.name }<!-- 加工厂名称 --></td>
					     <td>${ls.project.name }<!-- 项目名称 --></td>
					     <td>${ls.sub.building }<!-- 楼栋号 --></td> 
					     <td>${ls.sub.houseType }<!-- 户型 --></td>
					     <td>${ls.orderBomBase.uniformMaterielTypeLab }<!-- 石材种类 --></td>
					     <td>${ls.quantity }<!-- 总箱数 --></td>
					     <td><fmt:formatNumber value="${ls.orderBomDetail.area }" pattern="#.#"/><!-- 发货面积 --></td>
					     <td colspan="2">${boxs[ls.orderBomBase.id]}</td>
					</tr>
				</c:forEach>
            </tbody>  
            <tfoot>
            	<tr>
					 <!-- <th></th> -->
				     <td colspan="10">注：麻烦工地在收货签收后把资料寄回</td>
				</tr>
				<tr>
					 <th colspan="2">跟单员</th>
				     <th colspan="2">收货人</th>
				     <th colspan="2">司机</th>
				     <th colspan="4">工地签收</th>
				</tr>
				<tr>
					 <td colspan="2">&nbsp;</td>
				     <td colspan="2">&nbsp;</td>
				     <td colspan="2">&nbsp;</td>
				     <td colspan="4">&nbsp;</td>
				</tr>
            </tfoot>
		 </table>
	</div>
    <div class="pagination"></div>
</body>
</html>