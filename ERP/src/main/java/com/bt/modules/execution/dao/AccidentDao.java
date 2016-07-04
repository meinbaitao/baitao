/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.execution.dao;


import java.util.List;
import java.util.Map;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.execution.entity.Accident;

/**
 * 事故单DAO接口
 * @author xjp
 * @version 2015-08-14
 */
@MyBatisDao
public interface AccidentDao extends CrudDao<Accident> {
	
	/**
	 * 查询所有项目中的事故问题
	 * @return
	 */
	public List<Map<String, Object>> findListByProjectId(Accident accident);
	
}