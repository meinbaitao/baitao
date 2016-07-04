/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.project.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.project.entity.Problem;

/**
 * 项目问题明细DAO接口
 * @author xjp
 * @version 2015-09-14
 */
@MyBatisDao
public interface ProblemDao extends CrudDao<Problem> {
	
}