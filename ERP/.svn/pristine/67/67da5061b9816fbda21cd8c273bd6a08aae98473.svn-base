/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.bt.modules.contract.entity.OtherContractDetail;
import com.bt.modules.contract.dao.OtherContractDetailDao;

/**
 * 其他类合同明细Service
 * @author yhh
 * @version 2016-01-28
 */
@Service
@Transactional(readOnly = true)
public class OtherContractDetailService extends CrudService<OtherContractDetailDao, OtherContractDetail> {

	public OtherContractDetail get(String id) {
		return super.get(id);
	}
	
	public List<OtherContractDetail> findList(OtherContractDetail otherContractDetail) {
		return super.findList(otherContractDetail);
	}
	
	public Page<OtherContractDetail> findPage(Page<OtherContractDetail> page, OtherContractDetail otherContractDetail) {
		return super.findPage(page, otherContractDetail);
	}
	
	@Transactional(readOnly = false)
	public void save(OtherContractDetail otherContractDetail) {
		super.save(otherContractDetail);
	}
	
	@Transactional(readOnly = false)
	public void delete(OtherContractDetail otherContractDetail) {
		super.delete(otherContractDetail);
	}
	
}