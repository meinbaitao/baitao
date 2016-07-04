<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>劳务合同日志记录</title>
	<meta name="decorator" content="default"/>
	<script>
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		/* $(document).ready(function() {
			$("#contentDiv").height($(window).height()-80);
			$("#contentDiv").width($(window).width());
		}); */
	</script>
</head>

<body>
	<div class="list-content">
		
		<div class="nav-operate">
			<ul>
				<li><a class="btn btn-primary" href="${ctx}/contract/laborcontract/formVerify?id=${laborcontract.id}">返回</a></li>
			</ul>
			<form:form id="searchForm" modelAttribute="laborcontract" action="${ctx}/contract/laborcontract/bill/list" method="post"
				class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden"
					value="${page.pageNo}" />
				<input id="pageSize" name="pageSize" type="hidden"
					value="${page.pageSize}" />
					<input id="id" name="id" type="hidden" value="${laborcontract.id}" />
				<%-- <ul class="search">
					<li>
						<form:input path="keyWord" htmlEscape="false" class="input-medium" placeholder="关键字"/></li>
					<li>
						<button class="search-btn" id="btnSubmit" type="submit">查询</button>
					</li>
				</ul> --%>
			</form:form>
		</div>	
	<div id="contentDiv" style="overflow:auto;">
		<div id="scroll-table">
			<div id="scroll-head">
			</div>
			<div id="tbody-scroll" class="tbody-scroll" >
				<table id="contentTable" class="table table-striped table-bordered table-condensed">
					<thead>
						<tr>
							<th>变更时间</th>
							<th>变更人</th>
							
							<th>甲方</th>
							<th>项目名称</th>
							<th>项目负责人</th>
							<th>项目负责人联系方式</th>
							<th>项目地址</th>
							<th>施工范围</th>
							<th>住宿补贴</th>
							<th>施工班组</th>
							<th>驻地管理人</th>
							<th>驻地管理人电话</th>
							<th>合同编号</th>
							<!-- <th>合同类型</th> -->
							<th>标准合同</th>
							<th>工程名称</th>
							<th>一级类别</th>
							<th>二级类别</th>
							<th>结算方式</th>
							<th>签约日期</th>
							<th>工程开工日期</th>
							<th>工程竣工日期</th>
							<th>工程总工期（天）</th>
							<th>合同总造价(元)</th>
							<th>标准造价(元)</th>
							<th>预算总造价(元)</th>
							<th>总体浮动比例(%)</th>
							<th>合同条款</th>
							<th>进度款最高申请支付比例(%)</th>
							<th>结算款最高申请支付比例(%)</th>
							<th>质保金申请比例1</th>
							<th>质保金申请比例2</th>
							<th>质保金比例1到期条款</th>
							<th>质保金比例2到期条款</th>
							<th>批量浮动比例(%)</th>
							<th>甲乙方权利责任的补充调整</th>
							<th>质量要求的补充调整</th>
							<th>保修要求的补充调整</th>
							<th>工程验收、进度请款及结算方式要求的补充调整</th>
							<th>工程验收请款结算</th>
							<th>备注信息</th>
							
							<th>户型</th>
							<th>楼栋号</th>
							<th>骨架施工面积</th>
							<th>石材施工面积</th>
							<th>其他施工面积</th>
							<th>工程开工日期</th>
							<th>工程竣工日期</th>
							<th>工期</th>
							<th>是否赶工</th>
							<th>劳务清单总价(元)</th>
							<th>标准造价(元)</th>
							<th>预算总造价(元)</th>
							<!-- <th>工程名称</th>
							<th >施工合同</th>
							<th >项目地址</th>
							<th >班组类别</th>
							<th >住宿补贴</th>
							<th >乙方施工班组</th>
							<th >项目</th>
							<th >户型</th>
							<th >楼栋号</th>
							<th >需赶工楼栋号</th>
							<th >开工日期</th>
							<th >竣工日期</th>
							<th >总工期</th>
							<th >乙方驻地项目管理员</th>
							<th >乙方驻地管理员联系方式</th>
							<th >甲方驻地项目经理</th>
							<th >甲方驻地项目经理联系方式</th>
							<th >批量浮动比例</th>
							<th >施工承包范围补充或调整</th>
							<th >甲乙方权利责任的补充调整</th>
							<th >质量要求的补充调整</th>
							<th >保修要求的补充调整</th>
							<th >工程验收请款结算的补充调整</th>
							<th >签约日期</th>
							<th >施工范围</th>
							<th >承接范围</th>
							<th >石材总价</th>
							<th >骨架总价</th>
							<th >合同总价</th>
							<th >标准总价</th>
							<th >预算总价</th>
							<th >总体浮动比例</th>
							<th >合同进度款比例</th>
							<th >进度款发放比例</th>
							<th >结算比例</th>
							<th >保质金比例1</th>
							<th >保质金比例2</th>
							<th >质保金比例1支付时间</th>
							<th >质保金比例2支付时间</th>
							<th >审批状态</th>
							<th >合同状态</th>
							<th >结算方式</th>
							<th >执行部门</th>
							<th >一级类别</th>
							<th >二级类别</th>
							<th >是否标准合同</th>
							<th >标准合同类别</th>
							<th >乙方简称</th>
							<th >合同编号</th>
							<th >发票类型</th>
							<th >税率</th>
							<th >是否包含运费</th>
							<th >支付方式</th>
							<th >付款进度</th>
							<th >质保金金额</th>
							<th >履行保证金金额</th>
							<th >合同类型</th>
							<th >质保金条款</th>
							<th >是否赶工</th>
							<th >签约日期</th>
							<th >工程验收请款结算</th>
							<th >保质金到期时间1</th>
							<th >保质金到期时间2</th>
							<th >竣工日期</th>
							<th >结算日期</th>
							<th >结算金额</th>
							<th >备注信息</th> -->
						</tr>
					</thead>
					<tbody>
					<c:choose>
						<c:when test="${not empty page.list}">
							<c:forEach items="${page.list}" var="laborcontract">
								<tr>
									<td>
										<fmt:formatDate value="${laborcontract.updateDate}" pattern="yyyy-MM-dd HH:mm:ss" />
									</td>
									<td>
										${laborcontract.updateBy.name}
									</td>
									
									<td>${laborcontract.contractJiafang}<!-- 甲方 --></td>
									<td>${laborcontract.project.name}<!-- 项目名称 --></td>
									<td>${laborcontract.projectmanagerAid}<!-- 项目负责人 --></td>
									<td>${laborcontract.projectmanagerAidtel}<!-- 项目负责人联系方式 --></td>
									<td>${laborcontract.address}<!-- 项目地址 --></td>
									<td>${fns:getDictLabel(laborcontract.exeScope, 'executionArea', '')}<!-- 施工范围 --></td>
									<td>${laborcontract.subsidy eq '1'?'是':'否'}<!-- 住宿补贴 --></td>
									<td>${laborcontract.executionName}<!-- 施工班组 --></td>
									<td>${laborcontract.projectleadBid}<!-- 驻地管理人 --></td>
									<td>${laborcontract.projectleadBidtel}<!-- 驻地管理人电话 --></td>
									<td>${laborcontract.contractNo}<!-- 合同编号 --></td>
									<%-- <td>${laborcontract.contractAccountTypeContractType.name}<!-- 合同类型 --></td> --%>
									<td>${laborcontract.isStandardContract eq '3'?'是':'否'}<!-- 标准合同 --></td>
									<td>${laborcontract.proName}<!-- 工程名称 --></td>
									<td>${laborcontract.contractAccountTypeFrist.name}<!-- 一级类别 --></td>
									<td>${laborcontract.contractAccountTypeSecond.name}<!-- 二级类别 --></td>
									<td>${fns:getDictLabel(laborcontract.settlementType, 'settlementTypeVerify', '')}<!-- 结算方式 --></td>
									<td>${laborcontract.agreementDate}<!-- 签约日期 --></td>
									<td>${laborcontract.startdate}<!-- 工程开工日期 --></td>
									<td>${laborcontract.enddate}<!-- 工程竣工日期 --></td>
									<td>${laborcontract.duration}<!-- 工程总工期（天） --></td>
									<td>${laborcontract.contractPrice}<!-- 合同总造价(元) --></td>
									<td>${laborcontract.standardPrice}<!-- 标准造价(元) --></td>
									<td>${laborcontract.budgetPrice}<!-- 预算总造价(元) --></td>
									<td>${laborcontract.allRatio}<!-- 总体浮动比例(%) --></td>
									<td>${laborcontract.conQualityPay.item}<!-- 合同条款 --></td>
									<td>${laborcontract.exscheduleRatio}<!-- 进度款最高申请支付比例(%) --></td>
									<td>${laborcontract.accountRatio}<!-- 结算款最高申请支付比例(%) --></td>
									<td>${laborcontract.qualityRatioFrist}<!-- 质保金申请比例1 --></td>
									<td>${laborcontract.qualityRatioSecond}<!-- 质保金申请比例2 --></td>
									<td>甲方合同竣工验收日期+${laborcontract.qualityPayDateFrist}天<!-- 质保金比例1到期条款 --></td>
									<td>甲方合同竣工验收日期+${laborcontract.qualityPayDateSecond}天<!-- 质保金比例2到期条款 --></td>
									<td>${laborcontract.mfloatratio}<!-- 批量浮动比例(%) --></td>
									<td>${laborcontract.rightrespadjust}<!-- 甲乙方权利责任的补充调整 --></td>
									<td>${laborcontract.qualityreqadjust}<!-- 质量要求的补充调整 --></td>
									<td>${laborcontract.warrantyadjust}<!-- 保修要求的补充调整 --></td>
									<td>${laborcontract.settletermadjust}<!-- 工程验收、进度请款及结算方式要求的补充调整 --></td>
									<td>${laborcontract.settleterm}<!-- 工程验收请款结算 --></td>
									<td>${laborcontract.remarks}<!-- 备注信息 --></td>
									
									<td>${laborcontract.house}<!-- 户型 --></td>
									<td>${laborcontract.extraData.buildings}<!-- 楼栋号 --></td>
									<td>${laborcontract.boneArea}<!-- 骨架施工面积 --></td>
									<td>${laborcontract.stoneArea}<!-- 石材施工面积 --></td>
									<td>${laborcontract.otherArea}<!-- 其他施工面积 --></td>
									<td>${laborcontract.startdate}<!-- 工程开工日期 --></td>
									<td>${laborcontract.enddate}<!-- 工程竣工日期 --></td>
									<td>${laborcontract.duration}<!-- 工期 --></td>
									<td>${laborcontract.isHurry eq '1'?'是':'否'}<!-- 是否赶工 --></td>
									<td>${laborcontract.contractPrice}<!-- 劳务清单总价(元) --></td>
									<td>${laborcontract.standardPrice}<!-- 标准造价(元) --></td>
									<td>${laborcontract.budgetPrice}<!-- 预算总造价(元) --></td>
									
									<%-- <td >${laborcontract.proName}<!-- 工程名称 --></td>
									<td >${laborcontract.laborcontract}<!-- 施工合同 --></td>
									<td >${laborcontract.address}<!-- 项目地址 --></td>
									<td >${laborcontract.exetype}<!-- 班组类别 --></td>
									<td >${laborcontract.subsidy eq 1?'是':'否'}<!-- 住宿补贴 --></td>
									<td >${laborcontract.executionName}<!-- 乙方施工班组 --></td>
									<td >${laborcontract.project.name}<!-- 项目 --></td>
									<td >${laborcontract.house}<!-- 户型 --></td>
									<td >${laborcontract.extraData.buildings}<!-- 楼栋号 --></td>
									<td >${laborcontract.extraData.hurrybuildings}<!-- 需赶工楼栋号 --></td>
									<td >${laborcontract.startdate}<!-- 开工日期 --></td>
									<td >${laborcontract.enddate}<!-- 竣工日期 --></td>
									<td >${laborcontract.duration}<!-- 总工期 --></td>
									<td >${laborcontract.projectleadBid}<!-- 乙方驻地项目管理员 --></td>
									<td >${laborcontract.projectleadBidtel}<!-- 乙方驻地管理员联系方式 --></td>
									<td >${laborcontract.projectmanagerAid}<!-- 甲方驻地项目经理 --></td>
									<td >${laborcontract.projectmanagerAidtel}<!-- 甲方驻地项目经理联系方式 --></td>
									<td >${laborcontract.mfloatratio}<!-- 批量浮动比例 --></td>
									<td >${laborcontract.contractscopeadjust}<!-- 施工承包范围补充或调整 --></td>
									<td >${laborcontract.rightrespadjust}<!-- 甲乙方权利责任的补充调整 --></td>
									<td >${laborcontract.qualityreqadjust}<!-- 质量要求的补充调整 --></td>
									<td >${laborcontract.warrantyadjust}<!-- 保修要求的补充调整 --></td>
									<td >${laborcontract.settletermadjust}<!-- 工程验收请款结算的补充调整 --></td>
									<td >${laborcontract.signDate}<!-- 签约日期 --></td>
									<td >${laborcontract.exeScope}<!-- 施工范围 --></td>
									<td >${laborcontract.acceptScope}<!-- 承接范围 --></td>
									<td >${laborcontract.stonePrice}<!-- 石材总价 --></td>
									<td >${laborcontract.bonePrice}<!-- 骨架总价 --></td>
									<td >${laborcontract.contractPrice}<!-- 合同总价 --></td>
									<td >${laborcontract.standardPrice}<!-- 标准总价 --></td>
									<td >${laborcontract.budgetPrice}<!-- 预算总价 --></td>
									<td >${laborcontract.allRatio}<!-- 总体浮动比例 --></td>
									<td >${laborcontract.scheduleRatio}<!-- 合同进度款比例 --></td>
									<td >${laborcontract.exscheduleRatio}<!-- 进度款发放比例 --></td>
									<td >${laborcontract.accountRatio}<!-- 结算比例 --></td>
									<td >${laborcontract.qualityRatioFrist}<!-- 保质金比例1 --></td>
									<td >${laborcontract.qualityRatioSecond}<!-- 保质金比例2 --></td>
									<td >${laborcontract.qualityPayDateFrist}<!-- 质保金比例1支付时间 --></td>
									<td >${laborcontract.qualityPayDateSecond}<!-- 质保金比例2支付时间 --></td>
									<td >${laborcontract.checkStatus}<!-- 审批状态 --></td>
									<td >${laborcontract.conStatus}<!-- 合同状态 --></td>
									<td >${laborcontract.settlementType}<!-- 结算方式 --></td>
									<td >${laborcontract.department}<!-- 执行部门 --></td>
									<td >${laborcontract.fristType}<!-- 一级类别 --></td>
									<td >${laborcontract.secondType}<!-- 二级类别 --></td>
									<td >${laborcontract.isStandardContract eq '1'?'是':'否'}<!-- 是否标准合同 --></td>
									<td >${laborcontract.standardType}<!-- 标准合同类别 --></td>
									<td >${laborcontract.partyBCode}<!-- 乙方简称 --></td>
									<td >${laborcontract.contractNo}<!-- 合同编号 --></td>
									<td >${laborcontract.invoiceType}<!-- 发票类型 --></td>
									<td >${laborcontract.taxRatio}<!-- 税率 --></td>
									<td >${laborcontract.isIncludeCarriage eq '1'?'是':'否'}<!-- 是否包含运费 --></td>
									<td >${laborcontract.paymentType}<!-- 支付方式 --></td>
									<td >${laborcontract.paymentProgress}<!-- 付款进度 --></td>
									<td >${laborcontract.qualityGuaranteePrice}<!-- 质保金金额 --></td>
									<td >${laborcontract.executeGuaranteePrice}<!-- 履行保证金金额 --></td>
									<td >${laborcontract.contractType}<!-- 合同类型 --></td>
									<!-- <td ><span class='red'>质保金条款</span></td> -->
									<td >${laborcontract.isHurry eq '1'?'是':'否'}<!-- 是否赶工 --></td>
									<td >${laborcontract.agreementDate}<!-- 签约日期 --></td>
									<td >${laborcontract.settleterm}<!-- 工程验收请款结算 --></td>
									<td >${laborcontract.qualityExpireDateFrist}<!-- 保质金到期时间1 --></td>
									<td >${laborcontract.qualityExpireDateSecond}<!-- 保质金到期时间2 --></td>
									<td >${laborcontract.completeDate}<!-- 竣工日期 --></td>
									<td >${laborcontract.settleDate}<!-- 结算日期 --></td>
									<td >${laborcontract.settleSum}<!-- 结算金额 --></td>
									<td>${laborcontract.remarks}</td> --%>
								</tr>
							</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td style="padding-left:100px;" colspan="70" class="red">暂无变更记录</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	</div>
	<div class="pagination">${page}</div>
</body>
</html>