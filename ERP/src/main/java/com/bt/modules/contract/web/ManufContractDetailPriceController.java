/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.web;

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

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.bt.modules.contract.entity.ManufContractDetailPrice;
import com.bt.modules.contract.service.ManufContractDetailPriceService;

/**
 * 加工清单价库Controller
 * @author yhh
 * @version 2015-08-12
 */
@Controller
@RequestMapping(value = "${adminPath}/contract/manufContractDetailPrice")
public class ManufContractDetailPriceController extends BaseController {

	@Autowired
	private ManufContractDetailPriceService manufContractDetailPriceService;
	
	@ModelAttribute
	public ManufContractDetailPrice get(@RequestParam(required=false) String id) {
		ManufContractDetailPrice entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = manufContractDetailPriceService.get(id);
		}
		if (entity == null){
			entity = new ManufContractDetailPrice();
		}
		return entity;
	}
	
	@RequiresPermissions("mcdp:view")
	@RequestMapping(value = {"list", ""})
	public String list(ManufContractDetailPrice manufContractDetailPrice, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ManufContractDetailPrice> page = manufContractDetailPriceService.findPage(new Page<ManufContractDetailPrice>(request, response), manufContractDetailPrice); 
		model.addAttribute("page", page);
		return "modules/contract/manufContractDetailPriceList";
	}

	@RequiresPermissions("mcdp:view")
	@RequestMapping(value = "form")
	public String form(ManufContractDetailPrice manufContractDetailPrice, Model model) {
		model.addAttribute("manufContractDetailPrice", manufContractDetailPrice);
		return "modules/contract/manufContractDetailPriceForm";
	}

	@RequiresPermissions("mcdp:edit")
	@RequestMapping(value = "save")
	public String save(ManufContractDetailPrice manufContractDetailPrice, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, manufContractDetailPrice)){
			return form(manufContractDetailPrice, model);
		}
		manufContractDetailPriceService.save(manufContractDetailPrice);
		addMessage(redirectAttributes, "保存加工清单价库成功");
		return "redirect:"+Global.getAdminPath()+"/contract/manufContractDetailPrice/?repage";
	}
	
	@RequiresPermissions("mcdp:edit")
	@RequestMapping(value = "delete")
	public String delete(ManufContractDetailPrice manufContractDetailPrice, RedirectAttributes redirectAttributes) {
		manufContractDetailPriceService.delete(manufContractDetailPrice);
		addMessage(redirectAttributes, "删除加工清单价库成功");
		return "redirect:"+Global.getAdminPath()+"/contract/manufContractDetailPrice/?repage";
	}
	
	/**
	 * ajax 有工艺名获取对象
	 * @param mcdp
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="getByManufName")
	public ManufContractDetailPrice getByManufName( ManufContractDetailPrice mcdp, HttpServletRequest request, HttpServletResponse response){
		mcdp.setManufName(request.getParameter("name"));
		return manufContractDetailPriceService.getByManufName(mcdp);
	}
	
	/**
	 * ajax 获取加工工艺价列表
	 * @param manufContractDetailPrice
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="findDetailPriceList")
	public List<ManufContractDetailPrice> findDetailPriceList(ManufContractDetailPrice manufContractDetailPrice,HttpServletRequest request, HttpServletResponse response){
		return manufContractDetailPriceService.findList(manufContractDetailPrice);
	}
	
}