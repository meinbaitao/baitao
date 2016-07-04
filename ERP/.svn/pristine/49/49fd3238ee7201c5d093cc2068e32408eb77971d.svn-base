/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.finance.entity;

import java.util.List;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 生产结算单Entity
 * @author yhh
 * @version 2015-10-15
 */
public class ManufSettlement extends DataEntity<ManufSettlement> {
	//付款状态
	public static final String Statue_Pay_YES = "1";
	public static final String Statue_Pay_NO = "0";
	
	private static final long serialVersionUID = 1L;
	private String factoryId;			//加工厂id
	private String seriesnumber;		// 结算单号
	private String price;		// 总金额
	private String projectId;		//项目id
	private String supplierName;		//加工厂名
	private String projectCode;		//项目名
	private String statue;		//付款状态
	private String paymentSeriesnumber;		//付款单号
	private String paymentType;		//付款方式
	private String paymentDate;		//付款日期

	private List<ManufSettlementMapping> detailList;

	private String search;		//搜索关键字
	
	public ManufSettlement() {
		super();
	}

	public ManufSettlement(String id){
		super(id);
	}

	@Length(min=0, max=64, message="加工结算单号长度必须介于 0 和 64 之间")
	public String getSeriesnumber() {
		return seriesnumber;
	}

	public void setSeriesnumber(String seriesnumber) {
		this.seriesnumber = seriesnumber;
	}
	

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getProjectCode() {
		return projectCode;
	}

	public void setProjectCode(String projectCode) {
		this.projectCode = projectCode;
	}

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public String getStatue() {
		return statue;
	}

	public void setStatue(String statue) {
		this.statue = statue;
	}

	public String getPaymentSeriesnumber() {
		return paymentSeriesnumber;
	}

	public void setPaymentSeriesnumber(String paymentSeriesnumber) {
		this.paymentSeriesnumber = paymentSeriesnumber;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getFactoryId() {
		return factoryId;
	}

	public void setFactoryId(String factoryId) {
		this.factoryId = factoryId;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public List<ManufSettlementMapping> getDetailList() {
		return detailList;
	}

	public void setDetailList(List<ManufSettlementMapping> detailList) {
		this.detailList = detailList;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}
	
}