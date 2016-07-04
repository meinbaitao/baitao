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
import com.bt.modules.task.service.TaskPlanService;
import com.bt.modules.task.service.TaskQuotaPlanService;
import com.bt.modules.utils.CommonStatus;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;

/**
 * 申请延期Controller
 * @author yzh
 * @version 2015-09-02
 */
@Controller
@RequestMapping(value = "${adminPath}/task/delayTask")
public class DelayTaskController extends BaseController {

	@Autowired
	private TaskPlanService taskPlanService;
	@Autowired
	private OfficeService officeService;
	@Autowired
	TaskQuotaPlanService taskQuotaPlanService;
	
	
	@ModelAttribute
	public TaskPlan get(@RequestParam(required=false) String id) {
		TaskPlan entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = taskPlanService.get(id);
		}
		if (entity == null){
			entity = new TaskPlan();
		}
		return entity;
	}
	
	/**
	 * 进入申请延期页面，默认显示责任人的执行中的任务（可延期的任务）
	 * @param taskPlan
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"list", ""})
	public String list(TaskPlan taskPlan, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TaskPlan> page = taskPlanService.findByStatus(new Page<TaskPlan>(request, response), taskPlan,CommonStatus.TASK_DOING); 
		model.addAttribute("page", page);
		return "modules/task/delayTask";
	}
	
	/**
	 * 申请延期
	 * @param request
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "setDelay")
	public String setDelay(TaskPlan taskPlan,HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes){
		String ids = request.getParameter("ids");
		List<TaskPlan> list = taskPlan.getTaskList();
		int num = 0;
		if(null !=list){
			for(TaskPlan t:list){
				int status = 0;
				if(ids.contains(t.getId())){
					TaskPlan tp = taskPlanService.get(t.getId());
					tp.setIsNewRecord(false);
					tp.setStatus(CommonStatus.TASK_WAIT_TWO);
					//如果本身完成时间1为空，那么就是未设置申请延期
					if(StringUtils.isNotEmpty(tp.getFinishTimeAdjust1())){
						if(StringUtils.isNotEmpty(t.getFinishTimeAdjust2())){
							tp.setFinishTimeAdjust2(t.getFinishTimeAdjust2());
							status = 1;
						}else{
							num += 1;
						}
					}else{
						//如果本身为空，但传入的完成时间1不为空则hi第一次延期申请
						if(StringUtils.isNotEmpty(t.getFinishTimeAdjust1())){
							tp.setFinishTimeAdjust1(t.getFinishTimeAdjust1());
							status = 1;
						}else{
							num += 1;
						}
					}
					if(status>0){
						taskPlanService.saveTaskPlan(tp);
					}
				}
			}
		}
		if(num>0){
			addMessage(redirectAttributes, "个别申请未设置延期时间！");
		}else{
			addMessage(redirectAttributes, "申请已发出！");
		}
		return "redirect:"+Global.getAdminPath()+"/task/delayTask/list";
	}
	
	

}