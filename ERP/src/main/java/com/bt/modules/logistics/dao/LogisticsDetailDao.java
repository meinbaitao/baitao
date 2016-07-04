/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.logistics.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.logistics.entity.LogisticsDetail;

/**
 * 发货清单DAO接口
 * @author yhh
 * @version 2015-11-05
 */
@MyBatisDao
public interface LogisticsDetailDao extends CrudDao<LogisticsDetail> {
	
	/**
	 * 由箱id获取发货详情
	 * @param orderBomBoxId
	 * @return
	 */
	public List<LogisticsDetail> findMaterialsByBoxId(String orderBomBoxId);
}