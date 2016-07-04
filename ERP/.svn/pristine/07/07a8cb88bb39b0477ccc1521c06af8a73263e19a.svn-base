/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.project.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 项目周报Entity
 * @author xjp
 * @version 2015-09-14
 */
public class Weekly extends DataEntity<Weekly> {
	
	private static final long serialVersionUID = 1L;
	private String projectId;		// 一级项目id
	private String startTime;		// 项目计划开工时间
	private String endTime;		// 项目计划完工时间
	private String factTime;		// 项目实际开工时间
	private String projectManagerBid;		// 项目负责人
	private String contractId;		// 合同id
	private String contractCost;		// 合同额(合同造价)
	private String scheduleDate;		// 周报日期
	private String amountScheduleMoney;		// 累计进度款
	private String amountRatio;		// 累计进度款比例
	private String planScheduleMoney;		// 计划申请进度款
	private String amountRevenue;		// 累计产值
	private String amountVisa;		// 累计签证
	
	public Weekly() {
		super();
	}

	public Weekly(String id){
		super(id);
	}

	@Length(min=0, max=64, message="一级项目id长度必须介于 0 和 64 之间")
	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	
	@Length(min=0, max=64, message="项目计划开工时间长度必须介于 0 和 64 之间")
	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	
	@Length(min=0, max=64, message="项目计划完工时间长度必须介于 0 和 64 之间")
	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
	@Length(min=0, max=64, message="项目实际开工时间长度必须介于 0 和 64 之间")
	public String getFactTime() {
		return factTime;
	}

	public void setFactTime(String factTime) {
		this.factTime = factTime;
	}
	
	@Length(min=0, max=64, message="项目负责人长度必须介于 0 和 64 之间")
	public String getProjectManagerBid() {
		return projectManagerBid;
	}

	public void setProjectManagerBid(String projectManagerBid) {
		this.projectManagerBid = projectManagerBid;
	}
	
	@Length(min=0, max=64, message="合同id长度必须介于 0 和 64 之间")
	public String getContractId() {
		return contractId;
	}

	public void setContractId(String contractId) {
		this.contractId = contractId;
	}
	
	@Length(min=0, max=64, message="合同额(合同造价)长度必须介于 0 和 64 之间")
	public String getContractCost() {
		return contractCost;
	}

	public void setContractCost(String contractCost) {
		this.contractCost = contractCost;
	}
	
	@Length(min=0, max=64, message="周报日期长度必须介于 0 和 64 之间")
	public String getScheduleDate() {
		return scheduleDate;
	}

	public void setScheduleDate(String scheduleDate) {
		this.scheduleDate = scheduleDate;
	}
	
	@Length(min=0, max=64, message="累计进度款长度必须介于 0 和 64 之间")
	public String getAmountScheduleMoney() {
		return amountScheduleMoney;
	}

	public void setAmountScheduleMoney(String amountScheduleMoney) {
		this.amountScheduleMoney = amountScheduleMoney;
	}
	
	@Length(min=0, max=64, message="累计进度款比例长度必须介于 0 和 64 之间")
	public String getAmountRatio() {
		return amountRatio;
	}

	public void setAmountRatio(String amountRatio) {
		this.amountRatio = amountRatio;
	}
	
	@Length(min=0, max=64, message="计划申请进度款长度必须介于 0 和 64 之间")
	public String getPlanScheduleMoney() {
		return planScheduleMoney;
	}

	public void setPlanScheduleMoney(String planScheduleMoney) {
		this.planScheduleMoney = planScheduleMoney;
	}
	
	@Length(min=0, max=64, message="累计产值长度必须介于 0 和 64 之间")
	public String getAmountRevenue() {
		return amountRevenue;
	}

	public void setAmountRevenue(String amountRevenue) {
		this.amountRevenue = amountRevenue;
	}
	
	@Length(min=0, max=64, message="累计签证长度必须介于 0 和 64 之间")
	public String getAmountVisa() {
		return amountVisa;
	}

	public void setAmountVisa(String amountVisa) {
		this.amountVisa = amountVisa;
	}
	
}