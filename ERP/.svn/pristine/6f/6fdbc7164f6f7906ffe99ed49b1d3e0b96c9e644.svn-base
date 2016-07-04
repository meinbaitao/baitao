/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.factory.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.factory.entity.ManufPerson;

/**
 * 加工厂人员DAO接口
 * @author yhh
 * @version 2015-11-11
 */
@MyBatisDao
public interface ManufPersonDao extends CrudDao<ManufPerson> {
	
	/**
	 * 由工厂名获取对象
	 * @param factory
	 * @return
	 */
	public ManufPerson getByFactoryName(String factory);
	
	/**
	 * 获取所有的生产经理
	 * @return
	 */
	public List<String> findManagers();
	
}