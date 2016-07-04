/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.report.weekly.mianly.service;

import com.bt.modules.report.common.WeeklyReportHelper;
import com.bt.modules.report.weekly.mianly.dao.BuildingScheduleDao;
import com.bt.modules.report.weekly.mianly.entity.BuildingSchedule;
import com.bt.modules.report.weekly.mianly.entity.ProjWeeklyReport;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 周报-在建进度Service
 * @author jinyuanf
 * @version 2015-11-25
 */
@Service
@Transactional(readOnly = true)
public class BuildingScheduleService extends CrudService<BuildingScheduleDao, BuildingSchedule> {

	@Autowired
	private BuildingScheduleDao buildingScheduleDao;

	public BuildingSchedule get(String id) {
		return super.get(id);
	}
	
	public List<BuildingSchedule> findList(BuildingSchedule buildingSchedule) {
		return buildingScheduleDao.findList(buildingSchedule);
	}
	
	public Page<BuildingSchedule> findPage(Page<BuildingSchedule> page, BuildingSchedule buildingSchedule) {
		return super.findPage(page, buildingSchedule);
	}
	
	@Transactional(readOnly = false)
	public void save(BuildingSchedule buildingSchedule) {
		super.save(buildingSchedule);
	}
	
	@Transactional(readOnly = false)
	public void delete(BuildingSchedule buildingSchedule) {
		super.delete(buildingSchedule);
	}


	/**
	 * 获取上周该楼栋的在建进度
	 * @param projectId 项目Id
	 * @param buildNo  楼栋号
	 * @return
	 */
	public BuildingSchedule getLastWeekOneByProjAndBuildNo(String projectId,String buildNo){
  		int lastWeekSerial = WeeklyReportHelper.getLastWeekSerial();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("projectId", projectId);
		paramMap.put("weekSerialNum", lastWeekSerial);
		paramMap.put("buildNo", buildNo);
		paramMap.put("delFlag", BuildingSchedule.DEL_FLAG_NORMAL);
		return buildingScheduleDao.getOneByProjectAndBuildNo(paramMap);
	}

	@Transactional(readOnly = false)
	public void batchSave(List<BuildingSchedule> buildingSchedules, ProjWeeklyReport projWeeklyReport){
		if(buildingSchedules == null)
			return;

		for(BuildingSchedule buildingSchedule : buildingSchedules){
			buildingSchedule.setReportId(projWeeklyReport.getId());
			this.save(buildingSchedule);
		}
	}

	@Transactional(readOnly = false)
	public void batchMixSave(List<BuildingSchedule> buildingSchedules, ProjWeeklyReport projWeeklyReport){
		if(buildingSchedules == null)
			return;

		for(BuildingSchedule buildingSchedule : buildingSchedules){
			if(StringUtils.isNotEmpty(buildingSchedule.getId())){
				buildingScheduleDao.update(buildingSchedule);
			}else{
				if(StringUtils.isNotEmpty(buildingSchedule.getBuildNo()) && StringUtils.isNotEmpty(buildingSchedule.getDistrict())){
					buildingSchedule.setReportId(projWeeklyReport.getId());
					this.save(buildingSchedule);
				}else{
					continue;
				}
			}
		}
	}

	@Transactional(readOnly = false)
	public void batchDeleteForUpdate(String[] buildingScheduleIds){
		if(buildingScheduleIds == null)
			return;

		for(String id : buildingScheduleIds){
			buildingScheduleDao.deleteByIdForUpdate(id);
		}
	}


	/**
	 * 更新南立面进度图
	 * @param buildingSchedule
	 */
	@Transactional(readOnly = false)
	public void updateSouthImage(BuildingSchedule buildingSchedule){
		buildingScheduleDao.updateSouthImage(buildingSchedule);
	}

	/**
	 * 更新北立面进度图
	 * @param buildingSchedule
	 */
	@Transactional(readOnly = false)
	public void updateNorthImage(BuildingSchedule buildingSchedule){
		buildingScheduleDao.updateNorthImage(buildingSchedule);
	}

	/**
	 * 更新东立面进度图
	 * @param buildingSchedule
	 */
	@Transactional(readOnly = false)
	public void updateEastImage(BuildingSchedule buildingSchedule){
		buildingScheduleDao.updateEastImage(buildingSchedule);
	}

	/**
	 * 更新西立面进度图
	 * @param buildingSchedule
	 */
	@Transactional(readOnly = false)
	public void updateWestImage(BuildingSchedule buildingSchedule){
		buildingScheduleDao.updateWestImage(buildingSchedule);
	}
	
}