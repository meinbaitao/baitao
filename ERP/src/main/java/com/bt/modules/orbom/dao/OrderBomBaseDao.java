/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.orbom.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.bt.modules.orbom.entity.OrderBomBase;
import com.bt.modules.project.entity.Subproject;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 下料单基本表DAO接口
 * @author ljp
 * @version 2015-08-05
 */
@MyBatisDao
public interface OrderBomBaseDao extends CrudDao<OrderBomBase> {
	//public List<HashMap> getAllBomAndProjInfo();

	/**
	 * 获取当天新增的数据数量
	 * @param date
	 * @return
	 */
	public int getTodayCount(Date date);
	
	/**
	 * 提供给采购单
	 */
	public List<OrderBomBase> findListForPurchase(OrderBomBase orderBomBase);
	
	/**
	 * 修改流程Id和状态
	 * @param orderBomBase
	 * @return
	 */
	public int updateWorkflowId(OrderBomBase orderBomBase);

	/**
	 * 查询二级信息下面的所有石材下料单
	 * @param paramMap
	 * @return
	 */
	public List<OrderBomBase> findAllOrderBySubProjForSC(Map paramMap);


	/**
	 * 查询二级信息下面的所有钢辅料下料单
	 * @param paramMap
	 * @return
	 */
	public List<OrderBomBase> findAllOrderBySubProjForGFL(Map paramMap);

	/**
	 * 获取下料单的相应的统计值
	 * @param orderBomBase
	 * @return
	 */
	public Map<String,Object> getOrderBomCountVal(OrderBomBase orderBomBase);
	/**
	 * 获取石材进度跟进页面列表数据
	 * @param orderBomBase
	 * @return
	 */
	public List<OrderBomBase> getListForStoneSchedule(OrderBomBase orderBomBase);
	/**
	 * 获取库存界面需要的数据
	 * @param orderBomBase
	 * @return
	 */
	public List<OrderBomBase> getListToInventory(OrderBomBase orderBomBase);

	/**
	 * 获取下料单编号
	 * @param orderBomNo
	 * @return
	 */
	public String findOrderBomNo(String orderBomNo);
}