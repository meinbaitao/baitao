/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.contract.entity.ManufContractDetailPrice;

/**
 * 加工清单价库DAO接口
 * @author yhh
 * @version 2015-08-12
 */
@MyBatisDao
public interface ManufContractDetailPriceDao extends CrudDao<ManufContractDetailPrice> {
	public ManufContractDetailPrice getByManufName(ManufContractDetailPrice mcdp);
}