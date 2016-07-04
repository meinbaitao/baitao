/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.receiving.web;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bt.modules.receiving.entity.ReceivingAccident;
import com.bt.modules.receiving.service.ReceivingAccidentService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 收货事故Controller
 * @author xiaocai
 * @version 2015-08-04
 */
@Controller
@RequestMapping(value = "${adminPath}/receivingAccident")
public class ReceivingAccidentController extends BaseController {

	@Autowired
	private ReceivingAccidentService receivingAccidentService;
	
	@RequiresPermissions("user")
	@RequestMapping(value = {"list", ""})
	public String list(ReceivingAccident receivingAccident, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ReceivingAccident> page = receivingAccidentService.findPage(new Page<ReceivingAccident>(request, response), receivingAccident); 
		model.addAttribute("page", page);
		return "modules/receivingAccident/receivingAccidentList";
	}

	@RequiresPermissions("user")
	@RequestMapping(value = "form")
	public String form(ReceivingAccident receivingAccident, Model model) {
		receivingAccident = receivingAccidentService.get(receivingAccident.getId());
		if(receivingAccident==null)
			receivingAccident = new ReceivingAccident();
		model.addAttribute("receivingAccident", receivingAccident);
		return "modules/receivingAccident/receivingAccidentForm";
	}

	@RequiresPermissions("user")
	@RequestMapping(value = "save")
	public String save(HttpServletRequest request,ReceivingAccident receivingAccident, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, receivingAccident)){
			return form(receivingAccident, model);
		}
		receivingAccidentService.save(receivingAccident);
		addMessage(redirectAttributes, "保存成功");
		return "redirect:"+Global.getAdminPath()+"/receivingAccident/list";
	}
	
	@RequiresPermissions("user")
	@RequestMapping(value = "delete")
	public String delete(HttpServletRequest request,ReceivingAccident receivingAccident, RedirectAttributes redirectAttributes) {
		receivingAccidentService.delete(receivingAccident);
		addMessage(redirectAttributes, "删除成功");
		return "redirect:"+Global.getAdminPath()+"/receivingAccident/list";
	}

}