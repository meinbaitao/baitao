/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.report.weekly.mianly.entity;

import org.hibernate.validator.constraints.Length;

import java.util.Date;
import java.util.List;

import com.bt.modules.project.entity.Project;
import com.fasterxml.jackson.annotation.JsonFormat;

import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 周报主题信息Entity
 * @author jinyuanf
 * @version 2015-11-25
 */
public class ProjWeeklyReport extends DataEntity<ProjWeeklyReport> {
	
	private static final long serialVersionUID = 1L;
	private String projectId;		// 项目ID
	private Date createTime;		// 创建时间，取当前时间
	private Double contractTotalMoney;		// 合同额
	private String planStartDate;		// 计划开工时间
	private String planFinishDate;		// 计划完工时间
	private String factStartDate;		// 实际开工时间
	private String factFinishDate;		// 实际完工时间
	private Double accuApplyMoney;		// 累计申请进度款
	private Double accuApplyMoneyRate;		// 累计申请进度款比例
	private Double accuOutputValue;		// 累计产值
	private Integer accuSignature;		// 累计签证
	private String projReponsPeople;		// 项目负责人
	private Date reportBeginDate;		// 周报起始时间，上周六
	private Date reportEndDate;		// 周报截止时间, 本周五
	private Integer weekSerialNum;		// 周报序号，取系统时间当前第几周

	private String projectName; //项目名称
	
	private Project project; //项目

	private List<BuildingSchedule> buildingSchedules;

	private String projResponsPeopleName;
	private List<TransferedBuilding> transferedBuildings;
	private List<UntransferBuilding> unTransferBuildings;
	private String[] buildingScheduleDeletedIds;

	
	@Override
	public String toString(){
		String str = "";
		str+="项目名称：";
		str+=this.projectName;
		str+="\t创建人：";
		str+=this.createBy==null?"":this.createBy.getId();
		return str;
	}
	
	public String[] getBuildingScheduleDeletedIds() {
		return buildingScheduleDeletedIds;
	}

	public void setBuildingScheduleDeletedIds(String[] buildingScheduleDeletedIds) {
		this.buildingScheduleDeletedIds = buildingScheduleDeletedIds;
	}

	public List<UntransferBuilding> getUnTransferBuildings() {
		return unTransferBuildings;
	}

	public void setUnTransferBuildings(List<UntransferBuilding> unTransferBuildings) {
		this.unTransferBuildings = unTransferBuildings;
	}

	public List<TransferedBuilding> getTransferedBuildings() {
		return transferedBuildings;
	}

	public void setTransferedBuildings(List<TransferedBuilding> transferedBuildings) {
		this.transferedBuildings = transferedBuildings;
	}

	public ProjWeeklyReport() {
		super();
	}

	public ProjWeeklyReport(String id){
		super(id);
	}

	
	@Length(min=1, max=64, message="项目ID长度必须介于 1 和 64 之间")
	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="创建时间，取当前时间不能为空")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@NotNull(message="合同额不能为空")
	public Double getContractTotalMoney() {
		return contractTotalMoney;
	}

	public void setContractTotalMoney(Double contractTotalMoney) {
		this.contractTotalMoney = contractTotalMoney;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="计划开工时间不能为空")
	public String getPlanStartDate() {
		return planStartDate;
	}

	public void setPlanStartDate(String planStartDate) {
		this.planStartDate = planStartDate;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="计划完工时间不能为空")
	public String getPlanFinishDate() {
		return planFinishDate;
	}

	public void setPlanFinishDate(String planFinishDate) {
		this.planFinishDate = planFinishDate;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public String getFactStartDate() {
		return factStartDate;
	}

	public void setFactStartDate(String factStartDate) {
		this.factStartDate = factStartDate;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public String getFactFinishDate() {
		return factFinishDate;
	}

	public void setFactFinishDate(String factFinishDate) {
		this.factFinishDate = factFinishDate;
	}
	
	public Double getAccuApplyMoney() {
		return accuApplyMoney;
	}

	public void setAccuApplyMoney(Double accuApplyMoney) {
		this.accuApplyMoney = accuApplyMoney;
	}
	
	public Double getAccuApplyMoneyRate() {
		return accuApplyMoneyRate;
	}

	public void setAccuApplyMoneyRate(Double accuApplyMoneyRate) {
		this.accuApplyMoneyRate = accuApplyMoneyRate;
	}
	
	public Double getAccuOutputValue() {
		return accuOutputValue;
	}

	public void setAccuOutputValue(Double accuOutputValue) {
		this.accuOutputValue = accuOutputValue;
	}
	
	public Integer getAccuSignature() {
		return accuSignature;
	}

	public void setAccuSignature(Integer accuSignature) {
		this.accuSignature = accuSignature;
	}
	
	@Length(min=0, max=64, message="项目负责人长度必须介于 0 和 64 之间")
	public String getProjReponsPeople() {
		return projReponsPeople;
	}

	public void setProjReponsPeople(String projReponsPeople) {
		this.projReponsPeople = projReponsPeople;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="周报起始时间，上周六不能为空")
	public Date getReportBeginDate() {
		return reportBeginDate;
	}

	public void setReportBeginDate(Date reportBeginDate) {
		this.reportBeginDate = reportBeginDate;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="周报截止时间, 本周五不能为空")
	public Date getReportEndDate() {
		return reportEndDate;
	}

	public void setReportEndDate(Date reportEndDate) {
		this.reportEndDate = reportEndDate;
	}
	
	@NotNull(message="周报序号，取系统时间当前第几周不能为空")
	public Integer getWeekSerialNum() {
		return weekSerialNum;
	}

	public void setWeekSerialNum(Integer weekSerialNum) {
		this.weekSerialNum = weekSerialNum;
	}

	public List<BuildingSchedule> getBuildingSchedules() {
		return buildingSchedules;
	}

	public void setBuildingSchedules(List<BuildingSchedule> buildingSchedules) {
		this.buildingSchedules = buildingSchedules;
	}

	public String getProjResponsPeopleName() {
		return projResponsPeopleName;
	}

	public void setProjResponsPeopleName(String projResponsPeopleName) {
		this.projResponsPeopleName = projResponsPeopleName;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}
	

	
}