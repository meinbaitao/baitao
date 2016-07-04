/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.test.weeklyreport;


import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.bt.modules.report.weekly.mianly.entity.ProjWeeklyReport;
import com.bt.modules.report.weekly.mianly.service.ProjWeeklyReportService;
import com.bt.modules.test.basic.BasicTest;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * @author xiaocai
 */

public class ProjWeeklyReportServiceTest extends BasicTest {
	@Autowired
	private ProjWeeklyReportService projWeeklyReportService;

	@Test
	public void findMyWeekReport(){
		ProjWeeklyReport projWeeklyReport = new ProjWeeklyReport();
		Page<ProjWeeklyReport> pages = new Page<ProjWeeklyReport>();
		Page<ProjWeeklyReport> page = projWeeklyReportService.findMyWeekReport(pages, projWeeklyReport);
		for(ProjWeeklyReport p:page.getList()){
			System.out.println(p);
		}
	}
	
}