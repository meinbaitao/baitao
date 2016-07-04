/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.orbom.web;

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
import com.bt.modules.orbom.entity.OrderBomBox;
import com.bt.modules.orbom.service.OrderBomBoxService;

/**
 * 下料单箱信息表Controller
 * @author ljp
 * @version 2015-08-07
 */
@Controller
@RequestMapping(value = "${adminPath}/orbom/orderBomBox")
public class OrderBomBoxController extends BaseController {

	@Autowired
	private OrderBomBoxService orderBomBoxService;
	
	@ModelAttribute
	public OrderBomBox get(@RequestParam(required=false) String id) {
		OrderBomBox entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = orderBomBoxService.get(id);
		}
		if (entity == null){
			entity = new OrderBomBox();
		}
		return entity;
	}
	
	@RequiresPermissions("orbom:orderBomBox:view")
	@RequestMapping(value = {"list", ""})
	public String list(OrderBomBox orderBomBox, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OrderBomBox> page = orderBomBoxService.findPage(new Page<OrderBomBox>(request, response), orderBomBox); 
		model.addAttribute("page", page);
		return "modules/orbom/orderBomBoxList";
	}

	@RequiresPermissions("orbom:orderBomBox:view")
	@RequestMapping(value = "form")
	public String form(OrderBomBox orderBomBox, Model model) {
		model.addAttribute("orderBomBox", orderBomBox);
		return "modules/orbom/orderBomBoxForm";
	}

	@RequiresPermissions("orbom:orderBomBox:edit")
	@RequestMapping(value = "save")
	public String save(OrderBomBox orderBomBox, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, orderBomBox)){
			return form(orderBomBox, model);
		}
		orderBomBoxService.save(orderBomBox);
		addMessage(redirectAttributes, "保存下料单箱信息表成功");
		return "redirect:"+Global.getAdminPath()+"/orbom/orderBomBox/?repage";
	}
	
	@RequiresPermissions("orbom:orderBomBox:edit")
	@RequestMapping(value = "delete")
	public String delete(OrderBomBox orderBomBox, RedirectAttributes redirectAttributes) {
		orderBomBoxService.delete(orderBomBox);
		addMessage(redirectAttributes, "删除下料单箱信息表成功");
		return "redirect:"+Global.getAdminPath()+"/orbom/orderBomBox/?repage";
	}
	

}