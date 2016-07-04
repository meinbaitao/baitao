/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taskmapping.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.taskmapping.entity.ActCurrentTask;

import java.util.List;

/**
 * 当前任务DAO接口
 * @author fjy
 * @version 2016-03-09
 */
@MyBatisDao
public interface ActCurrentTaskDao extends CrudDao<ActCurrentTask> {

    public List<ActCurrentTask> findCurrentTaskByEntryAndTable(ActCurrentTask currentTask);

    public List<ActCurrentTask> findList(ActCurrentTask currentTask);

    public List<ActCurrentTask> searchTaskWithWeeklyReport(ActCurrentTask currentTask);
	
}