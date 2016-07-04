/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taskmapping.entity;

import com.thinkgem.jeesite.modules.sys.entity.User;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 审批过任务Entity
 * @author fjy
 * @version 2016-03-09
 */
public class ActDoneTask extends DataEntity<ActDoneTask> {
	
	private static final long serialVersionUID = 1L;
	private String userId;		// 用户ID
	private String entryId;		// 业务表实体的id
	private String businessTable;		// 业务表
	
	public ActDoneTask() {
		super();
	}

	public ActDoneTask(String id){
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



	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}



}