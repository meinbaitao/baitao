/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.contract.entity.BtgConJiaContractDetail;

/**
 * 甲方合同拆成楼栋DAO接口
 * @author lky
 * @version 2015-12-21
 */
@MyBatisDao
public interface BtgConJiaContractDetailDao extends CrudDao<BtgConJiaContractDetail> {
	
	/**
	 * 由劳务合同id获取
	 * @param laborContractId
	 * @return
	 */
	public BtgConJiaContractDetail getByLaborContractId(String laborContractId);
}