/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.finance.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.finance.entity.TransportationPaymentMapping;

/**
 * 运费结算登记mappingDAO接口
 * @author yhh
 * @version 2015-10-13
 */
@MyBatisDao
public interface TransportationPaymentMappingDao extends CrudDao<TransportationPaymentMapping> {
	
}