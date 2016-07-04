/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.dao;

import java.util.List;
import java.util.Map;

import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.contract.entity.StoneCarriageContractBase;

/**
 * stonecarry1DAO接口
 * @author yhh
 * @version 2015-08-11
 */
@MyBatisDao
public interface StoneCarriageContractBaseDao extends ConContainDetailDao<StoneCarriageContractBase> {
	
	/**
	 * 有合同编号获取合同
	 * @param scb
	 * @return
	 */
	public  StoneCarriageContractBase getByContractId(StoneCarriageContractBase	scb);
	/**
	 * 对乙方名称进行分组
	 * @return
	 */
	public List<StoneCarriageContractBase> groupByPBName(StoneCarriageContractBase sccb);
	/**
	 * 根据物流名称读取相应的合同数据列表
	 * @return
	 */
	public List<StoneCarriageContractBase> getByPBName(StoneCarriageContractBase sccb);
	
	/**
	 * 获取合同中走完流程,有效的供应商列表
	 * @return
	 */
	public List<Map<String, Object>> findSuppliersInContract();
	
	/**
	 * 由供应商名获取付款信息
	 * @return
	 */
	public Map<String, Object> getSupplierByName(String supplierName);
	/**
	 * 流程相关数据
	 * @param sccb
	 * @return
	 */
	public List<StoneCarriageContractBase> findMyStoneCarriageContractBase(StoneCarriageContractBase sccb);
	public List<StoneCarriageContractBase> findUnAuditStoneCarriageContractBase(StoneCarriageContractBase sccb);
	public List<StoneCarriageContractBase> findAuditDoneStoneCarriageContractBase(StoneCarriageContractBase sccb);
	
}