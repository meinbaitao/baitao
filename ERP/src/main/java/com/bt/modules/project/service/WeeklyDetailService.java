/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.project.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.bt.modules.project.entity.WeeklyDetail;
import com.bt.modules.project.dao.WeeklyDetailDao;

/**
 * 项目周报明细Service
 * @author xjp
 * @version 2015-09-14
 */
@Service
@Transactional(readOnly = true)
public class WeeklyDetailService extends CrudService<WeeklyDetailDao, WeeklyDetail> {

	public WeeklyDetail get(String id) {
		return super.get(id);
	}
	
	public List<WeeklyDetail> findList(WeeklyDetail weeklyDetail) {
		return super.findList(weeklyDetail);
	}
	
	public Page<WeeklyDetail> findPage(Page<WeeklyDetail> page, WeeklyDetail weeklyDetail) {
		return super.findPage(page, weeklyDetail);
	}
	
	@Transactional(readOnly = false)
	public void save(WeeklyDetail weeklyDetail) {
		super.save(weeklyDetail);
	}
	
	@Transactional(readOnly = false)
	public void delete(WeeklyDetail weeklyDetail) {
		super.delete(weeklyDetail);
	}
	
}