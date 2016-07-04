<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>劳务台账管理</title>
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
	</script>
</head>
<body>
	<div class="list-content">
		<div class="nav-operate">
			<form:form id="searchForm" modelAttribute="laborcontractAccount"
				action="${ctx}/contract/laborcontractAccount/list" method="post"
				class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden"
					value="${page.pageNo}" />
				<input id="pageSize" name="pageSize" type="hidden"
					value="${page.pageSize}" />
				<ul class="search">
					<li>
						<form:input path="search" htmlEscape="false" class="input-medium" placeholder="关键字"/></li>
					<li>
						<button class="search-btn" id="btnSubmit" type="submit">查询</button></li>
				</ul>
				<div class="clearfix"></div>
			</form:form>
			
			<div class="clear"></div>
			
		</div>
		<div class="table_scroll" style="margin-bottom:200px;">
			<sys:message content="${message}"/>
			<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th colspan="20" style="text-align: center">合同信息</th>
				<th colspan="4" style="text-align: center">完工信息</th>
				<th colspan="3" style="text-align: center">应付信息</th>
				<th colspan="10" style="text-align: center">付款信息</th>
				<th colspan="10" style="text-align: center">应付未付信息</th>
			</tr>
			
			<tr>
				<th rowspan="2">劳务合同编号</th>
				<th rowspan="2">施工合同号</th>
				<th rowspan="2">签约日期</th>
				<th rowspan="2">合同状态</th>
				<th rowspan="2">公司主体</th>
				<th rowspan="2">项目简称</th>
				<th rowspan="2">乙方施工班组</th>
				<th rowspan="2">工程名称</th>
				<th rowspan="2">户型</th>
				<th rowspan="2">楼栋号</th>
				<th rowspan="2">施工类别</th>
				<th rowspan="2">合同总造价</th>
				<th rowspan="2">进度款最高申请支付比例(%)</th>
				<th rowspan="2">结算款最高申请支付比例(%)</th>
				<th colspan="6" style="text-align: center">质保金条款</th>
				
				<th rowspan="2">竣工日期</th>
				<th rowspan="2">劳务结算额</th>
				<th rowspan="2">累计完工比例(%)</th>
				<th rowspan="2">累计完工款</th>
				<th rowspan="2">应付进度款</th>
				<th rowspan="2">应付到期质保金</th>
				<th rowspan="2">应付未到期质保金</th>
				
				<th colspan="3" style="text-align: center">累计已申请劳务费</th>
				<th colspan="3" style="text-align: center">累计已支付劳务费</th>
				<th colspan="2" style="text-align: center">赶工补偿</th>
				<th colspan="2" style="text-align: center">住宿补贴</th>
				
				<th colspan="3" style="text-align: center">应付未付进度款</th>
				<th colspan="3" style="text-align: center">应付未付已到期质保金</th>
				
				<th rowspan="2">未到期质保金</th>
				<th rowspan="2">待付赶工补偿</th>
				<th rowspan="2">待付住宿补偿</th>
				<th rowspan="2">待付总金额</th>
			</tr>
			<tr>
				<th>质保金申请比例1(%)</th>
				<th>质保金到期日期1</th>
				<th>应付质保金1</th>
				<th>质保金申请比例2(%)</th>
				<th>质保金到期日期2</th>
				<th>应付质保金2</th>
				
				<th>已申请劳务费</th>
				<th>已申请进度款</th>
				<th>已申请质保金</th>
				<th>已付劳务费</th>
				<th>已付进度款</th>
				<th>已付质保金</th>
				<th>已申请赶工补偿</th>
				<th>已付赶工补偿</th>
				<th>已申请住宿补贴</th>
				<th>已付住宿补贴</th>
				
				<th>待付进度款</th>
				<th>已申请待付进度款</th>
				<th>未申请待付进度款</th>
				<th>待付质保金</th>
				<th>待付已申请质保金</th>
				<th>待付未申请质保金</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="laborcontractAccount">
			<tr>
				<td>${laborcontractAccount.contractNo}</td>
				<td>${laborcontractAccount.executionContract}</td>
				<td>${laborcontractAccount.signDate}</td>
				<td>${laborcontractAccount.statue}</td>
				<td>${laborcontractAccount.companyType}</td>	
				<td>${laborcontractAccount.projectCode}</td>
				<td>${laborcontractAccount.partyBName}</td>
				<td>${laborcontractAccount.projectName}</td>
				<td>${laborcontractAccount.houseType}</td>	
				<td>${laborcontractAccount.building}</td>
				<td>${laborcontractAccount.executionType}</td>
				<td>${laborcontractAccount.contractPrice}</td>
				<td>${laborcontractAccount.exscheduleRatio}</td>
				<td>${laborcontractAccount.accountRatio}</td>
				<td>${laborcontractAccount.qualityRatioFrist}</td>
				<td>${laborcontractAccount.qualityPayDateFrist}</td>
				<td>${laborcontractAccount.qualityPayFrist}</td>
				<td>${laborcontractAccount.qualityRatioSecond}</td>
				<td>${laborcontractAccount.qualityPayDateSecond}</td>
				<td>${laborcontractAccount.qualityPaySecond}</td>
				<td>${laborcontractAccount.finishDate}</td>
				<td>${laborcontractAccount.settlementPrice}</td>
				<td>${laborcontractAccount.finishRatio}</td>
				<td>${laborcontractAccount.finishPrice}</td>
				<td>${laborcontractAccount.schedulePayShould}</td>
				<td>${laborcontractAccount.qualityPayShould}</td>
				<td>${laborcontractAccount.qualityPayNotYet}</td>
				
				<td>
					${laborcontractAccount.laborPriceRequired}
				</td>
				<td>
					${laborcontractAccount.schedulePayRequired}
				</td>
				<td>
					${laborcontractAccount.qualityPayRequired}
				</td>
				<td>
					${laborcontractAccount.laborPrice}
				</td>
				<td>
					${laborcontractAccount.schedulePayAlready}
				</td>
				<td>
					${laborcontractAccount.qualityPayAlready}
				</td>
				<td>
					${laborcontractAccount.hurryCompensationRequired}
				</td>
				<td>
					${laborcontractAccount.hurryCompensationAlready}
				</td>
				<td>
					${laborcontractAccount.settleCompensationAlready}
				</td>
				<td>
					${laborcontractAccount.settleCompensationRequered}
				</td>
				<td>
					${laborcontractAccount.schedulePayWait}
				</td>
				<td>
					${laborcontractAccount.schedulePayRequiredWait}
				</td>
				<td>
					${laborcontractAccount.schedulePayNotRequired}
				</td>
				<td>
					${laborcontractAccount.qualityPayWait}
				</td>
				<td>
					${laborcontractAccount.qualityPayRequiredWait}
				</td>
				<td>
					${laborcontractAccount.qualityPayNotRequired}
				</td>
				<td>
					${laborcontractAccount.qualityPayNotYet}
				</td>
				<td>
					${laborcontractAccount.hurryCompensationWait}
				</td>
				<td>
					${laborcontractAccount.settleCompensationWait}
				</td>
				<td>
					${laborcontractAccount.sumPriceWait}
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
		</div>
	</div>
	
	<div class="pagination">${page}</div>
</body>
</html>