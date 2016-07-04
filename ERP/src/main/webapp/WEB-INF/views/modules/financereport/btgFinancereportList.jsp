<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>分项目财务报表管理</title>
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
	<form:form id="searchForm" modelAttribute="btgFinancereport" action="${ctx}/financereport/btgFinancereport/list" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="search">
					<li>
						<form:input path="fcontractno" htmlEscape="false" class="input-medium" placeholder="关键字"/></li>
					<li>
						<button class="search-btn" id="btnSubmit" type="submit">查询</button></li>
		</ul>
		<div class="clearfix"></div>
	</form:form>
	 <div class="clear"></div>
	 </div>
	<sys:message content="${message}"/>
   <div class="table_scroll">
	<table id="contentTable" class="table table-striped table-bordered table-condensed table_scroll">
		<thead>
				<tr>
				    <!-- <th colspan="2" rowspan="2" style="text-align: center;">时间信息</th> -->
					<th colspan="13" rowspan="2" style="text-align: center;">合同信息</th>
					<th colspan="4" rowspan="2" style="text-align: center;">产值信息</th>
					<th colspan="3" rowspan="2" style="text-align: center;">利润信息</th>
					<th colspan="18" rowspan="1" style="text-align: center;">财务信息</th>
					<th colspan="14" rowspan="2" style="text-align: center;">成本预算（控价）</th>
					<th colspan="7" rowspan="2" style="text-align: center;">预计应付</th>
					<th colspan="8" rowspan="2" style="text-align: center;">以前年度累计实际发生信息</th>
					<th colspan="8" rowspan="2" style="text-align: center;">本年度实际发生信息</th>
					<th colspan="7" rowspan="2" style="text-align: center;">以前年度支付信息</th>	
					<th colspan="7" rowspan="2" style="text-align: center;">本年度实际支付信息</th>
					<th colspan="7" rowspan="2" style="text-align: center;">应付未付信息</th>
					<th colspan="7" rowspan="2" style="text-align: center;">下月付款计划</th>						
					<!-- <th rowspan="2">户型</th>
					<th rowspan="2">栋号</th>
					<th rowspan="2">石材类别</th>
					<th rowspan="2">下料单类别</th>
					<th rowspan="2">结算项</th>
					<th colspan="3">胚料规格</th>
					<th rowspan="2">数量</th>
					<th rowspan="2">面积</th>
					<th rowspan="2">单位</th>
					<th rowspan="2">单价</th>
					<th rowspan="2">金额</th> -->
<!-- 					<th colspan="5" style="text-align: center;"> 结算明细</th> -->
				</tr>
				<tr>
				  <th colspan="7" rowspan="1" style="text-align: center;">应收信息</th>
				  <th colspan="2" rowspan="1" style="text-align: center;">开票信息</th>
				  <th colspan="2" rowspan="1" style="text-align: center;">回款信息</th>
				   <th colspan="1" rowspan="1" style="text-align: center;">应收未收</th>
				    <th colspan="6" rowspan="1" style="text-align: center;">账龄</th>
				</tr>
				
				<tr>
				     <!--     合同信息 -->
				<!--     <td>年份</td>
					<th>月份</td> -->
					<th>区域</th>
					<th>省份</th>
					<th>公司内部合同编号</th>
					<!-- <th >栋号</th> -->
					<th>合同编号</th>
					<th>项目简称</th>
					<th>业务板块</th>
					<th>合同面积</th>
					<th>合同造价</th>
					<th>质保金比例</th>
					<th>结算面积</th>
					<th>结算金额</th>
					<th>竣工日期</th>
					<th>结算日期</th>
					<!-- 产值信息 -->
					<th>以前年度产值累计</th>
					<th>本年产值(含当月)</th>
					<th>累计产值</th>
					<th>当月产值</th>
					<!-- 利润信息 -->
					<th>累计成本小计</th>
					<th>毛利</th>				
					<th>毛利率</th>
					<!-- 应收信息 -->
					<th>应收金额(不含质保金)</th>
					<th>质保金</th>
					<th>已到期质保金</th>
					<th>暂扣税金</th>
					<th>扣管理费</th>
					<th>其他扣款</th>
					<th>实际应收(含暂扣税金)</th>
					<!-- 开票信息 -->
					<th>累计开发票金额(含当月)</th>
					<th>当月开发票金额</th>
					<!-- 回款信息 -->
					<th>累计回款(含当月)</th>
					<th>当月回款</th>
					<th>应收未收</th>
					<!-- <th>当月回款</th> -->
					<!-- 账龄 -->
					<th>1个月内</th>
					<th>2-3个月</th>
					<th>4－6个月</th>
					<th>7－12月</th>
					<th>1年－2年</th>
					<th>2年以上</th>
					<!-- 成本预算控价 -->
					<th>石材费</th>
					<th>石材运费</th>
					<th>钢材费</th>
					<th>其他材料费</th>
					<th>劳务费</th>
					<th>机械使用费</th>
					<th>挂靠费</th>
					<th>其他项目费</th>
					<th>综合管理费</th>
					<th>风险</th>
					<th>税费</th>
					<th>预算控价成本小计</th>
					<th>预计 利润</th>
					<th>预计 利润率</th>
					<!-- 成本预算控价 -->
					<th>石材费</th>
					<th>石材运费</th>
					<th>钢材费</th>
					<th>其他材料费</th>
					<th>劳务费</th>					
					<th>税费</th>
					<th>预计应付小计</th>
					<!-- 以前年度累计实际发生信息 -->
					<th>石材费</th>
					<th>石材运费</th>
					<th>钢材费</th>
					<th>其他材料费</th>
					<th>劳务费</th>
					<th>挂靠费</th>				
					<th>税费</th>
					<th>以前年度累计实际发生小计</th>
					<!-- 本年度实际发生信息 -->
					<th>石材费</th>
					<th>石材运费</th>
					<th>钢材费</th>
					<th>其他材料费</th>
					<th>劳务费</th>
					<th>挂靠费</th>				
					<th>税费</th>
					<th>应付小计</th>
					<!-- 以前年度支付信息 -->
					<th>石材费</th>
					<th>石材运费</th>
					<th>钢材费</th>
					<th>其他材料费</th>
					<th>劳务费</th>		
					<th>税费</th>
					<th>实付小计</th>
					<!-- 本年度支付信息 -->
					<th>石材费</th>
					<th>石材运费</th>
					<th>钢材费</th>
					<th>其他材料费</th>
					<th>劳务费</th>		
					<th>税费</th>
					<th>实付小计</th>
					<!-- 应付未付信息-->
					<th>石材费</th>
					<th>石材运费</th>
					<th>钢材费</th>
					<th>其他材料费</th>
					<th>劳务费</th>		
					<th>税费</th>
					<th>应付未付小计</th>
					<!-- 下月付款计划-->
					<th>石材费</th>
					<th>石材运费</th>
					<th>钢材费</th>
					<th>其他材料费</th>
					<th>劳务费</th>		
					<th>税费</th>
					<th>下月付款计划小计</th>
				</tr>
			</thead>
		<tbody>
		<c:forEach items="${page.list}" var="btgFinancereport">

	
			<tr>
				<%-- <td>
					<a href="${ctx}/contract/conYearContract/form?id=${conYearContract.id}" >${conYearContract.contractNo}</a>	
				</td> --%>
				<%-- <td>
			    <!--年份 -->
					${btgFinancereport.fyear}                                               
				</td>
				<td>
				<!-- 月份 -->
					${btgFinancereport.fmonth}
				</td> --%>
				<td>
			
				<!-- 区域 -->
					${btgFinancereport.fareaname}
				</td>
				<td>
				<!-- 省份 -->
					${btgFinancereport.fprovince}
				</td>
				
				<td>
				 <!-- 公司内部合同编号 -->
					${btgFinancereport.fcontractcompyno}
				</td>
				<%-- <td>
				<!-- 楼栋号 -->
					${btgFinancereport.fbuildings}
				</td> --%>
				<td>
				<!-- 合同号-->
					${btgFinancereport.fcontractno}
				</td>
				<td>
				<!-- 项目简称-->
					${btgFinancereport.fprojectcode}
				</td>
				<td>
				<!--业务板块-->
					${btgFinancereport.fbusinessline}
				</td>
				<td>
				<!-- 合同面积-->
					${btgFinancereport.fcontractarea}
				</td>
				<td>
				<!-- 合同造价-->
					${btgFinancereport.fcontractmoney}
				</td>
				<td>
			    <!-- 质保金比例-->
					${btgFinancereport.fzbratio}
				</td>
				<td>
			    <!-- 结算面积-->
					${btgFinancereport.fsettlearea}
				</td>
				<td>
			    <!--  结算金额-->
					${btgFinancereport.fsettlemoney}
				</td>
				<td>
			    <!--  竣工日期-->
					${btgFinancereport.ffinishdate}
				</td>
				<td>
			    <!--  结算日期-->
					${btgFinancereport.fsettledate}
				</td>
				<td>
			    <!--  以前年度产值-->
					${btgFinancereport.fpvaluelastyear}
				</td>
				<td>
			    <!--  本年度产值-->
					${btgFinancereport.fpvaluethisyear}
				</td>
				<td>
			    <!-- 累计产值-->
					${btgFinancereport.fpvaluesum}
				</td>
				<td>
			    <!-- 当月产值-->
					${btgFinancereport.fpvaluethismonth}
				</td>
				<td>
			    <!-- 累计成本-->
					${btgFinancereport.fcvaluesum}
				</td>
				<td>
			    <!-- 毛利-->
					${btgFinancereport.fprofitvalue}
				</td>
				<td>
			    <!-- 毛利率-->
					${btgFinancereport.fprofitratio}
				</td>
				<td>
			    <!-- 应收金额（不含质保金）-->
					${btgFinancereport.freceivemoney}
				</td>
				<td>
			    <!-- 质保金-->
					${btgFinancereport.fprovemoney}
				</td>
				<td>
			    <!-- 已到期质保金-->
					${btgFinancereport.fdeclinemoney}
				</td>
				<td>
			    <!-- 暂扣税金-->
					${btgFinancereport.fzktaxmoney}
				</td>
				<td>
			    <!--  扣管理费-->
					${btgFinancereport.fkmanagemoney}
				</td>
				<td>
			    <!--  其他扣款-->
					${btgFinancereport.fkelsemoney}
				</td>
				<td>
			    <!--  实际应收（含暂扣税金）-->
					${btgFinancereport.frreceivemoney}
				</td>
				<td>
			    <!--   累计开发票金额（含当月））-->
					${btgFinancereport.ficsummoney}
				</td>
				<td>
			    <!--   当月开发票金额-->
					${btgFinancereport.ficmonthmoney}
				</td>
				<td>
			    <!--  累计回款（含当月）-->
					${btgFinancereport.fbacksummoney}
				</td>
				 <td>
			    <!--  当月回款-->
					${btgFinancereport.fbackmonthmoney}
				</td>
				<td>
			    <!--  应收未收）-->
					${btgFinancereport.frealbackmoney}
				</td>
				<td>
			    <!-- 1个月内账龄-->
					${btgFinancereport.ftime1money}
				</td>
				<td>
			    <!-- 2-3个月账龄-->
					${btgFinancereport.ftime2money}
				</td>
				<td>
			    <!-- 4－6个月账龄-->
					${btgFinancereport.ftime3money}
				</td>
				<td>
			    <!--  7－12月账龄-->
					${btgFinancereport.ftime4money}
				</td>
				<td>
			    <!-- 1年－2年账龄-->
					${btgFinancereport.ftime5money}
				</td>
				<td>
			    <!--  2年以上-->
					${btgFinancereport.ftime6money}
				</td>
				<td>
			    <!-- 石材加工费 成本预算（控价）-->
					${btgFinancereport.fstonejgcostprefee}
				</td>
				<td>
			    <!-- 石材运费 成本预算（控价）-->
					${btgFinancereport.fstonetscostprefee}
				</td>
				<td>
			    <!--  钢材费 成本预算（控价）-->
					${btgFinancereport.fsteelcostprefee}
				</td>
				<td>
			    <!--  其他材料费 成本预算（控价）-->
					${btgFinancereport.fematerialcostprefee}
				</td>
				<td>
			    <!--  劳务费   成本预算（控价）-->
					${btgFinancereport.flabourcostprefee}
				</td>
				<td>
			    <!--   机械使用费 成本预算（控价）-->
					${btgFinancereport.fmachinecostprefee}
				</td>
				<td>
			    <!--  挂靠费     成本预算（控价））-->
					${btgFinancereport.faffiliatedcostprefee}
				</td>
				<td>
			    <!--  其他项目费  成本预算（控价））-->
					${btgFinancereport.felseprojectcostprefee}
				</td>
				<td>
			    <!-- 综合管理费  成本预算（控价）-->
					${btgFinancereport.fsynmanagecostprefee}
				</td>
				<td>
			    <!-- 风险     成本预算（控价）-->
					${btgFinancereport.fdangercostprefee}
				</td>
				<td>
			    <!--  税费     成本预算（控价））-->
					${btgFinancereport.ftaxcostprefee}
				</td>
				<td>
			    <!-- 预算控价成本小计-->
					${btgFinancereport.fcostsumprefee}
				</td>
				<td>
			    <!-- 预计利润    成本预算（控价）-->
					${btgFinancereport.fprofitcostprefee}
				</td>
				<td>
			    <!-- 预计利润率   成本预算（控价）-->
					${btgFinancereport.fprofitcostpreradio}
				</td>
				<td>
			    <!-- 石材费   预计应付-->
					${btgFinancereport.fprepaystonefee}
				</td>
				<td>
			    <!--石材运费   预计应付-->
					${btgFinancereport.fprepaystonetsfee}
				</td>
				<td>
			    <!--钢材费     预计应付-->
					${btgFinancereport.fprepaysteelfee}
				</td>
				<td>
			    <!--其他材料费   预计应付-->
					${btgFinancereport.fprepayematerialfee}
				</td>
				<td>
			    <!--劳务费      预计应付-->
					${btgFinancereport.fprepaylabourfee}
				</td>
				<td>
			    <!--税费        预计应付-->
					${btgFinancereport.fprepaytaxfee}
				</td>
				<td>
			    <!--预计应付小计-->
					${btgFinancereport.fprepaysumfee}
				</td>
				<td>
			    <!--石材费     以前年度累计实际发生信息-->
					${btgFinancereport.fstonercostlyearfee}
				</td>
				<td>
			    <!--石材运费   以前年度累计实际发生信息-->
					${btgFinancereport.fstonetsrcostlyearfee}
				</td>
				<td>
			    <!-- 钢材费      以前年度累计实际发生信息-->
					${btgFinancereport.fsteelrcostlyearfee}
				</td>
				<td>
			    <!-- 其他材料费   以前年度累计实际发生信息-->
					${btgFinancereport.fematerialrcostlyearfee}
				</td>
				<td>
			    <!-- 劳务费   以前年度累计实际发生信息-->
					${btgFinancereport.flabourrcostlyearfee}
				</td>
				<td>
			    <!-- 挂靠费   以前年度累计实际发生信息-->
					${btgFinancereport.faffiliatedrcostlyearfee}
				</td>
				<td>
			    <!-- 税费      以前年度累计实际发生信息-->
					${btgFinancereport.ftaxrcostlyearfee}
				</td>
				<td>
			    <!-- 以前年度累计实际发生小计-->
					${btgFinancereport.fsumrcostlyearfee}
				</td>
				<td>
			    <!-- 石材费     本年度实际发生信息-->
					${btgFinancereport.fstonercosttyearfee}
				</td>
				<td>
			    <!-- 石材运费   本年度实际发生信息-->
					${btgFinancereport.fstonetsrcosttyearfee}
				</td>
				<td>
			    <!-- 钢材费     本年度实际发生信息-->
					${btgFinancereport.fsteelrcosttyearfee}
				</td>
				<td>
			    <!-- 其他材料费   本年度实际发生信息-->
					${btgFinancereport.fematerialrcosttyearfee}
				</td>
				<td>
			    <!-- 劳务费   本年度实际发生信息-->
					${btgFinancereport.flabourrcosttyearfee}
				</td>
				<td>
			    <!-- 挂靠费   本年度实际发生信息-->
					${btgFinancereport.faffiliatedrcosttyearfee}
				</td>
				<td>
			    <!-- 税费   本年度实际发生信息-->
					${btgFinancereport.ftaxrcosttyearfee}
				</td>
				<td>
			    <!--  应付小计   本年度实际发生信息-->
					${btgFinancereport.fsumrcosttyearfee}
				</td>
				<td>
			    <!--  石材费     以前年度实际支付信息-->
					${btgFinancereport.fstonerpaylyearfee}
				</td>
				<td>
			    <!--  石材运费    以前年度实际支付信息-->
					${btgFinancereport.fstonetsrpaylyearfee}
				</td>
				<td>
			    <!--  钢材费     以前年度实际支付信息-->
					${btgFinancereport.fsteelrpaylyearfee}
				</td>
				<td>
			    <!--  其他材料费   以前年度实际支付信息-->
					${btgFinancereport.fematerialrpaylyearfee}
				</td>
				<td>
			    <!--  劳务费   以前年度实际支付信息-->
					${btgFinancereport.flabourrpaylyearfee}
				</td>
				<td>
			    <!--   税费   以前年度实际支付信息-->
					${btgFinancereport.ftaxrpaylyearfee}
				</td>
				<td>
			    <!--   实付 小计  以前年度实际支付信息-->
					${btgFinancereport.fsumrpaylyearfee}
				</td>
				<td>
			    <!--   石材费     本年度实际支付信息-->
					${btgFinancereport.fstonerpaytyearfee}
				</td>
				<td>
			    <!--  石材运费    本年度实际支付信息-->
					${btgFinancereport.fstonetsrpaytyearfee}
				</td>
				<td>
			    <!--   钢材费     本年度实际支付信息-->
					${btgFinancereport.fsteelrpaytyearfee}
				</td>
				<td>
			    <!--   其他材料费   本年度实际支付信息-->
					${btgFinancereport.fematerialrpaytyearfee}
				</td>
				<td>
			    <!--   劳务费   本年度实际支付信息-->
					${btgFinancereport.flabourrpaytyearfee}
				</td>
				<td>
			    <!--   税费   本年度实际支付信息-->
					${btgFinancereport.ftaxrpaytyearfee}
				</td>
				<td>
			    <!--  实付 小计  本年度实际支付信息-->
					${btgFinancereport.fsumrpaytyearfee}
				</td>
				<td>
			    <!--  石材费      应付未付信息-->
					${btgFinancereport.fstonesubpayfee}
				</td>
				<td>
			    <!--  石材运费    应付未付信息-->
					${btgFinancereport.fstoentssubpayfee}
				</td>
				<td>
			    <!--  钢材费     应付未付信息-->
					${btgFinancereport.fsteelsubpayfee}
				</td>
				<td>
			    <!--  其他材料费   应付未付信息-->
					${btgFinancereport.fematerialsubpayfee}
				</td>
				<td>
			    <!--  劳务费    应付未付信息-->
					${btgFinancereport.flaboursubpayfee}
				</td>
				<td>
			    <!--  税费     应付未付信息-->
					${btgFinancereport.ftaxsubpayfee}
				</td>
				<td>
			    <!--  应付未付小计-->
					${btgFinancereport.fsumsubpayfee}
				</td>
				<td>
			    <!--  石材费    下月付款计划-->
					${btgFinancereport.fstoneplanpayfee}
				</td>
				<td>
			    <!--  石材运费   下月付款计划-->
					${btgFinancereport.fstonetsplanpayfee}
				</td>
				<td>
			    <!--  钢材费     下月付款计划-->
					${btgFinancereport.fsteelplanpayfee}
				</td>
				<td>
			    <!--  其他材料费   下月付款计划-->
					${btgFinancereport.fematerialplanpayfee}
				</td>
				<td>
			    <!--  劳务费    下月付款计划-->
					${btgFinancereport.flabourplanpayfee}
				</td>
				<td>
			    <!--  税费  下月付款计划-->
					${btgFinancereport.ftaxplanpayfee}
				</td>
				<td>
			    <!--  下月付款计划小计-->
					${btgFinancereport.fsumplanpayfee}
				</td>
			</tr>
		</c:forEach>
		</tbody
	</table>
	</div>
	</div>
	<div class="pagination">${page}</div>
</body>
</html>