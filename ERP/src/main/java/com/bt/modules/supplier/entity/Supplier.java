/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.supplier.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 供应商信息Entity
 * @author yhh
 * @version 2015-10-27
 */
public class Supplier extends DataEntity<Supplier> {
	
	private static final long serialVersionUID = 1L;
	private String seriesnumber;		// 供应商编号
	private String name;		// 供应商名称
	private String supplierType;		// 供应商类别
	private String srange;		// 供货范围
	private String registerAddress;		// 注册地址
	private String registerFund;		// 注册资金
	private String fundType;		// 资金币种
	private String businessAddress;		// 经营地址
	private String fax;		// 传真
	private String legalPreson;		// 法人
	private String legalTel;		// 法人手机
	private String legalPhone;		// 法人电话
	private String legalEmail;		// 法人邮箱
	private String businessPreson;		// 业务人
	private String businessTel;		// 业务手机
	private String businessPhone;		// 业务电话
	private String businessEmail;		// 业务邮箱
	private String area;		// 场地面积
	private String settlementType;		// 结算方式
	private String certificate;		// 管理证书
	private String accountBank;		// 开户银行
	private String accountName;		// 账户名
	private String account;		// 银行账户
	private String taxNumber;		// 税务证号
	private String permit;		// 营业执照
	private String foundData;		// 成立时间
	private String businessType;		// 业务类别
	private String natureType;		// 类别类别
	private String peopleNumber;		// 人员总数
	private String manageNumber;		// 管理人员数
	private String otherNumber;		// 其他人员数
	private String code;		//供应商简称
	
	private String businessPresonName;	//业务人id对应名字
	
	private String search;		//查询关键字
	
	public Supplier() {
		super();
	}

	public Supplier(String id){
		super(id);
	}

	@Length(min=0, max=50, message="供应商编号长度必须介于 0 和 50 之间")
	public String getSeriesnumber() {
		return seriesnumber;
	}

	public void setSeriesnumber(String seriesnumber) {
		this.seriesnumber = seriesnumber;
	}
	
	@Length(min=0, max=64, message="供应商名称长度必须介于 0 和 64 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=64, message="供应商类别长度必须介于 0 和 64 之间")
	public String getSupplierType() {
		return supplierType;
	}

	public void setSupplierType(String supplierType) {
		this.supplierType = supplierType;
	}
	
	@Length(min=0, max=200, message="供货范围长度必须介于 0 和 200 之间")
	public String getSrange() {
		return srange;
	}

	public void setSrange(String srange) {
		this.srange = srange;
	}
	
	@Length(min=0, max=200, message="注册地址长度必须介于 0 和 200 之间")
	public String getRegisterAddress() {
		return registerAddress;
	}

	public void setRegisterAddress(String registerAddress) {
		this.registerAddress = registerAddress;
	}
	
	@Length(min=0, max=18, message="注册资金长度必须介于 0 和 18 之间")
	public String getRegisterFund() {
		return registerFund;
	}

	public void setRegisterFund(String registerFund) {
		this.registerFund = registerFund;
	}
	
	@Length(min=0, max=32, message="资金币种长度必须介于 0 和 32 之间")
	public String getFundType() {
		return fundType;
	}

	public void setFundType(String fundType) {
		this.fundType = fundType;
	}
	
	@Length(min=0, max=200, message="经营地址长度必须介于 0 和 200 之间")
	public String getBusinessAddress() {
		return businessAddress;
	}

	public void setBusinessAddress(String businessAddress) {
		this.businessAddress = businessAddress;
	}
	
	@Length(min=0, max=64, message="传真长度必须介于 0 和 64 之间")
	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}
	
	@Length(min=0, max=64, message="法人长度必须介于 0 和 64 之间")
	public String getLegalPreson() {
		return legalPreson;
	}

	public void setLegalPreson(String legalPreson) {
		this.legalPreson = legalPreson;
	}
	
	@Length(min=0, max=32, message="法人手机长度必须介于 0 和 32 之间")
	public String getLegalTel() {
		return legalTel;
	}

	public void setLegalTel(String legalTel) {
		this.legalTel = legalTel;
	}
	
	@Length(min=0, max=32, message="法人电话长度必须介于 0 和 32 之间")
	public String getLegalPhone() {
		return legalPhone;
	}

	public void setLegalPhone(String legalPhone) {
		this.legalPhone = legalPhone;
	}
	
	@Length(min=0, max=64, message="法人邮箱长度必须介于 0 和 64 之间")
	public String getLegalEmail() {
		return legalEmail;
	}

	public void setLegalEmail(String legalEmail) {
		this.legalEmail = legalEmail;
	}
	
	@Length(min=0, max=64, message="业务人长度必须介于 0 和 64 之间")
	public String getBusinessPreson() {
		return businessPreson;
	}

	public void setBusinessPreson(String businessPreson) {
		this.businessPreson = businessPreson;
	}
	
	@Length(min=0, max=32, message="业务手机长度必须介于 0 和 32 之间")
	public String getBusinessTel() {
		return businessTel;
	}

	public void setBusinessTel(String businessTel) {
		this.businessTel = businessTel;
	}
	
	@Length(min=0, max=32, message="业务电话长度必须介于 0 和 32 之间")
	public String getBusinessPhone() {
		return businessPhone;
	}

	public void setBusinessPhone(String businessPhone) {
		this.businessPhone = businessPhone;
	}
	
	@Length(min=0, max=64, message="业务邮箱长度必须介于 0 和 64 之间")
	public String getBusinessEmail() {
		return businessEmail;
	}

	public void setBusinessEmail(String businessEmail) {
		this.businessEmail = businessEmail;
	}
	
	@Length(min=0, max=32, message="场地面积长度必须介于 0 和 32 之间")
	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}
	
	@Length(min=0, max=64, message="结算方式长度必须介于 0 和 64 之间")
	public String getSettlementType() {
		return settlementType;
	}

	public void setSettlementType(String settlementType) {
		this.settlementType = settlementType;
	}
	
	@Length(min=0, max=64, message="管理证书长度必须介于 0 和 64 之间")
	public String getCertificate() {
		return certificate;
	}

	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}
	
	@Length(min=0, max=64, message="开户银行长度必须介于 0 和 64 之间")
	public String getAccountBank() {
		return accountBank;
	}

	public void setAccountBank(String accountBank) {
		this.accountBank = accountBank;
	}
	
	@Length(min=0, max=64, message="开户名长度必须介于 0 和 64 之间")
	public String getAccountName() {
		return accountName;
	}
	
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	
	@Length(min=0, max=64, message="银行账户长度必须介于 0 和 64 之间")
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}
	
	@Length(min=0, max=32, message="税务证号长度必须介于 0 和 32 之间")
	public String getTaxNumber() {
		return taxNumber;
	}

	public void setTaxNumber(String taxNumber) {
		this.taxNumber = taxNumber;
	}
	
	@Length(min=0, max=64, message="营业执照长度必须介于 0 和 64 之间")
	public String getPermit() {
		return permit;
	}

	public void setPermit(String permit) {
		this.permit = permit;
	}
	
	@Length(min=0, max=32, message="成立时间长度必须介于 0 和 32 之间")
	public String getFoundData() {
		return foundData;
	}

	public void setFoundData(String foundData) {
		this.foundData = foundData;
	}
	
	@Length(min=0, max=64, message="业务类别长度必须介于 0 和 64 之间")
	public String getBusinessType() {
		return businessType;
	}

	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}
	
	@Length(min=0, max=64, message="类别类别长度必须介于 0 和 64 之间")
	public String getNatureType() {
		return natureType;
	}

	public void setNatureType(String natureType) {
		this.natureType = natureType;
	}
	
	@Length(min=0, max=18, message="人员总数长度必须介于 0 和 18 之间")
	public String getPeopleNumber() {
		return peopleNumber;
	}

	public void setPeopleNumber(String peopleNumber) {
		this.peopleNumber = peopleNumber;
	}
	
	@Length(min=0, max=18, message="管理人员数长度必须介于 0 和 18 之间")
	public String getManageNumber() {
		return manageNumber;
	}

	public void setManageNumber(String manageNumber) {
		this.manageNumber = manageNumber;
	}
	
	@Length(min=0, max=18, message="其他人员数长度必须介于 0 和 18 之间")
	public String getOtherNumber() {
		return otherNumber;
	}

	public void setOtherNumber(String otherNumber) {
		this.otherNumber = otherNumber;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getBusinessPresonName() {
		return businessPresonName;
	}

	public void setBusinessPresonName(String businessPresonName) {
		this.businessPresonName = businessPresonName;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}
	
}