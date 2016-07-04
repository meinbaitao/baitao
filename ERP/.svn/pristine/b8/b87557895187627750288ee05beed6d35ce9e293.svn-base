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
import com.bt.modules.contract.entity.AccCarriageContractBase;
import com.bt.modules.contract.entity.AccCarriageContractPriceDetail;
import com.bt.modules.contract.entity.StoneCarriageContractDetail;
import com.bt.modules.contract.service.AccCarriageContractPriceDetailService;

/**
 * 辅料运输合同明细1Controller
 * @author yhh
 * @version 2015-08-11
 */
@Controller
@RequestMapping(value = "${adminPath}/contract/accCarriageContractPriceDetail")
public class AccCarriageContractPriceDetailController extends BaseController {

	@Autowired
	private AccCarriageContractPriceDetailService accCarriageContractPriceDetailService;
	
	@ModelAttribute
	public AccCarriageContractPriceDetail get(@RequestParam(required=false) String id) {
		AccCarriageContractPriceDetail entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = accCarriageContractPriceDetailService.get(id);
		}
		if (entity == null){
			entity = new AccCarriageContractPriceDetail();
		}
		return entity;
	}
	
	/**
	 * 判断记录是否存在
	 * @param id
	 * @return
	 */
	public boolean isExist(String id){
		AccCarriageContractPriceDetail entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = accCarriageContractPriceDetailService.get(id);
		}
		if(entity == null){
			return false;
		}
		return true;
		
	}
	
	@RequestMapping(value = "list")
	public String list(AccCarriageContractPriceDetail accCarriageContractPriceDetail, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<AccCarriageContractPriceDetail> page = accCarriageContractPriceDetailService.findPage(new Page<AccCarriageContractPriceDetail>(request, response), accCarriageContractPriceDetail); 
		model.addAttribute("page", page);
		return "modules/contract/accCarriageContractPriceDetailList";
	}

	@RequestMapping(value = "form")
	public String form(AccCarriageContractPriceDetail accCarriageContractPriceDetail, Model model) {
		model.addAttribute("accCarriageContractPriceDetail", accCarriageContractPriceDetail);
		return "modules/contract/accCarriageContractPriceDetailForm";
	}

	@RequestMapping(value = "save")
	public String save(AccCarriageContractPriceDetail accCarriageContractPriceDetail, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, accCarriageContractPriceDetail)){
			addMessage(redirectAttributes, "保存辅料运输合同运费明细失败,请重新操作");
		}
		
		if(isExist(accCarriageContractPriceDetail.getId())){
			accCarriageContractPriceDetailService.update(accCarriageContractPriceDetail);
		}else{
			accCarriageContractPriceDetailService.save(accCarriageContractPriceDetail);
		}
		
		accCarriageContractPriceDetailService.save(accCarriageContractPriceDetail);
		addMessage(redirectAttributes, "保存辅料运输合同运费明细成功");
		return "redirect:"+Global.getAdminPath()+"/contract/accCarriageContractBase/list";
	}
	
	@RequestMapping(value = "delete")
	public String delete(AccCarriageContractPriceDetail accCarriageContractPriceDetail, RedirectAttributes redirectAttributes) {
		accCarriageContractPriceDetailService.delete(accCarriageContractPriceDetail);
		addMessage(redirectAttributes, "删除辅料运输合同运费明细成功");
		return "redirect:"+Global.getAdminPath()+"/contract/accCarriageContractBase/list";
	}

	@ResponseBody
	@RequestMapping(value="getDetail")
	public List<AccCarriageContractPriceDetail> getDetail(AccCarriageContractPriceDetail accC, HttpServletRequest request, HttpServletResponse response){
		accC.setContractId(request.getParameter("contractId"));
		return accCarriageContractPriceDetailService.findList(accC);
	}
	
	
	@ResponseBody
	@RequestMapping(value="getSingleDetail")
	public AccCarriageContractPriceDetail getSingleDeatil(AccCarriageContractPriceDetail accC, HttpServletRequest request, HttpServletResponse response){
		accC.setId(request.getParameter("id"));
		return accCarriageContractPriceDetailService.get(accC);
	}
	
}