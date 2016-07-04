/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.DataHandle;

/**
 * 数据操作记录DAO接口
 * @author yhh
 * @version 2016-03-11
 */
@MyBatisDao
public interface DataHandleDao extends CrudDao<DataHandle> {
	
}