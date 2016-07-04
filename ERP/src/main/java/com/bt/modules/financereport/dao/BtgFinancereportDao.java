/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.financereport.dao;

import java.util.Map;
import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.financereport.entity.BtgFinancereport;

/**
 * 分项目财务报表DAO接口
 * @author lky
 * @version 2015-12-21
 */
@MyBatisDao
public interface BtgFinancereportDao extends CrudDao<BtgFinancereport> {
	
	public List<BtgFinancereport> getTestProc(Map<String, Integer> map); 
	
}