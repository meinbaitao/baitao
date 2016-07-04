/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.accident.entity;



import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 事故管理详情表Entity
 * @author pc
 * @version 2015-10-14
 */
public class AccidentManageDetail extends DataEntity<AccidentManageDetail> {
	
	private static final long serialVersionUID = 1L;
	private String id;
	private String accidentManageId;		// 事故管理表id
	private String boxNo;		// 箱号
	private String orderBomBaseId;//下料单
	private String materielNo;		// 材料编号
	private String materielName;		// 材料名称
	private String materielType;		// 材料料类型
	private long count;		// 数量
	private String area;		// 面积
	private double unitPrice; //单价
	private double price;		// 金额
	private String standardDesc;		// 规格-文本描述
	private String standardRadius;		// 规格-半径
	private String standardLong;		// 规格-长度
	private String standardWidth;		// 规格-宽度
	private String standardDepth;		// 规格-厚度/深度
	private String accidentTypeId;		// 事故类型id
	private String problemComment;		// 问题描述
	private String attchUrl;		// 附件地址
	private String solvePlan;		// 解决方案
	private String dataSubmit;		// 资料提交时间
	private String purchaseId;
	private String showtype;//页面显示事故名称
	private String xmb;//页面显示--项目部比例
	private String wl;//页面显示--物流比例
	private String jgc;//页面显示--加工厂比例
	private String sj; //页面显示--设计比例
	private String bz; //页面显示--班组比例
	private String gys; //页面显示--供应商比例

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAccidentManageId() {
		return accidentManageId;
	}

	public void setAccidentManageId(String accidentManageId) {
		this.accidentManageId = accidentManageId;
	}

	public String getBoxNo() {
		return boxNo;
	}

	public void setBoxNo(String boxNo) {
		this.boxNo = boxNo;
	}

	public String getMaterielNo() {
		return materielNo;
	}

	public void setMaterielNo(String materielNo) {
		this.materielNo = materielNo;
	}

	public String getMaterielName() {
		return materielName;
	}

	public void setMaterielName(String materielName) {
		this.materielName = materielName;
	}

	public String getMaterielType() {
		return materielType;
	}

	public void setMaterielType(String materielType) {
		this.materielType = materielType;
	}

	public long getCount() {
		return count;
	}

	public void setCount(long count) {
		this.count = count;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getStandardDesc() {
		return standardDesc;
	}

	public void setStandardDesc(String standardDesc) {
		this.standardDesc = standardDesc;
	}

	public String getStandardRadius() {
		return standardRadius;
	}

	public void setStandardRadius(String standardRadius) {
		this.standardRadius = standardRadius;
	}

	public String getStandardLong() {
		return standardLong;
	}

	public void setStandardLong(String standardLong) {
		this.standardLong = standardLong;
	}

	public String getStandardWidth() {
		return standardWidth;
	}

	public void setStandardWidth(String standardWidth) {
		this.standardWidth = standardWidth;
	}

	public String getStandardDepth() {
		return standardDepth;
	}

	public void setStandardDepth(String standardDepth) {
		this.standardDepth = standardDepth;
	}

	public String getAccidentTypeId() {
		return accidentTypeId;
	}

	public void setAccidentTypeId(String accidentTypeId) {
		this.accidentTypeId = accidentTypeId;
	}

	public String getProblemComment() {
		return problemComment;
	}

	public void setProblemComment(String problemComment) {
		this.problemComment = problemComment;
	}

	public String getAttchUrl() {
		return attchUrl;
	}

	public void setAttchUrl(String attchUrl) {
		this.attchUrl = attchUrl;
	}

	public String getSolvePlan() {
		return solvePlan;
	}

	public void setSolvePlan(String solvePlan) {
		this.solvePlan = solvePlan;
	}

	public String getDataSubmit() {
		return dataSubmit;
	}

	public void setDataSubmit(String dataSubmit) {
		this.dataSubmit = dataSubmit;
	}

	public String getShowtype() {
		return showtype;
	}

	public void setShowtype(String showtype) {
		this.showtype = showtype;
	}

	public String getOrderBomBaseId() {
		return orderBomBaseId;
	}

	public void setOrderBomBaseId(String orderBomBaseId) {
		this.orderBomBaseId = orderBomBaseId;
	}

	public String getXmb() {
		return xmb;
	}

	public void setXmb(String xmb) {
		this.xmb = xmb;
	}

	public String getWl() {
		return wl;
	}

	public void setWl(String wl) {
		this.wl = wl;
	}

	public String getJgc() {
		return jgc;
	}

	public void setJgc(String jgc) {
		this.jgc = jgc;
	}


	public String getSj() {
		return sj;
	}

	public void setSj(String sj) {
		this.sj = sj;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getGys() {
		return gys;
	}

	public void setGys(String gys) {
		this.gys = gys;
	}

	public String getPurchaseId() {
		return purchaseId;
	}

	public void setPurchaseId(String purchaseId) {
		this.purchaseId = purchaseId;
	}

}