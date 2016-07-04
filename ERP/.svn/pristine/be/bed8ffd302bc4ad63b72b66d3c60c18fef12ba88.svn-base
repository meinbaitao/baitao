/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.report.weekly.mianly.dao;

import java.util.List;

import com.bt.modules.report.weekly.mianly.entity.ProjWeeklyReport;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 周报主题信息DAO接口
 * @author jinyuanf
 * @version 2015-11-25
 */
@MyBatisDao
public interface ProjWeeklyReportDao extends CrudDao<ProjWeeklyReport> {

    public void updateWorkflowStatusAndId(ProjWeeklyReport report);

    public void updateWorkflowStatus(ProjWeeklyReport report);

    public ProjWeeklyReport getPreviousWeekReport(ProjWeeklyReport report);

    public ProjWeeklyReport getOneWeekReport(ProjWeeklyReport report);
    
    public List<ProjWeeklyReport> findMyWeekReport(ProjWeeklyReport report);
    /**
	 * 未审核的周报
	 * @param project
	 * @return
	 */
	public List<ProjWeeklyReport> findUnAuditWeekReport(ProjWeeklyReport report);

	/**
	 * 我审核过的周报
	 * @param project
	 * @return
	 */
	public List<ProjWeeklyReport> findAuditDoneWeekReport(ProjWeeklyReport report);

}