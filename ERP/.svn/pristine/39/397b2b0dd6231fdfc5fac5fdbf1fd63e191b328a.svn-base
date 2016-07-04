/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.cost.entity;

import java.util.List;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;

/**
 * 成本控量明细Entity
 * @author pc
 * @version 2015-09-06
 */
public class VolumeControlDetail extends DataEntity<VolumeControlDetail> {
	
	private static final long serialVersionUID = 1L;
	private String id;
	private String volumeControlId;		// 成本控量表ID
	private String type;		// 材料类型
	private String name;		// 材料名称
	private String alias;		// 材料简称
	private String seriesNumber;		// 材料编号
	private String length;		// 长度
	private String width;		// 宽度
	private String height;		// 高度
	private String model;		// 材料规格
	private String version;		// 版本
	private String lossRate;		// 损耗率
	private String quantityOne;		// 数量（不含损耗）
	private String lossAmount;		// 损耗量
	private String quantityTwo;		// 数量（含损耗）
	private String uweight;		// 单位重量
	private String unit;		// 单位
	private String comment;		// 备注
	private List<VolumeControlDetail> list;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	
	@Length(min=1, max=100, message="成本控量表ID长度必须介于 1 和 100 之间")
	public String getVolumeControlId() {
		return volumeControlId;
	}

	public void setVolumeControlId(String volumeControlId) {
		this.volumeControlId = volumeControlId;
	}
	
	//@ExcelField(title="材料类型", type=0, align=2)
	@Length(min=0, max=50, message="材料类型长度必须介于 0 和 50 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@ExcelField(title="材料名称", type=0, align=2,sort=4)
	@Length(min=0, max=100, message="材料名称长度必须介于 0 和 100 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	//@ExcelField(title="材料简称", type=0, align=2)
	@Length(min=0, max=100, message="材料简称长度必须介于 0 和 100 之间")
	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	@ExcelField(title="材料编号", type=0, align=2,sort=3)
	@Length(min=0, max=50, message="材料编号长度必须介于 0 和 50 之间")
	public String getSeriesNumber() {
		return seriesNumber;
	}

	public void setSeriesNumber(String seriesNumber) {
		this.seriesNumber = seriesNumber;
	}

	//@ExcelField(title="长度", type=0, align=2)
	@Length(min=0, max=11, message="长度长度必须介于 0 和 11 之间")
	public String getLength() {
		return length;
	}

	public void setLength(String length) {
		this.length = length;
	}

	//@ExcelField(title="宽度", type=0, align=2)
	@Length(min=0, max=11, message="宽度长度必须介于 0 和 11 之间")
	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	//@ExcelField(title="高度", type=0, align=2)
	@Length(min=0, max=11, message="高度长度必须介于 0 和 11 之间")
	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	@ExcelField(title="材料规格", type=0, align=2,sort=5)
	@Length(min=0, max=100, message="材料规格长度必须介于 0 和 100 之间")
	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	//@ExcelField(title="版本", type=0, align=2)
	@Length(min=0, max=11, message="版本长度必须介于 0 和 11 之间")
	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	@ExcelField(title="损耗率", type=0, align=2,sort=6)
	public String getLossRate() {
		return lossRate;
	}

	public void setLossRate(String lossRate) {
		this.lossRate = lossRate;
	}

	@ExcelField(title="数量(不含损耗)", type=0, align=2,sort=7)
	public String getQuantityOne() {
		return quantityOne;
	}

	public void setQuantityOne(String quantityOne) {
		this.quantityOne = quantityOne;
	}

	@ExcelField(title="损耗量", type=0, align=2,sort=8)
	public String getLossAmount() {
		return lossAmount;
	}

	public void setLossAmount(String lossAmount) {
		this.lossAmount = lossAmount;
	}

	@ExcelField(title="数量(含损耗)", type=0, align=2,sort=9)
	public String getQuantityTwo() {
		return quantityTwo;
	}

	public void setQuantityTwo(String quantityTwo) {
		this.quantityTwo = quantityTwo;
	}

	//@ExcelField(title="单位重量", type=0, align=2)
	public String getUweight() {
		return uweight;
	}

	public void setUweight(String uweight) {
		this.uweight = uweight;
	}

	@ExcelField(title="单位", type=0, align=2,sort=10)
	@Length(min=0, max=50, message="单位长度必须介于 0 和 50 之间")
	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	@ExcelField(title="备注", type=0, align=2,sort=11)
	@Length(min=0, max=200, message="备注长度必须介于 0 和 200 之间")
	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public List<VolumeControlDetail> getList() {
		return list;
	}

	public void setList(List<VolumeControlDetail> list) {
		this.list = list;
	}
	
}