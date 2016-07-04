/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.finance.entity;

import java.util.Date;
import java.util.List;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.StringUtils;

/**
 * 结算料单mappingEntity
 * @author yhh
 * @version 2015-12-11
 */
public class ManufSettlementMapping extends DataEntity<ManufSettlementMapping> {
	
	private static final long serialVersionUID = 1L;
	private String settlementId;		// 结算单id
	private String orderBomId;		// 料单id
	private String settlementType;		//类别
	private String fcostdetail;	//小计
	
	private String orderBomNo ; //料单编号
	private String houseType ; //户型
	private String building ; //楼栋
	private String buildingDisplayName;
	private String orderType ; //料单类型
	private Date orderFinishDate ; //下单时间
	private String stoneColorName ; //石材类别
	
	private List<ManufSettlementDetail> detailList;		//结算加工项列表
	
	public ManufSettlementMapping() {
		super();
	}

	public ManufSettlementMapping(String id){
		super(id);
	}

	@Length(min=0, max=64, message="结算单id长度必须介于 0 和 64 之间")
	public String getSettlementId() {
		return settlementId;
	}

	public void setSettlementId(String settlementId) {
		this.settlementId = settlementId;
	}
	
	@Length(min=0, max=64, message="料单id长度必须介于 0 和 64 之间")
	public String getOrderBomId() {
		return orderBomId;
	}

	public void setOrderBomId(String value) {
		this.orderBomId = value;
	}

	public String getFcostdetail() {
		return fcostdetail;
	}

	public void setFcostdetail(String fcostdetail) {
		if(StringUtils.isNotBlank(fcostdetail)){
			this.fcostdetail = fcostdetail;
		}else{
			this.fcostdetail = "0";
		}
		
	}

	public List<ManufSettlementDetail> getDetailList() {
		return detailList;
	}

	public void setDetailList(List<ManufSettlementDetail> detailList) {
		this.detailList = detailList;
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
	
	public String getBuildingDisplayName() {
		return buildingDisplayName;
	}
	
	public void setBuildingDisplayName(String buildingDisplayName) {
		this.buildingDisplayName = buildingDisplayName;
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