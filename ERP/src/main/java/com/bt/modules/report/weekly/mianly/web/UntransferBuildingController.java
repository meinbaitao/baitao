/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.report.weekly.mianly.web;


import com.bt.modules.report.common.WeeklyReportHelper;
import com.bt.modules.report.weekly.mianly.entity.UntransferBuilding;
import com.bt.modules.report.weekly.mianly.service.UntransferBuildingService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 周报-未移交楼栋Controller
 * @author jinyuanf
 * @version 2015-11-25
 */
@Controller
@RequestMapping(value = "${adminPath}/report/weekly/untransferBuilding")
public class UntransferBuildingController extends BaseController {

	@Autowired
	private UntransferBuildingService untransferBuildingService;
	
	@ModelAttribute
	public UntransferBuilding get(@RequestParam(required=false) String id) {
		UntransferBuilding entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = untransferBuildingService.get(id);
		}
		if (entity == null){
			entity = new UntransferBuilding();
		}
		return entity;
	}
	


	public @ResponseBody
	List<UntransferBuilding> getLastWeekUnTransfer(@PathVariable String projectId){
		int lastWeekSerial = WeeklyReportHelper.getLastWeekSerial();
		return untransferBuildingService.getProjectUntransferBuilding(projectId, lastWeekSerial);
	}

}