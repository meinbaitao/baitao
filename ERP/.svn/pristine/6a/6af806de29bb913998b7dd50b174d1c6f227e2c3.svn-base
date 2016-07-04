/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.finance.web;

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
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.bt.modules.finance.entity.ManufSettlement;
import com.bt.modules.finance.service.ManufSettlementService;
import com.bt.modules.utils.CommonConstant;

/**
 * 生产结算单Controller
 * @author yhh
 * @version 2015-10-15
 */
@Controller
@RequestMapping(value = "${adminPath}/finance/manufSettlement")
public class ManufSettlementController extends BaseController {

	@Autowired
	private ManufSettlementService manufSettlementService;
	
	@ModelAttribute
	public ManufSettlement get(@RequestParam(required=false) String id) {
		ManufSettlement entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = manufSettlementService.get(id);
		}
		if (entity == null){
			entity = new ManufSettlement();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(ManufSettlement manufSettlement, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ManufSettlement> page = manufSettlementService.findPage(new Page<ManufSettlement>(request, response), manufSettlement); 
		model.addAttribute("page", page);
		return "modules/finance/manufSettlementList";
	}

	@RequestMapping(value = "form")
	public String form(ManufSettlement manufSettlement, Model model) {
		model.addAttribute("manufSettlement", manufSettlement);
		return "modules/finance/manufSettlementForm";
	}

	@RequestMapping(value = "patchContractPrice")
	public String patchContractPrice(ManufSettlement settlement, Model model, RedirectAttributes redirectAttributes){
		settlement = manufSettlementService.patchContractPrice(settlement);
		model.addAttribute("settlement", settlement);
		addMessage(redirectAttributes, "已匹配最新合同价");
		return "modules/finance/manufSettlementForm";
	}
	
	@RequestMapping(value = "save")
	public String save(ManufSettlement manufSettlement, Model model, RedirectAttributes redirectAttributes) {
		manufSettlementService.updateManufSettlement(manufSettlement);
		addMessage(redirectAttributes, "保存生产结算单成功");
		return "redirect:"+Global.getAdminPath()+"/finance/manufSettlement/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(ManufSettlement manufSettlement, RedirectAttributes redirectAttributes) {
		manufSettlementService.delete(manufSettlement);
		addMessage(redirectAttributes, "删除生产结算单成功");
		return "redirect:"+Global.getAdminPath()+"/finance/manufSettlement/?repage";
	}

}