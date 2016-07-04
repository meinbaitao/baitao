/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.purchase.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.purchase.dao.PurchaseDemandOrderBomDetailMappingDao;
import com.bt.modules.purchase.dao.PurchaseDemandSubProjectMappingDao;
import com.bt.modules.purchase.entity.PurchaseDemandOrderBomDetailMapping;
import com.bt.modules.purchase.entity.PurchaseDemandSubProjectMapping;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * @author xiaocai
 */
@Service
@Transactional(readOnly = true)
public class PurchaseDemandOrderBomDetailMappingService extends CrudService<PurchaseDemandSubProjectMappingDao, PurchaseDemandSubProjectMapping> {

	@Autowired
	private PurchaseDemandOrderBomDetailMappingDao purchaseDemandOrderBomDetailMappingDao;
	
	
	/**
	 * 批量插入数据
	 * @param listPOM
	 */
	@Transactional(readOnly = false)
	public void batchInsert(List<PurchaseDemandOrderBomDetailMapping> listPOM){
		for(PurchaseDemandOrderBomDetailMapping pom:listPOM){
			purchaseDemandOrderBomDetailMappingDao.insert(pom);
		}
	}
	
	
	
	public PurchaseDemandSubProjectMapping get(String id) {
		return super.get(id);
	}
	
	public List<PurchaseDemandSubProjectMapping> findList(PurchaseDemandSubProjectMapping purchaseDemandSubProjectMapping) {
		return super.findList(purchaseDemandSubProjectMapping);
	}
	
	public Page<PurchaseDemandSubProjectMapping> findPage(Page<PurchaseDemandSubProjectMapping> page, PurchaseDemandSubProjectMapping purchaseDemandSubProjectMapping) {
		return super.findPage(page, purchaseDemandSubProjectMapping);
	}
	
	@Transactional(readOnly = false)
	public void save(PurchaseDemandSubProjectMapping purchaseDemandSubProjectMapping) {
		super.save(purchaseDemandSubProjectMapping);
	}
	
	@Transactional(readOnly = false)
	public void delete(PurchaseDemandSubProjectMapping purchaseDemandSubProjectMapping) {
		super.delete(purchaseDemandSubProjectMapping);
	}
	
}