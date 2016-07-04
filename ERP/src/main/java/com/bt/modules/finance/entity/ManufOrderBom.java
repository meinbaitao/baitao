package com.bt.modules.finance.entity;


import java.util.Date;

import com.thinkgem.jeesite.common.persistence.DataEntity;


public class ManufOrderBom extends DataEntity<ManufSettlement>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String orderBomId;
	private String projectId;
	private String factoryId;
	private String settlementType;
	
	private String orderBomNo ; //料单编号
	private String houseType ; //户型
	private String building ; //楼栋
	private String orderType ; //料单类型
	private Date orderFinishDate ; //下单时间
	private String stoneColorName ; //石材类别
	
	public ManufOrderBom(){
		
	}
	
	public String getOrderBomId() {
		return orderBomId;
	}
	public void setOrderBomId(String orderBomId) {
		this.orderBomId = orderBomId;
	}
	public String getProjectId() {
		return projectId;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	public String getFactoryId() {
		return factoryId;
	}
	public void setFactoryId(String factoryId) {
		this.factoryId = factoryId;
	}

	public String getSettlementType() {
		return settlementType;
	}

	public void setSettlementType(String settlementType) {
		this.settlementType = settlementType;
	}

	public String getOrderBomNo() {
		return orderBomNo;
	}

	public void setOrderBomNo(String orderBomNo) {
		this.orderBomNo = orderBomNo;
	}

	public String getHouseType() {
		return houseType;
	}

	public void setHouseType(String houseType) {
		this.houseType = houseType;
	}

	public String getBuilding() {
		return building;
	}

	public void setBuilding(String building) {
		this.building = building;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public Date getOrderFinishDate() {
		return orderFinishDate;
	}

	public void setOrderFinishDate(Date orderFinishDate) {
		this.orderFinishDate = orderFinishDate;
	}

	public String getStoneColorName() {
		return stoneColorName;
	}

	public void setStoneColorName(String stoneColorName) {
		this.stoneColorName = stoneColorName;
	}
	
	
}
