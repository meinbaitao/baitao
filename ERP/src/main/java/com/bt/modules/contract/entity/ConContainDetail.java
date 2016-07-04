package com.bt.modules.contract.entity;

import java.util.List;

import com.bt.modules.supplier.entity.Supplier;
import com.thinkgem.jeesite.common.persistence.DataEntity;

public abstract class ConContainDetail<T, DetailT> extends DataEntity<T> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	protected String contractJiafang;		// 甲方
	protected String contractNo;		// 合同编号
	protected String contractType;		// 合同类型
	protected String partyBName;		// 乙方名称
	protected String partyBCode;		// 乙方简称
	protected String partyBPhone;		// 乙方电话
	protected String partyBTel;		// 乙方手机
	protected String partyBEmail;		// 乙方邮箱
	protected String partyBFax;		// 乙方传真
	protected String partyBLegalPerson;		// 乙方法定代表
	protected String partyBEntrustedAgent;		// 乙方委托代理人
	protected String partyBAddress;		// 乙方地址
	protected String partyBAccountName;		// 乙方银行账户名称
	protected String partyBAccountBank;		// 乙方开户行
	protected String partyBAccountNo;		// 乙方银行账户
	
	protected String settlementType;		// 结算方式
	protected String paymentType;		// 支付方式
	protected String partyBStrength;		// 供应商优势
	protected String cooperationNotice;		// 供应商合作注意事项
	protected String startTime;		// 合同开始时间
	protected String endTime;		// 合同结束时间
	protected String dateSignature;		// 合同签署时间
	protected String dateBreak;		// 合同中断日期
	protected String statue;		// 合同状态
	protected String taxRate;		// 税率
	protected String invoiceType;		// 发票类型
	protected String department;		// 执行部门
	protected String fristType;		// 一级类别
	protected String secondType;		// 二级类别
	protected String thirdType;		// 三级类别
	protected String standardType;		//标准合同类型
	protected String isStandardContract;		// 是否标准合同
	
	protected String isIncludeCarriage;		//是否包含运费
	protected String contractPrice;		//合同价格
	protected String paymentProgress;		//付款进度
	protected String qualityGuaranteePrice;		//质保金金额
	protected String executeGuaranteePrice;		//履行保证金金额
	protected String isIncludeQuality;		//是否收取质保金
	protected String qualityGuaranteeWay;		//质保金收取模式
	protected String qualityReturnWay;		//质保金返还模式
	protected String isIncludeExecute;		//是否收取履约金
	protected String executeGuaranteeWay;		//履约金收取模式
	protected String executeReturnWay;		//履约金返还模式
	
	protected List<DetailT> detailList;		//合同的明细
	
	protected String search;		//搜索关键字
	
	protected String delIds;		//欲删除明细ids
	
	private Supplier supp = new Supplier();			//供应商

	public  ConContainDetail(){
		super();
	}
	
	public ConContainDetail(String id){
		super(id);
	}
	
	
	public String getContractJiafang() {
		return contractJiafang;
	}

	public void setContractJiafang(String contractJiafang) {
		this.contractJiafang = contractJiafang;
	}
	
	
	public String getContractNo() {
		return contractNo;
	}

	public void setContractNo(String contractNo) {
		this.contractNo = contractNo;
	}

	public String getContractType() {
		return contractType;
	}

	public void setContractType(String contractType) {
		this.contractType = contractType;
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

	public String getPartyBPhone() {
		return partyBPhone;
	}

	public void setPartyBPhone(String partyBPhone) {
		this.partyBPhone = partyBPhone;
	}

	public String getPartyBTel() {
		return partyBTel;
	}

	public void setPartyBTel(String partyBTel) {
		this.partyBTel = partyBTel;
	}

	public String getPartyBEmail() {
		return partyBEmail;
	}

	public void setPartyBEmail(String partyBEmail) {
		this.partyBEmail = partyBEmail;
	}

	public String getPartyBFax() {
		return partyBFax;
	}

	public void setPartyBFax(String partyBFax) {
		this.partyBFax = partyBFax;
	}

	public String getPartyBLegalPerson() {
		return partyBLegalPerson;
	}

	public void setPartyBLegalPerson(String partyBLegalPerson) {
		this.partyBLegalPerson = partyBLegalPerson;
	}

	public String getPartyBEntrustedAgent() {
		return partyBEntrustedAgent;
	}

	public void setPartyBEntrustedAgent(String partyBEntrustedAgent) {
		this.partyBEntrustedAgent = partyBEntrustedAgent;
	}

	public String getPartyBAddress() {
		return partyBAddress;
	}

	public void setPartyBAddress(String partyBAddress) {
		this.partyBAddress = partyBAddress;
	}

	public String getPartyBAccountName() {
		return partyBAccountName;
	}

	public void setPartyBAccountName(String partyBAccountName) {
		this.partyBAccountName = partyBAccountName;
	}

	public String getPartyBAccountBank() {
		return partyBAccountBank;
	}

	public void setPartyBAccountBank(String partyBAccountBank) {
		this.partyBAccountBank = partyBAccountBank;
	}

	public String getPartyBAccountNo() {
		return partyBAccountNo;
	}

	public void setPartyBAccountNo(String partyBAccountNo) {
		this.partyBAccountNo = partyBAccountNo;
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

	public String getPartyBStrength() {
		return partyBStrength;
	}

	public void setPartyBStrength(String partyBStrength) {
		this.partyBStrength = partyBStrength;
	}

	public String getCooperationNotice() {
		return cooperationNotice;
	}

	public void setCooperationNotice(String cooperationNotice) {
		this.cooperationNotice = cooperationNotice;
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

	public String getDateSignature() {
		return dateSignature;
	}

	public void setDateSignature(String dateSignature) {
		this.dateSignature = dateSignature;
	}

	public String getDateBreak() {
		return dateBreak;
	}

	public void setDateBreak(String dateBreak) {
		this.dateBreak = dateBreak;
	}

	public String getStatue() {
		return statue;
	}

	public void setStatue(String statue) {
		this.statue = statue;
	}

	public String getTaxRate() {
		return taxRate;
	}

	public void setTaxRate(String taxRate) {
		this.taxRate = taxRate;
	}

	public String getInvoiceType() {
		return invoiceType;
	}

	public void setInvoiceType(String invoiceType) {
		this.invoiceType = invoiceType;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
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

	public String getStandardType() {
		return standardType;
	}

	public void setStandardType(String standardType) {
		this.standardType = standardType;
	}

	public String getIsStandardContract() {
		return isStandardContract;
	}

	public void setIsStandardContract(String isStandardContract) {
		this.isStandardContract = isStandardContract;
	}

	public String getIsIncludeCarriage() {
		return isIncludeCarriage;
	}

	public void setIsIncludeCarriage(String isIncludeCarriage) {
		this.isIncludeCarriage = isIncludeCarriage;
	}

	public String getContractPrice() {
		return contractPrice;
	}

	public void setContractPrice(String contractPrice) {
		this.contractPrice = contractPrice;
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

	public List<DetailT> getDetailList() {
		return detailList;
	}

	public void setDetailList(List<DetailT> detailList) {
		this.detailList = detailList;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getDelIds() {
		return delIds;
	}

	public void setDelIds(String delIds) {
		this.delIds = delIds;
	}

	public String getIsIncludeQuality() {
		return isIncludeQuality;
	}

	public void setIsIncludeQuality(String isIncludeQuality) {
		this.isIncludeQuality = isIncludeQuality;
	}

	public String getQualityGuaranteeWay() {
		return qualityGuaranteeWay;
	}

	public void setQualityGuaranteeWay(String qualityGuaranteeWay) {
		this.qualityGuaranteeWay = qualityGuaranteeWay;
	}

	public String getQualityReturnWay() {
		return qualityReturnWay;
	}

	public void setQualityReturnWay(String qualityReturnWay) {
		this.qualityReturnWay = qualityReturnWay;
	}

	public String getIsIncludeExecute() {
		return isIncludeExecute;
	}

	public void setIsIncludeExecute(String isIncludeExecute) {
		this.isIncludeExecute = isIncludeExecute;
	}

	public String getExecuteGuaranteeWay() {
		return executeGuaranteeWay;
	}

	public void setExecuteGuaranteeWay(String executeGuaranteeWay) {
		this.executeGuaranteeWay = executeGuaranteeWay;
	}

	public String getExecuteReturnWay() {
		return executeReturnWay;
	}

	public void setExecuteReturnWay(String executeReturnWay) {
		this.executeReturnWay = executeReturnWay;
	}

	public String getThirdType() {
		return thirdType;
	}

	public void setThirdType(String thirdType) {
		this.thirdType = thirdType;
	}

	public Supplier getSupp() {
		return supp;
	}

	public void setSupp(Supplier supp) {
		this.supp = supp;
	}


}
