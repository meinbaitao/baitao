/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.finance.entity;

import java.util.List;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 生产申请付款Entity
 * @author yhh
 * @version 2015-10-10
 */
public class Payment extends DataEntity<Payment> {
	
	private static final long serialVersionUID = 1L;
	
	public static final String RequiredPart_Transportation = "采购中心";
	public static final String RequiredPart_Manuf = "生产中心";
	public static final String PaymentSort_Transportation = "运费";
	public static final String PaymentSort_Manuf = "加工费";

	private String paymentNumber;		// 付款单号
	private String requiredPart;		// 申请部门
	private String requiredDate;		// 申请日期
	private String paymentObject;		// 收款单位
	private String paymentType;		// 付款方式
	private String requiredPrice;		// 申请金额
	private String punishType;		// 罚款类型
	private String punishPrice;		// 罚款金额
	private String paymentPrice;		// 付款金额
	private String verifyPart;		// 审核部门
	private String verifyPerson;		// 审核人
	private String verifyContent;		// 批复内容
	private String verifyDate;		// 审核时间
	private String preTaxPrice;			//税前总金额
	private String taxPrice;			//税金
	private String sort;			//付款分类
	
	private String punish;			//扣款说明
	private List<ManufSettlement> manufList;		//生产结算列表
	private List<TransportationSettlement> transportationList;		//运费结算列表
	public Payment() {
		super();
	}

	public Payment(String id){
		super(id);
	}

	@Length(min=0, max=64, message="付款单号长度必须介于 0 和 64 之间")
	public String getPaymentNumber() {
		return paymentNumber;
	}

	public void setPaymentNumber(String paymentNumber) {
		this.paymentNumber = paymentNumber;
	}
	
	@Length(min=0, max=64, message="申请部门长度必须介于 0 和 64 之间")
	public String getRequiredPart() {
		return requiredPart;
	}

	public void setRequiredPart(String requiredPart) {
		this.requiredPart = requiredPart;
	}
	
	@Length(min=0, max=32, message="申请日期长度必须介于 0 和 32 之间")
	public String getRequiredDate() {
		return requiredDate;
	}

	public void setRequiredDate(String requiredDate) {
		this.requiredDate = requiredDate;
	}
	
	@Length(min=0, max=64, message="收款单位长度必须介于 0 和 64 之间")
	public String getPaymentObject() {
		return paymentObject;
	}

	public void setPaymentObject(String paymentObject) {
		this.paymentObject = paymentObject;
	}
	
	@Length(min=0, max=32, message="付款方式长度必须介于 0 和 32 之间")
	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	
	@Length(min=0, max=18, message="申请金额长度必须介于 0 和 18 之间")
	public String getRequiredPrice() {
		return requiredPrice;
	}

	public void setRequiredPrice(String requiredPrice) {
		this.requiredPrice = requiredPrice;
	}
	
	@Length(min=0, max=32, message="罚款类型长度必须介于 0 和 32 之间")
	public String getPunishType() {
		return punishType;
	}

	public void setPunishType(String punishType) {
		this.punishType = punishType;
	}
	
	@Length(min=0, max=18, message="罚款金额长度必须介于 0 和 18 之间")
	public String getPunishPrice() {
		return punishPrice;
	}

	public void setPunishPrice(String punishPrice) {
		this.punishPrice = punishPrice;
	}
	
	@Length(min=0, max=18, message="付款金额长度必须介于 0 和 18 之间")
	public String getPaymentPrice() {
		return paymentPrice;
	}

	public void setPaymentPrice(String paymentPrice) {
		this.paymentPrice = paymentPrice;
	}
	
	@Length(min=0, max=64, message="审核部门长度必须介于 0 和 64 之间")
	public String getVerifyPart() {
		return verifyPart;
	}

	public void setVerifyPart(String verifyPart) {
		this.verifyPart = verifyPart;
	}
	
	@Length(min=0, max=32, message="审核人长度必须介于 0 和 32 之间")
	public String getVerifyPerson() {
		return verifyPerson;
	}

	public void setVerifyPerson(String verifyPerson) {
		this.verifyPerson = verifyPerson;
	}
	
	@Length(min=0, max=200, message="批复内容长度必须介于 0 和 200 之间")
	public String getVerifyContent() {
		return verifyContent;
	}

	public void setVerifyContent(String verifyContent) {
		this.verifyContent = verifyContent;
	}
	
	@Length(min=0, max=32, message="审核时间长度必须介于 0 和 32 之间")
	public String getVerifyDate() {
		return verifyDate;
	}

	public void setVerifyDate(String verifyDate) {
		this.verifyDate = verifyDate;
	}

	public String getPunish() {
		return punish;
	}

	public void setPunish(String punish) {
		this.punish = punish;
	}

	public String getPreTaxPrice() {
		return preTaxPrice;
	}

	public void setPreTaxPrice(String preTaxPrice) {
		this.preTaxPrice = preTaxPrice;
	}

	public String getTaxPrice() {
		return taxPrice;
	}

	public void setTaxPrice(String taxPrice) {
		this.taxPrice = taxPrice;
	}

	public List<ManufSettlement> getManufList() {
		return manufList;
	}

	public void setManufList(List<ManufSettlement> manufList) {
		this.manufList = manufList;
	}

	public List<TransportationSettlement> getTransportationList() {
		return transportationList;
	}

	public void setTransportationList(
			List<TransportationSettlement> transportationList) {
		this.transportationList = transportationList;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}
	
}