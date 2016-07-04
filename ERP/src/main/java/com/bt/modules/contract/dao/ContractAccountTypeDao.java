/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.contract.entity.ContractAccountType;

/**
 * 台账类别DAO接口
 * @author yhh
 * @version 2016-01-21
 */
@MyBatisDao
public interface ContractAccountTypeDao extends CrudDao<ContractAccountType> {
	
	/**
	 * 由上级id获取分类列表
	 * @param parentId
	 * @return
	 */
	public List<ContractAccountType> findTypeByParentId(String parentId); 
}