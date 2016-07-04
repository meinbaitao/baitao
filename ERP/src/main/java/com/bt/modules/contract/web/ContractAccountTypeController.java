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

import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.bt.modules.contract.entity.ContractAccountType;
import com.bt.modules.contract.service.ContractAccountTypeService;

/**
 * 台账类别Controller
 * @author yhh
 * @version 2016-01-21
 */
@Controller
@RequestMapping(value = "${adminPath}/contract/contractAccountType")
public class ContractAccountTypeController extends BaseController {
	
	private String viewFlag = "0";

	@Autowired
	private ContractAccountTypeService contractAccountTypeService;
	
	@ModelAttribute
	public ContractAccountType get(@RequestParam(required=false) String id) {
		ContractAccountType entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = contractAccountTypeService.get(id);
		}
		if (entity == null){
			entity = new ContractAccountType();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(ContractAccountType contractAccountType, HttpServletRequest request, 
			HttpServletResponse response, Model model) {
		return "modules/contract/verifyRequired";
	}
	
	@ResponseBody
	@RequestMapping(value="findTypeByParentId")
	public List<ContractAccountType> findTypeByParentId(@RequestParam String parentId, HttpServletRequest
			request, HttpServletResponse response){
		return contractAccountTypeService.findTypeByParentId(parentId);
	}

	@ResponseBody
	@RequestMapping(value="findList")
	public List<ContractAccountType> findList(ContractAccountType contractAccountType,
			HttpServletRequest request, HttpServletResponse response){
		contractAccountType.setViewFlag(viewFlag);
		return contractAccountTypeService.findList(contractAccountType);
	}
	
	@ResponseBody
	@RequestMapping(value="getById")
	public ContractAccountType getById(ContractAccountType contractAccountType,
			HttpServletRequest request, HttpServletResponse response){
		return contractAccountType;
	}
	
}