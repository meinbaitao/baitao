/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.web;

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
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.bt.modules.contract.entity.LaborcontractAccount;
import com.bt.modules.contract.service.LaborcontractAccountService;

/**
 * 劳务台账Controller
 * @author yhh
 * @version 2015-12-22
 */
@Controller
@RequestMapping(value = "${adminPath}/contract/laborcontractAccount")
public class LaborcontractAccountController extends BaseController {

	@Autowired
	private LaborcontractAccountService laborcontractAccountService;
	
	@ModelAttribute
	public LaborcontractAccount get(@RequestParam(required=false) String id) {
		LaborcontractAccount entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = laborcontractAccountService.get(id);
		}
		if (entity == null){
			entity = new LaborcontractAccount();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(LaborcontractAccount laborcontractAccount, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<LaborcontractAccount> page = laborcontractAccountService.findPage(new Page<LaborcontractAccount>(request, response), laborcontractAccount); 
		model.addAttribute("page", page);
		return "modules/contract/laborcontractAccountList";
	}

	@RequestMapping(value = "form")
	public String form(LaborcontractAccount laborcontractAccount, Model model) {
		model.addAttribute("laborcontractAccount", laborcontractAccount);
		return "modules/contract/laborcontractAccountForm";
	}

	@RequestMapping(value = "save")
	public String save(LaborcontractAccount laborcontractAccount, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, laborcontractAccount)){
			return form(laborcontractAccount, model);
		}
		addMessage(redirectAttributes, "保存劳务台账成功");
		return "redirect:"+Global.getAdminPath()+"/contract/laborcontractAccount/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(LaborcontractAccount laborcontractAccount, RedirectAttributes redirectAttributes) {
		laborcontractAccountService.delete(laborcontractAccount);
		addMessage(redirectAttributes, "删除劳务台账成功");
		return "redirect:"+Global.getAdminPath()+"/contract/laborcontractAccount/?repage";
	}

}