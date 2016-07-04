/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.viewcontractprogress.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.bt.modules.viewcontractprogress.entity.ViewContractProgress;
import com.bt.modules.viewcontractprogress.dao.ViewContractProgressDao;

/**
 * 报表Service
 * @author lky
 * @version 2015-11-30
 */
@Service
@Transactional(readOnly = true)
public class ViewContractProgressService extends CrudService<ViewContractProgressDao, ViewContractProgress> {

	public ViewContractProgress get(String id) {
		return super.get(id);
	}
	
	public List<ViewContractProgress> findList(ViewContractProgress viewContractProgress) {
		return super.findList(viewContractProgress);
	}
	
	public Page<ViewContractProgress> findPage(Page<ViewContractProgress> page, ViewContractProgress viewContractProgress) {
		return super.findPage(page, viewContractProgress);
	}
	
	@Transactional(readOnly = false)
	public void save(ViewContractProgress viewContractProgress) {
		super.save(viewContractProgress);
	}
	
	@Transactional(readOnly = false)
	public void delete(ViewContractProgress viewContractProgress) {
		super.delete(viewContractProgress);
	}
	
}