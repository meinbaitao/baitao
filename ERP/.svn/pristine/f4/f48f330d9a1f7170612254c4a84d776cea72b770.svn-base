/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.contract.entity.ManufContractBase;
import com.bt.modules.contract.entity.ManufContractDetail;
import com.bt.modules.contract.dao.ManufContractBaseDao;
import com.bt.modules.contract.dao.ManufContractDetailDao;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 生产合同基本表Service
 * @author yhh
 * @version 2015-08-01
 */
@Service
@Transactional(readOnly = true)
public class ManufContractBaseService extends ConContainDetailService<ManufContractBaseDao, ManufContractDetailDao, 
	ManufContractBase, ManufContractDetail> {

	public static final String BEAN_NAME = "com.bt.modules.contract.service.ManufContractBaseService";
	
	@Autowired
	private ManufContractBaseDao manufContractBaseDao;
	
	@Autowired
	private ManufContractDetailDao manufContractDetailDao;
	
	@Transactional(readOnly = false)
	public void save(ManufContractBase manufContractBase) {
		super.save(manufContractBase);
	}
	
	/**
	 * 
	 * @param page
	 * @param manufContractBase
	 * @return
	 */
	public Page<ManufContractBase> findMyManufContractBase(Page<ManufContractBase> page, ManufContractBase manufContractBase) {
		manufContractBase.setPage(page);
		page.setList(manufContractBaseDao.findMyManufContractBase(manufContractBase));
		return page;
	}
	public Page<ManufContractBase> findUnAuditManufContractBase(Page<ManufContractBase> page, ManufContractBase manufContractBase) {
		manufContractBase.setPage(page);
		page.setList(manufContractBaseDao.findUnAuditManufContractBase(manufContractBase));
		return page;
	}
	public Page<ManufContractBase> findAuditDoneManufContractBase(Page<ManufContractBase> page, ManufContractBase manufContractBase) {
		manufContractBase.setPage(page);
		page.setList(manufContractBaseDao.findAuditDoneManufContractBase(manufContractBase));
		return page;
	}
	
}