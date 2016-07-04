package com.thinkgem.jeesite.modules.sys.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.Whitelists;
import com.thinkgem.jeesite.modules.sys.service.WhitelistsService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;


/**
 * 白名单Controller
 * @author xujianpeng
 * @version 2016-04-28
 */
@Controller
@RequestMapping(value = "${adminPath}/whitelists")
public class WhitelistsController extends BaseController {

	@Autowired
	private WhitelistsService whitelistsService;
	
	@ModelAttribute
	public Whitelists get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return whitelistsService.get(id);
		}else{
			return new Whitelists();
		}
	}
	
	/**
	 * 查询白名单列表
	 * @param whitelists
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"list", ""})
	public String list(Whitelists whitelists, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Whitelists> page = whitelistsService.findPage(new Page<Whitelists>(request,response), whitelists);
        model.addAttribute("page", page);
		return "modules/sys/whitelistsList";
	}
	
	/**
	 * 添加白名单Form
	 * @param whitelists
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "form")
	public String form(Whitelists whitelists, Model model) {
		
		if(StringUtils.isNotBlank(whitelists.getRoleEnName())){
			//设置回显角色选中
			whitelists.setRoleIdList(whitelists.getRoleEnName());
		}
		
		model.addAttribute("allRoles", UserUtils.getRoleList());
		
		//ID不等于空则为修改
		if(StringUtils.isNotBlank(whitelists.getId())){
			model.addAttribute("flag","update");
		}
		
		return "modules/sys/whitelistsForm";
	}
	
	
	/**
	 * 保存白名单
	 * @param whitelists
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "save")
	public String save(Whitelists whitelists, HttpServletRequest request, Model model,RedirectAttributes redirectAttributes) {
		
		StringBuilder sb = new StringBuilder(); 
		for (Role role : whitelists.getRoleNameList()) {
			sb.append(role.getId()+",");
		}
		whitelists.setRoleEnName(StringUtils.substringBeforeLast(sb.toString(),","));
		whitelistsService.save(whitelists);
		
		
		addMessage(redirectAttributes,"保存'" + whitelists.getName() + "'成功");
		return "redirect:" + adminPath + "/whitelists/list";
	}
	
	/**
	 * 删除白名单
	 * @param whitelists
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "delete")
	public String delete(Whitelists whitelists, Model model,RedirectAttributes redirectAttributes) {
		
		whitelistsService.delete(whitelists);
		addMessage(redirectAttributes,"删除'" + whitelists.getName() + "'成功");
		return "redirect:" + adminPath + "/whitelists/list";
	}
	
	/**
	 * 设置启用、停用白名单
	 * @param whitelists
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "setting")
	public String setting(Whitelists whitelists, Model model,RedirectAttributes redirectAttributes) {
		
		whitelistsService.setting(whitelists);
		addMessage(redirectAttributes,"白名单'" + (StringUtils.equals(whitelists.getStatus(),"0")?"关闭":"启用") + "'成功");
		return "redirect:" + adminPath + "/whitelists/list";
	}
	
	/**
	 * 根据白名单名称查找对应的角色英文名 
	 * @param name
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "count")
	public String count(Whitelists whitelists, HttpServletRequest request,HttpServletResponse response){
		
		return renderString(response,whitelistsService.findWhitelistByName(whitelists));
	}
}
