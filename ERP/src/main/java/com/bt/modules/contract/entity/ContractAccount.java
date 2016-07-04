/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 合同台账Entity
 * @author yhh
 * @version 2015-11-02
 */
public class ContractAccount extends DataEntity<ContractAccount> {
	
	private static final long serialVersionUID = 1L;
	private String contractType;		// 合同类别
	private String fristType;		// 一级类别
	private String secondType;		// 二级类别
	private String partyBName;		// 乙方名称
	private String partyBCode;		// 乙方简称
	private String startTime;		// 合同开始时间
	private String endTime;		// 合同结束时间
	private String workflowstatus;		// 流程状态
	private String contractNo;		// 合同编号
	private String contractPrice;		//合同总价
	private String invoiceType;		// 发票类型
	private String taxRate;		// 税率
	private String isIncludeCarriage;		//是否包含运费
	private String settlementType;		// 结算方式
	private String paymentType;		// 支付方式
	private String paymentProgress;		//付款进度
	private String qualityGuaranteePrice;		//质保金金额
	private String executeGuaranteePrice;		//履行保证金金额
	private String lanuchPerson;	// 创建者
	
	private String isValid;		// 是否有效期内
	
	private String search;		//查询条件
	
	public ContractAccount() {
		super();
	}

	public ContractAccount(String id){
		super(id);
	}

	public String getContractType() {
		return contractType;
	}

	public void setContractType(String contractType) {
		this.contractType = contractType;
	}

	public String getFristType() {
		return fristType;
	}

	public void setFristType(String fristType) {
		this.fristType = fristType;
	}

	public String getSecondType() {
		return secondType;
	}

	public void setSecondType(String secondType) {
		this.secondType = secondType;
	}

	public String getPartyBName() {
		return partyBName;
	}

	public void setPartyBName(String partyBName) {
		this.partyBName = partyBName;
	}
	
	public String getPartyBCode() {
		return partyBCode;
	}
	
	public void setPartyBCode(String partyBCode) {
		this.partyBCode = partyBCode;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getWorkflowstatus() {
		return workflowstatus;
	}

	public void setWorkflowstatus(String workflowstatus) {
		this.workflowstatus = workflowstatus;
	}

	public String getContractNo() {
		return contractNo;
	}

	public void setContractNo(String contractNo) {
		this.contractNo = contractNo;
	}

	public String getContractPrice() {
		return contractPrice;
	}

	public void setContractPrice(String contractPrice) {
		this.contractPrice = contractPrice;
	}

	public String getInvoiceType() {
		return invoiceType;
	}

	public void setInvoiceType(String invoiceType) {
		this.invoiceType = invoiceType;
	}

	public String getTaxRate() {
		return taxRate;
	}

	public void setTaxRate(String taxRate) {
		this.taxRate = taxRate;
	}

	public String getIsIncludeCarriage() {
		return isIncludeCarriage;
	}

	public void setIsIncludeCarriage(String isIncludeCarriage) {
		this.isIncludeCarriage = isIncludeCarriage;
	}

	public String getSettlementType() {
		return settlementType;
	}

	public void setSettlementType(String settlementType) {
		this.settlementType = settlementType;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getPaymentProgress() {
		return paymentProgress;
	}

	public void setPaymentProgress(String paymentProgress) {
		this.paymentProgress = paymentProgress;
	}

	public String getQualityGuaranteePrice() {
		return qualityGuaranteePrice;
	}

	public void setQualityGuaranteePrice(String qualityGuaranteePrice) {
		this.qualityGuaranteePrice = qualityGuaranteePrice;
	}

	public String getExecuteGuaranteePrice() {
		return executeGuaranteePrice;
	}

	public void setExecuteGuaranteePrice(String executeGuaranteePrice) {
		this.executeGuaranteePrice = executeGuaranteePrice;
	}

	public String getIsValid() {
		return isValid;
	}

	public void setIsValid(String isValid) {
		this.isValid = isValid;
	}

	public String getLanuchPerson() {
		return lanuchPerson;
	}

	public void setLanuchPerson(String lanuchPerson) {
		this.lanuchPerson = lanuchPerson;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	
}