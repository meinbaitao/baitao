/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.task.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bt.modules.task.entity.TaskPlan;
import com.bt.modules.task.entity.TaskQuotaPlan;
import com.bt.modules.task.service.TaskPlanService;
import com.bt.modules.task.service.TaskQuotaPlanService;
import com.bt.modules.utils.CommonStatus;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 复评申请Controller
 * @author yzh
 * @version 2015-09-10
 */
@Controller
@RequestMapping(value = "${adminPath}/task/repeatTeak")
public class RepeatTaskController extends BaseController {

	@Autowired
	private TaskQuotaPlanService taskQuotaPlanService;
	@Autowired
	private TaskPlanService taskPlanService;
	
	@ModelAttribute
	public TaskQuotaPlan get(@RequestParam(required=false) String id) {
		TaskQuotaPlan entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = taskQuotaPlanService.get(id);
		}
		if (entity == null){
			entity = new TaskQuotaPlan();
		}
		return entity;
	}
	/**
	 * 进入复评页面，默认显示责任人相关的任务信息
	 * @param taskPlan
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"list", ""})
	public String list(TaskPlan taskPlan, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TaskPlan> page = taskPlanService.findByStatus2(new Page<TaskPlan>(request, response), taskPlan,CommonStatus.TASK_DOING); 
		model.addAttribute("page", page);
		return "modules/task/repeatTask";
	}

	/**
	 * 分类型操作申请复评信息
	 * @param taskQuotaPlan	指标型计划
	 * @param taskPlan		任务型计划
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value="findByType")
	public String findByType(TaskQuotaPlan taskQuotaPlan,TaskPlan taskPlan, HttpServletRequest request, HttpServletResponse response, Model model){
		String taskType = request.getParameter("taskType");
		if("2".equals(taskType)){
			Page<TaskQuotaPlan> page = taskQuotaPlanService.findByStatus2(new Page<TaskQuotaPlan>(request, response), taskQuotaPlan,CommonStatus.TASK_DOING);
			model.addAttribute("page", page);
			model.addAttribute("searchKey", taskQuotaPlan.getQuotaDesc());
		}else{
			Page<TaskPlan> page = taskPlanService.findByStatus2(new Page<TaskPlan>(request, response), taskPlan,CommonStatus.TASK_DOING); 
			model.addAttribute("page", page);
			model.addAttribute("searchKey", taskPlan.getTaskDesc());
		}
		model.addAttribute("taskType", taskType);
		if("2".equals(taskType)){
			return "modules/task/repeatTaskQuotaInfo";
		}else{
			return "modules/task/repeatTask";
		}
	}
	
	
	
	/**
	 * 申请复评任务型计划
	 * @param taskPlan
	 * @param request
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "setTaskPlanDelay")
	public String setTaskPlanDelay(TaskPlan taskPlan,HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes){
		String ids = request.getParameter("ids");
		List<TaskPlan> list = taskPlan.getTaskList();
		if(null !=list){
			for(TaskPlan t:list){
				if(ids.contains(t.getId())){
					TaskPlan tp = taskPlanService.get(t.getId());
					tp.setIsNewRecord(false);
					tp.setStatus(CommonStatus.TASK_WAIT_THREE);
					//如果实际完成时间为空怎不会提交申请
					if(StringUtils.isNotEmpty(t.getActualFinishTime())){
						tp.setActualFinishTime(t.getActualFinishTime());
					}
					if(StringUtils.isNotEmpty(t.getSummaryRemarks())){
						tp.setSummaryRemarks(t.getSummaryRemarks());
					}
					taskPlanService.saveTaskPlan(tp);
				}
			}
		}
			addMessage(redirectAttributes, "申请已发出！");
		return "redirect:"+Global.getAdminPath()+"/task/repeatTeak/findByType?taskType=1";
	}
	
	/**
	 * 申请复评指标型计划
	 * @param request
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "setTaskQuotaPlanDelay")
	public String setTaskQuotaPlanDelay(TaskQuotaPlan taskQuotaPlan,HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes){
		String ids = request.getParameter("ids");
		List<TaskQuotaPlan> list = taskQuotaPlan.getTaskQuotaPlanList();
		if(null !=list){
			for(TaskQuotaPlan t:list){
				if(ids.contains(t.getId())){
					TaskQuotaPlan tp = taskQuotaPlanService.get(t.getId());
					tp.setIsNewRecord(false);
					tp.setStatus(CommonStatus.TASK_WAIT_THREE);
					if(StringUtils.isNotEmpty(t.getActualFinishQuantity())){tp.setActualFinishQuantity(t.getActualFinishQuantity());}
					if(StringUtils.isNotEmpty(t.getSummaryRemarks())){tp.setSummaryRemarks(t.getSummaryRemarks());}
					
					taskQuotaPlanService.save(tp);
				}
			}
		}
			addMessage(redirectAttributes, "申请已发出！");
		return "redirect:"+Global.getAdminPath()+"/task/repeatTeak/findByType?taskType=2";
	}
	
	
	
	
	

}