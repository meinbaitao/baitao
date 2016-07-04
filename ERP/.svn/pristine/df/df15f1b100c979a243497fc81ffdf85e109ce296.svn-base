/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.task.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.task.dao.TaskPersonalPlanDao;
import com.bt.modules.task.entity.TaskPersonalPlan;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 个人管控任务Service
 * @author qf
 * @version 2015-09-09
 */
@Service
@Transactional(readOnly = true)
public class TaskPersonalPlanService extends CrudService<TaskPersonalPlanDao, TaskPersonalPlan> {

	public TaskPersonalPlan get(String id) {
		return super.get(id);
	}
	
	public List<TaskPersonalPlan> findList(TaskPersonalPlan taskPersonalPlan) {
		return super.findList(taskPersonalPlan);
	}
	
	public Page<TaskPersonalPlan> findPage(Page<TaskPersonalPlan> page, TaskPersonalPlan taskPersonalPlan) {
		return super.findPage(page, taskPersonalPlan);
	}
	
	public Page<TaskPersonalPlan> findByUser(Page<TaskPersonalPlan> page, TaskPersonalPlan taskPersonalPlan) {
		List<TaskPersonalPlan> list = super.findList(taskPersonalPlan);
		List<TaskPersonalPlan> find = new ArrayList<TaskPersonalPlan>();
		User user = UserUtils.getUser();
		for (TaskPersonalPlan t : list) {
			if(user.getId().equals(t.getResponsiblePerson()) && "0".equals(t.getDelFlag())){
				find.add(t);
			}
		}
		taskPersonalPlan.setPage(page);
		page.setList(find);
		return page;
	}
	
	public Page<TaskPersonalPlan> findPageTask(Page<TaskPersonalPlan> page, TaskPersonalPlan taskPersonalPlan,String pId) {
		List<TaskPersonalPlan> list = super.findList(taskPersonalPlan);
		List<TaskPersonalPlan> find = new ArrayList<TaskPersonalPlan>();
		for (TaskPersonalPlan t : list) {
			if(pId.equals(t.getParentId()) && "0".equals(t.getDelFlag())){
				find.add(t);
			}
		}
		taskPersonalPlan.setPage(page);
		page.setList(find);
		return page;
	}
	
	@Transactional(readOnly = false)
	public void save(TaskPersonalPlan taskPersonalPlan) {
		if(StringUtils.isEmpty(taskPersonalPlan.getId())){
			taskPersonalPlan.setId(IdGen.uuid());
		}
		super.save(taskPersonalPlan);
	}
	
	@Transactional(readOnly = false)
	public void delete(TaskPersonalPlan taskPersonalPlan) {
		super.delete(taskPersonalPlan);
	}
	
	@Transactional(readOnly = false)
	public void delFlag(String ids) {
		String[] array =ids.split(",");
		if(array !=null && array.length>0){
			for(int i=0;i<array.length;i++){
				TaskPersonalPlan taskPlan = new TaskPersonalPlan();
				taskPlan.setId(array[i]);
				super.delete(taskPlan);
			}
		}
	}
}