/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.purchase.dao;

import java.util.Date;
import java.util.List;

import com.bt.modules.purchase.entity.PurchaseSFDetail;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 采购收发详细DAO接口
 * @author xiaocai
 * @version 2015-08-07
 */
@MyBatisDao
public interface PurchaseSFDetailDao extends CrudDao<PurchaseSFDetail> {
	/**
	 * 根据订单编号获取收发详情
	 * @param seriesnumber
	 * @return
	 */
	public List<PurchaseSFDetail> getSFDetailByPID(String pID);
	/**
	 * 统计当天数据
	 * @param date
	 * @return
	 */
	public int getToDaysCount(Date date);
	
}