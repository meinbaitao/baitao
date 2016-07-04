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
import com.bt.modules.contract.entity.ManufContractDetail;
import com.bt.modules.contract.dao.ManufContractDetailDao;

/**
 * 生产合同明细表Service
 * @author ljp
 * @version 2015-08-01
 */
@Service
@Transactional(readOnly = true)
public class ManufContractDetailService extends CrudService<ManufContractDetailDao, ManufContractDetail> {

	@Autowired
	private ManufContractDetailDao manufContractDetailDao;
	
	public ManufContractDetail get(String id) {
		return super.get(id);
	}
	
	public List<ManufContractDetail> findList(ManufContractDetail manufContractDetail) {
		return super.findList(manufContractDetail);
	}
	
	public Page<ManufContractDetail> findPage(Page<ManufContractDetail> page, ManufContractDetail manufContractDetail) {
		return super.findPage(page, manufContractDetail);
	}
	
	@Transactional(readOnly = false)
	public void save(ManufContractDetail manufContractDetail) {
		manufContractDetail.setIsNewRecord(true);
		super.save(manufContractDetail);
	}
	
	@Transactional(readOnly = false)
	public void update(ManufContractDetail manufContractDetail) {
		manufContractDetail.setIsNewRecord(false);
		super.save(manufContractDetail);
	}
	
	@Transactional(readOnly = false)
	public void delete(ManufContractDetail manufContractDetail) {
		super.delete(manufContractDetail);
	}
	
}