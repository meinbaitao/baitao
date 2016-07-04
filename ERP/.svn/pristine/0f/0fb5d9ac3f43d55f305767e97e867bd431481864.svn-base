/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.labour.web;


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

import com.bt.modules.labour.entity.LabSta;
import com.bt.modules.labour.service.LabStaService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 劳务标准库Controller
 * @author xiaocai
 * @version 2015-08-04
 */
@Controller
@RequestMapping(value = "${adminPath}/labSta")
public class LabStaController extends BaseController {

	@Autowired
	private LabStaService labStaService;
	
	@ModelAttribute
	public LabSta get(@RequestParam(required=false) String id) {
		LabSta entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = labStaService.get(id);
		}
		if (entity == null){
			entity = new LabSta();
		}
		return entity;
	}
	
	@RequiresPermissions("user")
	@RequestMapping(value = {"list", ""})
	public String list(LabSta labSta, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<LabSta> page = labStaService.findPage(new Page<LabSta>(request, response), labSta); 
		model.addAttribute("page", page);
		return "modules/labSta/labStaList";
	}

	@RequiresPermissions("user")
	@RequestMapping(value = "form")
	public String form(LabSta labSta, Model model) {
		model.addAttribute("labSta", labSta);
		return "modules/labSta/labStaForm";
	}

	@RequiresPermissions("user")
	@RequestMapping(value = "save")
	public String save(LabSta labSta, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, labSta)){
			return form(labSta, model);
		}
		
		labStaService.save(labSta);
		addMessage(redirectAttributes, "保存成功");
		return "redirect:"+Global.getAdminPath()+"/labSta/list";
	}
	
	@RequiresPermissions("user")
	@RequestMapping(value = "delete")
	public String delete(LabSta labSta, RedirectAttributes redirectAttributes) {
		labStaService.delete(labSta);
		addMessage(redirectAttributes, "删除成功");
		return "redirect:"+Global.getAdminPath()+"/labSta/list";
	}
	
	
	

}