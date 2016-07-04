/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.task.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bt.modules.task.entity.TaskPlan;
import com.bt.modules.task.entity.TaskQuotaPlan;
import com.bt.modules.task.service.TaskPlanService;
import com.bt.modules.task.service.TaskQuotaPlanService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 指标型总控计划Controller
 * @author yzh
 * @version 2015-09-10
 */
@Controller
@RequestMapping(value = "${adminPath}/task/taskQuotaPlan")
public class TaskQuotaPlanController extends BaseController {

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
	
	@RequestMapping(value = {"list", ""})
	public String list(TaskPlan taskPlan, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TaskPlan> page = taskPlanService.findPageByUser(new Page<TaskPlan>(request, response), taskPlan);
		model.addAttribute("page", page);
		model.addAttribute("flag","view");
		model.addAttribute("taskType", "1");
		return "modules/task/personalTaskInfo";
	}

	@RequestMapping(value="findByType")
	public String findByType(TaskQuotaPlan taskQuotaPlan,TaskPlan taskPlan, HttpServletRequest request, HttpServletResponse response, Model model){
		String taskType = request.getParameter("taskType");
		User user = UserUtils.getUser();
		if("2".equals(taskType)){
			String thisMonth = "";
			if(StringUtils.isBlank(taskQuotaPlan.getTaskMonth())){
				Date today = new Date();
				int year = today.getYear();
				int month = today.getMonth();
				thisMonth = year+"-"+month;
			}else{
				thisMonth = taskQuotaPlan.getTaskMonth();
			}
			Page<TaskQuotaPlan> page = taskQuotaPlanService.findByOfficeType(new Page<TaskQuotaPlan>(request, response), taskQuotaPlan, user.getOffice().getId(),thisMonth);
			/*String weightCount = taskPlanService.getWeightCount(page.getList());
			String scoreCount = taskPlanService.getScoreCount(page.getList());
			model.addAttribute("weightCount", weightCount);
			model.addAttribute("scoreCount", scoreCount);*/
			model.addAttribute("page", page);
			model.addAttribute("searchKey", taskQuotaPlan.getQuotaDesc());
		}else{
			Page<TaskPlan> page = taskPlanService.findPageByUser(new Page<TaskPlan>(request, response), taskPlan);
			model.addAttribute("page", page);
			model.addAttribute("searchKey", taskPlan.getTaskDesc());
		}
		model.addAttribute("flag","view");
		model.addAttribute("taskType", taskType);
		if("2".equals(taskType)){
			return "modules/task/personalTaskQuotaInfo";
		}else{
			return "modules/task/personalTaskInfo";
		}
		
	}
	
	@RequestMapping(value = "form")
	public String form(TaskQuotaPlan taskQuotaPlan, Model model) {
		model.addAttribute("taskQuotaPlan", taskQuotaPlan);
		return "modules/task/taskQuotaPlanForm";
	}
	
	/**
	 * 添加任务型计划信息
	 * @param taskPlan
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@Transactional(readOnly = false)
	@RequestMapping(value = "saveTaskPlan",method=RequestMethod.POST)
	public String saveTaskPlan(TaskPlan taskPlan, Model model, RedirectAttributes redirectAttributes) {
		List<TaskPlan> list = taskPlan.getTaskList();
		User user = UserUtils.getUser();
		if(null !=list){
			for(TaskPlan t:list){
				if(StringUtils.isEmpty(t.getId()) && StringUtils.isNotEmpty(t.getTaskDesc()))
				t.setIsNewRecord(true);
				t.setId(IdGen.uuid());
				t.setDeptId(user.getOffice().getId());
				taskPlanService.save(t);
			}
		}
		addMessage(redirectAttributes, "保存计划信息成功");
		return "redirect:"+Global.getAdminPath()+"/task/taskQuotaPlan/findByType?taskType=1";
	}
	
	
	/**
	 * 修改任务型计划信息
	 * @param taskPlan
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@Transactional(readOnly = false)
	@RequestMapping(value = "updateTaskPlan")
	public String updateTaskPlan(TaskPlan taskPlan, Model model, RedirectAttributes redirectAttributes) {
		List<TaskPlan> list = taskPlan.getTaskList();
		User user = UserUtils.getUser();
		if(null !=list){
			for(TaskPlan t:list){
				if(StringUtils.isNotEmpty(t.getId())){
					t.setIsNewRecord(false);
					t.setDeptId(user.getOffice().getId());
					t.setDelFlag("0");
					taskPlanService.saveTaskPlan(t);
				}
			}
		}
		addMessage(redirectAttributes, "保存计划信息成功");
		return "redirect:"+Global.getAdminPath()+"/task/taskQuotaPlan/findByType?taskType=1";
	}
	
	/**
	 * 添加指标型计划信息
	 * @param taskQuotaPlan
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@Transactional(readOnly = false)
	@RequestMapping(value = "saveTaskQuotaPlan",method=RequestMethod.POST)
	public String saveTaskQuotaPlan(TaskQuotaPlan taskQuotaPlan, Model model, RedirectAttributes redirectAttributes) {
		List<TaskQuotaPlan> list = taskQuotaPlan.getTaskQuotaPlanList();
		User user = UserUtils.getUser();
		if(null !=list){
			for(TaskQuotaPlan t:list){
				if(StringUtils.isEmpty(t.getId()) && StringUtils.isNoneEmpty(t.getQuotaDesc())){
					t.setIsNewRecord(true);
					t.setDeptId(taskQuotaPlan.getDeptId());
					t.setId(IdGen.uuid());
					t.setDeptId(user.getOffice().getId());
					taskQuotaPlanService.save(t);
				}
			}
		}
		addMessage(redirectAttributes, "保存计划信息成功");
		return "redirect:"+Global.getAdminPath()+"/task/taskQuotaPlan/findByType?taskType=2";
	}
	
	
	/**
	 * 修改指标型计划信息
	 * @param taskQuotaPlan
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@Transactional(readOnly = false)
	@RequestMapping(value = "updateTaskQuotaPlan")
	public String updateTaskQuotaPlan(TaskQuotaPlan taskQuotaPlan, Model model, RedirectAttributes redirectAttributes) {
		List<TaskQuotaPlan> list = taskQuotaPlan.getTaskQuotaPlanList();
		User user = UserUtils.getUser();
		if(null !=list){
			for(TaskQuotaPlan t:list){
				if(StringUtils.isNotEmpty(t.getId())){
					t.setIsNewRecord(false);
					t.setDeptId(user.getOffice().getId());
					t.setDelFlag("0");
					taskQuotaPlanService.save(t);
				}
			}
		}
		addMessage(redirectAttributes, "保存计划信息成功");
		return "redirect:"+Global.getAdminPath()+"/task/taskQuotaPlan/findByType?taskType=2";
	}
	
	
	/**
	 * 删除任务型信息
	 * @param taskPlan
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "deletetaskPlan")
	public String delete(TaskPlan taskPlan,RedirectAttributes redirectAttributes,Model model) {
		taskPlanService.delFlag(taskPlan.getId());
		model.addAttribute("taskType", "1");
		addMessage(redirectAttributes, "删除计划信息成功");
		return "redirect:"+Global.getAdminPath()+"/task/taskQuotaPlan/findByType?taskType=1";
	}
	
	/**
	 * 删除指标型信息
	 * @param taskQuotaPlan
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "deletetaskQuotaPlan")
	public String delete(TaskQuotaPlan taskQuotaPlan,RedirectAttributes redirectAttributes,Model model) {
		taskQuotaPlanService.delFlag(taskQuotaPlan.getId());
		model.addAttribute("taskType", "2");
		addMessage(redirectAttributes, "删除指标型计划成功");
		return "redirect:"+Global.getAdminPath()+"/task/taskQuotaPlan/findByType?taskType=2";
	}
	
	/**
	 * 修改讨论建议
	 * @param infoId
	 * @param value
	 * @param deptId
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "updateDiscussionSuggestion/{infoId}/{value}/{deptId}")
	@ResponseBody
	public String updateDiscussionSuggestion(@PathVariable String infoId,@PathVariable String value,@PathVariable String deptId, RedirectAttributes redirectAttributes){
		TaskQuotaPlan t = taskQuotaPlanService.get(infoId);
		if("1".equals(value)){
			t.setDiscussionSuggestion("0");
		}else{
			t.setDiscussionSuggestion("1");
		}
		t.setIsNewRecord(false);
		t.setDelFlag("0");
		try{
			taskQuotaPlanService.save(t);
		}catch(Exception e){
			return "0";
		}
		return "1";
		
	}
	
	/**
	 * 修改长期任务
	 * @param infoId
	 * @param value
	 * @param deptId
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "updateLongTermTask/{infoId}/{value}/{deptId}")
	@ResponseBody
	public String updateLongTermTask(@PathVariable String infoId,@PathVariable String value,@PathVariable String deptId,  RedirectAttributes redirectAttributes){
		TaskQuotaPlan t = taskQuotaPlanService.get(infoId);
		if("1".equals(value)){
			t.setLongTermTask("0");
		}else{
			t.setLongTermTask("1");
		}
		t.setIsNewRecord(false);
		t.setDelFlag("0");
		try{
			taskQuotaPlanService.save(t);
		}catch(Exception e){
			return "0";
		}
		return "1";
	}
	
	/**
	 * 修改集团关注
	 * @param infoId
	 * @param value
	 * @param deptId
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "updateGroupConcern/{infoId}/{value}/{deptId}")
	@ResponseBody
	public String updateGroupConcern(@PathVariable String infoId,@PathVariable String value,@PathVariable String deptId, RedirectAttributes redirectAttributes){
		TaskQuotaPlan t = taskQuotaPlanService.get(infoId);
		if("1".equals(value)){
			t.setGroupConcern("0");
		}else{
			t.setGroupConcern("1");
		}
		t.setIsNewRecord(false);
		t.setDelFlag("0");
		try{
			taskQuotaPlanService.save(t);
		}catch(Exception e){
			return "0";
		}
		return "1";
	}
	
	
	@RequestMapping(value = "save")
	public String save(TaskQuotaPlan taskQuotaPlan, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, taskQuotaPlan)){
			return form(taskQuotaPlan, model);
		}
		taskQuotaPlanService.save(taskQuotaPlan);
		addMessage(redirectAttributes, "保存指标型计划成功");
		return "redirect:"+Global.getAdminPath()+"/task/taskQuotaPlan/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(TaskQuotaPlan taskQuotaPlan, RedirectAttributes redirectAttributes) {
		taskQuotaPlanService.delFlag(taskQuotaPlan.getId());
		addMessage(redirectAttributes, "删除指标型计划成功");
		return "redirect:"+Global.getAdminPath()+"/task/taskQuotaPlan/?repage";
	}
	
	@RequestMapping(value = {"assign"})
	public String assign(TaskQuotaPlan taskQuotaPlan,HttpServletRequest request,HttpServletResponse response,Model model) {
		//获取界面传过来的用户ID
		//获取界面传过来的指派采购数据(拆分组合生成实体)
		User user = UserUtils.getUser();		
		String ids = request.getParameter("assignIDs");
		String idsresponsiblePerson = request.getParameter("responsiblePerson");
		String[] idArr = ids.split(",");
		List<TaskQuotaPlan> listPD=new ArrayList<TaskQuotaPlan>();
		for(String id:idArr){
			TaskQuotaPlan pd = new TaskQuotaPlan();
			pd.setId(id);
			pd.setUpdateBy(user);
			pd.setUpdateDate(new Date());
			pd.setResponsiblePerson(idsresponsiblePerson);
			/*pd.setStatus("2");*/
			listPD.add(pd);
		}
		//数据处理完成 指派数据
		taskQuotaPlanService.batchUpdate(listPD);
		//返回剩余的相应条件的 待指派 列表数据
		return "redirect:"+Global.getAdminPath()+"/task/taskQuotaPlanList";
	}

}