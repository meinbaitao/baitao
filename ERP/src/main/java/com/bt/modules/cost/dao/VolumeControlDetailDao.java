/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.cost.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.cost.entity.VolumeControlDetail;

/**
 * 成本控量明细DAO接口
 * @author pc
 * @version 2015-09-06
 */
@MyBatisDao
public interface VolumeControlDetailDao extends CrudDao<VolumeControlDetail> {
	public int deleteByVId(VolumeControlDetail entity);
}