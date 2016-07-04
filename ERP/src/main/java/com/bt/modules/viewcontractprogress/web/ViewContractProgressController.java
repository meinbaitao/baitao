/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.viewcontractprogress.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.bt.common.exceptions.BusinessException;
import com.bt.modules.project.entity.Project;
import com.bt.modules.project.service.ProjectService;
import com.bt.modules.viewcontractprogress.entity.ViewContractProgress;
import com.bt.modules.viewcontractprogress.entity.ViewSubprojectProgress;
import com.bt.modules.viewcontractprogress.service.ViewContractProgressService;
import com.bt.modules.viewcontractprogress.service.ViewSubprojectProgressService;

/**
 * 报表Controller
 * @author lky
 * @version 2015-11-30
 */
@Controller
@RequestMapping(value = "${adminPath}/viewcontractprogress/viewContractProgress")
public class ViewContractProgressController extends BaseController {

	@Autowired
	private ViewContractProgressService viewContractProgressService;
	@Autowired
	public ProjectService  projectService;
	@Autowired
	public ViewSubprojectProgressService  viewSubprojectProgressService;
	@ModelAttribute
	public ViewContractProgress get(@RequestParam(required=false) String id) throws Exception {
		ViewContractProgress entity = null;
		if (StringUtils.isNotBlank(id)){
			Project project = projectService.get(id);
			
			projectService.checkProject(project, "projectManagerBid", "","report.weekly.001");
			entity = viewContractProgressService.get(id);
//			if(StringUtils.isBlank(project.getProjectManagerBid())||"NULL".equals(project.getProjectManagerBid())){
//				throw new BusinessException("report.weekly.001");
//			}else {
//				entity = viewContractProgressService.get(id);
//			}	
		}
		if (entity == null){
			entity = new ViewContractProgress();
		}
		return entity;
	}
	
	
	/**
	 * 跳转查看、修改页面
	 * @param project
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "view")
	public String view(ViewContractProgress viewContractProgress, HttpServletRequest request,Model model){
		if(StringUtils.isEmpty(viewContractProgress.getId())){
			viewContractProgress.setId(request.getParameter("id"));
		}
		ViewContractProgress viewContractProgresss = viewContractProgressService.get(viewContractProgress);
		viewContractProgresss.setSubList(viewSubprojectProgressService.findByProjectIdList(viewContractProgress.getId()));
		 String Flag="0";
		 User user= UserUtils.getUser();
		 Office office=user.getOffice();
		 //财务
		 if(office.getName().contains("财务中心"))
		 {
			 Flag="1"; 
		 }
		 //运营
		 else if(office.getName().contains("运营中心"))
		 {
			 Flag="2"; 			 
		 }
		 //
		 else if(office.getName().contains("总裁办")|| office.getName().contains("万方集团"))
		 {
			 Flag="3"; 			 
		 }
		 else if(office.getName().contains("区域"))
		 {
			 Flag="4"; 		
		 }
		 
		 else
		 {		 
			 Flag="0";			 
		 }
			 

		//查询一级项目信息
		model.addAttribute("viewContractProgress",viewContractProgresss);
		model.addAttribute("Flag",Flag);
		//查询二级项目信息
		return "modules/viewcontractprogress/viewContractProgressForm";
	}

	
	
//	@RequiresPermissions("modules:viewContractProgress:view")
	@RequestMapping(value = {"list", ""})
	public String list(ViewContractProgress viewContractProgress, HttpServletRequest request, HttpServletResponse response, Model model) {
		
		//查询主项列表，如果有名称参数则带入名称参数查询列表
		Page<Project> page = projectService.findPage(new Page<Project>(request, response), new Project()); 
		model.addAttribute("page", page);
		return "modules/viewcontractprogress/viewprojectList";
	}

//	@RequiresPermissions("modules:viewContractProgress:view")
	@RequestMapping(value = "form")
	public String form(ViewContractProgress viewContractProgress, Model model) {
		
		model.addAttribute("viewContractProgress", viewContractProgress);
		return "modules/viewcontractprogress/viewContractProgressForm";
	}

//	@RequiresPermissions("modules:viewContractProgress:edit")
//	@RequestMapping(value = "save")
//	public String save(ViewContractProgress viewContractProgress, Model model, RedirectAttributes redirectAttributes) {
//		if (!beanValidator(model, viewContractProgress)){
//			return form(viewContractProgress, model);
//		}
//		viewContractProgressService.save(viewContractProgress);
//		addMessage(redirectAttributes, "保存显示总控报表成功");
//		return "redirect:"+Global.getAdminPath()+"/viewcontractprogress/viewContractProgress/?repage";
//	}
	
//	@RequiresPermissions("viewcontractprogress:viewContractProgress:edit")
//	@RequestMapping(value = "delete")
//	public String delete(ViewContractProgress viewContractProgress, RedirectAttributes redirectAttributes) {
//		viewContractProgressService.delete(viewContractProgress);
//		addMessage(redirectAttributes, "删除显示总控报表成功");
//		return "redirect:"+Global.getAdminPath()+"/viewcontractprogress/viewContractProgress/?repage";
//	}

}