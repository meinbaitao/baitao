/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.material.web;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bt.modules.material.entity.Material;
import com.bt.modules.material.service.MaterialService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 物料信息表Controller
 * @author xiaocai
 * @version 2015-07-24
 */
@Controller
@RequestMapping(value = "${adminPath}/material/material")
public class MaterialController extends BaseController {

	@Autowired
	private MaterialService materialService;
	
	@ModelAttribute
	public Material get(@RequestParam(required=false) String id) {
		Material entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = materialService.get(id);
		}
		if (entity == null){
			entity = new Material();
		}
		return entity;
	}
	
	@RequiresPermissions("user")
	@RequestMapping(value = {"list", ""})
	public String list(Material material, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Material> page = materialService.findPage(new Page<Material>(request, response), material); 
		model.addAttribute("page", page);
		return "modules/material/materialList";
	}

	@RequiresPermissions("user")
	@RequestMapping(value = "form")
	public String form(Material material, Model model) {
		model.addAttribute("material", material);
		return "modules/material/materialForm";
	}

	@RequiresPermissions("user")
	@RequestMapping(value = "save")
	public String save(Material material, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, material)){
			return form(material, model);
		}
		
		materialService.save(material);
		addMessage(redirectAttributes, "保存物料信息成功");
		return "redirect:"+Global.getAdminPath()+"/material/material/?repage&type="+material.getType();
	}
	
	@RequiresPermissions("user")
	@RequestMapping(value = "delete")
	public String delete(Material material,HttpServletRequest request, RedirectAttributes redirectAttributes) {
		//获取前端勾选项
		String[] vCheckd = request.getParameterValues("vCheckd");
		if(vCheckd != null && vCheckd.length > 0){
			String[] materiallId = vCheckd[0].split(",");
			if(materiallId != null && materiallId.length > 0){
				for (int i = 0; i < materiallId.length; i++) {
					material = materialService.get(materiallId[i]);
					if(material != null){
						materialService.delete(material);
						addMessage(redirectAttributes, "删除物料信息成功");
					}
				}
			}
		}else{
			addMessage(redirectAttributes, "删除物料信息失败");
		}
		return "redirect:"+Global.getAdminPath()+"/material/material/?repage&type="+material.getType();
	}

	@ResponseBody
	@RequestMapping(value="getBySeriesNumber")
	public Material getBySeriesNumber(Material material, HttpServletRequest request, HttpServletResponse response){
		material.setSeriesNumber(request.getParameter("seriesNumber"));
		return materialService.getBySeriesNumber(material);
	}
	
	@ResponseBody
	@RequestMapping(value="getById")
	public Material getById(Material material, HttpServletRequest request, HttpServletResponse response){
		String materialId = request.getParameter("materialId");
		return materialService.get(materialId);
	}
	 
	
	/**
	 * ajax 获取物料列表
	 * @param materiel
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="findMaterielList")
	public List<Material> findMaterielList(Material materiel, HttpServletRequest request, HttpServletResponse response){
		return materialService.findList(materiel); 
	}
	
}