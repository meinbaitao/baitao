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
import com.bt.modules.accident.entity.AccidentManageDetail;
import com.bt.modules.accident.service.AccidentManageDetailService;

/**
 * 事故管理详情表Controller
 * @author pc
 * @version 2015-10-14
 */
@Controller
@RequestMapping(value = "${adminPath}/accident/accidentManageDetail")
public class AccidentManageDetailController extends BaseController {

	@Autowired
	private AccidentManageDetailService accidentManageDetailService;
	
	@RequestMapping(value = {"list", ""})
	public String list(AccidentManageDetail accidentManageDetail, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<AccidentManageDetail> page = accidentManageDetailService.findPage(new Page<AccidentManageDetail>(request, response), accidentManageDetail); 
		model.addAttribute("page", page);
		return "modules/accident/accidentManageDetailList";
	}

	@RequestMapping(value = "form")
	public String form(AccidentManageDetail accidentManageDetail, Model model) {
		model.addAttribute("accidentManageDetail", accidentManageDetail);
		return "modules/accident/accidentManageDetailForm";
	}

	@RequestMapping(value = "save")
	public String save(AccidentManageDetail accidentManageDetail, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, accidentManageDetail)){
			return form(accidentManageDetail, model);
		}
		accidentManageDetailService.save(accidentManageDetail);
		addMessage(redirectAttributes, "保存成功");
		return "redirect:"+Global.getAdminPath()+"/accident/accidentManageDetail/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(AccidentManageDetail accidentManageDetail, RedirectAttributes redirectAttributes) {
		accidentManageDetailService.delete(accidentManageDetail);
		addMessage(redirectAttributes, "删除成功");
		return "redirect:"+Global.getAdminPath()+"/accident/accidentManageDetail/?repage";
	}

}