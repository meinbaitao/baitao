/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.houseType.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bt.common.exceptions.BusinessException;
import com.bt.modules.houseType.entity.HouseType;
import com.bt.modules.houseType.service.HouseTypeService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 户型库管理Controller
 * @author xiaocai
 * @version 2016-04-29
 */
@Controller
@RequestMapping(value = "${adminPath}/houseType/houseType")
public class HouseTypeController extends BaseController {

	@Autowired
	private HouseTypeService houseTypeService;
	
	@ModelAttribute
	public HouseType get(@RequestParam(required=false) String id) {
		HouseType entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = houseTypeService.get(id);
		}
		if (entity == null){
			entity = new HouseType();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(HouseType houseType, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<HouseType> page = houseTypeService.findPage(new Page<HouseType>(request, response), houseType); 
		model.addAttribute("page", page);
		return "modules/houseType/houseTypeList";
	}

	@RequestMapping(value = "form")
	public String form(HouseType houseType, Model model) {
		model.addAttribute("houseType", houseType);
		return "modules/houseType/houseTypeForm";
	}

	@RequestMapping(value = "save")
	public String save(HouseType houseType, Model model, RedirectAttributes redirectAttributes) throws BusinessException {
		if (!beanValidator(model, houseType)){
			return form(houseType, model);
		}
		houseTypeService.saveHouseType(houseType);
		addMessage(redirectAttributes, "保存户型成功");
		return "redirect:"+Global.getAdminPath()+"/houseType/houseType/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(HouseType houseType, RedirectAttributes redirectAttributes) {
		houseTypeService.delete(houseType);
		addMessage(redirectAttributes, "删除户型成功");
		return "redirect:"+Global.getAdminPath()+"/houseType/houseType/?repage";
	}
	
	/**
	 * 验证户型是否存在
	 * @param houseType
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "validateHouseType")
	@ResponseBody
	public Map<String,Object> validateHouseType(HouseType houseType, RedirectAttributes redirectAttributes) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("houseType", houseTypeService.getOneByHouseType(houseType));
		return map;
	}
}