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
import com.bt.modules.contract.entity.BtgConJiaContractDetail;
import com.bt.modules.contract.service.BtgConJiaContractDetailService;

/**
 * 甲方合同拆成楼栋Controller
 * @author lky
 * @version 2015-12-21
 */
@Controller
@RequestMapping(value = "${adminPath}/contract/btgConJiaContractDetail")
public class BtgConJiaContractDetailController extends BaseController {

	@Autowired
	private BtgConJiaContractDetailService btgConJiaContractDetailService;
	
	@ModelAttribute
	public BtgConJiaContractDetail get(@RequestParam(required=false) String id) {
		BtgConJiaContractDetail entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = btgConJiaContractDetailService.get(id);
		}
		if (entity == null){
			entity = new BtgConJiaContractDetail();
		}
		return entity;
	}
	
	@RequiresPermissions("contract:btgConJiaContractDetail:view")
	@RequestMapping(value = {"list", ""})
	public String list(BtgConJiaContractDetail btgConJiaContractDetail, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<BtgConJiaContractDetail> page = btgConJiaContractDetailService.findPage(new Page<BtgConJiaContractDetail>(request, response), btgConJiaContractDetail); 
		model.addAttribute("page", page);
		return "modules/contract/btgConJiaContractDetailList";
	}

	@RequiresPermissions("contract:btgConJiaContractDetail:view")
	@RequestMapping(value = "form")
	public String form(BtgConJiaContractDetail btgConJiaContractDetail, Model model) {
		model.addAttribute("btgConJiaContractDetail", btgConJiaContractDetail);
		return "modules/contract/btgConJiaContractDetailForm";
	}

	@RequiresPermissions("contract:btgConJiaContractDetail:edit")
	@RequestMapping(value = "save")
	public String save(BtgConJiaContractDetail btgConJiaContractDetail, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, btgConJiaContractDetail)){
			return form(btgConJiaContractDetail, model);
		}
		btgConJiaContractDetailService.save(btgConJiaContractDetail);
		addMessage(redirectAttributes, "保存甲方合同添加楼栋成功");
		return "redirect:"+Global.getAdminPath()+"/contract/btgConJiaContractDetail/?repage";
	}
	
	@RequiresPermissions("contract:btgConJiaContractDetail:edit")
	@RequestMapping(value = "delete")
	public String delete(BtgConJiaContractDetail btgConJiaContractDetail, RedirectAttributes redirectAttributes) {
		btgConJiaContractDetailService.delete(btgConJiaContractDetail);
		addMessage(redirectAttributes, "删除甲方合同添加楼栋成功");
		return "redirect:"+Global.getAdminPath()+"/contract/btgConJiaContractDetail/?repage";
	}

}