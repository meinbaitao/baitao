/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.entity;

import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;

/**
 * purchasingEntity
 * 
 * @author yhh
 * @version 2015-08-11
 */
public class PurchasingContractDetail extends
		ContractDetail<PurchasingContractDetail> {
	private static final long serialVersionUID = 1L;
	private String materielNo; // 物料编号
	private String materielName; // 物料名称
	private String materielType; // 类别
	private String brand; // 品牌
	private String stoneType; // 石材品种
	private String length; // 长
	private String width; // 宽
	private String height; // 高
	private String model; // 加工大样
	private String materielSize; // 物料规格
	private String unit; // 单位
	private String price; // 单价
	private String contractPrice; // 合同价
	private String priceWithTax; // 合同价含税
	private String priceDifference; // 价格差
	private String remark; // 备注
	private String isInProvince; // 是否省内

	private PurchasingContractBase purchasingContractBase; // 采购合同

	public PurchasingContractDetail() {
		super();
	}

	public PurchasingContractDetail(String id) {
		super(id);
	}

	@ExcelField(title = "物料编号", type = 0, align = 2, sort = 1)
	public String getMaterielNo() {
		return materielNo;
	}

	public void setMaterielNo(String materielNo) {
		this.materielNo = materielNo;
	}

	@ExcelField(title = "物料名称", type = 0, align = 2, sort = 2)
	public String getMaterielName() {
		return materielName;
	}

	public void setMaterielName(String materielName) {
		this.materielName = materielName;
	}

	@ExcelField(title = "类别", type = 0, align = 2, sort = 3)
	public String getMaterielType() {
		return materielType;
	}

	public void setMaterielType(String materielType) {
		this.materielType = materielType;
	}

	@ExcelField(title = "品牌", type = 0, align = 2, sort = 4)
	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	@ExcelField(title = "石材品种", type = 0, align = 2, sort = 5)
	public String getStoneType() {
		return stoneType;
	}

	public void setStoneType(String stoneType) {
		this.stoneType = stoneType;
	}

	@ExcelField(title = "规格型号", type = 0, align = 2, sort = 6)
	public String getMaterielSize() {
		return materielSize;
	}

	public void setMaterielSize(String materielSize) {
		this.materielSize = materielSize;
	}

	@ExcelField(title = "长", type = 0, align = 2, sort = 7)
	public String getLength() {
		return length;
	}

	public void setLength(String length) {
		this.length = length;
	}

	@ExcelField(title = "宽", type = 0, align = 2, sort = 8)
	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	@ExcelField(title = "高", type = 0, align = 2, sort = 9)
	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	@ExcelField(title = "单位", type = 0, align = 2, sort = 11)
	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	@ExcelField(title = "标准价", type = 0, align = 2, sort = 13)
	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	@ExcelField(title = "合同价", type = 0, align = 2, sort = 14)
	public String getContractPrice() {
		return contractPrice;
	}

	public void setContractPrice(String contractPrice) {
		this.contractPrice = contractPrice;
	}

	// @ExcelField(title="合同价(含税)", type=0, align=2, sort=13)
	public String getPriceWithTax() {
		return priceWithTax;
	}

	public void setPriceWithTax(String priceWithTax) {
		this.priceWithTax = priceWithTax;
	}

	@ExcelField(title = "价格差", type = 0, align = 2, sort = 15)
	public String getPriceDifference() {
		return priceDifference;
	}

	public void setPriceDifference(String priceDifference) {
		this.priceDifference = priceDifference;
	}

	@ExcelField(title = "备注", type = 0, align = 2, sort = 25)
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public PurchasingContractBase getPurchasingContractBase() {
		return purchasingContractBase;
	}

	public void setPurchasingContractBase(
			PurchasingContractBase purchasingContractBase) {
		this.purchasingContractBase = purchasingContractBase;
	}

	@ExcelField(title = "价格类型(1:省内,2:省外,3:全国)", type = 0, align = 3, sort = 12)
	public String getIsInProvince() {
		return isInProvince;
	}

	// 获取价格类型显示名称
	public String getIsInProvinceDpName() {
		return DictUtils
				.getDictLabel(this.isInProvince, "price_type", "未知价格类型");
	}

	public void setIsInProvince(String isInProvince) {
		this.isInProvince = isInProvince;
	}

}