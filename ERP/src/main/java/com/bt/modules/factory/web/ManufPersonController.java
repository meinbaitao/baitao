/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.factory.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.bt.modules.factory.entity.ManufPerson;
import com.bt.modules.factory.service.ManufPersonService;

import java.util.List;

/**
 * 加工厂人员Controller
 * @author yhh
 * @version 2015-11-11
 */
@Controller
@RequestMapping(value = "${adminPath}/factory/manufPerson")
public class ManufPersonController extends BaseController {

	@Autowired
	private ManufPersonService manufPersonService;
	
	@ModelAttribute
	public ManufPerson get(@RequestParam(required=false) String id) {
		ManufPerson entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = manufPersonService.get(id);
		}
		if (entity == null){
			entity = new ManufPerson();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(ManufPerson manufPerson, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ManufPerson> page = manufPersonService.findPage(new Page<ManufPerson>(request, response), manufPerson); 
		model.addAttribute("page", page);
		return "modules/factory/manufPersonList";
	}

	@RequestMapping(value = "form")
	public String form(ManufPerson manufPerson, Model model) {
		model.addAttribute("manufPerson", manufPerson);
		return "modules/factory/manufPersonForm";
	}

	@RequestMapping(value = "save")
	public String save(ManufPerson manufPerson, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, manufPerson)){
			return form(manufPerson, model);
		}
		manufPersonService.save(manufPerson);
		addMessage(redirectAttributes, "保存加工厂人员成功");
		return "redirect:"+Global.getAdminPath()+"/factory/manufPerson/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(ManufPerson manufPerson, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		//获取前端勾选项
		String[] vCheckd = request.getParameterValues("vCheckd");
		if(vCheckd != null && vCheckd.length > 0){
			String[] manufPersonId = vCheckd[0].split(",");
			if(manufPersonId != null && manufPersonId.length > 0){
				for (int i = 0; i < manufPersonId.length; i++) {
					manufPerson = manufPersonService.get(manufPersonId[i]);
					if(manufPerson != null){
						manufPersonService.delete(manufPerson);
						addMessage(redirectAttributes, "删除加工厂人员成功");
					}
				}
			}
		}else{
			addMessage(redirectAttributes, "删除加工厂人员失败");
		}
		return "redirect:"+Global.getAdminPath()+"/factory/manufPerson/?repage";
	}


	@RequestMapping(value="findAllManufactory", method= RequestMethod.GET)
	public @ResponseBody
	List<ManufPerson> findAllManufactory(){
		return manufPersonService.findList(new ManufPerson());
	}

}