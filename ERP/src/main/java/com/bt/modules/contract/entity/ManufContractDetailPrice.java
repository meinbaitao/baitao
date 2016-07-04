/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 加工清单价库Entity
 * @author yhh
 * @version 2015-08-12
 */
public class ManufContractDetailPrice extends DataEntity<ManufContractDetailPrice> {
	
	private static final long serialVersionUID = 1L;
	private String manufName;		// 加工工艺
	private String manufObject;		// 加工对象
	private String unit;		// 单位
	private String standardPrice;		// 标准价
	
	public ManufContractDetailPrice() {
		super();
	}

	public ManufContractDetailPrice(String id){
		super(id);
	}

	@Length(min=0, max=300, message="加工工艺长度必须介于 0 和 300 之间")
	public String getManufName() {
		return manufName;
	}

	public void setManufName(String manufName) {
		this.manufName = manufName;
	}
	
	@Length(min=0, max=64, message="加工对象长度必须介于 0 和 64 之间")
	public String getManufObject() {
		return manufObject;
	}

	public void setManufObject(String manufObject) {
		this.manufObject = manufObject;
	}
	
	@Length(min=0, max=20, message="单位长度必须介于 0 和 20 之间")
	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}
	
	public String getStandardPrice() {
		return standardPrice;
	}

	public void setStandardPrice(String standardPrice) {
		this.standardPrice = standardPrice;
	}
	
}