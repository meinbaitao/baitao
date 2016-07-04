package com.bt.modules.execution.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.execution.dao.ScheduleimageDao;
import com.bt.modules.execution.entity.Scheduleimage;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 形象进度楼栋面
 * @author xjp
 * @version 2015-08-4
 */
@Service
@Transactional(readOnly = true)
public class ScheduleImageService extends CrudService<ScheduleimageDao, Scheduleimage> {
	
	public Scheduleimage get(String id) {
		return super.get(id);
	}
	
	public List<Scheduleimage> findList(Scheduleimage scheduleimage) {
		return super.findList(scheduleimage);
	}
	
	public Page<Scheduleimage> findPage(Page<Scheduleimage> page, Scheduleimage scheduleimage) {
		return super.findPage(page, scheduleimage);
	}
	
	@Transactional(readOnly = false)
	public void save(Scheduleimage scheduleimage) {
		super.save(scheduleimage);
	}
	
	@Transactional(readOnly = false)
	public void update(Scheduleimage scheduleimage) {
		super.dao.update(scheduleimage);
	}
	
	@Transactional(readOnly = false)
	public void delete(Scheduleimage scheduleimage) {
		super.delete(scheduleimage);
	}
}