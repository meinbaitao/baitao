/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.dao;

import com.bt.modules.contract.entity.ManufContractBase;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 合同台账DAO接口
 * @author yhh
 * @version 2015-11-02
 */
@MyBatisDao
public interface ContractPrintDao extends CrudDao<ManufContractBase>{
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	public ManufContractBase findTestData(String id);
}