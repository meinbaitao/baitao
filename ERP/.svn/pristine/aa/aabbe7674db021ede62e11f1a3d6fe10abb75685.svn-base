/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.report.weekly.mianly.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.activiti.constants.ActivitiConstants;
import com.bt.modules.activiti.interfaces.ProcessDataHandler;
import com.bt.modules.report.weekly.mianly.dao.ProjWeeklyReportDao;
import com.bt.modules.report.weekly.mianly.entity.ProjWeeklyReport;
import com.bt.modules.utils.CommonStatus;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 周报主题信息Service
 * @author jinyuanf
 * @version 2015-11-25
 */
@Service(ProjWeeklyReportService.BEAN_NAME)
@Transactional(readOnly = true)
public class ProjWeeklyReportService extends CrudService<ProjWeeklyReportDao, ProjWeeklyReport> implements ProcessDataHandler {

	public static final String BEAN_NAME = "com.bt.modules.report.weekly.mianly.service.ProjWeeklyReportService";

	@Autowired
	private ProjWeeklyReportDao projWeeklyReportDao;

	public ProjWeeklyReport get(String id) {
		return super.get(id);
	}
	
	public List<ProjWeeklyReport> findList(ProjWeeklyReport projWeeklyReport) {
		return super.findList(projWeeklyReport);
	}
	
	public Page<ProjWeeklyReport> findPage(Page<ProjWeeklyReport> page, ProjWeeklyReport projWeeklyReport) {
		return super.findPage(page, projWeeklyReport);
	}
	
	@Transactional(readOnly = false)
	public void save(ProjWeeklyReport projWeeklyReport) {
		projWeeklyReport.setCreateBy(UserUtils.getUser());	//创建人
		super.save(projWeeklyReport);
	}
	
	@Transactional(readOnly = false)
	public void delete(ProjWeeklyReport projWeeklyReport) {
		super.delete(projWeeklyReport);
	}

	@Transactional(readOnly = false)
	public void updateWorkflowStatusAndId(ProjWeeklyReport projWeeklyReport){
		projWeeklyReportDao.updateWorkflowStatusAndId(projWeeklyReport);
	}

	@Transactional(readOnly = false)
	public void updateWorkflowStatus(ProjWeeklyReport projWeeklyReport){
		projWeeklyReportDao.updateWorkflowStatus(projWeeklyReport);
	}

	public ProjWeeklyReport getPreviousWeekReport(ProjWeeklyReport projWeeklyReport){
		return projWeeklyReportDao.getPreviousWeekReport(projWeeklyReport);
	}

	public int update(ProjWeeklyReport projWeeklyReport){
		return projWeeklyReportDao.update(projWeeklyReport);
	}

	@Override
	@Transactional(readOnly = false)
	public void processFinishedNotify(Map<String, Object> variables) {
		String primaryKey = (String)variables.get(ActivitiConstants.PRIMARY_KEY);
		ProjWeeklyReport projWeeklyReport = new ProjWeeklyReport();
		projWeeklyReport.setId(primaryKey);
		projWeeklyReport.setWorkflowstatus(CommonStatus.WORK_FLOW_END);
		projWeeklyReportDao.updateWorkflowStatus(projWeeklyReport);
	}

	public ProjWeeklyReport getOneWeekReport(ProjWeeklyReport report){
		return projWeeklyReportDao.getOneWeekReport(report);
	}

	/**
	 * 查看我创建过周报的项目
	 * @param report
	 * @return
	 */
	public Page<ProjWeeklyReport> findMyWeekReport(Page<ProjWeeklyReport> page, ProjWeeklyReport projWeeklyReport){
		projWeeklyReport.setPage(page);
		page.setList(projWeeklyReportDao.findMyWeekReport(projWeeklyReport));
		return page;
	}
	/**
	 * 未审核的周报
	 * @param project
	 * @return
	 */
	public Page<ProjWeeklyReport> findUnAuditWeekReport(Page<ProjWeeklyReport> page, ProjWeeklyReport projWeeklyReport){
		projWeeklyReport.setPage(page);
		page.setList(projWeeklyReportDao.findUnAuditWeekReport(projWeeklyReport));
		return page;
	}

	/**
	 * 我审核过的周报
	 * @param project
	 * @return
	 */
	public Page<ProjWeeklyReport> findAuditDoneWeekReport(Page<ProjWeeklyReport> page, ProjWeeklyReport projWeeklyReport){
		projWeeklyReport.setPage(page);
		projWeeklyReport.setWorkflowstatus(CommonStatus.WORK_FLOW_END);
		page.setList(projWeeklyReportDao.findAuditDoneWeekReport(projWeeklyReport));
		return page;
	}
}