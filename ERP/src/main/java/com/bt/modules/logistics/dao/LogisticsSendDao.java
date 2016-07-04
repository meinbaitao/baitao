/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.logistics.dao;


import java.util.Date;
import java.util.List;
import java.util.Map;

import com.bt.modules.logistics.entity.LogisticsSend;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 物流管理-发货通知DAO接口
 * @author xiaocai
 * @version 2016-1-14
 */
@MyBatisDao
public interface LogisticsSendDao extends CrudDao<LogisticsSend> {
	/**
	 * 发货信息汇总
	 * @param logisticsSend
	 * @return
	 */
	public List<LogisticsSend> sendDataSummary(LogisticsSend logisticsSend);
	/**
	 * 发、收货-列表数据
	 * @param logisticsSend
	 * @return
	 */
	public List<LogisticsSend> sendReceiveList(LogisticsSend logisticsSend);
	/**
	 * 统计已发货箱数
	 * @param logisticsSend
	 * @return
	 */
	public int countBoxByCondition(LogisticsSend logisticsSend);
	/**
	 * 获取物流的详情数据
	 * @param logisticsSend
	 * @return
	 */
	public List<LogisticsSend> getLogisticsSendDetail(LogisticsSend logisticsSend);
	/**
	 * 根据条件获取对应的物流单数据
	 * @return
	 */
	public List<LogisticsSend> getListLogisticsSendByCondition(LogisticsSend logisticsSend);
	
	
	/**
	 * 
	 * @param logisticsSend
	 * @return
	 */
	public List<LogisticsSend> getListToAccident(LogisticsSend logisticsSend);
	/**
	 * 根据对应的条件获取相应的数据
	 * @param logisticsSend
	 * @return
	 */
	public LogisticsSend getOne(LogisticsSend logisticsSend);
	/**
	 * 获取当天新增的数据数量
	 * @param date
	 * @return
	 */
	public int getTodayCount(Date date);
	public int getThisYearCount(Date date);
	/**
	 * 根据发货单ID获取箱的数据
	 * @param lsID
	 * @return
	 */
	public List<Map<String,Object>> getBoxsBylsID(String lsID);
}