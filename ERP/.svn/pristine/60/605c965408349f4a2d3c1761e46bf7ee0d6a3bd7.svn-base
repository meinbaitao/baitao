/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.project.web;

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
import com.bt.modules.project.entity.Problem;
import com.bt.modules.project.service.ProblemService;

/**
 * 项目问题明细Controller
 * @author xjp
 * @version 2015-09-14
 */
@Controller
@RequestMapping(value = "${adminPath}/project/problem")
public class ProblemController extends BaseController {

	@Autowired
	private ProblemService problemService;
	
	@ModelAttribute
	public Problem get(@RequestParam(required=false) String id) {
		Problem entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = problemService.get(id);
		}
		if (entity == null){
			entity = new Problem();
		}
		return entity;
	}
	
	@RequiresPermissions("project:problem:view")
	@RequestMapping(value = {"list", ""})
	public String list(Problem problem, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Problem> page = problemService.findPage(new Page<Problem>(request, response), problem); 
		model.addAttribute("page", page);
		return "modules/project/problemList";
	}

	@RequiresPermissions("project:problem:view")
	@RequestMapping(value = "form")
	public String form(Problem problem, Model model) {
		model.addAttribute("problem", problem);
		return "modules/project/problemForm";
	}

	@RequiresPermissions("project:problem:edit")
	@RequestMapping(value = "save")
	public String save(Problem problem, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, problem)){
			return form(problem, model);
		}
		problemService.save(problem);
		addMessage(redirectAttributes, "保存周报成功");
		return "redirect:"+Global.getAdminPath()+"/project/problem/?repage";
	}
	
	@RequiresPermissions("project:problem:edit")
	@RequestMapping(value = "delete")
	public String delete(Problem problem, RedirectAttributes redirectAttributes) {
		problemService.delete(problem);
		addMessage(redirectAttributes, "删除周报成功");
		return "redirect:"+Global.getAdminPath()+"/project/problem/?repage";
	}

}