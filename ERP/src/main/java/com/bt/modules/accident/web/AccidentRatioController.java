/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.accident.web;

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
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.bt.modules.accident.entity.AccidentRatio;
import com.bt.modules.accident.service.AccidentRatioService;

/**
 * 事故比例Controller
 * @author pc
 * @version 2015-10-14
 */
@Controller
@RequestMapping(value = "${adminPath}/accident/accidentRatio")
public class AccidentRatioController extends BaseController {

	@Autowired
	private AccidentRatioService accidentRatioService;
	
	@ModelAttribute
	public AccidentRatio get(@RequestParam(required=false) String id) {
		AccidentRatio entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = accidentRatioService.get(id);
		}
		if (entity == null){
			entity = new AccidentRatio();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(AccidentRatio accidentRatio, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<AccidentRatio> page = accidentRatioService.findPage(new Page<AccidentRatio>(request, response), accidentRatio); 
		model.addAttribute("page", page);
		return "modules/accident/accidentRatioList";
	}

	@RequestMapping(value = "form")
	public String form(AccidentRatio accidentRatio, Model model) {
		model.addAttribute("accidentRatio", accidentRatio);
		return "modules/accident/accidentRatioForm";
	}

	@RequestMapping(value = "save")
	public String save(AccidentRatio accidentRatio, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, accidentRatio)){
			return form(accidentRatio, model);
		}
		accidentRatioService.save(accidentRatio);
		addMessage(redirectAttributes, "保存成功");
		return "redirect:"+Global.getAdminPath()+"/accident/accidentRatio/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(AccidentRatio accidentRatio,HttpServletRequest request, RedirectAttributes redirectAttributes) {
		accidentRatioService.delete(accidentRatio);
		addMessage(redirectAttributes, "删除成功");
		//获取前端勾选项
				String[] vCheckd = request.getParameterValues("vCheckd");
				if(vCheckd != null && vCheckd.length > 0){
					String[] ratioId = vCheckd[0].split(",");
					if(ratioId != null && ratioId.length > 0){
						for (int i = 0; i < ratioId.length; i++) {
							accidentRatio = accidentRatioService.get(ratioId[i]);
							if(accidentRatio != null){
								accidentRatioService.delete(accidentRatio);
								addMessage(redirectAttributes, "删除成功");
							}
						}
					}
				}else{
					addMessage(redirectAttributes, "删除失败");
				}
		return "redirect:"+Global.getAdminPath()+"/accident/accidentRatio/?repage";
	}

}