/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 年度合同Entity
 * @author yhh
 * @version 2015-08-14
 */
//Fixme 必须重写 equals 和 hashcode 方法
public class ConYearContract extends DataEntity<ConYearContract> {
	
	private static final long serialVersionUID = 1L;
	private String contractNo;		// 合同编号
	private String contractType;		// 合同类型
	private String exeType; 			//施工组类别
	private String name;		// 乙方施工班组
	private Integer exeNumber;		// 施工班组人数
	private String person;		// 乙方代表人
	private String personNum;		// 乙方代表人身份证号
	private String personTel;		// 乙方代表人联系方式
	private String bank;		// 乙方代表人开户银行
	private String bankNum;		// 乙方代表人银行账户
	private String bankPerson;		// 银行账户名
	private String exeRecord;		// 合作记录
	private String exeQuality;		// 过往工作质量
	private String limitDate;		// 合同期限
	private String startDate;		// 开始日期
	private String endDate;		// 终止日期
	private String endTime;		// 终止时间
	private String quality;		// 工程质量要求
	private String conWay;		// 承包方式
	private String ensure;		// 保证金
	private String isIssue;		// 是否发生过劳务纠纷
	private String manage;		// 现场材料管理模式
	private String checkStatus;		// 审批状态
	private String conStatus;		// 合同状态
	private String department;		// 执行部门
	private String fristType;		// 一级类别
	private String secondType;		// 二级类别
	private String standardType;		//标准合同类型
	private String isStandardContract;		// 是否标准合同
	private String partyBCode;		// 乙方简称
	
	public ConYearContract() {
		super();
	}

	public ConYearContract(String id){
		super(id);
	}

	@Length(min=0, max=64, message="合同编号长度必须介于 0 和 64 之间")
	public String getContractNo() {
		return contractNo;
	}

	public void setContractNo(String contractNo) {
		this.contractNo = contractNo;
	}
	
	@Length(min=0, max=64, message="合同类型长度必须介于 0 和 64 之间")
	public String getContractType() {
		return contractType;
	}

	public void setConType(String contractType) {
		this.contractType = contractType;
	}
	
	public String getExeType() {
		return exeType;
	}

	public void setExeType(String exeType) {
		this.exeType = exeType;
	}

	@Length(min=0, max=64, message="乙方施工班组长度必须介于 0 和 64 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public Integer getExeNumber() {
		return exeNumber;
	}

	public void setExeNumber(Integer exeNumber) {
		this.exeNumber = exeNumber;
	}
	
	@Length(min=0, max=64, message="乙方代表人长度必须介于 0 和 64 之间")
	public String getPerson() {
		return person;
	}

	public void setPerson(String person) {
		this.person = person;
	}
	
	@Length(min=0, max=64, message="乙方代表人身份证号长度必须介于 0 和 64 之间")
	public String getPersonNum() {
		return personNum;
	}

	public void setPersonNum(String personNum) {
		this.personNum = personNum;
	}
	
	@Length(min=0, max=64, message="乙方代表人联系方式长度必须介于 0 和 64 之间")
	public String getPersonTel() {
		return personTel;
	}

	public void setPersonTel(String personTel) {
		this.personTel = personTel;
	}
	
	@Length(min=0, max=64, message="乙方代表人开户银行长度必须介于 0 和 64 之间")
	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}
	
	@Length(min=0, max=64, message="乙方代表人银行账户长度必须介于 0 和 64 之间")
	public String getBankNum() {
		return bankNum;
	}

	public void setBankNum(String bankNum) {
		this.bankNum = bankNum;
	}
	
	@Length(min=0, max=32, message="银行账户名长度必须介于 0 和 32 之间")
	public String getBankPerson() {
		return bankPerson;
	}

	public void setBankPerson(String bankPerson) {
		this.bankPerson = bankPerson;
	}
	
	@Length(min=0, max=255, message="合作记录长度必须介于 0 和 255 之间")
	public String getExeRecord() {
		return exeRecord;
	}

	public void setExeRecord(String exeRecord) {
		this.exeRecord = exeRecord;
	}
	
	@Length(min=0, max=255, message="过往工作质量长度必须介于 0 和 255 之间")
	public String getExeQuality() {
		return exeQuality;
	}

	public void setExeQuality(String exeQuality) {
		this.exeQuality = exeQuality;
	}
	
	@Length(min=0, max=64, message="合同期限长度必须介于 0 和 64 之间")
	public String getLimitDate() {
		return limitDate;
	}

	public void setLimitDate(String limitDate) {
		this.limitDate = limitDate;
	}
	
	@Length(min=0, max=20, message="开始日期长度必须介于 0 和 20 之间")
	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	
	@Length(min=0, max=20, message="终止日期长度必须介于 0 和 20 之间")
	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	@Length(min=0, max=20, message="终止时间长度必须介于 0 和 20 之间")
	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
	@Length(min=0, max=20, message="工程质量要求长度必须介于 0 和 20 之间")
	public String getQuality() {
		return quality;
	}

	public void setQuality(String quality) {
		this.quality = quality;
	}
	
	@Length(min=0, max=64, message="承包方式长度必须介于 0 和 64 之间")
	public String getConWay() {
		return conWay;
	}

	public void setConWay(String conWay) {
		this.conWay = conWay;
	}
	
	public String getEnsure() {
		return ensure;
	}

	public void setEnsure(String ensure) {
		this.ensure = ensure;
	}
	
	@Length(min=0, max=10, message="是否发生过劳务纠纷长度必须介于 0 和 10 之间")
	public String getIsIssue() {
		return isIssue;
	}

	public void setIsIssue(String isIssue) {
		this.isIssue = isIssue;
	}
	
	@Length(min=0, max=20, message="现场材料管理模式长度必须介于 0 和 20 之间")
	public String getManage() {
		return manage;
	}

	public void setManage(String manage) {
		this.manage = manage;
	}
	
	@Length(min=0, max=20, message="审批状态长度必须介于 0 和 20 之间")
	public String getCheckStatus() {
		return checkStatus;
	}

	public void setCheckStatus(String checkStatus) {
		this.checkStatus = checkStatus;
	}
	
	@Length(min=0, max=20, message="合同状态长度必须介于 0 和 20 之间")
	public String getConStatus() {
		return conStatus;
	}

	public void setConStatus(String conStatus) {
		this.conStatus = conStatus;
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

	public String getPartyBCode() {
		return partyBCode;
	}

	public void setPartyBCode(String partyBCode) {
		this.partyBCode = partyBCode;
	}

	
}