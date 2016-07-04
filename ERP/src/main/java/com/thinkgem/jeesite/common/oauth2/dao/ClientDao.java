package com.thinkgem.jeesite.common.oauth2.dao;

import com.thinkgem.jeesite.common.oauth2.entity.Client;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * ClientDAO接口
 * @author XuJunXiong
 * @version 2015-07-09
 */
@MyBatisDao
public interface ClientDao extends CrudDao<Client> {

}
