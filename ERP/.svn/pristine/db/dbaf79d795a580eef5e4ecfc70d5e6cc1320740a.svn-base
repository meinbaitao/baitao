/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.task.web;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bt.modules.task.entity.TaskPlan;
import com.bt.modules.task.entity.TaskQuotaPlan;
import com.bt.modules.task.service.TaskPlanService;
import com.bt.modules.task.service.TaskQuotaPlanService;
import com.bt.modules.utils.CommonStatus;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 任务型计划信息表Controller
 * @author yzh
 * @version 2015-09-02
 */
@Controller
@RequestMapping(value = "${adminPath}/task/adminPlan")
public class AdminPlanController extends BaseController {

	@Autowired
	private TaskPlanService taskPlanService;
	@Autowired
	private OfficeService officeService;
	@Autowired
	private TaskQuotaPlanService taskQuotaPlanService;
	
	
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
	
	@RequestMapping(value = {"list", ""})
	public String list(TaskPlan taskPlan, HttpServletRequest request, HttpServletResponse response, Model model) {
		return "modules/task/adminPlanList";
	}
	
	/**
	 * 根据当前用户默认显示当前任务的部门相关的任务型计划信息
	 * @param taskPlan
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"main", ""})
	public String main(TaskPlan taskPlan, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TaskPlan> page = taskPlanService.adminFindPage(new Page<TaskPlan>(request, response), taskPlan); 
		model.addAttribute("page", page);
		model.addAttribute("flag","view");
		User user = UserUtils.getUser();
		model.addAttribute("taskType",CommonStatus.TASK_STATUS);
		model.addAttribute("officeId", user.getOffice().getId());
		return "modules/task/adminTaskInfo";
	}
	
	/**
	 * 获取部门树（附加计划类型选择）
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "tree")
	public String tree(Model model) {
		List<Office> list = officeService.adminFindAllOffice();
		model.addAttribute("categoryList", list);
		return "modules/task/adminOfficeTree";
	}
	
	
	@RequestMapping(value = "findReviewOffice")
	@ResponseBody
	public List<Office> findReviewOffice(){
		List<Office> list = officeService.findAll();
		return list;
	}
	
	@RequestMapping(value = "findResponsiblePerson")
	@ResponseBody
	public List<User> findResponsiblePerson(User user,HttpServletRequest request){
		String deptId = request.getParameter("deptId");
		List<User> list = UserUtils.findUserByOfficeId(deptId);
		return list;
	}
	
	/**
	 * 根据部门ID和计划类型查询
	 * @param id
	 * @param grade
	 * @param taskQuotaPlan
	 * @param taskPlan
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value ="findByOffice/{id}/{grade}")
	public String findByOfficeType(@PathVariable String id,@PathVariable String grade,TaskQuotaPlan taskQuotaPlan,TaskPlan taskPlan, HttpServletRequest request, HttpServletResponse response, Model model) {
		if(CommonStatus.TASK_STATUS.equals(grade)){
			Page<TaskPlan> page = taskPlanService.adminFindPageByOfficeType(new Page<TaskPlan>(request, response), taskPlan,id);
			model.addAttribute("searchKey", taskPlan.getTaskDesc());
			model.addAttribute("page", page);
		}else if(CommonStatus.QUOTA_STATUS.equals(grade)){
			String thisMonth = "";
			if(StringUtils.isBlank(taskQuotaPlan.getTaskMonth())){
				Date today = new Date();
				String year = today.toLocaleString().substring(0, 4);
				String month = today.toLocaleString().substring(5,7);
				thisMonth = year+"-"+month;
			}else{
				thisMonth = taskQuotaPlan.getTaskMonth();
			}
			Page<TaskQuotaPlan> page = taskQuotaPlanService.adminFindByOfficeType(new Page<TaskQuotaPlan>(request, response), taskQuotaPlan, id,thisMonth);
			String weightCount = taskPlanService.getWeightCount(page.getList());
			String scoreCount = taskPlanService.getScoreCount(page.getList());
			model.addAttribute("page", page);
			model.addAttribute("weightCount", weightCount);
			model.addAttribute("scoreCount", scoreCount);
			model.addAttribute("thisMonth", thisMonth);
			model.addAttribute("searchKey", taskQuotaPlan.getQuotaDesc());
		}else{
			Page<TaskPlan> page = taskPlanService.adminFindPage(new Page<TaskPlan>(request, response), taskPlan); 
			model.addAttribute("page", page);
			model.addAttribute("searchKey", taskPlan.getTaskDesc());
		}
		model.addAttribute("officeId", id);
		model.addAttribute("taskType", grade);
		model.addAttribute("flag","view");
		if(CommonStatus.QUOTA_STATUS.equals(grade)){
			return "modules/task/adminTaskQuotaInfo";
		}else{
			return "modules/task/adminTaskInfo";
		}
		
	}


	/**
	 * 添加任务型计划信息
	 * @param taskPlan
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@Transactional(readOnly = false)
	@RequestMapping(value = "saveTaskPlan")
	public String saveTaskPlan(TaskPlan taskPlan, Model model, RedirectAttributes redirectAttributes) {
		List<TaskPlan> list = taskPlan.getTaskList();
		if(null !=list){
			for(TaskPlan t:list){
				if(StringUtils.isBlank(t.getId()) && StringUtils.isNotBlank(t.getTaskDesc()) && StringUtils.isNotBlank(t.getResponsiblePerson()) && StringUtils.isNotBlank(t.getReviewDeptId())){
					t.setIsNewRecord(true);
					t.setId(IdGen.uuid());
					t.setDeptId(taskPlan.getDeptId());
					taskPlanService.save(t);
				}
			}
		}
		addMessage(redirectAttributes, "保存计划信息成功");
		return "redirect:"+Global.getAdminPath()+"/task/adminPlan/findByOffice/"+taskPlan.getDeptId()+"/1";
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
		if(null !=list){
			for(TaskPlan t:list){
				if(StringUtils.isNotBlank(t.getId()) && StringUtils.isNotBlank(t.getTaskDesc()) && StringUtils.isNotBlank(t.getResponsiblePerson()) && StringUtils.isNotBlank(t.getReviewDeptId())){
					t.setIsNewRecord(false);
					t.setDelFlag(TaskPlan.DEL_FLAG_NORMAL);
					taskPlanService.saveTaskPlan(t);
				}
			}
		}
		addMessage(redirectAttributes, "保存计划信息成功");
		return "redirect:"+Global.getAdminPath()+"/task/adminPlan/findByOffice/"+taskPlan.getDeptId()+"/1";
	}
	
	
	
	/**
	 * 添加指标型计划信息
	 * @param taskQuotaPlan
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@Transactional(readOnly = false)
	@RequestMapping(value = "saveTaskQuotaPlan")
	public String saveTaskQuotaPlan(TaskQuotaPlan taskQuotaPlan,HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		List<TaskQuotaPlan> list = taskQuotaPlan.getTaskQuotaPlanList();
		String taskMonth = request.getParameter("monthToday");
		if(null !=list){
			for(TaskQuotaPlan t:list){
				if(StringUtils.isBlank(t.getId()) && StringUtils.isNotBlank(t.getQuotaDesc()) && StringUtils.isNotBlank(t.getResponsiblePerson()) && StringUtils.isNotBlank(t.getReviewDeptId())){
					t.setIsNewRecord(true);
					t.setDeptId(taskQuotaPlan.getDeptId());
					t.setId(IdGen.uuid());
					taskQuotaPlanService.save(t);
				}
			}
		}
		addMessage(redirectAttributes, "保存计划信息成功");
		return "redirect:"+Global.getAdminPath()+"/task/adminPlan/findByOffice/"+taskQuotaPlan.getDeptId()+"/2?taskMonth="+taskMonth;
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
	public String updateTaskQuotaPlan(TaskQuotaPlan taskQuotaPlan,HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		List<TaskQuotaPlan> list = taskQuotaPlan.getTaskQuotaPlanList();
		String taskMonth = request.getParameter("monthToday");
		if(null !=list){
			for(TaskQuotaPlan t:list){
				if(StringUtils.isNotBlank(t.getId()) && StringUtils.isNotBlank(t.getQuotaDesc()) && StringUtils.isNotBlank(t.getResponsiblePerson()) && StringUtils.isNotBlank(t.getReviewDeptId())){
					t.setIsNewRecord(false);
					t.setDeptId(taskQuotaPlan.getDeptId());
					t.setDelFlag(TaskPlan.DEL_FLAG_NORMAL);
					taskQuotaPlanService.save(t);
				}
			}
		}
		addMessage(redirectAttributes, "保存计划信息成功");
		return "redirect:"+Global.getAdminPath()+"/task/adminPlan/findByOffice/"+taskQuotaPlan.getDeptId()+"/2?taskMonth="+taskMonth;
	}
	
	
	/**
	 * 删除任务型信息
	 * @param taskPlan
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "deletetaskPlan")
	public String delete(TaskPlan taskPlan,HttpServletRequest request, RedirectAttributes redirectAttributes) {
		String deptId = request.getParameter("deptId");
		taskPlanService.delFlag(taskPlan.getId());
		addMessage(redirectAttributes, "删除计划信息成功");
		return "redirect:"+Global.getAdminPath()+"/task/adminPlan/findByOffice/"+deptId+"/1";
	}
	
	/**
	 * 删除指标型信息
	 * @param taskQuotaPlan
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "deletetaskQuotaPlan")
	public String delete(TaskQuotaPlan taskQuotaPlan,HttpServletRequest request, RedirectAttributes redirectAttributes) {
		String deptId = request.getParameter("deptId");
		taskQuotaPlanService.delFlag(taskQuotaPlan.getId());
		addMessage(redirectAttributes, "删除指标型计划成功");
		return "redirect:"+Global.getAdminPath()+"/task/adminPlan/findByOffice/"+deptId+"/2";
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
		TaskPlan t = taskPlanService.get(infoId);
		if("1".equals(value)){
			t.setDiscussionSuggestion("0");
		}else{
			t.setDiscussionSuggestion("1");
		}
		t.setIsNewRecord(false);
		t.setDelFlag("0");
		try{
			taskPlanService.save(t);
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
		TaskPlan t = taskPlanService.get(infoId);
		if("1".equals(value)){
			t.setLongTermTask("0");
		}else{
			t.setLongTermTask("1");
		}
		t.setIsNewRecord(false);
		t.setDelFlag("0");
		try{
			taskPlanService.save(t);
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
		TaskPlan t = taskPlanService.get(infoId);
			if("1".equals(value)){
				t.setGroupConcern("0");
			}else{
				t.setGroupConcern("1");
			}
			t.setIsNewRecord(false);
			t.setDelFlag("0");
			try{
				taskPlanService.save(t);
			}catch(Exception e){
				return "0";
			}
		
		return "1";
	}
	
	
	/**
	 * 修改预警
	 * @param infoId
	 * @param value
	 * @param deptId
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "setWarm/{infoId}/{value}")
	@ResponseBody
	public String setWarm(@PathVariable String infoId,@PathVariable String value,RedirectAttributes redirectAttributes){
		TaskPlan t = taskPlanService.get(infoId);
		t.setEarlyWarning("1");
		t.setIsNewRecord(false);
		t.setDelFlag("0");
		try{
			taskPlanService.save(t);
		}catch(Exception e){
			return "0";
		}
		return "1";
	}
	
	/**
	 * 修改预警
	 * @param infoId
	 * @param value
	 * @param deptId
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "updateSubTask")
	@ResponseBody
	public String updateSubTask(HttpServletRequest request, HttpServletResponse response,RedirectAttributes redirectAttributes){
		String taskId = request.getParameter("taskId");
		String taskStatus = request.getParameter("taskStatus");
		TaskPlan t = taskPlanService.get(taskId);
		if("1".equals(taskStatus)){
			return "1";
		}else{
			t.setSubTask("1");
			t.setIsNewRecord(false);
			t.setDelFlag("0");
			try{
				taskPlanService.updateSubTask(t);
			}catch(Exception e){
				return "0";
			}
			return "1";
		}
	}
	
	
	
	/**
	 * 提交任务型计划信息
	 * @param taskPlan
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@Transactional(readOnly = false)
	@RequestMapping(value = "setTaskStatus")
	public String setTaskStatus(TaskPlan taskPlan,HttpServletRequest request, RedirectAttributes redirectAttributes) {
		String deptId = request.getParameter("deptId");
		String[] ids = taskPlan.getId().split(",");
		for(int i=0;i<ids.length;i++){
			TaskPlan t = taskPlanService.get(ids[i]);
			t.setIsNewRecord(false);
			t.setStatus("1");
			taskPlanService.save(t);
		}
		addMessage(redirectAttributes, "提交计划信息成功");
		return "redirect:"+Global.getAdminPath()+"/task/adminPlan/findByOffice/"+deptId+"/1";
	}
	
	
	/**
	 * 提交指标型计划信息
	 * @param taskPlan
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@Transactional(readOnly = false)
	@RequestMapping(value = "setTaskQuotaStatus")
	public String setTaskQuotaStatus(TaskQuotaPlan taskQuotaPlan,HttpServletRequest request, RedirectAttributes redirectAttributes) {
		String deptId = request.getParameter("deptId");
		String[] ids = taskQuotaPlan.getId().split(",");
		for(int i=0;i<ids.length;i++){
			TaskQuotaPlan t = taskQuotaPlanService.get(ids[i]);
			t.setIsNewRecord(false);
			t.setStatus("1");
			taskQuotaPlanService.save(t);
		}
		addMessage(redirectAttributes, "提交计划信息成功");
		return "redirect:"+Global.getAdminPath()+"/task/adminPlan/findByOffice/"+deptId+"/2";
	}
	

}