/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.contract.entity.AccCarriageContractBase;

/**
 * 辅料运输合同DAO接口
 * @author yhh
 * @version 2015-08-11
 */
@MyBatisDao
public interface AccCarriageContractBaseDao extends ConContainDetailDao<AccCarriageContractBase> {
	
	/**
	 * 有合同编号获取合同
	 * @param accb
	 * @return
	 */
	public  AccCarriageContractBase getByContractId(AccCarriageContractBase accb);
	
	/**
	 * 
	 * @param accb
	 * @return
	 */
	public List<AccCarriageContractBase> findMyAccCarriageContractBase(AccCarriageContractBase accb);
	public List<AccCarriageContractBase> findUnAuditAccCarriageContractBase(AccCarriageContractBase accb);
	public List<AccCarriageContractBase> findAuditDoneAccCarriageContractBase(AccCarriageContractBase accb);
	

}