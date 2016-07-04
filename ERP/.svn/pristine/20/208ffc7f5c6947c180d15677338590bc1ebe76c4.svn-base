/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.houseType.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 户型库管理Entity
 * @author xiaocai
 * @version 2016-04-29
 */
public class HouseType extends DataEntity<HouseType> {
	
	private static final long serialVersionUID = 1L;
	private String houseType;		// 户型
	private Double constructArea;		// 施工面积
	private Double laborArea;		// 劳务面积
	private Double laborBudgetSc;		// 劳务估值-石材
	private Double laborBudgetGj;		// 劳务估值-骨架
	
	public HouseType() {
		super();
	}

	public HouseType(String id){
		super(id);
	}

	@Length(min=1, max=100, message="户型长度必须介于 1 和 100 之间")
	public String getHouseType() {
		return houseType;
	}

	public void setHouseType(String houseType) {
		this.houseType = houseType;
	}
	
	public Double getConstructArea() {
		return constructArea;
	}

	public void setConstructArea(Double constructArea) {
		this.constructArea = constructArea;
	}
	
	public Double getLaborArea() {
		return laborArea;
	}

	public void setLaborArea(Double laborArea) {
		this.laborArea = laborArea;
	}
	
	public Double getLaborBudgetSc() {
		return laborBudgetSc;
	}

	public void setLaborBudgetSc(Double laborBudgetSc) {
		this.laborBudgetSc = laborBudgetSc;
	}
	
	public Double getLaborBudgetGj() {
		return laborBudgetGj;
	}

	public void setLaborBudgetGj(Double laborBudgetGj) {
		this.laborBudgetGj = laborBudgetGj;
	}
	
}