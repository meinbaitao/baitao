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

import com.bt.modules.labour.entity.LabStaPrice;
import com.bt.modules.labour.service.LabStaPriceService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 劳务标准价格库Controller
 * @author xiaocai
 * @version 2015-08-04
 */
@Controller
@RequestMapping(value = "${adminPath}/labStaPrice")
public class LabStaPriceController extends BaseController {

	@Autowired
	private LabStaPriceService labStaPriceService;
	
	@ModelAttribute
	public LabStaPrice get(@RequestParam(required=false) String id) {
		LabStaPrice entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = labStaPriceService.get(id);
		}
		if (entity == null){
			entity = new LabStaPrice();
		}
		return entity;
	}
	
	@RequiresPermissions("user")
	@RequestMapping(value = {"list", ""})
	public String list(LabStaPrice labStaPrice, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<LabStaPrice> page = labStaPriceService.findPage(new Page<LabStaPrice>(request, response), labStaPrice); 
		model.addAttribute("page", page);
		return "modules/labStaPrice/labStaPriceList";
	}

	@RequiresPermissions("user")
	@RequestMapping(value = "form")
	public String form(LabStaPrice labStaPrice, Model model) {
		model.addAttribute("labStaPrice", labStaPrice);
		return "modules/labStaPrice/labStaPriceForm";
	}

	@RequiresPermissions("user")
	@RequestMapping(value = "save")
	public String save(LabStaPrice labStaPrice, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, labStaPrice)){
			return form(labStaPrice, model);
		}
		
		labStaPriceService.save(labStaPrice);
		addMessage(redirectAttributes, "保存成功");
		return "redirect:"+Global.getAdminPath()+"/labStaPrice/list";
	}
	
	@RequiresPermissions("user")
	@RequestMapping(value = "delete")
	public String delete(LabStaPrice labStaPrice, RedirectAttributes redirectAttributes) {
		labStaPriceService.delete(labStaPrice);
		addMessage(redirectAttributes, "删除成功");
		return "redirect:"+Global.getAdminPath()+"/labStaPrice/list";
	}
	
	

}