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
import com.bt.modules.accident.entity.AccidentManageDetail;
import com.bt.modules.accident.dao.AccidentManageDetailDao;

/**
 * 事故管理详情表Service
 * @author pc
 * @version 2015-10-14
 */
@Service
@Transactional(readOnly = true)
public class AccidentManageDetailService extends CrudService<AccidentManageDetailDao, AccidentManageDetail> {

	@Autowired
	private AccidentManageDetailDao accidentManageDetailDao;
	
	public AccidentManageDetail get(String id) {
		return super.get(id);
	}
	
	public List<AccidentManageDetail> findList(AccidentManageDetail accidentManageDetail) {
		return super.findList(accidentManageDetail);
	}
	
	public Page<AccidentManageDetail> findPage(Page<AccidentManageDetail> page, AccidentManageDetail accidentManageDetail) {
		return super.findPage(page, accidentManageDetail);
	}
	
	@Transactional(readOnly = false)
	public void save(AccidentManageDetail accidentManageDetail) {
		super.save(accidentManageDetail);
	}
	
	@Transactional(readOnly = false)
	public void update(AccidentManageDetail accidentManageDetail) {
		accidentManageDetailDao.update(accidentManageDetail);
	}
	
	@Transactional(readOnly = false)
	public void delete(AccidentManageDetail accidentManageDetail) {
		super.delete(accidentManageDetail);
	}
	@Transactional(readOnly = false)
	public void deleteByamId(AccidentManageDetail accidentManageDetail) {
		accidentManageDetailDao.deleteByamId(accidentManageDetail);
	}

	public AccidentManageDetail findOnlyOne(String accidentManageId){
		return accidentManageDetailDao.findOnlyOne(accidentManageId);
	}
	
}