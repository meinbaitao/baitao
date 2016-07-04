/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.report.weekly.mianly.entity;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 周报-未移交楼栋Entity
 * @author jinyuanf
 * @version 2015-11-25
 */
public class UntransferBuilding extends BaseReportEntity<UntransferBuilding> {
	
	private static final long serialVersionUID = 1L;
	private String reportId;		// 项目周报表主键
	private String buildNo;		// 楼栋号
	private String district;		// 苑区
	private Date planTransferDate;		// 原：计划移交时间(现：计划进场时间)
	
	private String actualStoneArea;	//施工面积（默认取项目信息中的实际挂石面积）
//	private Date planEntryDate;		//计划进场时间
	private Date planFinishDate;	//计划完工时间
	private int memberCount;		//人数
	private String hurry;			//是否赶工
	private String subsidy;			//住宿补贴

	public UntransferBuilding() {
		super();
	}

	public UntransferBuilding(String id){
		super(id);
	}

	
	@Length(min=1, max=64, message="项目周报表主键长度必须介于 1 和 64 之间")
	public String getReportId() {
		return reportId;
	}

	public void setReportId(String reportId) {
		this.reportId = reportId;
	}
	
	@Length(min=1, max=100, message="楼栋号长度必须介于 1 和 100 之间")
	public String getBuildNo() {
		return buildNo;
	}

	public void setBuildNo(String buildNo) {
		this.buildNo = buildNo;
	}
	
	@Length(min=1, max=50, message="苑区长度必须介于 1 和 50 之间")
	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="计划移交时间不能为空")
	public Date getPlanTransferDate() {
		return planTransferDate;
	}

	public void setPlanTransferDate(Date planTransferDate) {
		this.planTransferDate = planTransferDate;
	}

	public String getActualStoneArea() {
		return actualStoneArea;
	}

	public void setActualStoneArea(String actualStoneArea) {
		this.actualStoneArea = actualStoneArea;
	}

	public Date getPlanFinishDate() {
		return planFinishDate;
	}

	public void setPlanFinishDate(Date planFinishDate) {
		this.planFinishDate = planFinishDate;
	}

	public int getMemberCount() {
		return memberCount;
	}

	public void setMemberCount(int memberCount) {
		this.memberCount = memberCount;
	}

	public String getHurry() {
		return hurry;
	}

	public void setHurry(String hurry) {
		this.hurry = hurry;
	}

	public String getSubsidy() {
		return subsidy;
	}

	public void setSubsidy(String subsidy) {
		this.subsidy = subsidy;
	}


}