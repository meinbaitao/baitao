/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.report.weekly.mianly.service;


import com.bt.modules.report.weekly.mianly.dao.UntransferBuildingDao;
import com.bt.modules.report.weekly.mianly.entity.ProjWeeklyReport;
import com.bt.modules.report.weekly.mianly.entity.UntransferBuilding;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 周报-未移交楼栋Service
 * @author jinyuanf
 * @version 2015-11-25
 */
@Service
@Transactional(readOnly = true)
public class UntransferBuildingService extends CrudService<UntransferBuildingDao, UntransferBuilding> {

	@Autowired
	private UntransferBuildingDao untransferBuildingDao;

	public UntransferBuilding get(String id) {
		return super.get(id);
	}
	
	public List<UntransferBuilding> findList(UntransferBuilding untransferBuilding) {
		return super.findList(untransferBuilding);
	}
	
	public Page<UntransferBuilding> findPage(Page<UntransferBuilding> page, UntransferBuilding untransferBuilding) {
		return super.findPage(page, untransferBuilding);
	}
	
	@Transactional(readOnly = false)
	public void save(UntransferBuilding untransferBuilding) {
		super.save(untransferBuilding);
	}
	
	@Transactional(readOnly = false)
	public void delete(UntransferBuilding untransferBuilding) {
		super.delete(untransferBuilding);
	}

	public List<UntransferBuilding> getProjectUntransferBuilding(String projectId, int weekSerial){
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("week_serial_num", weekSerial);
		parameterMap.put("project_id", projectId);
		return untransferBuildingDao.getProjectUntransferBuilding(parameterMap);
	}

	@Transactional(readOnly = false)
	public void batchSave(List<UntransferBuilding> untransferBuildings, ProjWeeklyReport projWeeklyReport){
		if(untransferBuildings==null)
			return;

		for(UntransferBuilding untransferBuilding : untransferBuildings){
			untransferBuilding.setReportId(projWeeklyReport.getId());
			this.save(untransferBuilding);
		}
	}

	@Transactional(readOnly = false)
	public void deleteAllByReportId(String reportId){
		untransferBuildingDao.deleteAllByReportId(reportId);
	}
	
}