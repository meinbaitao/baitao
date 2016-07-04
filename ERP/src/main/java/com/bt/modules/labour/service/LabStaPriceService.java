/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.labour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.labour.dao.LabStaPriceDao;
import com.bt.modules.labour.entity.LabStaPrice;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 劳务标准价格库Service
 * @author xiaocai
 * @version 2015-08-04
 */
@Service
@Transactional(readOnly = true)
public class LabStaPriceService extends CrudService<LabStaPriceDao, LabStaPrice> {

	@Autowired
	private LabStaPriceDao labStaPriceDao;
	
	
	public LabStaPrice get(String id) {
		return super.get(id);
	}
	
	public List<LabStaPrice> findList(LabStaPrice labStaPrice) {
		return super.findList(labStaPrice);
	}
	
	public Page<LabStaPrice> findPage(Page<LabStaPrice> page, LabStaPrice labStaPrice) {
		return super.findPage(page, labStaPrice);
	}
	
	@Transactional(readOnly = false)
	public void save(LabStaPrice labStaPrice) {
		super.save(labStaPrice);
	}
	
	@Transactional(readOnly = false)
	public void delete(LabStaPrice labStaPrice) {
		super.delete(labStaPrice);
	}
	
}