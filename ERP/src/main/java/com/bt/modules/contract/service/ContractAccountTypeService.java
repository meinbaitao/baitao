/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.CrudService;
import com.bt.modules.contract.entity.ContractAccountType;
import com.bt.modules.contract.dao.ContractAccountTypeDao;

/**
 * 台账类别Service
 * @author yhh
 * @version 2016-01-21
 */
@Service
@Transactional(readOnly = true)
public class ContractAccountTypeService extends CrudService<ContractAccountTypeDao, ContractAccountType> {

	/**
	 * 由上级id获取分类列表
	 * @param parentId
	 * @return
	 */
	public List<ContractAccountType> findTypeByParentId(String parentId){
		return dao.findTypeByParentId(parentId);
	}
}