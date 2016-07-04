/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.orbom.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.orbom.entity.OrderBomDetail;

/**
 * 下料单明细表DAO接口
 * @author ljp
 * @version 2015-08-05
 */
@MyBatisDao
public interface OrderBomDetailDao extends CrudDao<OrderBomDetail> {
	public int deleteByOId(OrderBomDetail entity);
	
	public int deleteByOIdUp(OrderBomDetail entity);
	/**
	 * 提供给采购
	 * @param orderBomDetail
	 * @return
	 */
	public List<OrderBomDetail> findListForPurchase(OrderBomDetail orderBomDetail);
	
	/**
	 * 查询箱号
	 * @param orderBomBase
	 * @return
	 */
	public List<OrderBomDetail> findBoxNo(OrderBomDetail orderBomDetail);
	
	/**
	 * 获取明细对象
	 * @param orderBomDetail
	 * @return
	 */
	public List<OrderBomDetail> getOrderBomDetail(OrderBomDetail orderBomDetail);

	/**
	 * 查询某个下料单下面的所有箱号，并去重
	 * @param orderBomId
	 * @return
	 */
	public List<String> findBoxesByOrderId(String orderBomId);
	/**
	 * 查看库存列表数据
	 * @param orderBomDetail
	 * @return
	 */
	public List<OrderBomDetail> getListToInventory(OrderBomDetail orderBomDetail);
	/**
	 * 根据条件统计相应的下料总量
	 * @param orderBomDetail
	 * @return
	 */
	public int countByCondition(OrderBomDetail orderBomDetail);
	/**
	 * 根据下料单id查询立面方向
	 * @param orderBomDetail
	 * @return
	 */
	public List<String> selectOutsideWallOrientation(String orderBomId);

}