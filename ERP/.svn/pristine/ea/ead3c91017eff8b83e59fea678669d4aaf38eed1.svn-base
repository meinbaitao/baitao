/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.task.entity;

import java.util.List;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 指标型总控计划Entity
 * @author lqf
 * @version 2015-09-11
 */
public class TaskQuotaPlan extends DataEntity<TaskQuotaPlan> {
	
	private static final long serialVersionUID = 1L;
	private String parentId;		// 上级任务
	private String deptId;		// 部门
	private String reviewDeptId;		// 复评部门
	private String groupConcern;		// 集团关注
	private String longTermTask;		// 长期任务
	private String discussionSuggestion;		// 讨论建议
	private String taskMonth;		// 月份
	private String quotas;		// 指标项
	private String weight;		// 权重
	private String quotaDesc;		// 指标描述
	private String responsiblePerson;		// 责任人
	private String actualFinishQuantity;		// 实际完成量
	private String goal;		// 得分
	private String summaryRemarks;		// 计划/总结备注
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
	
	private List<TaskQuotaPlan> taskQuotaPlanList;
	
	public List<TaskQuotaPlan> getTaskQuotaPlanList() {
		return taskQuotaPlanList;
	}

	public void setTaskQuotaPlanList(List<TaskQuotaPlan> taskQuotaPlanList) {
		this.taskQuotaPlanList = taskQuotaPlanList;
	}

	public TaskQuotaPlan() {
		super();
	}

	public TaskQuotaPlan(String id){
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
	
	@Length(min=0, max=50, message="月份长度必须介于 0 和 50 之间")
	public String getTaskMonth() {
		return taskMonth;
	}

	public void setTaskMonth(String taskMonth) {
		this.taskMonth = taskMonth;
	}
	
	@Length(min=0, max=200, message="指标项长度必须介于 0 和 200 之间")
	public String getQuotas() {
		return quotas;
	}

	public void setQuotas(String quotas) {
		this.quotas = quotas;
	}
	
	@Length(min=0, max=60, message="权重长度必须介于 0 和 60 之间")
	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}
	
	@Length(min=1, max=500, message="指标描述长度必须介于 1 和 500 之间")
	public String getQuotaDesc() {
		return quotaDesc;
	}

	public void setQuotaDesc(String quotaDesc) {
		this.quotaDesc = quotaDesc;
	}
	
	@Length(min=0, max=50, message="责任人长度必须介于 0 和 50 之间")
	public String getResponsiblePerson() {
		return responsiblePerson;
	}

	public void setResponsiblePerson(String responsiblePerson) {
		this.responsiblePerson = responsiblePerson;
	}
	
	public String getActualFinishQuantity() {
		return actualFinishQuantity;
	}

	public void setActualFinishQuantity(String actualFinishQuantity) {
		this.actualFinishQuantity = actualFinishQuantity;
	}
	
	public String getGoal() {
		return goal;
	}

	public void setGoal(String goal) {
		this.goal = goal;
	}
	
	@Length(min=0, max=200, message="计划/总结备注长度必须介于 0 和 200 之间")
	public String getSummaryRemarks() {
		return summaryRemarks;
	}

	public void setSummaryRemarks(String summaryRemarks) {
		this.summaryRemarks = summaryRemarks;
	}
	
	@Length(min=1, max=1, message="计划执行状态长度必须介于 1 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}