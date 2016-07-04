/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.logistics.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.bt.modules.logistics.entity.LogisticsDetail;
import com.bt.modules.logistics.service.LogisticsDetailService;

/**
 * 发货清单Controller
 * @author yhh
 * @version 2015-11-05
 */
@Controller
@RequestMapping(value = "${adminPath}/logistics/logisticsDetail")
public class LogisticsDetailController extends BaseController {

	@Autowired
	private LogisticsDetailService logisticsDetailService;
	
	@ModelAttribute
	public LogisticsDetail get(@RequestParam(required=false) String id) {
		LogisticsDetail entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = logisticsDetailService.get(id);
		}
		if (entity == null){
			entity = new LogisticsDetail();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(LogisticsDetail logisticsDetail, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<LogisticsDetail> page = logisticsDetailService.findPage(new Page<LogisticsDetail>(request, response), logisticsDetail); 
		model.addAttribute("page", page);
		return "modules/logistics/logisticsDetailList";
	}

	@RequestMapping(value = "form")
	public String form(LogisticsDetail logisticsDetail, Model model) {
		model.addAttribute("logisticsDetail", logisticsDetail);
		return "modules/logistics/logisticsDetailForm";
	}

	@RequestMapping(value = "save")
	public String save(LogisticsDetail logisticsDetail, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, logisticsDetail)){
			return form(logisticsDetail, model);
		}
		logisticsDetailService.save(logisticsDetail);
		addMessage(redirectAttributes, "保存发货清单成功");
		return "redirect:"+Global.getAdminPath()+"/logistics/logisticsDetail/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(LogisticsDetail logisticsDetail, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		//获取前端勾选项
		String[] vCheckd = request.getParameterValues("vCheckd");
		if(vCheckd != null && vCheckd.length > 0){
			String[] logisticsDetailId = vCheckd[0].split(",");
			if(logisticsDetailId != null && logisticsDetailId.length > 0){
				for (int i = 0; i < logisticsDetailId.length; i++) {
					logisticsDetail = logisticsDetailService.get(logisticsDetailId[i]);
					if(logisticsDetail != null){
						logisticsDetailService.delete(logisticsDetail);
						addMessage(redirectAttributes, "删除发货清单成功");
					}
				}
			}
		}else{
			addMessage(redirectAttributes, "删除发货清单失败");
		}
		return "redirect:"+Global.getAdminPath()+"/logistics/logisticsDetail/?repage";
	}

}