/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.finance.dao;

import java.util.List;
import java.util.Map;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.finance.entity.TransportationPayment;
import com.bt.modules.finance.entity.TransportationSettlement;

/**
 * 运费申请付款DAO接口
 * @author yhh
 * @version 2015-10-10
 */
@MyBatisDao
public interface TransportationPaymentDao extends CrudDao<TransportationPayment> {
	
	/**
	 * 查询所有走完流程的运费登记
	 * @return
	 */
	public List<Map<String, String>> findFinishSettlement();
	
	/**
	 * 由发货通知单号获取运费登记
	 * @param logisticSend
	 * @return
	 */
	public TransportationSettlement getSettlementByNum(String logisticSend);
	
	/**
	 * 查询当天生成付款单数
	 * @param date
	 * @return
	 */
	public int getTodayCount(String date);
	
	/**
	 * 由付款单id查询所有关联结算单
	 * @param paymentId
	 * @return
	 */
	public List<TransportationSettlement> findSettlementByPaymentId(String paymentId);
}