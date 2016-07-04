/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.stoneSchedule.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bt.common.exceptions.BusinessException;
import com.bt.modules.stoneSchedule.service.StoneScheduleService;
import com.bt.modules.utils.RequestUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 石材进度跟进Controller
 * @author xiaocai
 * @version 2015年12月2日
 */
@Controller
@RequestMapping(value = "${adminPath}/stoneSchedule/stoneSchedule")
public class StoneScheduleController extends BaseController {

	@Autowired
	private StoneScheduleService stoneScheduleService;	//石材进度跟进
	
	
	/**
	 * 以项目为基础分组统计全部的下料单的箱数据
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"getListForProject"})
	public String getListForProject(HttpServletRequest request,HttpServletResponse response,Model model) {
		String projectName = request.getParameter("projectName");
		Map<String,Object> map = stoneScheduleService.getListForProject(projectName);
		model.addAttribute("map", map);
		model.addAttribute("projectName", projectName);
		return "modules/stoneSchedule/getListForProject";
	}
	/**
	 * 根据二级项目信息获取对应的数据信息
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws BusinessException 
	 */
	@RequestMapping(value = {"getListForSubProject"})
	public String getListForSubProject(HttpServletRequest request,HttpServletResponse response,Model model) throws BusinessException {
		String projectName = RequestUtils.getParameter(request, "projectName");
		String building = RequestUtils.getParameter(request, "building");//request.getParameter("building");
		Map<String,Object> map = stoneScheduleService.getListForStoneScheduleToSub(projectName,building);
		model.addAttribute("map", map);
		model.addAttribute("projectName", projectName);
		model.addAttribute("building", building);
		return "modules/stoneSchedule/getListForSubProject";
	}
}