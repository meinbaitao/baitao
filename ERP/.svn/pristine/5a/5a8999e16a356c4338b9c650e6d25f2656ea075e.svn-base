/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.labour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.labour.dao.LabStaDao;
import com.bt.modules.labour.entity.LabSta;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 劳务标准库Service
 * @author xiaocai
 * @version 2015-08-04
 */
@Service
@Transactional(readOnly = true)
public class LabStaService extends CrudService<LabStaDao, LabSta> {

	@Autowired
	private LabStaDao labStaDao;
	
	
	
	
	public LabSta get(String id) {
		return super.get(id);
	}
	
	public List<LabSta> findList(LabSta labSta) {
		return super.findList(labSta);
	}
	
	public Page<LabSta> findPage(Page<LabSta> page, LabSta labSta) {
		return super.findPage(page, labSta);
	}
	
	@Transactional(readOnly = false)
	public void save(LabSta labSta) {
		super.save(labSta);
	}
	
	@Transactional(readOnly = false)
	public void delete(LabSta labSta) {
		super.delete(labSta);
	}
	
}