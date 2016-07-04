/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.bt.modules.contract.entity.AccCarriageContractDetail;
import com.bt.modules.contract.dao.AccCarriageContractDetailDao;

/**
 * 物料运输价格明细Service
 * @author yhh
 * @version 2016-01-25
 */
@Service
@Transactional(readOnly = true)
public class AccCarriageContractDetailService extends CrudService<AccCarriageContractDetailDao, AccCarriageContractDetail> {

	public AccCarriageContractDetail get(String id) {
		return super.get(id);
	}
	
	public List<AccCarriageContractDetail> findList(AccCarriageContractDetail accCarriageContractDetail) {
		return super.findList(accCarriageContractDetail);
	}
	
	public Page<AccCarriageContractDetail> findPage(Page<AccCarriageContractDetail> page, AccCarriageContractDetail accCarriageContractDetail) {
		return super.findPage(page, accCarriageContractDetail);
	}
	
	@Transactional(readOnly = false)
	public void save(AccCarriageContractDetail accCarriageContractDetail) {
		super.save(accCarriageContractDetail);
	}
	
	@Transactional(readOnly = false)
	public void delete(AccCarriageContractDetail accCarriageContractDetail) {
		super.delete(accCarriageContractDetail);
	}
	
}