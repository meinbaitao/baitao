/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.contract.entity.ManufContractBase;

/**
 * 生产合同基本表DAO接口
 * @author yhh
 * @version 2015-08-01
 */
@MyBatisDao
public interface ManufContractBaseDao extends ConContainDetailDao<ManufContractBase> {
	
	/**
	 * 有合同编号获取合同
	 * @param mcb
	 * @return
	 */
	public  ManufContractBase getByContractId(ManufContractBase	mcb);
	
	
	/**
	 * 
	 * @param mcb
	 * @return
	 */
	public List<ManufContractBase> findMyManufContractBase(ManufContractBase mcb);
	public List<ManufContractBase> findUnAuditManufContractBase(ManufContractBase mcb);
	public List<ManufContractBase> findAuditDoneManufContractBase(ManufContractBase mcb);

}