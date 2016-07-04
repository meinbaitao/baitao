/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.accident.entity;

import java.util.List;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 事故管理Entity
 * @author pc
 * @version 2015-10-14
 */
public class AccidentManage extends DataEntity<AccidentManage> {
	
	private static final long serialVersionUID = 1L;
	private String id;
	private String type;//类型（1-石材收货事故2-钢辅材收货事故3-石材销售事故4-钢辅材销售事故）
	private String accientNo;//事故单编号
	private String orderId;		// 单据id(发货通知单、采购单、下料单)
	private String materialType;		// 材料类型
	private String isConstruct;		// 是否影响施工(0-否；1-是)
	private String createUser;
	private String auditProcess;//审核流程0-设计审核流程1-供应商审核流程s
	private String projectId; //项目id，石材销售事故 才会设置这个字段的值
	private String factArriveDate; // 实际到货日期
	private String requireArriveDate; //要求到货日期
	private String roomModel; //户型
	private String subProjId; //二级项目ID

	private String buildingNO; //栋号, deprecated


	private List<AccidentShareMoney> asmList;//事故比例分摊金额
	private List<AccidentManageDetail> amdList;//明细
	
	private String sendCC;//车次--页面显示
	private String requireDate;//要求到货日期--页面显示(其他表获取的数据,来这里显示)
	private String factSendDate;//实际到货日期--页面显示(其他表获取的数据,来这里显示)
	private String buildingDisplayName; //楼栋号显示名
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAccientNo() {
		return accientNo;
	}

	public void setAccientNo(String accientNo) {
		this.accientNo = accientNo;
	}

	@Length(min=0, max=100, message="单据id(发货通知单、采购单、下料单)长度必须介于 0 和 100 之间")
	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	@Length(min=0, max=30, message="材料类型长度必须介于 0 和 30 之间")

	public String getMaterialType() {
		return materialType;
	}

	public void setMaterialType(String materialType) {
		this.materialType = materialType;
	}
	
	@Length(min=0, max=1, message="是否影响施工(0-否；1-是)长度必须介于 0 和 1 之间")
	public String getIsConstruct() {
		return isConstruct;
	}

	public void setIsConstruct(String isConstruct) {
		this.isConstruct = isConstruct;
	}

	public List<AccidentShareMoney> getAsmList() {
		return asmList;
	}

	public void setAsmList(List<AccidentShareMoney> asmList) {
		this.asmList = asmList;
	}

	public List<AccidentManageDetail> getAmdList() {
		return amdList;
	}

	public void setAmdList(List<AccidentManageDetail> amdList) {
		this.amdList = amdList;
	}

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public String getSendCC() {
		return sendCC;
	}

	public void setSendCC(String sendCC) {
		this.sendCC = sendCC;
	}

	public String getRequireDate() {
		return requireDate;
	}

	public void setRequireDate(String requireDate) {
		this.requireDate = requireDate;
	}

	public String getFactSendDate() {
		return factSendDate;
	}

	public void setFactSendDate(String factSendDate) {
		this.factSendDate = factSendDate;
	}

	public String getAuditProcess() {
		return auditProcess;
	}

	public void setAuditProcess(String auditProcess) {
		this.auditProcess = auditProcess;
	}

	public String getFactArriveDate() {
		return factArriveDate;
	}

	public void setFactArriveDate(String factArriveDate) {
		this.factArriveDate = factArriveDate;
	}


	public String getRequireArriveDate() {
		return requireArriveDate;
	}

	public void setRequireArriveDate(String requireArriveDate) {
		this.requireArriveDate = requireArriveDate;
	}

	public String getRoomModel() {
		return roomModel;
	}

	public void setRoomModel(String roomModel) {
		this.roomModel = roomModel;
	}

	@Deprecated
	public String getBuildingNO() {
		return buildingNO;
	}

	@Deprecated
	public void setBuildingNO(String buildingNO) {
		this.buildingNO = buildingNO;
	}


	public String getSubProjId() {
		return subProjId;
	}

	public void setSubProjId(String subProjId) {
		this.subProjId = subProjId;
	}

	public String getBuildingDisplayName() {
		return buildingDisplayName;
	}

	public void setBuildingDisplayName(String buildingDisplayName) {
		this.buildingDisplayName = buildingDisplayName;
	}
}