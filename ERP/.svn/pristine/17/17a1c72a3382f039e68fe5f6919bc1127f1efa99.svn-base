/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.task.dao;

import com.bt.modules.task.entity.TaskPlan;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 任务型计划信息表DAO接口
 * @author yzh
 * @version 2015-09-02
 */
@MyBatisDao
public interface TaskPlanDao extends CrudDao<TaskPlan> {
	
	
	/**
	 * 设置子任务状态
	 * @param taskPlan
	 */
	public void updateSubTask(TaskPlan taskPlan);
	
}