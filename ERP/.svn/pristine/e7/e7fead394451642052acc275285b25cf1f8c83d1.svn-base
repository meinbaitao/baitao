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
 * 我的审批Controller
 * @author yzh
 * @version 2015-09-10
 */
@Controller
@RequestMapping(value = "${adminPath}/task/examineTask")
public class ExamineTaskController extends BaseController {

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
	 * 进入审批页面，默认显示当前用户可以审批的任务信息
	 * @param taskPlan
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"list", ""})
	public String list(TaskPlan taskPlan, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TaskPlan> page = taskPlanService.findByUserCanDo(new Page<TaskPlan>(request, response), taskPlan);
		model.addAttribute("page", page);
		return "modules/task/examineTask";
	}
	
	/**
	 * 分类型操作审批计划
	 * @param taskQuotaPlan	指标型计划
	 * @param taskPlan		任务型
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value="findByType")
	public String findByType(TaskQuotaPlan taskQuotaPlan,TaskPlan taskPlan, HttpServletRequest request, HttpServletResponse response, Model model){
		String taskType = request.getParameter("taskType");
		if("2".equals(taskType)){
			Page<TaskQuotaPlan> page = taskQuotaPlanService.findByStatus(new Page<TaskQuotaPlan>(request, response), taskQuotaPlan);
			model.addAttribute("page", page);
			model.addAttribute("searchKey", taskQuotaPlan.getQuotaDesc());
		}else{
			Page<TaskPlan> page = taskPlanService.findByUserCanDo(new Page<TaskPlan>(request, response), taskPlan);
			model.addAttribute("page", page);
			model.addAttribute("searchKey", taskPlan.getTaskDesc());
		}
		model.addAttribute("flag","view");
		model.addAttribute("taskType", taskType);
		if("2".equals(taskType)){
			return "modules/task/examineTaskQuotaInfo";
		}else{
			return "modules/task/examineTask";
		}
	}
	
	/**
	 * 批准任务型
	 * @param taskPlan
	 * @param request
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "setTaskPlanOK")
	public String setTaskPlanOK(TaskPlan taskPlan,HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes){
				String ids = request.getParameter("ids");
				List<TaskPlan> list = taskPlan.getTaskList();
				if(null !=list){
					for(TaskPlan t:list){
						if(ids.contains(t.getId())){
							
							TaskPlan tp = taskPlanService.get(t.getId());
							tp.setIsNewRecord(false);
							//如果是复评申请的通过后变为已完成
							if(CommonStatus.TASK_WAIT_THREE.equals(tp.getStatus())){
								tp.setStatus(CommonStatus.TASK_END);
							}else{
								tp.setStatus(CommonStatus.TASK_DOING);
							}
							
							if(StringUtils.isNotEmpty(t.getActualFinishTime())){tp.setActualFinishTime(t.getActualFinishTime());}
							if(StringUtils.isNotEmpty(t.getFinishReview())){tp.setFinishReview(t.getFinishReview());}
							if(StringUtils.isNotEmpty(t.getSummaryRemarks())){tp.setSummaryRemarks(t.getSummaryRemarks());}
							taskPlanService.save(tp);
						}
					}
				}
					addMessage(redirectAttributes, "申请已批准！");
		return "redirect:"+Global.getAdminPath()+"/task/examineTask/findByType?taskType=1";
	}
	
	
	/**
	 * 驳回任务型
	 * @param taskPlan
	 * @param request
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value="setTaskPlanNo")
	public String setTaskPlanNo(TaskPlan taskPlan,HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes){
		String[] ids = taskPlan.getId().split(",");
		for(int i=0;i<ids.length;i++){
			TaskPlan t = taskPlanService.get(ids[i]);
			t.setIsNewRecord(false);
			if(CommonStatus.TASK_WAIT_TWO.equals(t.getStatus())){
				if(StringUtils.isNotEmpty(t.getFinishTimeAdjust2())){
					t.setFinishTimeAdjust2(null);
					t.setStatus(CommonStatus.TASK_DOING);
				}else{
					if(StringUtils.isNotEmpty(t.getFinishTimeAdjust1())){
						t.setFinishTimeAdjust1(null);
						t.setStatus(CommonStatus.TASK_DOING);
					}
				}
			}else if(CommonStatus.TEAK_WAIT_ONE.equals(t.getStatus())){
				t.setStatus("0");
			}else if(CommonStatus.TASK_WAIT_THREE.equals(t.getStatus())){
				t.setActualFinishTime(null);
				t.setSummaryRemarks(null);
				t.setFinishReview(null);
				t.setStatus(CommonStatus.TASK_DOING);
			}
			taskPlanService.save(t);
		}
		addMessage(redirectAttributes, "计划已驳回！");
		return "redirect:"+Global.getAdminPath()+"/task/examineTask/findByType?taskType=1";
	}
	
	//===========================================================================================================================
	
	/**
	 * 批准指标型	
	 * @param taskPlan
	 * @param request
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value="setTaskQuotaPlanOk")
	public String setTaskQuotaPlanOk(TaskQuotaPlan taskQuotaPlan,HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes){
		String ids = request.getParameter("ids");
		List<TaskQuotaPlan> list = taskQuotaPlan.getTaskQuotaPlanList();
		if(null !=list){
			for(TaskQuotaPlan t:list){
				if(ids.contains(t.getId())){
					TaskQuotaPlan tp = taskQuotaPlanService.get(t.getId());
					tp.setIsNewRecord(false);
					//如果是草稿批准则变成执行中的计划
					if(CommonStatus.TEAK_WAIT_ONE.equals(tp.getStatus())){
						tp.setStatus(CommonStatus.TASK_DOING);
					}else if(CommonStatus.TASK_WAIT_THREE.equals(tp.getStatus())){
						tp.setStatus(CommonStatus.TASK_END);
					}
					if(StringUtils.isNotEmpty(t.getActualFinishQuantity())){tp.setActualFinishQuantity(t.getActualFinishQuantity());}
					if(StringUtils.isNotEmpty(t.getGoal())){tp.setGoal(t.getGoal());}
					if(StringUtils.isNotEmpty(t.getSummaryRemarks())){tp.setSummaryRemarks(t.getSummaryRemarks());}
					
					taskQuotaPlanService.save(tp);
				}
			}
		}
		addMessage(redirectAttributes, "计划已批准！");
		return "redirect:"+Global.getAdminPath()+"/task/examineTask/findByType?taskType=2";
	}
	
	
	/**
	 * 驳回指标型	(如果总裁办不通过草稿则直接驳回到草稿状态，如果草稿通过的其他申请，驳回就变回执行中的计划)
	 * @param taskPlan
	 * @param request
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value="setTaskQuotaPlanNo")
	public String setTaskQuotaPlanNo(TaskQuotaPlan taskQuotaPlan,HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes){
		String[] ids = taskQuotaPlan.getId().split(",");
		for(int i=0;i<ids.length;i++){
			TaskQuotaPlan t = taskQuotaPlanService.get(ids[i]);
			t.setIsNewRecord(false);
			if(CommonStatus.TEAK_WAIT_ONE.equals(t.getStatus())){
				t.setStatus("0");
			}else if(CommonStatus.TASK_WAIT_THREE.equals(t.getStatus())){
				if(StringUtils.isNotEmpty(t.getActualFinishQuantity())){
					t.setActualFinishQuantity(null);
					t.setSummaryRemarks(null);
					t.setGoal(null);
					t.setStatus(CommonStatus.TASK_DOING);
				}
			}
			taskQuotaPlanService.save(t);
		}
		addMessage(redirectAttributes, "计划已驳回！");
		return "redirect:"+Global.getAdminPath()+"/task/examineTask/findByType?taskType=2";
	}
	
	
}