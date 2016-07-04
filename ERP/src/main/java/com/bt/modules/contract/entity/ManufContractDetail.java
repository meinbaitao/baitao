/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.entity;


import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;

/**
 * 生产合同明细表Entity
 * @author yhh
 * @version 2015-08-01
 */
public class ManufContractDetail extends ContractDetail<ManufContractDetail> {
	private static final long serialVersionUID = 1L;
	private String manufName;		// 加工项/产品名
	private String province;		//省份
	private String size;		//规格型号
	private String stoneType;		//石材类别
	private String standardName;		//集团对应名称
	private String manufDetail;		//加工内容
	private String model;		//加工大样
	private String unit;		// 单位
	private String standardPrice;		// 标准价
	private String contractPrice;		// 合同价
	private String priceWithTax;		// 合同价含税
	private String priceDifference;		//价格差
	private String remark;		// 备注
	
	public ManufContractDetail() {
		super();
	}

	public ManufContractDetail(String id){
		super(id);
	}
	
	@ExcelField(title="省份", type=0, align=2, sort=1)
	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	@ExcelField(title="加工项/产品名", type=0, align=2, sort=2)
	public String getManufName() {
		return manufName;
	}

	public void setManufName(String manufName) {
		this.manufName = manufName;
	}

	@ExcelField(title="石材品种", type=0, align=2, sort=3)
	public String getStoneType() {
		return stoneType;
	}

	public void setStoneType(String stoneType) {
		this.stoneType = stoneType;
	}
		
	@ExcelField(title="集团对应名称", type=0, align=2, sort=11)
	public String getStandardName() {
		return standardName;
	}

	public void setStandardName(String standardName) {
		this.standardName = standardName;
	}

	@ExcelField(title="规格", type=0, align=2, sort=20)
	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}
	
	@ExcelField(title="加工内容/工序", type=0, align=2, sort=21)
	public String getManufDetail() {
		return manufDetail;
	}

	public void setManufDetail(String manufDetail) {
		this.manufDetail = manufDetail;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	@ExcelField(title="单位", type=0, align=2, sort=31)
	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	@ExcelField(title="标准价", type=0, align=2, sort=41)
	public String getStandardPrice() {
		return standardPrice;
	}

	public void setStandardPrice(String standardPrice) {
		this.standardPrice = standardPrice;
	}

	@ExcelField(title="合同价", type=0, align=2, sort=51)
	public String getContractPrice() {
		return contractPrice;
	}

	public void setContractPrice(String contractPrice) {
		this.contractPrice = contractPrice;
	}

	public String getPriceWithTax() {
		return priceWithTax;
	}

	public void setPriceWithTax(String priceWithTax) {
		this.priceWithTax = priceWithTax;
	}
	
	@ExcelField(title="价格差", type=0, align=2, sort=61)
	public String getPriceDifference() {
		return priceDifference;
	}

	public void setPriceDifference(String priceDifference) {
		this.priceDifference= priceDifference;
	}

	@ExcelField(title="备注", type=0, align=2, sort=71)
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}



}