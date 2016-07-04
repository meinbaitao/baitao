package com.bt.modules.execution.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.execution.dao.ScheduledetailDao;
import com.bt.modules.execution.entity.Scheduledetail;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 周报详细信息
 * @author xjp
 * @version 2015-08-4
 */
@Service
@Transactional(readOnly = true)
public class ScheduleDetailService extends CrudService<ScheduledetailDao, Scheduledetail> {
	
	public Scheduledetail get(String id) {
		return super.get(id);
	}
	
	public List<Scheduledetail> findList(Scheduledetail scheduledetail) {
		return super.findList(scheduledetail);
	}
	
	public Page<Scheduledetail> findPage(Page<Scheduledetail> page, Scheduledetail scheduledetail) {
		return super.findPage(page, scheduledetail);
	}
	
	@Transactional(readOnly = false)
	public void save(Scheduledetail scheduledetail) {
		super.save(scheduledetail);
	}
	
	@Transactional(readOnly = false)
	public void update(Scheduledetail scheduledetail) {
		super.dao.update(scheduledetail);
	}
	
	@Transactional(readOnly = false)
	public void delete(Scheduledetail scheduledetail) {
		super.delete(scheduledetail);
	}
	
	/**
	 * 根据二级项目ID更新Map表中字段
	 * @param scheduledetail
	 */
	@Transactional(readOnly = false)
	public void updateMap(Map<String, Object> map) {
		super.dao.updateMap(map);
	}
	
	
}