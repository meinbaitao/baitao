package com.bt.modules.orbom.entity;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 需求与下料单来源对应表Entity
 * @author ljp
 * @version 2015-08-24
 */
public class CreateOrderDemandMapping extends DataEntity<CreateOrderDemandMapping> {
	
	private static final long serialVersionUID = 1L;
	private String orderBomId;		// 对应的下料单id
	private String createDemandId;		// 产生采购/加工需求的id
	
	public CreateOrderDemandMapping() {
		super();
	}

	public CreateOrderDemandMapping(String id){
		super(id);
	}

	@Length(min=1, max=32, message="对应的下料单id长度必须介于 1 和 32 之间")
	public String getOrderBomId() {
		return orderBomId;
	}

	public void setOrderBomId(String orderBomId) {
		this.orderBomId = orderBomId;
	}
	
	@Length(min=1, max=32, message="产生采购/加工需求的id长度必须介于 1 和 32 之间")
	public String getCreateDemandId() {
		return createDemandId;
	}

	public void setCreateDemandId(String createDemandId) {
		this.createDemandId = createDemandId;
	}
	
}