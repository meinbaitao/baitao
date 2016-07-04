/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.dao;

import java.util.List;
import java.util.Map;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.contract.entity.ContractAccount;

/**
 * 合同台账DAO接口
 * @author yhh
 * @version 2015-11-02
 */
@MyBatisDao
public interface ContractAccountDao extends CrudDao<ContractAccount>{
	
	/**
	 * 由父类id获取分类列表
	 * @param parentId
	 * @return
	 */
	public List<Map<String, Object>> findTypeByParentId(String parentId);
	
	/**
	 * 由id获取分类名
	 * @param id
	 * @return
	 */
	public String getContractAccountTypeById(String id);
}