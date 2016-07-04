/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.accident.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 事故分摊金额Entity
 * @author pc
 * @version 2015-10-14
 */
public class AccidentShareMoney extends DataEntity<AccidentShareMoney> {
	
	private static final long serialVersionUID = 1L;
	private String id;
	private String accidentManageId;		// 事故管理表id
	private String department;//部门
	private String name;		// 名称
	private String accidentPrice;		// 质量事故金额
	private String forfeitPrice;		// 罚款金额
	private String totalPrice;		// 合计金额
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Length(min=0, max=100, message="事故管理表id长度必须介于 0 和 100 之间")
	public String getAccidentManageId() {
		return accidentManageId;
	}

	public void setAccidentManageId(String accidentManageId) {
		this.accidentManageId = accidentManageId;
	}
	
	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	@Length(min=0, max=50, message="名称长度必须介于 0 和 50 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getAccidentPrice() {
		return accidentPrice;
	}

	public void setAccidentPrice(String accidentPrice) {
		this.accidentPrice = accidentPrice;
	}
	
	public String getForfeitPrice() {
		return forfeitPrice;
	}

	public void setForfeitPrice(String forfeitPrice) {
		this.forfeitPrice = forfeitPrice;
	}
	
	public String getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	
}