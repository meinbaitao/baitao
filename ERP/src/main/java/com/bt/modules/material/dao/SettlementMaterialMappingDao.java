package com.bt.modules.material.dao;

import java.util.List;

import com.bt.modules.material.entity.SettlementMaterialMapping;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 可配置加工项物料信息与加工项Mapping DAO接口
 * @author zjs
 * @version 2016-05-06
 */
@MyBatisDao
public interface SettlementMaterialMappingDao extends CrudDao<SettlementMaterialMapping> {
	
	/**
	 * 查询物料已选加工项
	 * @param id
	 * @return
	 */
	public List<SettlementMaterialMapping> findSettlementItemList(String id);
	
	/**
	 * 查询类型下所有加工项
	 * @param settlementType
	 * @return
	 */
	public List<SettlementMaterialMapping> findAllSettlementItemList(String settlementType);
}
