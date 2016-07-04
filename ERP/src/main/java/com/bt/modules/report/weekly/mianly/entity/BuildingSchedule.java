/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.report.weekly.mianly.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 周报-在建进度Entity
 * @author jinyuanf
 * @version 2015-11-25
 */
public class BuildingSchedule extends BaseReportEntity<BuildingSchedule> {
	
	private static final long serialVersionUID = 1L;
	private String reportId;		// 项目周报表主键
	private String contractNo;		// 合同编号，通过项目id+楼栋 关联到 btg_con_laborcontract 的 contranct_no
	private String district;		// 苑区
	private String buildNo;		// 楼栋号
	private String workGroupGj;		// 劳务班组--骨架
	private String workGroupSc;		// 劳务班组--石材
	private Integer peopleNumberGj;		// 现有施工人数--骨架
	private Integer peopleNumberSc;		// 现有施工人数--石材
	private Double projectAmount;		// 工程量
	private Date transferTimeGj;		// 工作面移交--骨架
	private Date transferTimeSc;		// 工作面移交--石材
	private Double planFinishRateGj;		// 本周计划完成比例--骨架
	private Double planFinishRateSc;		// 本周计划完成比例--石材
	private Double factFinishRateGj;		// 本周实际完成比例--骨架
	private Double factFinishRateSc;		// 本周实际完成比例--石材
	private Double nwFinishRateGj;		// 下周计划完成比例--骨架
	private Double nwFinishRateSc;		// 下周计划完成比例--石材
	private Double productionValue;		// 产值
	private Double proValueSchedule;		// 产值进度
	private String schedulePicSouth;		// 南面施工进度图
	private String schedulePicNorth;		// 北面施工进度图
	private String schedulePicEast;		// 东面施工进度图
	private String schedulePicWest;		// 西面施工进度图
	private String jiaContractNo;  //甲方合同编号

	private Date planTransferDate;	//计划移交时间（计划进场时间）
	private Date planFinishDate;	//计划完工时间
	private int memberCount;		//人数
	private String hurry;			//是否赶工
	private String subsidy;			//住宿补贴


	public String getJiaContractNo() {
		return jiaContractNo;
	}

	public void setJiaContractNo(String jiaContractNo) {
		this.jiaContractNo = jiaContractNo;
	}

	public BuildingSchedule() {
		super();
	}

	public BuildingSchedule(String id){
		super(id);
	}

	
	@Length(min=1, max=64, message="项目周报表主键长度必须介于 1 和 64 之间")
	public String getReportId() {
		return reportId;
	}

	public void setReportId(String reportId) {
		this.reportId = reportId;
	}
	
	@Length(min=0, max=64, message="合同编号，通过项目id+楼栋 关联到 btg_con_laborcontract 的 contranct_no长度必须介于 0 和 64 之间")
	public String getContractNo() {
		return contractNo;
	}

	public void setContractNo(String contractNo) {
		this.contractNo = contractNo;
	}
	
	@Length(min=1, max=50, message="苑区长度必须介于 1 和 50 之间")
	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}
	
	@Length(min=1, max=100, message="楼栋号长度必须介于 1 和 100 之间")
	public String getBuildNo() {
		return buildNo;
	}

	public void setBuildNo(String buildNo) {
		this.buildNo = buildNo;
	}
	
	@Length(min=0, max=100, message="劳务班组--骨架长度必须介于 0 和 100 之间")
	public String getWorkGroupGj() {
		return workGroupGj;
	}

	public void setWorkGroupGj(String workGroupGj) {
		this.workGroupGj = workGroupGj;
	}
	
	@Length(min=0, max=100, message="劳务班组--石材长度必须介于 0 和 100 之间")
	public String getWorkGroupSc() {
		return workGroupSc;
	}

	public void setWorkGroupSc(String workGroupSc) {
		this.workGroupSc = workGroupSc;
	}
	
	public Integer getPeopleNumberGj() {
		return peopleNumberGj;
	}

	public void setPeopleNumberGj(Integer peopleNumberGj) {
		this.peopleNumberGj = peopleNumberGj;
	}
	
	public Integer getPeopleNumberSc() {
		return peopleNumberSc;
	}

	public void setPeopleNumberSc(Integer peopleNumberSc) {
		this.peopleNumberSc = peopleNumberSc;
	}
	
	public Double getProjectAmount() {
		return projectAmount;
	}

	public void setProjectAmount(Double projectAmount) {
		this.projectAmount = projectAmount;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getTransferTimeGj() {
		return transferTimeGj;
	}

	public void setTransferTimeGj(Date transferTimeGj) {
		this.transferTimeGj = transferTimeGj;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getTransferTimeSc() {
		return transferTimeSc;
	}

	public void setTransferTimeSc(Date transferTimeSc) {
		this.transferTimeSc = transferTimeSc;
	}
	
	public Double getPlanFinishRateGj() {
		return planFinishRateGj;
	}

	public void setPlanFinishRateGj(Double planFinishRateGj) {
		this.planFinishRateGj = planFinishRateGj;
	}
	
	public Double getPlanFinishRateSc() {
		return planFinishRateSc;
	}

	public void setPlanFinishRateSc(Double planFinishRateSc) {
		this.planFinishRateSc = planFinishRateSc;
	}
	
	public Double getFactFinishRateGj() {
		return factFinishRateGj;
	}

	public void setFactFinishRateGj(Double factFinishRateGj) {
		this.factFinishRateGj = factFinishRateGj;
	}
	
	public Double getFactFinishRateSc() {
		return factFinishRateSc;
	}

	public void setFactFinishRateSc(Double factFinishRateSc) {
		this.factFinishRateSc = factFinishRateSc;
	}
	
	public Double getNwFinishRateGj() {
		return nwFinishRateGj;
	}

	public void setNwFinishRateGj(Double nwFinishRateGj) {
		this.nwFinishRateGj = nwFinishRateGj;
	}
	
	public Double getNwFinishRateSc() {
		return nwFinishRateSc;
	}

	public void setNwFinishRateSc(Double nwFinishRateSc) {
		this.nwFinishRateSc = nwFinishRateSc;
	}
	
	public Double getProductionValue() {
		return productionValue;
	}

	public void setProductionValue(Double productionValue) {
		this.productionValue = productionValue;
	}
	
	public Double getProValueSchedule() {
		return proValueSchedule;
	}

	public void setProValueSchedule(Double proValueSchedule) {
		this.proValueSchedule = proValueSchedule;
	}
	
	@Length(min=0, max=512, message="南面施工进度图长度必须介于 0 和 512 之间")
	public String getSchedulePicSouth() {
		return schedulePicSouth;
	}

	public void setSchedulePicSouth(String schedulePicSouth) {
		this.schedulePicSouth = schedulePicSouth;
	}
	
	@Length(min=0, max=512, message="北面施工进度图长度必须介于 0 和 512 之间")
	public String getSchedulePicNorth() {
		return schedulePicNorth;
	}

	public void setSchedulePicNorth(String schedulePicNorth) {
		this.schedulePicNorth = schedulePicNorth;
	}
	
	@Length(min=0, max=512, message="东面施工进度图长度必须介于 0 和 512 之间")
	public String getSchedulePicEast() {
		return schedulePicEast;
	}

	public void setSchedulePicEast(String schedulePicEast) {
		this.schedulePicEast = schedulePicEast;
	}
	
	@Length(min=0, max=512, message="西面施工进度图长度必须介于 0 和 512 之间")
	public String getSchedulePicWest() {
		return schedulePicWest;
	}

	public void setSchedulePicWest(String schedulePicWest) {
		this.schedulePicWest = schedulePicWest;
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

	public Date getPlanTransferDate() {
		return planTransferDate;
	}

	public void setPlanTransferDate(Date planTransferDate) {
		this.planTransferDate = planTransferDate;
	}


}