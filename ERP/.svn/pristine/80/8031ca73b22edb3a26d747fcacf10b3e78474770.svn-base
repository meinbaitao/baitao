/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.dao;

import java.util.List;
import java.util.Map;

import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.contract.entity.JiaContract;

/**
 * 甲方合同DAO接口
 * @author yhh
 * @version 2015-08-01
 */
@MyBatisDao
public interface JiaContractDao extends ConContainDetailDao<JiaContract> {
	
	/**
	 * 有合同编号获取合同
	 * @param cid
	 * @return
	 */
	public JiaContract getByContractId(JiaContract	jc);

	/**
	 * 由项目ID获取甲方合同
	 * @param pid
	 * @return
	 */
	public List<JiaContract> getByprojectId(String pid);
	
	/**
	 * 查询所有的甲方合同编号
	 * @return
	 */
	public List<JiaContract> findJiaContractList(JiaContract jc);


	/**
	 * 只查询一条合同
	 * @param paramMap
	 * @return
	 */
	public String getContractNOByProjectIdAndBuildNO(Map<String, Object> paramMap);

	/**
	 * 获取甲方合同某个项目的总合同额
	 * @param contract
	 * @return
	 */
	public Double getAmountMoneyOfProject(JiaContract contract);
	
	
	/**
	 * 流程相关数据
	 * @param jc
	 * @return
	 */
	public List<JiaContract> findMyJiaContract(JiaContract jc);
	public List<JiaContract> findUnAuditJiaContract(JiaContract jc);
	public List<JiaContract> findAuditDoneJiaContract(JiaContract jc);
	
}