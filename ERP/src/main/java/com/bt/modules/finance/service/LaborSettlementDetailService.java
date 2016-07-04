/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.finance.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.bt.modules.finance.entity.LaborSettlementDetail;
import com.bt.modules.finance.dao.LaborSettlementDetailDao;

/**
 * 劳务结算清单Service
 * @author yhh
 * @version 2015-12-15
 */
@Service
@Transactional(readOnly = true)
public class LaborSettlementDetailService extends CrudService<LaborSettlementDetailDao, LaborSettlementDetail> {

	public LaborSettlementDetail get(String id) {
		return super.get(id);
	}
	
	public List<LaborSettlementDetail> findList(LaborSettlementDetail laborSettlementDetail) {
		return super.findList(laborSettlementDetail);
	}
	
	public Page<LaborSettlementDetail> findPage(Page<LaborSettlementDetail> page, LaborSettlementDetail laborSettlementDetail) {
		return super.findPage(page, laborSettlementDetail);
	}
	
	@Transactional(readOnly = false)
	public void save(LaborSettlementDetail laborSettlementDetail) {
		super.save(laborSettlementDetail);
	}
	
	@Transactional(readOnly = false)
	public void delete(LaborSettlementDetail laborSettlementDetail) {
		super.delete(laborSettlementDetail);
	}
	
}