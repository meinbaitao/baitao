/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.accident.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.accident.entity.AccidentShareMoney;

/**
 * 事故分摊金额DAO接口
 * @author pc
 * @version 2015-10-14
 */
@MyBatisDao
public interface AccidentShareMoneyDao extends CrudDao<AccidentShareMoney> {
	public void deleteByamId(AccidentShareMoney accidentShareMoney);
}