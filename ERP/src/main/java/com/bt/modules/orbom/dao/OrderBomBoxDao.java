/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.orbom.dao;

import java.util.Map;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.orbom.entity.OrderBomBox;

/**
 * 下料单箱信息表DAO接口
 * @author ljp
 * @version 2015-08-07
 */
@MyBatisDao
public interface OrderBomBoxDao extends CrudDao<OrderBomBox> {
	public void updateOneBoxStatus(OrderBomBox orderBomBox);
	/**
	 * 根据相应的条件统计相应的箱数据
	 * @param map
	 * @return
	 */
	public int countByMap(Map<String,Object> map);
}