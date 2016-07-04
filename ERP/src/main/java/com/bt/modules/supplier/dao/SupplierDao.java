/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.supplier.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.supplier.entity.Supplier;

/**
 * 供应商信息DAO接口
 * @author yhh
 * @version 2015-10-27
 */
@MyBatisDao
public interface SupplierDao extends CrudDao<Supplier> {
	public List<Supplier> getByType(String type);
}