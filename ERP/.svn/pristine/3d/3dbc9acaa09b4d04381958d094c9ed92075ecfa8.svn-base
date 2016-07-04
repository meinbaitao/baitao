/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.contract.entity.LaborDemand;
import com.bt.modules.contract.entity.Laborcontract;
import com.bt.modules.project.entity.Project;

/**
 * 劳务需求DAO接口
 * @author yhh
 * @version 2015-09-08
 */
@MyBatisDao
public interface LaborDemandDao extends CrudDao<LaborDemand> {
	
	//由施工合同号获取
	public LaborDemand getByNum(LaborDemand lc);
	
	/**
	 * 根据项目的相关条件获取对应的列表数据
	 * @param laborDemand
	 * @return
	 */
	public List<LaborDemand> getByProject(LaborDemand laborDemand);
	
	/**
	 * 由项目id获取劳务需求信息
	 * @param projectId
	 * @return
	 */
	public Project getProjecctById(String projectId);
	
	/**
	 * 
	 * @param contract
	 * @return
	 */
	public String getSubProjectByBuilding(Laborcontract contract);
	/**
	 * 流程数据筛选
	 * @param laborDemand
	 * @return
	 */
	public List<LaborDemand> findMyLaborDemand(LaborDemand laborDemand);
	public List<LaborDemand> findUnAuditLaborDemand(LaborDemand laborDemand);
	public List<LaborDemand> findAuditDoneLaborDemand(LaborDemand laborDemand);
}