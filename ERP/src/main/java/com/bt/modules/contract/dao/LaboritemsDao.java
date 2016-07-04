/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.contract.entity.Laboritems;

/**
 * 劳务清单DAO接口
 * @author yhh
 * @version 2015-11-30
 */
@MyBatisDao
public interface LaboritemsDao extends CrudDao<Laboritems> {
	/**
	 * 根据相应的条件获取列表数据
	 * @param laboritems
	 * @return
	 */
	public List<Laboritems> getByCondition(Laboritems laboritems);
	public void deleteBySubId(Laboritems laboritems);
}