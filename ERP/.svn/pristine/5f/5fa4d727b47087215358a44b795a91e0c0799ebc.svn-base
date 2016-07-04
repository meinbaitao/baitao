/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.financereport.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.bt.modules.financereport.entity.BtgFinancereport;
import com.bt.modules.financereport.service.BtgFinancereportService;

/**
 * 分项目财务报表Controller
 * @author lky
 * @version 2015-12-21
 */
@Controller
@RequestMapping(value = "${adminPath}/financereport/btgFinancereport")
public class BtgFinancereportController extends BaseController {

	@Autowired
	private BtgFinancereportService btgFinancereportService;
	
	@ModelAttribute
	public BtgFinancereport get(@RequestParam(required=false) String id) {
		BtgFinancereport entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = btgFinancereportService.get(id);
		}
		if (entity == null){
			entity = new BtgFinancereport();
		}
		return entity;
	}
	
	//@RequiresPermissions("financereport:btgFinancereport:view")
	/*@RequestMapping(value = {"list", ""})*/
/*	public String list(BtgFinancereport btgFinancereport, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<BtgFinancereport> page = btgFinancereportService.findPage(new Page<BtgFinancereport>(request, response), btgFinancereport); 
		model.addAttribute("page", page);
		return "modules/financereport/btgFinancereportList";
	}*/
	@RequestMapping(value = {"list", ""})
	public String list(BtgFinancereport btgFinancereport, HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		int pageno=1;
		String no = request.getParameter("pageNo"); 
		
		if(StringUtils.isNumeric(no))
		{
			pageno=Integer.parseInt(no);
		}
		//Page<BtgFinancereport> page = btgFinancereportService.findPage(new Page<BtgFinancereport>(request, response), btgFinancereport); 
		Map<String, Integer> parameterMap = new HashMap<String, Integer>();
		    parameterMap.put("p_curr_page", pageno);
	        parameterMap.put("total_rows", -1);
	        List<BtgFinancereport> list=btgFinancereportService.addList(parameterMap);
	        Integer result = parameterMap.get("total_rows");
	        //Page<BtgFinancereport> page = btgFinancereportService.findPageFlag(new Page<BtgFinancereport>(request, response), btgFinancereport,list); 
	        Page page =new Page(pageno,30,result,list);
	       /* page.setPageNo(pageNo);*/
	        page.setList(list);
		    model.addAttribute("page", page);
		return "modules/financereport/btgFinancereportList";
	}
	//@RequiresPermissions("financereport:btgFinancereport:view")
	@RequestMapping(value = "form")
	public String form(BtgFinancereport btgFinancereport, Model model) {
		model.addAttribute("btgFinancereport", btgFinancereport);
		return "modules/financereport/btgFinancereportForm";
	}

	//@RequiresPermissions("financereport:btgFinancereport:edit")
	@RequestMapping(value = "save")
	public String save(BtgFinancereport btgFinancereport, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, btgFinancereport)){
			return form(btgFinancereport, model);
		}
		btgFinancereportService.save(btgFinancereport);
		addMessage(redirectAttributes, "保存分项目财务报表成功");
		return "redirect:"+Global.getAdminPath()+"/financereport/btgFinancereport/?repage";
	}
	
	@RequiresPermissions("financereport:btgFinancereport:edit")
	@RequestMapping(value = "delete")
	public String delete(BtgFinancereport btgFinancereport, RedirectAttributes redirectAttributes) {
		btgFinancereportService.delete(btgFinancereport);
		addMessage(redirectAttributes, "删除分项目财务报表成功");
		return "redirect:"+Global.getAdminPath()+"/financereport/btgFinancereport/?repage";
	}

}