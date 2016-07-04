package com.bt.modules.execution.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.execution.dao.ScheduleIssueDao;
import com.bt.modules.execution.entity.ScheduleIssue;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 项目问题管理
 * @author xjp
 * @version 2015-08-4
 */
@Service
@Transactional(readOnly = true)
public class ScheduleIssueService extends CrudService<ScheduleIssueDao, ScheduleIssue> {
	
	public ScheduleIssue get(String id) {
		return super.get(id);
	}
	
	public List<ScheduleIssue> findList(ScheduleIssue scheduleIssue) {
		return super.findList(scheduleIssue);
	}
	
	public Page<ScheduleIssue> findPage(Page<ScheduleIssue> page, ScheduleIssue scheduleIssue) {
		return super.findPage(page, scheduleIssue);
	}
	
	@Transactional(readOnly = false)
	public void save(ScheduleIssue scheduleIssue) {
		super.save(scheduleIssue);
	}
	
	@Transactional(readOnly = false)
	public void update(ScheduleIssue scheduleIssue) {
		super.dao.update(scheduleIssue);
	}
	
	@Transactional(readOnly = false)
	public void delete(ScheduleIssue scheduleIssue) {
		super.delete(scheduleIssue);
	}
}