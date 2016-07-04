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
import com.bt.modules.project.entity.WeeklyDetail;
import com.bt.modules.project.service.WeeklyDetailService;

/**
 * 项目周报明细Controller
 * @author xjp
 * @version 2015-09-14
 */
@Controller
@RequestMapping(value = "${adminPath}/project/weeklyDetail")
public class WeeklyDetailController extends BaseController {

	@Autowired
	private WeeklyDetailService weeklyDetailService;
	
	@ModelAttribute
	public WeeklyDetail get(@RequestParam(required=false) String id) {
		WeeklyDetail entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = weeklyDetailService.get(id);
		}
		if (entity == null){
			entity = new WeeklyDetail();
		}
		return entity;
	}
	
	@RequiresPermissions("project:weeklyDetail:view")
	@RequestMapping(value = {"list", ""})
	public String list(WeeklyDetail weeklyDetail, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<WeeklyDetail> page = weeklyDetailService.findPage(new Page<WeeklyDetail>(request, response), weeklyDetail); 
		model.addAttribute("page", page);
		return "modules/project/weeklyDetailList";
	}

	@RequiresPermissions("project:weeklyDetail:view")
	@RequestMapping(value = "form")
	public String form(WeeklyDetail weeklyDetail, Model model) {
		model.addAttribute("weeklyDetail", weeklyDetail);
		return "modules/project/weeklyDetailForm";
	}

	@RequiresPermissions("project:weeklyDetail:edit")
	@RequestMapping(value = "save")
	public String save(WeeklyDetail weeklyDetail, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, weeklyDetail)){
			return form(weeklyDetail, model);
		}
		weeklyDetailService.save(weeklyDetail);
		addMessage(redirectAttributes, "保存周报成功");
		return "redirect:"+Global.getAdminPath()+"/project/weeklyDetail/?repage";
	}
	
	@RequiresPermissions("project:weeklyDetail:edit")
	@RequestMapping(value = "delete")
	public String delete(WeeklyDetail weeklyDetail, RedirectAttributes redirectAttributes) {
		weeklyDetailService.delete(weeklyDetail);
		addMessage(redirectAttributes, "删除周报成功");
		return "redirect:"+Global.getAdminPath()+"/project/weeklyDetail/?repage";
	}

}