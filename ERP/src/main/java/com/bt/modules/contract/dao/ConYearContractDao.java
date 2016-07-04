/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.dao;

import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.contract.entity.ConYearContract;

/**
 * 年度合同DAO接口
 * @author yhh
 * @version 2015-08-14
 */
@MyBatisDao
public interface ConYearContractDao extends ConContainDetailDao<ConYearContract> {
	
	/**
	 * 有合同编号获取合同
	 * @param mcb
	 * @return
	 */
	public  ConYearContract getByContractId(ConYearContract mcb);

	public  ConYearContract getByTeamName(ConYearContract mcb); 
}