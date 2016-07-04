package com.bt.modules.project.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bt.modules.contract.entity.JiaContract;
import com.bt.modules.contract.service.JiaContractService;
import com.bt.modules.project.entity.Project;
import com.bt.modules.project.entity.Subproject;
import com.bt.modules.project.service.ProjectService;
import com.bt.modules.project.service.SubProjectService;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.web.BaseController;


/**
 * 一级项目信息
 * @author xjp
 * @version 2015-8-1
 */
@Controller
@RequestMapping(value = "${adminPath}/subproject")
public class SubProjectTestController extends BaseController {
	/**
	 * 二级项目Service
	 */
	@Autowired
	private SubProjectService subProjectService;

	
	
	/**
	 * 页面测试
	 * @param project
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("subproject:view")
	@RequestMapping(value = {"list", ""})
	public String list(Subproject subproject,HttpServletRequest request,HttpServletResponse response,Model model) {
		//查询主项列表，如果有名称参数则带入名称参数查询列表
		//Page<Project> page = projectService.findPage(new Page<Project>(request, response), project); 
		//model.addAttribute("page", page);
		return "modules/project/subProjectList";
	}
		
}
