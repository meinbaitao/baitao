/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.finance.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.finance.entity.LaborSettlementDetail;

/**
 * 劳务结算清单DAO接口
 * @author yhh
 * @version 2015-12-15
 */
@MyBatisDao
public interface LaborSettlementDetailDao extends CrudDao<LaborSettlementDetail> {
	
}