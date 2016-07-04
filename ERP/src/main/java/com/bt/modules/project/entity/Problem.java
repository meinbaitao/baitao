/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.project.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 项目问题明细Entity
 * @author xjp
 * @version 2015-09-14
 */
public class Problem extends DataEntity<Problem> {
	
	private static final long serialVersionUID = 1L;
	private String weeklyId;		// 周报ID
	private String problemType;		// 问题类型
	private String upWeekProblem;		// 上周问题
	private String thisWeekStatus;		// 本周完成情况
	private String remarksProblem;		// 问题解决描述
	private String thisWeekAdjust;		// 本周需协调解决问题
	private String solution;		// 上周问题
	
	public Problem() {
		super();
	}

	public Problem(String id){
		super(id);
	}

	@Length(min=0, max=64, message="周报ID长度必须介于 0 和 64 之间")
	public String getWeeklyId() {
		return weeklyId;
	}

	public void setWeeklyId(String weeklyId) {
		this.weeklyId = weeklyId;
	}
	
	@Length(min=0, max=64, message="问题类型长度必须介于 0 和 64 之间")
	public String getProblemType() {
		return problemType;
	}

	public void setProblemType(String problemType) {
		this.problemType = problemType;
	}
	
	@Length(min=0, max=64, message="上周问题长度必须介于 0 和 64 之间")
	public String getUpWeekProblem() {
		return upWeekProblem;
	}

	public void setUpWeekProblem(String upWeekProblem) {
		this.upWeekProblem = upWeekProblem;
	}
	
	@Length(min=1, max=1, message="本周完成情况长度必须介于 1 和 1 之间")
	public String getThisWeekStatus() {
		return thisWeekStatus;
	}

	public void setThisWeekStatus(String thisWeekStatus) {
		this.thisWeekStatus = thisWeekStatus;
	}
	
	@Length(min=0, max=255, message="问题解决描述长度必须介于 0 和 255 之间")
	public String getRemarksProblem() {
		return remarksProblem;
	}

	public void setRemarksProblem(String remarksProblem) {
		this.remarksProblem = remarksProblem;
	}
	
	@Length(min=0, max=64, message="本周需协调解决问题长度必须介于 0 和 64 之间")
	public String getThisWeekAdjust() {
		return thisWeekAdjust;
	}

	public void setThisWeekAdjust(String thisWeekAdjust) {
		this.thisWeekAdjust = thisWeekAdjust;
	}
	
	@Length(min=0, max=64, message="上周问题长度必须介于 0 和 64 之间")
	public String getSolution() {
		return solution;
	}

	public void setSolution(String solution) {
		this.solution = solution;
	}
	
}