/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.finance.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.bt.modules.finance.entity.ManufSettlementDetail;
import com.bt.modules.finance.dao.ManufSettlementDetailDao;

/**
 * 料单结算加工项Service
 * @author yhh
 * @version 2015-12-28
 */
@Service
@Transactional(readOnly = true)
public class ManufSettlementDetailService extends CrudService<ManufSettlementDetailDao, ManufSettlementDetail> {

	public ManufSettlementDetail get(String id) {
		return super.get(id);
	}
	
	public List<ManufSettlementDetail> findList(ManufSettlementDetail manufSettlementDetail) {
		return super.findList(manufSettlementDetail);
	}
	
	public Page<ManufSettlementDetail> findPage(Page<ManufSettlementDetail> page, ManufSettlementDetail manufSettlementDetail) {
		return super.findPage(page, manufSettlementDetail);
	}
	
	@Transactional(readOnly = false)
	public void save(ManufSettlementDetail manufSettlementDetail) {
		super.save(manufSettlementDetail);
	}
	
	@Transactional(readOnly = false)
	public void delete(ManufSettlementDetail manufSettlementDetail) {
		super.delete(manufSettlementDetail);
	}
	
}