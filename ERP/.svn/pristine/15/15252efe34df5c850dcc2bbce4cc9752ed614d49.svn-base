/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.purchase.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 采购收发详细表Entity
 * @author xiaocai
 * @version 2015-08-07
 */
public class PurchaseSFDetail extends DataEntity<PurchaseSFDetail> {
	
	private static final long serialVersionUID = 1L;
	private String seriesnumber;	//编号
//	private String purchaseId;		// 采购订单ID(因为一次只能发一笔采购单且必须有采购单才能进行发货，所以关系为父子关系)
	private int fcount;		// 发货数量
	private double fweight;		// 发货过磅重量
	private int scount;		// 收货数量
	private double sweight;		// 收货过磅重量
	private String type;		//收发类型
	
	private Purchase purchase;			//采购单
//	private Supplier supp;		//供应商
//	private CommonPerson cp;	//常用联系人
//	private Date updatets;		// 更新时间
//	private String updateby;		// 更新人
//	private String delFalg;		// 删除标识
	
	
//	public String getPurchaseId() {
//		return purchaseId;
//	}
//	public void setPurchaseId(String purchaseId) {
//		this.purchaseId = purchaseId;
//	}
	public double getFweight() {
		return fweight;
	}
	public void setFweight(double fweight) {
		this.fweight = fweight;
	}
	public double getSweight() {
		return sweight;
	}
	public void setSweight(double sweight) {
		this.sweight = sweight;
	}
	public int getFcount() {
		return fcount;
	}
	public void setFcount(int fcount) {
		this.fcount = fcount;
	}
	public int getScount() {
		return scount;
	}
	public void setScount(int scount) {
		this.scount = scount;
	}
	public String getSeriesnumber() {
		return seriesnumber;
	}
	public void setSeriesnumber(String seriesnumber) {
		this.seriesnumber = seriesnumber;
	}
	public Purchase getPurchase() {
		return purchase;
	}
	public void setPurchase(Purchase purchase) {
		this.purchase = purchase;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
	
}