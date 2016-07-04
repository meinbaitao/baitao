package com.bt.modules.material.service;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.material.dao.SettlementMaterialMappingDao;
import com.bt.modules.material.entity.SettlementMaterial;
import com.bt.modules.material.entity.SettlementMaterialMapping;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.IdGen;

/**
 * 可配置加工项物料信息与加工项Mapping Service
 * @author zjs
 * @version 2016-05-06
 */
@Service
@Transactional(readOnly = true)
public class SettlementMaterialMappingService extends
		CrudService<SettlementMaterialMappingDao, SettlementMaterialMapping> {
	@Autowired
	private SettlementMaterialMappingDao settlementMaterialMappingDao;
	
	/**
	 * 查询物料已选加工项
	 * @param id
	 * @return
	 */
	@Transactional(readOnly = false)
	public List<SettlementMaterialMapping> findSettlementItemList(String id){
		return settlementMaterialMappingDao.findSettlementItemList(id);
	}
	
	/**
	 * 查询类型下所有加工项
	 * @param settlementType
	 * @return
	 */
	@Transactional(readOnly = false)
	public List<SettlementMaterialMapping> findAllSettlementItemList(String settlementType){
		return settlementMaterialMappingDao.findAllSettlementItemList(settlementType);
	}
	
	@Transactional(readOnly = false)
	public void save(SettlementMaterialMapping settlementMaterialMapping) {
		settlementMaterialMapping.setIsNewRecord(true);
		super.save(settlementMaterialMapping);
	}
	
	@Transactional(readOnly = false)
	public void update(SettlementMaterialMapping settlementMaterialMapping) {
		super.dao.update(settlementMaterialMapping);
	}
	
	@Transactional(readOnly = false)
	public void delete(SettlementMaterialMapping settlementMaterialMapping) {
		super.delete(settlementMaterialMapping);
	}
}
