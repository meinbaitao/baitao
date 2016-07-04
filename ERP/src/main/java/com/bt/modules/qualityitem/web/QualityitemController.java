package com.bt.modules.qualityitem.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bt.modules.qualityitem.entity.Qualityitem;
import com.bt.modules.qualityitem.service.QualityitemService;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 质保金条款
 * @author dy
 * @version 2015-8-1
 */
@Controller
@RequestMapping(value = "${adminPath}/qualityitem")
public class QualityitemController extends BaseController { 

	/**
	 * 质保金条款Service
	 */
	@Autowired
	private QualityitemService qualityitemService;

	/**
	 * 分页查询质保金信息
	 * 
	 * @param qualityitem
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	// @RequiresPermissions("qualityitem:view")
	@RequestMapping(value = { "list", "" })
	public String list(Qualityitem qualityitem, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		// 查询主项列表，如果有名称参数则带入名称参数查询列表
		Page<Qualityitem> page = qualityitemService.findPage(new Page<Qualityitem>(request,
				response), qualityitem);
		model.addAttribute("page", page);
		return "modules/qualityitem/qualityitemList";
	}

	/**
	 * 添加
	 * 
	 * @param qualityitem
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "save")
	public String add(Qualityitem qualityitem, Model model) {
		if("update".equals(qualityitem.getFlag())){
			qualityitemService.update(qualityitem);
			return "redirect:" + adminPath + "/qualityitem/list";
		}else{
			qualityitem.setId(IdGen.uuid());
			qualityitemService.save(qualityitem);
			return "redirect:" + adminPath + "/qualityitem/list";
		}
	}
	
	
	
	/**
	 * update
	 * 
	 * @param qualityitem
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "update")
	public String update(Qualityitem qualityitem, Model model,HttpServletRequest request) {
		qualityitem.setId(request.getParameter("id"));
		Qualityitem data = qualityitemService.get(qualityitem);
		data.setFlag("update");
		
		model.addAttribute("flag", "update");
		model.addAttribute("qualityitem", data);
		return "modules/qualityitem/qualityitemForm";
	}
	
	
	/**
	 * update
	 * 
	 * @param qualityitem
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "getbyitem")
	@ResponseBody
	public Map<String,Object> getbyitem(Qualityitem qualityitem, Model model,HttpServletRequest request) {
		Map<String,Object> map = new HashMap<String,Object>();
		String item = request.getParameter("item");
		Qualityitem data = null;
		if(null != item && !"".equals(item)){
			qualityitem.setItem(item);
			data = qualityitemService.getbyitem(qualityitem);
		}
		map.put("qualityitem", data);
		return map;
	}
	
	
	/**
	 * get
	 * 
	 * @param qualityitem
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "getbyid")
	@ResponseBody
	public Map<String,Object> get(Qualityitem qualityitem, Model model,HttpServletRequest request) {
		Map<String,Object> map = new HashMap<String,Object>();
		String item = request.getParameter("qualityitem");
		Qualityitem data = new Qualityitem();
		if(null != item && !"".equals(item)){
			data = qualityitemService.get(item);
		}
		map.put("qualityitem", data);
		return map;
	}

	/**
	 * 跳转添加页面
	 * 
	 * @param qualityitem
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "form")
	public String form(Qualityitem qualityitem, Model model) {
		qualityitem.setId(IdGen.uuid());
		model.addAttribute("qualityitem", qualityitem);
		model.addAttribute("flag", "add");
		return "modules/qualityitem/qualityitemForm";
	}


	/**
	 * 删除一级项目信息、二级项目信息
	 * 
	 * @param qualityitem
	 * @param redirectAttributes
	 * @return
	 */
	@Transactional(readOnly = false)
	@RequestMapping(value = "delete")
	public String delete(Qualityitem qualityitem, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {

		qualityitem.setId(request.getParameter("id"));
		qualityitemService.delete(qualityitem);

		addMessage(redirectAttributes, "删除项目成功");
		return "redirect:" + adminPath + "/qualityitem/list";
	}

}
