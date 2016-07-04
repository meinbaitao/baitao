/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.orbom.entity;

import java.util.List;

import org.hibernate.validator.constraints.Length;

import com.bt.modules.project.entity.Project;
import com.bt.modules.project.entity.Subproject;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 下料单明细Entity
 * @author pc
 * @version 2015-09-09
 */
public class OrderBomDetail extends DataEntity<OrderBomDetail> {
	
	private static final long serialVersionUID = 1L;
	private String id;
	private String orderBomId;					// 对应的下料单id
	private String materielId;					// 物料ID
	private String outsideWallOrientation;		// 立面(方向)
	private String boxNo;						// 箱号
	private String materielNo;					// 物料编号
	private String materielName;				// 物料名称
	private String materielType;				// 物料类型
	private String count;						// 数量
	private String standardDesc;				// 规格-文本描述
	private String standardRadius;				// 规格-半径
	private String standardLong;				// 规格-长度
	private String standardWidth;				// 规格-宽度
	private String standardDepth;				// 规格-厚度/深度
	private String standardL1;				    // 规格-L1
	private String standardL2;				    // 规格-L2
	private String leftOpenAngle;				// 左开角
	private String rightOpenAngle;				// 右开角
	private String openAngleMOne;				// 开角米数A/B
	private String openAngleMTwo;				// 开角米数C/D
	private String openSlotM;					// 开槽米数
	private String openLightM;					// 见光米数
	private String assemblyDiagramNo;			// 组装图号
	private String processChartNo;				// 加工图号
	private String hasWaterSlot;				// 滴水槽是否做
	private String waterSlotM;					// 滴水槽米数
	private String hasBackCut;					// 是否要背切
	private String reversedAngleCount;			// 倒边角数量
	private String lineDensity;					// 线密度
	private String wdight;						// 重量
	private String unitWeight;					// 单位重量
	private String volume;						// 体积
	private String area;						// 面积
	private String unit;						// 单位
	private String size;						// 规格尺寸
	private String reversedAngleLong;			// 倒角长度
	private String cutTurnLeft;					// 切角/转头方向（左或右）
	private String cutTurnRight;				// 切角/转头方向（左或右）
	private String cutAngleCount;				// 切角个数
	private String turnAngleCount;				// 转角个数
	private String remark;						// 备注
	private String isFamilyLine;				// 是否为弧形线条
	private String waterproofArea;				// '防水面积',
	private String rohlingArea;					// '胚料面积',
	private String facingArea;					// '饰面面积',
	private String materials;					// 材质
	private String polish;						// 抛光米数
	private String backCutCount;				// 背切数量
	
	private String rohlingLong;					// 胚料尺寸-长
	private String rohlingWidth;				// 胚料尺寸-宽
	private String rohlingDepth;				// 胚料尺寸-厚
	
	private String rohlingVolume;					// '胚料体积',
	private OrderBomBase obb;
	private Project pro;
	
	
	private OrderBomBase orderBomBase;	//下料单
	private OrderBomBox orderBomBox;	//下料单-箱
	private Project project;			//一级项目
	private Subproject sub;				//二级项目
	private List<String> boxNos; 	
	
	
	
	
	public List<String> getBoxNos() {
		return boxNos;
	}
	public void setBoxNos(List<String> boxNos) {
		this.boxNos = boxNos;
	}
	public OrderBomBase getObb() {
		return obb;
	}
	public void setObb(OrderBomBase obb) {
		this.obb = obb;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Length(min=0, max=100, message="对应的下料单id长度必须介于 0 和 100 之间")
	public String getOrderBomId() {
		return orderBomId;
	}

	public void setOrderBomId(String orderBomId) {
		this.orderBomId = orderBomId;
	}
	
	@Length(min=0, max=100, message="物料ID长度必须介于 0 和 100 之间")
	public String getMaterielId() {
		return materielId;
	}

	public void setMaterielId(String materielId) {
		this.materielId = materielId;
	}
	
	@Length(min=0, max=30, message="立面(方向)长度必须介于 0 和 30 之间")
	public String getOutsideWallOrientation() {
		return outsideWallOrientation;
	}

	public void setOutsideWallOrientation(String outsideWallOrientation) {
		this.outsideWallOrientation = outsideWallOrientation;
	}
	
	@Length(min=0, max=50, message="箱号长度必须介于 0 和 50 之间")
	public String getBoxNo() {
		return boxNo;
	}

	public void setBoxNo(String boxNo) {
		this.boxNo = boxNo;
	}
	
	@Length(min=0, max=100, message="物料编号长度必须介于 0 和 100 之间")
	public String getMaterielNo() {
		return materielNo;
	}

	public void setMaterielNo(String materielNo) {
		this.materielNo = materielNo;
	}
	
	@Length(min=0, max=50, message="物料类型长度必须介于 0 和 50 之间")
	public String getMaterielType() {
		return materielType;
	}

	public void setMaterielType(String materielType) {
		this.materielType = materielType;
	}
	
	@Length(min=0, max=50, message="数量长度必须介于 0 和 50 之间")
	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}
	
	@Length(min=0, max=300, message="规格-文本描述长度必须介于 0 和 300 之间")
	public String getStandardDesc() {
		return standardDesc;
	}

	public void setStandardDesc(String standardDesc) {
		this.standardDesc = standardDesc;
	}
	
	@Length(min=0, max=50, message="规格-半径长度必须介于 0 和 50 之间")
	public String getStandardRadius() {
		return standardRadius;
	}

	public void setStandardRadius(String standardRadius) {
		this.standardRadius = standardRadius;
	}
	
	@Length(min=0, max=50, message="规格-长度长度L1L2必须介于 0 和 50 之间")
	public String getStandardLong() {
		return standardLong;
	}

	public void setStandardLong(String standardLong) {
		this.standardLong = standardLong;
	}
	
	@Length(min=0, max=50, message="规格-宽度长度L1L2必须介于 0 和 50 之间")
	public String getStandardWidth() {
		return standardWidth;
	}

	public void setStandardWidth(String standardWidth) {
		this.standardWidth = standardWidth;
	}
	
	@Length(min=0, max=50, message="规格-厚度/深度长度L1L2必须介于 0 和 50 之间")
	public String getStandardDepth() {
		return standardDepth;
	}

	public void setStandardDepth(String standardDepth) {
		this.standardDepth = standardDepth;
	}
	
	@Length(min=0, max=50, message="规格-厚度/深度长度L1L2必须介于 0 和 50 之间")
	public String getStandardL1() {
		return standardL1;
	}

	public void setStandardL1(String standardL1) {
		this.standardL1 = standardL1;
	}
	
	@Length(min=0, max=50, message="规格-厚度/深度长度L1L2必须介于 0 和 50 之间")
	public String getStandardL2() {
		return standardL2;
	}

	public void setStandardL2(String standardL2) {
		this.standardL2 = standardL2;
	}
	
	@Length(min=0, max=10, message="左开角长度必须介于 0 和 10 之间")
	public String getLeftOpenAngle() {
		return leftOpenAngle;
	}

	public void setLeftOpenAngle(String leftOpenAngle) {
		this.leftOpenAngle = leftOpenAngle;
	}
	
	@Length(min=0, max=10, message="右开角长度必须介于 0 和 10 之间")
	public String getRightOpenAngle() {
		return rightOpenAngle;
	}

	public void setRightOpenAngle(String rightOpenAngle) {
		this.rightOpenAngle = rightOpenAngle;
	}
	
	public String getOpenAngleMOne() {
		return openAngleMOne;
	}
	public void setOpenAngleMOne(String openAngleMOne) {
		this.openAngleMOne = openAngleMOne;
	}
	public String getOpenAngleMTwo() {
		return openAngleMTwo;
	}
	public void setOpenAngleMTwo(String openAngleMTwo) {
		this.openAngleMTwo = openAngleMTwo;
	}
	@Length(min=0, max=50, message="开槽米数长度必须介于 0 和 50 之间")
	public String getOpenSlotM() {
		return openSlotM;
	}

	public void setOpenSlotM(String openSlotM) {
		this.openSlotM = openSlotM;
	}
	
	@Length(min=0, max=50, message="见光米数长度必须介于 0 和 50 之间")
	public String getOpenLightM() {
		return openLightM;
	}

	public void setOpenLightM(String openLightM) {
		this.openLightM = openLightM;
	}
	
	@Length(min=0, max=60, message="组装图号长度必须介于 0 和 60 之间")
	public String getAssemblyDiagramNo() {
		return assemblyDiagramNo;
	}

	public void setAssemblyDiagramNo(String assemblyDiagramNo) {
		this.assemblyDiagramNo = assemblyDiagramNo;
	}
	
	@Length(min=0, max=1, message="滴水槽是否做长度必须介于 0 和 1 之间")
	public String getHasWaterSlot() {
		return hasWaterSlot;
	}

	public void setHasWaterSlot(String hasWaterSlot) {
		this.hasWaterSlot = hasWaterSlot;
	}
	
	@Length(min=0, max=50, message="滴水槽米数长度必须介于 0 和 50 之间")
	public String getWaterSlotM() {
		return waterSlotM;
	}

	public void setWaterSlotM(String waterSlotM) {
		this.waterSlotM = waterSlotM;
	}
	
	@Length(min=0, max=1, message="是否要背切长度必须介于 0 和 1 之间")
	public String getHasBackCut() {
		return hasBackCut;
	}

	public void setHasBackCut(String hasBackCut) {
		this.hasBackCut = hasBackCut;
	}
	
	@Length(min=0, max=51, message="倒边角数量长度必须介于 0 和 51 之间")
	public String getReversedAngleCount() {
		return reversedAngleCount;
	}

	public void setReversedAngleCount(String reversedAngleCount) {
		this.reversedAngleCount = reversedAngleCount;
	}
	
	@Length(min=0, max=50, message="线密度长度必须介于 0 和 50 之间")
	public String getLineDensity() {
		return lineDensity;
	}

	public void setLineDensity(String lineDensity) {
		this.lineDensity = lineDensity;
	}
	
	@Length(min=0, max=50, message="重量长度必须介于 0 和 50 之间")
	public String getWdight() {
		return wdight;
	}

	public void setWdight(String wdight) {
		this.wdight = wdight;
	}
	
	@Length(min=0, max=50, message="单位重量长度必须介于 0 和 50 之间")
	public String getUnitWeight() {
		return unitWeight;
	}

	public void setUnitWeight(String unitWeight) {
		this.unitWeight = unitWeight;
	}
	
	@Length(min=0, max=50, message="体积长度必须介于 0 和 50 之间")
	public String getVolume() {
		return volume;
	}

	public void setVolume(String volume) {
		this.volume = volume;
	}
	
	@Length(min=0, max=50, message="面积长度必须介于 0 和 50 之间")
	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}
	
	@Length(min=0, max=10, message="单位长度必须介于 0 和 10 之间")
	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}
	
	@Length(min=0, max=60, message="规格尺寸长度必须介于 0 和 60 之间")
	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}
	
	@Length(min=0, max=50, message="倒角长度长度必须介于 0 和 50 之间")
	public String getReversedAngleLong() {
		return reversedAngleLong;
	}

	public void setReversedAngleLong(String reversedAngleLong) {
		this.reversedAngleLong = reversedAngleLong;
	}
	
	public String getCutTurnLeft() {
		return cutTurnLeft;
	}

	public void setCutTurnLeft(String cutTurnLeft) {
		this.cutTurnLeft = cutTurnLeft;
	}

	public String getCutTurnRight() {
		return cutTurnRight;
	}

	public void setCutTurnRight(String cutTurnRight) {
		this.cutTurnRight = cutTurnRight;
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
	
	@Length(min=0, max=1000, message="备注长度必须介于 0 和 1000 之间")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getMaterielName() {
		return materielName;
	}

	public void setMaterielName(String materielName) {
		this.materielName = materielName;
	}

	public String getProcessChartNo() {
		return processChartNo;
	}

	public void setProcessChartNo(String processChartNo) {
		this.processChartNo = processChartNo;
	}
	
	public OrderBomBox getOrderBomBox() {
		return orderBomBox;
	}
	public void setOrderBomBox(OrderBomBox orderBomBox) {
		this.orderBomBox = orderBomBox;
	}
	public Project getPro() {
		return pro;
	}
	public void setPro(Project pro) {
		this.pro = pro;
	}
	public String getIsFamilyLine() {
		return isFamilyLine;
	}
	public void setIsFamilyLine(String isFamilyLine) {
		this.isFamilyLine = isFamilyLine;
	}
	public String getWaterproofArea() {
		return waterproofArea;
	}
	public void setWaterproofArea(String waterproofArea) {
		this.waterproofArea = waterproofArea;
	}
	public String getRohlingArea() {
		return rohlingArea;
	}
	public void setRohlingArea(String rohlingArea) {
		this.rohlingArea = rohlingArea;
	}
	public String getFacingArea() {
		return facingArea;
	}
	public void setFacingArea(String facingArea) {
		this.facingArea = facingArea;
	}
	public String getMaterials() {
		return materials;
	}
	public void setMaterials(String materials) {
		this.materials = materials;
	}
	public String getPolish() {
		return polish;
	}
	public void setPolish(String polish) {
		this.polish = polish;
	}
	public OrderBomBase getOrderBomBase() {
		return orderBomBase;
	}
	public void setOrderBomBase(OrderBomBase orderBomBase) {
		this.orderBomBase = orderBomBase;
	}
	public Project getProject() {
		return project;
	}
	public void setProject(Project project) {
		this.project = project;
	}
	public Subproject getSub() {
		return sub;
	}
	public void setSub(Subproject sub) {
		this.sub = sub;
	}
	public String getBackCutCount() {
		return backCutCount;
	}
	public void setBackCutCount(String backCutCount) {
		this.backCutCount = backCutCount;
	}
	
	@Length(min=0, max=50, message="胚料尺寸-长度长度必须介于 0 和 50 之间")
	public String getRohlingLong() {
		return rohlingLong;
	}

	public void setRohlingLong(String rohlingLong) {
		this.rohlingLong = rohlingLong;
	}
	
	@Length(min=0, max=50, message="胚料尺寸-宽度长度必须介于 0 和 50 之间")
	public String getRohlingWidth() {
		return rohlingWidth;
	}

	public void setRohlingWidth(String rohlingWidth) {
		this.rohlingWidth = rohlingWidth;
	}
	
	@Length(min=0, max=50, message="胚料尺寸-厚度/深度长度必须介于 0 和 50 之间")
	public String getRohlingDepth() {
		return rohlingDepth;
	}
	
	public void setRohlingDepth(String rohlingDepth) {
		this.rohlingDepth = rohlingDepth;
	}
	
	public String getRohlingVolume() {
		return rohlingVolume;
	}
	public void setRohlingVolume(String rohlingVolume) {
		this.rohlingVolume = rohlingVolume;
	}
}