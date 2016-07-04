/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.finance.web;

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
import com.bt.modules.finance.entity.LaborSettlementDetail;
import com.bt.modules.finance.service.LaborSettlementDetailService;

/**
 * 劳务结算清单Controller
 * @author yhh
 * @version 2015-12-15
 */
@Controller
@RequestMapping(value = "${adminPath}/finance/laborSettlementDetail")
public class LaborSettlementDetailController extends BaseController {

	@Autowired
	private LaborSettlementDetailService laborSettlementDetailService;
	
	@ModelAttribute
	public LaborSettlementDetail get(@RequestParam(required=false) String id) {
		LaborSettlementDetail entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = laborSettlementDetailService.get(id);
		}
		if (entity == null){
			entity = new LaborSettlementDetail();
		}
		return entity;
	}
	
	@RequiresPermissions("finance:laborSettlementDetail:view")
	@RequestMapping(value = {"list", ""})
	public String list(LaborSettlementDetail laborSettlementDetail, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<LaborSettlementDetail> page = laborSettlementDetailService.findPage(new Page<LaborSettlementDetail>(request, response), laborSettlementDetail); 
		model.addAttribute("page", page);
		return "modules/finance/laborSettlementDetailList";
	}

	@RequiresPermissions("finance:laborSettlementDetail:view")
	@RequestMapping(value = "form")
	public String form(LaborSettlementDetail laborSettlementDetail, Model model) {
		model.addAttribute("laborSettlementDetail", laborSettlementDetail);
		return "modules/finance/laborSettlementDetailForm";
	}

	@RequiresPermissions("finance:laborSettlementDetail:edit")
	@RequestMapping(value = "save")
	public String save(LaborSettlementDetail laborSettlementDetail, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, laborSettlementDetail)){
			return form(laborSettlementDetail, model);
		}
		laborSettlementDetailService.save(laborSettlementDetail);
		addMessage(redirectAttributes, "保存劳务结算清单成功");
		return "redirect:"+Global.getAdminPath()+"/finance/laborSettlementDetail/?repage";
	}
	
	@RequiresPermissions("finance:laborSettlementDetail:edit")
	@RequestMapping(value = "delete")
	public String delete(LaborSettlementDetail laborSettlementDetail, RedirectAttributes redirectAttributes) {
		laborSettlementDetailService.delete(laborSettlementDetail);
		addMessage(redirectAttributes, "删除劳务结算清单成功");
		return "redirect:"+Global.getAdminPath()+"/finance/laborSettlementDetail/?repage";
	}

}