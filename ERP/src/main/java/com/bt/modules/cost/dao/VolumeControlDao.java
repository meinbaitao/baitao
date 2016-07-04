/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.cost.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.cost.entity.VolumeControl;

/**
 * 成本控量DAO接口
 * @author pc
 * @version 2015-09-06
 */
@MyBatisDao
public interface VolumeControlDao extends CrudDao<VolumeControl> {
	
}