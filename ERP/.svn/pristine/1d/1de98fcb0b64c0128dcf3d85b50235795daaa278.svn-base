/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.inventory.dao;

import java.util.List;
import java.util.Map;

import com.bt.modules.inventory.entity.StandingBook;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 库存台帐表DAO接口
 * @author xiaocai
 * @version 2016-1-18
 */
@MyBatisDao
public interface StandingBookDao extends CrudDao<StandingBook> {
	/**
	 * date 日期
	 * tranType 业务类型
	 * @param date
	 * @return
	 */
	public int getTodayCount(Map<String,Object> map);
	/**
	 * 获取接收人分组数据
	 * 2015年11月17日
	 * @param standingBook
	 * @return
	 */
	public List<StandingBook> getGBSendee(StandingBook standingBook);
}