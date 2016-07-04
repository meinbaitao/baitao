/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.purchase.dao;

import java.util.Date;
import java.util.List;

import com.bt.modules.orbom.entity.OrderBomDetail;
import com.bt.modules.purchase.entity.Purchase;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 采购订单DAO接口
 * @author xiaocai
 * @version 2015-08-07
 */
@MyBatisDao
public interface PurchaseDao extends CrudDao<Purchase> {
	/**
	 * 根据需求的ids查看已经采购的数量
	 * @param ids
	 * @return
	 */
	public List<Purchase> getPurchaseCountByDemandIds(List<String> ids);
	
	/**
	 * 根据需求的ids查看已经收发的数量
	 * @param ids
	 * @return
	 */
	public List<Purchase> getSFCountByDemandIds(List<String> ids);
	
	public List<Purchase> getPageData(Purchase purchase);
	
	/**
	 * 根据采购单编号修改相关采购单数据
	 * @param seriesNumber
	 */
	public void updateBySeriesNumbers(Purchase purchase);
	/**
	 * 钢辅料根据相关条件查看详情数据
	 * @param purchase
	 * @return
	 */
	public List<Purchase> getDetailByCondition(Purchase purchase);
	/**
	 * 执行修改数据
	 * @param purchase
	 */
	public void updateByID(Purchase purchase);
	/**
	 * 获取需要入库的现场库存详细数据
	 * @param purchase
	 * @return
	 */
	public List<Purchase> getDetailForInv(Purchase purchase);
	
	
	/**
	 * 获取当天新增的数量
	 * @param currentDate
	 * @return
	 */
	public int getToDaysCount(Date currentDate);
	/**
	 * 根据Id查询列表数据
	 * @param ids
	 * @return
	 */
	public List<Purchase> getByIDs(List<String> ids);
	/**
	 * 获取详情
	 * @param purchase
	 * @return
	 */
	public Purchase getDetail(Purchase purchase);
	
	/**
	 * 
	 * @param purchase
	 * @return
	 */
	public List<Purchase> getListToAccident(Purchase purchase);

	/**
	 * 查询某种状态的所有采购单编号，并且去重
	 * @param status
	 * @return
	 */
	public List<String> getUniqueIdentifies(String status);

	/**
	 * 通过采购单编号，拿到对应的所有的下料单明细
	 * @param seriesNumber
	 * @return
	 */
	public List<OrderBomDetail> getOrderDetailByPurchaseNO(String seriesNumber);

	/**
	 *  通过下料单id查询出对应的一条采购单
	 * @param orderBomId
	 * @return
	 */
	public Purchase getOnePurchaseByOrderId(String orderBomId);


	/**
	 * 通过一条采购单编号，查询一条采购单
	 * @param seriesNumber
	 * @return
	 */
	public Purchase getOnePurchaseBySeriesNumber(String seriesNumber);
	
	/**
	 * 查看我创建的
	 * @param purchase
	 * @return
	 */
	public List<Purchase> findMyPurchase(Purchase purchase);
	/**
	 * 查看待处理数据
	 * @param purchase
	 * @return
	 */
	public List<Purchase> findUnAuditPurchase(Purchase purchase);
	/**
	 * 查看经手数据
	 * @param purchase
	 * @return
	 */
	public List<Purchase> findAuditDonePurchase(Purchase purchase);
	
	/**
	 * 查询待办所需信息-许俊雄
	 * @param id
	 * @return
	 */
	public Purchase getTodoInfo(String id);
	
}