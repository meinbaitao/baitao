/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.contract.entity.PurchasingContractBase;

/**
 * purchasingDAO接口
 * @author yhh
 * @version 2015-08-11
 */
@MyBatisDao
public interface PurchasingContractBaseDao extends ConContainDetailDao<PurchasingContractBase> {
	
	/**
	 * 有合同编号获取合同
	 * @param mcb
	 * @return
	 */
	public  PurchasingContractBase getByContractId(PurchasingContractBase pcb);
	/**
	 * 对名字进行分组	get list group by name
	 * @return
	 */
	public List<PurchasingContractBase> getListGBName(PurchasingContractBase pcb);
	/**
	 * 根据条件获取相应合同列表数据
	 * @return
	 */
	public List<PurchasingContractBase> getListByCondition(PurchasingContractBase pcb);
	
	
	/**
	 * 查询流程相关数据
	 * @param pcb
	 * @return
	 */
	public List<PurchasingContractBase> findMyPurchasingContractBase(PurchasingContractBase pcb);
	public List<PurchasingContractBase> findUnAuditPurchasingContractBase(PurchasingContractBase pcb);
	public List<PurchasingContractBase> findAuditDonePurchasingContractBase(PurchasingContractBase pcb);

}