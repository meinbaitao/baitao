/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.task.entity;

import java.util.List;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.Office;

/**
 * 任务型计划信息表Entity
 * @author yzh
 * @version 2015-09-02
 */
public class TaskPlan extends DataEntity<TaskPlan> {
	
	private static final long serialVersionUID = 1L;
	private String parentId;		// 上级任务
	private String deptId;		// 部门
	private String reviewDeptId;		// 复评部门
	private String groupConcern;		// 集团关注
	private String longTermTask;		// 长期任务
	private String discussionSuggestion;		// 讨论建议
	private String responsiblePerson;		// 责任人
	private String oneLevelPlan;		// 一级计划
	private String twoLevelPlan;		// 二级计划
	private String taskDesc;		// 任务描述
	private String planFinishTime;		// 计划完成时间
	private String actualFinishTime;		// 实际完成时间
	private String finishTimeAdjust1;		// 完成时间调整1
	private String finishTimeAdjust2;		// 完成时间调整2
	private String finishReview;		// 完成情况复评
	private String summaryRemarks;		// 计划/总结备注
	private String earlyWarning;		// 预警
	private String status;		// 计划执行状态
	private String showPerson;	//显示责任人
	private String showDept;	//显示复评部门
	
	public String getShowPerson() {
		return showPerson;
	}
	public void setShowPerson(String showPerson) {
		this.showPerson = showPerson;
	}
	public String getShowDept() {
		return showDept;
	}
	public void setShowDept(String showDept) {
		this.showDept = showDept;
	}

	private String subTask;		//是否已创建子任务	0：未创建，1：已创建
	
	public String getSubTask() {
		return subTask;
	}
	public void setSubTask(String subTask) {
		this.subTask = subTask;
	}

	private List<TaskPlan> taskList;
	
	public List<TaskPlan> getTaskList() {
		return taskList;
	}

	public void setTaskList(List<TaskPlan> taskList) {
		this.taskList = taskList;
	}

	private String deptName;		// 部门
	private Office reviewDeptName;		// 部门
	
	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public Office getReviewDeptName() {
		return reviewDeptName;
	}

	public void setReviewDeptName(Office reviewDeptName) {
		this.reviewDeptName = reviewDeptName;
	}
	
	public TaskPlan() {
		super();
	}

	public TaskPlan(String id){
		super(id);
	}
	
	@Length(min=0, max=50, message="上级任务长度必须介于 0 和 50 之间")
	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	
	@Length(min=0, max=50, message="部门长度必须介于 0 和 50 之间")
	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	
	@Length(min=0, max=50, message="复评部门长度必须介于 0 和 50 之间")
	public String getReviewDeptId() {
		return reviewDeptId;
	}

	public void setReviewDeptId(String reviewDeptId) {
		this.reviewDeptId = reviewDeptId;
	}
	
	@Length(min=1, max=1, message="集团关注长度必须介于 1 和 1 之间")
	public String getGroupConcern() {
		return groupConcern;
	}

	public void setGroupConcern(String groupConcern) {
		this.groupConcern = groupConcern;
	}
	
	@Length(min=1, max=1, message="长期任务长度必须介于 1 和 1 之间")
	public String getLongTermTask() {
		return longTermTask;
	}

	public void setLongTermTask(String longTermTask) {
		this.longTermTask = longTermTask;
	}
	
	@Length(min=1, max=1, message="讨论建议长度必须介于 1 和 1 之间")
	public String getDiscussionSuggestion() {
		return discussionSuggestion;
	}

	public void setDiscussionSuggestion(String discussionSuggestion) {
		this.discussionSuggestion = discussionSuggestion;
	}
	
	@Length(min=0, max=50, message="责任人长度必须介于 0 和 50 之间")
	public String getResponsiblePerson() {
		return responsiblePerson;
	}

	public void setResponsiblePerson(String responsiblePerson) {
		this.responsiblePerson = responsiblePerson;
	}
	
	@Length(min=0, max=200, message="一级计划长度必须介于 0 和 200 之间")
	public String getOneLevelPlan() {
		return oneLevelPlan;
	}

	public void setOneLevelPlan(String oneLevelPlan) {
		this.oneLevelPlan = oneLevelPlan;
	}
	
	@Length(min=0, max=200, message="二级计划长度必须介于 0 和 200 之间")
	public String getTwoLevelPlan() {
		return twoLevelPlan;
	}

	public void setTwoLevelPlan(String twoLevelPlan) {
		this.twoLevelPlan = twoLevelPlan;
	}
	
	@Length(min=1, max=300, message="任务描述长度必须介于 1 和 300 之间")
	public String getTaskDesc() {
		return taskDesc;
	}

	public void setTaskDesc(String taskDesc) {
		this.taskDesc = taskDesc;
	}
	
	public String getPlanFinishTime() {
		return planFinishTime;
	}

	public void setPlanFinishTime(String planFinishTime) {
		this.planFinishTime = planFinishTime;
	}

	public String getActualFinishTime() {
		return actualFinishTime;
	}

	public void setActualFinishTime(String actualFinishTime) {
		this.actualFinishTime = actualFinishTime;
	}

	public String getFinishTimeAdjust1() {
		return finishTimeAdjust1;
	}

	public void setFinishTimeAdjust1(String finishTimeAdjust1) {
		this.finishTimeAdjust1 = finishTimeAdjust1;
	}

	public String getFinishTimeAdjust2() {
		return finishTimeAdjust2;
	}

	public void setFinishTimeAdjust2(String finishTimeAdjust2) {
		this.finishTimeAdjust2 = finishTimeAdjust2;
	}

	public String getFinishReview() {
		return finishReview;
	}

	public void setFinishReview(String finishReview) {
		this.finishReview = finishReview;
	}
	
	
	public String getSummaryRemarks() {
		return summaryRemarks;
	}

	public void setSummaryRemarks(String summaryRemarks) {
		this.summaryRemarks = summaryRemarks;
	}
	
	
	public String getEarlyWarning() {
		return earlyWarning;
	}

	public void setEarlyWarning(String earlyWarning) {
		this.earlyWarning = earlyWarning;
	}
	
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}