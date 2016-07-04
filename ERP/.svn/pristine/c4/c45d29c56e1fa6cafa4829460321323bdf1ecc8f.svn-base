/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.logistics.entity;


import java.util.List;

import com.bt.modules.orbom.entity.OrderBomBase;
import com.bt.modules.orbom.entity.OrderBomBox;
import com.bt.modules.orbom.entity.OrderBomDetail;
import com.bt.modules.production.entity.Production;
import com.bt.modules.project.entity.Project;
import com.bt.modules.project.entity.Subproject;
import com.bt.modules.supplier.entity.Supplier;
import com.bt.modules.utils.CommonStatus;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 物流信息-发货单Entity
 * @author xiaocai
 * @version 2015-07-30
 */
public class LogisticsSend extends DataEntity<LogisticsSend> {
	
	private static final long serialVersionUID = 1L;
	
	private String seriesnumber;// varchar(100)'发货通知单号',
	private int number;		//数量
	private long quantity;//总箱数
	private String weight;//实际发货重量
	private double theoryWeight;	//理论重量
	private String sendFactory;//发货工厂
	private String sendAddress;//发货地点
	private String planSendDate;// varchar(30)'计划发货日期',
	private String factSendDate;// varchar(30)'实际发货日期',
	private String requireDate;//要求到货时间
	private String makeUser;// varchar(30) '制单人',
	private String sendUser;// varchar(30) '发货人',
	private String sendPhone;// varchar(30) '发货员电话',
	private String receiverAddress;//varchar(100) '收货地址',
	private String receiverUser;// varchar(30) '收货人',
	private String receiverPhone;// varchar(60) '收货人电话',
	private String chargeType;// varchar(10)  '计费类型（1-整车，2-零担）',
	private String carriageContractId;// varchar(60) '运输合同Id',
	private String suppliersId;// varchar(32)  '物流供应商Id',
	private String driveName;// varchar(60)  '司机姓名',
	private String credentials;// varchar(60)  '驾驶证号',
	private String vehicleNumber;// varchar(60)  '车牌号码',
	private String vehicleLength;// decimal(18,2)  '车长度',
	private String requireWeight;// decimal(18,2) '吨位要求',
	private String drivePhone;// varchar(60)  '驾驶员电话',
	private String status;// varchar(10) '状态（待发货、已发货...）',
	private String remark;//备注
	
	private String gbStr;	//分组标识字符串
	private List<String> ids;	//ids集合
	
	private String isassure;//是否担保
	private String settlement;//结算方式
	private String sendremark;//发货备注
	private String receiptremark;//收货备注
	
	private String suppLable; 	//加工厂的界面显示
	private String proLable;	//项目的界面显示
	private String statusLable;	//状态的界面显示
	private String showCC; //车次界面显示
	private String showSuppliersName;//页面显示物料供应商名称
	
	/**
	 * 明细显示
	 * @return
	 */
	private Project project;	//一级项目
	private Subproject sub;		//二级项目
	private OrderBomBase orderBomBase;		//下料单
	private OrderBomDetail orderBomDetail;	//下料明细
	private OrderBomBox orderBomBox;	//下料-箱
	private Production production;	//加工单
//	private User materialStaffB;	//材料员（工地收货人）
	private Supplier supp;		//供应商
	
	public LogisticsSend() {
		super();
	}

	public LogisticsSend(String id){
		super(id);
	}
	
	public String getSeriesnumber() {
		return seriesnumber;
	}
	public void setSeriesnumber(String seriesnumber) {
		this.seriesnumber = seriesnumber;
	}
	public long getQuantity() {
		return quantity;
	}
	public void setQuantity(long quantity) {
		this.quantity = quantity;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getSendFactory() {
		return sendFactory;
	}
	public void setSendFactory(String sendFactory) {
		this.sendFactory = sendFactory;
	}
	public String getPlanSendDate() {
		return planSendDate;
	}
	public void setPlanSendDate(String planSendDate) {
		this.planSendDate = planSendDate;
	}
	public String getFactSendDate() {
		return factSendDate;
	}
	public void setFactSendDate(String factSendDate) {
		this.factSendDate = factSendDate;
	}
	public String getRequireDate() {
		return requireDate;
	}
	public void setRequireDate(String requireDate) {
		this.requireDate = requireDate;
	}
	public String getMakeUser() {
		return makeUser;
	}
	public void setMakeUser(String makeUser) {
		this.makeUser = makeUser;
	}
	public String getSendUser() {
		return sendUser;
	}
	public void setSendUser(String sendUser) {
		this.sendUser = sendUser;
	}
	public String getSendPhone() {
		return sendPhone;
	}
	public void setSendPhone(String sendPhone) {
		this.sendPhone = sendPhone;
	}
	public String getSuppliersId() {
		return suppliersId;
	}
	public void setSuppliersId(String suppliersId) {
		this.suppliersId = suppliersId;
	}
	public String getDriveName() {
		return driveName;
	}
	public void setDriveName(String driveName) {
		this.driveName = driveName;
	}
	public String getCredentials() {
		return credentials;
	}
	public void setCredentials(String credentials) {
		this.credentials = credentials;
	}
	public String getVehicleNumber() {
		return vehicleNumber;
	}
	public void setVehicleNumber(String vehicleNumber) {
		this.vehicleNumber = vehicleNumber;
	}
	public String getVehicleLength() {
		return vehicleLength;
	}
	public void setVehicleLength(String vehicleLength) {
		this.vehicleLength = vehicleLength;
	}
	public String getRequireWeight() {
		return requireWeight;
	}
	public void setRequireWeight(String requireWeight) {
		this.requireWeight = requireWeight;
	}
	public String getDrivePhone() {
		return drivePhone;
	}
	public void setDrivePhone(String drivePhone) {
		this.drivePhone = drivePhone;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
		this.statusLabUtils(status);
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getReceiverAddress() {
		return receiverAddress;
	}
	public void setReceiverAddress(String receiverAddress) {
		this.receiverAddress = receiverAddress;
	}
	public String getReceiverUser() {
		return receiverUser;
	}
	public void setReceiverUser(String receiverUser) {
		this.receiverUser = receiverUser;
	}
	public String getReceiverPhone() {
		return receiverPhone;
	}
	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}
	public String getChargeType() {
		return chargeType;
	}
	public void setChargeType(String chargeType) {
		this.chargeType = chargeType;
	}
	public String getCarriageContractId() {
		return carriageContractId;
	}
	public void setCarriageContractId(String carriageContractId) {
		this.carriageContractId = carriageContractId;
	}
	public String getIsassure() {
		return isassure;
	}
	public void setIsassure(String isassure) {
		this.isassure = isassure;
	}
	public String getSendAddress() {
		return sendAddress;
	}
	public void setSendAddress(String sendAddress) {
		this.sendAddress = sendAddress;
	}
	public String getSettlement() {
		return settlement;
	}
	public void setSettlement(String settlement) {
		this.settlement = settlement;
	}
	public String getSendremark() {
		return sendremark;
	}
	public void setSendremark(String sendremark) {
		this.sendremark = sendremark;
	}
	public String getReceiptremark() {
		return receiptremark;
	}
	public void setReceiptremark(String receiptremark) {
		this.receiptremark = receiptremark;
	}
	public String getSuppLable() {
		return suppLable;
	}
	public void setSuppLable(String suppLable) {
		this.suppLable = suppLable;
	}
	public String getProLable() {
		return proLable;
	}
	public void setProLable(String proLable) {
		this.proLable = proLable;
	}
	public String getStatusLable() {
		return statusLable;
	}
	
	public String getShowCC() {
		return showCC;
	}
	public void setShowCC(String showCC) {
		this.showCC = showCC;
	}
	
	public String getShowSuppliersName() {
		return showSuppliersName;
	}
	public void setShowSuppliersName(String showSuppliersName) {
		this.showSuppliersName = showSuppliersName;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
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
	public Production getProduction() {
		return production;
	}
	public void setProduction(Production production) {
		this.production = production;
	}
//	public User getMaterialStaffB() {
//		return materialStaffB;
//	}
//	public void setMaterialStaffB(User materialStaffB) {
//		this.materialStaffB = materialStaffB;
//	}
	public Supplier getSupp() {
		return supp;
	}
	public void setSupp(Supplier supp) {
		this.supp = supp;
	}
	
	public OrderBomBase getOrderBomBase() {
		return orderBomBase;
	}
	public void setOrderBomBase(OrderBomBase orderBomBase) {
		this.orderBomBase = orderBomBase;
	}
	public OrderBomDetail getOrderBomDetail() {
		return orderBomDetail;
	}
	public void setOrderBomDetail(OrderBomDetail orderBomDetail) {
		this.orderBomDetail = orderBomDetail;
	}
	
	public double getTheoryWeight() {
		return theoryWeight;
	}
	public void setTheoryWeight(double theoryWeight) {
		this.theoryWeight = theoryWeight;
	}
	public OrderBomBox getOrderBomBox() {
		return orderBomBox;
	}
	public void setOrderBomBox(OrderBomBox orderBomBox) {
		this.orderBomBox = orderBomBox;
	}
	public String getGbStr() {
		return gbStr;
	}
	public void setGbStr(String gbStr) {
		this.gbStr = gbStr;
	}

	public List<String> getIds() {
		return ids;
	}

	public void setIds(List<String> ids) {
		this.ids = ids;
	}

	public void statusLabUtils(String status){
		if(status.equals(CommonStatus.LOGISTICS_TZFH)){
			this.statusLable="通知发货";
		}else if(status.equals(CommonStatus.LOGISTICS_DFH)){
			this.statusLable="待发货";
		}else if(status.equals(CommonStatus.LOGISTICS_YFH)){
			this.statusLable="在途中";
		}else if(status.equals(CommonStatus.LOGISTICS_YSH)){
			this.statusLable="已收货";
		}else if(status.equals(CommonStatus.LOGISTICS_YJS)){
			this.statusLable="已结算";
		}else if(status.equals(CommonStatus.LOGISTICS_BFSH)){
			this.statusLable="部分收货";
		}else if(status.equals(CommonStatus.LOGISTICS_BFFH)){
			this.statusLable="部分发货";
		}
	}
		
}