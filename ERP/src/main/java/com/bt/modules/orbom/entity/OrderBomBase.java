/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.orbom.entity;

import org.hibernate.validator.constraints.Length;

import java.util.Date;
import java.util.List;

import com.bt.modules.project.entity.Project;
import com.bt.modules.project.entity.Subproject;
import com.bt.modules.utils.CommonConstant;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 下料单基本表Entity
 * @author pc
 * @version 2015-09-09
 */
public class OrderBomBase extends DataEntity<OrderBomBase> {
	
	private static final long serialVersionUID = 1L;
	private String id;
	private String orderBomNo;		// 下料单编号
	private String originalNo;		// 原下料单编号
	private String subProjId;		// 二级项目ID
	private String houseType;		// 户型
	private String outsideWallOrientation;//立面方向
	private String uniformMaterielType;		// 材料类别  1-挂石材料2-骨架材料3-平板材料4-门窗套线材料5-腰线材料6-造型板材料7-圆柱材料8-雕花材料9-弧形板材料10-屋檐板材料11-窗侧板材料
	private String stoneColorName;		// 石材名称(石材品种)
	private String building;		// 楼栋号
	private String facingProcess;		// 饰面处理
	private String orderLevel;		// 下料单等级，例如加急/普通
	private String orderType;		// 下料单类别   1-钢辅材下料单 2-平板下料单 3-门窗套线下料单 4-腰线下料单 5-造型板下料单 6-圆柱下料单 7-雕花下料单8-弧形板下料单9-屋檐板下料单10-窗侧板下料单
	private String hasDoneFlag;		// 已处理标志
	private Date orderMadeTime;		// 制表时间
	private String createUser;
	private String remark;		// 备注
	private Date lastUpdate;		// 最后更新时间
	private String showStoneColorName;
	private Date orderFinishDate; //下单完成时间
	
	private String orderTypeVal;		// 下料单类别的值
	private String uniformMaterielTypeLab;		// 材料类别
	
	private List<String> ids;	//下料单ids
	private List<String> listIds;	//
	private String status="";		//数据状态
	
	private Project project;	//一级项目
	private Subproject sub;		//二级项目
	private int boxCount;		//总箱数
	private String gbStr;		//分组标识
	
	/*xxxxxxxxxxxxx		yhh		xxxxxxxxxxx*/
	private String orientation;		//立面
	private String settlementType;		//结算类别
	
	private String designLeaderBid;//设计主管
	private String designer;//设计师
	private Boolean isDesignerManager;
	
	private String copyNum;				//批量下单次数
	
	public String getOrientation() {
		return orientation;
	}

	public void setOrientation(String orientation) {
		this.orientation = orientation;
	}
	
	public String getSettlementType() {
		return settlementType;
	}

	public void setSettlementType(String settlementType) {
		this.settlementType = settlementType;
	}
	/*xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx*/
	


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Length(min=0, max=60, message="下料单编号长度必须介于 0 和 60 之间")
	public String getOrderBomNo() {
		return orderBomNo;
	}

	public void setOrderBomNo(String orderBomNo) {
		this.orderBomNo = orderBomNo;
	}
	
	@Length(min=0, max=60, message="原下料单编号长度必须介于 0 和 60 之间")
	public String getOriginalNo() {
		return originalNo;
	}

	public void setOriginalNo(String originalNo) {
		this.originalNo = originalNo;
	}
	
	@Length(min=0, max=32, message="二级项目ID长度必须介于 0 和 32 之间")
	public String getSubProjId() {
		return subProjId;
	}

	public void setSubProjId(String subProjId) {
		this.subProjId = subProjId;
	}
	
	@Length(min=0, max=100, message="户型长度必须介于 0 和 100 之间")
	public String getHouseType() {
		return houseType;
	}

	public void setHouseType(String houseType) {
		this.houseType = houseType;
	}
	
	@Length(min=0, max=30, message="材料类别长度必须介于 0 和 30 之间")
	public String getUniformMaterielType() {
		return uniformMaterielType;
	}

	public void setUniformMaterielType(String uniformMaterielType) {
		this.uniformMaterielType = uniformMaterielType;
		this.uniformMaterielTypeUtils(uniformMaterielType);
	}
	
	@Length(min=0, max=60, message="石材名称长度必须介于 0 和 60 之间")
	public String getStoneColorName() {
		return stoneColorName;
	}

	public void setStoneColorName(String stoneColorName) {
		this.stoneColorName = stoneColorName;
	}
	
	@Length(min=0, max=200, message="楼栋号长度必须介于 0 和 200 之间")
	public String getBuilding() {
		return building;
	}

	public void setBuilding(String building) {
		this.building = building;
	}
	
	@Length(min=0, max=60, message="饰面处理长度必须介于 0 和 60 之间")
	public String getFacingProcess() {
		return facingProcess;
	}

	public void setFacingProcess(String facingProcess) {
		this.facingProcess = facingProcess;
	}
	
	@Length(min=0, max=20, message="下料单等级，例如加急/普通长度必须介于 0 和 20 之间")
	public String getOrderLevel() {
		return orderLevel;
	}

	public void setOrderLevel(String orderLevel) {
		this.orderLevel = orderLevel;
	}
	
	@Length(min=0, max=30, message="下料单类别长度必须介于 0 和 30 之间")
	public String getOrderType() {
		return orderType;
	}
	
	public Date getOrderFinishDate() {
		return orderFinishDate;
	}

	public void setOrderFinishDate(Date orderFinishDate) {
		this.orderFinishDate = orderFinishDate;
	}

	/**
	 * @param orderType 下料单类型  1-钢辅材下料单 2-平板下料单 
	 * 					3-门窗套线下料单 4-腰线下料单 5-造型板下料单 
	 * 					6-圆柱下料单 7-雕花下料单
	 */
	public void setOrderType(String orderType) {
		this.orderType = orderType;
		this.orderTypeValUtils(orderType);
	}
	
	@Length(min=0, max=1, message="已处理标志长度必须介于 0 和 1 之间")
	public String getHasDoneFlag() {
		return hasDoneFlag;
	}

	public void setHasDoneFlag(String hasDoneFlag) {
		this.hasDoneFlag = hasDoneFlag;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getOrderMadeTime() {
		return orderMadeTime;
	}

	public void setOrderMadeTime(Date orderMadeTime) {
		this.orderMadeTime = orderMadeTime;
	}
	
	@Length(min=0, max=1000, message="备注长度必须介于 0 和 1000 之间")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(Date lastUpdate) {
		this.lastUpdate = lastUpdate;
	}
	
	public String getOutsideWallOrientation() {
		return outsideWallOrientation;
	}

	public void setOutsideWallOrientation(String outsideWallOrientation) {
		this.outsideWallOrientation = outsideWallOrientation;
	}

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public String getShowStoneColorName() {
		return showStoneColorName;
	}

	public void setShowStoneColorName(String showStoneColorName) {
		this.showStoneColorName = showStoneColorName;
	}

	public String getOrderTypeVal() {
		return orderTypeVal;
	}
	
	public List<String> getIds() {
		return ids;
	}

	public void setIds(List<String> ids) {
		this.ids = ids;
	}

	public String getUniformMaterielTypeLab() {
		return uniformMaterielTypeLab;
	}

	public List<String> getListIds() {
		return listIds;
	}

	public void setListIds(List<String> listIds) {
		this.listIds = listIds;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public int getBoxCount() {
		return boxCount;
	}

	public void setBoxCount(int boxCount) {
		this.boxCount = boxCount;
	}
	
	public String getDesignLeaderBid() {
		return designLeaderBid;
	}
	public void setDesignLeaderBid(String designLeaderBid) {
		this.designLeaderBid = designLeaderBid;
	}
	
	public String getDesigner() {
		return designer;
	}
	public void setDesigner(String designer) {
		this.designer = designer;
	}
	
	public void setIsDesignerManager(Boolean isDesignerManager) {
		this.isDesignerManager = isDesignerManager;
	}
	public Boolean getIsDesignerManager() {
		return isDesignerManager;
	}
	
	@Length(min=0, max=50, message="批量下单次数长度必须介于 0 和 50 之间")
	public String getCopyNum() {
		return copyNum;
	}
	public void setCopyNum(String copyNum) {
		this.copyNum = copyNum;
	}

	/**
	 * 下料单类别对应的值的工具处理方法
	 * @param orderType
	 */
	public void orderTypeValUtils(String orderTypes){
		if(CommonConstant.OrderBomBase_PURCHASE.equals(orderTypes)){
			this.orderTypeVal="钢辅材";
		}else if(CommonConstant.OrderBomBase_SLAB.equals(orderTypes)){
			this.orderTypeVal="平板";
		}else if(CommonConstant.OrderBomBase_WINDOW.equals(orderTypes)){
			this.orderTypeVal="门窗套线";
		}else if(CommonConstant.OrderBomBase_WAIST.equals(orderTypes)){
			this.orderTypeVal="腰线";
		}else if(CommonConstant.OrderBomBase_MOULD.equals(orderTypes)){
			this.orderTypeVal="造型板";
		}else if(CommonConstant.OrderBomBase_COLUMN.equals(orderTypes)){
			this.orderTypeVal="圆柱";
		}else if(CommonConstant.OrderBomBase_CARVING.equals(orderTypes)){
			this.orderTypeVal="雕花";
		}else if(CommonConstant.OrderBomBase_ARC.equals(orderTypes)){
			this.orderTypeVal="弧形板";
		}else if(CommonConstant.OrderBomBase_EAVE.equals(orderTypes)){
			this.orderTypeVal="屋檐板";
		}else if(CommonConstant.OrderBomBase_REVEAL.equals(orderTypes)){
			this.orderTypeVal="窗侧板";
		}else if(CommonConstant.OrderBomBase_SEAM.equals(orderTypes)){
			this.orderTypeVal="平板（工字缝）";
		}
	}
	
	public String getGbStr() {
		return gbStr;
	}

	public void setGbStr(String gbStr) {
		this.gbStr = gbStr;
	}

	/**
	 * 下料单类别对应的值的工具处理方法
	 * @param uniformMaterielType
	 */ 
	public void uniformMaterielTypeUtils(String uniformMaterielTypes){
		if(CommonConstant.OrderBomBase_MATERIAL_STONE.equals(uniformMaterielTypes)){
			this.uniformMaterielTypeLab="挂石材料";
		}else if(CommonConstant.OrderBomBase_MATERIAL_FRAME.equals(uniformMaterielTypes)){
			this.uniformMaterielTypeLab="骨架材料";
		}else if(CommonConstant.OrderBomBase_MATERIAL_SLAB.equals(uniformMaterielTypes)){
			this.uniformMaterielTypeLab="平板材料";
		}else if(CommonConstant.OrderBomBase_MATERIAL_WINDOW.equals(uniformMaterielTypes)){
			this.uniformMaterielTypeLab="门窗套线材料";
		}else if(CommonConstant.OrderBomBase_MATERIAL_WAIST.equals(uniformMaterielTypes)){
			this.uniformMaterielTypeLab="腰线材料";
		}else if(CommonConstant.OrderBomBase_MATERIAL_MOULD.equals(uniformMaterielTypes)){
			this.uniformMaterielTypeLab="造型板材料";
		}else if(CommonConstant.OrderBomBase_MATERIAL_COLUMN.equals(uniformMaterielTypes)){
			this.uniformMaterielTypeLab="圆柱材料";
		}else if(CommonConstant.OrderBomBase_MATERIAL_CARVING.equals(uniformMaterielTypes)){
			this.uniformMaterielTypeLab="雕花材料";
		}else if(CommonConstant.OrderBomBase_MATERIAL_ARC.equals(uniformMaterielTypes)){
			this.uniformMaterielTypeLab="弧形板下料单";
		}else if(CommonConstant.OrderBomBase_MATERIAL_EAVE.equals(uniformMaterielTypes)){
			this.uniformMaterielTypeLab="屋檐板下料单";
		}else if(CommonConstant.OrderBomBase_MATERIAL_REVEAL.equals(uniformMaterielTypes)){
			this.uniformMaterielTypeLab="窗侧板下料单";
		}else if(CommonConstant.OrderBomBase_MATERIAL_SEAM.equals(uniformMaterielTypes)){
			this.uniformMaterielTypeLab="平板材料（工字缝）";
		}
	}
	
}