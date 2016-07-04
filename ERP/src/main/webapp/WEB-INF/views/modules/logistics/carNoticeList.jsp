<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>派车通知（石材）</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript" src="${ctxStatic}/jquery/jquery.json.js?tsf=${jsVersion}"></script>
	<script type="text/javascript" src="${ctxStatic}/modules/logistics/scripts/productionLogistics.js?tsf=${jsVersion}"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
	    	return false;
	    }
		//验证生成发货通知单
		function validateSave(){
			var flag = $("input[name='cBox']").is(':checked');//$("cBox").prop("checked");
			var obbFlag = $("input[name='parentBox']").is(':checked');
			if(!obbFlag&&!flag){
				window.alertx("请选择相应的列表数据！");
				loaded();
				return false;
			}
			/* if($("#chargeType").val()==""){
				window.alertx("发货类型不允许为空。");
				return false;
			}
			if($("#vehicleLength").val()==""){
				window.alertx("车辆长度不允许为空。");
				return false;
			}
			if($("#cyf").val()==""){
				window.alertx("承运方不允许为空。");
				return false;
			}
			if($("#sendAddress").val()==""){
				window.alertx("起始基地不允许为空。");
				return false;
			} */
			return true;
		}
	</script>
</head>
<body>
	<div class="list-content">
	     <div class="nav-operate" >
           <form:form id="searchForm" modelAttribute="production" action="" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		       <shiro:hasAnyRoles name="${fns:getWhitelistsList('pctz')}">
			       <ul class="operationg-new" >
			       	 	<li>
		            	   <input attrID="noticeSend" type="button" class="btn btn-primary" value="生成通知发货单">
		            	</li>
			        </ul>
		        </shiro:hasAnyRoles>
		       <div class="clearfix"></div>
	       </form:form>
	      </div>
		<form:form id="saveForm" modelAttribute="logisticsSend" action="${ctx}/logistics/productionLogistics/generateNoticeSend" onsubmit="javascript:return validateSave();" method="post" class="form-horizontal">
			<input id="ids" name="ids" type="hidden" value=""/>
       		<input id="pJson" name="pJson" type="hidden" value=""/>
		<table id="contentTable" class="table table-striped table-bordered table-condensed resize tree_table">
		    <input id="isStatus" name="isStatus" type="hidden" value="${isStatus}"/>
			<thead>
				<!-- 填写基本信息 -->
				<tr>
					<th colspan="2">发货通知单号</th>
					<td colspan="2"><span style="color:#999;">系统自动生成</span></td>
					<th colspan="2">发货类型</th>
					<td colspan="2">
						<form:select id="chargeType" path="chargeType" class="input-mini required" tabindex="-1">
							<option value="">请选择</option>
							<form:options items="${fns:getDictList('send_type')}" itemValue="label" itemLabel="label" htmlEscape="false"/>
					 	</form:select>
					 	<span class="red">*</span>
					</td>
					<th colspan="2">车辆长度</th>
					<td colspan="2">
						<form:select id="vehicleLength" path="vehicleLength" class="input-mini required" tabindex="-1">
							<option value="">请选择</option>
							<form:options items="${fns:getDictList('changduyaoqiu')}" itemValue="label" itemLabel="label" htmlEscape="false"/>
					 	</form:select>
					 	<span class="red">*</span>
					</td>
					<th colspan="2">承运方名称</th>
					<td colspan="2">
						<select id="cyf" name="sccb" class="input-small required">
		             		<option value="">请选择</option>
		                    <c:forEach items="${listSCCB}" var="sccb">
								<option settlementType="${sccb.settlementType }" partyBName="${sccb.partyBName}" value="${sccb.id}">${sccb.partyBName}</option>
							</c:forEach>
						</select>
						<span class="red">*</span>
					</td>
				</tr>
				<tr>
					<th colspan="2">计划发货时间</th>
					<td colspan="2">
						<form:input id="planSendDate" path="planSendDate" name="planSendDate" type="text" class="input-mini Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" value="${planSendDate }" />
					</td>
					<th colspan="2">本次发货总箱数</th>
					<td colspan="2">
						<form:input id="quantity" readOnly="readOnly" path="quantity" class="input-mini" />
					</td>
					<th colspan="2">本次发货总重量(kg)</th>
					<td colspan="2">
						<form:input id="weight" readOnly="readOnly" path="weight" class="input-mini" />
					</td>
					<th colspan="2">备注</th>
					<td colspan="2">
						<form:input id="remark" name="remark" path="remark" htmlEscape="false" class="input-small"/>
					</td>
				</tr>
				<tr>
					<th colspan="2">司机姓名</th>
					<td colspan="2">
						<form:input path="driveName" htmlEscape="false" maxlength="6" class="input-mini "/>
					</td>
					<th colspan="2">司机电话</th>
					<td colspan="2">
						<form:input path="drivePhone" htmlEscape="false" maxlength="11" class="input-mini "/>
					</td>
					<th colspan="2">驾驶证号</th>
					<td colspan="2">
						<form:input path="credentials" htmlEscape="false" maxlength="20" class="input-medium "/>
					</td>
					<th colspan="2">车牌号码</th>
					<td colspan="2">
						<form:input path="vehicleNumber" htmlEscape="false" maxlength="8" class="input-small "/>
					</td>
				</tr>
				<tr>
					<th colspan="2">起始基地</th>
					<td colspan="3">
						<form:select id="sendAddress" path="sendAddress" class="input-small required" tabindex="-1">
							<option value="">请选择</option>
							<c:forEach items="${listSCCD}" var="obj">
								<option value="${obj.startAddr}">${obj.startAddr}</option>
							</c:forEach>
					 	</form:select><span class="red">*</span>
					</td>
					<th colspan="10">&nbsp;</th>
					<!-- <td colspan="2">
						&nbsp;
					</td>
					<th colspan="2">&nbsp;</th>
					<td colspan="2">
						&nbsp;
					</td>
					<th colspan="2">&nbsp;</th>
					<td colspan="2">
						&nbsp;
					</td> -->
				</tr>
				<!-- end 基本信息 -->
				
				<!-- 列表数据 -->
				<tr>
					<th >省份</th>
					<th >项目名称</th>
					<th >楼栋号</th>
					<th >石材品种</th>
					<th >加工厂</th>
					<th >待派车箱数</th>
					<th >要求发货时间</th>
					<th >要求到货时间</th>
					<th >发货地址</th>
					<th >收货地址</th>
					<th >申请派车箱数<span class="red">*</span></th>
					<th colspan="5"></th>
				</tr>
			</thead>
            <tbody id="sendNoticeList">
            	<c:forEach items="${page.list}" var="production">
            		<tr id="parent${production.sub.id}${production.orderBomBase.orderType}${production.supp.id }${production.orderBomBase.id }" subID="${production.sub.id }" 
														orderType="${production.orderBomBase.orderType }" suppID="${production.supp.id }"
														orderBomBaseId="${production.orderBomBase.id }" >
	            		<td >${production.project.province }</td>
						<td >${production.project.name }</td>
						<td >${production.sub.buildingDisplayName }</td>
						<td >${production.orderBomBase.orderTypeVal }</td>
						<td >${production.supp.name }</td>
						<td >
							<a href="javascript:void(0)" attrID="waitCarCount" >
								${production.extraData.waitCarCount }
							</a>
						</td>
						<td >${production.planSendDateLab }</td>
						<td >${production.sub.stoneExpectDate }</td>
						<td >${production.supp.businessAddress }</td>
						<td >${production.project.address }</td>
						<td ><input attrID="cBox" type="checkbox" name="parentBox" value=""></td>
						<td colspan="5"></td>
					</tr>
				</c:forEach>
            </tbody>  
		 </table>
		 </form:form>
	</div>
</body>
</html>