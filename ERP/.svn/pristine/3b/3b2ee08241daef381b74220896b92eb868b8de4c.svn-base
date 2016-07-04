/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.viewcontractprogress.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.bt.modules.viewcontractprogress.entity.ViewSubprojectProgress;
import com.bt.modules.viewcontractprogress.service.ViewSubprojectProgressService;

/**
 * 二级项目信息Controller
 * @author lky
 * @version 2015-11-30
 */
@Controller
@RequestMapping(value = "${adminPath}/viewsubprojectprogress/viewSubprojectProgress")
public class ViewSubprojectProgressController extends BaseController {

	@Autowired
	private ViewSubprojectProgressService viewSubprojectProgressService;
	
	@ModelAttribute
	public ViewSubprojectProgress get(@RequestParam(required=false) String id) {
		ViewSubprojectProgress entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = viewSubprojectProgressService.get(id);
		}
		if (entity == null){
			entity = new ViewSubprojectProgress();
		}
		return entity;
	}
	
	@RequiresPermissions("viewsubprojectprogress:viewSubprojectProgress:view")
	@RequestMapping(value = {"list", ""})
	public String list(ViewSubprojectProgress viewSubprojectProgress, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ViewSubprojectProgress> page = viewSubprojectProgressService.findPage(new Page<ViewSubprojectProgress>(request, response), viewSubprojectProgress); 
		model.addAttribute("page", page);
		return "viewsubprojectprogress/viewsubprojectprogress/viewSubprojectProgressList";
	}

	@RequiresPermissions("viewsubprojectprogress:viewSubprojectProgress:view")
	@RequestMapping(value = "form")
	public String form(ViewSubprojectProgress viewSubprojectProgress, Model model) {
		model.addAttribute("viewSubprojectProgress", viewSubprojectProgress);
		return "viewsubprojectprogress/viewsubprojectprogress/viewSubprojectProgressForm";
	}

	@RequiresPermissions("viewsubprojectprogress:viewSubprojectProgress:edit")
	@RequestMapping(value = "save")
	public String save(ViewSubprojectProgress viewSubprojectProgress, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, viewSubprojectProgress)){
			return form(viewSubprojectProgress, model);
		}
		viewSubprojectProgressService.save(viewSubprojectProgress);
		addMessage(redirectAttributes, "保存显示二级项目报表成功");
		return "redirect:"+Global.getAdminPath()+"/viewsubprojectprogress/viewSubprojectProgress/?repage";
	}
	
	@RequiresPermissions("viewsubprojectprogress:viewSubprojectProgress:edit")
	@RequestMapping(value = "delete")
	public String delete(ViewSubprojectProgress viewSubprojectProgress, RedirectAttributes redirectAttributes) {
		viewSubprojectProgressService.delete(viewSubprojectProgress);
		addMessage(redirectAttributes, "删除显示二级项目报表成功");
		return "redirect:"+Global.getAdminPath()+"/viewsubprojectprogress/viewSubprojectProgress/?repage";
	}

}