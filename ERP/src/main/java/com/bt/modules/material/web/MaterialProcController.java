/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.material.web;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bt.modules.material.entity.MaterialProc;
import com.bt.modules.material.service.MaterialProcService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 石材加工项Controller
 * @author xiaocai
 * @version 2015-07-27
 */
@Controller
@RequestMapping(value = "${adminPath}/material/material/proc")
public class MaterialProcController extends BaseController {

	@Autowired
	private MaterialProcService materialProcService;
	
//	@ModelAttribute
//	public MaterialProc get(@RequestParam(required=false) String id) {
//		MaterialProc entity = null;
//		if (StringUtils.isNotBlank(id)){
//			entity = materialProcService.get(id);
//		}
//		if (entity == null){
//			entity = new MaterialProc();
//		}
//		return entity;
//	}
	
	@RequiresPermissions("user")
	@RequestMapping(value = {"list", ""})
	public String list(MaterialProc materialProc, HttpServletRequest request, HttpServletResponse response, Model model) {
//		materialProcService.selectList(materialProc);
		Page<MaterialProc> page = materialProcService.findPage(new Page<MaterialProc>(request, response), materialProc); 
		model.addAttribute("page", page);
		return "modules/material/materialProcList";
	}

	@RequiresPermissions("user")
	@RequestMapping(value = "form")
	public String form(MaterialProc material, Model model) {
		material = materialProcService.get(material.getId());
		if(material==null)
			material = new MaterialProc();
		model.addAttribute("material", material);
		return "modules/material/materialProcForm";
	}

	@RequiresPermissions("user")
	@RequestMapping(value = "save")
	public String save(HttpServletRequest request,MaterialProc material, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, material)){
			return form(material, model);
		}
//		String[] areaPrices = request.getParameterValues("area");
//		material.setPrices(MaterialUtils.formatString(areaPrices));
		materialProcService.save(material);
		addMessage(redirectAttributes, "保存石材加工项信息成功");
		return "redirect:"+Global.getAdminPath()+"/material/material/proc/?repage&type="+material.getType();
	}
	
	@RequiresPermissions("user")
	@RequestMapping(value = "delete")
	public String delete(HttpServletRequest request,MaterialProc material, RedirectAttributes redirectAttributes) {
		String type = request.getParameter("type");
		materialProcService.delete(material);
		addMessage(redirectAttributes, "删除石材加工项信息成功");
		return "redirect:"+Global.getAdminPath()+"/material/material/proc/?repage&type="+type;
	}

}