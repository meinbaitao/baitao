/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.report.weekly.mianly.dao;

import com.bt.modules.report.weekly.mianly.entity.UntransferBuilding;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

import java.util.List;
import java.util.Map;

/**
 * 周报-未移交楼栋DAO接口
 * @author jinyuanf
 * @version 2015-11-25
 */
@MyBatisDao
public interface UntransferBuildingDao extends CrudDao<UntransferBuilding> {

    public List<UntransferBuilding> getProjectUntransferBuilding(Map<String, Object> parameterMap);

    public void deleteAllByReportId(String reportId);

}