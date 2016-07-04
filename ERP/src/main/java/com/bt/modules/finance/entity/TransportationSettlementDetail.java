/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.finance.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 运费结算明细Entity
 * @author yhh
 * @version 2015-12-01
 */
public class TransportationSettlementDetail extends DataEntity<TransportationSettlementDetail> {
	
	private static final long serialVersionUID = 1L;
	private String fatherId;		// 结算单id
	private String seriesnumber;		// 编号
	private String orderBomNo;		//下料单号
	private String project;		// 项目
	private String projectName;		// 项目名
	private String projectCode;		// 项目名
	private String projectProvince;		// 项目所在省
	private String provinceName;		// 项目所在省
	private String projectCity;		// 项目所在市
	private String cityName;		// 项目所在市
	private String projectAddress;		// 项目地址
	private String factory;		// 加工厂
	private String factoryName;		// 加工厂
	private String requiredDate;		// 要求到货日期
	private String sendDate;		// 实际发货日期
	private String receiver;		// 收货人
	private String receiverName;		// 收货人
	private String receiverTel;		// 收货人电话
	private String boxNumber;		// 发货箱数
	private String area;		// 面积
	private String theoryWeight;		// 理论重量
	private String dividePrice;		// 分摊运费
	
	public TransportationSettlementDetail() {
		super();
	}

	public TransportationSettlementDetail(String id){
		super(id);
	}

	@Length(min=0, max=64, message="结算单id长度必须介于 0 和 64 之间")
	public String getFatherId() {
		return fatherId;
	}

	public void setFatherId(String fatherId) {
		this.fatherId = fatherId;
	}
	
	@Length(min=0, max=64, message="编号长度必须介于 0 和 64 之间")
	public String getSeriesnumber() {
		return seriesnumber;
	}

	public void setSeriesnumber(String seriesnumber) {
		this.seriesnumber = seriesnumber;
	}
	
	@Length(min=0, max=64, message="项目长度必须介于 0 和 64 之间")
	public String getProject() {
		return project;
	}

	public void setProject(String project) {
		this.project = project;
	}
	
	public String getProjectProvince() {
		return projectProvince;
	}

	public void setProjectProvince(String projectProvince) {
		this.projectProvince = projectProvince;
	}

	public String getProjectCity() {
		return projectCity;
	}

	public void setProjectCity(String projectCity) {
		this.projectCity = projectCity;
	}

	public String getProjectAddress() {
		return projectAddress;
	}

	public void setProjectAddress(String projectAddress) {
		this.projectAddress = projectAddress;
	}

	@Length(min=0, max=64, message="加工厂长度必须介于 0 和 64 之间")
	public String getFactory() {
		return factory;
	}

	public void setFactory(String factory) {
		this.factory = factory;
	}
	
	@Length(min=0, max=64, message="要求到货日期长度必须介于 0 和 64 之间")
	public String getRequiredDate() {
		return requiredDate;
	}

	public void setRequiredDate(String requiredDate) {
		this.requiredDate = requiredDate;
	}
	
	@Length(min=0, max=64, message="实际发货日期长度必须介于 0 和 64 之间")
	public String getSendDate() {
		return sendDate;
	}

	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}
	
	@Length(min=0, max=64, message="收货人长度必须介于 0 和 64 之间")
	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	
	@Length(min=0, max=64, message="收货人电话长度必须介于 0 和 64 之间")
	public String getReceiverTel() {
		return receiverTel;
	}

	public void setReceiverTel(String receiverTel) {
		this.receiverTel = receiverTel;
	}
	
	@Length(min=0, max=18, message="发货箱数长度必须介于 0 和 18 之间")
	public String getBoxNumber() {
		return boxNumber;
	}

	public void setBoxNumber(String boxNumber) {
		this.boxNumber = boxNumber;
	}
	
	@Length(min=0, max=18, message="面积长度必须介于 0 和 18 之间")
	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}
	
	@Length(min=0, max=18, message="理论重量长度必须介于 0 和 18 之间")
	public String getTheoryWeight() {
		return theoryWeight;
	}

	public void setTheoryWeight(String theoryWeight) {
		this.theoryWeight = theoryWeight;
	}
	
	@Length(min=0, max=18, message="分摊运费长度必须介于 0 和 18 之间")
	public String getDividePrice() {
		return dividePrice;
	}

	public void setDividePrice(String dividePrice) {
		this.dividePrice = dividePrice;
	}

	public String getProvinceName() {
		return provinceName;
	}

	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getOrderBomNo() {
		return orderBomNo;
	}

	public void setOrderBomNo(String orderBomNo) {
		this.orderBomNo = orderBomNo;
	}

	public String getFactoryName() {
		return factoryName;
	}

	public void setFactoryName(String factoryName) {
		this.factoryName = factoryName;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public String getProjectCode() {
		return projectCode;
	}

	public void setProjectCode(String projectCode) {
		this.projectCode = projectCode;
	}
	
}