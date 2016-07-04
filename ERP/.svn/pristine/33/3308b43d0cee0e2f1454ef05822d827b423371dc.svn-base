/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.orbom.entity;

import org.hibernate.validator.constraints.Length;

import com.bt.modules.utils.CommonStatus;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 下料单箱信息表Entity
 * @author ljp
 * @version 2015-08-07
 */
public class OrderBomBox extends DataEntity<OrderBomBox> {
	
	private static final long serialVersionUID = 1L;
	private String orderBomId;		// 下料单id
	private String boxNo;		// 箱号
	private String status;		// 箱状态：1-待入库，2-已入库，3-应发未发，4-待发货，5-待收货，6-已收货
	
	private String statusLab;	
	
	public OrderBomBox() {
		super();
	}

	public OrderBomBox(String id){
		super(id);
	}

	@Length(min=1, max=60, message="下料单id长度必须介于 1 和 60 之间")
	public String getOrderBomId() {
		return orderBomId;
	}

	public void setOrderBomId(String orderBomId) {
		this.orderBomId = orderBomId;
	}
	
	public String getBoxNo() {
		return boxNo;
	}

	public void setBoxNo(String boxNo) {
		this.boxNo = boxNo;
	}

	@Length(min=1, max=60, message="箱状态：1-待入库，2-已入库，3-应发未发，4-待发货，5-待收货，6-已收货长度必须介于 1 和 60 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
		this.statusLabUtils(status);
	}
	
	public String getStatusLab() {
		return statusLab;
	}

	/**
	 * 箱状态显示方法
	 * @param status
	 */
	public void statusLabUtils(String status){
		if(CommonStatus.BOX_YFWF.equals(status)){
			this.statusLab="<span style='color:red;'>(应发未发)</span>";
		}else{
			this.statusLab="";
		}
		
//		if(CommonStatus.BOX_DRK.equals(status)){
//			this.statusLab="待入库";
//		}else if(CommonStatus.BOX_YRK.equals(status)){
//			this.statusLab="已入库";
//		}else if(CommonStatus.BOX_YFWF.equals(status)){
//			this.statusLab="应发未发";
//		}else if(CommonStatus.BOX_DFH.equals(status)){
//			this.statusLab="待发货";
//		}else if(CommonStatus.BOX_DSH.equals(status)){
//			this.statusLab="待收货";
//		}else if(CommonStatus.BOX_YSH.equals(status)){
//			this.statusLab="已收货";
//		}
	}
}