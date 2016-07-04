/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.finance.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 运费结算登记mappingEntity
 * @author yhh
 * @version 2015-10-13
 */
public class TransportationPaymentMapping extends DataEntity<TransportationPaymentMapping> {
	
	private static final long serialVersionUID = 1L;
	private String paymentId;		// 付款申请单id
	private String settlementId;		// 结算登记表id
	
	public TransportationPaymentMapping() {
		super();
	}

	public TransportationPaymentMapping(String id){
		super(id);
	}

	@Length(min=1, max=64, message="付款申请单id长度必须介于 1 和 64 之间")
	public String getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}
	
	@Length(min=1, max=64, message="结算登记表id长度必须介于 1 和 64 之间")
	public String getSettlementId() {
		return settlementId;
	}

	public void setSettlementId(String settlementId) {
		this.settlementId = settlementId;
	}
	
}