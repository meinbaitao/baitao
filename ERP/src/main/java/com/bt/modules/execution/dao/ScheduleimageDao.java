/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.execution.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.execution.entity.Scheduleimage;

/**
 * 楼栋形象图DAO接口
 * @author yhh
 * @version 2015-07-31
 */
@MyBatisDao
public interface ScheduleimageDao extends CrudDao<Scheduleimage> {
	
}