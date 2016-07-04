/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 劳务台账Entity
 * @author yhh
 * @version 2015-12-22
 */
public class LaborcontractAccount extends DataEntity<LaborcontractAccount> {
	
	private static final long serialVersionUID = 1L;
	private String laborcontractId;		// 劳务合同
	private String finishDate;		// 竣工日期
	private String settlementPrice;		// 劳务结算额
	private String finishRatio;		// 累计完工比例
	private String finishPrice;		// 累计完工款
	private String schedulePayShould;		// 应付进度款
	private String qualityPayShould;		// 应付到期质保金
	private String qualityPayNotYet;		// 应付未到期质保金
	private String laborPriceRequired;		// 已申请劳务费
	private String schedulePayRequired;		// 已申请进度款
	private String qualityPayRequired;		// 已申请质保金
	private String hurryCompensationRequired;		// 已申请赶工补偿
	private String settleCompensationRequered;		// 已申请住宿补贴
	private String laborPrice;		// 已付劳务费
	private String schedulePayAlready;		// 已付进度款
	private String qualityPayAlready;		// 已付质保金
	private String hurryCompensationAlready;		// 已付赶工补偿
	private String settleCompensationAlready;		// 已付住宿补贴
	private String schedulePayWait;		// 待付进度款
	private String schedulePayRequiredWait;		// 已申请待付进度款
	private String schedulePayNotRequired;		// 未申请待付进度款
	private String qualityPayWait;		// 待付质保金
	private String qualityPayRequiredWait;		// 待付已申请质保金
	private String qualityPayNotRequired;		// 待付未申请质保金
	private String hurryCompensationWait;		// 待付赶工补偿
	private String settleCompensationWait;		// 待付住宿补偿
	private String sumPriceWait;		// 待付总金额
	
	private String search;		//搜索词
	
	private String contractNo; 		//劳务编号
	private String executionContract;	//施工合同
	private String signDate;		//签约日期
	private String statue;		//合同状态
	private String companyType;		//公司主体
	private String projectCode;			//项目简称
	private String partyBName;			//施工班组
	private String projectName;		//工程名称
	private String houseType;		//户型
	private String building;		//楼栋
	private String executionType;		//施工范围
	private String contractPrice;		//合同总价
	private String exscheduleRatio;		//进度款最高申请支付比例
	private String accountRatio;		//结算款最高申请支付比例
	private String qualityRatioFrist;		//质保金比例1
	private String qualityPayDateFristDuration;
	private String qualityPayDateFrist;		//质保金比例1支付时间
	private String qualityPayFrist;		//质保金1
	private String qualityRatioSecond;		//质保金比例2
	private String qualityPayDateSecondDuration;
	private String qualityPayDateSecond;		//质保金比例2支付时间
	private String qualityPaySecond;		//质保金2
	
	private String valueSchedule;		//项目周报产值进度
	private String endDate;		//甲方合同竣工时间
	public LaborcontractAccount() {
		super();
	}

	public LaborcontractAccount(String id){
		super(id);
	}

	@Length(min=0, max=64, message="劳务合同长度必须介于 0 和 64 之间")
	public String getLaborcontractId() {
		return laborcontractId;
	}

	public void setLaborcontractId(String laborcontractId) {
		this.laborcontractId = laborcontractId;
	}
	
	@Length(min=0, max=64, message="竣工日期长度必须介于 0 和 64 之间")
	public String getFinishDate() {
		return finishDate;
	}

	public void setFinishDate(String finishDate) {
		this.finishDate = finishDate;
	}
	
	public String getSettlementPrice() {
		return settlementPrice;
	}

	public void setSettlementPrice(String settlementPrice) {
		this.settlementPrice = settlementPrice;
	}
	
	public String getFinishRatio() {
		return finishRatio;
	}

	public void setFinishRatio(String finishRatio) {
		this.finishRatio = finishRatio;
	}
	
	public String getFinishPrice() {
		return finishPrice;
	}

	public void setFinishPrice(String finishPrice) {
		this.finishPrice = finishPrice;
	}
	
	public String getSchedulePayShould() {
		return schedulePayShould;
	}

	public void setSchedulePayShould(String schedulePayShould) {
		this.schedulePayShould = schedulePayShould;
	}
	
	public String getQualityPayShould() {
		return qualityPayShould;
	}

	public void setQualityPayShould(String qualityPayShould) {
		this.qualityPayShould = qualityPayShould;
	}
	
	public String getQualityPayNotYet() {
		return qualityPayNotYet;
	}

	public void setQualityPayNotYet(String qualityPayNotYet) {
		this.qualityPayNotYet = qualityPayNotYet;
	}
	
	public String getLaborPriceRequired() {
		return laborPriceRequired;
	}

	public void setLaborPriceRequired(String laborPriceRequired) {
		this.laborPriceRequired = laborPriceRequired;
	}
	
	public String getSchedulePayRequired() {
		return schedulePayRequired;
	}

	public void setSchedulePayRequired(String schedulePayRequired) {
		this.schedulePayRequired = schedulePayRequired;
	}
	
	public String getQualityPayRequired() {
		return qualityPayRequired;
	}

	public void setQualityPayRequired(String qualityPayRequired) {
		this.qualityPayRequired = qualityPayRequired;
	}
	
	public String getHurryCompensationRequired() {
		return hurryCompensationRequired;
	}

	public void setHurryCompensationRequired(String hurryCompensationRequired) {
		this.hurryCompensationRequired = hurryCompensationRequired;
	}
	
	public String getSettleCompensationRequered() {
		return settleCompensationRequered;
	}

	public void setSettleCompensationRequered(String settleCompensationRequered) {
		this.settleCompensationRequered = settleCompensationRequered;
	}
	
	public String getLaborPrice() {
		return laborPrice;
	}

	public void setLaborPrice(String laborPrice) {
		this.laborPrice = laborPrice;
	}
	
	public String getSchedulePayAlready() {
		return schedulePayAlready;
	}

	public void setSchedulePayAlready(String schedulePayAlready) {
		this.schedulePayAlready = schedulePayAlready;
	}
	
	public String getQualityPayAlready() {
		return qualityPayAlready;
	}

	public void setQualityPayAlready(String qualityPayAlready) {
		this.qualityPayAlready = qualityPayAlready;
	}
	
	public String getHurryCompensationAlready() {
		return hurryCompensationAlready;
	}

	public void setHurryCompensationAlready(String hurryCompensationAlready) {
		this.hurryCompensationAlready = hurryCompensationAlready;
	}
	
	public String getSettleCompensationAlready() {
		return settleCompensationAlready;
	}

	public void setSettleCompensationAlready(String settleCompensationAlready) {
		this.settleCompensationAlready = settleCompensationAlready;
	}
	
	public String getSchedulePayWait() {
		return schedulePayWait;
	}

	public void setSchedulePayWait(String schedulePayWait) {
		this.schedulePayWait = schedulePayWait;
	}
	
	public String getSchedulePayRequiredWait() {
		return schedulePayRequiredWait;
	}

	public void setSchedulePayRequiredWait(String schedulePayRequiredWait) {
		this.schedulePayRequiredWait = schedulePayRequiredWait;
	}
	
	public String getSchedulePayNotRequired() {
		return schedulePayNotRequired;
	}

	public void setSchedulePayNotRequired(String schedulePayNotRequired) {
		this.schedulePayNotRequired = schedulePayNotRequired;
	}
	
	public String getQualityPayWait() {
		return qualityPayWait;
	}

	public void setQualityPayWait(String qualityPayWait) {
		this.qualityPayWait = qualityPayWait;
	}
	
	public String getQualityPayRequiredWait() {
		return qualityPayRequiredWait;
	}

	public void setQualityPayRequiredWait(String qualityPayRequiredWait) {
		this.qualityPayRequiredWait = qualityPayRequiredWait;
	}
	
	public String getQualityPayNotRequired() {
		return qualityPayNotRequired;
	}

	public void setQualityPayNotRequired(String qualityPayNotRequired) {
		this.qualityPayNotRequired = qualityPayNotRequired;
	}
	
	public String getHurryCompensationWait() {
		return hurryCompensationWait;
	}

	public void setHurryCompensationWait(String hurryCompensationWait) {
		this.hurryCompensationWait = hurryCompensationWait;
	}
	
	public String getSettleCompensationWait() {
		return settleCompensationWait;
	}

	public void setSettleCompensationWait(String settleCompensationWait) {
		this.settleCompensationWait = settleCompensationWait;
	}
	
	public String getSumPriceWait() {
		return sumPriceWait;
	}

	public void setSumPriceWait(String sumPriceWait) {
		this.sumPriceWait = sumPriceWait;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getContractNo() {
		return contractNo;
	}

	public void setContractNo(String contractNo) {
		this.contractNo = contractNo;
	}

	public String getExecutionContract() {
		return executionContract;
	}

	public void setExecutionContract(String executionContract) {
		this.executionContract = executionContract;
	}

	public String getSignDate() {
		return signDate;
	}

	public void setSignDate(String signDate) {
		this.signDate = signDate;
	}

	public String getStatue() {
		return statue;
	}

	public void setStatue(String statue) {
		this.statue = statue;
	}

	public String getCompanyType() {
		return companyType;
	}

	public void setCompanyType(String companyType) {
		this.companyType = companyType;
	}

	public String getProjectCode() {
		return projectCode;
	}

	public void setProjectCode(String projectCode) {
		this.projectCode = projectCode;
	}

	public String getPartyBName() {
		return partyBName;
	}

	public void setPartyBName(String partyBName) {
		this.partyBName = partyBName;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getHouseType() {
		return houseType;
	}

	public void setHouseType(String houseType) {
		this.houseType = houseType;
	}

	public String getBuilding() {
		return building;
	}

	public void setBuilding(String building) {
		this.building = building;
	}

	public String getExecutionType() {
		return executionType;
	}

	public void setExecutionType(String executionType) {
		this.executionType = executionType;
	}

	public String getContractPrice() {
		return contractPrice;
	}

	public void setContractPrice(String contractPrice) {
		this.contractPrice = contractPrice;
	}

	public String getExscheduleRatio() {
		return exscheduleRatio;
	}

	public void setExscheduleRatio(String exscheduleRatio) {
		this.exscheduleRatio = exscheduleRatio;
	}

	public String getAccountRatio() {
		return accountRatio;
	}

	public void setAccountRatio(String accountRatio) {
		this.accountRatio = accountRatio;
	}

	public String getQualityRatioFrist() {
		return qualityRatioFrist;
	}

	public void setQualityRatioFrist(String qualityRatioFrist) {
		this.qualityRatioFrist = qualityRatioFrist;
	}

	public String getQualityPayDateFrist() {
		return qualityPayDateFrist;
	}

	public void setQualityPayDateFrist(String qualityPayDateFrist) {
		this.qualityPayDateFrist = qualityPayDateFrist;
	}

	public String getQualityRatioSecond() {
		return qualityRatioSecond;
	}

	public void setQualityRatioSecond(String qualityRatioSecond) {
		this.qualityRatioSecond = qualityRatioSecond;
	}

	public String getQualityPayDateSecond() {
		return qualityPayDateSecond;
	}

	public void setQualityPayDateSecond(String qualityPayDateSecond) {
		this.qualityPayDateSecond = qualityPayDateSecond;
	}

	public String getQualityPayFrist() {
		return qualityPayFrist;
	}

	public void setQualityPayFrist(String qualityPayFrist) {
		this.qualityPayFrist = qualityPayFrist;
	}

	public String getQualityPaySecond() {
		return qualityPaySecond;
	}

	public void setQualityPaySecond(String qualityPaySecond) {
		this.qualityPaySecond = qualityPaySecond;
	}

	public String getQualityPayDateFristDuration() {
		return qualityPayDateFristDuration;
	}

	public void setQualityPayDateFristDuration(String qualityPayDateFristDuration) {
		this.qualityPayDateFristDuration = qualityPayDateFristDuration;
	}

	public String getQualityPayDateSecondDuration() {
		return qualityPayDateSecondDuration;
	}

	public void setQualityPayDateSecondDuration(String qualityPayDateSecondDuration) {
		this.qualityPayDateSecondDuration = qualityPayDateSecondDuration;
	}

	public String getValueSchedule() {
		return valueSchedule;
	}

	public void setValueSchedule(String valueSchedule) {
		this.valueSchedule = valueSchedule;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
}