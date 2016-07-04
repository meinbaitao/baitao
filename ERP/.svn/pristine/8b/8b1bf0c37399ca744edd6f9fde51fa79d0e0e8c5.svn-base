/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.web;

import java.util.HashMap;
import java.util.List;
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

import com.bt.modules.contract.entity.LaborItemsPrice;
import com.bt.modules.contract.entity.Laboritems;
import com.bt.modules.contract.service.LaborItemsPriceService;
import com.bt.modules.contract.service.LaboritemsService;
import com.bt.modules.project.entity.Subproject;
import com.bt.modules.project.service.SubProjectService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 劳务价库表Controller
 * @author yhh
 * @version 2015-08-19
 */
@Controller
@RequestMapping(value = "${adminPath}/contract/laboritems")
public class LaboritemsController extends BaseController {

	@Autowired
	private LaboritemsService laboritemsService;
	@Autowired
	private LaborItemsPriceService laborItemsPriceService;
	@Autowired
	private SubProjectService subProjectService;
	
	@ModelAttribute
	public Laboritems get(@RequestParam(required=false) String id) {
		Laboritems entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = laboritemsService.get(id);
		}
		if (entity == null){
			entity = new Laboritems();
		}
		return entity;
	}
	
//	@RequestMapping(value = {"list"})
//	public String list(Laboritems laboritems, HttpServletRequest request, HttpServletResponse response, Model model) {
//		Page<Laboritems> page = laboritemsService.findPage(new Page<Laboritems>(request, response), laboritems); 
//		model.addAttribute("page", page);
//		return "modules/contract/laboritemsList";
//	}

	@RequestMapping(value = "form")
	public String form(Laboritems laboritems, Model model,HttpServletRequest request, HttpServletResponse response) {
		String type = request.getParameter("laboritemsType");
		String subId = request.getParameter("subId");
		Subproject sub = subProjectService.get(subId);
		if(StringUtils.isNotBlank(type)){
			List<LaborItemsPrice> list = laborItemsPriceService.getByType(type);
			model.addAttribute("listLaborItemsPrice", list);
		}else{
			List<Laboritems> list = laboritemsService.getBySubId(subId);
			model.addAttribute("listLaborItems", list);
		}
		model.addAttribute("sub", sub==null?new Subproject():sub);
		return "modules/contract/laboritemsForm";
	}

	@RequestMapping(value = "save")
	public String save(Laboritems laboritems, Model model, RedirectAttributes redirectAttributes,HttpServletRequest request, HttpServletResponse response) {
		List<Laboritems> listLaboritems = laboritems.getListLaboritems();
//		laboritemsService.batchInsert(listLaboritems);
		String subId = request.getParameter("subId");
		if(listLaboritems!=null&&StringUtils.isBlank(listLaboritems.get(0).getId())){
			laboritemsService.deleteBySubId(subId);
		}
		laboritemsService.batchSave(listLaboritems);
		addMessage(redirectAttributes, "保存劳务价库表成功");
		return "redirect:"+Global.getAdminPath()+"/contract/laborcontract/listVerify";
	}
//	/**
//	 * 根据用户选择的类型获取对应的价格库数据
//	 * @param request
//	 * @param response
//	 * @return
//	 */
//	@RequestMapping(value = "getItemsPriceByCondition")
//	@ResponseBody
//	public Map<String,Object> getItemsPriceByCondition(HttpServletRequest request, HttpServletResponse response) {
//		String type = request.getParameter("type");
//		Map<String,Object> map = new HashMap<String,Object>();
//		List<LaborItemsPrice> list = laborItemsPriceService.getByType(type);
//		
//		map.put("listLaborItemsPrice", list);
//		return map;
//	}
	@RequestMapping(value = "getItemsByCondition")
	@ResponseBody
	public Map<String,Object> getItemsByCondition(HttpServletRequest request, HttpServletResponse response) {
		String type = request.getParameter("type");
		String subId = request.getParameter("subId");
		
		Map<String,Object> map = new HashMap<String,Object>();
		if(StringUtils.isNotBlank(type)){
			List<LaborItemsPrice> list = laborItemsPriceService.getByType(type);
			map.put("listLaborItemsPrice", list);
		}else{
			List<Laboritems> list = laboritemsService.getBySubId(subId);
			map.put("listLaborItems", list);
		}
		return map;
	}
//	
//	@RequestMapping(value = "delete")
//	public String delete(Laboritems laboritems, RedirectAttributes redirectAttributes) {
//		laboritemsService.delete(laboritems);
//		addMessage(redirectAttributes, "删除劳务价库表成功");
//		return "redirect:"+Global.getAdminPath()+"/contract/laboritems/?repage";
//	}
}