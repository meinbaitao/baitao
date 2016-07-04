/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bt.modules.contract.entity.Laborcontract;
import com.bt.modules.contract.service.LaborcontractBillService;
import com.bt.modules.utils.CommonStatus;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 劳务合同 变更日志 Controller
 * @author  xiaocai
 * @version 2016-5-5
 */
@Controller
@RequestMapping(value = "${adminPath}/contract/laborcontract/bill")
public class LaborcontractBillController extends BaseController {

	@Autowired
	private LaborcontractBillService laborcontractBillService;	//劳务日志
	
	/**
	 * 查看劳务合同的变更日志
	 * @param laborcontract
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "list")
	public String laborcontractBillList(Laborcontract laborcontract, HttpServletRequest request, HttpServletResponse response, Model model) {
		laborcontract.getExtraData().put("opertType", CommonStatus.UPDATE_LOG_CHANGE);
		Page<Laborcontract> page = laborcontractBillService.findPage(new Page<Laborcontract>(request, response), laborcontract); 
		model.addAttribute("page", page);
		return "modules/contract/laborcontractBillList";
	}
	
}