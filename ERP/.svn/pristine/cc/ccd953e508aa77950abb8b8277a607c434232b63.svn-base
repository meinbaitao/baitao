/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.material.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 材料加工项表Entity
 * @author xiaocai
 * @version 2015-07-27
 */
public class MaterialProc extends DataEntity<MaterialProc> {
	
	private static final long serialVersionUID = 1L;
//	private String materialprocId;		// 材料加工项ID
	private String type;		// 加工类别
	private String name;		// 加工名称
	private String seriesnumber;		// 编号
	private String procspec; 	//加工规格
	private String prices; 		//加工价格
	private String unit;		// 单位
	private String taxrate;		//税率
	private String invoicetype; //发票类型
	private String comment;		// 备注
	private String pictureth;		// 图片
	private String isdeleted;		// 删除标识
	private String version;		// 版本
	private Date createdts;		// 创建时间
	private Date updatedts;		// 更新时间
	private String updateby;		// 更新人
	private String pricetype;	//区分数据(1:石材加工项;2:劳务价格)
	private String materialsurfdecoration; 	//饰面处理
	private String housetype;	//户型
	private String speclength;		// 长度
	private String specwidth;		// 宽度
	private String specheight;		// 高度
	
//	private String quantity;		// 密度
//	
//	
//	
//	
//	private String status;		// 流程状态
//	private String fworkid;		// 工作流ID
//	
//	private String yearprice;		// 年销售额
//	private String model;		// 材料规格
//	private String lossrate;		// 损耗率
//	private String materia;		// 材质
//	private String uweight;		// 单位重量
//	private String ltype;		// 类别
//	private String gmtype;		// 类型（1，石材，2，钢辅料信息）
//	private String calculation;		// 计算公式
	
	public MaterialProc() {
		super();
	}

	public MaterialProc(String id){
		super(id);
	}

	@Length(min=0, max=50, message="材料类别长度必须介于 0 和 50 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=100, message="名称长度必须介于 0 和 100 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=50, message="编号长度必须介于 0 和 50 之间")
	public String getSeriesnumber() {
		return seriesnumber;
	}

	public void setSeriesnumber(String seriesnumber) {
		this.seriesnumber = seriesnumber;
	}
	
	@Length(min=0, max=11, message="长度长度必须介于 0 和 11 之间")
	public String getSpeclength() {
		return speclength;
	}

	public void setSpeclength(String speclength) {
		this.speclength = speclength;
	}
	
	@Length(min=0, max=11, message="宽度长度必须介于 0 和 11 之间")
	public String getSpecwidth() {
		return specwidth;
	}

	public void setSpecwidth(String specwidth) {
		this.specwidth = specwidth;
	}
	
	@Length(min=0, max=11, message="高度长度必须介于 0 和 11 之间")
	public String getSpecheight() {
		return specheight;
	}

	public void setSpecheight(String specheight) {
		this.specheight = specheight;
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
	
	@Length(min=1, max=11, message="删除标识长度必须介于 1 和 11 之间")
	public String getIsdeleted() {
		return isdeleted;
	}

	public void setIsdeleted(String isdeleted) {
		this.isdeleted = isdeleted;
	}
	
	@Length(min=1, max=11, message="版本长度必须介于 1 和 11 之间")
	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
//	@NotNull(message="创建时间不能为空")
	public Date getCreatedts() {
		return createdts;
	}

	public void setCreatedts(Date createdts) {
		this.createdts = createdts;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
//	@NotNull(message="更新时间不能为空")
	public Date getUpdatedts() {
		return updatedts;
	}

	public void setUpdatedts(Date updatedts) {
		this.updatedts = updatedts;
	}
	
	@Length(min=0, max=50, message="更新人长度必须介于 0 和 50 之间")
	public String getUpdateby() {
		return updateby;
	}

	public void setUpdateby(String updateby) {
		this.updateby = updateby;
	}
	
	
	@Length(min=0, max=100, message="图片长度必须介于 0 和 100 之间")
	public String getPictureth() {
		return pictureth;
	}

	public void setPictureth(String pictureth) {
		this.pictureth = pictureth;
	}

//	public String getMaterialprocId() {
//		return materialprocId;
//	}
//
//	public void setMaterialprocId(String materialprocId) {
//		this.materialprocId = materialprocId;
//	}

	public String getProcspec() {
		return procspec;
	}

	public void setProcspec(String procspec) {
		this.procspec = procspec;
	}

	public String getTaxrate() {
		return taxrate;
	}

	public void setTaxrate(String taxrate) {
		this.taxrate = taxrate;
	}

	public String getInvoicetype() {
		return invoicetype;
	}

	public void setInvoicetype(String invoicetype) {
		this.invoicetype = invoicetype;
	}

	public String getPricetype() {
		return pricetype;
	}

	public void setPricetype(String pricetype) {
		this.pricetype = pricetype;
	}

	public String getMaterialsurfdecoration() {
		return materialsurfdecoration;
	}

	public void setMaterialsurfdecoration(String materialsurfdecoration) {
		this.materialsurfdecoration = materialsurfdecoration;
	}

	public String getHousetype() {
		return housetype;
	}

	public void setHousetype(String housetype) {
		this.housetype = housetype;
	}

	public String getPrices() {
		return prices;
	}

	public void setPrices(String prices) {
		this.prices = prices;
	}

	
}