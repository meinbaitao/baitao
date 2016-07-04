package com.thinkgem.jeesite.modules.sys.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.Whitelists;

/**
 * 白名单DAO接口
 * @author xujianpeng
 * @version 2016-04-28
 */
@MyBatisDao
public interface WhitelistsDao extends CrudDao<Whitelists> {
	
	/**
	 * 根据白名单名称查找对应的角色英文名 
	 * @param name
	 * @return
	 */
	public Whitelists findWhitelistByName(Whitelists whitelists);
	
	
	/**
	 * 设置启用、停用白名单
	 * @param whitelists
	 * @return
	 */
	public int setting(Whitelists whitelists);
	
	
}
