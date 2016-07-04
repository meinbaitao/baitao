/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.person.web;

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

import com.bt.modules.person.entity.CommonPerson;
import com.bt.modules.person.service.CommonPersonService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;

/**
 * 常用联系人表Controller
 * @author pc
 * @version 2015-08-11
 */
@Controller
@RequestMapping(value = "${adminPath}/person/commonPerson")
public class CommonPersonController extends BaseController {

	@Autowired
	private CommonPersonService commonPersonService;
	
	@ModelAttribute
	public CommonPerson get(@RequestParam(required=false) String id) {
		CommonPerson entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = commonPersonService.get(id);
		}
		if (entity == null){
			entity = new CommonPerson();
		}
		return entity;
	}
	
	@RequiresPermissions("person:commonPerson:view")
	@RequestMapping(value = {"list", ""})
	public String list(CommonPerson commonPerson, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CommonPerson> page = commonPersonService.findPage(new Page<CommonPerson>(request, response), commonPerson); 
		model.addAttribute("page", page);
		return "modules/person/commonPersonList";
	}

	@RequiresPermissions("person:commonPerson:view")
	@RequestMapping(value = "form")
	public String form(CommonPerson commonPerson, Model model) {
		model.addAttribute("commonPerson", commonPerson);
		return "modules/person/commonPersonForm";
	}

	@RequiresPermissions("person:commonPerson:edit")
	@RequestMapping(value = "save")
	public String save(CommonPerson commonPerson, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, commonPerson)){
			return form(commonPerson, model);
		}
		commonPersonService.save(commonPerson);
		addMessage(redirectAttributes, "保存常用联系人表成功");
		return "redirect:"+Global.getAdminPath()+"/person/commonPerson/?repage";
	}
	
	@RequiresPermissions("person:commonPerson:edit")
	@RequestMapping(value = "delete")
	public String delete(CommonPerson commonPerson, RedirectAttributes redirectAttributes) {
		commonPersonService.delete(commonPerson);
		addMessage(redirectAttributes, "删除常用联系人表成功");
		return "redirect:"+Global.getAdminPath()+"/person/commonPerson/?repage";
	}

}