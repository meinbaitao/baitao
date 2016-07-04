/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.finance.dao;

import java.util.List;
import java.util.Map;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.finance.entity.Payment;
import com.bt.modules.finance.entity.TransportationSettlement;

/**
 * 申请付款DAO接口
 * @author yhh
 * @version 2015-10-10
 */
@MyBatisDao
public interface PaymentDao extends CrudDao<Payment> {
	
	/**
	 * 查询所有走完流程的运费登记
	 * @return
	 */
//	public List<Map<String, String>> findAllTransportationSettlement();
	
	/**
	 * 由发货通知单号获取运费登记
	 * @param logisticSend
	 * @return
	 */
//	public TransportationSettlement getTransportationSettlement(String logisticSend);
	
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
	public List<TransportationSettlement> findTransportationSettlement(String paymentId);
	
	/**
	 * 查询运费结算中待结算承运方
	 * @param supplierId
	 * @return
	 */
	public List<Map<String,String>> findSuppliersWaitSettle();
}