/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
 package com.bt.modules.viewcontractprogress.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.viewcontractprogress.entity.ViewContractProgress;

/**
 * 报表DAO接口
 * @author lky
 * @version 2015-11-30
 */
@MyBatisDao
public interface ViewContractProgressDao extends CrudDao<ViewContractProgress> {
	
}