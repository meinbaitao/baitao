/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.contract.entity.AccCarriageContractDetail;

/**
 * 物料运输价格明细DAO接口
 * @author yhh
 * @version 2016-01-25
 */
@MyBatisDao
public interface AccCarriageContractDetailDao extends CrudDao<AccCarriageContractDetail> {
	
}