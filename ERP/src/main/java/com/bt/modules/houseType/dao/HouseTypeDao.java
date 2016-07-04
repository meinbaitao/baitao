/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.houseType.dao;

import com.bt.modules.houseType.entity.HouseType;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 户型库管理DAO接口
 * @author xiaocai
 * @version 2016-04-29
 */
@MyBatisDao
public interface HouseTypeDao extends CrudDao<HouseType> {
	/**
	 * 获取相应的单条数据
	 * @param houseType
	 * @return
	 */
	public HouseType getOne(HouseType houseType);
}