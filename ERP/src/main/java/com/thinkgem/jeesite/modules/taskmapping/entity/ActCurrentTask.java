/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taskmapping.entity;

import com.thinkgem.jeesite.modules.sys.entity.User;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 当前任务Entity
 * @author fjy
 * @version 2016-03-09
 */
public class ActCurrentTask extends DataEntity<ActCurrentTask> {
	
	private static final long serialVersionUID = 1L;
	private String userId;		// 用户ID
	private String entryId;		// 业务表实体的id
	private String businessTable;		// 业务表
	private String taskType;		// 任务类型，0：审核，1：签收

	private String businessType;
	private String keyWord;
	
	public ActCurrentTask() {
		super();
	}

	public ActCurrentTask(String id){
		super(id);
	}

	
	@Length(min=1, max=64, message="业务表实体的id长度必须介于 1 和 64 之间")
	public String getEntryId() {
		return entryId;
	}

	public void setEntryId(String entryId) {
		this.entryId = entryId;
	}
	
	@Length(min=1, max=128, message="业务表长度必须介于 1 和 128 之间")
	public String getBusinessTable() {
		return businessTable;
	}

	public void setBusinessTable(String businessTable) {
		this.businessTable = businessTable;
	}
	
	@Length(min=1, max=11, message="任务类型，0：审核，1：签收长度必须介于 1 和 11 之间")
	public String getTaskType() {
		return taskType;
	}

	public void setTaskType(String taskType) {
		this.taskType = taskType;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getBusinessType() {
		return businessType;
	}

	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}


}