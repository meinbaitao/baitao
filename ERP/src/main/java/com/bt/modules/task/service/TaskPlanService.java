/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.task.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.task.dao.TaskPlanDao;
import com.bt.modules.task.entity.TaskPlan;
import com.bt.modules.task.entity.TaskQuotaPlan;
import com.bt.modules.utils.CommonConstant;
import com.bt.modules.utils.CommonStatus;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 任务型计划信息表Service
 * @author yzh
 * @version 2015-09-02
 */
@Service
@Transactional
public class TaskPlanService extends CrudService<TaskPlanDao, TaskPlan> {
	
	public TaskPlan get(String id) {
		return super.get(id);
	}
	
	public List<TaskPlan> findList(TaskPlan taskPlan) {
		return super.findList(taskPlan);
	}
	
	public Page<TaskPlan> findPage(Page<TaskPlan> page, TaskPlan taskPlan) {
		return super.findPage(page, taskPlan);
	}
	
	/**
	 * 查找当前用户相关的任务型计划，相关条件：创建人、责任人、复评人
	 * @param page
	 * @param taskPlan
	 * @return
	 */
	public Page<TaskPlan> findPageByUser(Page<TaskPlan> page, TaskPlan taskPlan){
		List<TaskPlan> list = super.findList(taskPlan);
		List<TaskPlan> find = new ArrayList<TaskPlan>();
		User user = UserUtils.getUser();
		Subject sub = UserUtils.getSubject();
		for (TaskPlan t : list) {
			if(user.getOffice()!=null){
				if (user.getOffice().getId().equals(t.getDeptId())){
					if((sub.hasRole(CommonConstant.FUPING) && user.getOffice().getId().equals(t.getReviewDeptId()))
							|| user.getId().equals(t.getResponsiblePerson())
							|| user.getId().equals(t.getCreateBy().getId())) {
									if(StringUtils.isNotEmpty(taskPlan.getTaskDesc())){
										if(t.getTaskDesc().contains(taskPlan.getTaskDesc())){
											find.add(t);
										}
									}else{
										find.add(t);
									}
							}
				}
			}
		}
		taskPlan.setPage(page);
		page.setList(find);
		return page;
	}
	
	public Page<TaskPlan> adminFindPage(Page<TaskPlan> page, TaskPlan taskPlan){
		List<TaskPlan> list = super.findList(taskPlan);
		List<TaskPlan> find = new ArrayList<TaskPlan>();
		User user = UserUtils.getUser();
		for (TaskPlan t : list) {
			if(user.getOffice().getId().equals(t.getDeptId())){
				if(StringUtils.isNotEmpty(taskPlan.getTaskDesc())){
					if(t.getTaskDesc().contains(taskPlan.getTaskDesc())){
						find.add(t);
					}
				}else{
					find.add(t);
				}
			}
		}
		taskPlan.setPage(page);
		page.setList(find);
		return page;
	}
	
	/**
	 * 根据当前用户查找指定状态的任务（根据责任人查找）
	 * @param page
	 * @param taskPlan
	 * @return
	 */
	public Page<TaskPlan> findByStatus(Page<TaskPlan> page, TaskPlan taskPlan,String taskStatus){
		List<TaskPlan> list = super.findList(taskPlan);
		List<TaskPlan> find = new ArrayList<TaskPlan>();
		User user = UserUtils.getUser();
		for (TaskPlan t : list) {
				if(user.getId().equals(t.getResponsiblePerson()) && taskStatus.equals(t.getStatus())){
					if(StringUtils.isEmpty(t.getFinishTimeAdjust2())){
						if(StringUtils.isNotEmpty(taskPlan.getTaskDesc())){
							if(t.getTaskDesc().contains(taskPlan.getTaskDesc())){
								find.add(t);
							}
						}else{
							find.add(t);
						}
					}
				}
		}
		taskPlan.setPage(page);
		page.setList(find);
		return page;
	}
	
	
	/**
	 * 根据当前用户查找指定状态的任务（根据责任人查找）
	 * @param page
	 * @param taskPlan
	 * @return
	 */
	public Page<TaskPlan> findByStatus2(Page<TaskPlan> page, TaskPlan taskPlan,String taskStatus){
		List<TaskPlan> list = super.findList(taskPlan);
		List<TaskPlan> find = new ArrayList<TaskPlan>();
		User user = UserUtils.getUser();
		for (TaskPlan t : list) {
			if(user.getId().equals(t.getResponsiblePerson()) && taskStatus.equals(t.getStatus())){
				if(StringUtils.isNotEmpty(taskPlan.getTaskDesc())){
					if(t.getTaskDesc().contains(taskPlan.getTaskDesc())){
						find.add(t);
					}
				}else{
					find.add(t);
				}
			}
		}
		taskPlan.setPage(page);
		page.setList(find);
		return page;
	}
	
	
	
	/**
	 * 根据当前用户查找指定状态的任务
	 * @param page
	 * @param taskPlan
	 * @return
	 */
	public Page<TaskPlan> findByUserCanDo(Page<TaskPlan> page, TaskPlan taskPlan){
		List<TaskPlan> list = super.findList(taskPlan);
		List<TaskPlan> find = new ArrayList<TaskPlan>();
		User user = UserUtils.getUser();
		Subject sub = UserUtils.getSubject();
		if(sub.hasRole(CommonConstant.FUPING)){
			if(sub.hasRole(CommonConstant.ZONGCAIBAN)){
				for (TaskPlan t : list) {
					if(CommonStatus.TEAK_WAIT_ONE.equals(t.getStatus())){
						if(StringUtils.isNotEmpty(taskPlan.getTaskDesc())){
							if(t.getTaskDesc().contains(taskPlan.getTaskDesc())){
								find.add(t);
							}
						}else{
							find.add(t);
						}
					}else if(user.getOffice().getId().equals(t.getReviewDeptId()) && (CommonStatus.TASK_WAIT_TWO.equals(t.getStatus()) || CommonStatus.TASK_WAIT_THREE.equals(t.getStatus()))){
						if(StringUtils.isNotEmpty(taskPlan.getTaskDesc())){
							if(t.getTaskDesc().contains(taskPlan.getTaskDesc())){
								find.add(t);
							}
						}else{
							find.add(t);
						}
					}
				}
			}else{
				for (TaskPlan t : list) {
					if(user.getOffice().getId().equals(t.getReviewDeptId()) && (CommonStatus.TASK_WAIT_TWO.equals(t.getStatus()) || CommonStatus.TASK_WAIT_THREE.equals(t.getStatus()))){
						if(StringUtils.isNotEmpty(taskPlan.getTaskDesc())){
							if(t.getTaskDesc().contains(taskPlan.getTaskDesc())){
								find.add(t);
							}
						}else{
							find.add(t);
						}
					}
				}
			}
		}
		taskPlan.setPage(page);
		page.setList(find);
		return page;
	}
	
	
	
	public Page<TaskPlan> findTaskTreeByUser(Page<TaskPlan> page, TaskPlan taskPlan){
		List<TaskPlan> list = super.findList(taskPlan);
		List<TaskPlan> find = new ArrayList<TaskPlan>();
		User user = UserUtils.getUser();
		for (TaskPlan t : list) {
			if(user.getOffice()!=null){
				if(user.getOffice().getId().equals(t.getDeptId())){
					if("1".equals(t.getSubTask())){
						find.add(t);
					}
				}
			}
		}
		taskPlan.setPage(page);
		page.setList(find);
		return page;
	}
	
	/**
	 * 权重统计
	 * @param list
	 * @return
	 */
	public String getWeightCount(List<TaskQuotaPlan> list){
		double num1 = 0;
		double num2 = 0;
		if(list.size()>0){
			for (TaskQuotaPlan t : list) {
				if(StringUtils.isNotEmpty(t.getWeight())){
					String weight = t.getWeight();
					if(t.getWeight().endsWith("%")){
						weight = weight.replace("%", "");
						num1 += Double.parseDouble(weight);
					}else{
						num2 += Double.parseDouble(weight)*100;
					}
				}
			}
		}
			return (num1+num2)+"%";
	}
	
	/**
	 * 得分统计
	 * @param list
	 * @return
	 */
	public String getScoreCount(List<TaskQuotaPlan> list){
		double num = 0;
		if(list.size()>0){
			for (TaskQuotaPlan t : list) {
				if(StringUtils.isNotEmpty(t.getWeight()) && StringUtils.isNotEmpty(t.getGoal())){
					String weight = t.getWeight();
					if(t.getWeight().endsWith("%")){
						weight = weight.replace("%", "");
						weight = Double.parseDouble(weight)/100+"";
					}
					num += Double.parseDouble(weight)*Double.parseDouble(t.getGoal());
				}
			}
		}
		return num+"";
	}
	
	/**
	 * 根据部门查找和当前用户相关的任务型计划信息，相关条件：创建人、责任人、复评人
	 * @param page
	 * @param taskPlan
	 * @param id
	 * @return
	 */
	public Page<TaskPlan> findPageByOfficeType(Page<TaskPlan> page, TaskPlan taskPlan,String id){
		List<TaskPlan> list = super.findList(taskPlan);
		List<TaskPlan> find = new ArrayList<TaskPlan>();
		User user = UserUtils.getUser();
		Subject sub = UserUtils.getSubject();
		for (TaskPlan t : list) {
				if (id.equals(t.getDeptId())){
					if((sub.hasRole(CommonConstant.FUPING) && user.getOffice().getId().equals(t.getReviewDeptId())) || user.getId().equals(t.getCreateBy().getId()) ||user.getId().equals(t.getResponsiblePerson())) {
						if(StringUtils.isNotEmpty(taskPlan.getTaskDesc())){
							if(t.getTaskDesc().contains(taskPlan.getTaskDesc())){
								find.add(t);
							}
						}else{
							find.add(t);
						}
				}
			}
		}
		taskPlan.setPage(page);
		page.setList(find);
		return page;
	}
	
	public Page<TaskPlan> adminFindPageByOfficeType(Page<TaskPlan> page, TaskPlan taskPlan,String id){
		List<TaskPlan> list = super.findList(taskPlan);
		List<TaskPlan> find = new ArrayList<TaskPlan>();
		for (TaskPlan t : list) {
				if(id.equals(t.getDeptId())) {
					if(StringUtils.isNotEmpty(taskPlan.getTaskDesc())){
						if(t.getTaskDesc().contains(taskPlan.getTaskDesc())){
							find.add(t);
						}
					}else{
						find.add(t);
					}
			}
		}
		taskPlan.setPage(page);
		page.setList(find);
		return page;
	}
	
	@Transactional(readOnly = false)
	public void save(TaskPlan taskPlan) {
		super.save(taskPlan);
	}
	
	@Transactional(readOnly = false)
	public void updateSubTask(TaskPlan taskPlan) {
		dao.updateSubTask(taskPlan);
	}
	
	@Transactional(readOnly = false)
	public void saveTaskPlan(TaskPlan taskPlan) {
		TaskPlan p = get(taskPlan.getId());
		if(null!=p.getDiscussionSuggestion()){
			taskPlan.setDiscussionSuggestion(p.getDiscussionSuggestion());
		}
		if(StringUtils.isNotEmpty(p.getGroupConcern())){
			taskPlan.setGroupConcern(p.getGroupConcern());
		}
		if(StringUtils.isNotEmpty(p.getLongTermTask())){
			taskPlan.setLongTermTask(p.getLongTermTask());
		}
		if(StringUtils.isNotEmpty(p.getSubTask())){
			taskPlan.setSubTask(p.getSubTask());
		}
		super.save(taskPlan);
	}
	
	@Transactional(readOnly = false)
	public void delete(TaskPlan taskPlan) {
		super.delete(taskPlan);
	}
	
	@Transactional(readOnly = false)
	public void delFlag(String ids) {
		String[] array =ids.split(",");
		if(array !=null && array.length>0){
			for(int i=0;i<array.length;i++){
				TaskPlan taskPlan = new TaskPlan();
				taskPlan.setId(array[i]);
				super.delete(taskPlan);
			}
		}
	}
}