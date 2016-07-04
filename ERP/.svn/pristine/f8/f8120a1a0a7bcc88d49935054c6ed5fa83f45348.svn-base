/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 施工班组Entity
 * @author yhh
 * @version 2015-08-04
 */
public class Execution extends DataEntity<Execution> {
	
	private static final long serialVersionUID = 1L;
	
	private String  exeNo;                           //施工班组编号
	private String  name;		                     //施工班组名称
	private String  exeType;		                 //承接范围
	private String  exeLevel;		                 //施工班组等级
	private String  levelCoefficient;                //施工班组等级系数
	private String  personNum;		                 //施工班组身份证号
	private String  person;		                     //施工班组
	private String  personTel;		                 //施工班组联系方式
	private String  bankPerson;		                 //施工班组银行账户名
	private String  bank;		                     //施工班组开户银行
	private String  bankNum;		                 //施工班组银行账号
	private String	delegate;						 //代表人
	private String	delegateNum;                     //代表人身份证号
	private String	delegateTel;                     //代表人联系方式
	private String	exeErea;                         //班组施工区域
	private String	remarks;                         //备注信息
	private Integer exeNumber;                       //施工班组人数
	private String	workerFrom;                      //工人来源地
	private String	wantErea;                        //本年意向哪个区域施工
	private String	evaluateMaxNum;                  //施工班组预计最大大工人数
	private String	skillPerson;                     //内部技术人员（带班）
	private String	stoneBigNum;                     //挂石大工人数
	private String	frameBigNum;                     //骨架大工人数
	private String	frameSmallNum;                   //骨架小工人数
	private String	stoneSmallNum;                   //挂石小工人数
	private String	thirtyDayArea;                   //施工班组30天可施工面积
	
	private String  exeRecord;		                 //合作记录
	private String  exeQuality;		                 //过往工作质量
	private String  status;		                     //工施班组状态
	private String  code;		                     //乙方简称
	
	private String  search;		                     //搜索关键字
	
	public Execution() {
		super();
	}

	public Execution(String id){
		super(id);
	}

	@Length(min=0, max=64, message="乙方施工班组长度必须介于 0 和 64 之间")
	public String getName() {
		return name;
	}

	public String getExeType() {
		return exeType;
	}

	public void setExeType(String exeType) {
		this.exeType = exeType;
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
	
	@Length(min=0, max=64, message="工施班组状态长度必须介于 0 和 64 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}
	public String getExeNo() {
		return exeNo;
	}

	public void setExeNo(String exeNo) {
		this.exeNo = exeNo;
	}

	public String getExeLevel() {
		return exeLevel;
	}

	public void setExeLevel(String exeLevel) {
		this.exeLevel = exeLevel;
	}

	public String getLevelCoefficient() {
		return levelCoefficient;
	}

	public void setLevelCoefficient(String levelCoefficient) {
		this.levelCoefficient = levelCoefficient;
	}

	public String getDelegate() {
		return delegate;
	}

	public void setDelegate(String delegate) {
		this.delegate = delegate;
	}

	public String getDelegateNum() {
		return delegateNum;
	}

	public void setDelegateNum(String delegateNum) {
		this.delegateNum = delegateNum;
	}

	public String getDelegateTel() {
		return delegateTel;
	}

	public void setDelegateTel(String delegateTel) {
		this.delegateTel = delegateTel;
	}

	public String getExeErea() {
		return exeErea;
	}

	public void setExeErea(String exeErea) {
		this.exeErea = exeErea;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getWorkerFrom() {
		return workerFrom;
	}

	public void setWorkerFrom(String workerFrom) {
		this.workerFrom = workerFrom;
	}

	public String getWantErea() {
		return wantErea;
	}

	public void setWantErea(String wantErea) {
		this.wantErea = wantErea;
	}

	public String getEvaluateMaxNum() {
		return evaluateMaxNum;
	}

	public void setEvaluateMaxNum(String evaluateMaxNum) {
		this.evaluateMaxNum = evaluateMaxNum;
	}

	public String getSkillPerson() {
		return skillPerson;
	}

	public void setSkillPerson(String skillPerson) {
		this.skillPerson = skillPerson;
	}

	public String getStoneBigNum() {
		return stoneBigNum;
	}

	public void setStoneBigNum(String stoneBigNum) {
		this.stoneBigNum = stoneBigNum;
	}

	public String getFrameBigNum() {
		return frameBigNum;
	}

	public void setFrameBigNum(String frameBigNum) {
		this.frameBigNum = frameBigNum;
	}

	public String getFrameSmallNum() {
		return frameSmallNum;
	}

	public void setFrameSmallNum(String frameSmallNum) {
		this.frameSmallNum = frameSmallNum;
	}

	public String getStoneSmallNum() {
		return stoneSmallNum;
	}

	public void setStoneSmallNum(String stoneSmallNum) {
		this.stoneSmallNum = stoneSmallNum;
	}

	public String getThirtyDayArea() {
		return thirtyDayArea;
	}

	public void setThirtyDayArea(String thirtyDayArea) {
		this.thirtyDayArea = thirtyDayArea;
	}
}