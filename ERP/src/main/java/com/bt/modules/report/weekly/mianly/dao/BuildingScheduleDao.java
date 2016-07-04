/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.report.weekly.mianly.dao;

import com.bt.modules.report.weekly.mianly.entity.BuildingSchedule;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

import java.util.Map;

/**
 * 周报-在建进度DAO接口
 * @author jinyuanf
 * @version 2015-11-25
 */
@MyBatisDao
public interface BuildingScheduleDao extends CrudDao<BuildingSchedule> {

    /**
     * 通过楼栋号、第几周、项目ID 查询一条在建进度记录
     * @param paramMap
     * @return
     */
    public BuildingSchedule getOneByProjectAndBuildNo(Map<String, Object> paramMap);

    /**
     * 更新的时候，直接删除，而不是只修改del_flag的值
     * @param id
     */
    public void deleteByIdForUpdate(String id);

    /**
     * 更新南立面进度图
     * @param buildingSchedule
     */
    public void updateSouthImage(BuildingSchedule buildingSchedule);

    /**
     * 更新北立面进度图
     * @param buildingSchedule
     */
    public void updateNorthImage(BuildingSchedule buildingSchedule);

    /**
     * 更新东立面进度图
     * @param buildingSchedule
     */
    public void updateEastImage(BuildingSchedule buildingSchedule);

    /**
     * 更新西立面进度图
     * @param buildingSchedule
     */
    public void updateWestImage(BuildingSchedule buildingSchedule);
	
}