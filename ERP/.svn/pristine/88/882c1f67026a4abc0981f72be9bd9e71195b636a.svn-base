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
import com.bt.modules.contract.entity.ManufContractDetail;
import com.bt.modules.contract.entity.PurchasingContractDetail;
import com.bt.modules.contract.service.PurchasingContractDetailService;
import com.bt.modules.material.entity.Material;
import com.bt.modules.material.service.MaterialService;

/**
 * purchasingController
 * @author yhh
 * @version 2015-08-11
 */
@Controller
@RequestMapping(value = "${adminPath}/contract/purchasingContractDetail")
public class PurchasingContractDetailController extends BaseController {

	@Autowired
	private PurchasingContractDetailService purchasingContractDetailService;
	
	@Autowired
	private MaterialService materialService;
	
	@ModelAttribute
	public PurchasingContractDetail get(@RequestParam(required=false) String id) {
		PurchasingContractDetail entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = purchasingContractDetailService.get(id);
		}
		if (entity == null){
			entity = new PurchasingContractDetail();
		}
		return entity;
	}
	
	@RequestMapping(value = "list")
	public String list(PurchasingContractDetail purchasingContractDetail, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<PurchasingContractDetail> page = purchasingContractDetailService.findPage(new Page<PurchasingContractDetail>(request, response), purchasingContractDetail); 
		model.addAttribute("page", page);
		return "modules/contract/purchasingContractDetailList";
	}

	@RequestMapping(value = "form")
	public String form(PurchasingContractDetail purchasingContractDetail, Model model) {
		model.addAttribute("materialList", materialService.findList(new Material()));
		model.addAttribute("purchasingContractDetail", purchasingContractDetail);
		return "modules/contract/purchasingContractDetailForm";
	}

	@RequestMapping(value = "save")
	public String save(PurchasingContractDetail purchasingContractDetail, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, purchasingContractDetail)){
			addMessage(redirectAttributes, "保存采购明细失败,请重新操作");
		}
		purchasingContractDetailService.save(purchasingContractDetail);
		addMessage(redirectAttributes, "保存采购明细成功");
		return "redirect:"+Global.getAdminPath()+"/contract/purchasingContractBase/list";
	}
	
	@RequestMapping(value = "delete")
	public String delete(PurchasingContractDetail purchasingContractDetail, RedirectAttributes redirectAttributes) {
		purchasingContractDetailService.delete(purchasingContractDetail);
		addMessage(redirectAttributes, "删除采购明细成功");
		return "redirect:"+Global.getAdminPath()+"/contract/purchasingContractBase/list";
	}

	@ResponseBody
	@RequestMapping(value="getDetail")
	public List<PurchasingContractDetail> getDetail(PurchasingContractDetail purchasingC, HttpServletRequest request, HttpServletResponse response){
		purchasingC.setContractId(request.getParameter("contractId"));
		return purchasingContractDetailService.findList(purchasingC);
	}
	
	@ResponseBody
	@RequestMapping(value="getSingleDetail")
	public PurchasingContractDetail getSingleDeatil(PurchasingContractDetail purchasingC, HttpServletRequest request, HttpServletResponse response){
		purchasingC.setId(request.getParameter("id"));
		return purchasingContractDetailService.get(purchasingC);
	}
	

}