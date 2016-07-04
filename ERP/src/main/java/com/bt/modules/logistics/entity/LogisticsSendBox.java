/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.logistics.entity;

import org.hibernate.validator.constraints.Length;

import com.bt.modules.orbom.entity.OrderBomBox;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 发货通知加工箱mappingEntity
 * @author xiaocai
 * @version 2015-10-15
 */
public class LogisticsSendBox extends DataEntity<LogisticsSendBox> {
	
	private static final long serialVersionUID = 1L;
	private String logisticsSendId;		// 发货通知单Id
	private String orderBomBoxId;		// 箱Id
	
	private LogisticsSend logisticsSend;
	private OrderBomBox orderBomBox;
	
	public LogisticsSendBox() {
		super();
	}

	public LogisticsSendBox(String id){
		super(id);
	}

	@Length(min=1, max=60, message="发货通知单Id长度必须介于 1 和 60 之间")
	public String getLogisticsSendId() {
		return logisticsSendId;
	}

	public void setLogisticsSendId(String logisticsSendId) {
		this.logisticsSendId = logisticsSendId;
	}
	
	@Length(min=1, max=60, message="箱Id长度必须介于 1 和 60 之间")
	public String getOrderBomBoxId() {
		return orderBomBoxId;
	}

	public void setOrderBomBoxId(String orderBomBoxId) {
		this.orderBomBoxId = orderBomBoxId;
	}

	public LogisticsSend getLogisticsSend() {
		return logisticsSend;
	}

	public void setLogisticsSend(LogisticsSend logisticsSend) {
		this.logisticsSend = logisticsSend;
	}

	public OrderBomBox getOrderBomBox() {
		return orderBomBox;
	}

	public void setOrderBomBox(OrderBomBox orderBomBox) {
		this.orderBomBox = orderBomBox;
	}
	
}