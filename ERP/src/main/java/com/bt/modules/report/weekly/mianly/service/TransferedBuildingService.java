/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.report.weekly.mianly.service;


import com.bt.modules.report.weekly.mianly.entity.ProjWeeklyReport;
import com.bt.modules.report.weekly.mianly.entity.TransferedBuilding;
import com.bt.modules.report.weekly.mianly.dao.TransferedBuildingDao;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 已移交楼栋Service
 * @author jinyuanf
 * @version 2015-11-25
 */
@Service
@Transactional(readOnly = true)
public class TransferedBuildingService extends CrudService<TransferedBuildingDao, TransferedBuilding> {

	@Autowired
	private TransferedBuildingDao transferedBuildingDao;

	public TransferedBuilding get(String id) {
		return super.get(id);
	}
	
	public List<TransferedBuilding> findList(TransferedBuilding transferedBuilding) {
		return super.findList(transferedBuilding);
	}
	
	public Page<TransferedBuilding> findPage(Page<TransferedBuilding> page, TransferedBuilding transferedBuilding) {
		return super.findPage(page, transferedBuilding);
	}
	
	@Transactional(readOnly = false)
	public void save(TransferedBuilding transferedBuilding) {
		super.save(transferedBuilding);
	}
	
	@Transactional(readOnly = false)
	public void delete(TransferedBuilding transferedBuilding) {
		super.delete(transferedBuilding);
	}


	public List<TransferedBuilding> getProjectTransferedBuilding(String projectId, int weekSerial){
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("week_serial_num", weekSerial);
		parameterMap.put("project_id", projectId);
		return transferedBuildingDao.getProjectTransferedBuilding(parameterMap);
	}

	@Transactional(readOnly = false)
	public void batchSave(List<TransferedBuilding> transferedBuildings, ProjWeeklyReport projWeeklyReport){
		if(transferedBuildings == null)
			return;

		for(TransferedBuilding transferedBuilding : transferedBuildings){
			transferedBuilding.setReportId(projWeeklyReport.getId());
			this.save(transferedBuilding);
		}
	}

	@Transactional(readOnly = false)
	public void deleteAllByReportId(String reportId){
		transferedBuildingDao.deleteAllByReportId(reportId);
	}


}