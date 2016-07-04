/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.receiving.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.receiving.dao.ReceivingAccidentDao;
import com.bt.modules.receiving.entity.ReceivingAccident;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 收货事故Service
 * @author xiaocai
 * @version 2015-08-03
 */
@Service
@Transactional(readOnly = true)
public class ReceivingAccidentService extends CrudService<ReceivingAccidentDao, ReceivingAccident> {

	@Autowired
	private ReceivingAccidentDao receivingAccidentDao;
	
	public List<ReceivingAccident> findList(ReceivingAccident receivingAccident) {
		return super.findList(receivingAccident);
	}
	
	public Page<ReceivingAccident> findPage(Page<ReceivingAccident> page, ReceivingAccident receivingAccident) {
		return super.findPage(page, receivingAccident);
	}
	
	public void update(ReceivingAccident receivingAccident){
		receivingAccidentDao.update(receivingAccident);
	}
	
	public void insert(ReceivingAccident receivingAccident){
		receivingAccidentDao.insert(receivingAccident);
	}
	
	@Transactional(readOnly = false)
	public void delete(ReceivingAccident receivingAccident) {
		super.delete(receivingAccident);
	}
	
}