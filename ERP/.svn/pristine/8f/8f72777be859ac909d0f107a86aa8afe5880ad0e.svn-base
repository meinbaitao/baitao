/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.bt.modules.contract.entity.ManufContractDetailPrice;
import com.bt.modules.contract.dao.ManufContractDetailPriceDao;

/**
 * 加工清单价库Service
 * @author yhh
 * @version 2015-08-12
 */
@Service
@Transactional(readOnly = true)
public class ManufContractDetailPriceService extends CrudService<ManufContractDetailPriceDao, ManufContractDetailPrice> {
	
	@Autowired
	private ManufContractDetailPriceDao mcdpDao;
	
	public ManufContractDetailPrice get(String id) {
		return super.get(id);
	}
	
	public List<ManufContractDetailPrice> findList(ManufContractDetailPrice manufContractDetailPrice) {
		return super.findList(manufContractDetailPrice);
	}
	
	public Page<ManufContractDetailPrice> findPage(Page<ManufContractDetailPrice> page, ManufContractDetailPrice manufContractDetailPrice) {
		return super.findPage(page, manufContractDetailPrice);
	}
	
	@Transactional(readOnly = false)
	public void save(ManufContractDetailPrice manufContractDetailPrice) {
		manufContractDetailPrice.setIsNewRecord(true);
		super.save(manufContractDetailPrice);
	}
	
	@Transactional(readOnly = false)
	public void update(ManufContractDetailPrice manufContractDetailPrice) {
		manufContractDetailPrice.setIsNewRecord(false);
		super.save(manufContractDetailPrice);
	}
	
	@Transactional(readOnly = false)
	public void delete(ManufContractDetailPrice manufContractDetailPrice) {
		super.delete(manufContractDetailPrice);
	}
	
	public ManufContractDetailPrice getByManufName(ManufContractDetailPrice mcdp){
		return mcdpDao.getByManufName(mcdp);
	}
}