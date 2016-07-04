/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.accident.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.accident.entity.AccidentManage;

/**
 * 事故管理DAO接口
 * @author pc
 * @version 2015-10-14
 */
@MyBatisDao
public interface AccidentManageDao extends CrudDao<AccidentManage> {
	
	/**
	 * 修改流程Id和状态
	 * @param orderBomBase
	 * @return
	 */
	public int updateWorkflowId(AccidentManage accidentManage);
	
}