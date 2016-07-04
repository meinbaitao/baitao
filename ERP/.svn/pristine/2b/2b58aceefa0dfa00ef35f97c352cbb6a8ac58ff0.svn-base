package com.bt.modules.datatrack.entity;

import java.util.Date;
import java.util.List;

import com.bt.modules.logistics.entity.LogisticsSend;
import com.bt.modules.orbom.entity.OrderBomBase;
import com.bt.modules.orbom.entity.OrderBomBox;
import com.bt.modules.orbom.entity.OrderBomDetail;
import com.bt.modules.project.entity.Project;
import com.bt.modules.project.entity.Subproject;
import com.bt.modules.supplier.entity.Supplier;
import com.bt.modules.utils.CommonStatus;
import com.bt.modules.utils.DateUtils;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.bt.modules.production.entity.Production;

public class DataTrackDetail extends
		DataEntity<DataTrackDetail> {
	private static final long serialVersionUID = 1L;
	private String seriesnumber;		// 编号
	private int count;		// 生产数量
	private String directorremarks;		// 运营主管填写备注（审批意见）
	private String amaldarremarks;		// 运营经理填写备注
	private String status;		// 状态
	private Date finishDate;	// 预计完成时间
	private Date planSendDate;	// 计划发货时间
	private Date orderDate;		// 下单时间
	
	private String statusLab;		// 状态界面显示
	private String finishDateLab="";		// 完成时间界面显示
	private String planSendDateLab="";		// 计划发货时间界面显示
	private String orderDateLab="";		// 下单时间界面显示
	
	private Project project;	//一级项目
	private Subproject sub;		//二级项目
	private User assignto;		// 受指派人
	private User documentaryby;		// 跟单员
	private User settleby;		// 结算员
	private OrderBomBox orderBomBox;	//下料单-箱
	private OrderBomBase orderBomBase;	//下料单
	private OrderBomDetail orderBomDetail;	//下料单-详情
	private Supplier supp;		// 加工厂
	private LogisticsSend logisticsSend;		// 加工厂
	private int sumCount;		// 生产数量总计
	
	private List<String> ids;		// 加工单数组
	private String lsID;			// 物流单
	private String waitIntake;		// 入库状态验证
	
	private String glfpGB;	//getListForProject group by condition		
	private String originStatus;	//原状态
	private Production production;	//产品
	
	public Production getProduction() {
		return production;
	}

	public void setProduction(Production production) {
		this.production = production;
	}

	public DataTrackDetail() {
		super();
	}

	public DataTrackDetail(String id){
		super(id);
	}
	
	public DataTrackDetail(String id,String status){
		this.id=id;
		this.updateDate=new Date();
		this.status=status;
	}

	public String getSeriesnumber() {
		return seriesnumber;
	}

	public void setSeriesnumber(String seriesnumber) {
		this.seriesnumber = seriesnumber;
	}

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
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public User getAssignto() {
		return assignto;
	}

	public void setAssignto(User assignto) {
		this.assignto = assignto;
	}

	public User getDocumentaryby() {
		return documentaryby;
	}

	public void setDocumentaryby(User documentaryby) {
		this.documentaryby = documentaryby;
	}

	public User getSettleby() {
		return settleby;
	}

	public void setSettleby(User settleby) {
		this.settleby = settleby;
	}

	public OrderBomBox getOrderBomBox() {
		return orderBomBox;
	}

	public void setOrderBomBox(OrderBomBox orderBomBox) {
		this.orderBomBox = orderBomBox;
	}

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

	public String getDirectorremarks() {
		return directorremarks;
	}

	public void setDirectorremarks(String directorremarks) {
		this.directorremarks = directorremarks;
	}

	public String getAmaldarremarks() {
		return amaldarremarks;
	}

	public void setAmaldarremarks(String amaldarremarks) {
		this.amaldarremarks = amaldarremarks;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public int getSumCount() {
		return sumCount;
	}

	public void setSumCount(int sumCount) {
		this.sumCount = sumCount;
	}

	public List<String> getIds() {
		return ids;
	}

	public void setIds(List<String> ids) {
		this.ids = ids;
	}

	public String getLsID() {
		return lsID;
	}

	public void setLsID(String lsID) {
		this.lsID = lsID;
	}

	public String getGlfpGB() {
		return glfpGB;
	}

	public void setGlfpGB(String glfpGB) {
		this.glfpGB = glfpGB;
	}

	public Subproject getSub() {
		return sub;
	}

	public void setSub(Subproject sub) {
		this.sub = sub;
	}

	public Date getFinishDate() {
		return finishDate;
	}

	public void setFinishDate(Date finishDate) {
		this.finishDate = finishDate;
		this.finishDateLabUtils(finishDate);
	}

	public String getFinishDateLab() {
		return finishDateLab;
	}

	public String getWaitIntake() {
		return waitIntake;
	}

	public void setWaitIntake(String waitIntake) {
		this.waitIntake = waitIntake;
	}

	public String getOriginStatus() {
		return originStatus;
	}

	public void setOriginStatus(String originStatus) {
		this.originStatus = originStatus;
	}

//	public String getIsStatus() {
//		return isStatus;
//	}
//
//	public void setIsStatus(String isStatus) {
//		this.isStatus = isStatus;
//	}

	public Date getPlanSendDate() {
		return planSendDate;
	}

	public void setPlanSendDate(Date planSendDate) {
		this.planSendDate = planSendDate;
		this.planSendDateLabUtils(planSendDate);
	}

	public String getPlanSendDateLab() {
		return planSendDateLab;
	}
	
	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
		this.orderDateLabUtils(orderDate);
	}

	public String getOrderDateLab() {
		return orderDateLab;
	}

	public LogisticsSend getLogisticsSend() {
		return logisticsSend;
	}

	public void setLogisticsSend(LogisticsSend logisticsSend) {
		this.logisticsSend = logisticsSend;
	}

	public void statusLabUtils(String status){
		if(CommonStatus.PRODUCTION_DZP_YYZY.equals(status)){
			this.statusLab="待运营专员提交";
		}else if(CommonStatus.PRODUCTION_DZP_YYZG.equals(status)){
			this.statusLab="待运营主管审核";
		}else if(CommonStatus.PRODUCTION_DZP_YYJL.equals(status)){
			this.statusLab="待运营经理指派";
		}else if(CommonStatus.PRODUCTION_DZP_SCJL.equals(status)){
			this.statusLab="待生产经理指派";
		}else if(CommonStatus.PRODUCTION_DQS.equals(status)){
			this.statusLab="待签收";
		}else if(CommonStatus.PRODUCTION_DSC.equals(status)){
			this.statusLab="待生产";
		}/*else if(CommonStatus.PRODUCTION_SCZ.equals(status)){
			this.statusLab="生产中";
		}*/else if(CommonStatus.PRODUCTION_DRK.equals(status)){
			this.statusLab="待入库";
		}else if(CommonStatus.PRODUCTION_YRK.equals(status)){
			this.statusLab="已入库";
		}else if(CommonStatus.PRODUCTION_DCK.equals(status)){
			this.statusLab="待出库";
		}else if(CommonStatus.PRODUCTION_DFH.equals(status)){
			this.statusLab="待发货";
		}else if(CommonStatus.PRODUCTION_DPC.equals(status)){
			this.statusLab="待派车";
		}else if(CommonStatus.PRODUCTION_YPCWF.equals(status)){
			this.statusLab="已派车未发";
		}else if(CommonStatus.PRODUCTION_DSH.equals(status)){
			this.statusLab="待收货";	//
		}else if(CommonStatus.PRODUCTION_YSH.equals(status)){
			this.statusLab="已收货";
		}
	}
	/**
	 * 计划完成时间
	 * @param finishDate
	 */
	public void finishDateLabUtils(Date finishDate){
		if(finishDate==null){
			this.finishDateLab="";
		}else{
			this.finishDateLab=DateUtils.getDateStrByPattern(finishDate, "yyyy-MM-dd");
		}
	}
	/**
	 * 计划发货时间
	 * @param planSendDate
	 */
	public void planSendDateLabUtils(Date planSendDate){
		if(planSendDate==null){
			this.planSendDateLab="";
		}else{
			this.planSendDateLab=DateUtils.getDateStrByPattern(planSendDate, "yyyy-MM-dd");
		}
	}
	/**
	 * 下单日期格式转换
	 * @param orderDates
	 */
	public void orderDateLabUtils(Date orderDates){
		if(orderDates==null){
			this.orderDateLab="";
		}else{
			this.orderDateLab=DateUtils.getDateStrByPattern(orderDates, "yyyy-MM-dd");
		}
	}


}
