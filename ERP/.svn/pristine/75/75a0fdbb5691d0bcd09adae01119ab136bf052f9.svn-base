/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.purchase.entity;

import java.util.List;

import com.bt.modules.orbom.entity.OrderBomBase;
import com.bt.modules.orbom.entity.OrderBomDetail;
import com.bt.modules.project.entity.Project;
import com.bt.modules.project.entity.Subproject;
import com.bt.modules.supplier.entity.Supplier;
import com.bt.modules.utils.CommonStatus;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 采购需求Entity
 * @author xiaocai 
 * @version 2015-08-07
 */
public class PurchaseDemand extends DataEntity<PurchaseDemand> {
	
	private static final long serialVersionUID = 1L;
	private String seriesnumber;// 编号
	private String type;		// 采购类型。（黑材，镀锌钢材...）
	private String mtype;		// 采购需求材料型号
	private int count;			// 采购需求数量
	private String status;		// 状态	1-待提交 2-待审核 3-待下单 4-已下单
	private int sort;			// 序号
	private User assignto;		// 受指派人
//	private Date createts;		// 创建时间
//	private String createby;	// 创建人（制表人）
//	private Date updatets;		// 更新时间
//	private String updateby;	// 更新人
//	private String delFalg;		// 删除标识
//	private String workflowid;	// 流程ID
//	private String workflowstatus;		// 流程状态(1-新建流程、2-流程进行中、3-流程被驳回结束、4-流程正常结束)
	
	private int sumCount;		// 需求总数
	private String statusLab;		// 状态界面显示
	
	private OrderBomDetail orderBomDetail;
	private OrderBomBase orderBomBase;
	private Project project;
	private Subproject sub;
	private Supplier supp;
	
//	private boolean isSeriesNumber;
	private String isStatus;
	private String glfpGB;			//group by 条件
	private List<String> types;		//查询类型集合
	private List<String> ids;		//查询类型集合
	
	
	public PurchaseDemand() {
		super();
	}

	public PurchaseDemand(String id){
		super(id);
	}
	
	public String getSeriesnumber() {
		return seriesnumber;
	}
	public void setSeriesnumber(String seriesnumber) {
		this.seriesnumber = seriesnumber;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
		this.statusLabUtils(status);
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
	public String getMtype() {
		return mtype;
	}
	public void setMtype(String mtype) {
		this.mtype = mtype;
	}
	public int getSumCount() {
		return sumCount;
	}
	public void setSumCount(int sumCount) {
		this.sumCount = sumCount;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	
	public List<String> getIds() {
		return ids;
	}

	public void setIds(List<String> ids) {
		this.ids = ids;
	}

	//	public boolean isSeriesNumber() {
//		return isSeriesNumber;
//	}
//	public void setisSeriesNumber(boolean isSeriesNumber) {
//		this.isSeriesNumber = isSeriesNumber;
//	}
	public String getGlfpGB() {
		return glfpGB;
	}
	public void setGlfpGB(String glfpGB) {
		this.glfpGB = glfpGB;
	}
	public OrderBomDetail getOrderBomDetail() {
		return orderBomDetail;
	}
	public void setOrderBomDetail(OrderBomDetail orderBomDetail) {
		this.orderBomDetail = orderBomDetail;
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
	public Supplier getSupp() {
		return supp;
	}
	public void setSupp(Supplier supp) {
		this.supp = supp;
	}
	public List<String> getTypes() {
		return types;
	}
	public void setTypes(List<String> types) {
		this.types = types;
	}

	public String getIsStatus() {
		return isStatus;
	}

	public void setIsStatus(String isStatus) {
		this.isStatus = isStatus;
	}
	
	public String getStatusLab() {
		return statusLab;
	}
	/**
	 * 状态转换
	 * @param status
	 */
	public void statusLabUtils(String status){
		if(CommonStatus.PURCHASE_ASSIGN_BH.equals(status)){
			this.statusLab="运营专员指派被运营主管驳回数据";
		}else if(CommonStatus.PURCHASE_DTJ.equals(status)){
			this.statusLab="待提交";
		}else if(CommonStatus.PURCHASE_DSH.equals(status)){
			this.statusLab="待审核";
		}else if(CommonStatus.PURCHASE_DZP_YYZY.equals(status)){
			this.statusLab="待运营专员指派";
		}else if(CommonStatus.PURCHASE_DZP_YYZG.equals(status)){
			this.statusLab="待运营主管指派";
		}else if(CommonStatus.PURCHASE_DZP_YYJL.equals(status)){
			this.statusLab="待运营经理指派";
		}else if(CommonStatus.PURCHASE_DZP_CGZG.equals(status)){
			this.statusLab="待采购主管指派";
		}else if(CommonStatus.PURCHASE_DXD.equals(status)){
			this.statusLab="待下单";
		}else if(CommonStatus.PURCHASE_YXD.equals(status)){
			this.statusLab="已下单";
		}else if(CommonStatus.PURCHASE_DQS.equals(status)){
			this.statusLab="待签收（供应商签收）";
		}else if(CommonStatus.PURCHASE_DFH.equals(status)){
			this.statusLab="待发货";
		}else if(CommonStatus.PURCHASE_YFH.equals(status)){
			this.statusLab="待收货";
		}else if(CommonStatus.PURCHASE_YSH.equals(status)){
			this.statusLab="已收货";
		}
	}
	
	
}