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
import com.bt.modules.contract.entity.AccCarriageContractWayDetail;
import com.bt.modules.contract.service.AccCarriageContractWayDetailService;

/**
 * 辅料运输合同明细2Controller
 * @author yhh
 * @version 2015-08-11
 */
@Controller
@RequestMapping(value = "${adminPath}/contract/accCarriageContractWayDetail")
public class AccCarriageContractWayDetailController extends BaseController {

	@Autowired
	private AccCarriageContractWayDetailService accCarriageContractWayDetailService;
	
	@ModelAttribute
	public AccCarriageContractWayDetail get(@RequestParam(required=false) String id) {
		AccCarriageContractWayDetail entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = accCarriageContractWayDetailService.get(id);
		}
		if (entity == null){
			entity = new AccCarriageContractWayDetail();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(AccCarriageContractWayDetail accCarriageContractWayDetail, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<AccCarriageContractWayDetail> page = accCarriageContractWayDetailService.findPage(new Page<AccCarriageContractWayDetail>(request, response), accCarriageContractWayDetail); 
		model.addAttribute("page", page);
		return "modules/contract/accCarriageContractWayDetailList";
	}

	@RequestMapping(value = "form")
	public String form(AccCarriageContractWayDetail accCarriageContractWayDetail, Model model) {
		model.addAttribute("accCarriageContractWayDetail", accCarriageContractWayDetail);
		return "modules/contract/accCarriageContractWayDetailForm";
	}

	@RequestMapping(value = "save")
	public String save(AccCarriageContractWayDetail accCarriageContractWayDetail, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, accCarriageContractWayDetail)){
			addMessage(redirectAttributes, "保存辅料运输合同运费明细失败,请重新操作");
		}
		accCarriageContractWayDetailService.save(accCarriageContractWayDetail);
		addMessage(redirectAttributes, "保存辅料运输合同路线明细成功");
		return "redirect:"+Global.getAdminPath()+"/contract/accCarriageContractBase/list";
	}
	
	@RequestMapping(value = "delete")
	public String delete(AccCarriageContractWayDetail accCarriageContractWayDetail, RedirectAttributes redirectAttributes) {
		accCarriageContractWayDetailService.delete(accCarriageContractWayDetail);
		addMessage(redirectAttributes, "删除辅料运输合同路线明细成功");
		return "redirect:"+Global.getAdminPath()+"/contract/accCarriageContractBase/list";
	}


	@ResponseBody
	@RequestMapping(value="getDetail")
	public List<AccCarriageContractWayDetail> getDetail(AccCarriageContractWayDetail accC, HttpServletRequest request, HttpServletResponse response){
		accC.setContractId(request.getParameter("contractId"));
		return accCarriageContractWayDetailService.findList(accC);
	}
	
	@ResponseBody
	@RequestMapping(value="getSingleDetail")
	public AccCarriageContractWayDetail getSingleDeatil(AccCarriageContractWayDetail accC, HttpServletRequest request, HttpServletResponse response){
		accC.setId(request.getParameter("id"));
		return accCarriageContractWayDetailService.get(accC);
	}
}