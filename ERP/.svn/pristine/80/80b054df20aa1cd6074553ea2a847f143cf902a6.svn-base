/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.logistics.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 发货清单Entity
 * @author yhh
 * @version 2015-11-05
 */
public class LogisticsDetail extends DataEntity<LogisticsDetail> {
	
	private static final long serialVersionUID = 1L;
	private String logisticsId;		// 发货通知单
	private String boxId;		//箱
	private String boxNo;		// 箱号
	private String materialNo;		// 物料编号
	private String materialType;		// 物料类型
	private String length;		// 长
	private String width;		// 宽
	private String height;		// 厚
	private String unit;		// 单位
	private String amount;		// 数量
	private String wareAmount;		// 入库数
	private String logisticsAmount;		// 发货数
	private String area;		// 面积
	private String volume;		//体积
	private String quality;		// 重量
	private String angleLeft;		// 左开角
	private String angleRight;		// 右开角
	private String angelMeter;		// 开角米数
	private String carveSlotMeter;		// 开槽米数
	private String waterSlotMeter;		// 滴水槽米数
	private String cutAngleCount;		// 切角个数
	private String turnAngleCount;		// 转角个数
	private String isArcLine;		// 是否为弧形线条
	private String waterProofArea;		// 防水面积
	private String rawArea;		// 胚料面积
	private String decorateArea;		// 饰面面积
	private String orientation;		//立面
	private String backCutMeter;		//背切米数
	private String reversedAngle;		//倒角米数
	private String angleAB;		//开角AB
	private String angleCD;		//开角CD
	
	private String orderBomId;		//所属下料单编号
	private String orderBomType;		//所属下料单类型
	private String orderDate;		//所属下料单下单时间
	private String factoryId;		//所属加工单
	private String faceProcess;		//所属饰面处理
	private String stoneTypeId;		//所属石材类型
	
	private String settlementHead;		//结算头数
	private String orderType;		//料单类别
	
	private String settlementType;		// 结算类别
	private String rawVolume;		// 胚料体积
	
	public LogisticsDetail() {
		super();
	}

	public LogisticsDetail(String id){
		super(id);
	}

	@Length(min=1, max=64, message="发货通知单长度必须介于 1 和 64 之间")
	public String getLogisticsId() {
		return logisticsId;
	}

	public void setLogisticsId(String logisticsId) {
		this.logisticsId = logisticsId;
	}
	
	public String getBoxId() {
		return boxId;
	}

	public void setBoxId(String boxId) {
		this.boxId = boxId;
	}

	@Length(min=0, max=64, message="箱号长度必须介于 0 和 64 之间")
	public String getBoxNo() {
		return boxNo;
	}

	public void setBoxNo(String boxNo) {
		this.boxNo = boxNo;
	}
	
	@Length(min=0, max=64, message="物料编号长度必须介于 0 和 64 之间")
	public String getMaterialNo() {
		return materialNo;
	}

	public void setMaterialNo(String materialNo) {
		this.materialNo = materialNo;
	}
	
	@Length(min=0, max=64, message="物料类型长度必须介于 0 和 64 之间")
	public String getMaterialType() {
		return materialType;
	}

	public void setMaterialType(String materialType) {
		this.materialType = materialType;
	}
	
	@Length(min=0, max=32, message="单位长度必须介于 0 和 32 之间")
	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}
	
	@Length(min=0, max=18, message="数量长度必须介于 0 和 18 之间")
	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}
	
	@Length(min=0, max=18, message="入库数长度必须介于 0 和 18 之间")
	public String getWareAmount() {
		return wareAmount;
	}

	public void setWareAmount(String wareAmount) {
		this.wareAmount = wareAmount;
	}
	
	@Length(min=0, max=18, message="发货数长度必须介于 0 和 18 之间")
	public String getLogisticsAmount() {
		return logisticsAmount;
	}

	public void setLogisticsAmount(String logisticsAmount) {
		this.logisticsAmount = logisticsAmount;
	}
	
	@Length(min=0, max=18, message="面积长度必须介于 0 和 18 之间")
	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}
	
	@Length(min=0, max=18, message="重量长度必须介于 0 和 18 之间")
	public String getQuality() {
		return quality;
	}

	public void setQuality(String quality) {
		this.quality = quality;
	}
	
	@Length(min=0, max=18, message="左开角长度必须介于 0 和 18 之间")
	public String getAngleLeft() {
		return angleLeft;
	}

	public void setAngleLeft(String angleLeft) {
		this.angleLeft = angleLeft;
	}
	
	@Length(min=0, max=18, message="右开角长度必须介于 0 和 18 之间")
	public String getAngleRight() {
		return angleRight;
	}

	public void setAngleRight(String angleRight) {
		this.angleRight = angleRight;
	}
	
	@Length(min=0, max=18, message="开角米数长度必须介于 0 和 18 之间")
	public String getAngelMeter() {
		return angelMeter;
	}

	public void setAngelMeter(String angelMeter) {
		this.angelMeter = angelMeter;
	}
	
	@Length(min=0, max=18, message="开槽米数长度必须介于 0 和 18 之间")
	public String getCarveSlotMeter() {
		return carveSlotMeter;
	}

	public void setCarveSlotMeter(String carveSlotMeter) {
		this.carveSlotMeter = carveSlotMeter;
	}
	
	@Length(min=0, max=18, message="滴水槽米数长度必须介于 0 和 18 之间")
	public String getWaterSlotMeter() {
		return waterSlotMeter;
	}

	public void setWaterSlotMeter(String waterSlotMeter) {
		this.waterSlotMeter = waterSlotMeter;
	}
	
	@Length(min=0, max=50, message="切角个数长度必须介于 0 和 50 之间")
	public String getCutAngleCount() {
		return cutAngleCount;
	}

	public void setCutAngleCount(String cutAngleCount) {
		this.cutAngleCount = cutAngleCount;
	}
	
	@Length(min=0, max=50, message="转角个数长度必须介于 0 和 50 之间")
	public String getTurnAngleCount() {
		return turnAngleCount;
	}

	public void setTurnAngleCount(String turnAngleCount) {
		this.turnAngleCount = turnAngleCount;
	}
	
	@Length(min=0, max=8, message="是否为弧形线条长度必须介于 0 和 8 之间")
	public String getIsArcLine() {
		return isArcLine;
	}

	public void setIsArcLine(String isArcLine) {
		this.isArcLine = isArcLine;
	}
	
	@Length(min=0, max=30, message="防水面积长度必须介于 0 和 30 之间")
	public String getWaterProofArea() {
		return waterProofArea;
	}

	public void setWaterProofArea(String waterProofArea) {
		this.waterProofArea = waterProofArea;
	}
	
	@Length(min=0, max=30, message="胚料面积长度必须介于 0 和 30 之间")
	public String getRawArea() {
		return rawArea;
	}

	public void setRawArea(String rawArea) {
		this.rawArea = rawArea;
	}
	
	@Length(min=0, max=30, message="饰面面积长度必须介于 0 和 30 之间")
	public String getDecorateArea() {
		return decorateArea;
	}

	public void setDecorateArea(String decorateArea) {
		this.decorateArea = decorateArea;
	}

	public String getOrientation() {
		return orientation;
	}

	public void setOrientation(String orientation) {
		this.orientation = orientation;
	}

	public String getOrderBomType() {
		return orderBomType;
	}

	public void setOrderBomType(String orderBomType) {
		this.orderBomType = orderBomType;
	}

	public String getVolume() {
		return volume;
	}

	public void setVolume(String volume) {
		this.volume = volume;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getBackCutMeter() {
		return backCutMeter;
	}

	public void setBackCutMeter(String backCutMeter) {
		this.backCutMeter = backCutMeter;
	}

	public String getLength() {
		return length;
	}

	public void setLength(String length) {
		this.length = length;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getReversedAngle() {
		return reversedAngle;
	}

	public void setReversedAngle(String reversedAngle) {
		this.reversedAngle = reversedAngle;
	}

	public String getOrderBomId() {
		return orderBomId;
	}

	public void setOrderBomId(String orderBomId) {
		this.orderBomId = orderBomId;
	}

	public String getFactoryId() {
		return factoryId;
	}

	public void setFactoryId(String factoryId) {
		this.factoryId = factoryId;
	}

	public String getAngleAB() {
		return angleAB;
	}

	public void setAngleAB(String angleAB) {
		this.angleAB = angleAB;
	}

	public String getAngleCD() {
		return angleCD;
	}

	public void setAngleCD(String angleCD) {
		this.angleCD = angleCD;
	}

	public String getFaceProcess() {
		return faceProcess;
	}

	public void setFaceProcess(String faceProcess) {
		this.faceProcess = faceProcess;
	}

	public String getSettlementHead() {
		return settlementHead;
	}

	public void setSettlementHead(String settlementHead) {
		this.settlementHead = settlementHead;
	}

	public String getStoneTypeId() {
		return stoneTypeId;
	}

	public void setStoneTypeId(String stoneTypeId) {
		this.stoneTypeId = stoneTypeId;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public String getSettlementType() {
		return settlementType;
	}

	public void setSettlementType(String settlementType) {
		this.settlementType = settlementType;
	}
		
	public String getRawVolume() {
		return rawVolume;
	}
	public void setRawVolume(String rawVolume) {
		this.rawVolume = rawVolume;
	}
}