/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.task.entity;

import java.util.List;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 个人管控任务Entity
 * @author qf
 * @version 2015-09-09
 */
public class TaskPersonalPlan extends DataEntity<TaskPersonalPlan> {
	
	private static final long serialVersionUID = 1L;
	private String stage;		// 阶段
	private String subsection;		// 分部
	private String fine;		// 细项
	private String parentId;		// 上级计划
	private String keyDesc;		// 重点描述
	private String milepost;		// 里程碑
	private String frontTask;		// 前置任务
	private String standardDay;		// 标准天数
	private String finishTime;		// 完成时间
	private String isFinish;		// 是否完成
	private String confirmOmpletion;		// 0-未确定完成/1确定完成
	private String responsiblePerson;		// 责任人
	private String status;		// 状态
	private String summaryRemarks;		// 计划/总结备注
	

	private List<TaskPersonalPlan> taskPersonalPlanList;
	

	public List<TaskPersonalPlan> getTaskPersonalPlanList() {
		return taskPersonalPlanList;
	}

	public void setTaskPersonalPlanList(List<TaskPersonalPlan> taskPersonalPlanList) {
		this.taskPersonalPlanList = taskPersonalPlanList;
	}

	public TaskPersonalPlan() {
		super();
	}

	public TaskPersonalPlan(String id){
		super(id);
	}

	@Length(min=0, max=200, message="阶段长度必须介于 0 和 200 之间")
	public String getStage() {
		return stage;
	}

	public void setStage(String stage) {
		this.stage = stage;
	}
	
	@Length(min=0, max=200, message="分部长度必须介于 0 和 200 之间")
	public String getSubsection() {
		return subsection;
	}

	public void setSubsection(String subsection) {
		this.subsection = subsection;
	}
	
	@Length(min=0, max=500, message="细项长度必须介于 0 和 500 之间")
	public String getFine() {
		return fine;
	}

	public void setFine(String fine) {
		this.fine = fine;
	}
	
	@Length(min=0, max=64, message="上级计划长度必须介于 0 和 64 之间")
	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	
	@Length(min=0, max=1000, message="重点描述长度必须介于 0 和 1000 之间")
	public String getKeyDesc() {
		return keyDesc;
	}

	public void setKeyDesc(String keyDesc) {
		this.keyDesc = keyDesc;
	}
	
	@Length(min=0, max=20, message="里程碑长度必须介于 0 和 20 之间")
	public String getMilepost() {
		return milepost;
	}

	public void setMilepost(String milepost) {
		this.milepost = milepost;
	}
	
	@Length(min=0, max=60, message="前置任务长度必须介于 0 和 60 之间")
	public String getFrontTask() {
		return frontTask;
	}

	public void setFrontTask(String frontTask) {
		this.frontTask = frontTask;
	}
	
	@Length(min=0, max=20, message="标准天数长度必须介于 0 和 20 之间")
	public String getStandardDay() {
		return standardDay;
	}

	public void setStandardDay(String standardDay) {
		this.standardDay = standardDay;
	}
	

	public String getFinishTime() {
		return finishTime;
	}

	public void setFinishTime(String finishTime) {
		this.finishTime = finishTime;
	}

	@Length(min=1, max=1, message="是否完成长度必须介于 1 和 1 之间")
	public String getIsFinish() {
		return isFinish;
	}

	public void setIsFinish(String isFinish) {
		this.isFinish = isFinish;
	}
	
	@Length(min=1, max=1, message="0-未确定完成/1确定完成长度必须介于 1 和 1 之间")
	public String getConfirmOmpletion() {
		return confirmOmpletion;
	}

	public void setConfirmOmpletion(String confirmOmpletion) {
		this.confirmOmpletion = confirmOmpletion;
	}
	
	@Length(min=0, max=50, message="责任人长度必须介于 0 和 50 之间")
	public String getResponsiblePerson() {
		return responsiblePerson;
	}

	public void setResponsiblePerson(String responsiblePerson) {
		this.responsiblePerson = responsiblePerson;
	}
	
	@Length(min=1, max=1, message="状态长度必须介于 1 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Length(min=0, max=200, message="计划/总结备注长度必须介于 0 和 200 之间")
	public String getSummaryRemarks() {
		return summaryRemarks;
	}

	public void setSummaryRemarks(String summaryRemarks) {
		this.summaryRemarks = summaryRemarks;
	}
	
}