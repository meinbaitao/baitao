/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.finance.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 劳务结算清单Entity
 * @author yhh
 * @version 2015-12-15
 */
public class LaborSettlementDetail extends DataEntity<LaborSettlementDetail> {
	
	private static final long serialVersionUID = 1L;
	private String settlementId;		// 结算id
	private String laborDetailId;		// 劳务明细id
	private String realWorkload;		// 实际劳务结算工程量
	private String settleWorkload;		// 最终劳务结算工程量
	private String price;		// 结算金额
	
	private String seriesnumber;		// 编号
	private String name;		// 名称
	private String standard;		// 规格
	private String length;		// 长
	private String width;		// 宽
	private String heigh;		// 高
	private String unit;		// 单位
	private String afterNumber;		// 合同量
	private String contractPrice;		// 合同价合计
	
	public LaborSettlementDetail() {
		super();
	}

	public LaborSettlementDetail(String id){
		super(id);
	}

	@Length(min=0, max=64, message="结算id长度必须介于 0 和 64 之间")
	public String getSettlementId() {
		return settlementId;
	}

	public void setSettlementId(String settlementId) {
		this.settlementId = settlementId;
	}
	
	@Length(min=0, max=64, message="劳务明细id长度必须介于 0 和 64 之间")
	public String getLaborDetailId() {
		return laborDetailId;
	}

	public void setLaborDetailId(String laborDetailId) {
		this.laborDetailId = laborDetailId;
	}
	
	@Length(min=0, max=18, message="实际劳务结算工程量长度必须介于 0 和 18 之间")
	public String getRealWorkload() {
		return realWorkload;
	}

	public void setRealWorkload(String realWorkload) {
		this.realWorkload = realWorkload;
	}
	
	@Length(min=0, max=18, message="最终劳务结算工程量长度必须介于 0 和 18 之间")
	public String getSettleWorkload() {
		return settleWorkload;
	}

	public void setSettleWorkload(String settleWorkload) {
		this.settleWorkload = settleWorkload;
	}
	
	@Length(min=0, max=18, message="结算金额长度必须介于 0 和 18 之间")
	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getSeriesnumber() {
		return seriesnumber;
	}

	public void setSeriesnumber(String seriesnumber) {
		this.seriesnumber = seriesnumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStandard() {
		return standard;
	}

	public void setStandard(String standard) {
		this.standard = standard;
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

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getAfterNumber() {
		return afterNumber;
	}

	public void setAfterNumber(String afterNumber) {
		this.afterNumber = afterNumber;
	}

	public String getContractPrice() {
		return contractPrice;
	}

	public void setContractPrice(String contractPrice) {
		this.contractPrice = contractPrice;
	}
	
}