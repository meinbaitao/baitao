/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.task.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.task.dao.TaskQuotaPlanDao;
import com.bt.modules.task.entity.TaskQuotaPlan;
import com.bt.modules.utils.CommonConstant;
import com.bt.modules.utils.CommonStatus;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 指标型总控计划Service
 * @author yzh
 * @version 2015-09-10
 */
@Service
@Transactional
public class TaskQuotaPlanService extends CrudService<TaskQuotaPlanDao, TaskQuotaPlan> {

	@Autowired
	private TaskQuotaPlanDao taskQuotaPlanDao;
	
	public TaskQuotaPlan get(String id) {
		return super.get(id);
	}
	
	public List<TaskQuotaPlan> findList(TaskQuotaPlan taskQuotaPlan) {
		return super.findList(taskQuotaPlan);
	}
	
	public Page<TaskQuotaPlan> findPage(Page<TaskQuotaPlan> page, TaskQuotaPlan taskQuotaPlan) {
		return super.findPage(page, taskQuotaPlan);
	}
	
	/**
	 * 根据部门当前用户相关的指标性计划信息，相关条件：创建人、责任人、复评人
	 * @param page
	 * @param taskQuotaPlan
	 * @param id
	 * @return
	 */
	public Page<TaskQuotaPlan> findByOfficeType(Page<TaskQuotaPlan> page, TaskQuotaPlan taskQuotaPlan,String id,String thisMonth) {
		List<TaskQuotaPlan> list = super.findList(taskQuotaPlan);
		List<TaskQuotaPlan> find = new ArrayList<TaskQuotaPlan>();
		User user = UserUtils.getUser();
		Subject sub = UserUtils.getSubject();
		for (TaskQuotaPlan t : list) {
			if (id.equals(t.getDeptId())){
				if((sub.hasRole(CommonConstant.FUPING) && user.getOffice().getId().equals(t.getReviewDeptId())) || user.getId().equals(t.getCreateBy().getId()) ||user.getId().equals(t.getResponsiblePerson())) {
					if(StringUtils.isNotEmpty(taskQuotaPlan.getQuotaDesc())){
						if(t.getQuotaDesc().contains(taskQuotaPlan.getQuotaDesc()) && thisMonth.equals(t.getTaskMonth())){
							find.add(t);
						}
					}else{
						if(thisMonth.equals(t.getTaskMonth())){
							find.add(t);
						}
					}
				}
			}
		}
		taskQuotaPlan.setPage(page);
		page.setList(find);
		return page;
	}
	
	
	public Page<TaskQuotaPlan> adminFindByOfficeType(Page<TaskQuotaPlan> page, TaskQuotaPlan taskQuotaPlan,String id,String thisMonth) {
		List<TaskQuotaPlan> list = super.findList(taskQuotaPlan);
		List<TaskQuotaPlan> find = new ArrayList<TaskQuotaPlan>();
		for (TaskQuotaPlan t : list) {
			if (id.equals(t.getDeptId())){
				if(StringUtils.isNotEmpty(taskQuotaPlan.getQuotaDesc())){
					if(t.getQuotaDesc().contains(taskQuotaPlan.getQuotaDesc()) && thisMonth.equals(t.getTaskMonth())){
						find.add(t);
					}
				}else{
					if(thisMonth.equals(t.getTaskMonth())){
						find.add(t);
					}
				}
			}
		}
		taskQuotaPlan.setPage(page);
		page.setList(find);
		return page;
	}
		
	
	public Page<TaskQuotaPlan> findByUser(Page<TaskQuotaPlan> page, TaskQuotaPlan taskQuotaPlan) {
		List<TaskQuotaPlan> list = super.findList(taskQuotaPlan);
		List<TaskQuotaPlan> find = new ArrayList<TaskQuotaPlan>();
		User user = UserUtils.getUser();
		for (TaskQuotaPlan t : list) {
			if(user.getOffice().getId().equals(t.getDeptId())){
				find.add(t);
			}
		}
		taskQuotaPlan.setPage(page);
		page.setList(find);
		return page;
	}
	
	/**
	 * 根据当前用户查找指定状态的指标型任务
	 * @param page
	 * @param taskQuotaPlan
	 * @return
	 */
	public Page<TaskQuotaPlan> findByStatus(Page<TaskQuotaPlan> page, TaskQuotaPlan taskQuotaPlan) {
		List<TaskQuotaPlan> list = super.findList(taskQuotaPlan);
		List<TaskQuotaPlan> find = new ArrayList<TaskQuotaPlan>();
		User user = UserUtils.getUser();
		Subject sub = UserUtils.getSubject();
		if(sub.hasRole(CommonConstant.FUPING)){
			if(sub.hasRole(CommonConstant.ZONGCAIBAN)){
				for (TaskQuotaPlan t : list) {
						if(CommonStatus.TEAK_WAIT_ONE.equals(t.getStatus())){
							if(StringUtils.isNotEmpty(taskQuotaPlan.getQuotaDesc())){
								if(t.getQuotaDesc().contains(taskQuotaPlan.getQuotaDesc())){
									find.add(t);
								}
							}else{
								find.add(t);
							}
						}else if(user.getOffice().getId().equals(t.getReviewDeptId()) && CommonStatus.TASK_WAIT_THREE.equals(t.getStatus())){
							if(StringUtils.isNotEmpty(taskQuotaPlan.getQuotaDesc())){
								if(t.getQuotaDesc().contains(taskQuotaPlan.getQuotaDesc())){
									find.add(t);
								}
							}else{
								find.add(t);
							}
						}
					}
			}else{
				for (TaskQuotaPlan t : list) {
						if(user.getOffice().getId().equals(t.getReviewDeptId()) && CommonStatus.TASK_WAIT_THREE.equals(t.getStatus())){
							if(StringUtils.isNotEmpty(taskQuotaPlan.getQuotaDesc())){
								if(t.getQuotaDesc().contains(taskQuotaPlan.getQuotaDesc())){
									find.add(t);
								}
							}else{
								find.add(t);
							}
						}
					}
			}
		}
		taskQuotaPlan.setPage(page);
		page.setList(find);
		return page;
	}
	
	/**
	 * 根据当前用户查找指定状态的指标型任务（根据责任人查找）
	 * @param page
	 * @param taskQuotaPlan
	 * @return
	 */
	public Page<TaskQuotaPlan> findByStatus2(Page<TaskQuotaPlan> page, TaskQuotaPlan taskQuotaPlan,String taskStatus) {
		List<TaskQuotaPlan> list = super.findList(taskQuotaPlan);
		List<TaskQuotaPlan> find = new ArrayList<TaskQuotaPlan>();
		User user = UserUtils.getUser();
		for (TaskQuotaPlan t : list) {
				if(user.getId().equals(t.getResponsiblePerson()) && taskStatus.equals(t.getStatus())){
					if(StringUtils.isNotEmpty(taskQuotaPlan.getQuotaDesc())){
						if(t.getQuotaDesc().contains(taskQuotaPlan.getQuotaDesc())){
							find.add(t);
						}
					}else{
						find.add(t);
					}
				}
			}
		taskQuotaPlan.setPage(page);
		page.setList(find);
		return page;
	}
	
	
	/**
	 * 根据当前用户查找指定状态的指标型任务
	 * @param page
	 * @param taskQuotaPlan
	 * @return
	 */
	public Page<TaskQuotaPlan> findByUserCanDo(Page<TaskQuotaPlan> page, TaskQuotaPlan taskQuotaPlan,String taskStatus) {
		List<TaskQuotaPlan> list = super.findList(taskQuotaPlan);
		List<TaskQuotaPlan> find = new ArrayList<TaskQuotaPlan>();
		User user = UserUtils.getUser();
		for (TaskQuotaPlan t : list) {
			if(user.getOffice().getId().equals(t.getReviewDeptId()) && taskStatus.equals(t.getStatus())){
				find.add(t);
			}
		}
		taskQuotaPlan.setPage(page);
		page.setList(find);
		return page;
	}
	
	
	@Transactional(readOnly = false)
	public void save(TaskQuotaPlan taskQuotaPlan) {
		super.save(taskQuotaPlan);
	}
	
	@Transactional(readOnly = false)
	public void delete(TaskQuotaPlan taskQuotaPlan) {
		super.delete(taskQuotaPlan);
	}
	
	/**
	 * 批量修改数据（如：指派时）
	 * @param listPD
	 */
	@Transactional(readOnly = false)
	public void batchUpdate(List<TaskQuotaPlan> listPD){
		for(TaskQuotaPlan pd:listPD){
			taskQuotaPlanDao.update(pd);
		}
	}
	
	@Transactional(readOnly = false)
	public void delFlag(String ids) {
		String[] array =ids.split(",");
		if(array !=null && array.length>0){
			for(int i=0;i<array.length;i++){
				TaskQuotaPlan taskPlan = new TaskQuotaPlan();
				taskPlan.setId(array[i]);
				super.delete(taskPlan);
			}
		}
	}
	
}