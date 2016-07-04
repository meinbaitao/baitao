/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.web;

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
import com.bt.modules.contract.entity.StoneCarriageContractDetail;
import com.bt.modules.contract.service.StoneCarriageContractDetailService;

/**
 * 石材运输明细Controller
 * @author yhh
 * @version 2015-12-01
 */
@Controller
@RequestMapping(value = "${adminPath}/contract/stoneCarriageContractDetail")
public class StoneCarriageContractDetailController extends BaseController {

	@Autowired
	private StoneCarriageContractDetailService stoneCarriageContractDetailService;
	
	@ModelAttribute
	public StoneCarriageContractDetail get(@RequestParam(required=false) String id) {
		StoneCarriageContractDetail entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = stoneCarriageContractDetailService.get(id);
		}
		if (entity == null){
			entity = new StoneCarriageContractDetail();
		}
		return entity;
	}
	
	@RequiresPermissions("contract:stoneCarriageContractDetail:view")
	@RequestMapping(value = {"list", ""})
	public String list(StoneCarriageContractDetail stoneCarriageContractDetail, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<StoneCarriageContractDetail> page = stoneCarriageContractDetailService.findPage(new Page<StoneCarriageContractDetail>(request, response), stoneCarriageContractDetail); 
		model.addAttribute("page", page);
		return "modules/contract/stoneCarriageContractDetailList";
	}

	@RequiresPermissions("contract:stoneCarriageContractDetail:view")
	@RequestMapping(value = "form")
	public String form(StoneCarriageContractDetail stoneCarriageContractDetail, Model model) {
		model.addAttribute("stoneCarriageContractDetail", stoneCarriageContractDetail);
		return "modules/contract/stoneCarriageContractDetailForm";
	}

	@RequiresPermissions("contract:stoneCarriageContractDetail:edit")
	@RequestMapping(value = "save")
	public String save(StoneCarriageContractDetail stoneCarriageContractDetail, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, stoneCarriageContractDetail)){
			return form(stoneCarriageContractDetail, model);
		}
		stoneCarriageContractDetailService.save(stoneCarriageContractDetail);
		addMessage(redirectAttributes, "保存石材运输明细成功");
		return "redirect:"+Global.getAdminPath()+"/contract/stoneCarriageContractDetail/?repage";
	}
	
	@RequiresPermissions("contract:stoneCarriageContractDetail:edit")
	@RequestMapping(value = "delete")
	public String delete(StoneCarriageContractDetail stoneCarriageContractDetail, RedirectAttributes redirectAttributes) {
		stoneCarriageContractDetailService.delete(stoneCarriageContractDetail);
		addMessage(redirectAttributes, "删除石材运输明细成功");
		return "redirect:"+Global.getAdminPath()+"/contract/stoneCarriageContractDetail/?repage";
	}

}