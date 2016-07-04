/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.cost.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 成本控量Entity
 * @author pc
 * @version 2015-09-06
 */
public class VolumeControl extends DataEntity<VolumeControl> {
	
	private static final long serialVersionUID = 1L;
	private String id;
	private String subprojectId;		// 二级项目ID
	private String houseType;		// 户型
	private String building;		// 楼栋
	private String type;		// 控量类型
	private String status;		// 状态
//	private String workflowId;		// 工作流
//	private String workflowStatus;		// 工作流状态
	private String createUser;		// 创建者
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Length(min=0, max=100, message="二级项目ID长度必须介于 0 和 100 之间")
	public String getSubprojectId() {
		return subprojectId;
	}

	public void setSubprojectId(String subprojectId) {
		this.subprojectId = subprojectId;
	}
	
	@Length(min=0, max=50, message="户型长度必须介于 0 和 50 之间")
	public String getHouseType() {
		return houseType;
	}

	public void setHouseType(String houseType) {
		this.houseType = houseType;
	}
	
	@Length(min=0, max=100, message="楼栋长度必须介于 0 和 100 之间")
	public String getBuilding() {
		return building;
	}

	public void setBuilding(String building) {
		this.building = building;
	}
	
	@Length(min=0, max=100, message="控量类型长度必须介于 0 和 100 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=50, message="状态长度必须介于 0 和 50 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Length(min=0, max=64, message="创建者长度必须介于 0 和 64 之间")
	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	
}