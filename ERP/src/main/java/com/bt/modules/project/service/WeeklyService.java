/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.project.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.bt.modules.project.entity.Weekly;
import com.bt.modules.project.dao.WeeklyDao;

/**
 * 项目周报Service
 * @author xjp
 * @version 2015-09-14
 */
@Service
@Transactional(readOnly = true)
public class WeeklyService extends CrudService<WeeklyDao, Weekly> {

	public Weekly get(String id) {
		return super.get(id);
	}
	
	public List<Weekly> findList(Weekly weekly) {
		return super.findList(weekly);
	}
	
	public Page<Weekly> findPage(Page<Weekly> page, Weekly weekly) {
		return super.findPage(page, weekly);
	}
	
	@Transactional(readOnly = false)
	public void save(Weekly weekly) {
		super.save(weekly);
	}
	
	@Transactional(readOnly = false)
	public void delete(Weekly weekly) {
		super.delete(weekly);
	}
	
}