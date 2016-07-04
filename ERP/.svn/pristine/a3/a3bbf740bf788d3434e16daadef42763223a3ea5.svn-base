/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.purchase.entity;

import java.util.Date;
import java.util.List;

import com.bt.modules.contract.entity.PurchasingContractBase;
import com.bt.modules.supplier.entity.Supplier;
import com.bt.modules.todotask.entity.TodoTask;
import com.bt.modules.utils.CommonStatus;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 采购订单Entity
 * @author xiaocai
 * @version 2015-08-07
 */
public class Purchase extends DataEntity<Purchase> {
	
	private static final long serialVersionUID = 1L;
	private String seriesnumber;		// 编号
	private String type;		// 采购类型
	private String mtype;		// 材料型号(10#槽钢....)---名称
	private String status;		// 状态
	private String isProvince;		// 省内、省外....
	private User purchaseby;		// 采购员
	private int count;			// 采购下单数量
	private double price;		// 采购价格
	private Date requireDate;	// 创建日期
	
	private String statusLab;		// 状态界面显示
	private String sumCount;		//下单总量
	private String sendCount;		//已发总量
	private PurchaseDemand purchaseDemand;	//采购详情
	private PurchaseSFDetail purchaseSFDetail;	//收发详情
	private Supplier supp;		//供应商数据
	private Supplier supp2;		//收货地址(镀锌厂)
	private PurchasingContractBase purchasingContractBase;		//采购合同
	
//	private boolean isSeriesNumber;//判断是否需要进行分组
	private String isStatus;		// 状态大于此状态
	private String psdType;			//收发详情类型	
	private String glfpGB;		//分组条件
	private List<String> types;//判断是否需要进行分组
	private List<String> seriesNumbers;//判断是否需要进行分组
	private List<String> ids;	//批量数据
	
	/**
	 * 待办对象
	 * 先占时放在这里，以后可以抽取出为基类继承。
	 * 许俊雄 20160511
	 */
	private TodoTask todoTask;
	
	public Purchase() {
		super();
	}

	public Purchase(String id){
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
		this.statusLabUtils(status);
		this.status = status;
	}
	public User getPurchaseby() {
		return purchaseby;
	}
	public void setPurchaseby(User purchaseby) {
		this.purchaseby = purchaseby;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Supplier getSupp() {
		return supp;
	}
	public void setSupp(Supplier supp) {
		this.supp = supp;
	}
	public String getMtype() {
		return mtype;
	}
	public void setMtype(String mtype) {
		this.mtype = mtype;
	}

	public Supplier getSupp2() {
		return supp2;
	}

	public void setSupp2(Supplier supp2) {
		this.supp2 = supp2;
	}

	public PurchaseDemand getPurchaseDemand() {
		return purchaseDemand;
	}

	public void setPurchaseDemand(PurchaseDemand purchaseDemand) {
		this.purchaseDemand = purchaseDemand;
	}

	public List<String> getTypes() {
		return types;
	}

	public void setTypes(List<String> types) {
		this.types = types;
	}

	public List<String> getSeriesNumbers() {
		return seriesNumbers;
	}

	public void setSeriesNumbers(List<String> seriesNumbers) {
		this.seriesNumbers = seriesNumbers;
	}

	public PurchasingContractBase getPurchasingContractBase() {
		return purchasingContractBase;
	}

	public void setPurchasingContractBase(
			PurchasingContractBase purchasingContractBase) {
		this.purchasingContractBase = purchasingContractBase;
	}

	public PurchaseSFDetail getPurchaseSFDetail() {
		return purchaseSFDetail;
	}

	public void setPurchaseSFDetail(PurchaseSFDetail purchaseSFDetail) {
		this.purchaseSFDetail = purchaseSFDetail;
	}

	public String getGlfpGB() {
		return glfpGB;
	}

	public void setGlfpGB(String glfpGB) {
		this.glfpGB = glfpGB;
	}

	public List<String> getIds() {
		return ids;
	}

	public void setIds(List<String> ids) {
		this.ids = ids;
	}

	public Date getRequireDate() {
		return requireDate;
	}

	public void setRequireDate(Date requireDate) {
		this.requireDate = requireDate;
	}

	public String getStatusLab() {
		return statusLab;
	}
	
	public String getIsStatus() {
		return isStatus;
	}

	public void setIsStatus(String isStatus) {
		this.isStatus = isStatus;
	}

	public String getSendCount() {
		return sendCount;
	}

	public void setSendCount(String sendCount) {
		this.sendCount = sendCount;
	}

	public String getSumCount() {
		return sumCount;
	}

	public void setSumCount(String sumCount) {
		this.sumCount = sumCount;
	}

	public String getPsdType() {
		return psdType;
	}

	public void setPsdType(String psdType) {
		this.psdType = psdType;
	}

	public String getIsProvince() {
		return isProvince;
	}

	public void setIsProvince(String isProvince) {
		this.isProvince = isProvince;
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

	public TodoTask getTodoTask() {
		return todoTask;
	}

	public void setTodoTask(TodoTask todoTask) {
		this.todoTask = todoTask;
	}
	
	
	
}