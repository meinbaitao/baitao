/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.contract.entity.Execution;

/**
 * 施工班组DAO接口
 * @author yhh
 * @version 2015-08-04
 */
@MyBatisDao
public interface ExecutionDao extends CrudDao<Execution> {
	
	public Execution getByName(Execution execution);
	
	public String getmaxNo();
	
	public Execution getByPersonNum(Execution execution);
	
	public Execution getByExelevel(Execution execution);
	
	public List<Execution> findListForLabor(Execution execution);
}