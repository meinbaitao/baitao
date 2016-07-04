/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.report.labor.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bt.modules.report.labor.entity.LaborReport;
import com.bt.modules.report.labor.service.LaborReportService;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 劳务报表Controller
 * @author xiaocai
 * @version 2016-4-28
 */
@Controller
@RequestMapping(value = "${adminPath}/report/labor")
public class LaborReportController extends BaseController {

	@Autowired
	private LaborReportService laborReportService;

	/**
	 * 项目劳务待调配列表数据
	 * @param project
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"list",""})
	public String list(LaborReport laborReport,HttpServletRequest request,HttpServletResponse response,Model model) {
		Page<LaborReport> page = laborReportService.findPage(new Page<LaborReport>(request, response), laborReport);//projWeeklyReportService.findMyWeekReport(new Page<ProjWeeklyReport>(request, response), projWeeklyReport);
		model.addAttribute("page", page);
		model.addAttribute("laborReport", laborReport);
		return "modules/report/labor/laborReportList";
	}


}