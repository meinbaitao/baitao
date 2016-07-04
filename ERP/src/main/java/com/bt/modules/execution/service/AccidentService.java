/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.execution.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.bt.modules.execution.entity.Accident;
import com.bt.modules.execution.dao.AccidentDao;

/**
 * 事故单Service
 * @author xjp
 * @version 2015-08-14
 */
@Service
@Transactional(readOnly = true)
public class AccidentService extends CrudService<AccidentDao, Accident> {

	
	
	public Accident get(String id) {
		return super.get(id);
	}
	
	public List<Accident> findList(Accident accident) {
		return super.findList(accident);
	}
	
	public Page<Accident> findPage(Page<Accident> page, Accident accident) {
		return super.findPage(page, accident);
	}
	
	@Transactional(readOnly = false)
	public void save(Accident accident) {
		accident.setIsNewRecord(true);
		super.save(accident);
	}
	
	@Transactional(readOnly = false)
	public void update(Accident accident) {
		super.dao.update(accident);
	}

	
	@Transactional(readOnly = false)
	public void delete(Accident accident) {
		super.delete(accident);
	}
	
	/**
	 * 查询所有项目中的事故问题
	 * @return
	 */
	public List<Map<String, Object>> findListByProjectId(Accident accident) {
		
		return super.dao.findListByProjectId(accident);
	}
	
	
	
}