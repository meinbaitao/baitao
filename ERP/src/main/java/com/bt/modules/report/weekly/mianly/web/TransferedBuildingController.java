/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.report.weekly.mianly.web;


import com.bt.modules.report.common.WeeklyReportHelper;
import com.bt.modules.report.weekly.mianly.entity.TransferedBuilding;
import com.bt.modules.report.weekly.mianly.service.TransferedBuildingService;
import com.thinkgem.jeesite.common.web.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 已移交楼栋Controller
 * @author jinyuanf
 * @version 2015-11-25
 */
@Controller
@RequestMapping(value = "${adminPath}/report/weekly/transferedBuilding")
public class TransferedBuildingController extends BaseController {

	@Autowired
	private TransferedBuildingService transferedBuildingService;

	@RequestMapping(value = "getLastWeekTransfered/{projectId}")
	public @ResponseBody
	List<TransferedBuilding> getLastWeekTransfered(@PathVariable String projectId){
		int lastWeekSerial = WeeklyReportHelper.getLastWeekSerial();
		return transferedBuildingService.getProjectTransferedBuilding(projectId, lastWeekSerial);
	}

}