/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.finance.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 运费结算Entity
 * @author yhh
 * @version 2015-12-01
 */
public class TransportationSettlement extends DataEntity<TransportationSettlement> {
	
	//付款状态
	public static final String Statue_Pay_YES = "1";
	public static final String Statue_Pay_NO = "0";
	
	private static final long serialVersionUID = 1L;
	private String logisticSend;		// 发货通知单
	private String logisticSendSeries;		// 发货通知单号
	private String seriesnumber;		// 物流编号
	private String supplier;		// 承运方
	private String supplierName;		// 承运方名字
	private String businessType;		// 业务版块
	private String boxNumber;		// 总箱数
	private String area;		// 面积
	private String realWeight;		// 发货重量
	private String theoryWeight;		// 理论重量
	private String length;		// 长度
	private String startArea;		// 起始地址
	private String transportationWay;		// 运输方式
	private String settlementWay;		// 计价方式
	private String driver;		// 司机
	private String driverTel;		// 司机电话
	private String loadPrice;		// 装货费
	private Integer unloadTimes;		// 卸货次数
	private String unloadPrice;		// 卸货单价
	private String unloadTotalPrice;		// 卸货总价
	private String settleWeight;		// 结算重量
	private String contractPrice;		// 合同单价
	private String sumPrice;		// 总金额
	private String tracer;		// 跟单员
	private String clerk;		// 物流文员
	private String singleCarPrice;		// 整车运输价
	private String splitPrice;		// 零担运输价
	private String splitLightPrice;		// 零担轻货运输价
	private String statue;		// 付款状态
	private String paymentSeriesnumber;		// 付款单
	private String paymentType;		// 付款方式
	private String paymentDate;		// 付款日期
	
	private String sendDate;		//发货日期
	private String factoryName;		//发货工厂
	private String receiver;		//收货人
	private String receivePlace;		//收货地址
	
	private String weigh;		//过磅重量
	private String projectId;		//项目id
	
	private String search;		//搜索关键字
	
	public TransportationSettlement() {
		super();
	}

	public TransportationSettlement(String id){
		super(id);
	}

	@Length(min=0, max=64, message="发货通知单号长度必须介于 0 和 64 之间")
	public String getLogisticSend() {
		return logisticSend;
	}

	public void setLogisticSend(String logisticSend) {
		this.logisticSend = logisticSend;
	}
	
	@Length(min=0, max=64, message="物流编号长度必须介于 0 和 64 之间")
	public String getSeriesnumber() {
		return seriesnumber;
	}

	public void setSeriesnumber(String seriesnumber) {
		this.seriesnumber = seriesnumber;
	}
	
	@Length(min=0, max=64, message="承运方长度必须介于 0 和 64 之间")
	public String getSupplier() {
		return supplier;
	}

	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}
	
	@Length(min=0, max=64, message="业务版块长度必须介于 0 和 64 之间")
	public String getBusinessType() {
		return businessType;
	}

	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}
	
	@Length(min=0, max=64, message="总箱数长度必须介于 0 和 64 之间")
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
	
	@Length(min=0, max=18, message="过磅重量长度必须介于 0 和 18 之间")
	public String getRealWeight() {
		return realWeight;
	}

	public void setRealWeight(String realWeight) {
		this.realWeight = realWeight;
	}
	
	@Length(min=0, max=18, message="理论重量长度必须介于 0 和 18 之间")
	public String getTheoryWeight() {
		return theoryWeight;
	}

	public void setTheoryWeight(String theoryWeight) {
		this.theoryWeight = theoryWeight;
	}
	
	@Length(min=0, max=18, message="长度长度必须介于 0 和 18 之间")
	public String getLength() {
		return length;
	}

	public void setLength(String length) {
		this.length = length;
	}
	
	@Length(min=0, max=32, message="起始地址长度必须介于 0 和 32 之间")
	public String getStartArea() {
		return startArea;
	}

	public void setStartArea(String startArea) {
		this.startArea = startArea;
	}
	
	@Length(min=0, max=64, message="运输方式长度必须介于 0 和 64 之间")
	public String getTransportationWay() {
		return transportationWay;
	}

	public void setTransportationWay(String transportationWay) {
		this.transportationWay = transportationWay;
	}
	
	@Length(min=0, max=64, message="计价方式长度必须介于 0 和 64 之间")
	public String getSettlementWay() {
		return settlementWay;
	}

	public void setSettlementWay(String settlementWay) {
		this.settlementWay = settlementWay;
	}
	
	@Length(min=0, max=64, message="司机长度必须介于 0 和 64 之间")
	public String getDriver() {
		return driver;
	}

	public void setDriver(String driver) {
		this.driver = driver;
	}
	
	@Length(min=0, max=64, message="司机电话长度必须介于 0 和 64 之间")
	public String getDriverTel() {
		return driverTel;
	}

	public void setDriverTel(String driverTel) {
		this.driverTel = driverTel;
	}
	
	@Length(min=0, max=64, message="装货费长度必须介于 0 和 64 之间")
	public String getLoadPrice() {
		return loadPrice;
	}

	public void setLoadPrice(String loadPrice) {
		this.loadPrice = loadPrice;
	}
	
	@Length(min=0, max=10, message="卸货次数长度必须介于 0 和 10 之间")
	public Integer getUnloadTimes() {
		return unloadTimes;
	}

	public void setUnloadTimes(Integer unloadTimes) {
		this.unloadTimes = unloadTimes;
	}
	
	@Length(min=0, max=64, message="卸货单价长度必须介于 0 和 64 之间")
	public String getUnloadPrice() {
		return unloadPrice;
	}

	public void setUnloadPrice(String unloadPrice) {
		this.unloadPrice = unloadPrice;
	}
	
	@Length(min=0, max=64, message="卸货总价长度必须介于 0 和 64 之间")
	public String getUnloadTotalPrice() {
		return unloadTotalPrice;
	}

	public void setUnloadTotalPrice(String unloadTotalPrice) {
		this.unloadTotalPrice = unloadTotalPrice;
	}
	
	@Length(min=0, max=64, message="结算重量长度必须介于 0 和 64 之间")
	public String getSettleWeight() {
		return settleWeight;
	}

	public void setSettleWeight(String settleWeight) {
		this.settleWeight = settleWeight;
	}
	
	@Length(min=0, max=18, message="合同单价长度必须介于 0 和 18 之间")
	public String getContractPrice() {
		return contractPrice;
	}

	public void setContractPrice(String contractPrice) {
		this.contractPrice = contractPrice;
	}
	
	@Length(min=0, max=18, message="总金额长度必须介于 0 和 18 之间")
	public String getSumPrice() {
		return sumPrice;
	}

	public void setSumPrice(String sumPrice) {
		this.sumPrice = sumPrice;
	}
	
	@Length(min=0, max=32, message="物料员长度必须介于 0 和 32 之间")
	public String getTracer() {
		return tracer;
	}

	public void setTracer(String tracer) {
		this.tracer = tracer;
	}
	
	@Length(min=0, max=32, message="文员长度必须介于 0 和 32 之间")
	public String getClerk() {
		return clerk;
	}

	public void setClerk(String clerk) {
		this.clerk = clerk;
	}
	
	@Length(min=0, max=18, message="整车运输价长度必须介于 0 和 18 之间")
	public String getSingleCarPrice() {
		return singleCarPrice;
	}

	public void setSingleCarPrice(String singleCarPrice) {
		this.singleCarPrice = singleCarPrice;
	}
	
	@Length(min=0, max=18, message="零担运输价长度必须介于 0 和 18 之间")
	public String getSplitPrice() {
		return splitPrice;
	}

	public void setSplitPrice(String splitPrice) {
		this.splitPrice = splitPrice;
	}
	
	@Length(min=0, max=18, message="零担轻货运输价长度必须介于 0 和 18 之间")
	public String getSplitLightPrice() {
		return splitLightPrice;
	}

	public void setSplitLightPrice(String splitLightPrice) {
		this.splitLightPrice = splitLightPrice;
	}
	
	@Length(min=0, max=8, message="付款状态长度必须介于 0 和 8 之间")
	public String getStatue() {
		return statue;
	}

	public void setStatue(String statue) {
		this.statue = statue;
	}

	public String getLogisticSendSeries() {
		return logisticSendSeries;
	}

	public void setLogisticSendSeries(String logisticSendSeries) {
		this.logisticSendSeries = logisticSendSeries;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
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

	public String getSendDate() {
		return sendDate;
	}

	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}

	public String getFactoryName() {
		return factoryName;
	}

	public void setFactoryName(String factoryName) {
		this.factoryName = factoryName;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getReceivePlace() {
		return receivePlace;
	}

	public void setReceivePlace(String receivePlace) {
		this.receivePlace = receivePlace;
	}

	public String getWeigh() {
		return weigh;
	}

	public void setWeigh(String weigh) {
		this.weigh = weigh;
	}

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}
	
}