package com.thinkgem.jeesite.common.oauth2.dao;

import com.thinkgem.jeesite.common.oauth2.entity.UserClientAuth;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * ClientDAO接口
 * 
 * @author XuJunXiong
 * @version 2015-07-11
 */
@MyBatisDao
public interface UserClientAuthDao extends CrudDao<UserClientAuth> {
	public UserClientAuth getByClientUser(UserClientAuth clientAuth);
}
