/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.purchase.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.activiti.constants.ActivitiConstants;
import com.bt.modules.activiti.interfaces.ProcessDataHandler;
import com.bt.modules.orbom.entity.OrderBomDetail;
import com.bt.modules.purchase.dao.PurchaseDao;
import com.bt.modules.purchase.entity.Purchase;
import com.bt.modules.purchase.entity.PurchaseSFDetail;
import com.bt.modules.utils.CommonStatus;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 采购订单Service
 * @author xiaocai
 * add function by 许俊雄 20160511
 * @version 2015-08-07
 */
@Service(PurchaseService.BEAN_NAME)
@Transactional(readOnly = true)
public class PurchaseService extends CrudService<PurchaseDao, Purchase> implements ProcessDataHandler {
    
	public static final String BEAN_NAME = "com.bt.modules.purchase.service.PurchaseService";
		
	@Autowired
	PurchaseDao purchaseDao;
	
	
	/**
	 * start 2015年11月9日
	 */
	/**
	 * 根据需求的ids查看已经采购的数量
	 * @param ids
	 * @return
	 */
	public Map<String,Integer> getPurchaseCountByDemandIds(List<String> ids){
		if(ids==null||ids.size()==0){
			return new HashMap<String,Integer>();
		}
		Map<String,Integer> mapPC = new HashMap<String,Integer>();
		for(String key : ids){
			mapPC.put(key, 0);
		}
		List<Purchase> listP = purchaseDao.getPurchaseCountByDemandIds(ids);
		for(Purchase p:listP){	//循环填充结果
			mapPC.put(p.getPurchaseDemand().getId(), p.getCount());
		}
		return mapPC;
	}
	
	/**
	 * start 2015年11月9日
	 */
	/**
	 * 根据需求的ids查看已经采购的数量
	 * @param ids
	 * @return
	 */
	public Map<String,PurchaseSFDetail> getSFCountByDemandIds(List<String> ids){
		if(ids==null||ids.size()==0){
			return new HashMap<String,PurchaseSFDetail>();
		}
		Map<String,PurchaseSFDetail> mapSF = new HashMap<String,PurchaseSFDetail>();
		List<Purchase> listP = purchaseDao.getSFCountByDemandIds(ids);
		for(Purchase p:listP){	//循环填充结果
			mapSF.put(p.getPurchaseDemand().getId(), p.getPurchaseSFDetail());
		}
		return mapSF;
	}
	
	/**
	 * 批量插入采购订单数据
	 * @param listP
	 */
	@Transactional(readOnly = false)
	public void batchInsert(List<Purchase> listP){
		for(Purchase p:listP){
			p.setCreateBy(UserUtils.getUser());
			purchaseDao.insert(p);
		}
	}
	/**
	 * 获取分页数据
	 * @param page
	 * @param purchase
	 * @return
	 */
	public Page<Purchase> getPageData(Page<Purchase> page, Purchase purchase) {
		purchase.setPage(page);
		page.setList(this.getPageListData(purchase));
		return page;
	}
	public List<Purchase> getPageListData(Purchase purchase){
		List<Purchase> list = purchaseDao.getPageData(purchase);
		if(list==null){
			list = new ArrayList<Purchase>();
		}
		return list;
	}
	/**
	 * 供应商查看列表数据
	 * @param page
	 * @param purchase
	 * @return
	 */
	public Page<Purchase> purchaseGYSSendList(Page<Purchase> page, Purchase purchase) {
		purchase.setPage(page);
		List<Purchase> list = this.getPageListData(purchase);
//		p.count-p.purchaseSFDetail.fcount
		List<Purchase> listP = new ArrayList<Purchase>();
		int count = 0;
		int fcount = 0;
		for(Purchase p:list){
			count = 0;
			fcount = 0;
			listP = this.getDetailBySeriesNumberGFL(p.getSeriesnumber());
			for(Purchase obj:listP){
				count+=obj.getCount();
				fcount+=obj.getPurchaseSFDetail().getFcount();
			}
			if(fcount==0){	//待发货
				p.getExtraData().put("status", "待发货");
			}else if(fcount<count){	//部分发货
				p.getExtraData().put("status", "部分发货");
			}else if(fcount>=count){	//已发货
				p.getExtraData().put("status", "已发货");
			}
		}
		page.setList(list);
		return page;
	}
	/**
	 * 工地收货列表数据
	 * @param page
	 * @param purchase
	 * @return
	 */
	public Page<Purchase> purchaseGDReceiveList(Page<Purchase> page, Purchase purchase) {
		purchase.setPage(page);
		List<Purchase> list = this.getPageListData(purchase);
		List<Purchase> listP = new ArrayList<Purchase>();
		int count = 0;
		int scount = 0;
		for(Purchase p:list){
			count = 0;
			scount = 0;
			listP = this.getDetailBySeriesNumberGFL(p.getSeriesnumber());
			for(Purchase obj:listP){
				count+=obj.getCount();
				scount+=obj.getPurchaseSFDetail().getScount();
			}
			if(scount==0){				//待收货
				p.getExtraData().put("status", "待收货");
			}else if(scount<count){		//部分收货
				p.getExtraData().put("status", "部分收货");
			}else if(scount>=count){	//已收货
				p.getExtraData().put("status", "已收货");
			}
		}
		page.setList(list);
		return page;
	}
	/**
	 * 根据编号修改数据状态
	 * @param seriesNumber
	 * @param status
	 */
	@Transactional(readOnly = false)
	public void updateStatusBySeriesNumbers(List<String> seriesNumbers,String status) {
		if(seriesNumbers==null || seriesNumbers.size()==0){
			return;
		}
		Purchase purchase = new Purchase();
		purchase.setSeriesNumbers(seriesNumbers);
		purchase.setStatus(status);
		purchaseDao.updateBySeriesNumbers(purchase);
	}
	/**
	 * 流程完成进行修改数据
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void processFinishedNotify(Map<String, Object> variables) {
		List<String> listIDs = (List<String>) variables.get(ActivitiConstants.IDS);
		List<Purchase> listP = new ArrayList<Purchase>();
		for(String id:listIDs){
			Purchase p = new Purchase();
			p.setId(id);
			p.setWorkflowstatus(CommonStatus.WORK_FLOW_END);
			p.setStatus(CommonStatus.PURCHASE_DQS);
			
			listP.add(p);
		}
		this.batchUpdateByID(listP);
	}
	/**
	 * 根据条件获取详细的现场库存需要的数据
	 * @param purchase
	 * @return
	 */
	public List<Purchase> getDetailForInv(List<String> ids) {
		Purchase purchase = new Purchase();
		purchase.setIds(ids);
//		purchase.setGlfpGB("inv");
		purchase.setGlfpGB("purchaseId");
		return this.getDetailByCondition(purchase);
	}
	
	/**
	 * 修改数据
	 * @param purchase
	 */
	@Transactional(readOnly = false)
	public void update(Purchase purchase) {
		purchaseDao.update(purchase);
	}
	/**
	 * 根据ID修改数据
	 * @param purchase
	 */
	@Transactional(readOnly = false)
	public void updateByID(Purchase purchase) {
		purchaseDao.updateByID(purchase);
	}
	/**
	 * 根据ID批量修改数据
	 * @param purchase
	 */
	@Transactional(readOnly = false)
	public void batchUpdateByID(List<Purchase> listP) {
		for(Purchase p:listP){
			purchaseDao.updateByID(p);
		}
	}
	/**
	 * 根据ids批量修改数据状态
	 * @param ids
	 * @param status
	 */
	public void batchUpdateByIDs(List<String> ids,String status) {
		if(ids.size()==0){
			return;
		}
		List<Purchase> listP = new ArrayList<Purchase>();
		for(String id:ids){
			Purchase p = new Purchase();
			p.setId(id);
			p.setStatus(status);
			listP.add(p);
		}
		this.batchUpdateByID(listP);
	}
	/**
	 * 根据id查询批量数据
	 * @param ids
	 * @return
	 */
	public List<Purchase> getByIDs(List<String> ids) {
		//不传送ID则直接返回空集合
		if(ids==null||ids.size()==0){
			return new ArrayList<Purchase>();
		}
		List<Purchase> list = purchaseDao.getByIDs(ids);
		if(list == null){
			list = new ArrayList<Purchase>();
		}
		return list;
	}
	/**
	 * 获取当天新增的数量
	 * @param currentDate
	 * @return
	 */
	public int getToDaysCount(Date currentDate){
		if(currentDate==null){
			currentDate = new Date();
		}
		return purchaseDao.getToDaysCount(currentDate);
	}
	/**
	 * 获取对应的单个详情
	 * @param purchase
	 * @return
	 */
	public Purchase getDetail(Purchase purchase) {
		Purchase obj = purchaseDao.getDetail(purchase);
		if(obj==null){
			return new Purchase();
		}
		return obj;
	}
	/**
	 * 根据ID获取单个详情
	 * @param id
	 * @return
	 */
	public Purchase getDetailByID(String id) {
		return this.getDetail(new Purchase(id));
	}
	public Page<Purchase> findPage(Page<Purchase> page, Purchase purchase) {
		return super.findPage(page, purchase);
	}
	/**
	 * 钢辅料查看详情数据
	 * @param page
	 * @param purchase
	 * @return
	 */
	public List<Purchase> getDetailByCondition(Purchase purchase) {
		List<Purchase> list = purchaseDao.getDetailByCondition(purchase);
		if(list==null){
			list = new ArrayList<Purchase>();
		}
		return list;
	}
	/**
	 * 根据采购编号获取相应的详情列表数据
	 * @param seriesNumber
	 * @return
	 */
	public List<Purchase> getDetailBySeriesNumberGFL(String seriesNumber) {
		Purchase purchase = new Purchase();
		purchase.setSeriesnumber(seriesNumber);
		purchase.setGlfpGB("purchaseId");
		List<Purchase> list = this.getDetailByCondition(purchase);
		return list;
	}
	/**
	 * 查询分组的列表数据
	 * @param page
	 * @param purchase
	 * @return
	 */
	public Page<Purchase> findPageGroupBySeriesNumber(Page<Purchase> page, Purchase purchase) {
		purchase.setGlfpGB("seriesnumber");
		return super.findPage(page, purchase);
	}
	/**
	 * 
	 * @param purchase
	 * @return
	 */
	public List<Purchase> getListToAccident(Purchase purchase){
		List<Purchase> listP = purchaseDao.getListToAccident(purchase);
		if(listP==null||listP.size()==0){
			listP = new ArrayList<Purchase>();
		}
		return listP;
	}
	/**
	 * 查询我创建的
	 * @param page
	 * @param purchase
	 * @return
	 */
	public Page<Purchase> findMyPurchase(Page<Purchase> page, Purchase purchase) {
		purchase.setPage(page);
		page.setList(purchaseDao.findMyPurchase(purchase));
		return page;
	}
	/**
	 * 待审核
	 * @param page
	 * @param purchase
	 * @return
	 */
	public Page<Purchase> findUnAuditPurchase(Page<Purchase> page, Purchase purchase) {
		purchase.setPage(page);
		page.setList(purchaseDao.findUnAuditPurchase(purchase));
		return page;
	}
	/**
	 * 经手的数据
	 * @param page
	 * @param purchase
	 * @return
	 */
	public Page<Purchase> findAuditDonePurchase(Page<Purchase> page, Purchase purchase) {
		purchase.setPage(page);
		page.setList(purchaseDao.findAuditDonePurchase(purchase));
		return page;
	}
	/**
	 * end 2015年11月9日
	 */
	
	/**
	 * 查询待办信息
	 * 20160511
	 * 许俊雄
	 * @param id
	 * @return
	 */
	public Purchase getTodoInfo(String id){
		return purchaseDao.getTodoInfo(id);
	}
	
	
	
	
	
	public Purchase get(String id) {
		return super.get(id);
	}
	
	public List<Purchase> findList(Purchase purchase) {
		return super.findList(purchase);
	}
	
	@Transactional(readOnly = false)
	public void save(Purchase purchase) {
		super.save(purchase);
	}
	
	@Transactional(readOnly = false)
	public void delete(Purchase purchase) {
		super.delete(purchase);
	}


	public List<String> getUniqueIdentifies(String status){
		return dao.getUniqueIdentifies(status);
	}

	public List<OrderBomDetail> getOrderDetailByPurchaseNO(String seriesNumber){
		return dao.getOrderDetailByPurchaseNO(seriesNumber);
	}

	public Purchase getOnePurchaseByOrderId(String orderBomId){
		return dao.getOnePurchaseByOrderId(orderBomId);
	}

	public Purchase getOnePurchaseBySeriesNumber(String seriesNumber){
		return dao.getOnePurchaseBySeriesNumber(seriesNumber);
	}
	
}