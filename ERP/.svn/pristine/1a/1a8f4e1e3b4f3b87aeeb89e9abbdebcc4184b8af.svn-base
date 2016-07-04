/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.purchase.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.bt.modules.purchase.entity.PurchaseDemand;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 采购需求单DAO接口
 * @author 采购需求单
 * @version 2015-08-07
 */
@MyBatisDao
public interface PurchaseDemandDao extends CrudDao<PurchaseDemand> {
	/**
	 * 
	 * @param purchaseDemand
	 * @return
	 */
	public List<PurchaseDemand> getListForProject(PurchaseDemand purchaseDemand);
	
	/**
	 * 
	 * @param purchaseDemand
	 * @return
	 */
	public List<PurchaseDemand> getListForDatatrack(PurchaseDemand purchaseDemand);
	
	
	/**
	 * 根据条件获取下单总量
	 * @param map
	 * @return
	 */
	public List<Map<String,Object>> getObbCount(Map<String,Object> map);
	/**
	 * 根据条件获取指派数据（含状态）总量
	 * @param map
	 * @return
	 */
	public List<Map<String,Object>> getAssignCount(Map<String,Object> map);
	
	public List<PurchaseDemand> groupByTypeToIDs(Map<String,Object> map);
	/**
	 * 根据IDS获取相应的列表数据
	 * @param map
	 * @return
	 */
	public List<PurchaseDemand> getByIDs(List<String> ids);
	/**
	 * 根据申购编号获取相应的列表数据
	 * @param seriesnumber
	 * @return
	 */
	public List<PurchaseDemand> getBySeriesNumber(String seriesnumber);
	/**
	 * 获取当天时间内新增的数据量
	 * @param date
	 * @return
	 */
	public int getToDaysCount(Date date);
	/**
	 * 根据材料类型进行分组
	 * @return
	 */
	public List<Map<String,Object>> groupByType();
	/**
	 * 统计相关显示的数值
	 * @param map
	 * @return
	 */
	public int sumTotal(Map<String,Object> map); 
	/**
	 * 根据申购编号删除对应的数据列表
	 * @param seriesnumber
	 */
	public void delBySeriesnumber(String seriesnumber);
	/**
	 * 根据ids修改要求到货时间
	 * @param purchaseDemand
	 */
	public void updateExpectDateByIds(PurchaseDemand purchaseDemand);
	
}