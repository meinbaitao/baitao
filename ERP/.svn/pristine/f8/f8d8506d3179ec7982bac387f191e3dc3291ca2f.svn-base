/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.purchase.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.purchase.dao.PurchaseDemandSubProjectMappingDao;
import com.bt.modules.purchase.entity.PurchaseDemandSubProjectMapping;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 采购需求对应的二级项目关联Service
 * @author xiaocai
 * @version 2015-08-17
 */
@Service
@Transactional(readOnly = true)
public class PurchaseDemandSubProjectMappingService extends CrudService<PurchaseDemandSubProjectMappingDao, PurchaseDemandSubProjectMapping> {

	@Autowired
	private PurchaseDemandSubProjectMappingDao purchaseDemandSubProjectMappingDao;
	
	
	/**
	 * 根据采购编号获取相应的详细数据信息
	 * @param seriesnumber
	 * @return
	 */
	public List<Map<String, Object>> getDetailBySeriesNumber(String seriesnumber){
		if(StringUtils.isBlank(seriesnumber)){
			return new ArrayList<Map<String, Object>>();
		}else{
			return purchaseDemandSubProjectMappingDao.getDetailBySeriesNumber(seriesnumber);
		}
	}
	/**
	 * end
	 */
	/**
	 * 根据采购需求获取相应的列表数据
	 * 不传参数默认读取新建以及未生成需求订单的数据
	 * @param pdID
	 * @return
	 */
	public List<Map<String, Object>> getNewPro(String pdid){
		PurchaseDemandSubProjectMapping psm = new PurchaseDemandSubProjectMapping();
		psm.setPdid(pdid);
		return purchaseDemandSubProjectMappingDao.getNewPro(psm);
	}
	/**
	 * 批量插入数据
	 * @param listPSM
	 */
	@Transactional(readOnly = false)
	public void batchPurchaseDemandSubProjectMapping(List<PurchaseDemandSubProjectMapping> listPSM){
		for(PurchaseDemandSubProjectMapping psm:listPSM){
			purchaseDemandSubProjectMappingDao.insert(psm);
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