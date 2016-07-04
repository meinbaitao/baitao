package com.bt.modules.execution.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.execution.dao.ScheduleDao;
import com.bt.modules.execution.entity.Schedule;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 周报管理
 * @author xjp
 * @version 2015-08-4
 */
@Service
@Transactional(readOnly = true)
public class ScheduleService extends CrudService<ScheduleDao, Schedule> {
	
	public Schedule get(String id) {
		return super.get(id);
	}
	
	public List<Schedule> findList(Schedule schedule) {
		return super.findList(schedule);
	}
	
	public Page<Schedule> findPage(Page<Schedule> page, Schedule schedule) {
		return super.findPage(page, schedule);
	}
	
	@Transactional(readOnly = false)
	public void save(Schedule schedule) {
		schedule.setIsNewRecord(true);
		super.save(schedule);
	}
	
	@Transactional(readOnly = false)
	public void update(Schedule schedule) {
		super.dao.update(schedule);
	}
	
	@Transactional(readOnly = false)
	public void delete(Schedule schedule) {
		super.delete(schedule);
	}
	
	
	public Schedule findRevenueRatio(String projectId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectId", projectId);
		map.put("delFlag",Schedule.DEL_FLAG_NORMAL);
		return dao.findRevenueRatio(map);
	}
	
	/**
	 * 往Mapping表中插入一条数据
	 * @param schedule
	 */
	@Transactional(readOnly = false)
	public void saveMap(Map<String, Object> map) {

		dao.saveMap(map);
	}
	
	/**
	 * 根据二级项目ID与楼栋号查询所有的日志
	 * @param subProjectId
	 * @param building
	 */
	public List<Schedule> findScheduleDetail(Map<String, Object> map) {
		
		return dao.findScheduleDetail(map);
	}
	
	
}