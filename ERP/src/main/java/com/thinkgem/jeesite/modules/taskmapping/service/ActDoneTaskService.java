/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taskmapping.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.taskmapping.entity.ActDoneTask;
import com.thinkgem.jeesite.modules.taskmapping.dao.ActDoneTaskDao;

/**
 * 审批过任务Service
 * @author fjy
 * @version 2016-03-09
 */
@Service
@Transactional(readOnly = true)
public class ActDoneTaskService extends CrudService<ActDoneTaskDao, ActDoneTask> {



	@Transactional(readOnly = false)
	public void save(ActDoneTask actDoneTask) {
		super.save(actDoneTask);
	}
	

}