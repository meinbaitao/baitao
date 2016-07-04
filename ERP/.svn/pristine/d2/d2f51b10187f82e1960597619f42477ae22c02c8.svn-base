/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.web;

import java.util.List;

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
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.bt.modules.contract.entity.LaborItemsPrice;
import com.bt.modules.contract.service.LaborItemsPriceService;

/**
 * 劳务价格清单库Controller
 * @author pc
 * @version 2016-01-27
 */
@Controller
@RequestMapping(value = "${adminPath}/contract/laborItemsPrice")
public class LaborItemsPriceController extends BaseController {

	@Autowired
	private LaborItemsPriceService laborItemsPriceService;
	
	@ModelAttribute
	public LaborItemsPrice get(@RequestParam(required=false) String id) {
		LaborItemsPrice entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = laborItemsPriceService.get(id);
		}
		if (entity == null){
			entity = new LaborItemsPrice();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(LaborItemsPrice laborItemsPrice, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<LaborItemsPrice> page = laborItemsPriceService.findPage(new Page<LaborItemsPrice>(request, response), laborItemsPrice); 
		model.addAttribute("page", page);
		return "modules/contract/laborItemsPriceList";
	}

	@RequestMapping(value = "form")
	public String form(LaborItemsPrice laborItemsPrice, Model model) {
		model.addAttribute("laborItemsPrice", laborItemsPrice);
		return "modules/contract/laborItemsPriceForm";
	}

	@RequestMapping(value = "save")
	public String save(LaborItemsPrice laborItemsPrice, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, laborItemsPrice)){
			return form(laborItemsPrice, model);
		}
		laborItemsPriceService.save(laborItemsPrice);
		addMessage(redirectAttributes, "保存劳务价库表成功");
		return "redirect:"+Global.getAdminPath()+"/contract/laborItemsPrice/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(LaborItemsPrice laborItemsPrice, RedirectAttributes redirectAttributes) {
		laborItemsPriceService.delete(laborItemsPrice);
		addMessage(redirectAttributes, "删除劳务价库表成功");
		return "redirect:"+Global.getAdminPath()+"/contract/laborItemsPrice/?repage";
	}

	/**
	 * ajax 由劳务分项id获取对象
	 * @param lip
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="getById")
	public LaborItemsPrice getById(LaborItemsPrice lip, HttpServletRequest request, HttpServletResponse response){
		lip.setId(request.getParameter("id"));
		return laborItemsPriceService.get(lip);
	}
	
	/**
	 * ajax 由劳务分项名获取对象
	 * @param lip
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="getByName")
	public LaborItemsPrice getByName(LaborItemsPrice lip, HttpServletRequest request, HttpServletResponse response){
		lip.setName(request.getParameter("name"));
		return laborItemsPriceService.getByName(lip);
	}
	
	/**
	 * ajax 获取劳务分项列表
	 * @param lip
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="findDetailPriceList")
	public List<LaborItemsPrice> findDetailPriceList(LaborItemsPrice lip, HttpServletRequest request, HttpServletResponse response){
		return laborItemsPriceService.findList(lip);
	}
}