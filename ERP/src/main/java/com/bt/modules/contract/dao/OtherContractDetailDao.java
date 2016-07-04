/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.contract.entity.OtherContractDetail;

/**
 * 其他类合同明细DAO接口
 * @author yhh
 * @version 2016-01-28
 */
@MyBatisDao
public interface OtherContractDetailDao extends CrudDao<OtherContractDetail> {
	
}