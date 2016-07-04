/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.inventory.dao;

import java.util.List;

import com.bt.modules.inventory.entity.Depot;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 仓库信息DAO接口
 * @author xiaocai
 * @version 2016-1-18
 */
@MyBatisDao
public interface DepotDao extends CrudDao<Depot> {
	/**
	 * start 2015年11月11日
	 */
	
	/**
	 * 获取唯一的库存信息
	 * @param depot
	 * @return
	 */
	public Depot getOne(Depot depot);
	/**
	 * 根据对应的条件获取相应的列表数据
	 * @param depot
	 * @return
	 */
	public List<Depot> getListByCondition(Depot depot);
	
	/**
	 * end 2015年11月11日
	 */
	
//	public List<Depot> findListByUserId(Depot depot);
	/**
	 * 根据名称获取对应的数据
	 * @param name
	 * @return
	 */
	public Depot getByUserID(String userID);
	public Depot getByDepotName(String depotName);
}