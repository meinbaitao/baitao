/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.contract.entity.BtgConJiaContractDetail;
import com.bt.modules.contract.entity.Laborcontract;
import com.bt.modules.contract.entity.LaborcontractAccount;

/**
 * 劳务台账DAO接口
 * @author yhh
 * @version 2015-12-22
 */
@MyBatisDao
public interface LaborcontractAccountDao extends CrudDao<LaborcontractAccount> {
	
	/**
	 * 由劳务合同id获取台账记录
	 * @param laborContractId
	 * @return
	 */
	public LaborcontractAccount getByLaborContractId(String laborContractId);
	
	/**
	 * 由劳务合同获取甲方合同楼栋信息
	 * @param laborContract
	 * @return
	 */
	public BtgConJiaContractDetail getJiaContractByLaborContract(Laborcontract laborContract);
	
	/**
	 * 由甲方合同楼栋信息获取劳务合同信息
	 * @param laborContract
	 * @return
	 */
	public Laborcontract getLaborContractByJiaContract(Laborcontract laborContract);
}