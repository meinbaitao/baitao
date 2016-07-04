/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.logistics.entity;

import com.bt.modules.production.entity.Production;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 生产发货关系关联Entity
 * @author xiaocai
 * @version 2015-09-23
 */
public class ProductionLogisticsSendMapping extends DataEntity<ProductionLogisticsSendMapping> {
	
	private static final long serialVersionUID = 1L;
	private String productionId;		// 生产单ID
	private String logisticsSendId;		// 发货单ID
	
	private Production pro;
	private LogisticsSend ls;
	
	public ProductionLogisticsSendMapping() {
		super();
	}

	public ProductionLogisticsSendMapping(String id){
		super(id);
	}

	public String getProductionId() {
		return productionId;
	}

	public void setProductionId(String productionId) {
		this.productionId = productionId;
	}

	public String getLogisticsSendId() {
		return logisticsSendId;
	}

	public void setLogisticsSendId(String logisticsSendId) {
		this.logisticsSendId = logisticsSendId;
	}

	public Production getPro() {
		return pro;
	}

	public void setPro(Production pro) {
		this.pro = pro;
	}

	public LogisticsSend getLs() {
		return ls;
	}

	public void setLs(LogisticsSend ls) {
		this.ls = ls;
	}

	
}