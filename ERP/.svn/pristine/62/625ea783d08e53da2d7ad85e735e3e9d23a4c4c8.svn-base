/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.bt.modules.contract.entity.ContractAccount;
import com.bt.modules.contract.service.ContractAccountService;

/**
 * 合同台账Controller
 * @author yhh
 * @version 2015-12-01
 */
@Controller
@RequestMapping(value = "${adminPath}/contract/contractAccount")
public class ContractAccountController extends BaseController {

	@Autowired
	private ContractAccountService contractAccountService;
	
	@RequestMapping(value = {"list", ""})
	public String list(ContractAccount contractAccount, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ContractAccount> page = contractAccountService.findPage(new Page<ContractAccount>(request, response), contractAccount); 
		model.addAttribute("page", page);
		return "modules/contract/contractAccountList";
	}

	/**
	 * 由上级id获取所有分类
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="findTypeByParentId")
	public List<Map<String,Object>> findTypeByParentId(HttpServletRequest request) {
		String parentId = request.getParameter("id");
		return contractAccountService.findTypeByParentId(parentId);
	}
	
}