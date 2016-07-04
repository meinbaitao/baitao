/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.execution.dao;

import java.util.List;
import java.util.Map;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.execution.entity.Schedule;

/**
 * 项目进度DAO接口
 * @author yhh
 * @version 2015-07-31
 */
@MyBatisDao
public interface ScheduleDao extends CrudDao<Schedule> {
	
	
	/**
	 * 查询累计进度值，与累计签证份数
	 * @param schedule
	 */
	public Schedule findRevenueRatio(Map<String, Object> map);
	
	/**
	 * 往Mapp表中添加一条数据
	 * @param map
	 */
	public void saveMap(Map<String, Object> map);
	
	
	/**
	 * 根据二级项目ID与楼栋号查询所有的日志
	 * @param subProjectId
	 * @param building
	 */
	public List<Schedule> findScheduleDetail(Map<String, Object> map);
}