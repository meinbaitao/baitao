/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.contract.entity.LaborItemsPrice;

/**
 * 劳务价格清单库DAO接口
 * @author pc
 * @version 2016-01-27
 */
@MyBatisDao
public interface LaborItemsPriceDao extends CrudDao<LaborItemsPrice> {
	
	//由分项名获取分项
	public LaborItemsPrice getByName(LaborItemsPrice laborItemsPrice);
	/**
	 * 根据条件获取相应的列表数据
	 * @param laborItemsPrice
	 * @return
	 */
	public List<LaborItemsPrice> getByCondition(LaborItemsPrice laborItemsPrice);
	
}