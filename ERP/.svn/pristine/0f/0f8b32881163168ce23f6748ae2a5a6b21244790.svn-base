/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.accident.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.bt.modules.accident.entity.AccidentRatio;
import com.bt.modules.accident.dao.AccidentRatioDao;

/**
 * 事故比例Service
 * @author pc
 * @version 2015-10-14
 */
@Service
@Transactional(readOnly = true)
public class AccidentRatioService extends CrudService<AccidentRatioDao, AccidentRatio> {

	@Autowired
	private AccidentRatioDao dao;

	public AccidentRatio get(String id) {
		return super.get(id);
	}
	
	public List<AccidentRatio> findList(AccidentRatio accidentRatio) {
		return super.findList(accidentRatio);
	}
	
	public Page<AccidentRatio> findPage(Page<AccidentRatio> page, AccidentRatio accidentRatio) {
		return super.findPage(page, accidentRatio);
	}
	
	@Transactional(readOnly = false)
	public void save(AccidentRatio accidentRatio) {
		super.save(accidentRatio);
	}
	
	@Transactional(readOnly = false)
	public void delete(AccidentRatio accidentRatio) {
		super.delete(accidentRatio);
	}

	@Transactional(readOnly = false)
	public List<AccidentRatio> findUniqueAccidentType(AccidentRatio accidentRatio){
		return dao.findUniqueAccidentType(accidentRatio);
	}
	
}