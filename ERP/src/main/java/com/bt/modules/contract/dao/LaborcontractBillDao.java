/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.dao;

import com.bt.modules.contract.entity.Laborcontract;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 劳务合同日志 DAO接口
 * @author xiaocai
 * @version 2016-5-5
 */
@MyBatisDao
public interface LaborcontractBillDao extends ConContainDetailDao<Laborcontract> {

	
}