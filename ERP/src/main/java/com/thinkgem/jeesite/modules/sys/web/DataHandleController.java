/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.web;

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
import com.thinkgem.jeesite.modules.sys.entity.DataHandle;
import com.thinkgem.jeesite.modules.sys.service.DataHandleService;

/**
 * 数据操作记录Controller
 * @author yhh
 * @version 2016-03-11
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/dataHandle")
public class DataHandleController extends BaseController {

	@Autowired
	private DataHandleService dataHandleService;
	
	@ModelAttribute
	public DataHandle get(@RequestParam(required=false) String id) {
		DataHandle entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = dataHandleService.get(id);
		}
		if (entity == null){
			entity = new DataHandle();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(DataHandle dataHandle, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DataHandle> page = dataHandleService.findPage(new Page<DataHandle>(request, response), dataHandle); 
		model.addAttribute("page", page);
		return "modules/sys/dataHandleList";
	}


}