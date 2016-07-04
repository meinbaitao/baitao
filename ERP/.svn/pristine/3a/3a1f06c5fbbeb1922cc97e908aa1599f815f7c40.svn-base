/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.logistics.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.logistics.dao.ProductionLogisticsSendMappingDao;
import com.bt.modules.logistics.entity.ProductionLogisticsSendMapping;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 生产发货关系关联Service
 * @author xiaocai
 * @version 2015-09-23
 */
@Service
@Transactional(readOnly = true)
public class ProductionLogisticsSendMappingService extends CrudService<ProductionLogisticsSendMappingDao, ProductionLogisticsSendMapping> {
	
	@Autowired
	private ProductionLogisticsSendMappingDao productionLogisticsSendMappingDao;
	/**
	 * 批量插入数据
	 * @param listPLSM
	 */
	@Transactional(readOnly = false)
	public void batchInsert(List<ProductionLogisticsSendMapping> listPLSM) {
		for(ProductionLogisticsSendMapping plsm:listPLSM){
			productionLogisticsSendMappingDao.insert(plsm);
		}
	}
	/**
	 * 根据物流ID查看发货详细
	 * @return
	 */
	public Page<ProductionLogisticsSendMapping> getProDetailByLID(Page<ProductionLogisticsSendMapping> page, ProductionLogisticsSendMapping productionLogisticsSendMapping,String lID) {
		productionLogisticsSendMapping.setPage(page);
		productionLogisticsSendMapping.setLogisticsSendId(lID);
		page.setList(productionLogisticsSendMappingDao.getProDetailByLID(productionLogisticsSendMapping));
		return page;
	}
	/**
	 * 根据加工单IDs批量删除关联关系
	 * @param listPLSM
	 */
	@Transactional(readOnly = false)
	public void batchDeleteByProductionIds(List<String> ids) {
		ProductionLogisticsSendMapping plsm;
		for(String id:ids){
			plsm = new ProductionLogisticsSendMapping();
			plsm.setProductionId(id);
			productionLogisticsSendMappingDao.deleteByProductionId(plsm);
		}
	}
	public ProductionLogisticsSendMapping get(String id) {
		return super.get(id);
	}
	
	public List<ProductionLogisticsSendMapping> findList(ProductionLogisticsSendMapping productionLogisticsSendMapping) {
		return super.findList(productionLogisticsSendMapping);
	}
	
	public Page<ProductionLogisticsSendMapping> findPage(Page<ProductionLogisticsSendMapping> page, ProductionLogisticsSendMapping productionLogisticsSendMapping) {
		return super.findPage(page, productionLogisticsSendMapping);
	}
	
	@Transactional(readOnly = false)
	public void save(ProductionLogisticsSendMapping productionLogisticsSendMapping) {
		super.save(productionLogisticsSendMapping);
	}
	
	@Transactional(readOnly = false)
	public void delete(ProductionLogisticsSendMapping productionLogisticsSendMapping) {
		super.delete(productionLogisticsSendMapping);
	}
	
}