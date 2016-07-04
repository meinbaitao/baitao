/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.project.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 项目周报明细Entity
 * @author xjp
 * @version 2015-09-14
 */
public class WeeklyDetail extends DataEntity<WeeklyDetail> {
	
	private static final long serialVersionUID = 1L;
	private String weeklyId;		// 周报ID
	private String isTransfer;		// 土建移交进度
	private String building;		// 楼栋号
	private String revenue;		// 产值
	private String visaCount;		// 签证份数
	private String marchTime;		// 班组进场时间
	private String skelentonPlanRatio;		// 骨架计划完成量
	private String skeletonCompRatio;		// 骨架完成量
	private String stonePlanRatio;		// 石材计划完成量
	private String stoneCompRatio;		// 石材完成量
	private String nextWeekStonePlanRatio;		// 下周石材计划完成量
	private String nextWeekSkeletonCompRatio;		// 下周骨架计划完成量
	private String amountRatio;		// 累计完成工程量
	private String labourId;		// 劳务队
	private String constPersonnel;		// 施工人员
	private String constProblem;		// 施工情况及问题
	
	public WeeklyDetail() {
		super();
	}

	public WeeklyDetail(String id){
		super(id);
	}

	@Length(min=0, max=64, message="周报ID长度必须介于 0 和 64 之间")
	public String getWeeklyId() {
		return weeklyId;
	}

	public void setWeeklyId(String weeklyId) {
		this.weeklyId = weeklyId;
	}
	
	@Length(min=1, max=1, message="土建移交进度长度必须介于 1 和 1 之间")
	public String getIsTransfer() {
		return isTransfer;
	}

	public void setIsTransfer(String isTransfer) {
		this.isTransfer = isTransfer;
	}
	
	@Length(min=0, max=64, message="楼栋号长度必须介于 0 和 64 之间")
	public String getBuilding() {
		return building;
	}

	public void setBuilding(String building) {
		this.building = building;
	}
	
	@Length(min=0, max=64, message="产值长度必须介于 0 和 64 之间")
	public String getRevenue() {
		return revenue;
	}

	public void setRevenue(String revenue) {
		this.revenue = revenue;
	}
	
	public String getVisaCount() {
		return visaCount;
	}

	public void setVisaCount(String visaCount) {
		this.visaCount = visaCount;
	}
	
	@Length(min=0, max=64, message="班组进场时间长度必须介于 0 和 64 之间")
	public String getMarchTime() {
		return marchTime;
	}

	public void setMarchTime(String marchTime) {
		this.marchTime = marchTime;
	}
	
	@Length(min=0, max=64, message="骨架计划完成量长度必须介于 0 和 64 之间")
	public String getSkelentonPlanRatio() {
		return skelentonPlanRatio;
	}

	public void setSkelentonPlanRatio(String skelentonPlanRatio) {
		this.skelentonPlanRatio = skelentonPlanRatio;
	}
	
	@Length(min=0, max=64, message="骨架完成量长度必须介于 0 和 64 之间")
	public String getSkeletonCompRatio() {
		return skeletonCompRatio;
	}

	public void setSkeletonCompRatio(String skeletonCompRatio) {
		this.skeletonCompRatio = skeletonCompRatio;
	}
	
	@Length(min=0, max=64, message="石材计划完成量长度必须介于 0 和 64 之间")
	public String getStonePlanRatio() {
		return stonePlanRatio;
	}

	public void setStonePlanRatio(String stonePlanRatio) {
		this.stonePlanRatio = stonePlanRatio;
	}
	
	@Length(min=0, max=64, message="石材完成量长度必须介于 0 和 64 之间")
	public String getStoneCompRatio() {
		return stoneCompRatio;
	}

	public void setStoneCompRatio(String stoneCompRatio) {
		this.stoneCompRatio = stoneCompRatio;
	}
	
	@Length(min=0, max=64, message="下周石材计划完成量长度必须介于 0 和 64 之间")
	public String getNextWeekStonePlanRatio() {
		return nextWeekStonePlanRatio;
	}

	public void setNextWeekStonePlanRatio(String nextWeekStonePlanRatio) {
		this.nextWeekStonePlanRatio = nextWeekStonePlanRatio;
	}
	
	@Length(min=0, max=64, message="下周骨架计划完成量长度必须介于 0 和 64 之间")
	public String getNextWeekSkeletonCompRatio() {
		return nextWeekSkeletonCompRatio;
	}

	public void setNextWeekSkeletonCompRatio(String nextWeekSkeletonCompRatio) {
		this.nextWeekSkeletonCompRatio = nextWeekSkeletonCompRatio;
	}
	
	@Length(min=0, max=64, message="累计完成工程量长度必须介于 0 和 64 之间")
	public String getAmountRatio() {
		return amountRatio;
	}

	public void setAmountRatio(String amountRatio) {
		this.amountRatio = amountRatio;
	}
	
	@Length(min=0, max=64, message="劳务队长度必须介于 0 和 64 之间")
	public String getLabourId() {
		return labourId;
	}

	public void setLabourId(String labourId) {
		this.labourId = labourId;
	}
	
	@Length(min=0, max=64, message="施工人员长度必须介于 0 和 64 之间")
	public String getConstPersonnel() {
		return constPersonnel;
	}

	public void setConstPersonnel(String constPersonnel) {
		this.constPersonnel = constPersonnel;
	}
	
	@Length(min=0, max=200, message="施工情况及问题长度必须介于 0 和 200 之间")
	public String getConstProblem() {
		return constProblem;
	}

	public void setConstProblem(String constProblem) {
		this.constProblem = constProblem;
	}
	
}