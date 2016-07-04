/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.finance.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.bt.modules.contract.entity.Laborcontract;
import com.bt.modules.finance.entity.LaborSettlement;

/**
 * 劳务结算DAO接口
 * @author yhh
 * @version 2015-12-15
 */
@MyBatisDao
public interface LaborSettlementDao extends CrudDao<LaborSettlement> {
	/**
	 * 查询当天生成编号数
	 * @param date
	 * @return
	 */
	public int getTodayCount(String date);
	
	/**
	 * 查询可选项目
	 * @param aboutUser
	 * @return
	 */
	public List<LaborSettlement> findProject(User aboutUser);
	
	/**
	 * 查看待审核
	 * @param laborSettlement
	 * @param entity
	 * @return
	 * @return
	 */
	public List<LaborSettlement> findUnAuditLaborSettlement(LaborSettlement laborSettlement);
}