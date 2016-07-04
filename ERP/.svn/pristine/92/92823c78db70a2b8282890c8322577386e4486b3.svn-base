/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.supplier.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bt.modules.supplier.entity.Supplier;
import com.bt.modules.supplier.entity.UserSuppMapping;
import com.bt.modules.supplier.service.UserSuppMappingService;
import com.bt.modules.utils.CommonConstant;
import com.google.common.base.Suppliers;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 供应商Controller
 * @version 2015-08-18
 */
@Controller
@RequestMapping(value = "${adminPath}/supplier/userSuppMapping")
public class UserSuppMappingController extends BaseController {

	@Autowired
	private UserSuppMappingService userSuppMappingService;
	
	@RequestMapping(value = {"userSuppMappingList"})
	public String list(UserSuppMapping usm, HttpServletRequest request, HttpServletResponse response, Model model) {
		String name = request.getParameter("name");
		Supplier supp = new Supplier();
		supp.setSupplierType(CommonConstant.Supp_JGC);
		supp.setName(name);
		usm.setSupp(supp);
		Page<UserSuppMapping> page = userSuppMappingService.userSuppMappingList(new Page<UserSuppMapping>(request, response), usm); 
		model.addAttribute("page", page);
		return "modules/supplier/userSuppMappingList";
	}
	/**
	 * 保存关联数据
	 * @param usm
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"saveUSM"})
	public String saveUSM(HttpServletRequest request, HttpServletResponse response) {
		String uid = request.getParameter("uid");	//获取生产经理id
		String ids = request.getParameter("ids");	//获取列表id组合
		String[] idArr = ids.split(",");
		List<UserSuppMapping> listUSM=new ArrayList<UserSuppMapping>();
		
		for(String id:idArr){
			UserSuppMapping usm = new UserSuppMapping();
			usm.setId(IdGen.uuid());
			usm.setSupp(new Supplier(id));
			usm.setUser(new User(uid));
			
			listUSM.add(usm);
		}
		//批量插入相关的数据
		userSuppMappingService.batchInsert(listUSM);
		return "redirect:"+Global.getAdminPath()+"/supplier/userSuppMapping/userSuppMappingList";
	}
//	@ModelAttribute
//	public Suppliers get(@RequestParam(required=false) String id) {
//		Suppliers entity = null;
//		if (StringUtils.isNotBlank(id)){
//			entity = suppliersService.get(id);
//		}
//		if (entity == null){
//			entity = new Suppliers();
//		}
//		return entity;
//	}
	
//	@RequestMapping(value = {"list", ""})
//	public String list(Suppliers suppliers, HttpServletRequest request, HttpServletResponse response, Model model) {
//		Page<Suppliers> page = suppliersService.findPage(new Page<Suppliers>(request, response), suppliers); 
//		model.addAttribute("page", page);
//		return "modules/suppliers/suppliersList";
//	}
//
//	@RequestMapping(value = "form")
//	public String form(Suppliers suppliers, Model model) {
//		model.addAttribute("suppliers", suppliers);
//		return "modules/suppliers/suppliersForm";
//	}
//
//	@RequestMapping(value = "save")
//	public String save(Suppliers suppliers, Model model, RedirectAttributes redirectAttributes) {
////		if (!beanValidator(model, suppliers)){
////			return form(suppliers, model);
////		}
//		suppliersService.save(suppliers);
//		addMessage(redirectAttributes, "保存供应商成功");
//		return "redirect:"+Global.getAdminPath()+"/suppliers/list/?repage";
//	}
//	
//	@RequestMapping(value = "delete")
//	public String delete(Suppliers suppliers, RedirectAttributes redirectAttributes) {
//		suppliersService.delete(suppliers);
//		addMessage(redirectAttributes, "删除供应商成功");
//		return "redirect:"+Global.getAdminPath()+"/suppliers/list/?repage";
//	}
//
//	@ResponseBody
//	@RequestMapping(value="getByName")
//	public Suppliers getByName(Suppliers suppliers, HttpServletRequest request, HttpServletResponse response){
//		suppliers.setName(request.getParameter("name"));
//		return suppliersService.getByName(suppliers);
//	}
//	
//	@ResponseBody
//	@RequestMapping(value="getById")
//	public Suppliers getById(Suppliers suppliers, HttpServletRequest request, HttpServletResponse response){
//		suppliers.setName(request.getParameter("id"));
//		return suppliersService.getByName(suppliers);
//	}
}