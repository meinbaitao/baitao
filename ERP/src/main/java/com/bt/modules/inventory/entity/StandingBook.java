/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.inventory.entity;

import java.util.Date;
import java.util.List;

import com.bt.modules.project.entity.Subproject;
import com.bt.modules.utils.CommonConstant;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 出入库台账表Entity
 * @author xiaocai
 * @version 2015-10-10
 */
public class StandingBook extends DataEntity<StandingBook> {
	
	private static final long serialVersionUID = 1L;
	private String tranType;		// 业务类型(1-入库2-出库3-调拨)
	private Date businessDate;		// 业务日期
	private String seriesnumber;		// 单据编号(流水号)
	private String materialType;		// 物料类型
	private String sendee;			//接收人（施工班组）
	
	private String checkedUser;		// 材料统筹审核
	private String status;		// 状态
	private String orderBomId;		// 下料单ID
	
	private Depot depotOut;		// 出库仓库(调出位置)
	private Depot depotIn;		// 入库仓库(调用地方)
	private Subproject subIn;
	private Subproject subOut;
	private User operateUser;	// 操作人（审核人）
	
	private String tranTypeLab;	//业务类型界面显示值
	
	private List<String> materialTypes;	//条件查询，类型
	
	private List<Inventory> listInv;	//库存列表，界面传输数据
	
	public StandingBook() {
		super();
	}

	public StandingBook(String id){
		super(id);
	}

	public StandingBook(String id,String seriesnumber,String sendee,String tranType,
				Depot depotIn,Depot depotOut,String materialType,Date businessDate,String remarks){
		this.id=id;
		this.sendee=sendee;
		this.tranType=tranType;
		this.depotIn=depotIn;
		this.depotOut=depotOut;
		this.materialType=materialType;
		this.seriesnumber=seriesnumber;
		this.businessDate=businessDate;
		this.remarks=remarks;
	}
	public StandingBook(String id,String seriesnumber,String sendee,String tranType,
			Depot depotIn,Depot depotOut,String materialType,Date businessDate){
	this.id=id;
	this.sendee=sendee;
	this.tranType=tranType;
	this.depotIn=depotIn;
	this.depotOut=depotOut;
	this.materialType=materialType;
	this.seriesnumber=seriesnumber;
	this.businessDate=businessDate;
}
	
	public String getTranType() {
		return tranType;
	}

	public void setTranType(String tranType) {
		this.tranType = tranType;
		this.tranTypeUtils(tranType);
	}
	
	public Date getBusinessDate() {
		return businessDate;
	}

	public void setBusinessDate(Date businessDate) {
		this.businessDate = businessDate;
	}
	
	public String getSeriesnumber() {
		return seriesnumber;
	}

	public void setSeriesnumber(String seriesnumber) {
		this.seriesnumber = seriesnumber;
	}
	
	public String getMaterialType() {
		return materialType;
	}

	public void setMaterialType(String materialType) {
		this.materialType = materialType;
	}
	
	public Depot getDepotOut() {
		return depotOut;
	}

	public void setDepotOut(Depot depotOut) {
		this.depotOut = depotOut;
	}

	public Depot getDepotIn() {
		return depotIn;
	}

	public void setDepotIn(Depot depotIn) {
		this.depotIn = depotIn;
	}
	
	public User getOperateUser() {
		return operateUser;
	}

	public void setOperateUser(User operateUser) {
		this.operateUser = operateUser;
	}

	public String getCheckedUser() {
		return checkedUser;
	}

	public void setCheckedUser(String checkedUser) {
		this.checkedUser = checkedUser;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getOrderBomId() {
		return orderBomId;
	}

	public void setOrderBomId(String orderBomId) {
		this.orderBomId = orderBomId;
	}

	public String getTranTypeLab() {
		return tranTypeLab;
	}
	 
	public List<Inventory> getListInv() {
		return listInv;
	}

	public void setListInv(List<Inventory> listInv) {
		this.listInv = listInv;
	}

	public List<String> getMaterialTypes() {
		return materialTypes;
	}

	public void setMaterialTypes(List<String> materialTypes) {
		this.materialTypes = materialTypes;
	}

	public String getSendee() {
		return sendee;
	}

	public void setSendee(String sendee) {
		this.sendee = sendee;
	}

	public Subproject getSubIn() {
		return subIn;
	}

	public void setSubIn(Subproject subIn) {
		this.subIn = subIn;
	}

	public Subproject getSubOut() {
		return subOut;
	}

	public void setSubOut(Subproject subOut) {
		this.subOut = subOut;
	}

	/**
	 * 业务类型
	 * @param tranType
	 */
	public void tranTypeUtils(String tranType){
		if(tranType.equals(CommonConstant.STANDINGBOOK_RUKU)){
			this.tranTypeLab="入库";
		}else if(tranType.equals(CommonConstant.STANDINGBOOK_CHUKU)){
			this.tranTypeLab="出库";
		}else if(tranType.equals(CommonConstant.STANDINGBOOK_LINGLIAO)){
			this.tranTypeLab="领料";
		}else if(tranType.equals(CommonConstant.STANDINGBOOK_DIAOBO)){
			this.tranTypeLab="调拨";
		}else if(tranType.equals(CommonConstant.STANDINGBOOK_PANDIAN)){
			this.tranTypeLab="盘点";
		}else if(tranType.equals(CommonConstant.STANDINGBOOK_PINGCANG)){
			this.tranTypeLab="平仓";
		}
	}
	
	
}