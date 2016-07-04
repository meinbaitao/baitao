/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.purchase.dao;

import java.util.List;
import java.util.Map;

import com.bt.modules.purchase.entity.PurchaseDemandAssign;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 运营指派采购需求量DAO接口
 * @author xiaocai
 * @version 2015-11-05
 */
@MyBatisDao
public interface PurchaseDemandAssignDao extends CrudDao<PurchaseDemandAssign> {
	/**
	 * 根据 采购需求id 获取对应的指派记录条数
	 * @param ids
	 * @return
	 */
	public List<Map<String,Object>> getListCount(List<String> ids);
	/**
	 * 根据条件进行数据查询
	 * @param purchaseDemandAssign
	 * @return
	 */
	public List<PurchaseDemandAssign> getListByCondition(PurchaseDemandAssign purchaseDemandAssign);
	/**
	 * 
	 * @param purchaseDemandAssign
	 * @return
	 */
	public void updateStatusByDemandIDs(PurchaseDemandAssign purchaseDemandAssign);
	
}