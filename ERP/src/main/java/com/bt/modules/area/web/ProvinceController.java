/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.area.web;

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
import com.bt.modules.area.entity.Province;
import com.bt.modules.area.service.ProvinceService;

/**
 * 省市区基础表Controller
 * @author xjp
 * @version 2015-08-18
 */
@Controller
@RequestMapping(value = "${adminPath}/area/province")
public class ProvinceController extends BaseController {

	@Autowired
	private ProvinceService provinceService;
	
	@ModelAttribute
	public Province get(@RequestParam(required=false) String id) {
		Province entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = provinceService.get(id);
		}
		if (entity == null){
			entity = new Province();
		}
		return entity;
	}
	
	@RequiresPermissions("area:province:view")
	@RequestMapping(value = {"list", ""})
	public String list(Province province, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Province> page = provinceService.findPage(new Page<Province>(request, response), province); 
		model.addAttribute("page", page);
		return "modules/area/provinceList";
	}

	@RequiresPermissions("area:province:view")
	@RequestMapping(value = "form")
	public String form(Province province, Model model) {
		model.addAttribute("province", province);
		return "modules/area/provinceForm";
	}

	@RequiresPermissions("area:province:edit")
	@RequestMapping(value = "save")
	public String save(Province province, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, province)){
			return form(province, model);
		}
		provinceService.save(province);
		addMessage(redirectAttributes, "保存保存省市区成功成功");
		return "redirect:"+Global.getAdminPath()+"/area/province/?repage";
	}
	
	@RequiresPermissions("area:province:edit")
	@RequestMapping(value = "delete")
	public String delete(Province province, RedirectAttributes redirectAttributes) {
		provinceService.delete(province);
		addMessage(redirectAttributes, "删除保存省市区成功成功");
		return "redirect:"+Global.getAdminPath()+"/area/province/?repage";
	}

}