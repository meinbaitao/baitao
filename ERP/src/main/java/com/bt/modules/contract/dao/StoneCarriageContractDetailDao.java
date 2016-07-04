/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.contract.entity.StoneCarriageContractDetail;

/**
 * 石材运输明细DAO接口
 * @author yhh
 * @version 2015-12-01
 */
@MyBatisDao
public interface StoneCarriageContractDetailDao extends CrudDao<StoneCarriageContractDetail> {
	/**
	 * 对起运地址进行分组
	 * @return
	 */
	public List<StoneCarriageContractDetail> getGroupByStartAddress();
}