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
import com.bt.modules.accident.entity.AccidentShareMoney;
import com.bt.modules.accident.dao.AccidentShareMoneyDao;

/**
 * 事故分摊金额Service
 * @author pc
 * @version 2015-10-14
 */
@Service
@Transactional(readOnly = true)
public class AccidentShareMoneyService extends CrudService<AccidentShareMoneyDao, AccidentShareMoney> {

	
	@Autowired
	private AccidentShareMoneyDao accidentShareMoneyDao;
	
	public AccidentShareMoney get(String id) {
		return super.get(id);
	}
	
	public List<AccidentShareMoney> findList(AccidentShareMoney accidentShareMoney) {
		return super.findList(accidentShareMoney);
	}
	
	public Page<AccidentShareMoney> findPage(Page<AccidentShareMoney> page, AccidentShareMoney accidentShareMoney) {
		return super.findPage(page, accidentShareMoney);
	}
	
	@Transactional(readOnly = false)
	public void save(AccidentShareMoney accidentShareMoney) {
		super.save(accidentShareMoney);
	}
	
	@Transactional(readOnly = false)
	public void delete(AccidentShareMoney accidentShareMoney) {
		super.delete(accidentShareMoney);
	}
	
	@Transactional(readOnly = false)
	public void deleteByamId(AccidentShareMoney accidentShareMoney) {
		accidentShareMoneyDao.deleteByamId(accidentShareMoney);
	}
	
}