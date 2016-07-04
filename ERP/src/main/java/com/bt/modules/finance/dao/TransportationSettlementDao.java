/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.finance.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.finance.entity.TransportationSettlement;
import com.bt.modules.finance.entity.TransportationSettlementDetail;

/**
 * 运费结算DAO接口
 * @author yhh
 * @version 2015-12-01
 */
@MyBatisDao
public interface TransportationSettlementDao extends CrudDao<TransportationSettlement> {
	
	/**
	 * 由发货通知单id获取结算信息
	 * @param logisticSend
	 * @return
	 */
	public TransportationSettlement getSettlementByLogisticSendId(String logisticSendId);
	
	/**
	 * 由发货通知单id获取结算明细
	 * @param logisticSend
	 * @return
	 */
	public List<TransportationSettlementDetail> findSettlementDetailByLogisticSendId(String logisticSendId);
	
	/**
	 * 流程数据
	 * @param transportationSettlement
	 * @return
	 */
	public List<TransportationSettlement> findMyTransportationSettlement(TransportationSettlement transportationSettlement);
	public List<TransportationSettlement> findUnAuditTransportationSettlement(TransportationSettlement transportationSettlement);
	public List<TransportationSettlement> findAuditDoneTransportationSettlement(TransportationSettlement transportationSettlement);
	
}