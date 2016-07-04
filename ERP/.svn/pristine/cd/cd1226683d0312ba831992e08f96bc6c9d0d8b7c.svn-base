/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.accident.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.bt.modules.accident.entity.AccidentShareMoney;
import com.bt.modules.accident.service.AccidentShareMoneyService;

/**
 * 事故分摊金额Controller
 * @author pc
 * @version 2015-10-14
 */
@Controller
@RequestMapping(value = "${adminPath}/accident/accidentShareMoney")
public class AccidentShareMoneyController extends BaseController {

	@Autowired
	private AccidentShareMoneyService accidentShareMoneyService;

	@RequestMapping(value = {"list", ""})
	public String list(AccidentShareMoney accidentShareMoney, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<AccidentShareMoney> page = accidentShareMoneyService.findPage(new Page<AccidentShareMoney>(request, response), accidentShareMoney); 
		model.addAttribute("page", page);
		return "modules/accident/accidentShareMoneyList";
	}

	@RequestMapping(value = "form")
	public String form(AccidentShareMoney accidentShareMoney, Model model) {
		model.addAttribute("accidentShareMoney", accidentShareMoney);
		return "modules/accident/accidentShareMoneyForm";
	}

	@RequestMapping(value = "save")
	public String save(AccidentShareMoney accidentShareMoney, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, accidentShareMoney)){
			return form(accidentShareMoney, model);
		}
		accidentShareMoneyService.save(accidentShareMoney);
		addMessage(redirectAttributes, "保存成功");
		return "redirect:"+Global.getAdminPath()+"/accident/accidentShareMoney/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(AccidentShareMoney accidentShareMoney, RedirectAttributes redirectAttributes) {
		accidentShareMoneyService.delete(accidentShareMoney);
		addMessage(redirectAttributes, "删除成功");
		return "redirect:"+Global.getAdminPath()+"/accident/accidentShareMoney/?repage";
	}

}