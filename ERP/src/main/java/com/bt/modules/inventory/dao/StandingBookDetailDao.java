/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.inventory.dao;

import java.util.List;

import com.bt.modules.inventory.entity.StandingBookDetail;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 库存台帐明细表DAO接口
 * @author xiaocai
 * @version 2016-1-18
 */
@MyBatisDao
public interface StandingBookDetailDao extends CrudDao<StandingBookDetail> {
	/**
	 * 台账列表
	 * @param standingBookDetail
	 * @return
	 */
	public List<StandingBookDetail> getStandingBookDetailList(StandingBookDetail standingBookDetail);
	/**
	 * 根据条件统计对应的操作数量
	 * @param standingBookDetail
	 * @return
	 */
	public int countQuantityByCondition(StandingBookDetail standingBookDetail);
	/**
	 * 获取对应材料的剩余量
	 * @param standingBookDetail
	 * @return
	 */
	public int getSurplusByCondition(StandingBookDetail standingBookDetail);
	
}