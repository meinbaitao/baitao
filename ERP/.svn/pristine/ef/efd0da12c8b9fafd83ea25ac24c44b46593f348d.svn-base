/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.finance.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.StringUtils;

/**
 * 料单结算加工项Entity
 * @author yhh
 * @version 2015-12-28
 */
public class ManufSettlementDetail extends DataEntity<ManufSettlementDetail> {
	
	private static final long serialVersionUID = 1L;
	private String mappingId;		// mappingId
	private String manufName;		// 加工项
	private String length;		// 长
	private String width;		// 宽
	private String heigh;		// 厚
	private String unit;		// 单位
	private String number;		// 数量
	private String price;		// 单价
	private String sum;		// 总金额
	
	public ManufSettlementDetail() {
		super();
	}

	public ManufSettlementDetail(String id){
		super(id);
	}

	@Length(min=0, max=64, message="加工项长度必须介于 0 和 64 之间")
	public String getManufName() {
		return manufName;
	}

	public void setManufName(String manufName) {
		this.manufName = manufName;
	}
	
	public String getLength() {
		return length;
	}

	public void setLength(String length) {
		this.length = length;
	}
	
	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}
	
	public String getHeigh() {
		return heigh;
	}

	public void setHeigh(String heigh) {
		this.heigh = heigh;
	}
	
	@Length(min=0, max=64, message="单位长度必须介于 0 和 64 之间")
	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}
	
	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		if(StringUtils.isNotBlank(number)){
			this.number = number;
		}else{
			this.number = "0";
		}
		
	}
	
	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		if(StringUtils.isNotBlank(price)){
			this.price = price;
		}else{
			this.price = "0";
		}
	}
	
	public String getSum() {
		return sum;
	}

	public void setSum(String sum) {
		if(StringUtils.isNotBlank(sum)){
			this.sum = sum;
		}else{
			this.sum = "0";
		}
	}

	public String getMappingId() {
		return mappingId;
	}

	public void setMappingId(String mappingId) {
		this.mappingId = mappingId;
	}
	
}