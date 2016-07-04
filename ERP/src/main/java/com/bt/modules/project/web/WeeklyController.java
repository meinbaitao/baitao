/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.project.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.bt.modules.project.entity.Weekly;
import com.bt.modules.project.service.WeeklyService;

/**
 * 项目周报Controller
 * @author xjp
 * @version 2015-09-14
 */
@Controller
@RequestMapping(value = "${adminPath}/weekly")
public class WeeklyController extends BaseController {

	@Autowired
	private WeeklyService weeklyService;
	
	
	@ModelAttribute
	public Weekly get(@RequestParam(required=false) String id) {
		Weekly entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = weeklyService.get(id);
		}
		if (entity == null){
			entity = new Weekly();
		}
		return entity;
	}
	
	
	@RequestMapping(value = {"list", ""})
	public String list(Weekly weekly, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Weekly> page = weeklyService.findPage(new Page<Weekly>(request, response), weekly); 
		model.addAttribute("page", page);
		return "modules/project/weeklyList";
	}

	
	@RequestMapping(value = "form")
	public String form(Weekly weekly, Model model) {
		weekly.setId(IdGen.uuid());
		model.addAttribute("weekly", weekly);
		return "modules/project/weeklyForm";
	}

	
	@RequestMapping(value = "save")
	public String save(Weekly weekly, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, weekly)){
			return form(weekly, model);
		}
		weeklyService.save(weekly);
		addMessage(redirectAttributes, "保存周报成功");
		return "redirect:"+Global.getAdminPath()+"/project/weekly/?repage";
	}
	
	
	@RequestMapping(value = "delete")
	public String delete(Weekly weekly, RedirectAttributes redirectAttributes) {
		weeklyService.delete(weekly);
		addMessage(redirectAttributes, "删除周报成功");
		return "redirect:"+Global.getAdminPath()+"/project/weekly/?repage";
	}

}