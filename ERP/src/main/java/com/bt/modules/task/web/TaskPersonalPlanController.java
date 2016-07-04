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

import com.bt.modules.task.entity.TaskPersonalPlan;
import com.bt.modules.task.entity.TaskPlan;
import com.bt.modules.task.service.TaskPersonalPlanService;
import com.bt.modules.task.service.TaskPlanService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 个人管控任务Controller
 * @author qf
 * @version 2015-09-09
 */
@Controller
@RequestMapping(value = "${adminPath}/task/taskPersonalPlan")
public class TaskPersonalPlanController extends BaseController {

	@Autowired
	private TaskPersonalPlanService taskPersonalPlanService;
	
	@Autowired
	private TaskPlanService taskPlanService;
	
	@ModelAttribute
	public TaskPersonalPlan get(@RequestParam(required=false) String id) {
		TaskPersonalPlan entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = taskPersonalPlanService.get(id);
		}
		if (entity == null){
			entity = new TaskPersonalPlan();
		}
		return entity;
	}
	
	/**
	 * 进入个人管控信息页面
	 * @param taskPersonalPlan
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"list", ""})
	public String list(TaskPersonalPlan taskPersonalPlan, HttpServletRequest request, HttpServletResponse response, Model model) {
		/*Page<TaskPersonalPlan> page = taskPersonalPlanService.findPage(new Page<TaskPersonalPlan>(request, response), taskPersonalPlan); 
		model.addAttribute("page", page);*/
		String taskId = request.getParameter("taskId");
		model.addAttribute("taskId", taskId);
		model.addAttribute("flag", "view");
		return "modules/task/personTaskPlanList";
	}
	
	/**
	 * 根据当前用户是否是负责人查询相关个人配合
	 * @param taskPersonalPlan
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"findCoordination", ""})
	public String findCoordination(TaskPersonalPlan taskPersonalPlan,HttpServletRequest request, HttpServletResponse response, Model model){
		Page<TaskPersonalPlan> page = taskPersonalPlanService.findByUser(new Page<TaskPersonalPlan>(request, response), taskPersonalPlan);
		model.addAttribute("page", page);
		return "modules/task/coordination";
	}
	
	/**
	 * 查询个人管控相关的任务菜单
	 * @param taskPlan
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"tree", ""})
	public String taskTree(TaskPlan taskPlan,HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TaskPlan> page = taskPlanService.findTaskTreeByUser(new Page<TaskPlan>(request, response), taskPlan); 
		model.addAttribute("categoryList", page);
		return "modules/task/personTaskTree";
	}
	
	/**
	 * 进入个人管控页面默认显示所有任务的子任务
	 * @param taskPersonalPlan
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"main", ""})
	public String main(TaskPersonalPlan taskPersonalPlan,HttpServletRequest request, HttpServletResponse response, Model model) {
		String taskId = request.getParameter("taskId");
		Page<TaskPersonalPlan> page = null;
		if(StringUtils.isNotEmpty(taskId)){
			page =taskPersonalPlanService.findPageTask(new Page<TaskPersonalPlan>(request, response), taskPersonalPlan,taskId);
		}else{
			page = taskPersonalPlanService.findByUser(new Page<TaskPersonalPlan>(request, response), taskPersonalPlan);
			model.addAttribute("all", "all");
		}
		model.addAttribute("page", page);
		model.addAttribute("flag", "view");
		return "modules/task/showTaskSon";
	}
	
	/**
	 * 根据父任务ID查询子任务
	 * @param taskPersonalPlan
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "findSonTask")
	public String findSonTask(TaskPersonalPlan taskPersonalPlan,HttpServletRequest request, HttpServletResponse response, Model model) {
		String taskId = request.getParameter("taskId");
		Page<TaskPersonalPlan> page = null;
		if(StringUtils.isNotEmpty(taskId)){
			page = taskPersonalPlanService.findPageTask(new Page<TaskPersonalPlan>(request, response), taskPersonalPlan,taskId);
		}else{
			page = taskPersonalPlanService.findByUser(new Page<TaskPersonalPlan>(request, response), taskPersonalPlan);
			model.addAttribute("all", "all");
		}
		model.addAttribute("keyDesc", taskPersonalPlan.getKeyDesc());
		model.addAttribute("page", page);
		model.addAttribute("flag", "view");
		model.addAttribute("taskId", taskId);
		return "modules/task/showTaskSon";
	}
	
	
	
	@RequestMapping(value = "saveTaskPersonalPlan")
	public String saveTaskPersonalPlan(TaskPersonalPlan taskPersonalPlan,HttpServletRequest request, HttpServletResponse response, Model model,RedirectAttributes redirectAttributes) {
		String taskId = request.getParameter("taskId");
		List<TaskPersonalPlan> list = taskPersonalPlan.getTaskPersonalPlanList();
		if(null!=list){
			for (TaskPersonalPlan t : list) {
				if(StringUtils.isNotEmpty(t.getResponsiblePerson()) && StringUtils.isNotEmpty(t.getKeyDesc())){
					t.setParentId(taskId);
					t.setIsNewRecord(true);
					t.setParentId(taskId);
					taskPersonalPlanService.save(t);
				}
			}
		}
		addMessage(redirectAttributes, "保存任务信息成功");
		return "redirect:"+Global.getAdminPath()+"/task/taskPersonalPlan/findSonTask?taskId="+taskId;
	}
	
	@RequestMapping(value = "updateTaskPersonalPlan")
	public String updateTaskPersonalPlan(TaskPersonalPlan taskPersonalPlan,HttpServletRequest request, HttpServletResponse response, Model model,RedirectAttributes redirectAttributes) {
		String taskId = request.getParameter("taskId");
		List<TaskPersonalPlan> list = taskPersonalPlan.getTaskPersonalPlanList();
		if(null!=list){
			for (TaskPersonalPlan t : list) {
				if(StringUtils.isNotEmpty(t.getResponsiblePerson())){
					t.setParentId(taskId);
					t.setIsNewRecord(false);
					taskPersonalPlanService.save(t);
				}
			}
		}
		addMessage(redirectAttributes, "保存任务信息成功");
		return "redirect:"+Global.getAdminPath()+"/task/taskPersonalPlan/findSonTask?taskId="+taskId;
	}
	
	
	
	@RequestMapping(value = "deleteTaskPersonalPlan")
	public String deleteTaskPersonalPlan(TaskPersonalPlan taskPersonalPlan,HttpServletRequest request, HttpServletResponse response, Model model,RedirectAttributes redirectAttributes) {
		String taskId = request.getParameter("taskId");
		taskPersonalPlanService.delFlag(taskPersonalPlan.getId());
		addMessage(redirectAttributes, "保存任务信息成功");
		return "redirect:"+Global.getAdminPath()+"/task/taskPersonalPlan/findSonTask?taskId="+taskId;
	}
	
	
	
	
	
	
	@RequestMapping(value = "form")
	public String form(TaskPersonalPlan taskPersonalPlan, Model model) {
		model.addAttribute("taskPersonalPlan", taskPersonalPlan);
		return "modules/task/taskPersonalPlanForm";
	}

	@RequestMapping(value = "save")
	public String save(TaskPersonalPlan taskPersonalPlan, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, taskPersonalPlan)){
			return form(taskPersonalPlan, model);
		}
		taskPersonalPlanService.save(taskPersonalPlan);
		addMessage(redirectAttributes, "保存任务成功");
		return "redirect:"+Global.getAdminPath()+"/task/taskPersonalPlan/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(TaskPersonalPlan taskPersonalPlan, RedirectAttributes redirectAttributes) {
		taskPersonalPlanService.delFlag(taskPersonalPlan.getId());
		addMessage(redirectAttributes, "删除任务成功");
		return "redirect:"+Global.getAdminPath()+"/task/taskPersonalPlan/?repage";
	}

}