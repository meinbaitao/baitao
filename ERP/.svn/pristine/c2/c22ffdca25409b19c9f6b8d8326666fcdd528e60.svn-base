/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taskmapping.service;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taskmapping.entity.ActCurrentTask;
import com.thinkgem.jeesite.modules.taskmapping.dao.ActCurrentTaskDao;

/**
 * 当前任务Service
 * @author fjy
 * @version 2016-03-09
 */
@Service
@Transactional(readOnly = true)
public class ActCurrentTaskService extends CrudService<ActCurrentTaskDao, ActCurrentTask> {

	@Autowired
	private ActCurrentTaskDao taskDao;
	
	@Transactional(readOnly = false)
	public void save(ActCurrentTask actCurrentTask) {
		super.save(actCurrentTask);
	}
	
	@Transactional(readOnly = false)
	public void delete(ActCurrentTask actCurrentTask) {
		super.delete(actCurrentTask);
	}

	public List<ActCurrentTask> findCurrentTaskByEntryAndTable(String entryId, String businessTable){
		ActCurrentTask actCurrentTask = new ActCurrentTask();
		actCurrentTask.setEntryId(entryId);
		actCurrentTask.setBusinessTable(businessTable);
		return dao.findCurrentTaskByEntryAndTable(actCurrentTask);
	}

	public Page<ActCurrentTask> findPage(Page<ActCurrentTask> page, ActCurrentTask currentTask){
		return super.findPage(page, currentTask);
	}

	public Page<ActCurrentTask> searchTaskWithWeeklyReport(Page<ActCurrentTask> page, ActCurrentTask currentTask){
		currentTask.setPage(page);
		page.setList(dao.searchTaskWithWeeklyReport(currentTask));
		return page;
	}

}