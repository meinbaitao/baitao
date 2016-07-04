/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.material.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 物料信息Entity
 * @author pc
 * @version 2015-08-20
 */
public class Material extends DataEntity<Material> {
	
	private static final long serialVersionUID = 1L;
	private String id;
	private String type;		// 物料类型
	private String parentId;		// 上级物料ID
	private String name;		// 物料名称
	private String alias;		// 物料简称
	private String seriesNumber;		// 物料编号
	private String length;		// 长度
	private String width;		// 宽度
	private String height;		// 高度
	private String quantity;		// 密度
	private String unit;		// 单位
	private String comment;		// 备注
	private String status;		// 状态
	private String materia;		// 材质
	private String uweight;		// 单位重量
	private String model;		// 材料规格
	private String lossRate;		// 损耗率
	private String version;		// 版本
	
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Length(min=0, max=50, message="物料类型长度必须介于 0 和 50 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	
	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	@Length(min=0, max=100, message="物料名称长度必须介于 0 和 100 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=100, message="物料简称长度必须介于 0 和 100 之间")
	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}
	
	@Length(min=0, max=50, message="物料编号长度必须介于 0 和 50 之间")
	public String getSeriesNumber() {
		return seriesNumber;
	}

	public void setSeriesNumber(String seriesNumber) {
		this.seriesNumber = seriesNumber;
	}
	
	@Length(min=0, max=11, message="长度长度必须介于 0 和 11 之间")
	public String getLength() {
		return length;
	}

	public void setLength(String length) {
		this.length = length;
	}
	
	@Length(min=0, max=11, message="宽度长度必须介于 0 和 11 之间")
	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}
	
	@Length(min=0, max=11, message="高度长度必须介于 0 和 11 之间")
	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}
	
	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	
	@Length(min=0, max=50, message="单位长度必须介于 0 和 50 之间")
	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}
	
	@Length(min=0, max=200, message="备注长度必须介于 0 和 200 之间")
	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	
	@Length(min=0, max=10, message="状态长度必须介于 0和 10之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Length(min=0, max=100, message="材质长度必须介于 0 和 100 之间")
	public String getMateria() {
		return materia;
	}

	public void setMateria(String materia) {
		this.materia = materia;
	}
	
	public String getUweight() {
		return uweight;
	}

	public void setUweight(String uweight) {
		this.uweight = uweight;
	}
	
	@Length(min=0, max=100, message="材料规格长度必须介于 0 和 100 之间")
	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}
	
	public String getLossRate() {
		return lossRate;
	}

	public void setLossRate(String lossRate) {
		this.lossRate = lossRate;
	}
	
	@Length(min=0, max=11, message="版本长度必须介于 1 和 11 之间")
	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}
	
}