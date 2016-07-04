/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.supplier.dao;

import java.util.List;

import com.bt.modules.supplier.entity.UserSuppMapping;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 供应商-生产经理关联DAO接口
 * @author xiaocai
 * @version 2015-10-27
 */
@MyBatisDao
public interface UserSuppMappingDao extends CrudDao<UserSuppMapping> {
	/**
	 * 查看列表数据
	 * @param usm
	 * @return
	 */
	public List<UserSuppMapping> userSuppMappingListPage(UserSuppMapping usm);
	public List<UserSuppMapping> userSuppMappingList(UserSuppMapping usm);
	/**
	 * 根据条件返回单条数据
	 * @param usm
	 * @return
	 */
	public UserSuppMapping getOne(UserSuppMapping usm);
}