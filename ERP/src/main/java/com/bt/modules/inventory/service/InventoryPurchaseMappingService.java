/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.inventory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.inventory.dao.InventoryPurchaseMappingDao;
import com.bt.modules.inventory.entity.InventoryPurchaseMapping;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.IdGen;

/**
 * 库存采购单关系关联Service
 * @author xiaocai
 * @version 2015-10-19
 */
@Service
@Transactional(readOnly = true)
public class InventoryPurchaseMappingService extends CrudService<InventoryPurchaseMappingDao, InventoryPurchaseMapping> {

	@Autowired
	private InventoryPurchaseMappingDao inventoryPurchaseMappingDao;
	
	/**
	 * 插入关联数据
	 * @param inventoryId	库存数据ID
	 * @param purchaseId	采购单ID
	 */
	@Transactional(readOnly = false)
	public void insert(String inventoryId,String purchaseId) {
		InventoryPurchaseMapping inventoryPurchaseMapping = new InventoryPurchaseMapping();
		inventoryPurchaseMapping.setId(IdGen.uuid());
		inventoryPurchaseMapping.setInventoryId(inventoryId);
		inventoryPurchaseMapping.setPurchaseId(purchaseId);
		inventoryPurchaseMappingDao.insert(inventoryPurchaseMapping);
	}
	
	
	
	public InventoryPurchaseMapping get(String id) {
		return super.get(id);
	}
	
	public List<InventoryPurchaseMapping> findList(InventoryPurchaseMapping inventoryPurchaseMapping) {
		return super.findList(inventoryPurchaseMapping);
	}
	
	public Page<InventoryPurchaseMapping> findPage(Page<InventoryPurchaseMapping> page, InventoryPurchaseMapping inventoryPurchaseMapping) {
		return super.findPage(page, inventoryPurchaseMapping);
	}
	
	@Transactional(readOnly = false)
	public void save(InventoryPurchaseMapping inventoryPurchaseMapping) {
		super.save(inventoryPurchaseMapping);
	}
	
	@Transactional(readOnly = false)
	public void delete(InventoryPurchaseMapping inventoryPurchaseMapping) {
		super.delete(inventoryPurchaseMapping);
	}
	
}