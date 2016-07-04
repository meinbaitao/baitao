<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>分项目财务报表管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/financereport/btgFinancereport/">分项目财务报表列表</a></li>
		<li class="active"><a href="${ctx}/financereport/btgFinancereport/form?id=${btgFinancereport.id}">分项目财务报表<shiro:hasPermission name="financereport:btgFinancereport:edit">${not empty btgFinancereport.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="financereport:btgFinancereport:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="btgFinancereport" action="${ctx}/financereport/btgFinancereport/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">区域：</label>
			<div class="controls">
				<form:input path="fareaname" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">省份：</label>
			<div class="controls">
				<form:input path="fprovince" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">公司内部合同编号：</label>
			<div class="controls">
				<form:input path="fcontractcompyno" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">楼栋号：</label>
			<div class="controls">
				<form:input path="fbuildings" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">合同号：</label>
			<div class="controls">
				<form:input path="fcontractno" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">项目简称：</label>
			<div class="controls">
				<form:input path="fprojectcode" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">业务板块：</label>
			<div class="controls">
				<form:input path="fbusinessline" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">合同面积：</label>
			<div class="controls">
				<form:input path="fcontractarea" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">合同造价：</label>
			<div class="controls">
				<form:input path="fcontractmoney" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">质保金比例：</label>
			<div class="controls">
				<form:input path="fzbratio" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">结算面积：</label>
			<div class="controls">
				<form:input path="fsettlearea" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">结算金额：</label>
			<div class="controls">
				<form:input path="fsettlemoney" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">竣工日期：</label>
			<div class="controls">
				<input name="ffinishdate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${btgFinancereport.ffinishdate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">结算日期：</label>
			<div class="controls">
				<input name="fsettledate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${btgFinancereport.fsettledate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">以前年度产值：</label>
			<div class="controls">
				<form:input path="fpvaluelastyear" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">本年度产值：</label>
			<div class="controls">
				<form:input path="fpvaluethisyear" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">累计产值：</label>
			<div class="controls">
				<form:input path="fpvaluesum" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">当月产值：</label>
			<div class="controls">
				<form:input path="fpvaluethismonth" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">累计成本：</label>
			<div class="controls">
				<form:input path="fcvaluesum" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">毛利：</label>
			<div class="controls">
				<form:input path="fprofitvalue" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">毛利率：</label>
			<div class="controls">
				<form:input path="fprofitratio" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">应收金额（不含质保金）：</label>
			<div class="controls">
				<form:input path="freceivemoney" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">质保金：</label>
			<div class="controls">
				<form:input path="fprovemoney" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">其中：已到期质保金：</label>
			<div class="controls">
				<form:input path="fdeclinemoney" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">暂扣税金：</label>
			<div class="controls">
				<form:input path="fzktaxmoney" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">扣管理费：</label>
			<div class="controls">
				<form:input path="fkmanagemoney" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">其他扣款：</label>
			<div class="controls">
				<form:input path="fkelsemoney" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">实际应收（含暂扣税金）：</label>
			<div class="controls">
				<form:input path="frreceivemoney" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">累计开发票金额（含当月）：</label>
			<div class="controls">
				<form:input path="ficsummoney" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">当月开发票金额：</label>
			<div class="controls">
				<form:input path="ficmonthmoney" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">累计回款（含当月）：</label>
			<div class="controls">
				<form:input path="fbacksummoney" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">当月回款：</label>
			<div class="controls">
				<form:input path="fbackmonthmoney" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">应收未收：</label>
			<div class="controls">
				<form:input path="frealbackmoney" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">1个月内账龄：</label>
			<div class="controls">
				<form:input path="ftime1money" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">2-3个月账龄：</label>
			<div class="controls">
				<form:input path="ftime2money" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">4－6个月账龄：</label>
			<div class="controls">
				<form:input path="ftime3money" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">7－12月账龄：</label>
			<div class="controls">
				<form:input path="ftime4money" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">1年－2年账龄：</label>
			<div class="controls">
				<form:input path="ftime5money" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">2年以上：</label>
			<div class="controls">
				<form:input path="ftime6money" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">石材加工费 成本预算（控价）：</label>
			<div class="controls">
				<form:input path="fstonejgcostprefee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">石材运费 成本预算（控价）：</label>
			<div class="controls">
				<form:input path="fstonetscostprefee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">钢材费 成本预算（控价）：</label>
			<div class="controls">
				<form:input path="fsteelcostprefee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">其他材料费 成本预算（控价）：</label>
			<div class="controls">
				<form:input path="fematerialcostprefee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">劳务费   成本预算（控价）：</label>
			<div class="controls">
				<form:input path="flabourcostprefee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">机械使用费 成本预算（控价）：</label>
			<div class="controls">
				<form:input path="fmachinecostprefee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">挂靠费     成本预算（控价）：</label>
			<div class="controls">
				<form:input path="faffiliatedcostprefee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">其他项目费  成本预算（控价）：</label>
			<div class="controls">
				<form:input path="felseprojectcostprefee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">综合管理费  成本预算（控价）：</label>
			<div class="controls">
				<form:input path="fsynmanagecostprefee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">风险     成本预算（控价）：</label>
			<div class="controls">
				<form:input path="fdangercostprefee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">税费     成本预算（控价）：</label>
			<div class="controls">
				<form:input path="ftaxcostprefee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">预算控价成本小计：</label>
			<div class="controls">
				<form:input path="fcostsumprefee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">预计利润    成本预算（控价）：</label>
			<div class="controls">
				<form:input path="fprofitcostprefee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">预计利润率   成本预算（控价）：</label>
			<div class="controls">
				<form:input path="fprofitcostpreradio" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">石材费   预计应付：</label>
			<div class="controls">
				<form:input path="fprepaystonefee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">石材运费   预计应付：</label>
			<div class="controls">
				<form:input path="fprepaystonetsfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">钢材费     预计应付：</label>
			<div class="controls">
				<form:input path="fprepaysteelfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">其他材料费   预计应付：</label>
			<div class="controls">
				<form:input path="fprepayematerialfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">劳务费      预计应付：</label>
			<div class="controls">
				<form:input path="fprepaylabourfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">税费        预计应付：</label>
			<div class="controls">
				<form:input path="fprepaytaxfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">预计应付小计：</label>
			<div class="controls">
				<form:input path="fprepaysumfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">石材费     以前年度累计实际发生信息：</label>
			<div class="controls">
				<form:input path="fstonercostlyearfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">石材运费   以前年度累计实际发生信息：</label>
			<div class="controls">
				<form:input path="fstonetsrcostlyearfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">钢材费      以前年度累计实际发生信息：</label>
			<div class="controls">
				<form:input path="fsteelrcostlyearfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">其他材料费   以前年度累计实际发生信息：</label>
			<div class="controls">
				<form:input path="fematerialrcostlyearfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">劳务费   以前年度累计实际发生信息：</label>
			<div class="controls">
				<form:input path="flabourrcostlyearfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">挂靠费   以前年度累计实际发生信息：</label>
			<div class="controls">
				<form:input path="faffiliatedrcostlyearfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">税费      以前年度累计实际发生信息：</label>
			<div class="controls">
				<form:input path="ftaxrcostlyearfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">以前年度累计实际发生小计：</label>
			<div class="controls">
				<form:input path="fsumrcostlyearfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">石材费     本年度实际发生信息：</label>
			<div class="controls">
				<form:input path="fstonercosttyearfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">石材运费   本年度实际发生信息：</label>
			<div class="controls">
				<form:input path="fstonetsrcosttyearfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">钢材费     本年度实际发生信息：</label>
			<div class="controls">
				<form:input path="fsteelrcosttyearfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">其他材料费   本年度实际发生信息：</label>
			<div class="controls">
				<form:input path="fematerialrcosttyearfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">劳务费   本年度实际发生信息：</label>
			<div class="controls">
				<form:input path="flabourrcosttyearfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">挂靠费   本年度实际发生信息：</label>
			<div class="controls">
				<form:input path="faffiliatedrcosttyearfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">税费   本年度实际发生信息：</label>
			<div class="controls">
				<form:input path="ftaxrcosttyearfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">应付小计   本年度实际发生信息：</label>
			<div class="controls">
				<form:input path="fsumrcosttyearfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">石材费     以前年度实际支付信息：</label>
			<div class="controls">
				<form:input path="fstonerpaylyearfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">石材运费    以前年度实际支付信息：</label>
			<div class="controls">
				<form:input path="fstonetsrpaylyearfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">钢材费     以前年度实际支付信息：</label>
			<div class="controls">
				<form:input path="fsteelrpaylyearfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">其他材料费   以前年度实际支付信息：</label>
			<div class="controls">
				<form:input path="fematerialrpaylyearfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">劳务费   以前年度实际支付信息：</label>
			<div class="controls">
				<form:input path="flabourrpaylyearfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">税费   以前年度实际支付信息：</label>
			<div class="controls">
				<form:input path="ftaxrpaylyearfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">实付 小计  以前年度实际支付信息：</label>
			<div class="controls">
				<form:input path="fsumrpaylyearfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">石材费     本年度实际支付信息：</label>
			<div class="controls">
				<form:input path="fstonerpaytyearfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">石材运费    本年度实际支付信息：</label>
			<div class="controls">
				<form:input path="fstonetsrpaytyearfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">钢材费     本年度实际支付信息：</label>
			<div class="controls">
				<form:input path="fsteelrpaytyearfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">其他材料费   本年度实际支付信息：</label>
			<div class="controls">
				<form:input path="fematerialrpaytyearfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">劳务费   本年度实际支付信息：</label>
			<div class="controls">
				<form:input path="flabourrpaytyearfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">税费   本年度实际支付信息：</label>
			<div class="controls">
				<form:input path="ftaxrpaytyearfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">实付 小计  本年度实际支付信息：</label>
			<div class="controls">
				<form:input path="fsumrpaytyearfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">石材费      应付未付信息：</label>
			<div class="controls">
				<form:input path="fstonesubpayfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">石材运费    应付未付信息：</label>
			<div class="controls">
				<form:input path="fstoentssubpayfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">钢材费     应付未付信息：</label>
			<div class="controls">
				<form:input path="fsteelsubpayfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">其他材料费   应付未付信息：</label>
			<div class="controls">
				<form:input path="fematerialsubpayfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">劳务费    应付未付信息：</label>
			<div class="controls">
				<form:input path="flaboursubpayfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">税费     应付未付信息：</label>
			<div class="controls">
				<form:input path="ftaxsubpayfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">应付未付小计：</label>
			<div class="controls">
				<form:input path="fsumsubpayfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">石材费    下月付款计划：</label>
			<div class="controls">
				<form:input path="fstoneplanpayfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">石材运费   下月付款计划：</label>
			<div class="controls">
				<form:input path="fstonetsplanpayfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">钢材费     下月付款计划：</label>
			<div class="controls">
				<form:input path="fsteelplanpayfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">其他材料费   下月付款计划：</label>
			<div class="controls">
				<form:input path="fematerialplanpayfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">劳务费    下月付款计划：</label>
			<div class="controls">
				<form:input path="flabourplanpayfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">税费  下月付款计划：</label>
			<div class="controls">
				<form:input path="ftaxplanpayfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">下月付款计划小计：</label>
			<div class="controls">
				<form:input path="fsumplanpayfee" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="financereport:btgFinancereport:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>