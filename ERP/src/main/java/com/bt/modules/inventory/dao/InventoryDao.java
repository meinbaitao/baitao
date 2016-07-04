/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.inventory.dao;

import java.util.Date;
import java.util.List;

import com.bt.modules.inventory.entity.Inventory;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 库存表DAO接口
 * @author xiaocai
 * @version 2016-1-18
 */
@MyBatisDao
public interface InventoryDao extends CrudDao<Inventory> {
	/**
	 * 统计下料相关数据
	 * @param inventory
	 * @return
	 */
	public List<Inventory> getGFLObbaseListData(Inventory inventory);
	
	public Inventory getObbaseDataByID(Inventory inventory);
	/**
	 * 获取出库数量
	 * @param inventory
	 * @return
	 */
	public Inventory getInventoryOutQuantity(Inventory inventory);
	
	/**
	 * 获取当天新增的数据数量
	 * @param date
	 * @return
	 */
	public int getTodayCount(Date date);
	
	/**
	 * 更新库存数量
	 * @param entity
	 * @return
	 */
	public int updateQuantity(Inventory inventory);
	/**
	 * 验证单个数据是否存在
	 * @param inventory
	 * @return
	 */
	public Inventory getByOne(Inventory inventory);
	/**
	 * 获取列表数据
	 * @param inventory
	 * @return
	 */
	public List<Inventory> getPageData(Inventory inventory);
	/**
	 * 石材 领料界面项目列表
	 * @param map
	 * @return
	 */
	public List<Inventory> getSCInvDataByCondition(Inventory inventory);
	/**
	 * 钢辅料 领料界面项目列表
	 * @param map
	 * @return
	 */
	public List<Inventory> getGFLInvDataByCondition(Inventory inventory);
	/**
	 * 根据相应的条件获取库存量
	 * @param inventory
	 * @return
	 */
	public List<Inventory> getQuantityByCondition(Inventory inventory);
}